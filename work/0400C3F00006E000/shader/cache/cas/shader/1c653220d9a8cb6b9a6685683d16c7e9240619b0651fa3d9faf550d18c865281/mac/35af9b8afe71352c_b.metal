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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
    float4 m_81 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_83 [[attribute(5)]];
    float4 m_77 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2493 = false;
    bool _540 = false;
    bool _398 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2798 = as_type<float>(_130);
        out.gl_Position.z = _2798;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2867 = as_type<float>(_166);
        out.gl_Position.z = _2867;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _196 = _188;
    float _214;
    if (!_194)
    {
        float _198 = in.m_55.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _224 + _242;
    bool _246 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_224);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_224);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_240;
    float _280 = _278 + 1.0;
    float _282 = 1.0 / _264;
    float _284 = _276 * _280;
    float _286 = -_276;
    float _288 = _286 + 1.0;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _296 = 1.0 / _260;
    float _298 = _256 * _288;
    float _300 = -_256;
    float _302 = _300 + 1.0;
    float _304 = _244 * _282;
    float _306 = _228 * _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    float _316 = fma(_292, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = _316 * _298;
    float _330 = _318 * _298;
    float _332 = _320 * _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].x, _328);
    float _348 = fma(_336, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _350 = fma(_340, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _352 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _354 = fma(_344, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].z, _332);
    float _358 = fma(_348, _284, _346);
    float _360 = fma(_350, _284, _352);
    float _362 = fma(_354, _284, _356);
    float _364 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].x, _358);
    float _366 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].y, _360);
    float _368 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].z, _362);
    float _370 = _364 * _322;
    float _372 = _366 * _324;
    float _374 = _368 * _326;
    bool _376 = !_294;
    float _378 = _370;
    float _396;
    if (!_376)
    {
        float _380 = in.m_55.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_114);
        float _402 = 1.0 / _400;
        float _404 = _148 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _410 = _406 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = isnan(_406);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _432 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _434 = isnan(_406);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _444;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = 1.0 / _414;
    float _462 = -_426;
    float _464 = _462 + 1.0;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _468 = _442 * _464;
    float _470 = -_442;
    float _472 = _470 + 1.0;
    float _474 = 1.0 / _430;
    float _476 = _446 * _460;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = fma(_476, _410, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _484 = _480 * _474;
    float _486 = _482 * _468;
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _406 + _492;
    float _496 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _486);
    float _498 = _426 * _490;
    float _500 = fma(_484, _494, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _504 = fma(_500, _498, _496);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[117].x, _504);
    float _512 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _510 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _512;
    out.m_59.y = _514;
    out.m_59.z = _516;
    out.m_59.w = _518;
    bool _520 = !_466;
    float _538;
    if (!_520)
    {
        float _522 = in.m_55.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_114);
        float _544 = 1.0 / _542;
        float _546 = _148 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = in.m_55.y;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _554 = in.m_61.x;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _558 = _556 != 0;
    float _560 = in.m_55.x;
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _566 = _564 != 0;
    float _568 = in.m_46.x;
    float _570 = in.m_46.y;
    float _572 = in.m_46.z;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _576 = _574 != 0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _584 = _582 != 0;
    float _586 = in.m_61.y;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _590 = _588 != 0;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _594 = in.m_61.z;
    float _596 = 1.0 / _580;
    float _598 = in.m_61.w;
    float _600 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _606 = in.m_55.z;
    float _608 = fma(_600, -2.0, _592);
    float _610 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _604);
    out.m_63.x = _554;
    bool _612 = _550 > 0.5;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _618 = _570 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _620 = in.m_65.y;
    float _622 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[78].z, _616);
    float _624 = _560 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _626 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[5].x, _618);
    out.m_63.y = _586;
    float _628 = -_602;
    float _630 = fma(_624, 2.0, _628);
    float _632 = _570 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_63.z = _594;
    float _634 = -_148;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[76].x, _630);
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _632);
    out.m_63.w = _598;
    bool _640 = _606 > 0.5;
    float _642 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    float _644 = _594;
    float _646 = _626;
    bool _648 = _640;
    float _650 = _560;
    if (_558)
    {
        _644 = _560;
    }
    float _652 = _644;
    float _654 = in.m_65.x;
    float _656 = _652;
    if (!_558)
    {
        _656 = _606;
    }
    float _658 = _656;
    float _660 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[5].z, _626);
    float _662 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = _570 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = _660 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _548 + _672;
    float _676 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[6].x, _664);
    float _678 = _668 * _596;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _670 + _680;
    float _684 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    float _686 = fma(_678, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _662 + _688;
    float _692 = _682 * _682;
    float _694 = _684 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _698 = fma(_690, _690, _692);
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _702 = _694 + _700;
    float _704 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _696);
    float _706 = _664;
    if (_558)
    {
        _706 = _550;
    }
    float _708 = _706;
    float _710 = -_620;
    float _712 = _710 + 1.0;
    float _714 = fma(_702, _702, _698);
    bool _716 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _718 = isnan(_548);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _730 = _708;
    float _732 = _620;
    if (!_566)
    {
        _646 = _654;
    }
    float _734 = _646;
    float _736 = rsqrt(_714);
    bool _738 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _740 = isnan(_548);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_726;
    float _752 = _750 + 1.0;
    int _754 = _640 ? as_type<int>(_712) : as_type<int>(_620);
    float _756 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[88].z, _728);
    float _758 = _734;
    if (_566)
    {
        bool _760 = _560 > 0.5;
        _648 = _760;
    }
    bool _762 = _648;
    float _764 = _748 * _752;
    if (!_558)
    {
        _730 = _560;
    }
    float _766 = _730;
    float _768 = sqrt(_714);
    if (!_566)
    {
        _650 = _734;
    }
    float _770 = _650;
    float _772 = _552 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _774 = _770;
    if (_566)
    {
        _758 = _654;
    }
    float _776 = _758;
    float _778 = _686 * _764;
    float _780 = _584 ? as_type<float>(_754) : _620;
    float _782 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _784 = _766 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _786 = as_type<int>(_782);
    if (_590)
    {
        float _788 = _612 ? _712 : _620;
        _732 = _788;
    }
    float _790 = _732;
    float _792 = fma(_780, _772, -0.5);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _796 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = fma(_782, _790, -0.5);
    float _800 = _682 * _736;
    float _802 = fma(_784, -2.0, _794);
    if (_566)
    {
        float _804 = -_776;
        float _806 = _804 + 1.0;
        _786 = as_type<int>(_806);
    }
    int _808 = _786;
    float _810 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _812 = _768 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _816 = _658 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _818 = _690 * _736;
    float _820 = -_800;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    if (_566)
    {
        float _824 = _762 ? as_type<float>(_808) : _776;
        _774 = _824;
    }
    float _826 = _774;
    int _828 = 0;
    if (_576)
    {
        float _830 = -_776;
        float _832 = _830 + 1.0;
        _828 = as_type<int>(_832);
    }
    int _834 = _828;
    float _836 = precise::min(_810, _812);
    float _838 = -_814;
    float _840 = fma(_816, 2.0, _838);
    float _842 = -_818;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _846 = _822 * _822;
    if (!_576)
    {
        _378 = _776;
    }
    float _848 = _378;
    float _850 = _800 * _836;
    float _852 = _848;
    float _854 = _850;
    if (_576)
    {
        float _856 = _612 ? as_type<float>(_834) : _776;
        _852 = _856;
    }
    float _858 = _852;
    float _860 = fma(_844, _844, _846);
    float _862 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _610);
    float _864 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _866 = _702 * _736;
    float _868 = _818 * _836;
    float _870 = -_850;
    float _872 = _682 + _870;
    float _874 = -_864;
    float _876 = fma(_862, _798, _874);
    float _878 = _866 * _836;
    float _880 = -_868;
    float _882 = _690 + _880;
    float _884 = _872 * _872;
    float _886 = -_866;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _702);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _892 = -_748;
    float _894 = _892 + 1.0;
    float _896 = fma(_882, _882, _884);
    float _898 = -_878;
    float _900 = _702 + _898;
    float _902 = _682 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _904 = fma(_888, _888, _860);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[131].x, _778);
    float _908 = fma(_900, _900, _896);
    float _910 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[28].x, _902);
    float _912 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _756);
    float _914 = _614 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _916 = sqrt(_904);
    float _918 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[28].z, _910);
    float _920 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _622);
    float _922 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _704);
    float _924 = -_148;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[86].x, _840);
    float _928 = _890 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _930 = _918 >= 0.0;
    float _932 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _802);
    float _934 = sqrt(_908);
    float _936 = fma(_914, _858, -0.5);
    float _938 = fma(_928, _826, -0.5);
    float _940 = -_932;
    float _942 = fma(_922, _792, _940);
    float _944 = fma(_912, _936, _926);
    float _946 = fma(_920, _938, _636);
    float _948 = _736 * _916;
    float _950 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[132].x, _906);
    float _952 = _876 + 0.5;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _956 = _942 + 0.5;
    float _958 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _960 = _946 + 0.5;
    float _962 = _736 * _934;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _966 = _934;
    float _968 = _868;
    if (_930)
    {
        _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _970 = _966;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _974 = _962 * _948;
    float _976 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _944 + 0.5;
    int _984 = as_type<int>(_970);
    if (_930)
    {
        float _986 = _970 * 5.0;
        _984 = as_type<int>(_986);
    }
    int _988 = _984;
    float _990 = _796 * _974;
    out.m_67.x = _960;
    out.m_67.y = _952;
    out.m_69.x = _976;
    out.m_69.y = _978;
    out.m_69.z = _980;
    out.m_69.w = _958;
    out.m_71.x = _982;
    out.m_71.y = _956;
    if (_930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4287 = as_type<float>(_988);
        out.gl_Position.z = _4287;
    }
    out.m_73.w = _836;
    if (_930)
    {
        out.m_49.x = 0.0;
    }
    out.m_75.x = _990;
    if (_930)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _992 = -_800;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _670);
    float _996 = -_818;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _662);
    float _1000 = -_866;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1018 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1016);
    float _1020 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1018);
    bool _1022 = _1020 >= 0.0;
    float _1024 = _1014;
    if (_1022)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1026 = _1024;
    int _1028 = as_type<int>(_1026);
    if (_1022)
    {
        out.m_49.x = 0.0;
    }
    if (_1022)
    {
        float _1030 = _1026 * 5.0;
        _1028 = as_type<int>(_1030);
    }
    int _1032 = _1028;
    if (_1022)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4382 = as_type<float>(_1032);
        out.gl_Position.z = _4382;
    }
    if (_1022)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1034 = -_670;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1038 = -_662;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1042 = -_694;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1046 = _1036 * _1036;
    float _1048 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1050 = fma(_1040, _1040, _1046);
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1054 = fma(_1044, _1044, _1050);
    float _1056 = -_1052;
    float _1058 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1056);
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1062 = rsqrt(_1054);
    float _1064 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1068 = -_1064;
    float _1070 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1068);
    float _1072 = -_1066;
    float _1074 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1072);
    float _1076 = _1040 * _1062;
    float _1078 = _1044 * _1062;
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1082 = _1036 * _1062;
    float _1084 = _1076 * _1076;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1088 = -_1080;
    float _1090 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1092 = fma(_1078, _1078, _1084);
    float _1094 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1096 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1098 = rsqrt(_1092);
    float _1100 = -_1094;
    float _1102 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1100);
    float _1104 = -_1096;
    float _1106 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1104);
    float _1108 = -_1060;
    float _1110 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1108);
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1114 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1116 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1090);
    float _1118 = -_1112;
    float _1120 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1122 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1124 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1126 = -_1114;
    float _1128 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1126);
    float _1130 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1120);
    float _1132 = -_1122;
    float _1134 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1132);
    float _1136 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1128);
    float _1138 = _1078 * _1098;
    float _1140 = _1076 * _1098;
    float _1142 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1134);
    float _1144 = -_1138;
    float _1146 = _1078 * _1144;
    float _1148 = -_1138;
    float _1150 = _1082 * _1148;
    float _1152 = -_1124;
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1152);
    float _1156 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1146;
    float _1160 = fma(_1076, _1140, _1158);
    float _1162 = _1082 * _1140;
    float _1164 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1166 = -_1156;
    float _1168 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1170 = _1160 * _1160;
    float _1172 = -_1086;
    float _1174 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1172);
    float _1176 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1178 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1180 = fma(_1162, _1162, _1170);
    float _1182 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1174);
    float _1184 = -_1176;
    float _1186 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1184);
    float _1188 = -_1178;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1164);
    float _1192 = fma(_1150, _1150, _1180);
    float _1194 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1186);
    float _1196 = 1.0 / _1190;
    float _1198 = rsqrt(_1192);
    float _1200 = fma(_1182, _1196, -1.0);
    float _1202 = _1160 * _1198;
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = -_1204;
    float _1208 = _1206 + 1.0;
    float _1210 = _1208 * _1196;
    float _1212 = fma(_1208, _1200, 1.0);
    float _1214 = _1194 * _1210;
    float _1216 = _1212 * _1212;
    float _1218 = _1136 * _1210;
    float _1220 = fma(_1214, _1214, _1216);
    float _1222 = fma(_1218, _1218, _1220);
    float _1224 = rsqrt(_1222);
    float _1226 = _1218 * _1224;
    float _1228 = _1214 * _1224;
    float _1230 = _1212 * _1224;
    float _1232 = -_1226;
    float _1234 = _1076 * _1232;
    float _1236 = _1078 * _1230;
    float _1238 = -_1228;
    float _1240 = -_1234;
    float _1242 = fma(_1078, _1238, _1240);
    float _1244 = -_1228;
    float _1246 = _1082 * _1244;
    float _1248 = -_1226;
    float _1250 = -_1236;
    float _1252 = fma(_1082, _1248, _1250);
    float _1254 = _1242 * _1242;
    float _1256 = -_1246;
    float _1258 = fma(_1076, _1230, _1256);
    float _1260 = fma(_1252, _1252, _1254);
    float _1262 = fma(_1258, _1258, _1260);
    float _1264 = rsqrt(_1262);
    float _1266 = _1252 * _1264;
    float _1268 = _1258 * _1264;
    float _1270 = _1242 * _1264;
    float _1272 = _1078 * _1266;
    float _1274 = _1082 * _1268;
    float _1276 = -_1272;
    float _1278 = fma(_1076, _1268, _1276);
    float _1280 = _1076 * _1270;
    float _1282 = -_1274;
    float _1284 = fma(_1078, _1270, _1282);
    float _1286 = _1278 * _1278;
    float _1288 = -_1280;
    float _1290 = fma(_1082, _1266, _1288);
    float _1292 = fma(_1284, _1284, _1286);
    float _1294 = fma(_1290, _1290, _1292);
    float _1296 = rsqrt(_1294);
    float _1298 = _1290 * _1296;
    float _1300 = _1278 * _1296;
    float _1302 = _1284 * _1296;
    float _1304 = _1076 * _1298;
    float _1306 = _1078 * _1300;
    float _1308 = in.m_77.x;
    float _1310 = in.m_77.y;
    float _1312 = in.m_77.z;
    float _1314 = -_1304;
    float _1316 = fma(_1078, _1302, _1314);
    float _1318 = -_1306;
    float _1320 = fma(_1082, _1298, _1318);
    float _1322 = _1082 * _1302;
    float _1324 = _1316 * _1316;
    float _1326 = -_1322;
    float _1328 = fma(_1076, _1300, _1326);
    float _1330 = fma(_1320, _1320, _1324);
    float _1332 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1334 = fma(_1328, _1328, _1330);
    float _1336 = _1332 * _974;
    float _1338 = _1048 * _974;
    float _1340 = rsqrt(_1334);
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1308);
    float _1346 = _1336 * _1342;
    float _1348 = _990 * _1344;
    float _1350 = -_878;
    float _1352 = _694 + _1350;
    float _1354 = _1346 * _1298;
    float _1356 = _1346 * _1302;
    float _1358 = _1328 * _1340;
    float _1360 = _1338 * _1312;
    float _1362 = _1320 * _1340;
    float _1364 = _1316 * _1340;
    float _1366 = fma(_1348, _1358, _1354);
    float _1368 = -_850;
    float _1370 = _670 + _1368;
    float _1372 = fma(_1348, _1362, _1356);
    float _1374 = fma(_1360, _1078, _1366);
    float _1376 = fma(_1360, _1076, _1372);
    float _1378 = _694 + _1374;
    float _1380 = -_800;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1370);
    float _1384 = _662 + _1376;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1388 = _1378 + _1386;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1394 = _1384 + _1392;
    float _1396 = _1388 * _1388;
    float _1398 = fma(_1394, _1394, _1396);
    float _1400 = _1346 * _1300;
    float _1402 = -_868;
    float _1404 = _662 + _1402;
    float _1406 = sqrt(_1398);
    float _1408 = fma(_1348, _1364, _1400);
    float _1410 = -_818;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1414 = fma(_1360, _1082, _1408);
    float _1416 = -_866;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1352);
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1390);
    float _1422 = _670 + _1414;
    float _1424 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1420);
    bool _1426 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1414;
    float _1430 = _1340;
    float _1432 = _1384;
    float _1434 = _1370;
    float _1436 = _1382;
    float _1438 = _1412;
    float _1440 = _1078;
    if (!_1426)
    {
        _1428 = _1384;
    }
    float _1442 = _1428;
    float _1444 = _1442;
    if (!_1426)
    {
        _1430 = _1378;
    }
    float _1446 = _1430;
    float _1448 = _1446;
    if (!_1426)
    {
        _1432 = _1422;
    }
    float _1450 = _1432;
    bool _1452 = !_1426;
    float _1454 = _1450;
    if (!_1452)
    {
        float _1456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1460 = _1406 + _1458;
        float _1462 = rsqrt(_1398);
        float _1464 = _1460 * _1456;
        float _1466 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1468 = _1464 * 0.15915493667125701904296875;
        float _1470 = _1468 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = _1468 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1472 + (-1.0);
        float _1480 = fma(_1476, _1466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1482 = _1478 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = _1462 * _1480;
        float _1486 = fma(_1422, _1472, _1482);
        float _1488 = fma(_1394, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1490 = fma(_1388, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1454 = _1486;
        _1444 = _1488;
        _1448 = _1490;
    }
    float _1492 = _1454;
    float _1494 = _1444;
    float _1496 = _1448;
    float _1498 = -_670;
    float _1500 = _1498 + _1492;
    float _1502 = -_662;
    float _1504 = _1502 + _1494;
    float _1506 = -_694;
    float _1508 = _1506 + _1496;
    float _1510 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1512 = _1500 * _1500;
    float _1514 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1516 = 1.0 / _1510;
    float _1518 = fma(_1504, _1504, _1512);
    float _1520 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1514);
    float _1522 = -_878;
    float _1524 = _1522 + _1496;
    float _1526 = fma(_1508, _1508, _1518);
    float _1528 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1520);
    float _1530 = sqrt(_1526);
    float _1532 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1534 = _1532 + _1510;
    float _1536 = _1534 * _1516;
    float _1538 = _1536 * 0.5;
    bool _1540 = _1530 > 0.0;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1544 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1542);
    bool _1546 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.5);
    bool _1554 = _1550 || _1552;
    float _1556 = 1.0 / _1544;
    bool _1558 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan(0.5);
    bool _1566 = _1562 || _1564;
    float _1568 = -_868;
    float _1570 = _1568 + _1494;
    float _1572 = -_850;
    float _1574 = _1572 + _1492;
    float _1576 = _1524;
    float _1578 = _1570;
    float _1580 = _1574;
    if (!_1540)
    {
        _854 = _1570;
    }
    float _1582 = _854;
    float _1584 = _1582;
    if (!_1540)
    {
        _968 = _1574;
    }
    float _1586 = _968;
    bool _1588 = !_1540;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = _190 * _190;
        float _1594 = rsqrt(_1526);
        float _1596 = fma(_188, _188, _1592);
        float _1598 = fma(_192, _192, _1596);
        float _1600 = sqrt(_1598);
        float _1602 = _1504 * _1594;
        float _1604 = _1500 * _1594;
        float _1606 = _1508 * _1594;
        bool _1608 = _1600 > 0.0;
        float _1610 = _1594;
        float _1612 = _1600;
        if (!_1608)
        {
            _1610 = _1570;
        }
        float _1614 = _1610;
        _1584 = _1614;
        if (!_1608)
        {
            _1612 = _1574;
        }
        float _1616 = _1612;
        bool _1618 = !_1608;
        _1590 = _1616;
        if (!_1618)
        {
            float _1620 = rsqrt(_1598);
            float _1622 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1624 = _190 * _1620;
            float _1626 = _188 * _1620;
            float _1628 = _192 * _1620;
            float _1630 = _1604 * _1624;
            float _1632 = fma(_1602, _1626, _1630);
            float _1634 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1636 = fma(_1606, _1628, _1632);
            float _1638 = _1636 * _1634;
            float _1640 = fma(_188, _1638, _1570);
            float _1642 = fma(_190, _1638, _1574);
            float _1644 = fma(_192, _1638, _1524);
            _1584 = _1640;
            _1590 = _1642;
            _1576 = _1644;
        }
    }
    float _1646 = _1584;
    float _1648 = _1590;
    float _1650 = _1576;
    float _1652 = -_818;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1646);
    float _1656 = -_800;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1648);
    float _1660 = -_866;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1650);
    float _1664 = _1658;
    float _1666 = _1654;
    float _1668 = _1662;
    if (_1566)
    {
        _196 = 1.0;
    }
    float _1670 = _196;
    float _1672 = _1670;
    if (!_1554)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1676 = _1382 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1680 = _1412 + _1678;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _1684 = -_1352;
        float _1686 = _1684 + _1650;
        float _1688 = _1676 * _1676;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1692 = _1418 + _1690;
        float _1694 = -_1404;
        float _1696 = _1694 + _1646;
        float _1698 = -_1370;
        float _1700 = _1698 + _1648;
        float _1702 = fma(_1680, _1680, _1688);
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1706 = fma(_1692, _1692, _1702);
        float _1708 = sqrt(_1706);
        float _1710 = 1.0 / _948;
        float _1712 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1714 = precise::max(_1708, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _1716 = _1714 * _1682;
        float _1718 = _1716 * _1710;
        float _1720 = _1712 * _1718;
        float _1722 = _1686 * _1718;
        float _1724 = fma(_1696, _1720, _1412);
        float _1726 = fma(_1700, _1720, _1382);
        float _1728 = fma(_1712, _1722, _1418);
        _1434 = _1700;
        _1664 = _1726;
        _1666 = _1724;
        _1668 = _1728;
    }
    float _1730 = _1434;
    float _1732 = _1664;
    float _1734 = _1666;
    float _1736 = _1668;
    float _1738 = _1730;
    if (_1566)
    {
        _1578 = 1.0;
    }
    float _1740 = _1578;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1744 = _1556 * _1742;
    float _1746 = _1740;
    if (!_1566)
    {
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1752 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1750;
        float _1754 = _1748 * 0.15915493667125701904296875;
        float _1756 = _1754 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        float _1760 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1762 = _1760 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1758;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = _1762 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1772 * _1774;
        float _1782 = 1.0 / _1752;
        float _1784 = 1.0 / _1780;
        float _1786 = _1778 * _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1790 = fma(_1744, _1786, _1788);
        float _1792 = _1790 * _1782;
        float _1794 = precise::clamp(_1792, 0.0, 1.0);
        _1738 = _1762;
        _1672 = _1794;
    }
    float _1796 = _1738;
    float _1798 = _1672;
    float _1800 = _1796;
    if (!_1566)
    {
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1804 * 6.283185482025146484375;
        float _1808 = cos(_1806);
        float _1810 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1812 = _1810 * 0.15915493667125701904296875;
        float _1814 = _1804 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        float _1818 = 1.0 / _1808;
        float _1820 = _1812 * 6.283185482025146484375;
        float _1822 = cos(_1820);
        float _1824 = _1816 * _1818;
        float _1826 = _1812 * 6.283185482025146484375;
        float _1828 = sin(_1826);
        float _1830 = _1822 * _1824;
        float _1832 = 1.0 / _1830;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1836 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1834;
        float _1838 = 1.0 / _1836;
        float _1840 = _1828 * _1832;
        float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1844 = fma(_1744, _1840, _1842);
        float _1846 = _1844 * _1838;
        float _1848 = precise::clamp(_1846, 0.0, 1.0);
        float _1850 = -_1848;
        float _1852 = _1850 + 1.0;
        _1800 = _1818;
        _1746 = _1852;
    }
    float _1854 = _1800;
    float _1856 = _1746;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1860 = _1732 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1734 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1736 + _1866;
    float _1870 = _1860 * _1860;
    float _1872 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = fma(_1864, _1864, _1870);
    float _1876 = fma(_1868, _1868, _1874);
    float _1878 = rsqrt(_1876);
    float _1880 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1864 * _1880;
    float _1884 = _1868 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1878;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1854;
    float _1908 = _1860;
    float _1910 = _1882;
    if (_1894)
    {
        float _1912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1912;
    }
    float _1914 = _1900;
    if (_1894)
    {
        float _1916 = rsqrt(_1890);
        _1902 = _1916;
    }
    float _1918 = _1902;
    float _1920 = _1918;
    if (_1894)
    {
        float _1922 = _1898 * _1914;
        _1904 = _1922;
    }
    float _1924 = _1904;
    if (_1894)
    {
        float _1926 = _1924 * 0.15915493667125701904296875;
        _1906 = _1926;
    }
    float _1928 = _1906;
    float _1930 = _1914;
    float _1932 = _1928;
    if (_1894)
    {
        float _1934 = _1928 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1930 = _1936;
    }
    float _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1868;
    float _1946 = _1942;
    if (_1894)
    {
        float _1948 = _1928 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1944 = _1950;
    }
    float _1952 = _1944;
    float _1954 = -_1880;
    float _1956 = -_1942;
    float _1958 = fma(_1860, _1954, _1956);
    float _1960 = _1958;
    if (_1894)
    {
        float _1962 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1962;
    }
    float _1964 = _1946;
    if (!_1894)
    {
        _1932 = _1888;
    }
    float _1966 = _1932;
    float _1968 = _1938;
    float _1970 = _1966;
    if (_1894)
    {
        float _1972 = fma(_1938, _1964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = sqrt(_1876);
    float _1978 = _1974;
    if (_1894)
    {
        float _1980 = _1952 + (-1.0);
        _1908 = _1980;
    }
    float _1982 = _1908;
    float _1984 = _1982;
    if (_1894)
    {
        float _1986 = _1918 * _1974;
        _1580 = _1986;
    }
    float _1988 = _1580;
    if (!_1894)
    {
        _1920 = _1884;
    }
    float _1990 = _1920;
    float _1992 = _1990;
    if (_1894)
    {
        float _1994 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1994;
    }
    float _1996 = _1984;
    if (_1894)
    {
        float _1998 = _1882 * _1988;
        _1910 = _1998;
    }
    float _2000 = _1910;
    if (!_1894)
    {
        _1978 = _1886;
    }
    float _2002 = _1978;
    float _2004 = _2002;
    if (_1894)
    {
        float _2006 = _1884 * _1988;
        _1992 = _2006;
    }
    float _2008 = _1992;
    if (_1894)
    {
        float _2010 = fma(_1958, _1952, _1996);
        _1960 = _2010;
    }
    float _2012 = _1960;
    if (_1894)
    {
        float _2014 = _2000 * _2000;
        _2004 = _2014;
    }
    float _2016 = _2004;
    float _2018 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1894)
    {
        float _2020 = _2008 * _2008;
        _1970 = _2020;
    }
    float _2022 = _1970;
    float _2024 = fma(_2012, _2012, _2016);
    float _2026 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2018);
    float _2028 = _2024 + _2022;
    float _2030 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2032 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2028);
    float _2042 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2026);
    float _2044 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2046 = -_2038;
    float _2048 = _2046 + 1.0;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2052 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2044);
    float _2054 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2056 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2058 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2060 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2062 = abs(_2048);
    float _2064 = log2(_2062);
    float _2066 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2058);
    float _2068 = -_2060;
    float _2070 = fma(_2068, _2056, 1.0);
    float _2072 = _2040 * _2000;
    float _2074 = _2040 * _2012;
    float _2076 = _2040 * _2008;
    float _2078 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _2080 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2066);
    float _2082 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2084 = floor(_2054);
    float _2086 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2092 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2078);
    float _2094 = -_2086;
    float _2096 = fma(_2074, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2094);
    float _2098 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2100 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2090);
    float _2102 = floor(_2030);
    float _2104 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2106 = -_2076;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2096);
    float _2110 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2112 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2114 = _2074 + 1.0;
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2118 = log2(_2070);
    float _2120 = -_2084;
    float _2122 = _2054 + _2120;
    float _2124 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2128 = exp2(_2098);
    float _2130 = fma(_2108, -0.5, 0.5);
    float _2132 = -_2102;
    float _2134 = _2030 + _2132;
    float _2136 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2112);
    float _2138 = fma(_2108, 0.5, 0.5);
    float _2140 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2126);
    float _2142 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2136);
    float _2144 = 1.0 / _2116;
    float _2146 = fma(_2138, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2148 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2150 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2152 = _2118 * 0.693147182464599609375;
    float _2154 = fma(_2138, _2146, -0.212114393711090087890625);
    float _2156 = sqrt(_2130);
    float _2158 = -_2074;
    float _2160 = fma(_2128, _2114, _2158);
    float2 _6176 = float2(_2122, _2134);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6176, float2(0.0), isnan(_6176)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6176, float2(0.0), isnan(_6176)), level(0.0)).x;
    float _2164 = fma(_2138, _2154, 1.570728778839111328125);
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = fma(_2160, 0.5, 0.5);
    float _2170 = _2148 * _2144;
    float _2172 = _2150 * _2144;
    float _2174 = fma(_2170, 0.5, 0.5);
    float _2176 = fma(_2172, -0.5, 0.5);
    float _2178 = _2156 * 0.636619746685028076171875;
    float3 _6210 = float3(_2174, _2176, _2166);
    float _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).x;
    float _2182 = -_2164;
    float _2184 = fma(_2178, _2182, 1.0);
    float3 _6226 = float3(_2174, _2176, _2166);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6226, float3(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6226, float3(0.0), isnan(_6226)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float2 _6242 = float2(_2184, _2168);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6242, float2(0.0), isnan(_6242)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6242, float2(0.0), isnan(_6242)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = abs(_1744);
    float _2209 = log2(_2207);
    bool _2211 = _1310 != 0.0;
    bool _2213 = isnan(_1310);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan(0.0);
    bool _2219 = _2215 || _2217;
    float _2221 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1734;
    out.m_79.y = _1732;
    out.m_79.z = _1736;
    bool _2223 = _1308 == 0.0;
    bool _2225 = !_2219;
    bool _2227 = _2223 && _2225;
    float _2229 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2221);
    bool _2231 = _1312 == 0.0;
    bool _2233 = _2231 && _2227;
    float _2235 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2229);
    bool _2237 = _1744 <= 8000.0;
    bool _2239 = isnan(_1744);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(8000.0);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    out.m_81.x = _1412;
    out.m_81.y = _1382;
    out.m_81.z = _1418;
    float _2249 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2251 = in.m_83.x;
    float _2253 = in.m_83.y;
    float _2255 = in.m_83.z;
    float _2257 = exp2(_2249);
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2261 = precise::clamp(_2259, 0.0, 1.0);
    float _2263 = _2253;
    float _2265 = _2255;
    float _2267 = _2251;
    if (!_2233)
    {
        float _2269 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2253);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2275 = fma(_2261, -2.0, 3.0);
    float _2277 = _2261 * _2261;
    if (!_2233)
    {
        float _2279 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2255);
        _2265 = _2279;
    }
    float _2281 = _2265;
    if (!_2233)
    {
        float _2283 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2251);
        _2267 = _2283;
    }
    float _2285 = _2267;
    float _2287 = in.m_85.x;
    float _2289 = _2277 * _2275;
    float _2291 = exp2(_2273);
    float _2293 = _1300 * _2271;
    float _2295 = _2116 * 0.5;
    float _2297 = -_2289;
    float _2299 = _2297 + 1.0;
    float _2301 = _1302 * _2271;
    float _2303 = fma(_1364, _2285, _2293);
    float _2305 = _1298 * _2271;
    float _2307 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2289);
    float _2309 = fma(_2150, -0.5, _2295);
    float _2311 = fma(_1082, _2281, _2303);
    float _2313 = _2247 * _2307;
    float _2315 = fma(_1362, _2285, _2301);
    float _2317 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2235);
    float _2319 = fma(_1358, _2285, _2305);
    float _2321 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2323 = -_2291;
    float _2325 = _2323 + 1.0;
    float _2327 = fma(_1076, _2281, _2315);
    float _2329 = _2317 + _2116;
    float _2331 = _2148 + _2116;
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2335 = _2329 * 0.5;
    float _2337 = _2331 * 0.5;
    float _2339 = fma(_1078, _2281, _2319);
    bool _2341 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2343 = isnan(_1976);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2349 = _2345 || _2347;
    out.gl_Position.x = _2148;
    out.gl_Position.y = _2150;
    out.gl_Position.z = _2317;
    out.gl_Position.w = _2116;
    out.m_87.x = _2337;
    out.m_87.y = _2309;
    out.m_87.z = _2335;
    out.m_87.w = _2116;
    out.m_89.x = _2327;
    out.m_89.y = _2311;
    out.m_89.z = _2339;
    if (!_2349)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2351 = _1436;
    float _2353 = _2351;
    float _2355 = _2351;
    if (!_2349)
    {
        _1438 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2357 = _1438;
    float _2359 = _2357;
    float _2361 = _2357;
    if (!_2349)
    {
        _1440 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2363 = _1440;
    float _2365 = -_2162;
    float _2367 = _2365 + 1.0;
    float _2369 = _2367 * _2321;
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = -_2371;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2377 = _2375 * _2287;
    float _2379 = _2287;
    float _2381 = _2363;
    float _2383 = _2363;
    if (!_2349)
    {
        _2379 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2385 = _2379;
    float _2387 = _2333 * _2180;
    float _2389 = -_2333;
    float _2391 = _2389 + 1.0;
    float _2393 = _2377 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2395 = _2195 * _2387;
    float _2397 = _2195 * _2391;
    out.m_91.x = _2393;
    float _2399 = _1798 * _1856;
    float _2401 = _2205 * _2387;
    float _2403 = fma(_2201, _2395, _2189);
    float _2405 = fma(_2203, _2395, _2191);
    float _2407 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2409 = fma(_2195, _2401, _2193);
    float _2411 = _2395;
    float _2413 = _2399;
    float _2415 = _2385;
    float _2417 = _2385;
    if (!_2349)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2419 = _2411;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2349)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2425 = _2413;
    out.m_93.x = _2403;
    out.m_93.y = _2405;
    out.m_93.z = _2409;
    out.m_93.w = _2397;
    bool _2427 = !_2349;
    float _2429 = _2425;
    float _2431 = _2425;
    if (!_2427)
    {
        bool _2433 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2435 = isnan(_1976);
        bool _2437 = _2433 || _2435;
        bool _2439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2441 = _2437 || _2439;
        if (!_2441)
        {
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2445 = _1976 + _2443;
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2449 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2447;
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2455 = 1.0 / _2449;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2473 = _2445 * _2455;
            float _2475 = precise::clamp(_2473, 0.0, 1.0);
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2481 = fma(_2475, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2483 = fma(_2475, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2485 = fma(_2475, _2459, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2487 = fma(_2475, _2463, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2489 = fma(_2475, _2467, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2491 = fma(_2475, _2471, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2361 = _2485;
            _2423 = _2489;
            _2355 = _2481;
            _2417 = _2487;
            _2383 = _2483;
            _2431 = _2491;
            _2493 = true;
        }
        else
        {
            bool _2495 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2497 = isnan(_1976);
            bool _2499 = _2495 || _2497;
            bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2503 = _2499 || _2501;
            if (!_2503)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2505 = _2353;
            _2355 = _2505;
            if (!_2503)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2507 = _2359;
            _2361 = _2507;
            if (!_2503)
            {
                _2381 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2509 = _2381;
            _2383 = _2509;
            if (!_2503)
            {
                _2415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2511 = _2415;
            _2417 = _2511;
            if (!_2503)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2513 = _2421;
            _2423 = _2513;
            if (!_2503)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2515 = _2429;
            bool _2517 = !_2503;
            _2431 = _2515;
            if (!_2517)
            {
                bool _2519 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2521 = isnan(_1976);
                bool _2523 = _2519 || _2521;
                bool _2525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2527 = _2523 || _2525;
                if (!_2527)
                {
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2531 = _1976 + _2529;
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2535 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2533;
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2541 = 1.0 / _2535;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2559 = _2531 * _2541;
                    float _2561 = precise::clamp(_2559, 0.0, 1.0);
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2567 = fma(_2561, _2539, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2569 = fma(_2561, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2571 = fma(_2561, _2545, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2573 = fma(_2561, _2549, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2575 = fma(_2561, _2553, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2577 = fma(_2561, _2557, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2361 = _2571;
                    _2423 = _2575;
                    _2355 = _2567;
                    _2417 = _2573;
                    _2383 = _2569;
                    _2431 = _2577;
                    _2493 = true;
                }
                else
                {
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2383 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2493 = false;
    float _2579 = _2361;
    float _2581 = _2423;
    float _2583 = _2355;
    float _2585 = _2417;
    float _2587 = _2383;
    float _2589 = _2431;
    float _2591 = fma(_2311, -0.5, 0.5);
    float _2593 = precise::clamp(_2591, 0.0, 1.0);
    float _2595 = -_2579;
    float _2597 = _2595 + _2581;
    float _2599 = -_2583;
    float _2601 = _2599 + _2585;
    out.m_95.x = 0.0;
    float _2603 = fma(_2593, _2597, _2579);
    float _2605 = -_2587;
    float _2607 = _2605 + _2589;
    float _2609 = fma(_2593, _2601, _2583);
    float _2611 = _2603 * 0.586610972881317138671875;
    bool _2613 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2615 = fma(_2593, _2607, _2587);
    float _2617 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2619 = fma(_2609, 0.298911988735198974609375, _2611);
    bool _2621 = _1798 > 0.0;
    bool _2623 = isnan(_1798);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan(0.0);
    bool _2629 = _2625 || _2627;
    float _2631 = fma(_2615, 0.114477999508380889892578125, _2619);
    out.m_49.x = _2617;
    bool _2633 = _1856 <= 0.0;
    bool _2635 = !_2629;
    bool _2637 = _2633 || _2635;
    float _2639 = -_2631;
    float _2641 = _2609 + _2639;
    float _2643 = -_2631;
    float _2645 = _2603 + _2643;
    float _2647 = -_2631;
    float _2649 = _2615 + _2647;
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    float _2653 = fma(_2645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    float _2655 = fma(_2649, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    bool _2657 = !_2613;
    if (!_2657)
    {
        float _2659 = -_1732;
        float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2663 = -_1734;
        float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2667 = -_1736;
        float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2671 = _2661 * _2661;
        float _2673 = fma(_2665, _2665, _2671);
        float _2675 = fma(_2669, _2669, _2673);
        float _2677 = sqrt(_2675);
        float _2679 = rsqrt(_2675);
        float _2681 = -_2677;
        float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2687 = precise::clamp(_2685, 0.0, 1.0);
        float _2689 = _2665 * _2679;
        float _2691 = _2661 * _2679;
        float _2693 = abs(_2687);
        float _2695 = log2(_2693);
        float _2697 = _2669 * _2679;
        float _2699 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2701 = _2311 * _2691;
        float _2703 = -_2691;
        float _2705 = -_2699;
        float _2707 = fma(_2703, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2705);
        float _2709 = fma(_2327, _2689, _2701);
        float _2711 = -_2697;
        float _2713 = fma(_2711, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2707);
        float _2715 = fma(_2339, _2697, _2709);
        float _2717 = precise::clamp(_2715, 0.0, 1.0);
        float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2721 = _2713 + _2719;
        float _2723 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2725 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2727 = precise::clamp(_2725, 0.0, 1.0);
        float _2729 = exp2(_2723);
        float _2731 = _2729 * _2727;
        float _2733 = _2717 * _2731;
        float _2735 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2737 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2739 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2735;
        out.m_95.y = _2737;
        out.m_95.z = _2739;
    }
    out.m_73.x = _2651;
    out.m_73.y = _2653;
    out.m_73.z = _2655;
    if (!_2637)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2741 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2741;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2493 = false;
    bool _540 = false;
    bool _398 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2798 = as_type<float>(_130);
        out.gl_Position.z = _2798;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2867 = as_type<float>(_166);
        out.gl_Position.z = _2867;
    }
    if (_158)
    {
        return out;
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _196 = _188;
    float _214;
    if (!_194)
    {
        float _198 = in.m_55.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _224 + _242;
    bool _246 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_224);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_224);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_240;
    float _280 = _278 + 1.0;
    float _282 = 1.0 / _264;
    float _284 = _276 * _280;
    float _286 = -_276;
    float _288 = _286 + 1.0;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _296 = 1.0 / _260;
    float _298 = _256 * _288;
    float _300 = -_256;
    float _302 = _300 + 1.0;
    float _304 = _244 * _282;
    float _306 = _228 * _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    float _316 = fma(_292, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = _316 * _298;
    float _330 = _318 * _298;
    float _332 = _320 * _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].x, _328);
    float _348 = fma(_336, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _350 = fma(_340, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _352 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _354 = fma(_344, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].z, _332);
    float _358 = fma(_348, _284, _346);
    float _360 = fma(_350, _284, _352);
    float _362 = fma(_354, _284, _356);
    float _364 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].x, _358);
    float _366 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].y, _360);
    float _368 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].z, _362);
    float _370 = _364 * _322;
    float _372 = _366 * _324;
    float _374 = _368 * _326;
    bool _376 = !_294;
    float _378 = _370;
    float _396;
    if (!_376)
    {
        float _380 = in.m_55.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_114);
        float _402 = 1.0 / _400;
        float _404 = _148 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _410 = _406 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = isnan(_406);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _432 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _434 = isnan(_406);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _444;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = 1.0 / _414;
    float _462 = -_426;
    float _464 = _462 + 1.0;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _468 = _442 * _464;
    float _470 = -_442;
    float _472 = _470 + 1.0;
    float _474 = 1.0 / _430;
    float _476 = _446 * _460;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = fma(_476, _410, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _484 = _480 * _474;
    float _486 = _482 * _468;
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _406 + _492;
    float _496 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _486);
    float _498 = _426 * _490;
    float _500 = fma(_484, _494, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _504 = fma(_500, _498, _496);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[117].x, _504);
    float _512 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _510 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _512;
    out.m_59.y = _514;
    out.m_59.z = _516;
    out.m_59.w = _518;
    bool _520 = !_466;
    float _538;
    if (!_520)
    {
        float _522 = in.m_55.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_114);
        float _544 = 1.0 / _542;
        float _546 = _148 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = in.m_55.y;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _554 = in.m_61.x;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _558 = _556 != 0;
    float _560 = in.m_55.x;
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _566 = _564 != 0;
    float _568 = in.m_46.x;
    float _570 = in.m_46.y;
    float _572 = in.m_46.z;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _576 = _574 != 0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _584 = _582 != 0;
    float _586 = in.m_61.y;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _590 = _588 != 0;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _594 = in.m_61.z;
    float _596 = 1.0 / _580;
    float _598 = in.m_61.w;
    float _600 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _606 = in.m_55.z;
    float _608 = fma(_600, -2.0, _592);
    float _610 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _604);
    out.m_63.x = _554;
    bool _612 = _550 > 0.5;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _618 = _570 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _620 = in.m_65.y;
    float _622 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[78].z, _616);
    float _624 = _560 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _626 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[5].x, _618);
    out.m_63.y = _586;
    float _628 = -_602;
    float _630 = fma(_624, 2.0, _628);
    float _632 = _570 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_63.z = _594;
    float _634 = -_148;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[76].x, _630);
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _632);
    out.m_63.w = _598;
    bool _640 = _606 > 0.5;
    float _642 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    float _644 = _594;
    float _646 = _626;
    bool _648 = _640;
    float _650 = _560;
    if (_558)
    {
        _644 = _560;
    }
    float _652 = _644;
    float _654 = in.m_65.x;
    float _656 = _652;
    if (!_558)
    {
        _656 = _606;
    }
    float _658 = _656;
    float _660 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[5].z, _626);
    float _662 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = _570 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = _660 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _548 + _672;
    float _676 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[6].x, _664);
    float _678 = _668 * _596;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _670 + _680;
    float _684 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    float _686 = fma(_678, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _662 + _688;
    float _692 = _682 * _682;
    float _694 = _684 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _698 = fma(_690, _690, _692);
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _702 = _694 + _700;
    float _704 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _696);
    float _706 = _664;
    if (_558)
    {
        _706 = _550;
    }
    float _708 = _706;
    float _710 = -_620;
    float _712 = _710 + 1.0;
    float _714 = fma(_702, _702, _698);
    bool _716 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _718 = isnan(_548);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _730 = _708;
    float _732 = _620;
    if (!_566)
    {
        _646 = _654;
    }
    float _734 = _646;
    float _736 = rsqrt(_714);
    bool _738 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _740 = isnan(_548);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_726;
    float _752 = _750 + 1.0;
    int _754 = _640 ? as_type<int>(_712) : as_type<int>(_620);
    float _756 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[88].z, _728);
    float _758 = _734;
    if (_566)
    {
        bool _760 = _560 > 0.5;
        _648 = _760;
    }
    bool _762 = _648;
    float _764 = _748 * _752;
    if (!_558)
    {
        _730 = _560;
    }
    float _766 = _730;
    float _768 = sqrt(_714);
    if (!_566)
    {
        _650 = _734;
    }
    float _770 = _650;
    float _772 = _552 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _774 = _770;
    if (_566)
    {
        _758 = _654;
    }
    float _776 = _758;
    float _778 = _686 * _764;
    float _780 = _584 ? as_type<float>(_754) : _620;
    float _782 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _784 = _766 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _786 = as_type<int>(_782);
    if (_590)
    {
        float _788 = _612 ? _712 : _620;
        _732 = _788;
    }
    float _790 = _732;
    float _792 = fma(_780, _772, -0.5);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _796 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = fma(_782, _790, -0.5);
    float _800 = _682 * _736;
    float _802 = fma(_784, -2.0, _794);
    if (_566)
    {
        float _804 = -_776;
        float _806 = _804 + 1.0;
        _786 = as_type<int>(_806);
    }
    int _808 = _786;
    float _810 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _812 = _768 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _816 = _658 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _818 = _690 * _736;
    float _820 = -_800;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    if (_566)
    {
        float _824 = _762 ? as_type<float>(_808) : _776;
        _774 = _824;
    }
    float _826 = _774;
    int _828 = 0;
    if (_576)
    {
        float _830 = -_776;
        float _832 = _830 + 1.0;
        _828 = as_type<int>(_832);
    }
    int _834 = _828;
    float _836 = precise::min(_810, _812);
    float _838 = -_814;
    float _840 = fma(_816, 2.0, _838);
    float _842 = -_818;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _846 = _822 * _822;
    if (!_576)
    {
        _378 = _776;
    }
    float _848 = _378;
    float _850 = _800 * _836;
    float _852 = _848;
    float _854 = _850;
    if (_576)
    {
        float _856 = _612 ? as_type<float>(_834) : _776;
        _852 = _856;
    }
    float _858 = _852;
    float _860 = fma(_844, _844, _846);
    float _862 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _610);
    float _864 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _866 = _702 * _736;
    float _868 = _818 * _836;
    float _870 = -_850;
    float _872 = _682 + _870;
    float _874 = -_864;
    float _876 = fma(_862, _798, _874);
    float _878 = _866 * _836;
    float _880 = -_868;
    float _882 = _690 + _880;
    float _884 = _872 * _872;
    float _886 = -_866;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _702);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _892 = -_748;
    float _894 = _892 + 1.0;
    float _896 = fma(_882, _882, _884);
    float _898 = -_878;
    float _900 = _702 + _898;
    float _902 = _682 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _904 = fma(_888, _888, _860);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[131].x, _778);
    float _908 = fma(_900, _900, _896);
    float _910 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[28].x, _902);
    float _912 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _756);
    float _914 = _614 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _916 = sqrt(_904);
    float _918 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[28].z, _910);
    float _920 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _622);
    float _922 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _704);
    float _924 = -_148;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[86].x, _840);
    float _928 = _890 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _930 = _918 >= 0.0;
    float _932 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _802);
    float _934 = sqrt(_908);
    float _936 = fma(_914, _858, -0.5);
    float _938 = fma(_928, _826, -0.5);
    float _940 = -_932;
    float _942 = fma(_922, _792, _940);
    float _944 = fma(_912, _936, _926);
    float _946 = fma(_920, _938, _636);
    float _948 = _736 * _916;
    float _950 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[132].x, _906);
    float _952 = _876 + 0.5;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _956 = _942 + 0.5;
    float _958 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _960 = _946 + 0.5;
    float _962 = _736 * _934;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _966 = _934;
    float _968 = _868;
    if (_930)
    {
        _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _970 = _966;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _974 = _962 * _948;
    float _976 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _944 + 0.5;
    int _984 = as_type<int>(_970);
    if (_930)
    {
        float _986 = _970 * 5.0;
        _984 = as_type<int>(_986);
    }
    int _988 = _984;
    float _990 = _796 * _974;
    out.m_67.x = _960;
    out.m_67.y = _952;
    out.m_69.x = _976;
    out.m_69.y = _978;
    out.m_69.z = _980;
    out.m_69.w = _958;
    out.m_71.x = _982;
    out.m_71.y = _956;
    if (_930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4287 = as_type<float>(_988);
        out.gl_Position.z = _4287;
    }
    out.m_73.w = _836;
    if (_930)
    {
        out.m_49.x = 0.0;
    }
    out.m_75.x = _990;
    if (_930)
    {
        return out;
    }
    float _992 = -_800;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _670);
    float _996 = -_818;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _662);
    float _1000 = -_866;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1018 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1016);
    float _1020 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1018);
    bool _1022 = _1020 >= 0.0;
    float _1024 = _1014;
    if (_1022)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1026 = _1024;
    int _1028 = as_type<int>(_1026);
    if (_1022)
    {
        out.m_49.x = 0.0;
    }
    if (_1022)
    {
        float _1030 = _1026 * 5.0;
        _1028 = as_type<int>(_1030);
    }
    int _1032 = _1028;
    if (_1022)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4382 = as_type<float>(_1032);
        out.gl_Position.z = _4382;
    }
    if (_1022)
    {
        return out;
    }
    float _1034 = -_670;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1038 = -_662;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1042 = -_694;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1046 = _1036 * _1036;
    float _1048 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1050 = fma(_1040, _1040, _1046);
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1054 = fma(_1044, _1044, _1050);
    float _1056 = -_1052;
    float _1058 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1056);
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1062 = rsqrt(_1054);
    float _1064 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1068 = -_1064;
    float _1070 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1068);
    float _1072 = -_1066;
    float _1074 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1072);
    float _1076 = _1040 * _1062;
    float _1078 = _1044 * _1062;
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1082 = _1036 * _1062;
    float _1084 = _1076 * _1076;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1088 = -_1080;
    float _1090 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1092 = fma(_1078, _1078, _1084);
    float _1094 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1096 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1098 = rsqrt(_1092);
    float _1100 = -_1094;
    float _1102 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1100);
    float _1104 = -_1096;
    float _1106 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1104);
    float _1108 = -_1060;
    float _1110 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1108);
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1114 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1116 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1090);
    float _1118 = -_1112;
    float _1120 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1122 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1124 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1126 = -_1114;
    float _1128 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1126);
    float _1130 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1120);
    float _1132 = -_1122;
    float _1134 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1132);
    float _1136 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1128);
    float _1138 = _1078 * _1098;
    float _1140 = _1076 * _1098;
    float _1142 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1134);
    float _1144 = -_1138;
    float _1146 = _1078 * _1144;
    float _1148 = -_1138;
    float _1150 = _1082 * _1148;
    float _1152 = -_1124;
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1152);
    float _1156 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1146;
    float _1160 = fma(_1076, _1140, _1158);
    float _1162 = _1082 * _1140;
    float _1164 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1166 = -_1156;
    float _1168 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1170 = _1160 * _1160;
    float _1172 = -_1086;
    float _1174 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1172);
    float _1176 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1178 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1180 = fma(_1162, _1162, _1170);
    float _1182 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1174);
    float _1184 = -_1176;
    float _1186 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1184);
    float _1188 = -_1178;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1164);
    float _1192 = fma(_1150, _1150, _1180);
    float _1194 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1186);
    float _1196 = 1.0 / _1190;
    float _1198 = rsqrt(_1192);
    float _1200 = fma(_1182, _1196, -1.0);
    float _1202 = _1160 * _1198;
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = -_1204;
    float _1208 = _1206 + 1.0;
    float _1210 = _1208 * _1196;
    float _1212 = fma(_1208, _1200, 1.0);
    float _1214 = _1194 * _1210;
    float _1216 = _1212 * _1212;
    float _1218 = _1136 * _1210;
    float _1220 = fma(_1214, _1214, _1216);
    float _1222 = fma(_1218, _1218, _1220);
    float _1224 = rsqrt(_1222);
    float _1226 = _1218 * _1224;
    float _1228 = _1214 * _1224;
    float _1230 = _1212 * _1224;
    float _1232 = -_1226;
    float _1234 = _1076 * _1232;
    float _1236 = _1078 * _1230;
    float _1238 = -_1228;
    float _1240 = -_1234;
    float _1242 = fma(_1078, _1238, _1240);
    float _1244 = -_1228;
    float _1246 = _1082 * _1244;
    float _1248 = -_1226;
    float _1250 = -_1236;
    float _1252 = fma(_1082, _1248, _1250);
    float _1254 = _1242 * _1242;
    float _1256 = -_1246;
    float _1258 = fma(_1076, _1230, _1256);
    float _1260 = fma(_1252, _1252, _1254);
    float _1262 = fma(_1258, _1258, _1260);
    float _1264 = rsqrt(_1262);
    float _1266 = _1252 * _1264;
    float _1268 = _1258 * _1264;
    float _1270 = _1242 * _1264;
    float _1272 = _1078 * _1266;
    float _1274 = _1082 * _1268;
    float _1276 = -_1272;
    float _1278 = fma(_1076, _1268, _1276);
    float _1280 = _1076 * _1270;
    float _1282 = -_1274;
    float _1284 = fma(_1078, _1270, _1282);
    float _1286 = _1278 * _1278;
    float _1288 = -_1280;
    float _1290 = fma(_1082, _1266, _1288);
    float _1292 = fma(_1284, _1284, _1286);
    float _1294 = fma(_1290, _1290, _1292);
    float _1296 = rsqrt(_1294);
    float _1298 = _1290 * _1296;
    float _1300 = _1278 * _1296;
    float _1302 = _1284 * _1296;
    float _1304 = _1076 * _1298;
    float _1306 = _1078 * _1300;
    float _1308 = in.m_77.x;
    float _1310 = in.m_77.y;
    float _1312 = in.m_77.z;
    float _1314 = -_1304;
    float _1316 = fma(_1078, _1302, _1314);
    float _1318 = -_1306;
    float _1320 = fma(_1082, _1298, _1318);
    float _1322 = _1082 * _1302;
    float _1324 = _1316 * _1316;
    float _1326 = -_1322;
    float _1328 = fma(_1076, _1300, _1326);
    float _1330 = fma(_1320, _1320, _1324);
    float _1332 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1334 = fma(_1328, _1328, _1330);
    float _1336 = _1332 * _974;
    float _1338 = _1048 * _974;
    float _1340 = rsqrt(_1334);
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1308);
    float _1346 = _1336 * _1342;
    float _1348 = _990 * _1344;
    float _1350 = -_878;
    float _1352 = _694 + _1350;
    float _1354 = _1346 * _1298;
    float _1356 = _1346 * _1302;
    float _1358 = _1328 * _1340;
    float _1360 = _1338 * _1312;
    float _1362 = _1320 * _1340;
    float _1364 = _1316 * _1340;
    float _1366 = fma(_1348, _1358, _1354);
    float _1368 = -_850;
    float _1370 = _670 + _1368;
    float _1372 = fma(_1348, _1362, _1356);
    float _1374 = fma(_1360, _1078, _1366);
    float _1376 = fma(_1360, _1076, _1372);
    float _1378 = _694 + _1374;
    float _1380 = -_800;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1370);
    float _1384 = _662 + _1376;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1388 = _1378 + _1386;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1394 = _1384 + _1392;
    float _1396 = _1388 * _1388;
    float _1398 = fma(_1394, _1394, _1396);
    float _1400 = _1346 * _1300;
    float _1402 = -_868;
    float _1404 = _662 + _1402;
    float _1406 = sqrt(_1398);
    float _1408 = fma(_1348, _1364, _1400);
    float _1410 = -_818;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1414 = fma(_1360, _1082, _1408);
    float _1416 = -_866;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1352);
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1390);
    float _1422 = _670 + _1414;
    float _1424 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1420);
    bool _1426 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1414;
    float _1430 = _1340;
    float _1432 = _1384;
    float _1434 = _1370;
    float _1436 = _1382;
    float _1438 = _1412;
    float _1440 = _1078;
    if (!_1426)
    {
        _1428 = _1384;
    }
    float _1442 = _1428;
    float _1444 = _1442;
    if (!_1426)
    {
        _1430 = _1378;
    }
    float _1446 = _1430;
    float _1448 = _1446;
    if (!_1426)
    {
        _1432 = _1422;
    }
    float _1450 = _1432;
    bool _1452 = !_1426;
    float _1454 = _1450;
    if (!_1452)
    {
        float _1456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1460 = _1406 + _1458;
        float _1462 = rsqrt(_1398);
        float _1464 = _1460 * _1456;
        float _1466 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1468 = _1464 * 0.15915493667125701904296875;
        float _1470 = _1468 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = _1468 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1472 + (-1.0);
        float _1480 = fma(_1476, _1466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1482 = _1478 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = _1462 * _1480;
        float _1486 = fma(_1422, _1472, _1482);
        float _1488 = fma(_1394, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1490 = fma(_1388, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1454 = _1486;
        _1444 = _1488;
        _1448 = _1490;
    }
    float _1492 = _1454;
    float _1494 = _1444;
    float _1496 = _1448;
    float _1498 = -_670;
    float _1500 = _1498 + _1492;
    float _1502 = -_662;
    float _1504 = _1502 + _1494;
    float _1506 = -_694;
    float _1508 = _1506 + _1496;
    float _1510 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1512 = _1500 * _1500;
    float _1514 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1516 = 1.0 / _1510;
    float _1518 = fma(_1504, _1504, _1512);
    float _1520 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1514);
    float _1522 = -_878;
    float _1524 = _1522 + _1496;
    float _1526 = fma(_1508, _1508, _1518);
    float _1528 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1520);
    float _1530 = sqrt(_1526);
    float _1532 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1534 = _1532 + _1510;
    float _1536 = _1534 * _1516;
    float _1538 = _1536 * 0.5;
    bool _1540 = _1530 > 0.0;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1544 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1542);
    bool _1546 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.5);
    bool _1554 = _1550 || _1552;
    float _1556 = 1.0 / _1544;
    bool _1558 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan(0.5);
    bool _1566 = _1562 || _1564;
    float _1568 = -_868;
    float _1570 = _1568 + _1494;
    float _1572 = -_850;
    float _1574 = _1572 + _1492;
    float _1576 = _1524;
    float _1578 = _1570;
    float _1580 = _1574;
    if (!_1540)
    {
        _854 = _1570;
    }
    float _1582 = _854;
    float _1584 = _1582;
    if (!_1540)
    {
        _968 = _1574;
    }
    float _1586 = _968;
    bool _1588 = !_1540;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = _190 * _190;
        float _1594 = rsqrt(_1526);
        float _1596 = fma(_188, _188, _1592);
        float _1598 = fma(_192, _192, _1596);
        float _1600 = sqrt(_1598);
        float _1602 = _1504 * _1594;
        float _1604 = _1500 * _1594;
        float _1606 = _1508 * _1594;
        bool _1608 = _1600 > 0.0;
        float _1610 = _1594;
        float _1612 = _1600;
        if (!_1608)
        {
            _1610 = _1570;
        }
        float _1614 = _1610;
        _1584 = _1614;
        if (!_1608)
        {
            _1612 = _1574;
        }
        float _1616 = _1612;
        bool _1618 = !_1608;
        _1590 = _1616;
        if (!_1618)
        {
            float _1620 = rsqrt(_1598);
            float _1622 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1624 = _190 * _1620;
            float _1626 = _188 * _1620;
            float _1628 = _192 * _1620;
            float _1630 = _1604 * _1624;
            float _1632 = fma(_1602, _1626, _1630);
            float _1634 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1636 = fma(_1606, _1628, _1632);
            float _1638 = _1636 * _1634;
            float _1640 = fma(_188, _1638, _1570);
            float _1642 = fma(_190, _1638, _1574);
            float _1644 = fma(_192, _1638, _1524);
            _1584 = _1640;
            _1590 = _1642;
            _1576 = _1644;
        }
    }
    float _1646 = _1584;
    float _1648 = _1590;
    float _1650 = _1576;
    float _1652 = -_818;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1646);
    float _1656 = -_800;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1648);
    float _1660 = -_866;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1650);
    float _1664 = _1658;
    float _1666 = _1654;
    float _1668 = _1662;
    if (_1566)
    {
        _196 = 1.0;
    }
    float _1670 = _196;
    float _1672 = _1670;
    if (!_1554)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1676 = _1382 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1680 = _1412 + _1678;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _1684 = -_1352;
        float _1686 = _1684 + _1650;
        float _1688 = _1676 * _1676;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1692 = _1418 + _1690;
        float _1694 = -_1404;
        float _1696 = _1694 + _1646;
        float _1698 = -_1370;
        float _1700 = _1698 + _1648;
        float _1702 = fma(_1680, _1680, _1688);
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1706 = fma(_1692, _1692, _1702);
        float _1708 = sqrt(_1706);
        float _1710 = 1.0 / _948;
        float _1712 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1714 = precise::max(_1708, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _1716 = _1714 * _1682;
        float _1718 = _1716 * _1710;
        float _1720 = _1712 * _1718;
        float _1722 = _1686 * _1718;
        float _1724 = fma(_1696, _1720, _1412);
        float _1726 = fma(_1700, _1720, _1382);
        float _1728 = fma(_1712, _1722, _1418);
        _1434 = _1700;
        _1664 = _1726;
        _1666 = _1724;
        _1668 = _1728;
    }
    float _1730 = _1434;
    float _1732 = _1664;
    float _1734 = _1666;
    float _1736 = _1668;
    float _1738 = _1730;
    if (_1566)
    {
        _1578 = 1.0;
    }
    float _1740 = _1578;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1744 = _1556 * _1742;
    float _1746 = _1740;
    if (!_1566)
    {
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1752 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1750;
        float _1754 = _1748 * 0.15915493667125701904296875;
        float _1756 = _1754 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        float _1760 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1762 = _1760 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1758;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = _1762 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1772 * _1774;
        float _1782 = 1.0 / _1752;
        float _1784 = 1.0 / _1780;
        float _1786 = _1778 * _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1790 = fma(_1744, _1786, _1788);
        float _1792 = _1790 * _1782;
        float _1794 = precise::clamp(_1792, 0.0, 1.0);
        _1738 = _1762;
        _1672 = _1794;
    }
    float _1796 = _1738;
    float _1798 = _1672;
    float _1800 = _1796;
    if (!_1566)
    {
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1804 * 6.283185482025146484375;
        float _1808 = cos(_1806);
        float _1810 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1812 = _1810 * 0.15915493667125701904296875;
        float _1814 = _1804 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        float _1818 = 1.0 / _1808;
        float _1820 = _1812 * 6.283185482025146484375;
        float _1822 = cos(_1820);
        float _1824 = _1816 * _1818;
        float _1826 = _1812 * 6.283185482025146484375;
        float _1828 = sin(_1826);
        float _1830 = _1822 * _1824;
        float _1832 = 1.0 / _1830;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1836 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1834;
        float _1838 = 1.0 / _1836;
        float _1840 = _1828 * _1832;
        float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1844 = fma(_1744, _1840, _1842);
        float _1846 = _1844 * _1838;
        float _1848 = precise::clamp(_1846, 0.0, 1.0);
        float _1850 = -_1848;
        float _1852 = _1850 + 1.0;
        _1800 = _1818;
        _1746 = _1852;
    }
    float _1854 = _1800;
    float _1856 = _1746;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1860 = _1732 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1734 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1736 + _1866;
    float _1870 = _1860 * _1860;
    float _1872 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = fma(_1864, _1864, _1870);
    float _1876 = fma(_1868, _1868, _1874);
    float _1878 = rsqrt(_1876);
    float _1880 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1864 * _1880;
    float _1884 = _1868 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1878;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1854;
    float _1908 = _1860;
    float _1910 = _1882;
    if (_1894)
    {
        float _1912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1912;
    }
    float _1914 = _1900;
    if (_1894)
    {
        float _1916 = rsqrt(_1890);
        _1902 = _1916;
    }
    float _1918 = _1902;
    float _1920 = _1918;
    if (_1894)
    {
        float _1922 = _1898 * _1914;
        _1904 = _1922;
    }
    float _1924 = _1904;
    if (_1894)
    {
        float _1926 = _1924 * 0.15915493667125701904296875;
        _1906 = _1926;
    }
    float _1928 = _1906;
    float _1930 = _1914;
    float _1932 = _1928;
    if (_1894)
    {
        float _1934 = _1928 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1930 = _1936;
    }
    float _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1868;
    float _1946 = _1942;
    if (_1894)
    {
        float _1948 = _1928 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1944 = _1950;
    }
    float _1952 = _1944;
    float _1954 = -_1880;
    float _1956 = -_1942;
    float _1958 = fma(_1860, _1954, _1956);
    float _1960 = _1958;
    if (_1894)
    {
        float _1962 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1962;
    }
    float _1964 = _1946;
    if (!_1894)
    {
        _1932 = _1888;
    }
    float _1966 = _1932;
    float _1968 = _1938;
    float _1970 = _1966;
    if (_1894)
    {
        float _1972 = fma(_1938, _1964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = sqrt(_1876);
    float _1978 = _1974;
    if (_1894)
    {
        float _1980 = _1952 + (-1.0);
        _1908 = _1980;
    }
    float _1982 = _1908;
    float _1984 = _1982;
    if (_1894)
    {
        float _1986 = _1918 * _1974;
        _1580 = _1986;
    }
    float _1988 = _1580;
    if (!_1894)
    {
        _1920 = _1884;
    }
    float _1990 = _1920;
    float _1992 = _1990;
    if (_1894)
    {
        float _1994 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1994;
    }
    float _1996 = _1984;
    if (_1894)
    {
        float _1998 = _1882 * _1988;
        _1910 = _1998;
    }
    float _2000 = _1910;
    if (!_1894)
    {
        _1978 = _1886;
    }
    float _2002 = _1978;
    float _2004 = _2002;
    if (_1894)
    {
        float _2006 = _1884 * _1988;
        _1992 = _2006;
    }
    float _2008 = _1992;
    if (_1894)
    {
        float _2010 = fma(_1958, _1952, _1996);
        _1960 = _2010;
    }
    float _2012 = _1960;
    if (_1894)
    {
        float _2014 = _2000 * _2000;
        _2004 = _2014;
    }
    float _2016 = _2004;
    float _2018 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1894)
    {
        float _2020 = _2008 * _2008;
        _1970 = _2020;
    }
    float _2022 = _1970;
    float _2024 = fma(_2012, _2012, _2016);
    float _2026 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2018);
    float _2028 = _2024 + _2022;
    float _2030 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2032 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2028);
    float _2042 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2026);
    float _2044 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2046 = -_2038;
    float _2048 = _2046 + 1.0;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2052 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2044);
    float _2054 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2056 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2058 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2060 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2062 = abs(_2048);
    float _2064 = log2(_2062);
    float _2066 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2058);
    float _2068 = -_2060;
    float _2070 = fma(_2068, _2056, 1.0);
    float _2072 = _2040 * _2000;
    float _2074 = _2040 * _2012;
    float _2076 = _2040 * _2008;
    float _2078 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _2080 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2066);
    float _2082 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2084 = floor(_2054);
    float _2086 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2092 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2078);
    float _2094 = -_2086;
    float _2096 = fma(_2074, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2094);
    float _2098 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2100 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2090);
    float _2102 = floor(_2030);
    float _2104 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2106 = -_2076;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2096);
    float _2110 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2112 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2114 = _2074 + 1.0;
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2118 = log2(_2070);
    float _2120 = -_2084;
    float _2122 = _2054 + _2120;
    float _2124 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2128 = exp2(_2098);
    float _2130 = fma(_2108, -0.5, 0.5);
    float _2132 = -_2102;
    float _2134 = _2030 + _2132;
    float _2136 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2112);
    float _2138 = fma(_2108, 0.5, 0.5);
    float _2140 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2126);
    float _2142 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2136);
    float _2144 = 1.0 / _2116;
    float _2146 = fma(_2138, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2148 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2150 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2152 = _2118 * 0.693147182464599609375;
    float _2154 = fma(_2138, _2146, -0.212114393711090087890625);
    float _2156 = sqrt(_2130);
    float _2158 = -_2074;
    float _2160 = fma(_2128, _2114, _2158);
    float2 _6176 = float2(_2122, _2134);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6176, float2(0.0), isnan(_6176)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6176, float2(0.0), isnan(_6176)), level(0.0)).x;
    float _2164 = fma(_2138, _2154, 1.570728778839111328125);
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = fma(_2160, 0.5, 0.5);
    float _2170 = _2148 * _2144;
    float _2172 = _2150 * _2144;
    float _2174 = fma(_2170, 0.5, 0.5);
    float _2176 = fma(_2172, -0.5, 0.5);
    float _2178 = _2156 * 0.636619746685028076171875;
    float3 _6210 = float3(_2174, _2176, _2166);
    float _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).x;
    float _2182 = -_2164;
    float _2184 = fma(_2178, _2182, 1.0);
    float3 _6226 = float3(_2174, _2176, _2166);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6226, float3(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6226, float3(0.0), isnan(_6226)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float2 _6242 = float2(_2184, _2168);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6242, float2(0.0), isnan(_6242)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6242, float2(0.0), isnan(_6242)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = abs(_1744);
    float _2209 = log2(_2207);
    bool _2211 = _1310 != 0.0;
    bool _2213 = isnan(_1310);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan(0.0);
    bool _2219 = _2215 || _2217;
    float _2221 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1734;
    out.m_79.y = _1732;
    out.m_79.z = _1736;
    bool _2223 = _1308 == 0.0;
    bool _2225 = !_2219;
    bool _2227 = _2223 && _2225;
    float _2229 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2221);
    bool _2231 = _1312 == 0.0;
    bool _2233 = _2231 && _2227;
    float _2235 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2229);
    bool _2237 = _1744 <= 8000.0;
    bool _2239 = isnan(_1744);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(8000.0);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    out.m_81.x = _1412;
    out.m_81.y = _1382;
    out.m_81.z = _1418;
    float _2249 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2251 = in.m_83.x;
    float _2253 = in.m_83.y;
    float _2255 = in.m_83.z;
    float _2257 = exp2(_2249);
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2261 = precise::clamp(_2259, 0.0, 1.0);
    float _2263 = _2253;
    float _2265 = _2255;
    float _2267 = _2251;
    if (!_2233)
    {
        float _2269 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2253);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2275 = fma(_2261, -2.0, 3.0);
    float _2277 = _2261 * _2261;
    if (!_2233)
    {
        float _2279 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2255);
        _2265 = _2279;
    }
    float _2281 = _2265;
    if (!_2233)
    {
        float _2283 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2251);
        _2267 = _2283;
    }
    float _2285 = _2267;
    float _2287 = in.m_85.x;
    float _2289 = _2277 * _2275;
    float _2291 = exp2(_2273);
    float _2293 = _1300 * _2271;
    float _2295 = _2116 * 0.5;
    float _2297 = -_2289;
    float _2299 = _2297 + 1.0;
    float _2301 = _1302 * _2271;
    float _2303 = fma(_1364, _2285, _2293);
    float _2305 = _1298 * _2271;
    float _2307 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2289);
    float _2309 = fma(_2150, -0.5, _2295);
    float _2311 = fma(_1082, _2281, _2303);
    float _2313 = _2247 * _2307;
    float _2315 = fma(_1362, _2285, _2301);
    float _2317 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2235);
    float _2319 = fma(_1358, _2285, _2305);
    float _2321 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2323 = -_2291;
    float _2325 = _2323 + 1.0;
    float _2327 = fma(_1076, _2281, _2315);
    float _2329 = _2317 + _2116;
    float _2331 = _2148 + _2116;
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2335 = _2329 * 0.5;
    float _2337 = _2331 * 0.5;
    float _2339 = fma(_1078, _2281, _2319);
    bool _2341 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2343 = isnan(_1976);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2349 = _2345 || _2347;
    out.gl_Position.x = _2148;
    out.gl_Position.y = _2150;
    out.gl_Position.z = _2317;
    out.gl_Position.w = _2116;
    out.m_87.x = _2337;
    out.m_87.y = _2309;
    out.m_87.z = _2335;
    out.m_87.w = _2116;
    out.m_89.x = _2327;
    out.m_89.y = _2311;
    out.m_89.z = _2339;
    if (!_2349)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2351 = _1436;
    float _2353 = _2351;
    float _2355 = _2351;
    if (!_2349)
    {
        _1438 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2357 = _1438;
    float _2359 = _2357;
    float _2361 = _2357;
    if (!_2349)
    {
        _1440 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2363 = _1440;
    float _2365 = -_2162;
    float _2367 = _2365 + 1.0;
    float _2369 = _2367 * _2321;
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = -_2371;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2377 = _2375 * _2287;
    float _2379 = _2287;
    float _2381 = _2363;
    float _2383 = _2363;
    if (!_2349)
    {
        _2379 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2385 = _2379;
    float _2387 = _2333 * _2180;
    float _2389 = -_2333;
    float _2391 = _2389 + 1.0;
    float _2393 = _2377 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2395 = _2195 * _2387;
    float _2397 = _2195 * _2391;
    out.m_91.x = _2393;
    float _2399 = _1798 * _1856;
    float _2401 = _2205 * _2387;
    float _2403 = fma(_2201, _2395, _2189);
    float _2405 = fma(_2203, _2395, _2191);
    float _2407 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2409 = fma(_2195, _2401, _2193);
    float _2411 = _2395;
    float _2413 = _2399;
    float _2415 = _2385;
    float _2417 = _2385;
    if (!_2349)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2419 = _2411;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2349)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2425 = _2413;
    out.m_93.x = _2403;
    out.m_93.y = _2405;
    out.m_93.z = _2409;
    out.m_93.w = _2397;
    bool _2427 = !_2349;
    float _2429 = _2425;
    float _2431 = _2425;
    if (!_2427)
    {
        bool _2433 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2435 = isnan(_1976);
        bool _2437 = _2433 || _2435;
        bool _2439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2441 = _2437 || _2439;
        if (!_2441)
        {
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2445 = _1976 + _2443;
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2449 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2447;
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2455 = 1.0 / _2449;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2473 = _2445 * _2455;
            float _2475 = precise::clamp(_2473, 0.0, 1.0);
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2481 = fma(_2475, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2483 = fma(_2475, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2485 = fma(_2475, _2459, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2487 = fma(_2475, _2463, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2489 = fma(_2475, _2467, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2491 = fma(_2475, _2471, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2361 = _2485;
            _2423 = _2489;
            _2355 = _2481;
            _2417 = _2487;
            _2383 = _2483;
            _2431 = _2491;
            _2493 = true;
        }
        else
        {
            bool _2495 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2497 = isnan(_1976);
            bool _2499 = _2495 || _2497;
            bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2503 = _2499 || _2501;
            if (!_2503)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2505 = _2353;
            _2355 = _2505;
            if (!_2503)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2507 = _2359;
            _2361 = _2507;
            if (!_2503)
            {
                _2381 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2509 = _2381;
            _2383 = _2509;
            if (!_2503)
            {
                _2415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2511 = _2415;
            _2417 = _2511;
            if (!_2503)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2513 = _2421;
            _2423 = _2513;
            if (!_2503)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2515 = _2429;
            bool _2517 = !_2503;
            _2431 = _2515;
            if (!_2517)
            {
                bool _2519 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2521 = isnan(_1976);
                bool _2523 = _2519 || _2521;
                bool _2525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2527 = _2523 || _2525;
                if (!_2527)
                {
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2531 = _1976 + _2529;
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2535 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2533;
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2541 = 1.0 / _2535;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2559 = _2531 * _2541;
                    float _2561 = precise::clamp(_2559, 0.0, 1.0);
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2567 = fma(_2561, _2539, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2569 = fma(_2561, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2571 = fma(_2561, _2545, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2573 = fma(_2561, _2549, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2575 = fma(_2561, _2553, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2577 = fma(_2561, _2557, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2361 = _2571;
                    _2423 = _2575;
                    _2355 = _2567;
                    _2417 = _2573;
                    _2383 = _2569;
                    _2431 = _2577;
                    _2493 = true;
                }
                else
                {
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2383 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2493 = false;
    float _2579 = _2361;
    float _2581 = _2423;
    float _2583 = _2355;
    float _2585 = _2417;
    float _2587 = _2383;
    float _2589 = _2431;
    float _2591 = fma(_2311, -0.5, 0.5);
    float _2593 = precise::clamp(_2591, 0.0, 1.0);
    float _2595 = -_2579;
    float _2597 = _2595 + _2581;
    float _2599 = -_2583;
    float _2601 = _2599 + _2585;
    out.m_95.x = 0.0;
    float _2603 = fma(_2593, _2597, _2579);
    float _2605 = -_2587;
    float _2607 = _2605 + _2589;
    float _2609 = fma(_2593, _2601, _2583);
    float _2611 = _2603 * 0.586610972881317138671875;
    bool _2613 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2615 = fma(_2593, _2607, _2587);
    float _2617 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2619 = fma(_2609, 0.298911988735198974609375, _2611);
    bool _2621 = _1798 > 0.0;
    bool _2623 = isnan(_1798);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan(0.0);
    bool _2629 = _2625 || _2627;
    float _2631 = fma(_2615, 0.114477999508380889892578125, _2619);
    out.m_49.x = _2617;
    bool _2633 = _1856 <= 0.0;
    bool _2635 = !_2629;
    bool _2637 = _2633 || _2635;
    float _2639 = -_2631;
    float _2641 = _2609 + _2639;
    float _2643 = -_2631;
    float _2645 = _2603 + _2643;
    float _2647 = -_2631;
    float _2649 = _2615 + _2647;
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    float _2653 = fma(_2645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    float _2655 = fma(_2649, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    bool _2657 = !_2613;
    if (!_2657)
    {
        float _2659 = -_1732;
        float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2663 = -_1734;
        float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2667 = -_1736;
        float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2671 = _2661 * _2661;
        float _2673 = fma(_2665, _2665, _2671);
        float _2675 = fma(_2669, _2669, _2673);
        float _2677 = sqrt(_2675);
        float _2679 = rsqrt(_2675);
        float _2681 = -_2677;
        float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2687 = precise::clamp(_2685, 0.0, 1.0);
        float _2689 = _2665 * _2679;
        float _2691 = _2661 * _2679;
        float _2693 = abs(_2687);
        float _2695 = log2(_2693);
        float _2697 = _2669 * _2679;
        float _2699 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2701 = _2311 * _2691;
        float _2703 = -_2691;
        float _2705 = -_2699;
        float _2707 = fma(_2703, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2705);
        float _2709 = fma(_2327, _2689, _2701);
        float _2711 = -_2697;
        float _2713 = fma(_2711, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2707);
        float _2715 = fma(_2339, _2697, _2709);
        float _2717 = precise::clamp(_2715, 0.0, 1.0);
        float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2721 = _2713 + _2719;
        float _2723 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2725 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2727 = precise::clamp(_2725, 0.0, 1.0);
        float _2729 = exp2(_2723);
        float _2731 = _2729 * _2727;
        float _2733 = _2717 * _2731;
        float _2735 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2737 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2739 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2735;
        out.m_95.y = _2737;
        out.m_95.z = _2739;
    }
    out.m_73.x = _2651;
    out.m_73.y = _2653;
    out.m_73.z = _2655;
    if (!_2637)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2741 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2741;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2493 = false;
    bool _540 = false;
    bool _398 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2798 = as_type<float>(_130);
        out.gl_Position.z = _2798;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2867 = as_type<float>(_166);
        out.gl_Position.z = _2867;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _196 = _188;
    float _214;
    if (!_194)
    {
        float _198 = in.m_55.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _224 + _242;
    bool _246 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_224);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_224);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_240;
    float _280 = _278 + 1.0;
    float _282 = 1.0 / _264;
    float _284 = _276 * _280;
    float _286 = -_276;
    float _288 = _286 + 1.0;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _296 = 1.0 / _260;
    float _298 = _256 * _288;
    float _300 = -_256;
    float _302 = _300 + 1.0;
    float _304 = _244 * _282;
    float _306 = _228 * _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    float _316 = fma(_292, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = _316 * _298;
    float _330 = _318 * _298;
    float _332 = _320 * _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].x, _328);
    float _348 = fma(_336, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _350 = fma(_340, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _352 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _354 = fma(_344, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[143].z, _332);
    float _358 = fma(_348, _284, _346);
    float _360 = fma(_350, _284, _352);
    float _362 = fma(_354, _284, _356);
    float _364 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].x, _358);
    float _366 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].y, _360);
    float _368 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[145].z, _362);
    float _370 = _364 * _322;
    float _372 = _366 * _324;
    float _374 = _368 * _326;
    bool _376 = !_294;
    float _378 = _370;
    float _396;
    if (!_376)
    {
        float _380 = in.m_55.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_114);
        float _402 = 1.0 / _400;
        float _404 = _148 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _410 = _406 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = isnan(_406);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _432 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _434 = isnan(_406);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _444;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = 1.0 / _414;
    float _462 = -_426;
    float _464 = _462 + 1.0;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _468 = _442 * _464;
    float _470 = -_442;
    float _472 = _470 + 1.0;
    float _474 = 1.0 / _430;
    float _476 = _446 * _460;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = fma(_476, _410, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _484 = _480 * _474;
    float _486 = _482 * _468;
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _406 + _492;
    float _496 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _486);
    float _498 = _426 * _490;
    float _500 = fma(_484, _494, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _504 = fma(_500, _498, _496);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[117].x, _504);
    float _512 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _510 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _512;
    out.m_59.y = _514;
    out.m_59.z = _516;
    out.m_59.w = _518;
    bool _520 = !_466;
    float _538;
    if (!_520)
    {
        float _522 = in.m_55.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_114);
        float _544 = 1.0 / _542;
        float _546 = _148 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = in.m_55.y;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _554 = in.m_61.x;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _558 = _556 != 0;
    float _560 = in.m_55.x;
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _566 = _564 != 0;
    float _568 = in.m_46.x;
    float _570 = in.m_46.y;
    float _572 = in.m_46.z;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _576 = _574 != 0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _584 = _582 != 0;
    float _586 = in.m_61.y;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _590 = _588 != 0;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _594 = in.m_61.z;
    float _596 = 1.0 / _580;
    float _598 = in.m_61.w;
    float _600 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _606 = in.m_55.z;
    float _608 = fma(_600, -2.0, _592);
    float _610 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _604);
    out.m_63.x = _554;
    bool _612 = _550 > 0.5;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _618 = _570 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _620 = in.m_65.y;
    float _622 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[78].z, _616);
    float _624 = _560 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _626 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[5].x, _618);
    out.m_63.y = _586;
    float _628 = -_602;
    float _630 = fma(_624, 2.0, _628);
    float _632 = _570 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_63.z = _594;
    float _634 = -_148;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[76].x, _630);
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _632);
    out.m_63.w = _598;
    bool _640 = _606 > 0.5;
    float _642 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    float _644 = _594;
    float _646 = _626;
    bool _648 = _640;
    float _650 = _560;
    if (_558)
    {
        _644 = _560;
    }
    float _652 = _644;
    float _654 = in.m_65.x;
    float _656 = _652;
    if (!_558)
    {
        _656 = _606;
    }
    float _658 = _656;
    float _660 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[5].z, _626);
    float _662 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = _570 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = _660 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _548 + _672;
    float _676 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[6].x, _664);
    float _678 = _668 * _596;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _670 + _680;
    float _684 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    float _686 = fma(_678, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _662 + _688;
    float _692 = _682 * _682;
    float _694 = _684 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _698 = fma(_690, _690, _692);
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _702 = _694 + _700;
    float _704 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _696);
    float _706 = _664;
    if (_558)
    {
        _706 = _550;
    }
    float _708 = _706;
    float _710 = -_620;
    float _712 = _710 + 1.0;
    float _714 = fma(_702, _702, _698);
    bool _716 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _718 = isnan(_548);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _730 = _708;
    float _732 = _620;
    if (!_566)
    {
        _646 = _654;
    }
    float _734 = _646;
    float _736 = rsqrt(_714);
    bool _738 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _740 = isnan(_548);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_726;
    float _752 = _750 + 1.0;
    int _754 = _640 ? as_type<int>(_712) : as_type<int>(_620);
    float _756 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[88].z, _728);
    float _758 = _734;
    if (_566)
    {
        bool _760 = _560 > 0.5;
        _648 = _760;
    }
    bool _762 = _648;
    float _764 = _748 * _752;
    if (!_558)
    {
        _730 = _560;
    }
    float _766 = _730;
    float _768 = sqrt(_714);
    if (!_566)
    {
        _650 = _734;
    }
    float _770 = _650;
    float _772 = _552 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _774 = _770;
    if (_566)
    {
        _758 = _654;
    }
    float _776 = _758;
    float _778 = _686 * _764;
    float _780 = _584 ? as_type<float>(_754) : _620;
    float _782 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _784 = _766 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _786 = as_type<int>(_782);
    if (_590)
    {
        float _788 = _612 ? _712 : _620;
        _732 = _788;
    }
    float _790 = _732;
    float _792 = fma(_780, _772, -0.5);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _796 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = fma(_782, _790, -0.5);
    float _800 = _682 * _736;
    float _802 = fma(_784, -2.0, _794);
    if (_566)
    {
        float _804 = -_776;
        float _806 = _804 + 1.0;
        _786 = as_type<int>(_806);
    }
    int _808 = _786;
    float _810 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _812 = _768 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _816 = _658 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _818 = _690 * _736;
    float _820 = -_800;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    if (_566)
    {
        float _824 = _762 ? as_type<float>(_808) : _776;
        _774 = _824;
    }
    float _826 = _774;
    int _828 = 0;
    if (_576)
    {
        float _830 = -_776;
        float _832 = _830 + 1.0;
        _828 = as_type<int>(_832);
    }
    int _834 = _828;
    float _836 = precise::min(_810, _812);
    float _838 = -_814;
    float _840 = fma(_816, 2.0, _838);
    float _842 = -_818;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _846 = _822 * _822;
    if (!_576)
    {
        _378 = _776;
    }
    float _848 = _378;
    float _850 = _800 * _836;
    float _852 = _848;
    float _854 = _850;
    if (_576)
    {
        float _856 = _612 ? as_type<float>(_834) : _776;
        _852 = _856;
    }
    float _858 = _852;
    float _860 = fma(_844, _844, _846);
    float _862 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _610);
    float _864 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _866 = _702 * _736;
    float _868 = _818 * _836;
    float _870 = -_850;
    float _872 = _682 + _870;
    float _874 = -_864;
    float _876 = fma(_862, _798, _874);
    float _878 = _866 * _836;
    float _880 = -_868;
    float _882 = _690 + _880;
    float _884 = _872 * _872;
    float _886 = -_866;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _702);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _892 = -_748;
    float _894 = _892 + 1.0;
    float _896 = fma(_882, _882, _884);
    float _898 = -_878;
    float _900 = _702 + _898;
    float _902 = _682 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _904 = fma(_888, _888, _860);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[131].x, _778);
    float _908 = fma(_900, _900, _896);
    float _910 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[28].x, _902);
    float _912 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _756);
    float _914 = _614 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _916 = sqrt(_904);
    float _918 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[28].z, _910);
    float _920 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _622);
    float _922 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _704);
    float _924 = -_148;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[86].x, _840);
    float _928 = _890 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _930 = _918 >= 0.0;
    float _932 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _802);
    float _934 = sqrt(_908);
    float _936 = fma(_914, _858, -0.5);
    float _938 = fma(_928, _826, -0.5);
    float _940 = -_932;
    float _942 = fma(_922, _792, _940);
    float _944 = fma(_912, _936, _926);
    float _946 = fma(_920, _938, _636);
    float _948 = _736 * _916;
    float _950 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[132].x, _906);
    float _952 = _876 + 0.5;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _956 = _942 + 0.5;
    float _958 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _960 = _946 + 0.5;
    float _962 = _736 * _934;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _966 = _934;
    float _968 = _868;
    if (_930)
    {
        _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _970 = _966;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _974 = _962 * _948;
    float _976 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _944 + 0.5;
    int _984 = as_type<int>(_970);
    if (_930)
    {
        float _986 = _970 * 5.0;
        _984 = as_type<int>(_986);
    }
    int _988 = _984;
    float _990 = _796 * _974;
    out.m_67.x = _960;
    out.m_67.y = _952;
    out.m_69.x = _976;
    out.m_69.y = _978;
    out.m_69.z = _980;
    out.m_69.w = _958;
    out.m_71.x = _982;
    out.m_71.y = _956;
    if (_930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4287 = as_type<float>(_988);
        out.gl_Position.z = _4287;
    }
    out.m_73.w = _836;
    if (_930)
    {
        out.m_49.x = 0.0;
    }
    out.m_75.x = _990;
    if (_930)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _992 = -_800;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _670);
    float _996 = -_818;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _662);
    float _1000 = -_866;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1018 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1016);
    float _1020 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1018);
    bool _1022 = _1020 >= 0.0;
    float _1024 = _1014;
    if (_1022)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1026 = _1024;
    int _1028 = as_type<int>(_1026);
    if (_1022)
    {
        out.m_49.x = 0.0;
    }
    if (_1022)
    {
        float _1030 = _1026 * 5.0;
        _1028 = as_type<int>(_1030);
    }
    int _1032 = _1028;
    if (_1022)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4382 = as_type<float>(_1032);
        out.gl_Position.z = _4382;
    }
    if (_1022)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1034 = -_670;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1038 = -_662;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1042 = -_694;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1046 = _1036 * _1036;
    float _1048 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1050 = fma(_1040, _1040, _1046);
    float _1052 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1054 = fma(_1044, _1044, _1050);
    float _1056 = -_1052;
    float _1058 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1056);
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1062 = rsqrt(_1054);
    float _1064 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1068 = -_1064;
    float _1070 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1068);
    float _1072 = -_1066;
    float _1074 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1072);
    float _1076 = _1040 * _1062;
    float _1078 = _1044 * _1062;
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1082 = _1036 * _1062;
    float _1084 = _1076 * _1076;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1088 = -_1080;
    float _1090 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1092 = fma(_1078, _1078, _1084);
    float _1094 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1096 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1098 = rsqrt(_1092);
    float _1100 = -_1094;
    float _1102 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1100);
    float _1104 = -_1096;
    float _1106 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1104);
    float _1108 = -_1060;
    float _1110 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1108);
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1114 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1116 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1090);
    float _1118 = -_1112;
    float _1120 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1122 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1124 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1126 = -_1114;
    float _1128 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1126);
    float _1130 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1120);
    float _1132 = -_1122;
    float _1134 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1132);
    float _1136 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1128);
    float _1138 = _1078 * _1098;
    float _1140 = _1076 * _1098;
    float _1142 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1134);
    float _1144 = -_1138;
    float _1146 = _1078 * _1144;
    float _1148 = -_1138;
    float _1150 = _1082 * _1148;
    float _1152 = -_1124;
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1152);
    float _1156 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1146;
    float _1160 = fma(_1076, _1140, _1158);
    float _1162 = _1082 * _1140;
    float _1164 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1166 = -_1156;
    float _1168 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1170 = _1160 * _1160;
    float _1172 = -_1086;
    float _1174 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1172);
    float _1176 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1178 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1180 = fma(_1162, _1162, _1170);
    float _1182 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1174);
    float _1184 = -_1176;
    float _1186 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1184);
    float _1188 = -_1178;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1164);
    float _1192 = fma(_1150, _1150, _1180);
    float _1194 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1186);
    float _1196 = 1.0 / _1190;
    float _1198 = rsqrt(_1192);
    float _1200 = fma(_1182, _1196, -1.0);
    float _1202 = _1160 * _1198;
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = -_1204;
    float _1208 = _1206 + 1.0;
    float _1210 = _1208 * _1196;
    float _1212 = fma(_1208, _1200, 1.0);
    float _1214 = _1194 * _1210;
    float _1216 = _1212 * _1212;
    float _1218 = _1136 * _1210;
    float _1220 = fma(_1214, _1214, _1216);
    float _1222 = fma(_1218, _1218, _1220);
    float _1224 = rsqrt(_1222);
    float _1226 = _1218 * _1224;
    float _1228 = _1214 * _1224;
    float _1230 = _1212 * _1224;
    float _1232 = -_1226;
    float _1234 = _1076 * _1232;
    float _1236 = _1078 * _1230;
    float _1238 = -_1228;
    float _1240 = -_1234;
    float _1242 = fma(_1078, _1238, _1240);
    float _1244 = -_1228;
    float _1246 = _1082 * _1244;
    float _1248 = -_1226;
    float _1250 = -_1236;
    float _1252 = fma(_1082, _1248, _1250);
    float _1254 = _1242 * _1242;
    float _1256 = -_1246;
    float _1258 = fma(_1076, _1230, _1256);
    float _1260 = fma(_1252, _1252, _1254);
    float _1262 = fma(_1258, _1258, _1260);
    float _1264 = rsqrt(_1262);
    float _1266 = _1252 * _1264;
    float _1268 = _1258 * _1264;
    float _1270 = _1242 * _1264;
    float _1272 = _1078 * _1266;
    float _1274 = _1082 * _1268;
    float _1276 = -_1272;
    float _1278 = fma(_1076, _1268, _1276);
    float _1280 = _1076 * _1270;
    float _1282 = -_1274;
    float _1284 = fma(_1078, _1270, _1282);
    float _1286 = _1278 * _1278;
    float _1288 = -_1280;
    float _1290 = fma(_1082, _1266, _1288);
    float _1292 = fma(_1284, _1284, _1286);
    float _1294 = fma(_1290, _1290, _1292);
    float _1296 = rsqrt(_1294);
    float _1298 = _1290 * _1296;
    float _1300 = _1278 * _1296;
    float _1302 = _1284 * _1296;
    float _1304 = _1076 * _1298;
    float _1306 = _1078 * _1300;
    float _1308 = in.m_77.x;
    float _1310 = in.m_77.y;
    float _1312 = in.m_77.z;
    float _1314 = -_1304;
    float _1316 = fma(_1078, _1302, _1314);
    float _1318 = -_1306;
    float _1320 = fma(_1082, _1298, _1318);
    float _1322 = _1082 * _1302;
    float _1324 = _1316 * _1316;
    float _1326 = -_1322;
    float _1328 = fma(_1076, _1300, _1326);
    float _1330 = fma(_1320, _1320, _1324);
    float _1332 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1334 = fma(_1328, _1328, _1330);
    float _1336 = _1332 * _974;
    float _1338 = _1048 * _974;
    float _1340 = rsqrt(_1334);
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1308);
    float _1346 = _1336 * _1342;
    float _1348 = _990 * _1344;
    float _1350 = -_878;
    float _1352 = _694 + _1350;
    float _1354 = _1346 * _1298;
    float _1356 = _1346 * _1302;
    float _1358 = _1328 * _1340;
    float _1360 = _1338 * _1312;
    float _1362 = _1320 * _1340;
    float _1364 = _1316 * _1340;
    float _1366 = fma(_1348, _1358, _1354);
    float _1368 = -_850;
    float _1370 = _670 + _1368;
    float _1372 = fma(_1348, _1362, _1356);
    float _1374 = fma(_1360, _1078, _1366);
    float _1376 = fma(_1360, _1076, _1372);
    float _1378 = _694 + _1374;
    float _1380 = -_800;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1370);
    float _1384 = _662 + _1376;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1388 = _1378 + _1386;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1394 = _1384 + _1392;
    float _1396 = _1388 * _1388;
    float _1398 = fma(_1394, _1394, _1396);
    float _1400 = _1346 * _1300;
    float _1402 = -_868;
    float _1404 = _662 + _1402;
    float _1406 = sqrt(_1398);
    float _1408 = fma(_1348, _1364, _1400);
    float _1410 = -_818;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1414 = fma(_1360, _1082, _1408);
    float _1416 = -_866;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1352);
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1390);
    float _1422 = _670 + _1414;
    float _1424 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1420);
    bool _1426 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1414;
    float _1430 = _1340;
    float _1432 = _1384;
    float _1434 = _1370;
    float _1436 = _1382;
    float _1438 = _1412;
    float _1440 = _1078;
    if (!_1426)
    {
        _1428 = _1384;
    }
    float _1442 = _1428;
    float _1444 = _1442;
    if (!_1426)
    {
        _1430 = _1378;
    }
    float _1446 = _1430;
    float _1448 = _1446;
    if (!_1426)
    {
        _1432 = _1422;
    }
    float _1450 = _1432;
    bool _1452 = !_1426;
    float _1454 = _1450;
    if (!_1452)
    {
        float _1456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1460 = _1406 + _1458;
        float _1462 = rsqrt(_1398);
        float _1464 = _1460 * _1456;
        float _1466 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1468 = _1464 * 0.15915493667125701904296875;
        float _1470 = _1468 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = _1468 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1472 + (-1.0);
        float _1480 = fma(_1476, _1466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1482 = _1478 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = _1462 * _1480;
        float _1486 = fma(_1422, _1472, _1482);
        float _1488 = fma(_1394, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1490 = fma(_1388, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1454 = _1486;
        _1444 = _1488;
        _1448 = _1490;
    }
    float _1492 = _1454;
    float _1494 = _1444;
    float _1496 = _1448;
    float _1498 = -_670;
    float _1500 = _1498 + _1492;
    float _1502 = -_662;
    float _1504 = _1502 + _1494;
    float _1506 = -_694;
    float _1508 = _1506 + _1496;
    float _1510 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1512 = _1500 * _1500;
    float _1514 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1516 = 1.0 / _1510;
    float _1518 = fma(_1504, _1504, _1512);
    float _1520 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1514);
    float _1522 = -_878;
    float _1524 = _1522 + _1496;
    float _1526 = fma(_1508, _1508, _1518);
    float _1528 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1520);
    float _1530 = sqrt(_1526);
    float _1532 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1534 = _1532 + _1510;
    float _1536 = _1534 * _1516;
    float _1538 = _1536 * 0.5;
    bool _1540 = _1530 > 0.0;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1544 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1542);
    bool _1546 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.5);
    bool _1554 = _1550 || _1552;
    float _1556 = 1.0 / _1544;
    bool _1558 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan(0.5);
    bool _1566 = _1562 || _1564;
    float _1568 = -_868;
    float _1570 = _1568 + _1494;
    float _1572 = -_850;
    float _1574 = _1572 + _1492;
    float _1576 = _1524;
    float _1578 = _1570;
    float _1580 = _1574;
    if (!_1540)
    {
        _854 = _1570;
    }
    float _1582 = _854;
    float _1584 = _1582;
    if (!_1540)
    {
        _968 = _1574;
    }
    float _1586 = _968;
    bool _1588 = !_1540;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = _190 * _190;
        float _1594 = rsqrt(_1526);
        float _1596 = fma(_188, _188, _1592);
        float _1598 = fma(_192, _192, _1596);
        float _1600 = sqrt(_1598);
        float _1602 = _1504 * _1594;
        float _1604 = _1500 * _1594;
        float _1606 = _1508 * _1594;
        bool _1608 = _1600 > 0.0;
        float _1610 = _1594;
        float _1612 = _1600;
        if (!_1608)
        {
            _1610 = _1570;
        }
        float _1614 = _1610;
        _1584 = _1614;
        if (!_1608)
        {
            _1612 = _1574;
        }
        float _1616 = _1612;
        bool _1618 = !_1608;
        _1590 = _1616;
        if (!_1618)
        {
            float _1620 = rsqrt(_1598);
            float _1622 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1624 = _190 * _1620;
            float _1626 = _188 * _1620;
            float _1628 = _192 * _1620;
            float _1630 = _1604 * _1624;
            float _1632 = fma(_1602, _1626, _1630);
            float _1634 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1636 = fma(_1606, _1628, _1632);
            float _1638 = _1636 * _1634;
            float _1640 = fma(_188, _1638, _1570);
            float _1642 = fma(_190, _1638, _1574);
            float _1644 = fma(_192, _1638, _1524);
            _1584 = _1640;
            _1590 = _1642;
            _1576 = _1644;
        }
    }
    float _1646 = _1584;
    float _1648 = _1590;
    float _1650 = _1576;
    float _1652 = -_818;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1646);
    float _1656 = -_800;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1648);
    float _1660 = -_866;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1650);
    float _1664 = _1658;
    float _1666 = _1654;
    float _1668 = _1662;
    if (_1566)
    {
        _196 = 1.0;
    }
    float _1670 = _196;
    float _1672 = _1670;
    if (!_1554)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1676 = _1382 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1680 = _1412 + _1678;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _1684 = -_1352;
        float _1686 = _1684 + _1650;
        float _1688 = _1676 * _1676;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1692 = _1418 + _1690;
        float _1694 = -_1404;
        float _1696 = _1694 + _1646;
        float _1698 = -_1370;
        float _1700 = _1698 + _1648;
        float _1702 = fma(_1680, _1680, _1688);
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1706 = fma(_1692, _1692, _1702);
        float _1708 = sqrt(_1706);
        float _1710 = 1.0 / _948;
        float _1712 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1714 = precise::max(_1708, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _1716 = _1714 * _1682;
        float _1718 = _1716 * _1710;
        float _1720 = _1712 * _1718;
        float _1722 = _1686 * _1718;
        float _1724 = fma(_1696, _1720, _1412);
        float _1726 = fma(_1700, _1720, _1382);
        float _1728 = fma(_1712, _1722, _1418);
        _1434 = _1700;
        _1664 = _1726;
        _1666 = _1724;
        _1668 = _1728;
    }
    float _1730 = _1434;
    float _1732 = _1664;
    float _1734 = _1666;
    float _1736 = _1668;
    float _1738 = _1730;
    if (_1566)
    {
        _1578 = 1.0;
    }
    float _1740 = _1578;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1744 = _1556 * _1742;
    float _1746 = _1740;
    if (!_1566)
    {
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1752 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1750;
        float _1754 = _1748 * 0.15915493667125701904296875;
        float _1756 = _1754 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        float _1760 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1762 = _1760 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1758;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = _1762 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1772 * _1774;
        float _1782 = 1.0 / _1752;
        float _1784 = 1.0 / _1780;
        float _1786 = _1778 * _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1790 = fma(_1744, _1786, _1788);
        float _1792 = _1790 * _1782;
        float _1794 = precise::clamp(_1792, 0.0, 1.0);
        _1738 = _1762;
        _1672 = _1794;
    }
    float _1796 = _1738;
    float _1798 = _1672;
    float _1800 = _1796;
    if (!_1566)
    {
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1804 * 6.283185482025146484375;
        float _1808 = cos(_1806);
        float _1810 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1812 = _1810 * 0.15915493667125701904296875;
        float _1814 = _1804 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        float _1818 = 1.0 / _1808;
        float _1820 = _1812 * 6.283185482025146484375;
        float _1822 = cos(_1820);
        float _1824 = _1816 * _1818;
        float _1826 = _1812 * 6.283185482025146484375;
        float _1828 = sin(_1826);
        float _1830 = _1822 * _1824;
        float _1832 = 1.0 / _1830;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1836 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1834;
        float _1838 = 1.0 / _1836;
        float _1840 = _1828 * _1832;
        float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1844 = fma(_1744, _1840, _1842);
        float _1846 = _1844 * _1838;
        float _1848 = precise::clamp(_1846, 0.0, 1.0);
        float _1850 = -_1848;
        float _1852 = _1850 + 1.0;
        _1800 = _1818;
        _1746 = _1852;
    }
    float _1854 = _1800;
    float _1856 = _1746;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1860 = _1732 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1864 = _1734 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1736 + _1866;
    float _1870 = _1860 * _1860;
    float _1872 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = fma(_1864, _1864, _1870);
    float _1876 = fma(_1868, _1868, _1874);
    float _1878 = rsqrt(_1876);
    float _1880 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1864 * _1880;
    float _1884 = _1868 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1878;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1854;
    float _1908 = _1860;
    float _1910 = _1882;
    if (_1894)
    {
        float _1912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1912;
    }
    float _1914 = _1900;
    if (_1894)
    {
        float _1916 = rsqrt(_1890);
        _1902 = _1916;
    }
    float _1918 = _1902;
    float _1920 = _1918;
    if (_1894)
    {
        float _1922 = _1898 * _1914;
        _1904 = _1922;
    }
    float _1924 = _1904;
    if (_1894)
    {
        float _1926 = _1924 * 0.15915493667125701904296875;
        _1906 = _1926;
    }
    float _1928 = _1906;
    float _1930 = _1914;
    float _1932 = _1928;
    if (_1894)
    {
        float _1934 = _1928 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1930 = _1936;
    }
    float _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1868;
    float _1946 = _1942;
    if (_1894)
    {
        float _1948 = _1928 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1944 = _1950;
    }
    float _1952 = _1944;
    float _1954 = -_1880;
    float _1956 = -_1942;
    float _1958 = fma(_1860, _1954, _1956);
    float _1960 = _1958;
    if (_1894)
    {
        float _1962 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1962;
    }
    float _1964 = _1946;
    if (!_1894)
    {
        _1932 = _1888;
    }
    float _1966 = _1932;
    float _1968 = _1938;
    float _1970 = _1966;
    if (_1894)
    {
        float _1972 = fma(_1938, _1964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = sqrt(_1876);
    float _1978 = _1974;
    if (_1894)
    {
        float _1980 = _1952 + (-1.0);
        _1908 = _1980;
    }
    float _1982 = _1908;
    float _1984 = _1982;
    if (_1894)
    {
        float _1986 = _1918 * _1974;
        _1580 = _1986;
    }
    float _1988 = _1580;
    if (!_1894)
    {
        _1920 = _1884;
    }
    float _1990 = _1920;
    float _1992 = _1990;
    if (_1894)
    {
        float _1994 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1994;
    }
    float _1996 = _1984;
    if (_1894)
    {
        float _1998 = _1882 * _1988;
        _1910 = _1998;
    }
    float _2000 = _1910;
    if (!_1894)
    {
        _1978 = _1886;
    }
    float _2002 = _1978;
    float _2004 = _2002;
    if (_1894)
    {
        float _2006 = _1884 * _1988;
        _1992 = _2006;
    }
    float _2008 = _1992;
    if (_1894)
    {
        float _2010 = fma(_1958, _1952, _1996);
        _1960 = _2010;
    }
    float _2012 = _1960;
    if (_1894)
    {
        float _2014 = _2000 * _2000;
        _2004 = _2014;
    }
    float _2016 = _2004;
    float _2018 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1894)
    {
        float _2020 = _2008 * _2008;
        _1970 = _2020;
    }
    float _2022 = _1970;
    float _2024 = fma(_2012, _2012, _2016);
    float _2026 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2018);
    float _2028 = _2024 + _2022;
    float _2030 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2032 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2028);
    float _2042 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2026);
    float _2044 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2032);
    float _2046 = -_2038;
    float _2048 = _2046 + 1.0;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2052 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2044);
    float _2054 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2056 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2058 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2060 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2062 = abs(_2048);
    float _2064 = log2(_2062);
    float _2066 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2058);
    float _2068 = -_2060;
    float _2070 = fma(_2068, _2056, 1.0);
    float _2072 = _2040 * _2000;
    float _2074 = _2040 * _2012;
    float _2076 = _2040 * _2008;
    float _2078 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _2080 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2066);
    float _2082 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2084 = floor(_2054);
    float _2086 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2092 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2078);
    float _2094 = -_2086;
    float _2096 = fma(_2074, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2094);
    float _2098 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2100 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2090);
    float _2102 = floor(_2030);
    float _2104 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2106 = -_2076;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2096);
    float _2110 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2112 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2114 = _2074 + 1.0;
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2118 = log2(_2070);
    float _2120 = -_2084;
    float _2122 = _2054 + _2120;
    float _2124 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2128 = exp2(_2098);
    float _2130 = fma(_2108, -0.5, 0.5);
    float _2132 = -_2102;
    float _2134 = _2030 + _2132;
    float _2136 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2112);
    float _2138 = fma(_2108, 0.5, 0.5);
    float _2140 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2126);
    float _2142 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2136);
    float _2144 = 1.0 / _2116;
    float _2146 = fma(_2138, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2148 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2150 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2152 = _2118 * 0.693147182464599609375;
    float _2154 = fma(_2138, _2146, -0.212114393711090087890625);
    float _2156 = sqrt(_2130);
    float _2158 = -_2074;
    float _2160 = fma(_2128, _2114, _2158);
    float2 _6176 = float2(_2122, _2134);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6176, float2(0.0), isnan(_6176)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6176, float2(0.0), isnan(_6176)), level(0.0)).x;
    float _2164 = fma(_2138, _2154, 1.570728778839111328125);
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = fma(_2160, 0.5, 0.5);
    float _2170 = _2148 * _2144;
    float _2172 = _2150 * _2144;
    float _2174 = fma(_2170, 0.5, 0.5);
    float _2176 = fma(_2172, -0.5, 0.5);
    float _2178 = _2156 * 0.636619746685028076171875;
    float3 _6210 = float3(_2174, _2176, _2166);
    float _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).x;
    float _2182 = -_2164;
    float _2184 = fma(_2178, _2182, 1.0);
    float3 _6226 = float3(_2174, _2176, _2166);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6226, float3(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6226, float3(0.0), isnan(_6226)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float2 _6242 = float2(_2184, _2168);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6242, float2(0.0), isnan(_6242)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6242, float2(0.0), isnan(_6242)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = abs(_1744);
    float _2209 = log2(_2207);
    bool _2211 = _1310 != 0.0;
    bool _2213 = isnan(_1310);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan(0.0);
    bool _2219 = _2215 || _2217;
    float _2221 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1734;
    out.m_79.y = _1732;
    out.m_79.z = _1736;
    bool _2223 = _1308 == 0.0;
    bool _2225 = !_2219;
    bool _2227 = _2223 && _2225;
    float _2229 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2221);
    bool _2231 = _1312 == 0.0;
    bool _2233 = _2231 && _2227;
    float _2235 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2229);
    bool _2237 = _1744 <= 8000.0;
    bool _2239 = isnan(_1744);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(8000.0);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    out.m_81.x = _1412;
    out.m_81.y = _1382;
    out.m_81.z = _1418;
    float _2249 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2251 = in.m_83.x;
    float _2253 = in.m_83.y;
    float _2255 = in.m_83.z;
    float _2257 = exp2(_2249);
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2261 = precise::clamp(_2259, 0.0, 1.0);
    float _2263 = _2253;
    float _2265 = _2255;
    float _2267 = _2251;
    if (!_2233)
    {
        float _2269 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2253);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2275 = fma(_2261, -2.0, 3.0);
    float _2277 = _2261 * _2261;
    if (!_2233)
    {
        float _2279 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2255);
        _2265 = _2279;
    }
    float _2281 = _2265;
    if (!_2233)
    {
        float _2283 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2251);
        _2267 = _2283;
    }
    float _2285 = _2267;
    float _2287 = in.m_85.x;
    float _2289 = _2277 * _2275;
    float _2291 = exp2(_2273);
    float _2293 = _1300 * _2271;
    float _2295 = _2116 * 0.5;
    float _2297 = -_2289;
    float _2299 = _2297 + 1.0;
    float _2301 = _1302 * _2271;
    float _2303 = fma(_1364, _2285, _2293);
    float _2305 = _1298 * _2271;
    float _2307 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2289);
    float _2309 = fma(_2150, -0.5, _2295);
    float _2311 = fma(_1082, _2281, _2303);
    float _2313 = _2247 * _2307;
    float _2315 = fma(_1362, _2285, _2301);
    float _2317 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2235);
    float _2319 = fma(_1358, _2285, _2305);
    float _2321 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2323 = -_2291;
    float _2325 = _2323 + 1.0;
    float _2327 = fma(_1076, _2281, _2315);
    float _2329 = _2317 + _2116;
    float _2331 = _2148 + _2116;
    float _2333 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2335 = _2329 * 0.5;
    float _2337 = _2331 * 0.5;
    float _2339 = fma(_1078, _2281, _2319);
    bool _2341 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2343 = isnan(_1976);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2349 = _2345 || _2347;
    out.gl_Position.x = _2148;
    out.gl_Position.y = _2150;
    out.gl_Position.z = _2317;
    out.gl_Position.w = _2116;
    out.m_87.x = _2337;
    out.m_87.y = _2309;
    out.m_87.z = _2335;
    out.m_87.w = _2116;
    out.m_89.x = _2327;
    out.m_89.y = _2311;
    out.m_89.z = _2339;
    if (!_2349)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2351 = _1436;
    float _2353 = _2351;
    float _2355 = _2351;
    if (!_2349)
    {
        _1438 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2357 = _1438;
    float _2359 = _2357;
    float _2361 = _2357;
    if (!_2349)
    {
        _1440 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2363 = _1440;
    float _2365 = -_2162;
    float _2367 = _2365 + 1.0;
    float _2369 = _2367 * _2321;
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = -_2371;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2377 = _2375 * _2287;
    float _2379 = _2287;
    float _2381 = _2363;
    float _2383 = _2363;
    if (!_2349)
    {
        _2379 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2385 = _2379;
    float _2387 = _2333 * _2180;
    float _2389 = -_2333;
    float _2391 = _2389 + 1.0;
    float _2393 = _2377 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2395 = _2195 * _2387;
    float _2397 = _2195 * _2391;
    out.m_91.x = _2393;
    float _2399 = _1798 * _1856;
    float _2401 = _2205 * _2387;
    float _2403 = fma(_2201, _2395, _2189);
    float _2405 = fma(_2203, _2395, _2191);
    float _2407 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2409 = fma(_2195, _2401, _2193);
    float _2411 = _2395;
    float _2413 = _2399;
    float _2415 = _2385;
    float _2417 = _2385;
    if (!_2349)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2419 = _2411;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2349)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2425 = _2413;
    out.m_93.x = _2403;
    out.m_93.y = _2405;
    out.m_93.z = _2409;
    out.m_93.w = _2397;
    bool _2427 = !_2349;
    float _2429 = _2425;
    float _2431 = _2425;
    if (!_2427)
    {
        bool _2433 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2435 = isnan(_1976);
        bool _2437 = _2433 || _2435;
        bool _2439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2441 = _2437 || _2439;
        if (!_2441)
        {
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2445 = _1976 + _2443;
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2449 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2447;
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2455 = 1.0 / _2449;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2473 = _2445 * _2455;
            float _2475 = precise::clamp(_2473, 0.0, 1.0);
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2481 = fma(_2475, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2483 = fma(_2475, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2485 = fma(_2475, _2459, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2487 = fma(_2475, _2463, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2489 = fma(_2475, _2467, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2491 = fma(_2475, _2471, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2361 = _2485;
            _2423 = _2489;
            _2355 = _2481;
            _2417 = _2487;
            _2383 = _2483;
            _2431 = _2491;
            _2493 = true;
        }
        else
        {
            bool _2495 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2497 = isnan(_1976);
            bool _2499 = _2495 || _2497;
            bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2503 = _2499 || _2501;
            if (!_2503)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2505 = _2353;
            _2355 = _2505;
            if (!_2503)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2507 = _2359;
            _2361 = _2507;
            if (!_2503)
            {
                _2381 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2509 = _2381;
            _2383 = _2509;
            if (!_2503)
            {
                _2415 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2511 = _2415;
            _2417 = _2511;
            if (!_2503)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2513 = _2421;
            _2423 = _2513;
            if (!_2503)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2515 = _2429;
            bool _2517 = !_2503;
            _2431 = _2515;
            if (!_2517)
            {
                bool _2519 = _1976 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2521 = isnan(_1976);
                bool _2523 = _2519 || _2521;
                bool _2525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2527 = _2523 || _2525;
                if (!_2527)
                {
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2531 = _1976 + _2529;
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2535 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2533;
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2541 = 1.0 / _2535;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2559 = _2531 * _2541;
                    float _2561 = precise::clamp(_2559, 0.0, 1.0);
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2567 = fma(_2561, _2539, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2569 = fma(_2561, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2571 = fma(_2561, _2545, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2573 = fma(_2561, _2549, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2575 = fma(_2561, _2553, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2577 = fma(_2561, _2557, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2361 = _2571;
                    _2423 = _2575;
                    _2355 = _2567;
                    _2417 = _2573;
                    _2383 = _2569;
                    _2431 = _2577;
                    _2493 = true;
                }
                else
                {
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2417 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2383 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2493 = false;
    float _2579 = _2361;
    float _2581 = _2423;
    float _2583 = _2355;
    float _2585 = _2417;
    float _2587 = _2383;
    float _2589 = _2431;
    float _2591 = fma(_2311, -0.5, 0.5);
    float _2593 = precise::clamp(_2591, 0.0, 1.0);
    float _2595 = -_2579;
    float _2597 = _2595 + _2581;
    float _2599 = -_2583;
    float _2601 = _2599 + _2585;
    out.m_95.x = 0.0;
    float _2603 = fma(_2593, _2597, _2579);
    float _2605 = -_2587;
    float _2607 = _2605 + _2589;
    float _2609 = fma(_2593, _2601, _2583);
    float _2611 = _2603 * 0.586610972881317138671875;
    bool _2613 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2615 = fma(_2593, _2607, _2587);
    float _2617 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2619 = fma(_2609, 0.298911988735198974609375, _2611);
    bool _2621 = _1798 > 0.0;
    bool _2623 = isnan(_1798);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan(0.0);
    bool _2629 = _2625 || _2627;
    float _2631 = fma(_2615, 0.114477999508380889892578125, _2619);
    out.m_49.x = _2617;
    bool _2633 = _1856 <= 0.0;
    bool _2635 = !_2629;
    bool _2637 = _2633 || _2635;
    float _2639 = -_2631;
    float _2641 = _2609 + _2639;
    float _2643 = -_2631;
    float _2645 = _2603 + _2643;
    float _2647 = -_2631;
    float _2649 = _2615 + _2647;
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    float _2653 = fma(_2645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    float _2655 = fma(_2649, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2631);
    bool _2657 = !_2613;
    if (!_2657)
    {
        float _2659 = -_1732;
        float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2663 = -_1734;
        float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2667 = -_1736;
        float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2671 = _2661 * _2661;
        float _2673 = fma(_2665, _2665, _2671);
        float _2675 = fma(_2669, _2669, _2673);
        float _2677 = sqrt(_2675);
        float _2679 = rsqrt(_2675);
        float _2681 = -_2677;
        float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2687 = precise::clamp(_2685, 0.0, 1.0);
        float _2689 = _2665 * _2679;
        float _2691 = _2661 * _2679;
        float _2693 = abs(_2687);
        float _2695 = log2(_2693);
        float _2697 = _2669 * _2679;
        float _2699 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2701 = _2311 * _2691;
        float _2703 = -_2691;
        float _2705 = -_2699;
        float _2707 = fma(_2703, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2705);
        float _2709 = fma(_2327, _2689, _2701);
        float _2711 = -_2697;
        float _2713 = fma(_2711, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2707);
        float _2715 = fma(_2339, _2697, _2709);
        float _2717 = precise::clamp(_2715, 0.0, 1.0);
        float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2721 = _2713 + _2719;
        float _2723 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2725 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2727 = precise::clamp(_2725, 0.0, 1.0);
        float _2729 = exp2(_2723);
        float _2731 = _2729 * _2727;
        float _2733 = _2717 * _2731;
        float _2735 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2737 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2739 = _2733 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2735;
        out.m_95.y = _2737;
        out.m_95.z = _2739;
    }
    out.m_73.x = _2651;
    out.m_73.y = _2653;
    out.m_73.z = _2655;
    if (!_2637)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2741 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2741;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

