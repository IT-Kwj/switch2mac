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
    bool _2563 = false;
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
        float _2868 = as_type<float>(_130);
        out.gl_Position.z = _2868;
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
        float _2937 = as_type<float>(_166);
        out.gl_Position.z = _2937;
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
        float _4357 = as_type<float>(_988);
        out.gl_Position.z = _4357;
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
        float _4452 = as_type<float>(_1032);
        out.gl_Position.z = _4452;
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
    float _1522 = fma(_1508, _1508, _1518);
    float _1524 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1520);
    float _1526 = sqrt(_1522);
    float _1528 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1530 = _1528 + _1510;
    float _1532 = _1530 * _1516;
    float _1534 = _1532 * 0.5;
    bool _1536 = _1526 > 0.0;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1540 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
    bool _1542 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan(0.5);
    bool _1550 = _1546 || _1548;
    float _1552 = 1.0 / _1540;
    bool _1554 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(0.5);
    bool _1562 = _1558 || _1560;
    float _1564 = -_850;
    float _1566 = _1564 + _1492;
    float _1568 = -_868;
    float _1570 = _1568 + _1494;
    float _1572 = -_878;
    float _1574 = _1572 + _1496;
    float _1576 = _1496;
    float _1578 = _1570;
    float _1580 = _1566;
    if (!_1536)
    {
        _1576 = _1566;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    float _1586 = _1582;
    if (!_1536)
    {
        _854 = _1570;
    }
    float _1588 = _854;
    float _1590 = _1588;
    if (!_1536)
    {
        _968 = _1574;
    }
    float _1592 = _968;
    bool _1594 = !_1536;
    float _1596 = _1592;
    if (!_1594)
    {
        float _1598 = _190 * _190;
        float _1600 = rsqrt(_1522);
        float _1602 = fma(_188, _188, _1598);
        float _1604 = fma(_192, _192, _1602);
        float _1606 = sqrt(_1604);
        float _1608 = _1504 * _1600;
        float _1610 = _1500 * _1600;
        float _1612 = _1508 * _1600;
        bool _1614 = _1606 > 0.0;
        float _1616 = _1600;
        float _1618 = _1606;
        if (!_1614)
        {
            _1616 = _1570;
        }
        float _1620 = _1616;
        _1590 = _1620;
        if (!_1614)
        {
            _1584 = _1566;
        }
        float _1622 = _1584;
        _1586 = _1622;
        if (!_1614)
        {
            _1618 = _1574;
        }
        float _1624 = _1618;
        bool _1626 = !_1614;
        _1596 = _1624;
        if (!_1626)
        {
            float _1628 = rsqrt(_1604);
            float _1630 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1632 = _190 * _1628;
            float _1634 = _188 * _1628;
            float _1636 = _192 * _1628;
            float _1638 = _1610 * _1632;
            float _1640 = fma(_1608, _1634, _1638);
            float _1642 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1644 = fma(_1612, _1636, _1640);
            float _1646 = _1644 * _1642;
            float _1648 = fma(_188, _1646, _1570);
            float _1650 = fma(_190, _1646, _1566);
            float _1652 = fma(_192, _1646, _1574);
            _1590 = _1648;
            _1586 = _1650;
            _1596 = _1652;
        }
    }
    float _1654 = _1590;
    float _1656 = _1586;
    float _1658 = _1596;
    float _1660 = -_818;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1654);
    float _1664 = -_800;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _1668 = -_866;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1672 = _1666;
    float _1674 = _1662;
    float _1676 = _1670;
    if (_1562)
    {
        _196 = 1.0;
    }
    float _1678 = _196;
    float _1680 = _1678;
    if (!_1550)
    {
        float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1684 = _1382 + _1682;
        float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1688 = _1412 + _1686;
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1692 = -_1404;
        float _1694 = _1692 + _1654;
        float _1696 = _1684 * _1684;
        float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1700 = _1418 + _1698;
        float _1702 = -_1370;
        float _1704 = _1702 + _1656;
        float _1706 = -_1352;
        float _1708 = _1706 + _1658;
        float _1710 = fma(_1688, _1688, _1696);
        float _1712 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1714 = fma(_1700, _1700, _1710);
        float _1716 = sqrt(_1714);
        float _1718 = 1.0 / _948;
        bool _1720 = _1716 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1722 = isnan(_1716);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1728 = _1724 || _1726;
        float _1730 = precise::min(_1716, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1732 = _1730 * _1690;
        float _1734 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1736 = _1694 * _1718;
        float _1738 = _1704 * _1718;
        float _1740 = _1708 * _1718;
        float _1742 = _1734 * _1732;
        float _1744 = _866;
        float _1746 = _1716;
        float _1748 = _1734;
        _1434 = _1738;
        if (_1728)
        {
            float _1750 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1744 = _1750;
        }
        float _1752 = _1744;
        if (_1728)
        {
            float _1754 = precise::max(_1716, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1746 = _1754;
        }
        float _1756 = _1746;
        float _1758 = fma(_1736, _1742, _1412);
        float _1760 = fma(_1738, _1742, _1382);
        float _1762 = fma(_1740, _1742, _1418);
        float _1764 = _1756;
        float _1766 = _1752;
        float _1768 = _1758;
        if (_1728)
        {
            float _1770 = _1756 * _1752;
            _1764 = _1770;
        }
        float _1772 = _1764;
        float _1774 = _1772;
        if (_1728)
        {
            float _1776 = _1734 * _1772;
            _1766 = _1776;
        }
        float _1778 = _1766;
        if (!_1728)
        {
            _1774 = _1758;
        }
        float _1780 = _1774;
        float _1782 = _1780;
        if (!_1728)
        {
            _1748 = _1760;
        }
        float _1784 = _1748;
        float _1786 = _1784;
        if (_1728)
        {
            float _1788 = fma(_1736, _1778, _1412);
            _1782 = _1788;
        }
        float _1790 = _1782;
        _1674 = _1790;
        if (!_1728)
        {
            _1768 = _1762;
        }
        float _1792 = _1768;
        _1676 = _1792;
        if (_1728)
        {
            float _1794 = fma(_1738, _1778, _1382);
            _1786 = _1794;
        }
        float _1796 = _1786;
        _1672 = _1796;
        if (_1728)
        {
            float _1798 = fma(_1740, _1778, _1418);
            _1676 = _1798;
        }
    }
    float _1800 = _1434;
    float _1802 = _1672;
    float _1804 = _1674;
    float _1806 = _1676;
    float _1808 = _1800;
    if (_1562)
    {
        _1578 = 1.0;
    }
    float _1810 = _1578;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1814 = _1552 * _1812;
    float _1816 = _1810;
    if (!_1562)
    {
        float _1818 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1820;
        float _1824 = _1818 * 0.15915493667125701904296875;
        float _1826 = _1824 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        float _1830 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1832 = _1830 * 0.15915493667125701904296875;
        float _1834 = _1824 * 6.283185482025146484375;
        float _1836 = sin(_1834);
        float _1838 = 1.0 / _1828;
        float _1840 = _1832 * 6.283185482025146484375;
        float _1842 = cos(_1840);
        float _1844 = _1836 * _1838;
        float _1846 = _1832 * 6.283185482025146484375;
        float _1848 = sin(_1846);
        float _1850 = _1842 * _1844;
        float _1852 = 1.0 / _1822;
        float _1854 = 1.0 / _1850;
        float _1856 = _1848 * _1854;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = fma(_1814, _1856, _1858);
        float _1862 = _1860 * _1852;
        float _1864 = precise::clamp(_1862, 0.0, 1.0);
        _1808 = _1832;
        _1680 = _1864;
    }
    float _1866 = _1808;
    float _1868 = _1680;
    float _1870 = _1866;
    if (!_1562)
    {
        float _1872 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1874 = _1872 * 0.15915493667125701904296875;
        float _1876 = _1874 * 6.283185482025146484375;
        float _1878 = cos(_1876);
        float _1880 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1882 = _1880 * 0.15915493667125701904296875;
        float _1884 = _1874 * 6.283185482025146484375;
        float _1886 = sin(_1884);
        float _1888 = 1.0 / _1878;
        float _1890 = _1882 * 6.283185482025146484375;
        float _1892 = cos(_1890);
        float _1894 = _1886 * _1888;
        float _1896 = _1882 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        float _1900 = _1892 * _1894;
        float _1902 = 1.0 / _1900;
        float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1906 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1904;
        float _1908 = 1.0 / _1906;
        float _1910 = _1898 * _1902;
        float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1914 = fma(_1814, _1910, _1912);
        float _1916 = _1914 * _1908;
        float _1918 = precise::clamp(_1916, 0.0, 1.0);
        float _1920 = -_1918;
        float _1922 = _1920 + 1.0;
        _1870 = _1888;
        _1816 = _1922;
    }
    float _1924 = _1870;
    float _1926 = _1816;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1930 = _1802 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1934 = _1804 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1806 + _1936;
    float _1940 = _1930 * _1930;
    float _1942 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1944 = fma(_1934, _1934, _1940);
    float _1946 = fma(_1938, _1938, _1944);
    float _1948 = rsqrt(_1946);
    float _1950 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1952 = _1934 * _1950;
    float _1954 = _1938 * _1950;
    float _1956 = _1952 * _1952;
    float _1958 = _1954 * _1954;
    float _1960 = _1956 + _1958;
    float _1962 = sqrt(_1960);
    bool _1964 = _1962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1968 = _1962 + _1966;
    float _1970 = _1948;
    float _1972 = _1960;
    float _1974 = _1968;
    float _1976 = _1924;
    float _1978 = _1930;
    float _1980 = _1952;
    if (_1964)
    {
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1982;
    }
    float _1984 = _1970;
    if (_1964)
    {
        float _1986 = rsqrt(_1960);
        _1972 = _1986;
    }
    float _1988 = _1972;
    float _1990 = _1988;
    if (_1964)
    {
        float _1992 = _1968 * _1984;
        _1974 = _1992;
    }
    float _1994 = _1974;
    if (_1964)
    {
        float _1996 = _1994 * 0.15915493667125701904296875;
        _1976 = _1996;
    }
    float _1998 = _1976;
    float _2000 = _1984;
    float _2002 = _1998;
    if (_1964)
    {
        float _2004 = _1998 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        _2000 = _2006;
    }
    float _2008 = _2000;
    float _2010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2012 = precise::max(0.0, _2010);
    float _2014 = _1938;
    float _2016 = _2012;
    if (_1964)
    {
        float _2018 = _1998 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = -_1950;
    float _2026 = -_2012;
    float _2028 = fma(_1930, _2024, _2026);
    float _2030 = _2028;
    if (_1964)
    {
        float _2032 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2016 = _2032;
    }
    float _2034 = _2016;
    if (!_1964)
    {
        _2002 = _1958;
    }
    float _2036 = _2002;
    float _2038 = _2008;
    float _2040 = _2036;
    if (_1964)
    {
        float _2042 = fma(_2008, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2038 = _2042;
    }
    float _2044 = _2038;
    float _2046 = sqrt(_1946);
    float _2048 = _2044;
    if (_1964)
    {
        float _2050 = _2022 + (-1.0);
        _1978 = _2050;
    }
    float _2052 = _1978;
    float _2054 = _2052;
    if (_1964)
    {
        float _2056 = _1988 * _2044;
        _1580 = _2056;
    }
    float _2058 = _1580;
    if (!_1964)
    {
        _1990 = _1954;
    }
    float _2060 = _1990;
    float _2062 = _2060;
    if (_1964)
    {
        float _2064 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2054 = _2064;
    }
    float _2066 = _2054;
    if (_1964)
    {
        float _2068 = _1952 * _2058;
        _1980 = _2068;
    }
    float _2070 = _1980;
    if (!_1964)
    {
        _2048 = _1956;
    }
    float _2072 = _2048;
    float _2074 = _2072;
    if (_1964)
    {
        float _2076 = _1954 * _2058;
        _2062 = _2076;
    }
    float _2078 = _2062;
    if (_1964)
    {
        float _2080 = fma(_2028, _2022, _2066);
        _2030 = _2080;
    }
    float _2082 = _2030;
    if (_1964)
    {
        float _2084 = _2070 * _2070;
        _2074 = _2084;
    }
    float _2086 = _2074;
    float _2088 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1964)
    {
        float _2090 = _2078 * _2078;
        _2040 = _2090;
    }
    float _2092 = _2040;
    float _2094 = fma(_2082, _2082, _2086);
    float _2096 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2088);
    float _2098 = _2094 + _2092;
    float _2100 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2102 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = rsqrt(_2098);
    float _2112 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2096);
    float _2114 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2102);
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2122 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2114);
    float _2124 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2126 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2128 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2132 = abs(_2118);
    float _2134 = log2(_2132);
    float _2136 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2128);
    float _2138 = -_2130;
    float _2140 = fma(_2138, _2126, 1.0);
    float _2142 = _2110 * _2070;
    float _2144 = _2110 * _2082;
    float _2146 = _2110 * _2078;
    float _2148 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1942);
    float _2150 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2136);
    float _2152 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2154 = floor(_2124);
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2158 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2162 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2148);
    float _2164 = -_2156;
    float _2166 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2164);
    float _2168 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2160);
    float _2172 = floor(_2100);
    float _2174 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2176 = -_2146;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2166);
    float _2180 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2170);
    float _2182 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = _2144 + 1.0;
    float _2186 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2188 = log2(_2140);
    float _2190 = -_2154;
    float _2192 = _2124 + _2190;
    float _2194 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2196 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2194);
    float _2198 = exp2(_2168);
    float _2200 = fma(_2178, -0.5, 0.5);
    float _2202 = -_2172;
    float _2204 = _2100 + _2202;
    float _2206 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2208 = fma(_2178, 0.5, 0.5);
    float _2210 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2196);
    float _2212 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2206);
    float _2214 = 1.0 / _2186;
    float _2216 = fma(_2208, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2218 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2210);
    float _2220 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2212);
    float _2222 = _2188 * 0.693147182464599609375;
    float _2224 = fma(_2208, _2216, -0.212114393711090087890625);
    float _2226 = sqrt(_2200);
    float _2228 = -_2144;
    float _2230 = fma(_2198, _2184, _2228);
    float2 _6365 = float2(_2192, _2204);
    float _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6365, float2(0.0), isnan(_6365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6365, float2(0.0), isnan(_6365)), level(0.0)).x;
    float _2234 = fma(_2208, _2224, 1.570728778839111328125);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2238 = fma(_2230, 0.5, 0.5);
    float _2240 = _2218 * _2214;
    float _2242 = _2220 * _2214;
    float _2244 = fma(_2240, 0.5, 0.5);
    float _2246 = fma(_2242, -0.5, 0.5);
    float _2248 = _2226 * 0.636619746685028076171875;
    float3 _6399 = float3(_2244, _2246, _2236);
    float _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6399, float3(0.0), isnan(_6399)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6399, float3(0.0), isnan(_6399)), level(0.0)).x;
    float _2252 = -_2234;
    float _2254 = fma(_2248, _2252, 1.0);
    float3 _6415 = float3(_2244, _2246, _2236);
    float4 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6415, float3(0.0), isnan(_6415)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6415, float3(0.0), isnan(_6415)), level(0.0)).xyzw;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = _2257.w;
    float2 _6431 = float2(_2254, _2238);
    float3 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6431, float2(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6431, float2(0.0), isnan(_6431)), level(0.0)).xyz;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = abs(_1814);
    float _2279 = log2(_2277);
    bool _2281 = _1310 != 0.0;
    bool _2283 = isnan(_1310);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan(0.0);
    bool _2289 = _2285 || _2287;
    float _2291 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1804;
    out.m_79.y = _1802;
    out.m_79.z = _1806;
    bool _2293 = _1308 == 0.0;
    bool _2295 = !_2289;
    bool _2297 = _2293 && _2295;
    float _2299 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    bool _2301 = _1312 == 0.0;
    bool _2303 = _2301 && _2297;
    float _2305 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2299);
    bool _2307 = _1814 <= 8000.0;
    bool _2309 = isnan(_1814);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(8000.0);
    bool _2315 = _2311 || _2313;
    float _2317 = float(_2315);
    out.m_81.x = _1412;
    out.m_81.y = _1382;
    out.m_81.z = _1418;
    float _2319 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2321 = in.m_83.x;
    float _2323 = in.m_83.y;
    float _2325 = in.m_83.z;
    float _2327 = exp2(_2319);
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = _2323;
    float _2335 = _2325;
    float _2337 = _2321;
    if (!_2303)
    {
        float _2339 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2323);
        _2333 = _2339;
    }
    float _2341 = _2333;
    float _2343 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2345 = fma(_2331, -2.0, 3.0);
    float _2347 = _2331 * _2331;
    if (!_2303)
    {
        float _2349 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2325);
        _2335 = _2349;
    }
    float _2351 = _2335;
    if (!_2303)
    {
        float _2353 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2321);
        _2337 = _2353;
    }
    float _2355 = _2337;
    float _2357 = in.m_85.x;
    float _2359 = _2347 * _2345;
    float _2361 = exp2(_2343);
    float _2363 = _1300 * _2341;
    float _2365 = _2186 * 0.5;
    float _2367 = -_2359;
    float _2369 = _2367 + 1.0;
    float _2371 = _1302 * _2341;
    float _2373 = fma(_1364, _2355, _2363);
    float _2375 = _1298 * _2341;
    float _2377 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2359);
    float _2379 = fma(_2220, -0.5, _2365);
    float _2381 = fma(_1082, _2351, _2373);
    float _2383 = _2317 * _2377;
    float _2385 = fma(_1362, _2355, _2371);
    float _2387 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    float _2389 = fma(_1358, _2355, _2375);
    float _2391 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2393 = -_2361;
    float _2395 = _2393 + 1.0;
    float _2397 = fma(_1076, _2351, _2385);
    float _2399 = _2387 + _2186;
    float _2401 = _2218 + _2186;
    float _2403 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2405 = _2399 * 0.5;
    float _2407 = _2401 * 0.5;
    float _2409 = fma(_1078, _2351, _2389);
    bool _2411 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2413 = isnan(_2046);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2419 = _2415 || _2417;
    out.gl_Position.x = _2218;
    out.gl_Position.y = _2220;
    out.gl_Position.z = _2387;
    out.gl_Position.w = _2186;
    out.m_87.x = _2407;
    out.m_87.y = _2379;
    out.m_87.z = _2405;
    out.m_87.w = _2186;
    out.m_89.x = _2397;
    out.m_89.y = _2381;
    out.m_89.z = _2409;
    if (!_2419)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2421 = _1436;
    float _2423 = _2421;
    float _2425 = _2421;
    if (!_2419)
    {
        _1438 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2427 = _1438;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2419)
    {
        _1440 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2433 = _1440;
    float _2435 = -_2232;
    float _2437 = _2435 + 1.0;
    float _2439 = _2437 * _2391;
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2441;
    float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2447 = _2445 * _2357;
    float _2449 = _2357;
    float _2451 = _2433;
    float _2453 = _2433;
    if (!_2419)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _2449;
    float _2457 = _2403 * _2250;
    float _2459 = -_2403;
    float _2461 = _2459 + 1.0;
    float _2463 = _2447 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2465 = _2265 * _2457;
    float _2467 = _2265 * _2461;
    out.m_91.x = _2463;
    float _2469 = _1868 * _1926;
    float _2471 = _2275 * _2457;
    float _2473 = fma(_2271, _2465, _2259);
    float _2475 = fma(_2273, _2465, _2261);
    float _2477 = _2469 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2479 = fma(_2265, _2471, _2263);
    float _2481 = _2465;
    float _2483 = _2469;
    float _2485 = _2455;
    float _2487 = _2455;
    if (!_2419)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2489 = _2481;
    float _2491 = _2489;
    float _2493 = _2489;
    if (!_2419)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2495 = _2483;
    out.m_93.x = _2473;
    out.m_93.y = _2475;
    out.m_93.z = _2479;
    out.m_93.w = _2467;
    bool _2497 = !_2419;
    float _2499 = _2495;
    float _2501 = _2495;
    if (!_2497)
    {
        bool _2503 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2505 = isnan(_2046);
        bool _2507 = _2503 || _2505;
        bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2511 = _2507 || _2509;
        if (!_2511)
        {
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = _2046 + _2513;
            float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2519 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2517;
            float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2525 = 1.0 / _2519;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2543 = _2515 * _2525;
            float _2545 = precise::clamp(_2543, 0.0, 1.0);
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2551 = fma(_2545, _2523, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2553 = fma(_2545, _2549, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2555 = fma(_2545, _2529, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2557 = fma(_2545, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2559 = fma(_2545, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2561 = fma(_2545, _2541, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2431 = _2555;
            _2493 = _2559;
            _2425 = _2551;
            _2487 = _2557;
            _2453 = _2553;
            _2501 = _2561;
            _2563 = true;
        }
        else
        {
            bool _2565 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2567 = isnan(_2046);
            bool _2569 = _2565 || _2567;
            bool _2571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2573 = _2569 || _2571;
            if (!_2573)
            {
                _2423 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2575 = _2423;
            _2425 = _2575;
            if (!_2573)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2577 = _2429;
            _2431 = _2577;
            if (!_2573)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2579 = _2451;
            _2453 = _2579;
            if (!_2573)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2581 = _2485;
            _2487 = _2581;
            if (!_2573)
            {
                _2491 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2583 = _2491;
            _2493 = _2583;
            if (!_2573)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2585 = _2499;
            bool _2587 = !_2573;
            _2501 = _2585;
            if (!_2587)
            {
                bool _2589 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2591 = isnan(_2046);
                bool _2593 = _2589 || _2591;
                bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2597 = _2593 || _2595;
                if (!_2597)
                {
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = _2046 + _2599;
                    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2605 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2603;
                    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2611 = 1.0 / _2605;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2629 = _2601 * _2611;
                    float _2631 = precise::clamp(_2629, 0.0, 1.0);
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2637 = fma(_2631, _2609, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2639 = fma(_2631, _2635, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2641 = fma(_2631, _2615, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2643 = fma(_2631, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2645 = fma(_2631, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2647 = fma(_2631, _2627, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2431 = _2641;
                    _2493 = _2645;
                    _2425 = _2637;
                    _2487 = _2643;
                    _2453 = _2639;
                    _2501 = _2647;
                    _2563 = true;
                }
                else
                {
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2493 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2425 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2563 = false;
    float _2649 = _2431;
    float _2651 = _2493;
    float _2653 = _2425;
    float _2655 = _2487;
    float _2657 = _2453;
    float _2659 = _2501;
    float _2661 = fma(_2381, -0.5, 0.5);
    float _2663 = precise::clamp(_2661, 0.0, 1.0);
    float _2665 = -_2649;
    float _2667 = _2665 + _2651;
    float _2669 = -_2653;
    float _2671 = _2669 + _2655;
    out.m_95.x = 0.0;
    float _2673 = fma(_2663, _2667, _2649);
    float _2675 = -_2657;
    float _2677 = _2675 + _2659;
    float _2679 = fma(_2663, _2671, _2653);
    float _2681 = _2673 * 0.586610972881317138671875;
    bool _2683 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2685 = fma(_2663, _2677, _2657);
    float _2687 = _2477 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2689 = fma(_2679, 0.298911988735198974609375, _2681);
    bool _2691 = _1868 > 0.0;
    bool _2693 = isnan(_1868);
    bool _2695 = _2691 || _2693;
    bool _2697 = isnan(0.0);
    bool _2699 = _2695 || _2697;
    float _2701 = fma(_2685, 0.114477999508380889892578125, _2689);
    out.m_49.x = _2687;
    bool _2703 = _1926 <= 0.0;
    bool _2705 = !_2699;
    bool _2707 = _2703 || _2705;
    float _2709 = -_2701;
    float _2711 = _2679 + _2709;
    float _2713 = -_2701;
    float _2715 = _2673 + _2713;
    float _2717 = -_2701;
    float _2719 = _2685 + _2717;
    float _2721 = fma(_2711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    float _2723 = fma(_2715, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    float _2725 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    bool _2727 = !_2683;
    if (!_2727)
    {
        float _2729 = -_1802;
        float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2733 = -_1804;
        float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2737 = -_1806;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2741 = _2731 * _2731;
        float _2743 = fma(_2735, _2735, _2741);
        float _2745 = fma(_2739, _2739, _2743);
        float _2747 = sqrt(_2745);
        float _2749 = rsqrt(_2745);
        float _2751 = -_2747;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2757 = precise::clamp(_2755, 0.0, 1.0);
        float _2759 = _2735 * _2749;
        float _2761 = _2731 * _2749;
        float _2763 = abs(_2757);
        float _2765 = log2(_2763);
        float _2767 = _2739 * _2749;
        float _2769 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2771 = _2381 * _2761;
        float _2773 = -_2761;
        float _2775 = -_2769;
        float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2775);
        float _2779 = fma(_2397, _2759, _2771);
        float _2781 = -_2767;
        float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2777);
        float _2785 = fma(_2409, _2767, _2779);
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2791 = _2783 + _2789;
        float _2793 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2795 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2797 = precise::clamp(_2795, 0.0, 1.0);
        float _2799 = exp2(_2793);
        float _2801 = _2799 * _2797;
        float _2803 = _2787 * _2801;
        float _2805 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2809 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2805;
        out.m_95.y = _2807;
        out.m_95.z = _2809;
    }
    out.m_73.x = _2721;
    out.m_73.y = _2723;
    out.m_73.z = _2725;
    if (!_2707)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2811 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2811;
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
    bool _2563 = false;
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
        float _2868 = as_type<float>(_130);
        out.gl_Position.z = _2868;
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
        float _2937 = as_type<float>(_166);
        out.gl_Position.z = _2937;
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
        float _4357 = as_type<float>(_988);
        out.gl_Position.z = _4357;
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
        float _4452 = as_type<float>(_1032);
        out.gl_Position.z = _4452;
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
    float _1522 = fma(_1508, _1508, _1518);
    float _1524 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1520);
    float _1526 = sqrt(_1522);
    float _1528 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1530 = _1528 + _1510;
    float _1532 = _1530 * _1516;
    float _1534 = _1532 * 0.5;
    bool _1536 = _1526 > 0.0;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1540 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
    bool _1542 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan(0.5);
    bool _1550 = _1546 || _1548;
    float _1552 = 1.0 / _1540;
    bool _1554 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(0.5);
    bool _1562 = _1558 || _1560;
    float _1564 = -_850;
    float _1566 = _1564 + _1492;
    float _1568 = -_868;
    float _1570 = _1568 + _1494;
    float _1572 = -_878;
    float _1574 = _1572 + _1496;
    float _1576 = _1496;
    float _1578 = _1570;
    float _1580 = _1566;
    if (!_1536)
    {
        _1576 = _1566;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    float _1586 = _1582;
    if (!_1536)
    {
        _854 = _1570;
    }
    float _1588 = _854;
    float _1590 = _1588;
    if (!_1536)
    {
        _968 = _1574;
    }
    float _1592 = _968;
    bool _1594 = !_1536;
    float _1596 = _1592;
    if (!_1594)
    {
        float _1598 = _190 * _190;
        float _1600 = rsqrt(_1522);
        float _1602 = fma(_188, _188, _1598);
        float _1604 = fma(_192, _192, _1602);
        float _1606 = sqrt(_1604);
        float _1608 = _1504 * _1600;
        float _1610 = _1500 * _1600;
        float _1612 = _1508 * _1600;
        bool _1614 = _1606 > 0.0;
        float _1616 = _1600;
        float _1618 = _1606;
        if (!_1614)
        {
            _1616 = _1570;
        }
        float _1620 = _1616;
        _1590 = _1620;
        if (!_1614)
        {
            _1584 = _1566;
        }
        float _1622 = _1584;
        _1586 = _1622;
        if (!_1614)
        {
            _1618 = _1574;
        }
        float _1624 = _1618;
        bool _1626 = !_1614;
        _1596 = _1624;
        if (!_1626)
        {
            float _1628 = rsqrt(_1604);
            float _1630 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1632 = _190 * _1628;
            float _1634 = _188 * _1628;
            float _1636 = _192 * _1628;
            float _1638 = _1610 * _1632;
            float _1640 = fma(_1608, _1634, _1638);
            float _1642 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1644 = fma(_1612, _1636, _1640);
            float _1646 = _1644 * _1642;
            float _1648 = fma(_188, _1646, _1570);
            float _1650 = fma(_190, _1646, _1566);
            float _1652 = fma(_192, _1646, _1574);
            _1590 = _1648;
            _1586 = _1650;
            _1596 = _1652;
        }
    }
    float _1654 = _1590;
    float _1656 = _1586;
    float _1658 = _1596;
    float _1660 = -_818;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1654);
    float _1664 = -_800;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _1668 = -_866;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1672 = _1666;
    float _1674 = _1662;
    float _1676 = _1670;
    if (_1562)
    {
        _196 = 1.0;
    }
    float _1678 = _196;
    float _1680 = _1678;
    if (!_1550)
    {
        float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1684 = _1382 + _1682;
        float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1688 = _1412 + _1686;
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1692 = -_1404;
        float _1694 = _1692 + _1654;
        float _1696 = _1684 * _1684;
        float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1700 = _1418 + _1698;
        float _1702 = -_1370;
        float _1704 = _1702 + _1656;
        float _1706 = -_1352;
        float _1708 = _1706 + _1658;
        float _1710 = fma(_1688, _1688, _1696);
        float _1712 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1714 = fma(_1700, _1700, _1710);
        float _1716 = sqrt(_1714);
        float _1718 = 1.0 / _948;
        bool _1720 = _1716 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1722 = isnan(_1716);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1728 = _1724 || _1726;
        float _1730 = precise::min(_1716, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1732 = _1730 * _1690;
        float _1734 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1736 = _1694 * _1718;
        float _1738 = _1704 * _1718;
        float _1740 = _1708 * _1718;
        float _1742 = _1734 * _1732;
        float _1744 = _866;
        float _1746 = _1716;
        float _1748 = _1734;
        _1434 = _1738;
        if (_1728)
        {
            float _1750 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1744 = _1750;
        }
        float _1752 = _1744;
        if (_1728)
        {
            float _1754 = precise::max(_1716, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1746 = _1754;
        }
        float _1756 = _1746;
        float _1758 = fma(_1736, _1742, _1412);
        float _1760 = fma(_1738, _1742, _1382);
        float _1762 = fma(_1740, _1742, _1418);
        float _1764 = _1756;
        float _1766 = _1752;
        float _1768 = _1758;
        if (_1728)
        {
            float _1770 = _1756 * _1752;
            _1764 = _1770;
        }
        float _1772 = _1764;
        float _1774 = _1772;
        if (_1728)
        {
            float _1776 = _1734 * _1772;
            _1766 = _1776;
        }
        float _1778 = _1766;
        if (!_1728)
        {
            _1774 = _1758;
        }
        float _1780 = _1774;
        float _1782 = _1780;
        if (!_1728)
        {
            _1748 = _1760;
        }
        float _1784 = _1748;
        float _1786 = _1784;
        if (_1728)
        {
            float _1788 = fma(_1736, _1778, _1412);
            _1782 = _1788;
        }
        float _1790 = _1782;
        _1674 = _1790;
        if (!_1728)
        {
            _1768 = _1762;
        }
        float _1792 = _1768;
        _1676 = _1792;
        if (_1728)
        {
            float _1794 = fma(_1738, _1778, _1382);
            _1786 = _1794;
        }
        float _1796 = _1786;
        _1672 = _1796;
        if (_1728)
        {
            float _1798 = fma(_1740, _1778, _1418);
            _1676 = _1798;
        }
    }
    float _1800 = _1434;
    float _1802 = _1672;
    float _1804 = _1674;
    float _1806 = _1676;
    float _1808 = _1800;
    if (_1562)
    {
        _1578 = 1.0;
    }
    float _1810 = _1578;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1814 = _1552 * _1812;
    float _1816 = _1810;
    if (!_1562)
    {
        float _1818 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1820;
        float _1824 = _1818 * 0.15915493667125701904296875;
        float _1826 = _1824 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        float _1830 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1832 = _1830 * 0.15915493667125701904296875;
        float _1834 = _1824 * 6.283185482025146484375;
        float _1836 = sin(_1834);
        float _1838 = 1.0 / _1828;
        float _1840 = _1832 * 6.283185482025146484375;
        float _1842 = cos(_1840);
        float _1844 = _1836 * _1838;
        float _1846 = _1832 * 6.283185482025146484375;
        float _1848 = sin(_1846);
        float _1850 = _1842 * _1844;
        float _1852 = 1.0 / _1822;
        float _1854 = 1.0 / _1850;
        float _1856 = _1848 * _1854;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = fma(_1814, _1856, _1858);
        float _1862 = _1860 * _1852;
        float _1864 = precise::clamp(_1862, 0.0, 1.0);
        _1808 = _1832;
        _1680 = _1864;
    }
    float _1866 = _1808;
    float _1868 = _1680;
    float _1870 = _1866;
    if (!_1562)
    {
        float _1872 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1874 = _1872 * 0.15915493667125701904296875;
        float _1876 = _1874 * 6.283185482025146484375;
        float _1878 = cos(_1876);
        float _1880 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1882 = _1880 * 0.15915493667125701904296875;
        float _1884 = _1874 * 6.283185482025146484375;
        float _1886 = sin(_1884);
        float _1888 = 1.0 / _1878;
        float _1890 = _1882 * 6.283185482025146484375;
        float _1892 = cos(_1890);
        float _1894 = _1886 * _1888;
        float _1896 = _1882 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        float _1900 = _1892 * _1894;
        float _1902 = 1.0 / _1900;
        float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1906 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1904;
        float _1908 = 1.0 / _1906;
        float _1910 = _1898 * _1902;
        float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1914 = fma(_1814, _1910, _1912);
        float _1916 = _1914 * _1908;
        float _1918 = precise::clamp(_1916, 0.0, 1.0);
        float _1920 = -_1918;
        float _1922 = _1920 + 1.0;
        _1870 = _1888;
        _1816 = _1922;
    }
    float _1924 = _1870;
    float _1926 = _1816;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1930 = _1802 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1934 = _1804 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1806 + _1936;
    float _1940 = _1930 * _1930;
    float _1942 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1944 = fma(_1934, _1934, _1940);
    float _1946 = fma(_1938, _1938, _1944);
    float _1948 = rsqrt(_1946);
    float _1950 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1952 = _1934 * _1950;
    float _1954 = _1938 * _1950;
    float _1956 = _1952 * _1952;
    float _1958 = _1954 * _1954;
    float _1960 = _1956 + _1958;
    float _1962 = sqrt(_1960);
    bool _1964 = _1962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1968 = _1962 + _1966;
    float _1970 = _1948;
    float _1972 = _1960;
    float _1974 = _1968;
    float _1976 = _1924;
    float _1978 = _1930;
    float _1980 = _1952;
    if (_1964)
    {
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1982;
    }
    float _1984 = _1970;
    if (_1964)
    {
        float _1986 = rsqrt(_1960);
        _1972 = _1986;
    }
    float _1988 = _1972;
    float _1990 = _1988;
    if (_1964)
    {
        float _1992 = _1968 * _1984;
        _1974 = _1992;
    }
    float _1994 = _1974;
    if (_1964)
    {
        float _1996 = _1994 * 0.15915493667125701904296875;
        _1976 = _1996;
    }
    float _1998 = _1976;
    float _2000 = _1984;
    float _2002 = _1998;
    if (_1964)
    {
        float _2004 = _1998 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        _2000 = _2006;
    }
    float _2008 = _2000;
    float _2010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2012 = precise::max(0.0, _2010);
    float _2014 = _1938;
    float _2016 = _2012;
    if (_1964)
    {
        float _2018 = _1998 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = -_1950;
    float _2026 = -_2012;
    float _2028 = fma(_1930, _2024, _2026);
    float _2030 = _2028;
    if (_1964)
    {
        float _2032 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2016 = _2032;
    }
    float _2034 = _2016;
    if (!_1964)
    {
        _2002 = _1958;
    }
    float _2036 = _2002;
    float _2038 = _2008;
    float _2040 = _2036;
    if (_1964)
    {
        float _2042 = fma(_2008, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2038 = _2042;
    }
    float _2044 = _2038;
    float _2046 = sqrt(_1946);
    float _2048 = _2044;
    if (_1964)
    {
        float _2050 = _2022 + (-1.0);
        _1978 = _2050;
    }
    float _2052 = _1978;
    float _2054 = _2052;
    if (_1964)
    {
        float _2056 = _1988 * _2044;
        _1580 = _2056;
    }
    float _2058 = _1580;
    if (!_1964)
    {
        _1990 = _1954;
    }
    float _2060 = _1990;
    float _2062 = _2060;
    if (_1964)
    {
        float _2064 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2054 = _2064;
    }
    float _2066 = _2054;
    if (_1964)
    {
        float _2068 = _1952 * _2058;
        _1980 = _2068;
    }
    float _2070 = _1980;
    if (!_1964)
    {
        _2048 = _1956;
    }
    float _2072 = _2048;
    float _2074 = _2072;
    if (_1964)
    {
        float _2076 = _1954 * _2058;
        _2062 = _2076;
    }
    float _2078 = _2062;
    if (_1964)
    {
        float _2080 = fma(_2028, _2022, _2066);
        _2030 = _2080;
    }
    float _2082 = _2030;
    if (_1964)
    {
        float _2084 = _2070 * _2070;
        _2074 = _2084;
    }
    float _2086 = _2074;
    float _2088 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1964)
    {
        float _2090 = _2078 * _2078;
        _2040 = _2090;
    }
    float _2092 = _2040;
    float _2094 = fma(_2082, _2082, _2086);
    float _2096 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2088);
    float _2098 = _2094 + _2092;
    float _2100 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2102 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = rsqrt(_2098);
    float _2112 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2096);
    float _2114 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2102);
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2122 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2114);
    float _2124 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2126 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2128 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2132 = abs(_2118);
    float _2134 = log2(_2132);
    float _2136 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2128);
    float _2138 = -_2130;
    float _2140 = fma(_2138, _2126, 1.0);
    float _2142 = _2110 * _2070;
    float _2144 = _2110 * _2082;
    float _2146 = _2110 * _2078;
    float _2148 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1942);
    float _2150 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2136);
    float _2152 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2154 = floor(_2124);
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2158 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2162 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2148);
    float _2164 = -_2156;
    float _2166 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2164);
    float _2168 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2160);
    float _2172 = floor(_2100);
    float _2174 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2176 = -_2146;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2166);
    float _2180 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2170);
    float _2182 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = _2144 + 1.0;
    float _2186 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2188 = log2(_2140);
    float _2190 = -_2154;
    float _2192 = _2124 + _2190;
    float _2194 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2196 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2194);
    float _2198 = exp2(_2168);
    float _2200 = fma(_2178, -0.5, 0.5);
    float _2202 = -_2172;
    float _2204 = _2100 + _2202;
    float _2206 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2208 = fma(_2178, 0.5, 0.5);
    float _2210 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2196);
    float _2212 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2206);
    float _2214 = 1.0 / _2186;
    float _2216 = fma(_2208, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2218 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2210);
    float _2220 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2212);
    float _2222 = _2188 * 0.693147182464599609375;
    float _2224 = fma(_2208, _2216, -0.212114393711090087890625);
    float _2226 = sqrt(_2200);
    float _2228 = -_2144;
    float _2230 = fma(_2198, _2184, _2228);
    float2 _6365 = float2(_2192, _2204);
    float _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6365, float2(0.0), isnan(_6365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6365, float2(0.0), isnan(_6365)), level(0.0)).x;
    float _2234 = fma(_2208, _2224, 1.570728778839111328125);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2238 = fma(_2230, 0.5, 0.5);
    float _2240 = _2218 * _2214;
    float _2242 = _2220 * _2214;
    float _2244 = fma(_2240, 0.5, 0.5);
    float _2246 = fma(_2242, -0.5, 0.5);
    float _2248 = _2226 * 0.636619746685028076171875;
    float3 _6399 = float3(_2244, _2246, _2236);
    float _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6399, float3(0.0), isnan(_6399)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6399, float3(0.0), isnan(_6399)), level(0.0)).x;
    float _2252 = -_2234;
    float _2254 = fma(_2248, _2252, 1.0);
    float3 _6415 = float3(_2244, _2246, _2236);
    float4 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6415, float3(0.0), isnan(_6415)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6415, float3(0.0), isnan(_6415)), level(0.0)).xyzw;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = _2257.w;
    float2 _6431 = float2(_2254, _2238);
    float3 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6431, float2(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6431, float2(0.0), isnan(_6431)), level(0.0)).xyz;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = abs(_1814);
    float _2279 = log2(_2277);
    bool _2281 = _1310 != 0.0;
    bool _2283 = isnan(_1310);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan(0.0);
    bool _2289 = _2285 || _2287;
    float _2291 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1804;
    out.m_79.y = _1802;
    out.m_79.z = _1806;
    bool _2293 = _1308 == 0.0;
    bool _2295 = !_2289;
    bool _2297 = _2293 && _2295;
    float _2299 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    bool _2301 = _1312 == 0.0;
    bool _2303 = _2301 && _2297;
    float _2305 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2299);
    bool _2307 = _1814 <= 8000.0;
    bool _2309 = isnan(_1814);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(8000.0);
    bool _2315 = _2311 || _2313;
    float _2317 = float(_2315);
    out.m_81.x = _1412;
    out.m_81.y = _1382;
    out.m_81.z = _1418;
    float _2319 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2321 = in.m_83.x;
    float _2323 = in.m_83.y;
    float _2325 = in.m_83.z;
    float _2327 = exp2(_2319);
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = _2323;
    float _2335 = _2325;
    float _2337 = _2321;
    if (!_2303)
    {
        float _2339 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2323);
        _2333 = _2339;
    }
    float _2341 = _2333;
    float _2343 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2345 = fma(_2331, -2.0, 3.0);
    float _2347 = _2331 * _2331;
    if (!_2303)
    {
        float _2349 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2325);
        _2335 = _2349;
    }
    float _2351 = _2335;
    if (!_2303)
    {
        float _2353 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2321);
        _2337 = _2353;
    }
    float _2355 = _2337;
    float _2357 = in.m_85.x;
    float _2359 = _2347 * _2345;
    float _2361 = exp2(_2343);
    float _2363 = _1300 * _2341;
    float _2365 = _2186 * 0.5;
    float _2367 = -_2359;
    float _2369 = _2367 + 1.0;
    float _2371 = _1302 * _2341;
    float _2373 = fma(_1364, _2355, _2363);
    float _2375 = _1298 * _2341;
    float _2377 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2359);
    float _2379 = fma(_2220, -0.5, _2365);
    float _2381 = fma(_1082, _2351, _2373);
    float _2383 = _2317 * _2377;
    float _2385 = fma(_1362, _2355, _2371);
    float _2387 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    float _2389 = fma(_1358, _2355, _2375);
    float _2391 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2393 = -_2361;
    float _2395 = _2393 + 1.0;
    float _2397 = fma(_1076, _2351, _2385);
    float _2399 = _2387 + _2186;
    float _2401 = _2218 + _2186;
    float _2403 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2405 = _2399 * 0.5;
    float _2407 = _2401 * 0.5;
    float _2409 = fma(_1078, _2351, _2389);
    bool _2411 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2413 = isnan(_2046);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2419 = _2415 || _2417;
    out.gl_Position.x = _2218;
    out.gl_Position.y = _2220;
    out.gl_Position.z = _2387;
    out.gl_Position.w = _2186;
    out.m_87.x = _2407;
    out.m_87.y = _2379;
    out.m_87.z = _2405;
    out.m_87.w = _2186;
    out.m_89.x = _2397;
    out.m_89.y = _2381;
    out.m_89.z = _2409;
    if (!_2419)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2421 = _1436;
    float _2423 = _2421;
    float _2425 = _2421;
    if (!_2419)
    {
        _1438 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2427 = _1438;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2419)
    {
        _1440 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2433 = _1440;
    float _2435 = -_2232;
    float _2437 = _2435 + 1.0;
    float _2439 = _2437 * _2391;
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2441;
    float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2447 = _2445 * _2357;
    float _2449 = _2357;
    float _2451 = _2433;
    float _2453 = _2433;
    if (!_2419)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _2449;
    float _2457 = _2403 * _2250;
    float _2459 = -_2403;
    float _2461 = _2459 + 1.0;
    float _2463 = _2447 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2465 = _2265 * _2457;
    float _2467 = _2265 * _2461;
    out.m_91.x = _2463;
    float _2469 = _1868 * _1926;
    float _2471 = _2275 * _2457;
    float _2473 = fma(_2271, _2465, _2259);
    float _2475 = fma(_2273, _2465, _2261);
    float _2477 = _2469 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2479 = fma(_2265, _2471, _2263);
    float _2481 = _2465;
    float _2483 = _2469;
    float _2485 = _2455;
    float _2487 = _2455;
    if (!_2419)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2489 = _2481;
    float _2491 = _2489;
    float _2493 = _2489;
    if (!_2419)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2495 = _2483;
    out.m_93.x = _2473;
    out.m_93.y = _2475;
    out.m_93.z = _2479;
    out.m_93.w = _2467;
    bool _2497 = !_2419;
    float _2499 = _2495;
    float _2501 = _2495;
    if (!_2497)
    {
        bool _2503 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2505 = isnan(_2046);
        bool _2507 = _2503 || _2505;
        bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2511 = _2507 || _2509;
        if (!_2511)
        {
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = _2046 + _2513;
            float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2519 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2517;
            float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2525 = 1.0 / _2519;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2543 = _2515 * _2525;
            float _2545 = precise::clamp(_2543, 0.0, 1.0);
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2551 = fma(_2545, _2523, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2553 = fma(_2545, _2549, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2555 = fma(_2545, _2529, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2557 = fma(_2545, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2559 = fma(_2545, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2561 = fma(_2545, _2541, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2431 = _2555;
            _2493 = _2559;
            _2425 = _2551;
            _2487 = _2557;
            _2453 = _2553;
            _2501 = _2561;
            _2563 = true;
        }
        else
        {
            bool _2565 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2567 = isnan(_2046);
            bool _2569 = _2565 || _2567;
            bool _2571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2573 = _2569 || _2571;
            if (!_2573)
            {
                _2423 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2575 = _2423;
            _2425 = _2575;
            if (!_2573)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2577 = _2429;
            _2431 = _2577;
            if (!_2573)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2579 = _2451;
            _2453 = _2579;
            if (!_2573)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2581 = _2485;
            _2487 = _2581;
            if (!_2573)
            {
                _2491 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2583 = _2491;
            _2493 = _2583;
            if (!_2573)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2585 = _2499;
            bool _2587 = !_2573;
            _2501 = _2585;
            if (!_2587)
            {
                bool _2589 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2591 = isnan(_2046);
                bool _2593 = _2589 || _2591;
                bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2597 = _2593 || _2595;
                if (!_2597)
                {
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = _2046 + _2599;
                    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2605 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2603;
                    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2611 = 1.0 / _2605;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2629 = _2601 * _2611;
                    float _2631 = precise::clamp(_2629, 0.0, 1.0);
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2637 = fma(_2631, _2609, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2639 = fma(_2631, _2635, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2641 = fma(_2631, _2615, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2643 = fma(_2631, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2645 = fma(_2631, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2647 = fma(_2631, _2627, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2431 = _2641;
                    _2493 = _2645;
                    _2425 = _2637;
                    _2487 = _2643;
                    _2453 = _2639;
                    _2501 = _2647;
                    _2563 = true;
                }
                else
                {
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2493 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2425 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2563 = false;
    float _2649 = _2431;
    float _2651 = _2493;
    float _2653 = _2425;
    float _2655 = _2487;
    float _2657 = _2453;
    float _2659 = _2501;
    float _2661 = fma(_2381, -0.5, 0.5);
    float _2663 = precise::clamp(_2661, 0.0, 1.0);
    float _2665 = -_2649;
    float _2667 = _2665 + _2651;
    float _2669 = -_2653;
    float _2671 = _2669 + _2655;
    out.m_95.x = 0.0;
    float _2673 = fma(_2663, _2667, _2649);
    float _2675 = -_2657;
    float _2677 = _2675 + _2659;
    float _2679 = fma(_2663, _2671, _2653);
    float _2681 = _2673 * 0.586610972881317138671875;
    bool _2683 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2685 = fma(_2663, _2677, _2657);
    float _2687 = _2477 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2689 = fma(_2679, 0.298911988735198974609375, _2681);
    bool _2691 = _1868 > 0.0;
    bool _2693 = isnan(_1868);
    bool _2695 = _2691 || _2693;
    bool _2697 = isnan(0.0);
    bool _2699 = _2695 || _2697;
    float _2701 = fma(_2685, 0.114477999508380889892578125, _2689);
    out.m_49.x = _2687;
    bool _2703 = _1926 <= 0.0;
    bool _2705 = !_2699;
    bool _2707 = _2703 || _2705;
    float _2709 = -_2701;
    float _2711 = _2679 + _2709;
    float _2713 = -_2701;
    float _2715 = _2673 + _2713;
    float _2717 = -_2701;
    float _2719 = _2685 + _2717;
    float _2721 = fma(_2711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    float _2723 = fma(_2715, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    float _2725 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    bool _2727 = !_2683;
    if (!_2727)
    {
        float _2729 = -_1802;
        float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2733 = -_1804;
        float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2737 = -_1806;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2741 = _2731 * _2731;
        float _2743 = fma(_2735, _2735, _2741);
        float _2745 = fma(_2739, _2739, _2743);
        float _2747 = sqrt(_2745);
        float _2749 = rsqrt(_2745);
        float _2751 = -_2747;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2757 = precise::clamp(_2755, 0.0, 1.0);
        float _2759 = _2735 * _2749;
        float _2761 = _2731 * _2749;
        float _2763 = abs(_2757);
        float _2765 = log2(_2763);
        float _2767 = _2739 * _2749;
        float _2769 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2771 = _2381 * _2761;
        float _2773 = -_2761;
        float _2775 = -_2769;
        float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2775);
        float _2779 = fma(_2397, _2759, _2771);
        float _2781 = -_2767;
        float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2777);
        float _2785 = fma(_2409, _2767, _2779);
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2791 = _2783 + _2789;
        float _2793 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2795 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2797 = precise::clamp(_2795, 0.0, 1.0);
        float _2799 = exp2(_2793);
        float _2801 = _2799 * _2797;
        float _2803 = _2787 * _2801;
        float _2805 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2809 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2805;
        out.m_95.y = _2807;
        out.m_95.z = _2809;
    }
    out.m_73.x = _2721;
    out.m_73.y = _2723;
    out.m_73.z = _2725;
    if (!_2707)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2811 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2811;
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
    bool _2563 = false;
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
        float _2868 = as_type<float>(_130);
        out.gl_Position.z = _2868;
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
        float _2937 = as_type<float>(_166);
        out.gl_Position.z = _2937;
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
        float _4357 = as_type<float>(_988);
        out.gl_Position.z = _4357;
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
        float _4452 = as_type<float>(_1032);
        out.gl_Position.z = _4452;
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
    float _1522 = fma(_1508, _1508, _1518);
    float _1524 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1520);
    float _1526 = sqrt(_1522);
    float _1528 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1530 = _1528 + _1510;
    float _1532 = _1530 * _1516;
    float _1534 = _1532 * 0.5;
    bool _1536 = _1526 > 0.0;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1540 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
    bool _1542 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan(0.5);
    bool _1550 = _1546 || _1548;
    float _1552 = 1.0 / _1540;
    bool _1554 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(0.5);
    bool _1562 = _1558 || _1560;
    float _1564 = -_850;
    float _1566 = _1564 + _1492;
    float _1568 = -_868;
    float _1570 = _1568 + _1494;
    float _1572 = -_878;
    float _1574 = _1572 + _1496;
    float _1576 = _1496;
    float _1578 = _1570;
    float _1580 = _1566;
    if (!_1536)
    {
        _1576 = _1566;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    float _1586 = _1582;
    if (!_1536)
    {
        _854 = _1570;
    }
    float _1588 = _854;
    float _1590 = _1588;
    if (!_1536)
    {
        _968 = _1574;
    }
    float _1592 = _968;
    bool _1594 = !_1536;
    float _1596 = _1592;
    if (!_1594)
    {
        float _1598 = _190 * _190;
        float _1600 = rsqrt(_1522);
        float _1602 = fma(_188, _188, _1598);
        float _1604 = fma(_192, _192, _1602);
        float _1606 = sqrt(_1604);
        float _1608 = _1504 * _1600;
        float _1610 = _1500 * _1600;
        float _1612 = _1508 * _1600;
        bool _1614 = _1606 > 0.0;
        float _1616 = _1600;
        float _1618 = _1606;
        if (!_1614)
        {
            _1616 = _1570;
        }
        float _1620 = _1616;
        _1590 = _1620;
        if (!_1614)
        {
            _1584 = _1566;
        }
        float _1622 = _1584;
        _1586 = _1622;
        if (!_1614)
        {
            _1618 = _1574;
        }
        float _1624 = _1618;
        bool _1626 = !_1614;
        _1596 = _1624;
        if (!_1626)
        {
            float _1628 = rsqrt(_1604);
            float _1630 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1632 = _190 * _1628;
            float _1634 = _188 * _1628;
            float _1636 = _192 * _1628;
            float _1638 = _1610 * _1632;
            float _1640 = fma(_1608, _1634, _1638);
            float _1642 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1644 = fma(_1612, _1636, _1640);
            float _1646 = _1644 * _1642;
            float _1648 = fma(_188, _1646, _1570);
            float _1650 = fma(_190, _1646, _1566);
            float _1652 = fma(_192, _1646, _1574);
            _1590 = _1648;
            _1586 = _1650;
            _1596 = _1652;
        }
    }
    float _1654 = _1590;
    float _1656 = _1586;
    float _1658 = _1596;
    float _1660 = -_818;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1654);
    float _1664 = -_800;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _1668 = -_866;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1672 = _1666;
    float _1674 = _1662;
    float _1676 = _1670;
    if (_1562)
    {
        _196 = 1.0;
    }
    float _1678 = _196;
    float _1680 = _1678;
    if (!_1550)
    {
        float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1684 = _1382 + _1682;
        float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1688 = _1412 + _1686;
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1692 = -_1404;
        float _1694 = _1692 + _1654;
        float _1696 = _1684 * _1684;
        float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1700 = _1418 + _1698;
        float _1702 = -_1370;
        float _1704 = _1702 + _1656;
        float _1706 = -_1352;
        float _1708 = _1706 + _1658;
        float _1710 = fma(_1688, _1688, _1696);
        float _1712 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1714 = fma(_1700, _1700, _1710);
        float _1716 = sqrt(_1714);
        float _1718 = 1.0 / _948;
        bool _1720 = _1716 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1722 = isnan(_1716);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1728 = _1724 || _1726;
        float _1730 = precise::min(_1716, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1732 = _1730 * _1690;
        float _1734 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1736 = _1694 * _1718;
        float _1738 = _1704 * _1718;
        float _1740 = _1708 * _1718;
        float _1742 = _1734 * _1732;
        float _1744 = _866;
        float _1746 = _1716;
        float _1748 = _1734;
        _1434 = _1738;
        if (_1728)
        {
            float _1750 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1744 = _1750;
        }
        float _1752 = _1744;
        if (_1728)
        {
            float _1754 = precise::max(_1716, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1746 = _1754;
        }
        float _1756 = _1746;
        float _1758 = fma(_1736, _1742, _1412);
        float _1760 = fma(_1738, _1742, _1382);
        float _1762 = fma(_1740, _1742, _1418);
        float _1764 = _1756;
        float _1766 = _1752;
        float _1768 = _1758;
        if (_1728)
        {
            float _1770 = _1756 * _1752;
            _1764 = _1770;
        }
        float _1772 = _1764;
        float _1774 = _1772;
        if (_1728)
        {
            float _1776 = _1734 * _1772;
            _1766 = _1776;
        }
        float _1778 = _1766;
        if (!_1728)
        {
            _1774 = _1758;
        }
        float _1780 = _1774;
        float _1782 = _1780;
        if (!_1728)
        {
            _1748 = _1760;
        }
        float _1784 = _1748;
        float _1786 = _1784;
        if (_1728)
        {
            float _1788 = fma(_1736, _1778, _1412);
            _1782 = _1788;
        }
        float _1790 = _1782;
        _1674 = _1790;
        if (!_1728)
        {
            _1768 = _1762;
        }
        float _1792 = _1768;
        _1676 = _1792;
        if (_1728)
        {
            float _1794 = fma(_1738, _1778, _1382);
            _1786 = _1794;
        }
        float _1796 = _1786;
        _1672 = _1796;
        if (_1728)
        {
            float _1798 = fma(_1740, _1778, _1418);
            _1676 = _1798;
        }
    }
    float _1800 = _1434;
    float _1802 = _1672;
    float _1804 = _1674;
    float _1806 = _1676;
    float _1808 = _1800;
    if (_1562)
    {
        _1578 = 1.0;
    }
    float _1810 = _1578;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1814 = _1552 * _1812;
    float _1816 = _1810;
    if (!_1562)
    {
        float _1818 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1820;
        float _1824 = _1818 * 0.15915493667125701904296875;
        float _1826 = _1824 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        float _1830 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1832 = _1830 * 0.15915493667125701904296875;
        float _1834 = _1824 * 6.283185482025146484375;
        float _1836 = sin(_1834);
        float _1838 = 1.0 / _1828;
        float _1840 = _1832 * 6.283185482025146484375;
        float _1842 = cos(_1840);
        float _1844 = _1836 * _1838;
        float _1846 = _1832 * 6.283185482025146484375;
        float _1848 = sin(_1846);
        float _1850 = _1842 * _1844;
        float _1852 = 1.0 / _1822;
        float _1854 = 1.0 / _1850;
        float _1856 = _1848 * _1854;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = fma(_1814, _1856, _1858);
        float _1862 = _1860 * _1852;
        float _1864 = precise::clamp(_1862, 0.0, 1.0);
        _1808 = _1832;
        _1680 = _1864;
    }
    float _1866 = _1808;
    float _1868 = _1680;
    float _1870 = _1866;
    if (!_1562)
    {
        float _1872 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1874 = _1872 * 0.15915493667125701904296875;
        float _1876 = _1874 * 6.283185482025146484375;
        float _1878 = cos(_1876);
        float _1880 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1882 = _1880 * 0.15915493667125701904296875;
        float _1884 = _1874 * 6.283185482025146484375;
        float _1886 = sin(_1884);
        float _1888 = 1.0 / _1878;
        float _1890 = _1882 * 6.283185482025146484375;
        float _1892 = cos(_1890);
        float _1894 = _1886 * _1888;
        float _1896 = _1882 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        float _1900 = _1892 * _1894;
        float _1902 = 1.0 / _1900;
        float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1906 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1904;
        float _1908 = 1.0 / _1906;
        float _1910 = _1898 * _1902;
        float _1912 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1914 = fma(_1814, _1910, _1912);
        float _1916 = _1914 * _1908;
        float _1918 = precise::clamp(_1916, 0.0, 1.0);
        float _1920 = -_1918;
        float _1922 = _1920 + 1.0;
        _1870 = _1888;
        _1816 = _1922;
    }
    float _1924 = _1870;
    float _1926 = _1816;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1930 = _1802 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1934 = _1804 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1806 + _1936;
    float _1940 = _1930 * _1930;
    float _1942 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1944 = fma(_1934, _1934, _1940);
    float _1946 = fma(_1938, _1938, _1944);
    float _1948 = rsqrt(_1946);
    float _1950 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1952 = _1934 * _1950;
    float _1954 = _1938 * _1950;
    float _1956 = _1952 * _1952;
    float _1958 = _1954 * _1954;
    float _1960 = _1956 + _1958;
    float _1962 = sqrt(_1960);
    bool _1964 = _1962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1968 = _1962 + _1966;
    float _1970 = _1948;
    float _1972 = _1960;
    float _1974 = _1968;
    float _1976 = _1924;
    float _1978 = _1930;
    float _1980 = _1952;
    if (_1964)
    {
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1982;
    }
    float _1984 = _1970;
    if (_1964)
    {
        float _1986 = rsqrt(_1960);
        _1972 = _1986;
    }
    float _1988 = _1972;
    float _1990 = _1988;
    if (_1964)
    {
        float _1992 = _1968 * _1984;
        _1974 = _1992;
    }
    float _1994 = _1974;
    if (_1964)
    {
        float _1996 = _1994 * 0.15915493667125701904296875;
        _1976 = _1996;
    }
    float _1998 = _1976;
    float _2000 = _1984;
    float _2002 = _1998;
    if (_1964)
    {
        float _2004 = _1998 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        _2000 = _2006;
    }
    float _2008 = _2000;
    float _2010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2012 = precise::max(0.0, _2010);
    float _2014 = _1938;
    float _2016 = _2012;
    if (_1964)
    {
        float _2018 = _1998 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = -_1950;
    float _2026 = -_2012;
    float _2028 = fma(_1930, _2024, _2026);
    float _2030 = _2028;
    if (_1964)
    {
        float _2032 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2016 = _2032;
    }
    float _2034 = _2016;
    if (!_1964)
    {
        _2002 = _1958;
    }
    float _2036 = _2002;
    float _2038 = _2008;
    float _2040 = _2036;
    if (_1964)
    {
        float _2042 = fma(_2008, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2038 = _2042;
    }
    float _2044 = _2038;
    float _2046 = sqrt(_1946);
    float _2048 = _2044;
    if (_1964)
    {
        float _2050 = _2022 + (-1.0);
        _1978 = _2050;
    }
    float _2052 = _1978;
    float _2054 = _2052;
    if (_1964)
    {
        float _2056 = _1988 * _2044;
        _1580 = _2056;
    }
    float _2058 = _1580;
    if (!_1964)
    {
        _1990 = _1954;
    }
    float _2060 = _1990;
    float _2062 = _2060;
    if (_1964)
    {
        float _2064 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2054 = _2064;
    }
    float _2066 = _2054;
    if (_1964)
    {
        float _2068 = _1952 * _2058;
        _1980 = _2068;
    }
    float _2070 = _1980;
    if (!_1964)
    {
        _2048 = _1956;
    }
    float _2072 = _2048;
    float _2074 = _2072;
    if (_1964)
    {
        float _2076 = _1954 * _2058;
        _2062 = _2076;
    }
    float _2078 = _2062;
    if (_1964)
    {
        float _2080 = fma(_2028, _2022, _2066);
        _2030 = _2080;
    }
    float _2082 = _2030;
    if (_1964)
    {
        float _2084 = _2070 * _2070;
        _2074 = _2084;
    }
    float _2086 = _2074;
    float _2088 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1964)
    {
        float _2090 = _2078 * _2078;
        _2040 = _2090;
    }
    float _2092 = _2040;
    float _2094 = fma(_2082, _2082, _2086);
    float _2096 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2088);
    float _2098 = _2094 + _2092;
    float _2100 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2102 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = rsqrt(_2098);
    float _2112 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2096);
    float _2114 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2102);
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = _2112 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2122 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2114);
    float _2124 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2126 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2128 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2132 = abs(_2118);
    float _2134 = log2(_2132);
    float _2136 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2128);
    float _2138 = -_2130;
    float _2140 = fma(_2138, _2126, 1.0);
    float _2142 = _2110 * _2070;
    float _2144 = _2110 * _2082;
    float _2146 = _2110 * _2078;
    float _2148 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1942);
    float _2150 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2136);
    float _2152 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2154 = floor(_2124);
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2158 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2162 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2148);
    float _2164 = -_2156;
    float _2166 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2164);
    float _2168 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2160);
    float _2172 = floor(_2100);
    float _2174 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2176 = -_2146;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2166);
    float _2180 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2170);
    float _2182 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = _2144 + 1.0;
    float _2186 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2188 = log2(_2140);
    float _2190 = -_2154;
    float _2192 = _2124 + _2190;
    float _2194 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2196 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2194);
    float _2198 = exp2(_2168);
    float _2200 = fma(_2178, -0.5, 0.5);
    float _2202 = -_2172;
    float _2204 = _2100 + _2202;
    float _2206 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2208 = fma(_2178, 0.5, 0.5);
    float _2210 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2196);
    float _2212 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2206);
    float _2214 = 1.0 / _2186;
    float _2216 = fma(_2208, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2218 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2210);
    float _2220 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2212);
    float _2222 = _2188 * 0.693147182464599609375;
    float _2224 = fma(_2208, _2216, -0.212114393711090087890625);
    float _2226 = sqrt(_2200);
    float _2228 = -_2144;
    float _2230 = fma(_2198, _2184, _2228);
    float2 _6365 = float2(_2192, _2204);
    float _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6365, float2(0.0), isnan(_6365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6365, float2(0.0), isnan(_6365)), level(0.0)).x;
    float _2234 = fma(_2208, _2224, 1.570728778839111328125);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2238 = fma(_2230, 0.5, 0.5);
    float _2240 = _2218 * _2214;
    float _2242 = _2220 * _2214;
    float _2244 = fma(_2240, 0.5, 0.5);
    float _2246 = fma(_2242, -0.5, 0.5);
    float _2248 = _2226 * 0.636619746685028076171875;
    float3 _6399 = float3(_2244, _2246, _2236);
    float _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6399, float3(0.0), isnan(_6399)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6399, float3(0.0), isnan(_6399)), level(0.0)).x;
    float _2252 = -_2234;
    float _2254 = fma(_2248, _2252, 1.0);
    float3 _6415 = float3(_2244, _2246, _2236);
    float4 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6415, float3(0.0), isnan(_6415)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6415, float3(0.0), isnan(_6415)), level(0.0)).xyzw;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = _2257.w;
    float2 _6431 = float2(_2254, _2238);
    float3 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6431, float2(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6431, float2(0.0), isnan(_6431)), level(0.0)).xyz;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = abs(_1814);
    float _2279 = log2(_2277);
    bool _2281 = _1310 != 0.0;
    bool _2283 = isnan(_1310);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan(0.0);
    bool _2289 = _2285 || _2287;
    float _2291 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _1804;
    out.m_79.y = _1802;
    out.m_79.z = _1806;
    bool _2293 = _1308 == 0.0;
    bool _2295 = !_2289;
    bool _2297 = _2293 && _2295;
    float _2299 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    bool _2301 = _1312 == 0.0;
    bool _2303 = _2301 && _2297;
    float _2305 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2299);
    bool _2307 = _1814 <= 8000.0;
    bool _2309 = isnan(_1814);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(8000.0);
    bool _2315 = _2311 || _2313;
    float _2317 = float(_2315);
    out.m_81.x = _1412;
    out.m_81.y = _1382;
    out.m_81.z = _1418;
    float _2319 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2321 = in.m_83.x;
    float _2323 = in.m_83.y;
    float _2325 = in.m_83.z;
    float _2327 = exp2(_2319);
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = _2323;
    float _2335 = _2325;
    float _2337 = _2321;
    if (!_2303)
    {
        float _2339 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2323);
        _2333 = _2339;
    }
    float _2341 = _2333;
    float _2343 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2345 = fma(_2331, -2.0, 3.0);
    float _2347 = _2331 * _2331;
    if (!_2303)
    {
        float _2349 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2325);
        _2335 = _2349;
    }
    float _2351 = _2335;
    if (!_2303)
    {
        float _2353 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2321);
        _2337 = _2353;
    }
    float _2355 = _2337;
    float _2357 = in.m_85.x;
    float _2359 = _2347 * _2345;
    float _2361 = exp2(_2343);
    float _2363 = _1300 * _2341;
    float _2365 = _2186 * 0.5;
    float _2367 = -_2359;
    float _2369 = _2367 + 1.0;
    float _2371 = _1302 * _2341;
    float _2373 = fma(_1364, _2355, _2363);
    float _2375 = _1298 * _2341;
    float _2377 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2359);
    float _2379 = fma(_2220, -0.5, _2365);
    float _2381 = fma(_1082, _2351, _2373);
    float _2383 = _2317 * _2377;
    float _2385 = fma(_1362, _2355, _2371);
    float _2387 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    float _2389 = fma(_1358, _2355, _2375);
    float _2391 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2393 = -_2361;
    float _2395 = _2393 + 1.0;
    float _2397 = fma(_1076, _2351, _2385);
    float _2399 = _2387 + _2186;
    float _2401 = _2218 + _2186;
    float _2403 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2405 = _2399 * 0.5;
    float _2407 = _2401 * 0.5;
    float _2409 = fma(_1078, _2351, _2389);
    bool _2411 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2413 = isnan(_2046);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2419 = _2415 || _2417;
    out.gl_Position.x = _2218;
    out.gl_Position.y = _2220;
    out.gl_Position.z = _2387;
    out.gl_Position.w = _2186;
    out.m_87.x = _2407;
    out.m_87.y = _2379;
    out.m_87.z = _2405;
    out.m_87.w = _2186;
    out.m_89.x = _2397;
    out.m_89.y = _2381;
    out.m_89.z = _2409;
    if (!_2419)
    {
        _1436 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2421 = _1436;
    float _2423 = _2421;
    float _2425 = _2421;
    if (!_2419)
    {
        _1438 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2427 = _1438;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2419)
    {
        _1440 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2433 = _1440;
    float _2435 = -_2232;
    float _2437 = _2435 + 1.0;
    float _2439 = _2437 * _2391;
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2441;
    float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2447 = _2445 * _2357;
    float _2449 = _2357;
    float _2451 = _2433;
    float _2453 = _2433;
    if (!_2419)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _2449;
    float _2457 = _2403 * _2250;
    float _2459 = -_2403;
    float _2461 = _2459 + 1.0;
    float _2463 = _2447 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2465 = _2265 * _2457;
    float _2467 = _2265 * _2461;
    out.m_91.x = _2463;
    float _2469 = _1868 * _1926;
    float _2471 = _2275 * _2457;
    float _2473 = fma(_2271, _2465, _2259);
    float _2475 = fma(_2273, _2465, _2261);
    float _2477 = _2469 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2479 = fma(_2265, _2471, _2263);
    float _2481 = _2465;
    float _2483 = _2469;
    float _2485 = _2455;
    float _2487 = _2455;
    if (!_2419)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2489 = _2481;
    float _2491 = _2489;
    float _2493 = _2489;
    if (!_2419)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2495 = _2483;
    out.m_93.x = _2473;
    out.m_93.y = _2475;
    out.m_93.z = _2479;
    out.m_93.w = _2467;
    bool _2497 = !_2419;
    float _2499 = _2495;
    float _2501 = _2495;
    if (!_2497)
    {
        bool _2503 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2505 = isnan(_2046);
        bool _2507 = _2503 || _2505;
        bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2511 = _2507 || _2509;
        if (!_2511)
        {
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = _2046 + _2513;
            float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2519 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2517;
            float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2525 = 1.0 / _2519;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2543 = _2515 * _2525;
            float _2545 = precise::clamp(_2543, 0.0, 1.0);
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2551 = fma(_2545, _2523, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2553 = fma(_2545, _2549, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2555 = fma(_2545, _2529, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2557 = fma(_2545, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2559 = fma(_2545, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2561 = fma(_2545, _2541, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2431 = _2555;
            _2493 = _2559;
            _2425 = _2551;
            _2487 = _2557;
            _2453 = _2553;
            _2501 = _2561;
            _2563 = true;
        }
        else
        {
            bool _2565 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2567 = isnan(_2046);
            bool _2569 = _2565 || _2567;
            bool _2571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2573 = _2569 || _2571;
            if (!_2573)
            {
                _2423 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2575 = _2423;
            _2425 = _2575;
            if (!_2573)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2577 = _2429;
            _2431 = _2577;
            if (!_2573)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2579 = _2451;
            _2453 = _2579;
            if (!_2573)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2581 = _2485;
            _2487 = _2581;
            if (!_2573)
            {
                _2491 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2583 = _2491;
            _2493 = _2583;
            if (!_2573)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2585 = _2499;
            bool _2587 = !_2573;
            _2501 = _2585;
            if (!_2587)
            {
                bool _2589 = _2046 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2591 = isnan(_2046);
                bool _2593 = _2589 || _2591;
                bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2597 = _2593 || _2595;
                if (!_2597)
                {
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = _2046 + _2599;
                    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2605 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2603;
                    float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2611 = 1.0 / _2605;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2629 = _2601 * _2611;
                    float _2631 = precise::clamp(_2629, 0.0, 1.0);
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2637 = fma(_2631, _2609, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2639 = fma(_2631, _2635, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2641 = fma(_2631, _2615, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2643 = fma(_2631, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2645 = fma(_2631, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2647 = fma(_2631, _2627, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2431 = _2641;
                    _2493 = _2645;
                    _2425 = _2637;
                    _2487 = _2643;
                    _2453 = _2639;
                    _2501 = _2647;
                    _2563 = true;
                }
                else
                {
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2493 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2425 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2563 = false;
    float _2649 = _2431;
    float _2651 = _2493;
    float _2653 = _2425;
    float _2655 = _2487;
    float _2657 = _2453;
    float _2659 = _2501;
    float _2661 = fma(_2381, -0.5, 0.5);
    float _2663 = precise::clamp(_2661, 0.0, 1.0);
    float _2665 = -_2649;
    float _2667 = _2665 + _2651;
    float _2669 = -_2653;
    float _2671 = _2669 + _2655;
    out.m_95.x = 0.0;
    float _2673 = fma(_2663, _2667, _2649);
    float _2675 = -_2657;
    float _2677 = _2675 + _2659;
    float _2679 = fma(_2663, _2671, _2653);
    float _2681 = _2673 * 0.586610972881317138671875;
    bool _2683 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2685 = fma(_2663, _2677, _2657);
    float _2687 = _2477 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2689 = fma(_2679, 0.298911988735198974609375, _2681);
    bool _2691 = _1868 > 0.0;
    bool _2693 = isnan(_1868);
    bool _2695 = _2691 || _2693;
    bool _2697 = isnan(0.0);
    bool _2699 = _2695 || _2697;
    float _2701 = fma(_2685, 0.114477999508380889892578125, _2689);
    out.m_49.x = _2687;
    bool _2703 = _1926 <= 0.0;
    bool _2705 = !_2699;
    bool _2707 = _2703 || _2705;
    float _2709 = -_2701;
    float _2711 = _2679 + _2709;
    float _2713 = -_2701;
    float _2715 = _2673 + _2713;
    float _2717 = -_2701;
    float _2719 = _2685 + _2717;
    float _2721 = fma(_2711, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    float _2723 = fma(_2715, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    float _2725 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2701);
    bool _2727 = !_2683;
    if (!_2727)
    {
        float _2729 = -_1802;
        float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2733 = -_1804;
        float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2737 = -_1806;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2741 = _2731 * _2731;
        float _2743 = fma(_2735, _2735, _2741);
        float _2745 = fma(_2739, _2739, _2743);
        float _2747 = sqrt(_2745);
        float _2749 = rsqrt(_2745);
        float _2751 = -_2747;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2755 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2757 = precise::clamp(_2755, 0.0, 1.0);
        float _2759 = _2735 * _2749;
        float _2761 = _2731 * _2749;
        float _2763 = abs(_2757);
        float _2765 = log2(_2763);
        float _2767 = _2739 * _2749;
        float _2769 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2771 = _2381 * _2761;
        float _2773 = -_2761;
        float _2775 = -_2769;
        float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2775);
        float _2779 = fma(_2397, _2759, _2771);
        float _2781 = -_2767;
        float _2783 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2777);
        float _2785 = fma(_2409, _2767, _2779);
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2791 = _2783 + _2789;
        float _2793 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2795 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2797 = precise::clamp(_2795, 0.0, 1.0);
        float _2799 = exp2(_2793);
        float _2801 = _2799 * _2797;
        float _2803 = _2787 * _2801;
        float _2805 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2807 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2809 = _2803 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2805;
        out.m_95.y = _2807;
        out.m_95.z = _2809;
    }
    out.m_73.x = _2721;
    out.m_73.y = _2723;
    out.m_73.z = _2725;
    if (!_2707)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2811 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2811;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

