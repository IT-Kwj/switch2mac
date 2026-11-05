#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_71 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_75 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1923 = false;
    bool _1180 = false;
    bool _656 = false;
    bool _540 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_50.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_53.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_122);
        out.gl_Position.z = _2207;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_55.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_108);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2276 = as_type<float>(_160);
        out.gl_Position.z = _2276;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_57.x;
    float _164 = in.m_57.y;
    float _166 = in.m_57.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _190 = _186;
    float _208;
    if (!_188)
    {
        float _192 = in.m_59.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_108);
        float _214 = 1.0 / _212;
        float _216 = _140 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = 1.0 / _226;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _242;
    float _246 = 1.0 / _234;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = _218 + _248;
    bool _252 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_218);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _230;
    float _266 = _250 * _240;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _218 + _268;
    bool _272 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _274 = isnan(_218);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _244;
    float _292 = _270 * _246;
    bool _294 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _296 = isnan(_218);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _218 + _306;
    bool _310 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_218);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = fma(_286, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = 1.0 / _238;
    float _326 = _222 * _264;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = _218 + _328;
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = _330 * _290;
    bool _342 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_218);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_338, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = -_352;
    float _358 = _356 + 1.0;
    float _360 = _308 * _324;
    float _362 = _282 * _334;
    float _364 = -_282;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    float _372 = _262 * _358;
    float _374 = -_262;
    float _376 = _374 + 1.0;
    float _378 = _320 * _366;
    float _380 = -_320;
    float _382 = _380 + 1.0;
    float _384 = fma(_370, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_218);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _352 * _382;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _396 * _376;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_396;
    float _416 = _414 + 1.0;
    float _418 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = _384 * _408;
    float _422 = _354 * _408;
    float _424 = _322 * _408;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _434;
    float _438 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _440 = fma(_406, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = fma(_412, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = fma(_428, _292, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_432, _292, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_436, _292, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _452 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = fma(_418, _372, _438);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = fma(_440, _372, _450);
    float _466 = fma(_456, _360, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _468 = fma(_444, _402, _458);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _474 = fma(_442, _372, _452);
    float _476 = fma(_462, _360, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _478 = fma(_446, _402, _464);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _484;
    float _488 = fma(_472, _360, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_448, _402, _474);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _492;
    float _496 = fma(_482, _340, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _498 = fma(_486, _340, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _500 = fma(_476, _378, _478);
    float _502 = fma(_466, _378, _468);
    float _504 = fma(_494, _340, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _506 = fma(_488, _378, _490);
    float _508 = fma(_498, _362, _500);
    float _510 = fma(_496, _362, _502);
    float _512 = fma(_504, _362, _506);
    float _514 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].y, _508);
    float _516 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].x, _510);
    float _518 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].z, _512);
    bool _520 = !_288;
    float _538;
    if (!_520)
    {
        float _522 = in.m_59.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_108);
        float _544 = 1.0 / _542;
        float _546 = _140 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _548 + _550;
    bool _554 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _572 = isnan(_548);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = -_564;
    float _588 = _586 + 1.0;
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _592 = 1.0 / _568;
    float _594 = _580 * _588;
    float _596 = -_580;
    float _598 = _596 + 1.0;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _584 * _592;
    float _606 = fma(_604, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _608 = _606 * _594;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _608);
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _612);
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _620 = in.m_61.x;
    float _622 = in.m_61.y;
    float _624 = in.m_61.z;
    float _626 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _628 = _618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _602;
    out.m_63.y = _614;
    out.m_63.z = _628;
    out.m_63.w = _626;
    float _630 = _518 * _624;
    float _632 = _514 * _622;
    float _634 = _516 * _620;
    bool _636 = !_590;
    float _654;
    if (!_636)
    {
        float _638 = in.m_59.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_108);
        float _660 = 1.0 / _658;
        float _662 = _140 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    float _666 = in.m_65.x;
    float _668 = in.m_65.y;
    float _670 = in.m_65.z;
    float _672 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _676 = in.m_50.x;
    float _678 = in.m_50.y;
    float _680 = in.m_50.z;
    float _682 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _690 = _672 * _684;
    float _692 = _682 * _686;
    float _694 = _674 * _688;
    float _696 = _678 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _698 = _678 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _700 = _690 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _702 = _690 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _704 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _706 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[6].x, _698);
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[24].x, _700);
    float _710 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[26].x, _702);
    float _712 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[4].z, _704);
    float _714 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[6].z, _706);
    float _716 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _708);
    float _718 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _710);
    float _720 = _712 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _726 = _718 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _728 = _678 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _730 = _720 + _724;
    float _732 = _722 + _726;
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[5].x, _728);
    float _736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _738 = _730 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _742 = _732 + _740;
    float _744 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[5].z, _734);
    float _746 = _738 * _738;
    float _748 = _742 * _742;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _752 = _746 + _748;
    float _754 = floor(_750);
    float _756 = sqrt(_752);
    bool _758 = _756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _762 = _756 + _760;
    float _764 = _464;
    float _766 = _752;
    float _768 = _744;
    float _770 = _730;
    float _772 = _732;
    float _774 = _748;
    float _776 = _668;
    float _778 = _670;
    float _780 = _746;
    float _782 = _666;
    if (_758)
    {
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _764 = _784;
    }
    float _786 = _764;
    if (_758)
    {
        float _788 = rsqrt(_752);
        _766 = _788;
    }
    float _790 = _766;
    float _792 = _786;
    if (_758)
    {
        float _794 = _762 * _786;
        _792 = _794;
    }
    float _796 = _792;
    float _798 = _690 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _800 = _744 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _802 = _796;
    if (_758)
    {
        float _804 = _796 * 0.15915493667125701904296875;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[25].x, _798);
    float _810 = _676;
    float _812 = _806;
    if (_758)
    {
        float _814 = _806 * 6.283185482025146484375;
        float _816 = sin(_814);
        _810 = _816;
    }
    float _818 = _810;
    float _820 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _808);
    float _822 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _824 = _800 + _822;
    float _826 = _824;
    if (_758)
    {
        float _828 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _768 = _828;
    }
    float _830 = _768;
    float _832 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _834 = _830;
    if (_758)
    {
        float _836 = fma(_818, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _834 = _836;
    }
    float _838 = _834;
    float _840 = floor(_832);
    float _842 = _838;
    if (_758)
    {
        float _844 = _790 * _838;
        _842 = _844;
    }
    float _846 = _842;
    if (_758)
    {
        float _848 = fma(_738, _846, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _770 = _848;
    }
    float _850 = _770;
    if (_758)
    {
        float _852 = fma(_742, _846, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _772 = _852;
    }
    float _854 = _772;
    float _856 = -_754;
    float _858 = _750 + _856;
    float _860 = fma(_850, 6.2500002968590706586837768554688e-05, 0.5);
    float _862 = fma(_854, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = -_840;
    float _866 = _832 + _864;
    float2 _3460 = float2(_860, _862);
    float3 _870 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3460, float2(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3460, float2(0.0), isnan(_3460)), level(0.0)).xyz;
    float _872 = _870.x;
    float _874 = _870.y;
    float _876 = _870.z;
    float2 _3476 = float2(_858, _866);
    float _878 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3476, float2(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3476, float2(0.0), isnan(_3476)), level(0.0)).x;
    float _880 = in.m_67.x;
    float _882 = in.m_67.y;
    float _884 = in.m_67.z;
    float _886 = 0.0;
    if (_758)
    {
        float _888 = _806 * 6.283185482025146484375;
        float _890 = cos(_888);
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _896 = _894 != 0;
    float _898 = in.m_59.y;
    bool _900 = _668 != 0.0;
    bool _902 = isnan(_668);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.0);
    bool _908 = _904 || _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _916 = _914 != 0;
    float _918 = in.m_69.y;
    bool _920 = _666 == 0.0;
    bool _922 = !_908;
    bool _924 = _920 && _922;
    float _926 = in.m_69.x;
    bool _928 = _670 == 0.0;
    bool _930 = _928 && _924;
    float _932 = 1.0 / _912;
    float _934 = 0.0;
    if (_896)
    {
        float _936 = in.m_59.x;
        _934 = _936;
    }
    float _938 = _934;
    if (_758)
    {
        float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _942 = _854 + _940;
        _812 = _942;
    }
    float _944 = _812;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _946;
    if (_758)
    {
        float _950 = _944 * _944;
        _774 = _950;
    }
    float _952 = _774;
    float _954 = _882;
    float _956 = _884;
    float _958 = _880;
    if (!_930)
    {
        float _960 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _954 = _960;
    }
    float _962 = _954;
    if (_758)
    {
        float _964 = _892 + (-1.0);
        _776 = _964;
    }
    float _966 = _776;
    bool _968 = _898 > 0.5;
    float _970 = _966;
    float _972 = _918;
    if (!_930)
    {
        float _974 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _884);
        _956 = _974;
    }
    float _976 = _956;
    bool _978 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _980 = isnan(_664);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = _948 * _932;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _994 = _664 + _992;
    float _996 = _976;
    if (_758)
    {
        float _998 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _778 = _998;
    }
    float _1000 = _778;
    bool _1002 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1004 = isnan(_664);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    if (_758)
    {
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1016 = _850 + _1014;
        _970 = _1016;
    }
    float _1018 = _970;
    float _1020 = fma(_990, _994, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_758)
    {
        float _1022 = fma(_824, _892, _1000);
        _826 = _1022;
    }
    float _1024 = _826;
    float _1026 = -_918;
    float _1028 = _1026 + 1.0;
    float _1030 = 0.0;
    if (_896)
    {
        _1030 = _926;
    }
    float _1032 = _1030;
    float _1034 = _1032;
    if (_758)
    {
        float _1036 = _1018 * _1018;
        _780 = _1036;
    }
    float _1038 = _780;
    bool _1040 = _938 > 0.5;
    bool _1042 = _1040 && _896;
    float _1044 = -_988;
    float _1046 = _1044 + 1.0;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1050 = _1024 + _1048;
    if (_916)
    {
        float _1052 = _968 ? _1028 : _918;
        _972 = _1052;
    }
    float _1054 = _972;
    if (!_930)
    {
        float _1056 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _880);
        _958 = _1056;
    }
    float _1058 = _958;
    float _1060 = _1012 * _1046;
    float _1062 = -_1012;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1068 = fma(_1050, _1050, _1038);
    float _1070 = _1020 * _1060;
    if (!_896)
    {
        _782 = _926;
    }
    float _1072 = _782;
    float _1074 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1076 = _1068 + _952;
    float _1078 = _1072;
    if (_1042)
    {
        float _1080 = -_1032;
        float _1082 = _1080 + 1.0;
        _1034 = _1082;
    }
    float _1084 = _1034;
    float _1086 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1070);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1090 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1092 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_896)
    {
        _1078 = _1084;
    }
    float _1094 = _1078;
    float _1096 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1086);
    float _1098 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1074);
    float _1100 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1102 = sqrt(_1076);
    float _1104 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1092);
    float _1106 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1090);
    float _1108 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1116 = _1100 * _1066;
    float _1118 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1120 = _1108 * _1088;
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1130 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1106);
    float _1132 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1104);
    out.m_71.x = _1116;
    out.m_71.y = _1120;
    bool _1134 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1136 = isnan(_1102);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1142 = _1138 || _1140;
    out.m_73.x = _1122;
    out.m_73.y = _1124;
    out.m_73.z = _1126;
    out.m_73.w = _1128;
    out.m_75.x = _1118;
    out.m_75.y = _1130;
    out.m_75.z = _1132;
    float _1144 = _1116;
    if (!_1142)
    {
        _996 = 1.0;
    }
    float _1146 = _996;
    out.m_77.x = _872;
    out.m_77.y = _874;
    out.m_77.z = _876;
    bool _1148 = !_1142;
    float _1150 = _1146;
    if (!_1148)
    {
        bool _1152 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1154 = isnan(_1102);
        bool _1156 = _1152 || _1154;
        bool _1158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1160 = _1156 || _1158;
        if (!_1160)
        {
            float _1162 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1164 = _1102 + _1162;
            float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1168 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1166;
            float _1170 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1172 = _1170 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1174 = 1.0 / _1168;
            float _1176 = _1164 * _1174;
            float _1178 = fma(_1176, _1172, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1150 = _1178;
            _1180 = true;
        }
        else
        {
            bool _1182 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1184 = isnan(_1102);
            bool _1186 = _1182 || _1184;
            bool _1188 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1190 = _1186 || _1188;
            if (!_1190)
            {
                float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1194 = _1102 + _1192;
                float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1198 = _1196 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1202 = _1200 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1204 = 1.0 / _1198;
                float _1206 = _1194 * _1204;
                float _1208 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1150 = _1208;
                _1180 = true;
            }
            else
            {
                _1150 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1180 = false;
    float _1210 = _1150;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _1024 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1218 = _850 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1222 = _854 + _1220;
    float _1224 = fma(_1214, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1226 = fma(_1218, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1228 = fma(_1222, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1230 = -_800;
    float _1232 = _1230 + _1224;
    float _1234 = -_720;
    float _1236 = _1234 + _1226;
    float _1238 = -_722;
    float _1240 = _1238 + _1228;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = fma(_1240, _1240, _1244);
    float _1248 = sqrt(_1246);
    bool _1250 = _1248 > 0.0;
    float _1252 = _1222;
    float _1254 = _1210;
    float _1256 = _1236;
    float _1258 = _1228;
    if (!_1250)
    {
        _1144 = _1226;
    }
    float _1260 = _1144;
    float _1262 = _1260;
    if (!_1250)
    {
        _1252 = _1224;
    }
    float _1264 = _1252;
    float _1266 = _1264;
    float _1268 = _1264;
    if (!_1250)
    {
        _1254 = _1228;
    }
    float _1270 = _1254;
    bool _1272 = !_1250;
    float _1274 = _1270;
    float _1276 = _1270;
    if (!_1272)
    {
        float _1278 = _184 * _184;
        float _1280 = fma(_182, _182, _1278);
        float _1282 = rsqrt(_1246);
        float _1284 = fma(_186, _186, _1280);
        float _1286 = sqrt(_1284);
        float _1288 = _1236 * _1282;
        float _1290 = _1232 * _1282;
        float _1292 = _1240 * _1282;
        bool _1294 = _1286 > 0.0;
        float _1296 = _1286;
        if (!_1294)
        {
            _1296 = _1226;
        }
        float _1298 = _1296;
        _1262 = _1298;
        if (!_1294)
        {
            _1266 = _1224;
        }
        float _1300 = _1266;
        _1268 = _1300;
        if (!_1294)
        {
            _1274 = _1228;
        }
        float _1302 = _1274;
        bool _1304 = !_1294;
        _1276 = _1302;
        if (!_1304)
        {
            float _1306 = rsqrt(_1284);
            float _1308 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1310 = _184 * _1306;
            float _1312 = _182 * _1306;
            float _1314 = _186 * _1306;
            float _1316 = _1290 * _1310;
            float _1318 = fma(_1288, _1312, _1316);
            float _1320 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1322 = fma(_1292, _1314, _1318);
            float _1324 = _1322 * _1320;
            float _1326 = fma(_182, _1324, _1226);
            float _1328 = fma(_184, _1324, _1224);
            float _1330 = fma(_186, _1324, _1228);
            _1268 = _1328;
            _1262 = _1326;
            _1276 = _1330;
            _1256 = _1320;
        }
    }
    float _1332 = _1268;
    float _1334 = _1262;
    float _1336 = _1276;
    float _1338 = _1256;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1342 = _1332 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1350 = _1336 + _1348;
    float _1352 = _1342 * _1342;
    float _1354 = fma(_1346, _1346, _1352);
    float _1356 = fma(_1350, _1350, _1354);
    float _1358 = rsqrt(_1356);
    float _1360 = sqrt(_1356);
    float _1362 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1364 = _1346 * _1362;
    float _1366 = _1350 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 + _1370;
    float _1374 = sqrt(_1372);
    bool _1376 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = _1374 + _1378;
    float _1382 = _1358;
    float _1384 = _1380;
    float _1386 = _1338;
    float _1388 = _1342;
    float _1390 = _1364;
    if (_1376)
    {
        float _1392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1392;
    }
    float _1394 = _1382;
    if (_1376)
    {
        float _1396 = rsqrt(_1372);
        _1258 = _1396;
    }
    float _1398 = _1258;
    float _1400 = _1398;
    if (_1376)
    {
        float _1402 = _1380 * _1394;
        _1384 = _1402;
    }
    float _1404 = _1384;
    if (_1376)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1386 = _1406;
    }
    float _1408 = _1386;
    float _1410 = _1394;
    if (_1376)
    {
        float _1412 = _1408 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        _1410 = _1414;
    }
    float _1416 = _1410;
    float _1418 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1420 = precise::max(0.0, _1418);
    float _1422 = _1350;
    float _1424 = _1420;
    if (_1376)
    {
        float _1426 = _1408 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        _1422 = _1428;
    }
    float _1430 = _1422;
    float _1432 = -_1362;
    float _1434 = -_1420;
    float _1436 = fma(_1342, _1432, _1434);
    if (!_1376)
    {
        _1388 = _1366;
    }
    float _1438 = _1388;
    float _1440 = _1438;
    if (_1376)
    {
        float _1442 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1424 = _1442;
    }
    float _1444 = _1424;
    float _1446 = _1416;
    float _1448 = _1444;
    if (_1376)
    {
        float _1450 = fma(_1416, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _190 = _1450;
    }
    float _1452 = _190;
    float _1454 = _1452;
    if (!_1376)
    {
        _1446 = _1436;
    }
    float _1456 = _1446;
    float _1458 = _1456;
    float _1460 = _1430;
    if (_1376)
    {
        float _1462 = _1430 + (-1.0);
        _1448 = _1462;
    }
    float _1464 = _1448;
    float _1466 = _1464;
    if (_1376)
    {
        float _1468 = _1398 * _1452;
        _1454 = _1468;
    }
    float _1470 = _1454;
    if (_1376)
    {
        float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1400 = _1472;
    }
    float _1474 = _1400;
    if (_1376)
    {
        float _1476 = _1364 * _1470;
        _1390 = _1476;
    }
    float _1478 = _1390;
    if (!_1376)
    {
        _1466 = _1368;
    }
    float _1480 = _1466;
    float _1482 = _1480;
    if (_1376)
    {
        float _1484 = _1366 * _1470;
        _1440 = _1484;
    }
    float _1486 = _1440;
    if (_1376)
    {
        float _1488 = fma(_1436, _1430, _1474);
        _1458 = _1488;
    }
    float _1490 = _1458;
    if (_1376)
    {
        float _1492 = _1478 * _1478;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (!_1376)
    {
        _1460 = _1370;
    }
    float _1496 = _1460;
    float _1498 = _1496;
    if (_1376)
    {
        float _1500 = _1486 * _1486;
        _1498 = _1500;
    }
    float _1502 = _1498;
    float _1504 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1506 = fma(_1490, _1490, _1494);
    float _1508 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1504);
    float _1510 = _1506 + _1502;
    float _1512 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1516 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1514);
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1508);
    float _1522 = rsqrt(_1510);
    float _1524 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1512);
    float _1528 = -_1518;
    float _1530 = _1528 + 1.0;
    float _1532 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1534 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1536 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1526);
    float _1538 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1532);
    float _1540 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1542 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1544 = abs(_1530);
    float _1546 = log2(_1544);
    float _1548 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1550 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1554 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1556 = _1522 * _1478;
    float _1558 = _1522 * _1490;
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1552);
    float _1562 = _1522 * _1486;
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1568 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1572 = -_1564;
    float _1574 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1572);
    float _1576 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1560);
    float _1578 = -_1568;
    float _1580 = fma(_1578, _1566, 1.0);
    float _1582 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1584 = -_1562;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1574);
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1576);
    float _1590 = log2(_1580);
    float _1592 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = fma(_1586, -0.5, 0.5);
    float _1596 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1598 = fma(_1586, 0.5, 0.5);
    float _1600 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1602 = _1558 + 1.0;
    float _1604 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1596);
    float _1606 = 1.0 / _1588;
    float _1608 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1612 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1610);
    float _1614 = exp2(_1582);
    float _1616 = _1590 * 0.693147182464599609375;
    float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1620 = sqrt(_1594);
    float _1622 = fma(_1598, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = _1612 * _1606;
    float _1628 = fma(_1598, _1622, -0.212114393711090087890625);
    float _1630 = _1624 * _1606;
    float _1632 = fma(_1626, -0.5, 0.5);
    float _1634 = -_1558;
    float _1636 = fma(_1614, _1602, _1634);
    float _1638 = fma(_1598, _1628, 1.570728778839111328125);
    float _1640 = fma(_1630, 0.5, 0.5);
    float _1642 = fma(_1636, 0.5, 0.5);
    float _1644 = _1620 * 0.636619746685028076171875;
    float _1646 = -_1638;
    float _1648 = fma(_1644, _1646, 1.0);
    float3 _4776 = float3(_1640, _1632, _1618);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4776, float3(0.0), isnan(_4776)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4776, float3(0.0), isnan(_4776)), level(0.0)).x;
    float3 _4787 = float3(_1640, _1632, _1618);
    float4 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4787, float3(0.0), isnan(_4787)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4787, float3(0.0), isnan(_4787)), level(0.0)).xyzw;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = _1653.w;
    float2 _4803 = float2(_1648, _1642);
    float3 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4803, float2(0.0), isnan(_4803)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4803, float2(0.0), isnan(_4803)), level(0.0)).xyz;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _800 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = _800 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1675 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = -_878;
    float _1679 = _1677 + 1.0;
    float _1681 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1683 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1673);
    float _1685 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1687 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1681);
    float _1689 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1683);
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1693 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1695 = 1.0 / _1691;
    float _1697 = _1693 + _1691;
    bool _1699 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1701 = isnan(_1360);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1707 = _1703 || _1705;
    float _1709 = _1697 * _1695;
    float _1711 = _1709 * 0.5;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1715 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1713);
    float _1717 = 1.0 / _1715;
    float _1719 = in.m_79.x;
    float _1721 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1723 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1725 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1723);
    float _1727 = exp2(_1721);
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1731 = _1717 * _1729;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1612;
    out.gl_Position.z = _1725;
    out.gl_Position.w = _1588;
    float _1733 = abs(_1731);
    float _1735 = log2(_1733);
    bool _1737 = _1731 <= 8000.0;
    bool _1739 = isnan(_1731);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1612;
    float _1751 = _1624;
    float _1753 = _1588;
    float _1755 = _1725;
    float _1757 = _1659;
    if (!_1707)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1759 = _1749;
    float _1761 = _1759;
    float _1763 = _1759;
    if (!_1707)
    {
        _1751 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1765 = _1751;
    float _1767 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1769 = exp2(_1767);
    float _1771 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = fma(_1773, -2.0, 3.0);
    float _1777 = _1773 * _1773;
    float _1779 = _1777 * _1775;
    float _1781 = -_1779;
    float _1783 = _1781 + 1.0;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1779);
    float _1787 = _1747 * _1785;
    float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1791 = _1679 * _1789;
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1727;
    float _1797 = _1795 + 1.0;
    float _1799 = -_1793;
    float _1801 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1803 = _1801 * _1719;
    float _1805 = _1725 + _1588;
    float _1807 = _1765;
    float _1809 = _1765;
    if (!_1707)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1811 = _1753;
    float _1813 = _1803 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1815 = _1805 * 0.5;
    float _1817 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1819 = _1817;
    float _1821 = _1811;
    float _1823 = _1811;
    if (!_1707)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1825 = _1755;
    out.m_81.x = _1813;
    float _1827 = -_1817;
    float _1829 = _1827 + 1.0;
    out.m_83.z = _1815;
    out.m_83.w = _1588;
    float _1831 = _1817 * _1650;
    float _1833 = _1825;
    float _1835 = _1825;
    if (!_1707)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1837 = _1819;
    float _1839 = _1661 * _1831;
    float _1841 = _1669 * _1831;
    float _1843 = fma(_1665, _1839, _1655);
    float _1845 = fma(_1667, _1839, _1657);
    float _1847 = _1661 * _1829;
    float _1849 = fma(_1661, _1841, _1659);
    float _1851 = _1837;
    float _1853 = _1837;
    if (!_1707)
    {
        _1757 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1855 = _1757;
    out.m_85.x = _1843;
    out.m_85.y = _1845;
    out.m_85.z = _1849;
    out.m_85.w = _1847;
    bool _1857 = !_1707;
    float _1859 = _1855;
    float _1861 = _1855;
    if (!_1857)
    {
        bool _1863 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1865 = isnan(_1360);
        bool _1867 = _1863 || _1865;
        bool _1869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1871 = _1867 || _1869;
        if (!_1871)
        {
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1875 = _1360 + _1873;
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1879 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1877;
            float _1881 = 1.0 / _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1903 = _1875 * _1881;
            float _1905 = precise::clamp(_1903, 0.0, 1.0);
            float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1911 = fma(_1905, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1913 = fma(_1905, _1909, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1915 = fma(_1905, _1889, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1917 = fma(_1905, _1893, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1919 = fma(_1905, _1897, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1921 = fma(_1905, _1901, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1861 = _1913;
            _1763 = _1919;
            _1853 = _1911;
            _1835 = _1917;
            _1823 = _1915;
            _1809 = _1921;
            _1923 = true;
        }
        else
        {
            bool _1925 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1927 = isnan(_1360);
            bool _1929 = _1925 || _1927;
            bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1933 = _1929 || _1931;
            if (!_1933)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1935 = _1851;
            _1853 = _1935;
            if (!_1933)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1937 = _1859;
            _1861 = _1937;
            if (!_1933)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1939 = _1821;
            _1823 = _1939;
            if (!_1933)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1941 = _1833;
            _1835 = _1941;
            if (!_1933)
            {
                _1761 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1943 = _1761;
            _1763 = _1943;
            if (!_1933)
            {
                _1807 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1945 = _1807;
            bool _1947 = !_1933;
            _1809 = _1945;
            if (!_1947)
            {
                bool _1949 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1951 = isnan(_1360);
                bool _1953 = _1949 || _1951;
                bool _1955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1957 = _1953 || _1955;
                if (!_1957)
                {
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1961 = _1360 + _1959;
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1963;
                    float _1967 = 1.0 / _1965;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1989 = _1961 * _1967;
                    float _1991 = precise::clamp(_1989, 0.0, 1.0);
                    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1997 = fma(_1991, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1999 = fma(_1991, _1995, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2001 = fma(_1991, _1975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2003 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2005 = fma(_1991, _1983, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2007 = fma(_1991, _1987, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1861 = _1999;
                    _1763 = _2005;
                    _1853 = _1997;
                    _1835 = _2003;
                    _1823 = _2001;
                    _1809 = _2007;
                    _1923 = true;
                }
                else
                {
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1763 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1809 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1923 = false;
    float _2009 = _1861;
    float _2011 = _1763;
    float _2013 = _1853;
    float _2015 = _1835;
    float _2017 = _1823;
    float _2019 = _1809;
    float _2021 = fma(_1130, -0.5, 0.5);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = -_2009;
    float _2027 = _2025 + _2011;
    float _2029 = -_2013;
    float _2031 = _2029 + _2015;
    float _2033 = -_2017;
    float _2035 = _2033 + _2019;
    bool _2037 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2039 = fma(_2023, _2027, _2009);
    float _2041 = fma(_2023, _2031, _2013);
    float _2043 = fma(_2023, _2035, _2017);
    float _2045 = _2039 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _2047 = fma(_2041, 0.298911988735198974609375, _2045);
    float _2049 = fma(_2043, 0.114477999508380889892578125, _2047);
    float _2051 = -_2049;
    float _2053 = _2041 + _2051;
    float _2055 = -_2049;
    float _2057 = _2039 + _2055;
    float _2059 = -_2049;
    float _2061 = _2043 + _2059;
    float _2063 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2065 = fma(_2053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    float _2067 = fma(_2057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    float _2069 = fma(_2061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    out.m_53.x = _2063;
    out.m_89.x = _2065;
    out.m_89.y = _2067;
    out.m_89.z = _2069;
    if (!_2037)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2071 = -_1332;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2075 = -_1334;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2079 = -_1336;
    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2083 = _2073 * _2073;
    float _2085 = fma(_2077, _2077, _2083);
    float _2087 = fma(_2081, _2081, _2085);
    float _2089 = sqrt(_2087);
    float _2091 = rsqrt(_2087);
    float _2093 = -_2089;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = _2077 * _2091;
    float _2103 = _2073 * _2091;
    float _2105 = abs(_2099);
    float _2107 = log2(_2105);
    float _2109 = _2081 * _2091;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2113 = _1130 * _2103;
    float _2115 = -_2103;
    float _2117 = -_2111;
    float _2119 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2117);
    float _2121 = fma(_1118, _2101, _2113);
    float _2123 = -_2109;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2119);
    float _2127 = fma(_1132, _2109, _2121);
    float _2129 = precise::clamp(_2127, 0.0, 1.0);
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2133 = _2125 + _2131;
    float _2135 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2139 = precise::clamp(_2137, 0.0, 1.0);
    float _2141 = exp2(_2135);
    float _2143 = _2141 * _2139;
    float _2145 = _2129 * _2143;
    float _2147 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2151 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2147;
    out.m_87.y = _2149;
    out.m_87.z = _2151;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1923 = false;
    bool _1180 = false;
    bool _656 = false;
    bool _540 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_50.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_53.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_122);
        out.gl_Position.z = _2207;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_55.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_108);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2276 = as_type<float>(_160);
        out.gl_Position.z = _2276;
    }
    if (_152)
    {
        return out;
    }
    float _162 = in.m_57.x;
    float _164 = in.m_57.y;
    float _166 = in.m_57.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _190 = _186;
    float _208;
    if (!_188)
    {
        float _192 = in.m_59.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_108);
        float _214 = 1.0 / _212;
        float _216 = _140 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = 1.0 / _226;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _242;
    float _246 = 1.0 / _234;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = _218 + _248;
    bool _252 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_218);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _230;
    float _266 = _250 * _240;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _218 + _268;
    bool _272 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _274 = isnan(_218);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _244;
    float _292 = _270 * _246;
    bool _294 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _296 = isnan(_218);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _218 + _306;
    bool _310 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_218);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = fma(_286, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = 1.0 / _238;
    float _326 = _222 * _264;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = _218 + _328;
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = _330 * _290;
    bool _342 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_218);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_338, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = -_352;
    float _358 = _356 + 1.0;
    float _360 = _308 * _324;
    float _362 = _282 * _334;
    float _364 = -_282;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    float _372 = _262 * _358;
    float _374 = -_262;
    float _376 = _374 + 1.0;
    float _378 = _320 * _366;
    float _380 = -_320;
    float _382 = _380 + 1.0;
    float _384 = fma(_370, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_218);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _352 * _382;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _396 * _376;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_396;
    float _416 = _414 + 1.0;
    float _418 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = _384 * _408;
    float _422 = _354 * _408;
    float _424 = _322 * _408;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _434;
    float _438 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _440 = fma(_406, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = fma(_412, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = fma(_428, _292, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_432, _292, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_436, _292, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _452 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = fma(_418, _372, _438);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = fma(_440, _372, _450);
    float _466 = fma(_456, _360, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _468 = fma(_444, _402, _458);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _474 = fma(_442, _372, _452);
    float _476 = fma(_462, _360, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _478 = fma(_446, _402, _464);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _484;
    float _488 = fma(_472, _360, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_448, _402, _474);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _492;
    float _496 = fma(_482, _340, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _498 = fma(_486, _340, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _500 = fma(_476, _378, _478);
    float _502 = fma(_466, _378, _468);
    float _504 = fma(_494, _340, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _506 = fma(_488, _378, _490);
    float _508 = fma(_498, _362, _500);
    float _510 = fma(_496, _362, _502);
    float _512 = fma(_504, _362, _506);
    float _514 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].y, _508);
    float _516 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].x, _510);
    float _518 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].z, _512);
    bool _520 = !_288;
    float _538;
    if (!_520)
    {
        float _522 = in.m_59.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_108);
        float _544 = 1.0 / _542;
        float _546 = _140 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _548 + _550;
    bool _554 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _572 = isnan(_548);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = -_564;
    float _588 = _586 + 1.0;
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _592 = 1.0 / _568;
    float _594 = _580 * _588;
    float _596 = -_580;
    float _598 = _596 + 1.0;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _584 * _592;
    float _606 = fma(_604, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _608 = _606 * _594;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _608);
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _612);
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _620 = in.m_61.x;
    float _622 = in.m_61.y;
    float _624 = in.m_61.z;
    float _626 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _628 = _618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _602;
    out.m_63.y = _614;
    out.m_63.z = _628;
    out.m_63.w = _626;
    float _630 = _518 * _624;
    float _632 = _514 * _622;
    float _634 = _516 * _620;
    bool _636 = !_590;
    float _654;
    if (!_636)
    {
        float _638 = in.m_59.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_108);
        float _660 = 1.0 / _658;
        float _662 = _140 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    float _666 = in.m_65.x;
    float _668 = in.m_65.y;
    float _670 = in.m_65.z;
    float _672 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _676 = in.m_50.x;
    float _678 = in.m_50.y;
    float _680 = in.m_50.z;
    float _682 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _690 = _672 * _684;
    float _692 = _682 * _686;
    float _694 = _674 * _688;
    float _696 = _678 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _698 = _678 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _700 = _690 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _702 = _690 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _704 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _706 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[6].x, _698);
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[24].x, _700);
    float _710 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[26].x, _702);
    float _712 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[4].z, _704);
    float _714 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[6].z, _706);
    float _716 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _708);
    float _718 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _710);
    float _720 = _712 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _726 = _718 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _728 = _678 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _730 = _720 + _724;
    float _732 = _722 + _726;
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[5].x, _728);
    float _736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _738 = _730 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _742 = _732 + _740;
    float _744 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[5].z, _734);
    float _746 = _738 * _738;
    float _748 = _742 * _742;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _752 = _746 + _748;
    float _754 = floor(_750);
    float _756 = sqrt(_752);
    bool _758 = _756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _762 = _756 + _760;
    float _764 = _464;
    float _766 = _752;
    float _768 = _744;
    float _770 = _730;
    float _772 = _732;
    float _774 = _748;
    float _776 = _668;
    float _778 = _670;
    float _780 = _746;
    float _782 = _666;
    if (_758)
    {
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _764 = _784;
    }
    float _786 = _764;
    if (_758)
    {
        float _788 = rsqrt(_752);
        _766 = _788;
    }
    float _790 = _766;
    float _792 = _786;
    if (_758)
    {
        float _794 = _762 * _786;
        _792 = _794;
    }
    float _796 = _792;
    float _798 = _690 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _800 = _744 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _802 = _796;
    if (_758)
    {
        float _804 = _796 * 0.15915493667125701904296875;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[25].x, _798);
    float _810 = _676;
    float _812 = _806;
    if (_758)
    {
        float _814 = _806 * 6.283185482025146484375;
        float _816 = sin(_814);
        _810 = _816;
    }
    float _818 = _810;
    float _820 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _808);
    float _822 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _824 = _800 + _822;
    float _826 = _824;
    if (_758)
    {
        float _828 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _768 = _828;
    }
    float _830 = _768;
    float _832 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _834 = _830;
    if (_758)
    {
        float _836 = fma(_818, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _834 = _836;
    }
    float _838 = _834;
    float _840 = floor(_832);
    float _842 = _838;
    if (_758)
    {
        float _844 = _790 * _838;
        _842 = _844;
    }
    float _846 = _842;
    if (_758)
    {
        float _848 = fma(_738, _846, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _770 = _848;
    }
    float _850 = _770;
    if (_758)
    {
        float _852 = fma(_742, _846, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _772 = _852;
    }
    float _854 = _772;
    float _856 = -_754;
    float _858 = _750 + _856;
    float _860 = fma(_850, 6.2500002968590706586837768554688e-05, 0.5);
    float _862 = fma(_854, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = -_840;
    float _866 = _832 + _864;
    float2 _3460 = float2(_860, _862);
    float3 _870 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3460, float2(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3460, float2(0.0), isnan(_3460)), level(0.0)).xyz;
    float _872 = _870.x;
    float _874 = _870.y;
    float _876 = _870.z;
    float2 _3476 = float2(_858, _866);
    float _878 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3476, float2(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3476, float2(0.0), isnan(_3476)), level(0.0)).x;
    float _880 = in.m_67.x;
    float _882 = in.m_67.y;
    float _884 = in.m_67.z;
    float _886 = 0.0;
    if (_758)
    {
        float _888 = _806 * 6.283185482025146484375;
        float _890 = cos(_888);
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _896 = _894 != 0;
    float _898 = in.m_59.y;
    bool _900 = _668 != 0.0;
    bool _902 = isnan(_668);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.0);
    bool _908 = _904 || _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _916 = _914 != 0;
    float _918 = in.m_69.y;
    bool _920 = _666 == 0.0;
    bool _922 = !_908;
    bool _924 = _920 && _922;
    float _926 = in.m_69.x;
    bool _928 = _670 == 0.0;
    bool _930 = _928 && _924;
    float _932 = 1.0 / _912;
    float _934 = 0.0;
    if (_896)
    {
        float _936 = in.m_59.x;
        _934 = _936;
    }
    float _938 = _934;
    if (_758)
    {
        float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _942 = _854 + _940;
        _812 = _942;
    }
    float _944 = _812;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _946;
    if (_758)
    {
        float _950 = _944 * _944;
        _774 = _950;
    }
    float _952 = _774;
    float _954 = _882;
    float _956 = _884;
    float _958 = _880;
    if (!_930)
    {
        float _960 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _954 = _960;
    }
    float _962 = _954;
    if (_758)
    {
        float _964 = _892 + (-1.0);
        _776 = _964;
    }
    float _966 = _776;
    bool _968 = _898 > 0.5;
    float _970 = _966;
    float _972 = _918;
    if (!_930)
    {
        float _974 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _884);
        _956 = _974;
    }
    float _976 = _956;
    bool _978 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _980 = isnan(_664);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = _948 * _932;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _994 = _664 + _992;
    float _996 = _976;
    if (_758)
    {
        float _998 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _778 = _998;
    }
    float _1000 = _778;
    bool _1002 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1004 = isnan(_664);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    if (_758)
    {
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1016 = _850 + _1014;
        _970 = _1016;
    }
    float _1018 = _970;
    float _1020 = fma(_990, _994, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_758)
    {
        float _1022 = fma(_824, _892, _1000);
        _826 = _1022;
    }
    float _1024 = _826;
    float _1026 = -_918;
    float _1028 = _1026 + 1.0;
    float _1030 = 0.0;
    if (_896)
    {
        _1030 = _926;
    }
    float _1032 = _1030;
    float _1034 = _1032;
    if (_758)
    {
        float _1036 = _1018 * _1018;
        _780 = _1036;
    }
    float _1038 = _780;
    bool _1040 = _938 > 0.5;
    bool _1042 = _1040 && _896;
    float _1044 = -_988;
    float _1046 = _1044 + 1.0;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1050 = _1024 + _1048;
    if (_916)
    {
        float _1052 = _968 ? _1028 : _918;
        _972 = _1052;
    }
    float _1054 = _972;
    if (!_930)
    {
        float _1056 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _880);
        _958 = _1056;
    }
    float _1058 = _958;
    float _1060 = _1012 * _1046;
    float _1062 = -_1012;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1068 = fma(_1050, _1050, _1038);
    float _1070 = _1020 * _1060;
    if (!_896)
    {
        _782 = _926;
    }
    float _1072 = _782;
    float _1074 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1076 = _1068 + _952;
    float _1078 = _1072;
    if (_1042)
    {
        float _1080 = -_1032;
        float _1082 = _1080 + 1.0;
        _1034 = _1082;
    }
    float _1084 = _1034;
    float _1086 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1070);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1090 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1092 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_896)
    {
        _1078 = _1084;
    }
    float _1094 = _1078;
    float _1096 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1086);
    float _1098 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1074);
    float _1100 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1102 = sqrt(_1076);
    float _1104 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1092);
    float _1106 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1090);
    float _1108 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1116 = _1100 * _1066;
    float _1118 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1120 = _1108 * _1088;
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1130 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1106);
    float _1132 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1104);
    out.m_71.x = _1116;
    out.m_71.y = _1120;
    bool _1134 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1136 = isnan(_1102);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1142 = _1138 || _1140;
    out.m_73.x = _1122;
    out.m_73.y = _1124;
    out.m_73.z = _1126;
    out.m_73.w = _1128;
    out.m_75.x = _1118;
    out.m_75.y = _1130;
    out.m_75.z = _1132;
    float _1144 = _1116;
    if (!_1142)
    {
        _996 = 1.0;
    }
    float _1146 = _996;
    out.m_77.x = _872;
    out.m_77.y = _874;
    out.m_77.z = _876;
    bool _1148 = !_1142;
    float _1150 = _1146;
    if (!_1148)
    {
        bool _1152 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1154 = isnan(_1102);
        bool _1156 = _1152 || _1154;
        bool _1158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1160 = _1156 || _1158;
        if (!_1160)
        {
            float _1162 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1164 = _1102 + _1162;
            float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1168 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1166;
            float _1170 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1172 = _1170 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1174 = 1.0 / _1168;
            float _1176 = _1164 * _1174;
            float _1178 = fma(_1176, _1172, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1150 = _1178;
            _1180 = true;
        }
        else
        {
            bool _1182 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1184 = isnan(_1102);
            bool _1186 = _1182 || _1184;
            bool _1188 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1190 = _1186 || _1188;
            if (!_1190)
            {
                float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1194 = _1102 + _1192;
                float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1198 = _1196 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1202 = _1200 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1204 = 1.0 / _1198;
                float _1206 = _1194 * _1204;
                float _1208 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1150 = _1208;
                _1180 = true;
            }
            else
            {
                _1150 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1180 = false;
    float _1210 = _1150;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _1024 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1218 = _850 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1222 = _854 + _1220;
    float _1224 = fma(_1214, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1226 = fma(_1218, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1228 = fma(_1222, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1230 = -_800;
    float _1232 = _1230 + _1224;
    float _1234 = -_720;
    float _1236 = _1234 + _1226;
    float _1238 = -_722;
    float _1240 = _1238 + _1228;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = fma(_1240, _1240, _1244);
    float _1248 = sqrt(_1246);
    bool _1250 = _1248 > 0.0;
    float _1252 = _1222;
    float _1254 = _1210;
    float _1256 = _1236;
    float _1258 = _1228;
    if (!_1250)
    {
        _1144 = _1226;
    }
    float _1260 = _1144;
    float _1262 = _1260;
    if (!_1250)
    {
        _1252 = _1224;
    }
    float _1264 = _1252;
    float _1266 = _1264;
    float _1268 = _1264;
    if (!_1250)
    {
        _1254 = _1228;
    }
    float _1270 = _1254;
    bool _1272 = !_1250;
    float _1274 = _1270;
    float _1276 = _1270;
    if (!_1272)
    {
        float _1278 = _184 * _184;
        float _1280 = fma(_182, _182, _1278);
        float _1282 = rsqrt(_1246);
        float _1284 = fma(_186, _186, _1280);
        float _1286 = sqrt(_1284);
        float _1288 = _1236 * _1282;
        float _1290 = _1232 * _1282;
        float _1292 = _1240 * _1282;
        bool _1294 = _1286 > 0.0;
        float _1296 = _1286;
        if (!_1294)
        {
            _1296 = _1226;
        }
        float _1298 = _1296;
        _1262 = _1298;
        if (!_1294)
        {
            _1266 = _1224;
        }
        float _1300 = _1266;
        _1268 = _1300;
        if (!_1294)
        {
            _1274 = _1228;
        }
        float _1302 = _1274;
        bool _1304 = !_1294;
        _1276 = _1302;
        if (!_1304)
        {
            float _1306 = rsqrt(_1284);
            float _1308 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1310 = _184 * _1306;
            float _1312 = _182 * _1306;
            float _1314 = _186 * _1306;
            float _1316 = _1290 * _1310;
            float _1318 = fma(_1288, _1312, _1316);
            float _1320 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1322 = fma(_1292, _1314, _1318);
            float _1324 = _1322 * _1320;
            float _1326 = fma(_182, _1324, _1226);
            float _1328 = fma(_184, _1324, _1224);
            float _1330 = fma(_186, _1324, _1228);
            _1268 = _1328;
            _1262 = _1326;
            _1276 = _1330;
            _1256 = _1320;
        }
    }
    float _1332 = _1268;
    float _1334 = _1262;
    float _1336 = _1276;
    float _1338 = _1256;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1342 = _1332 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1350 = _1336 + _1348;
    float _1352 = _1342 * _1342;
    float _1354 = fma(_1346, _1346, _1352);
    float _1356 = fma(_1350, _1350, _1354);
    float _1358 = rsqrt(_1356);
    float _1360 = sqrt(_1356);
    float _1362 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1364 = _1346 * _1362;
    float _1366 = _1350 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 + _1370;
    float _1374 = sqrt(_1372);
    bool _1376 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = _1374 + _1378;
    float _1382 = _1358;
    float _1384 = _1380;
    float _1386 = _1338;
    float _1388 = _1342;
    float _1390 = _1364;
    if (_1376)
    {
        float _1392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1392;
    }
    float _1394 = _1382;
    if (_1376)
    {
        float _1396 = rsqrt(_1372);
        _1258 = _1396;
    }
    float _1398 = _1258;
    float _1400 = _1398;
    if (_1376)
    {
        float _1402 = _1380 * _1394;
        _1384 = _1402;
    }
    float _1404 = _1384;
    if (_1376)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1386 = _1406;
    }
    float _1408 = _1386;
    float _1410 = _1394;
    if (_1376)
    {
        float _1412 = _1408 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        _1410 = _1414;
    }
    float _1416 = _1410;
    float _1418 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1420 = precise::max(0.0, _1418);
    float _1422 = _1350;
    float _1424 = _1420;
    if (_1376)
    {
        float _1426 = _1408 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        _1422 = _1428;
    }
    float _1430 = _1422;
    float _1432 = -_1362;
    float _1434 = -_1420;
    float _1436 = fma(_1342, _1432, _1434);
    if (!_1376)
    {
        _1388 = _1366;
    }
    float _1438 = _1388;
    float _1440 = _1438;
    if (_1376)
    {
        float _1442 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1424 = _1442;
    }
    float _1444 = _1424;
    float _1446 = _1416;
    float _1448 = _1444;
    if (_1376)
    {
        float _1450 = fma(_1416, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _190 = _1450;
    }
    float _1452 = _190;
    float _1454 = _1452;
    if (!_1376)
    {
        _1446 = _1436;
    }
    float _1456 = _1446;
    float _1458 = _1456;
    float _1460 = _1430;
    if (_1376)
    {
        float _1462 = _1430 + (-1.0);
        _1448 = _1462;
    }
    float _1464 = _1448;
    float _1466 = _1464;
    if (_1376)
    {
        float _1468 = _1398 * _1452;
        _1454 = _1468;
    }
    float _1470 = _1454;
    if (_1376)
    {
        float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1400 = _1472;
    }
    float _1474 = _1400;
    if (_1376)
    {
        float _1476 = _1364 * _1470;
        _1390 = _1476;
    }
    float _1478 = _1390;
    if (!_1376)
    {
        _1466 = _1368;
    }
    float _1480 = _1466;
    float _1482 = _1480;
    if (_1376)
    {
        float _1484 = _1366 * _1470;
        _1440 = _1484;
    }
    float _1486 = _1440;
    if (_1376)
    {
        float _1488 = fma(_1436, _1430, _1474);
        _1458 = _1488;
    }
    float _1490 = _1458;
    if (_1376)
    {
        float _1492 = _1478 * _1478;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (!_1376)
    {
        _1460 = _1370;
    }
    float _1496 = _1460;
    float _1498 = _1496;
    if (_1376)
    {
        float _1500 = _1486 * _1486;
        _1498 = _1500;
    }
    float _1502 = _1498;
    float _1504 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1506 = fma(_1490, _1490, _1494);
    float _1508 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1504);
    float _1510 = _1506 + _1502;
    float _1512 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1516 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1514);
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1508);
    float _1522 = rsqrt(_1510);
    float _1524 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1512);
    float _1528 = -_1518;
    float _1530 = _1528 + 1.0;
    float _1532 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1534 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1536 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1526);
    float _1538 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1532);
    float _1540 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1542 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1544 = abs(_1530);
    float _1546 = log2(_1544);
    float _1548 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1550 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1554 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1556 = _1522 * _1478;
    float _1558 = _1522 * _1490;
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1552);
    float _1562 = _1522 * _1486;
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1568 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1572 = -_1564;
    float _1574 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1572);
    float _1576 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1560);
    float _1578 = -_1568;
    float _1580 = fma(_1578, _1566, 1.0);
    float _1582 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1584 = -_1562;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1574);
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1576);
    float _1590 = log2(_1580);
    float _1592 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = fma(_1586, -0.5, 0.5);
    float _1596 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1598 = fma(_1586, 0.5, 0.5);
    float _1600 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1602 = _1558 + 1.0;
    float _1604 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1596);
    float _1606 = 1.0 / _1588;
    float _1608 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1612 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1610);
    float _1614 = exp2(_1582);
    float _1616 = _1590 * 0.693147182464599609375;
    float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1620 = sqrt(_1594);
    float _1622 = fma(_1598, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = _1612 * _1606;
    float _1628 = fma(_1598, _1622, -0.212114393711090087890625);
    float _1630 = _1624 * _1606;
    float _1632 = fma(_1626, -0.5, 0.5);
    float _1634 = -_1558;
    float _1636 = fma(_1614, _1602, _1634);
    float _1638 = fma(_1598, _1628, 1.570728778839111328125);
    float _1640 = fma(_1630, 0.5, 0.5);
    float _1642 = fma(_1636, 0.5, 0.5);
    float _1644 = _1620 * 0.636619746685028076171875;
    float _1646 = -_1638;
    float _1648 = fma(_1644, _1646, 1.0);
    float3 _4776 = float3(_1640, _1632, _1618);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4776, float3(0.0), isnan(_4776)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4776, float3(0.0), isnan(_4776)), level(0.0)).x;
    float3 _4787 = float3(_1640, _1632, _1618);
    float4 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4787, float3(0.0), isnan(_4787)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4787, float3(0.0), isnan(_4787)), level(0.0)).xyzw;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = _1653.w;
    float2 _4803 = float2(_1648, _1642);
    float3 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4803, float2(0.0), isnan(_4803)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4803, float2(0.0), isnan(_4803)), level(0.0)).xyz;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _800 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = _800 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1675 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = -_878;
    float _1679 = _1677 + 1.0;
    float _1681 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1683 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1673);
    float _1685 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1687 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1681);
    float _1689 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1683);
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1693 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1695 = 1.0 / _1691;
    float _1697 = _1693 + _1691;
    bool _1699 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1701 = isnan(_1360);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1707 = _1703 || _1705;
    float _1709 = _1697 * _1695;
    float _1711 = _1709 * 0.5;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1715 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1713);
    float _1717 = 1.0 / _1715;
    float _1719 = in.m_79.x;
    float _1721 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1723 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1725 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1723);
    float _1727 = exp2(_1721);
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1731 = _1717 * _1729;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1612;
    out.gl_Position.z = _1725;
    out.gl_Position.w = _1588;
    float _1733 = abs(_1731);
    float _1735 = log2(_1733);
    bool _1737 = _1731 <= 8000.0;
    bool _1739 = isnan(_1731);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1612;
    float _1751 = _1624;
    float _1753 = _1588;
    float _1755 = _1725;
    float _1757 = _1659;
    if (!_1707)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1759 = _1749;
    float _1761 = _1759;
    float _1763 = _1759;
    if (!_1707)
    {
        _1751 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1765 = _1751;
    float _1767 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1769 = exp2(_1767);
    float _1771 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = fma(_1773, -2.0, 3.0);
    float _1777 = _1773 * _1773;
    float _1779 = _1777 * _1775;
    float _1781 = -_1779;
    float _1783 = _1781 + 1.0;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1779);
    float _1787 = _1747 * _1785;
    float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1791 = _1679 * _1789;
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1727;
    float _1797 = _1795 + 1.0;
    float _1799 = -_1793;
    float _1801 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1803 = _1801 * _1719;
    float _1805 = _1725 + _1588;
    float _1807 = _1765;
    float _1809 = _1765;
    if (!_1707)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1811 = _1753;
    float _1813 = _1803 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1815 = _1805 * 0.5;
    float _1817 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1819 = _1817;
    float _1821 = _1811;
    float _1823 = _1811;
    if (!_1707)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1825 = _1755;
    out.m_81.x = _1813;
    float _1827 = -_1817;
    float _1829 = _1827 + 1.0;
    out.m_83.z = _1815;
    out.m_83.w = _1588;
    float _1831 = _1817 * _1650;
    float _1833 = _1825;
    float _1835 = _1825;
    if (!_1707)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1837 = _1819;
    float _1839 = _1661 * _1831;
    float _1841 = _1669 * _1831;
    float _1843 = fma(_1665, _1839, _1655);
    float _1845 = fma(_1667, _1839, _1657);
    float _1847 = _1661 * _1829;
    float _1849 = fma(_1661, _1841, _1659);
    float _1851 = _1837;
    float _1853 = _1837;
    if (!_1707)
    {
        _1757 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1855 = _1757;
    out.m_85.x = _1843;
    out.m_85.y = _1845;
    out.m_85.z = _1849;
    out.m_85.w = _1847;
    bool _1857 = !_1707;
    float _1859 = _1855;
    float _1861 = _1855;
    if (!_1857)
    {
        bool _1863 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1865 = isnan(_1360);
        bool _1867 = _1863 || _1865;
        bool _1869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1871 = _1867 || _1869;
        if (!_1871)
        {
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1875 = _1360 + _1873;
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1879 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1877;
            float _1881 = 1.0 / _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1903 = _1875 * _1881;
            float _1905 = precise::clamp(_1903, 0.0, 1.0);
            float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1911 = fma(_1905, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1913 = fma(_1905, _1909, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1915 = fma(_1905, _1889, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1917 = fma(_1905, _1893, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1919 = fma(_1905, _1897, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1921 = fma(_1905, _1901, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1861 = _1913;
            _1763 = _1919;
            _1853 = _1911;
            _1835 = _1917;
            _1823 = _1915;
            _1809 = _1921;
            _1923 = true;
        }
        else
        {
            bool _1925 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1927 = isnan(_1360);
            bool _1929 = _1925 || _1927;
            bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1933 = _1929 || _1931;
            if (!_1933)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1935 = _1851;
            _1853 = _1935;
            if (!_1933)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1937 = _1859;
            _1861 = _1937;
            if (!_1933)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1939 = _1821;
            _1823 = _1939;
            if (!_1933)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1941 = _1833;
            _1835 = _1941;
            if (!_1933)
            {
                _1761 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1943 = _1761;
            _1763 = _1943;
            if (!_1933)
            {
                _1807 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1945 = _1807;
            bool _1947 = !_1933;
            _1809 = _1945;
            if (!_1947)
            {
                bool _1949 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1951 = isnan(_1360);
                bool _1953 = _1949 || _1951;
                bool _1955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1957 = _1953 || _1955;
                if (!_1957)
                {
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1961 = _1360 + _1959;
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1963;
                    float _1967 = 1.0 / _1965;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1989 = _1961 * _1967;
                    float _1991 = precise::clamp(_1989, 0.0, 1.0);
                    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1997 = fma(_1991, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1999 = fma(_1991, _1995, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2001 = fma(_1991, _1975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2003 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2005 = fma(_1991, _1983, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2007 = fma(_1991, _1987, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1861 = _1999;
                    _1763 = _2005;
                    _1853 = _1997;
                    _1835 = _2003;
                    _1823 = _2001;
                    _1809 = _2007;
                    _1923 = true;
                }
                else
                {
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1763 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1809 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1923 = false;
    float _2009 = _1861;
    float _2011 = _1763;
    float _2013 = _1853;
    float _2015 = _1835;
    float _2017 = _1823;
    float _2019 = _1809;
    float _2021 = fma(_1130, -0.5, 0.5);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = -_2009;
    float _2027 = _2025 + _2011;
    float _2029 = -_2013;
    float _2031 = _2029 + _2015;
    float _2033 = -_2017;
    float _2035 = _2033 + _2019;
    bool _2037 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2039 = fma(_2023, _2027, _2009);
    float _2041 = fma(_2023, _2031, _2013);
    float _2043 = fma(_2023, _2035, _2017);
    float _2045 = _2039 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _2047 = fma(_2041, 0.298911988735198974609375, _2045);
    float _2049 = fma(_2043, 0.114477999508380889892578125, _2047);
    float _2051 = -_2049;
    float _2053 = _2041 + _2051;
    float _2055 = -_2049;
    float _2057 = _2039 + _2055;
    float _2059 = -_2049;
    float _2061 = _2043 + _2059;
    float _2063 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2065 = fma(_2053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    float _2067 = fma(_2057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    float _2069 = fma(_2061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    out.m_53.x = _2063;
    out.m_89.x = _2065;
    out.m_89.y = _2067;
    out.m_89.z = _2069;
    if (!_2037)
    {
        return out;
    }
    float _2071 = -_1332;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2075 = -_1334;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2079 = -_1336;
    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2083 = _2073 * _2073;
    float _2085 = fma(_2077, _2077, _2083);
    float _2087 = fma(_2081, _2081, _2085);
    float _2089 = sqrt(_2087);
    float _2091 = rsqrt(_2087);
    float _2093 = -_2089;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = _2077 * _2091;
    float _2103 = _2073 * _2091;
    float _2105 = abs(_2099);
    float _2107 = log2(_2105);
    float _2109 = _2081 * _2091;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2113 = _1130 * _2103;
    float _2115 = -_2103;
    float _2117 = -_2111;
    float _2119 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2117);
    float _2121 = fma(_1118, _2101, _2113);
    float _2123 = -_2109;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2119);
    float _2127 = fma(_1132, _2109, _2121);
    float _2129 = precise::clamp(_2127, 0.0, 1.0);
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2133 = _2125 + _2131;
    float _2135 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2139 = precise::clamp(_2137, 0.0, 1.0);
    float _2141 = exp2(_2135);
    float _2143 = _2141 * _2139;
    float _2145 = _2129 * _2143;
    float _2147 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2151 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2147;
    out.m_87.y = _2149;
    out.m_87.z = _2151;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1923 = false;
    bool _1180 = false;
    bool _656 = false;
    bool _540 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_50.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_53.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_122);
        out.gl_Position.z = _2207;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_55.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_108);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2276 = as_type<float>(_160);
        out.gl_Position.z = _2276;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_57.x;
    float _164 = in.m_57.y;
    float _166 = in.m_57.z;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _170);
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _172);
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _180);
    bool _188 = !_168;
    float _190 = _186;
    float _208;
    if (!_188)
    {
        float _192 = in.m_59.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_108);
        float _214 = 1.0 / _212;
        float _216 = _140 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _240 = 1.0 / _226;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _242;
    float _246 = 1.0 / _234;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = _218 + _248;
    bool _252 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_218);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _230;
    float _266 = _250 * _240;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _218 + _268;
    bool _272 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _274 = isnan(_218);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _244;
    float _292 = _270 * _246;
    bool _294 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _296 = isnan(_218);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _218 + _306;
    bool _310 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_218);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = fma(_286, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = 1.0 / _238;
    float _326 = _222 * _264;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = _218 + _328;
    float _332 = -_304;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = _330 * _290;
    bool _342 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_218);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_338, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = -_352;
    float _358 = _356 + 1.0;
    float _360 = _308 * _324;
    float _362 = _282 * _334;
    float _364 = -_282;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _368;
    float _372 = _262 * _358;
    float _374 = -_262;
    float _376 = _374 + 1.0;
    float _378 = _320 * _366;
    float _380 = -_320;
    float _382 = _380 + 1.0;
    float _384 = fma(_370, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_218);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _352 * _382;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = _396 * _376;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_396;
    float _416 = _414 + 1.0;
    float _418 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = _384 * _408;
    float _422 = _354 * _408;
    float _424 = _322 * _408;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _434;
    float _438 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _440 = fma(_406, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _442 = fma(_412, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = fma(_428, _292, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_432, _292, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_436, _292, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _452 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = fma(_418, _372, _438);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = fma(_440, _372, _450);
    float _466 = fma(_456, _360, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _468 = fma(_444, _402, _458);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _474 = fma(_442, _372, _452);
    float _476 = fma(_462, _360, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _478 = fma(_446, _402, _464);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _484;
    float _488 = fma(_472, _360, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_448, _402, _474);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _492;
    float _496 = fma(_482, _340, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _498 = fma(_486, _340, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _500 = fma(_476, _378, _478);
    float _502 = fma(_466, _378, _468);
    float _504 = fma(_494, _340, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _506 = fma(_488, _378, _490);
    float _508 = fma(_498, _362, _500);
    float _510 = fma(_496, _362, _502);
    float _512 = fma(_504, _362, _506);
    float _514 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].y, _508);
    float _516 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].x, _510);
    float _518 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[148].z, _512);
    bool _520 = !_288;
    float _538;
    if (!_520)
    {
        float _522 = in.m_59.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_108);
        float _544 = 1.0 / _542;
        float _546 = _140 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _548 + _550;
    bool _554 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _572 = isnan(_548);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = -_564;
    float _588 = _586 + 1.0;
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _592 = 1.0 / _568;
    float _594 = _580 * _588;
    float _596 = -_580;
    float _598 = _596 + 1.0;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _584 * _592;
    float _606 = fma(_604, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _608 = _606 * _594;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _608);
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[116].x, _612);
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _620 = in.m_61.x;
    float _622 = in.m_61.y;
    float _624 = in.m_61.z;
    float _626 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _628 = _618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _602;
    out.m_63.y = _614;
    out.m_63.z = _628;
    out.m_63.w = _626;
    float _630 = _518 * _624;
    float _632 = _514 * _622;
    float _634 = _516 * _620;
    bool _636 = !_590;
    float _654;
    if (!_636)
    {
        float _638 = in.m_59.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_108);
        float _660 = 1.0 / _658;
        float _662 = _140 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    float _666 = in.m_65.x;
    float _668 = in.m_65.y;
    float _670 = in.m_65.z;
    float _672 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _676 = in.m_50.x;
    float _678 = in.m_50.y;
    float _680 = in.m_50.z;
    float _682 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _688 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _690 = _672 * _684;
    float _692 = _682 * _686;
    float _694 = _674 * _688;
    float _696 = _678 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _698 = _678 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _700 = _690 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _702 = _690 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _704 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _706 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[6].x, _698);
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[24].x, _700);
    float _710 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[26].x, _702);
    float _712 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[4].z, _704);
    float _714 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[6].z, _706);
    float _716 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _708);
    float _718 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _710);
    float _720 = _712 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _726 = _718 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _728 = _678 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _730 = _720 + _724;
    float _732 = _722 + _726;
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c10)._m0[5].x, _728);
    float _736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _738 = _730 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _742 = _732 + _740;
    float _744 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[5].z, _734);
    float _746 = _738 * _738;
    float _748 = _742 * _742;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _752 = _746 + _748;
    float _754 = floor(_750);
    float _756 = sqrt(_752);
    bool _758 = _756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _762 = _756 + _760;
    float _764 = _464;
    float _766 = _752;
    float _768 = _744;
    float _770 = _730;
    float _772 = _732;
    float _774 = _748;
    float _776 = _668;
    float _778 = _670;
    float _780 = _746;
    float _782 = _666;
    if (_758)
    {
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _764 = _784;
    }
    float _786 = _764;
    if (_758)
    {
        float _788 = rsqrt(_752);
        _766 = _788;
    }
    float _790 = _766;
    float _792 = _786;
    if (_758)
    {
        float _794 = _762 * _786;
        _792 = _794;
    }
    float _796 = _792;
    float _798 = _690 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _800 = _744 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _802 = _796;
    if (_758)
    {
        float _804 = _796 * 0.15915493667125701904296875;
        _802 = _804;
    }
    float _806 = _802;
    float _808 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[25].x, _798);
    float _810 = _676;
    float _812 = _806;
    if (_758)
    {
        float _814 = _806 * 6.283185482025146484375;
        float _816 = sin(_814);
        _810 = _816;
    }
    float _818 = _810;
    float _820 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _808);
    float _822 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _824 = _800 + _822;
    float _826 = _824;
    if (_758)
    {
        float _828 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _768 = _828;
    }
    float _830 = _768;
    float _832 = fma(_722, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _834 = _830;
    if (_758)
    {
        float _836 = fma(_818, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _834 = _836;
    }
    float _838 = _834;
    float _840 = floor(_832);
    float _842 = _838;
    if (_758)
    {
        float _844 = _790 * _838;
        _842 = _844;
    }
    float _846 = _842;
    if (_758)
    {
        float _848 = fma(_738, _846, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _770 = _848;
    }
    float _850 = _770;
    if (_758)
    {
        float _852 = fma(_742, _846, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _772 = _852;
    }
    float _854 = _772;
    float _856 = -_754;
    float _858 = _750 + _856;
    float _860 = fma(_850, 6.2500002968590706586837768554688e-05, 0.5);
    float _862 = fma(_854, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = -_840;
    float _866 = _832 + _864;
    float2 _3460 = float2(_860, _862);
    float3 _870 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3460, float2(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3460, float2(0.0), isnan(_3460)), level(0.0)).xyz;
    float _872 = _870.x;
    float _874 = _870.y;
    float _876 = _870.z;
    float2 _3476 = float2(_858, _866);
    float _878 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3476, float2(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3476, float2(0.0), isnan(_3476)), level(0.0)).x;
    float _880 = in.m_67.x;
    float _882 = in.m_67.y;
    float _884 = in.m_67.z;
    float _886 = 0.0;
    if (_758)
    {
        float _888 = _806 * 6.283185482025146484375;
        float _890 = cos(_888);
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _896 = _894 != 0;
    float _898 = in.m_59.y;
    bool _900 = _668 != 0.0;
    bool _902 = isnan(_668);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.0);
    bool _908 = _904 || _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _916 = _914 != 0;
    float _918 = in.m_69.y;
    bool _920 = _666 == 0.0;
    bool _922 = !_908;
    bool _924 = _920 && _922;
    float _926 = in.m_69.x;
    bool _928 = _670 == 0.0;
    bool _930 = _928 && _924;
    float _932 = 1.0 / _912;
    float _934 = 0.0;
    if (_896)
    {
        float _936 = in.m_59.x;
        _934 = _936;
    }
    float _938 = _934;
    if (_758)
    {
        float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _942 = _854 + _940;
        _812 = _942;
    }
    float _944 = _812;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _946;
    if (_758)
    {
        float _950 = _944 * _944;
        _774 = _950;
    }
    float _952 = _774;
    float _954 = _882;
    float _956 = _884;
    float _958 = _880;
    if (!_930)
    {
        float _960 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _954 = _960;
    }
    float _962 = _954;
    if (_758)
    {
        float _964 = _892 + (-1.0);
        _776 = _964;
    }
    float _966 = _776;
    bool _968 = _898 > 0.5;
    float _970 = _966;
    float _972 = _918;
    if (!_930)
    {
        float _974 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _884);
        _956 = _974;
    }
    float _976 = _956;
    bool _978 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _980 = isnan(_664);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = _948 * _932;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _994 = _664 + _992;
    float _996 = _976;
    if (_758)
    {
        float _998 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _778 = _998;
    }
    float _1000 = _778;
    bool _1002 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1004 = isnan(_664);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    if (_758)
    {
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1016 = _850 + _1014;
        _970 = _1016;
    }
    float _1018 = _970;
    float _1020 = fma(_990, _994, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_758)
    {
        float _1022 = fma(_824, _892, _1000);
        _826 = _1022;
    }
    float _1024 = _826;
    float _1026 = -_918;
    float _1028 = _1026 + 1.0;
    float _1030 = 0.0;
    if (_896)
    {
        _1030 = _926;
    }
    float _1032 = _1030;
    float _1034 = _1032;
    if (_758)
    {
        float _1036 = _1018 * _1018;
        _780 = _1036;
    }
    float _1038 = _780;
    bool _1040 = _938 > 0.5;
    bool _1042 = _1040 && _896;
    float _1044 = -_988;
    float _1046 = _1044 + 1.0;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1050 = _1024 + _1048;
    if (_916)
    {
        float _1052 = _968 ? _1028 : _918;
        _972 = _1052;
    }
    float _1054 = _972;
    if (!_930)
    {
        float _1056 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _880);
        _958 = _1056;
    }
    float _1058 = _958;
    float _1060 = _1012 * _1046;
    float _1062 = -_1012;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1068 = fma(_1050, _1050, _1038);
    float _1070 = _1020 * _1060;
    if (!_896)
    {
        _782 = _926;
    }
    float _1072 = _782;
    float _1074 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1076 = _1068 + _952;
    float _1078 = _1072;
    if (_1042)
    {
        float _1080 = -_1032;
        float _1082 = _1080 + 1.0;
        _1034 = _1082;
    }
    float _1084 = _1034;
    float _1086 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1070);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1090 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1092 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_896)
    {
        _1078 = _1084;
    }
    float _1094 = _1078;
    float _1096 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1086);
    float _1098 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1074);
    float _1100 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1102 = sqrt(_1076);
    float _1104 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1092);
    float _1106 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1090);
    float _1108 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1116 = _1100 * _1066;
    float _1118 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1120 = _1108 * _1088;
    float _1122 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1130 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1106);
    float _1132 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1104);
    out.m_71.x = _1116;
    out.m_71.y = _1120;
    bool _1134 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1136 = isnan(_1102);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1142 = _1138 || _1140;
    out.m_73.x = _1122;
    out.m_73.y = _1124;
    out.m_73.z = _1126;
    out.m_73.w = _1128;
    out.m_75.x = _1118;
    out.m_75.y = _1130;
    out.m_75.z = _1132;
    float _1144 = _1116;
    if (!_1142)
    {
        _996 = 1.0;
    }
    float _1146 = _996;
    out.m_77.x = _872;
    out.m_77.y = _874;
    out.m_77.z = _876;
    bool _1148 = !_1142;
    float _1150 = _1146;
    if (!_1148)
    {
        bool _1152 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1154 = isnan(_1102);
        bool _1156 = _1152 || _1154;
        bool _1158 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1160 = _1156 || _1158;
        if (!_1160)
        {
            float _1162 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1164 = _1102 + _1162;
            float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1168 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1166;
            float _1170 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1172 = _1170 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1174 = 1.0 / _1168;
            float _1176 = _1164 * _1174;
            float _1178 = fma(_1176, _1172, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1150 = _1178;
            _1180 = true;
        }
        else
        {
            bool _1182 = _1102 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1184 = isnan(_1102);
            bool _1186 = _1182 || _1184;
            bool _1188 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1190 = _1186 || _1188;
            if (!_1190)
            {
                float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1194 = _1102 + _1192;
                float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1198 = _1196 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1202 = _1200 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1204 = 1.0 / _1198;
                float _1206 = _1194 * _1204;
                float _1208 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1150 = _1208;
                _1180 = true;
            }
            else
            {
                _1150 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1180 = false;
    float _1210 = _1150;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _1024 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1218 = _850 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1222 = _854 + _1220;
    float _1224 = fma(_1214, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1226 = fma(_1218, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1228 = fma(_1222, _1210, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1230 = -_800;
    float _1232 = _1230 + _1224;
    float _1234 = -_720;
    float _1236 = _1234 + _1226;
    float _1238 = -_722;
    float _1240 = _1238 + _1228;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = fma(_1240, _1240, _1244);
    float _1248 = sqrt(_1246);
    bool _1250 = _1248 > 0.0;
    float _1252 = _1222;
    float _1254 = _1210;
    float _1256 = _1236;
    float _1258 = _1228;
    if (!_1250)
    {
        _1144 = _1226;
    }
    float _1260 = _1144;
    float _1262 = _1260;
    if (!_1250)
    {
        _1252 = _1224;
    }
    float _1264 = _1252;
    float _1266 = _1264;
    float _1268 = _1264;
    if (!_1250)
    {
        _1254 = _1228;
    }
    float _1270 = _1254;
    bool _1272 = !_1250;
    float _1274 = _1270;
    float _1276 = _1270;
    if (!_1272)
    {
        float _1278 = _184 * _184;
        float _1280 = fma(_182, _182, _1278);
        float _1282 = rsqrt(_1246);
        float _1284 = fma(_186, _186, _1280);
        float _1286 = sqrt(_1284);
        float _1288 = _1236 * _1282;
        float _1290 = _1232 * _1282;
        float _1292 = _1240 * _1282;
        bool _1294 = _1286 > 0.0;
        float _1296 = _1286;
        if (!_1294)
        {
            _1296 = _1226;
        }
        float _1298 = _1296;
        _1262 = _1298;
        if (!_1294)
        {
            _1266 = _1224;
        }
        float _1300 = _1266;
        _1268 = _1300;
        if (!_1294)
        {
            _1274 = _1228;
        }
        float _1302 = _1274;
        bool _1304 = !_1294;
        _1276 = _1302;
        if (!_1304)
        {
            float _1306 = rsqrt(_1284);
            float _1308 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1310 = _184 * _1306;
            float _1312 = _182 * _1306;
            float _1314 = _186 * _1306;
            float _1316 = _1290 * _1310;
            float _1318 = fma(_1288, _1312, _1316);
            float _1320 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1322 = fma(_1292, _1314, _1318);
            float _1324 = _1322 * _1320;
            float _1326 = fma(_182, _1324, _1226);
            float _1328 = fma(_184, _1324, _1224);
            float _1330 = fma(_186, _1324, _1228);
            _1268 = _1328;
            _1262 = _1326;
            _1276 = _1330;
            _1256 = _1320;
        }
    }
    float _1332 = _1268;
    float _1334 = _1262;
    float _1336 = _1276;
    float _1338 = _1256;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1342 = _1332 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1350 = _1336 + _1348;
    float _1352 = _1342 * _1342;
    float _1354 = fma(_1346, _1346, _1352);
    float _1356 = fma(_1350, _1350, _1354);
    float _1358 = rsqrt(_1356);
    float _1360 = sqrt(_1356);
    float _1362 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1364 = _1346 * _1362;
    float _1366 = _1350 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 + _1370;
    float _1374 = sqrt(_1372);
    bool _1376 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = _1374 + _1378;
    float _1382 = _1358;
    float _1384 = _1380;
    float _1386 = _1338;
    float _1388 = _1342;
    float _1390 = _1364;
    if (_1376)
    {
        float _1392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1392;
    }
    float _1394 = _1382;
    if (_1376)
    {
        float _1396 = rsqrt(_1372);
        _1258 = _1396;
    }
    float _1398 = _1258;
    float _1400 = _1398;
    if (_1376)
    {
        float _1402 = _1380 * _1394;
        _1384 = _1402;
    }
    float _1404 = _1384;
    if (_1376)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1386 = _1406;
    }
    float _1408 = _1386;
    float _1410 = _1394;
    if (_1376)
    {
        float _1412 = _1408 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        _1410 = _1414;
    }
    float _1416 = _1410;
    float _1418 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1420 = precise::max(0.0, _1418);
    float _1422 = _1350;
    float _1424 = _1420;
    if (_1376)
    {
        float _1426 = _1408 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        _1422 = _1428;
    }
    float _1430 = _1422;
    float _1432 = -_1362;
    float _1434 = -_1420;
    float _1436 = fma(_1342, _1432, _1434);
    if (!_1376)
    {
        _1388 = _1366;
    }
    float _1438 = _1388;
    float _1440 = _1438;
    if (_1376)
    {
        float _1442 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1424 = _1442;
    }
    float _1444 = _1424;
    float _1446 = _1416;
    float _1448 = _1444;
    if (_1376)
    {
        float _1450 = fma(_1416, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _190 = _1450;
    }
    float _1452 = _190;
    float _1454 = _1452;
    if (!_1376)
    {
        _1446 = _1436;
    }
    float _1456 = _1446;
    float _1458 = _1456;
    float _1460 = _1430;
    if (_1376)
    {
        float _1462 = _1430 + (-1.0);
        _1448 = _1462;
    }
    float _1464 = _1448;
    float _1466 = _1464;
    if (_1376)
    {
        float _1468 = _1398 * _1452;
        _1454 = _1468;
    }
    float _1470 = _1454;
    if (_1376)
    {
        float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1400 = _1472;
    }
    float _1474 = _1400;
    if (_1376)
    {
        float _1476 = _1364 * _1470;
        _1390 = _1476;
    }
    float _1478 = _1390;
    if (!_1376)
    {
        _1466 = _1368;
    }
    float _1480 = _1466;
    float _1482 = _1480;
    if (_1376)
    {
        float _1484 = _1366 * _1470;
        _1440 = _1484;
    }
    float _1486 = _1440;
    if (_1376)
    {
        float _1488 = fma(_1436, _1430, _1474);
        _1458 = _1488;
    }
    float _1490 = _1458;
    if (_1376)
    {
        float _1492 = _1478 * _1478;
        _1482 = _1492;
    }
    float _1494 = _1482;
    if (!_1376)
    {
        _1460 = _1370;
    }
    float _1496 = _1460;
    float _1498 = _1496;
    if (_1376)
    {
        float _1500 = _1486 * _1486;
        _1498 = _1500;
    }
    float _1502 = _1498;
    float _1504 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1506 = fma(_1490, _1490, _1494);
    float _1508 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1504);
    float _1510 = _1506 + _1502;
    float _1512 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1516 = fma(_1360, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1514);
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1508);
    float _1522 = rsqrt(_1510);
    float _1524 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1512);
    float _1528 = -_1518;
    float _1530 = _1528 + 1.0;
    float _1532 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1534 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1536 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1526);
    float _1538 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1532);
    float _1540 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1542 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1544 = abs(_1530);
    float _1546 = log2(_1544);
    float _1548 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1550 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1554 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1538);
    float _1556 = _1522 * _1478;
    float _1558 = _1522 * _1490;
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1552);
    float _1562 = _1522 * _1486;
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1568 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1572 = -_1564;
    float _1574 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1572);
    float _1576 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1560);
    float _1578 = -_1568;
    float _1580 = fma(_1578, _1566, 1.0);
    float _1582 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1584 = -_1562;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1574);
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1576);
    float _1590 = log2(_1580);
    float _1592 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = fma(_1586, -0.5, 0.5);
    float _1596 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1598 = fma(_1586, 0.5, 0.5);
    float _1600 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1602 = _1558 + 1.0;
    float _1604 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1596);
    float _1606 = 1.0 / _1588;
    float _1608 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1612 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1610);
    float _1614 = exp2(_1582);
    float _1616 = _1590 * 0.693147182464599609375;
    float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1620 = sqrt(_1594);
    float _1622 = fma(_1598, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = _1612 * _1606;
    float _1628 = fma(_1598, _1622, -0.212114393711090087890625);
    float _1630 = _1624 * _1606;
    float _1632 = fma(_1626, -0.5, 0.5);
    float _1634 = -_1558;
    float _1636 = fma(_1614, _1602, _1634);
    float _1638 = fma(_1598, _1628, 1.570728778839111328125);
    float _1640 = fma(_1630, 0.5, 0.5);
    float _1642 = fma(_1636, 0.5, 0.5);
    float _1644 = _1620 * 0.636619746685028076171875;
    float _1646 = -_1638;
    float _1648 = fma(_1644, _1646, 1.0);
    float3 _4776 = float3(_1640, _1632, _1618);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4776, float3(0.0), isnan(_4776)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4776, float3(0.0), isnan(_4776)), level(0.0)).x;
    float3 _4787 = float3(_1640, _1632, _1618);
    float4 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4787, float3(0.0), isnan(_4787)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4787, float3(0.0), isnan(_4787)), level(0.0)).xyzw;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = _1653.w;
    float2 _4803 = float2(_1648, _1642);
    float3 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4803, float2(0.0), isnan(_4803)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4803, float2(0.0), isnan(_4803)), level(0.0)).xyz;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _800 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = _800 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1675 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = -_878;
    float _1679 = _1677 + 1.0;
    float _1681 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1683 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1673);
    float _1685 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1687 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1681);
    float _1689 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1683);
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1693 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1695 = 1.0 / _1691;
    float _1697 = _1693 + _1691;
    bool _1699 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1701 = isnan(_1360);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1707 = _1703 || _1705;
    float _1709 = _1697 * _1695;
    float _1711 = _1709 * 0.5;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1715 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1713);
    float _1717 = 1.0 / _1715;
    float _1719 = in.m_79.x;
    float _1721 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1723 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1685);
    float _1725 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1723);
    float _1727 = exp2(_1721);
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1731 = _1717 * _1729;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1612;
    out.gl_Position.z = _1725;
    out.gl_Position.w = _1588;
    float _1733 = abs(_1731);
    float _1735 = log2(_1733);
    bool _1737 = _1731 <= 8000.0;
    bool _1739 = isnan(_1731);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan(8000.0);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1612;
    float _1751 = _1624;
    float _1753 = _1588;
    float _1755 = _1725;
    float _1757 = _1659;
    if (!_1707)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1759 = _1749;
    float _1761 = _1759;
    float _1763 = _1759;
    if (!_1707)
    {
        _1751 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1765 = _1751;
    float _1767 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1769 = exp2(_1767);
    float _1771 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = fma(_1773, -2.0, 3.0);
    float _1777 = _1773 * _1773;
    float _1779 = _1777 * _1775;
    float _1781 = -_1779;
    float _1783 = _1781 + 1.0;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1779);
    float _1787 = _1747 * _1785;
    float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1791 = _1679 * _1789;
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1727;
    float _1797 = _1795 + 1.0;
    float _1799 = -_1793;
    float _1801 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1803 = _1801 * _1719;
    float _1805 = _1725 + _1588;
    float _1807 = _1765;
    float _1809 = _1765;
    if (!_1707)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1811 = _1753;
    float _1813 = _1803 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1815 = _1805 * 0.5;
    float _1817 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1819 = _1817;
    float _1821 = _1811;
    float _1823 = _1811;
    if (!_1707)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1825 = _1755;
    out.m_81.x = _1813;
    float _1827 = -_1817;
    float _1829 = _1827 + 1.0;
    out.m_83.z = _1815;
    out.m_83.w = _1588;
    float _1831 = _1817 * _1650;
    float _1833 = _1825;
    float _1835 = _1825;
    if (!_1707)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1837 = _1819;
    float _1839 = _1661 * _1831;
    float _1841 = _1669 * _1831;
    float _1843 = fma(_1665, _1839, _1655);
    float _1845 = fma(_1667, _1839, _1657);
    float _1847 = _1661 * _1829;
    float _1849 = fma(_1661, _1841, _1659);
    float _1851 = _1837;
    float _1853 = _1837;
    if (!_1707)
    {
        _1757 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1855 = _1757;
    out.m_85.x = _1843;
    out.m_85.y = _1845;
    out.m_85.z = _1849;
    out.m_85.w = _1847;
    bool _1857 = !_1707;
    float _1859 = _1855;
    float _1861 = _1855;
    if (!_1857)
    {
        bool _1863 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1865 = isnan(_1360);
        bool _1867 = _1863 || _1865;
        bool _1869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1871 = _1867 || _1869;
        if (!_1871)
        {
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1875 = _1360 + _1873;
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1879 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1877;
            float _1881 = 1.0 / _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1903 = _1875 * _1881;
            float _1905 = precise::clamp(_1903, 0.0, 1.0);
            float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1911 = fma(_1905, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1913 = fma(_1905, _1909, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1915 = fma(_1905, _1889, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1917 = fma(_1905, _1893, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1919 = fma(_1905, _1897, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1921 = fma(_1905, _1901, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1861 = _1913;
            _1763 = _1919;
            _1853 = _1911;
            _1835 = _1917;
            _1823 = _1915;
            _1809 = _1921;
            _1923 = true;
        }
        else
        {
            bool _1925 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1927 = isnan(_1360);
            bool _1929 = _1925 || _1927;
            bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1933 = _1929 || _1931;
            if (!_1933)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1935 = _1851;
            _1853 = _1935;
            if (!_1933)
            {
                _1859 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1937 = _1859;
            _1861 = _1937;
            if (!_1933)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1939 = _1821;
            _1823 = _1939;
            if (!_1933)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1941 = _1833;
            _1835 = _1941;
            if (!_1933)
            {
                _1761 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1943 = _1761;
            _1763 = _1943;
            if (!_1933)
            {
                _1807 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1945 = _1807;
            bool _1947 = !_1933;
            _1809 = _1945;
            if (!_1947)
            {
                bool _1949 = _1360 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1951 = isnan(_1360);
                bool _1953 = _1949 || _1951;
                bool _1955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1957 = _1953 || _1955;
                if (!_1957)
                {
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1961 = _1360 + _1959;
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1963;
                    float _1967 = 1.0 / _1965;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1989 = _1961 * _1967;
                    float _1991 = precise::clamp(_1989, 0.0, 1.0);
                    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1997 = fma(_1991, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1999 = fma(_1991, _1995, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2001 = fma(_1991, _1975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2003 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2005 = fma(_1991, _1983, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2007 = fma(_1991, _1987, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1861 = _1999;
                    _1763 = _2005;
                    _1853 = _1997;
                    _1835 = _2003;
                    _1823 = _2001;
                    _1809 = _2007;
                    _1923 = true;
                }
                else
                {
                    _1861 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1763 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1809 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1923 = false;
    float _2009 = _1861;
    float _2011 = _1763;
    float _2013 = _1853;
    float _2015 = _1835;
    float _2017 = _1823;
    float _2019 = _1809;
    float _2021 = fma(_1130, -0.5, 0.5);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = -_2009;
    float _2027 = _2025 + _2011;
    float _2029 = -_2013;
    float _2031 = _2029 + _2015;
    float _2033 = -_2017;
    float _2035 = _2033 + _2019;
    bool _2037 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2039 = fma(_2023, _2027, _2009);
    float _2041 = fma(_2023, _2031, _2013);
    float _2043 = fma(_2023, _2035, _2017);
    float _2045 = _2039 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _2047 = fma(_2041, 0.298911988735198974609375, _2045);
    float _2049 = fma(_2043, 0.114477999508380889892578125, _2047);
    float _2051 = -_2049;
    float _2053 = _2041 + _2051;
    float _2055 = -_2049;
    float _2057 = _2039 + _2055;
    float _2059 = -_2049;
    float _2061 = _2043 + _2059;
    float _2063 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2065 = fma(_2053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    float _2067 = fma(_2057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    float _2069 = fma(_2061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2049);
    out.m_53.x = _2063;
    out.m_89.x = _2065;
    out.m_89.y = _2067;
    out.m_89.z = _2069;
    if (!_2037)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2071 = -_1332;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2075 = -_1334;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2079 = -_1336;
    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2083 = _2073 * _2073;
    float _2085 = fma(_2077, _2077, _2083);
    float _2087 = fma(_2081, _2081, _2085);
    float _2089 = sqrt(_2087);
    float _2091 = rsqrt(_2087);
    float _2093 = -_2089;
    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = _2077 * _2091;
    float _2103 = _2073 * _2091;
    float _2105 = abs(_2099);
    float _2107 = log2(_2105);
    float _2109 = _2081 * _2091;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2113 = _1130 * _2103;
    float _2115 = -_2103;
    float _2117 = -_2111;
    float _2119 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2117);
    float _2121 = fma(_1118, _2101, _2113);
    float _2123 = -_2109;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2119);
    float _2127 = fma(_1132, _2109, _2121);
    float _2129 = precise::clamp(_2127, 0.0, 1.0);
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2133 = _2125 + _2131;
    float _2135 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2139 = precise::clamp(_2137, 0.0, 1.0);
    float _2141 = exp2(_2135);
    float _2143 = _2141 * _2139;
    float _2145 = _2129 * _2143;
    float _2147 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2151 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2147;
    out.m_87.y = _2149;
    out.m_87.z = _2151;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

