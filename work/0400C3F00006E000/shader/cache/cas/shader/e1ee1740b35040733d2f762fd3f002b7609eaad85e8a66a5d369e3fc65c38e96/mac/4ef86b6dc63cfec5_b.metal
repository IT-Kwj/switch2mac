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
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_83 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_107 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_105 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_73 [[user(locn14)]];
    float4 m_109 [[user(locn15)]];
    float4 m_95 [[user(locn16)]];
    float4 m_103 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_101 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_81 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_69 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2623 = false;
    bool _1820 = false;
    bool _518 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_50.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2922 = as_type<float>(_144);
        out.gl_Position.z = _2922;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_55.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = _162;
    if (_158)
    {
        float _166 = float(_128);
        _138 = _166;
    }
    float _168 = _138;
    bool _170 = _162 >= _168;
    bool _172 = !_158;
    bool _174 = _170 || _172;
    float _176 = _168;
    if (_174)
    {
        _176 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _176;
    if (_174)
    {
        out.m_53.x = 0.0;
    }
    if (_174)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2992 = as_type<float>(_182);
        out.gl_Position.z = _2992;
    }
    if (_174)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _200);
    float _208 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _202);
    bool _210 = !_190;
    float _228;
    if (!_210)
    {
        float _212 = in.m_59.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_128);
        float _234 = 1.0 / _232;
        float _236 = _162 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = _238 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _238 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = 1.0 / _258;
    float _270 = 1.0 / _254;
    bool _272 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _274 = isnan(_238);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 1.0 / _266;
    float _288 = _250 * _268;
    bool _290 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _292 = isnan(_238);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = 1.0 / _262;
    float _308 = _242 * _270;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _238 + _310;
    float _314 = -_282;
    float _316 = _314 + 1.0;
    float _318 = fma(_304, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = _312 * _286;
    bool _322 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _324 = isnan(_238);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -_332;
    float _336 = _334 + 1.0;
    float _338 = _332 * _316;
    float _340 = _246 * _306;
    bool _342 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_238);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    bool _358 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_238);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = _352 * _336;
    float _380 = -_352;
    float _382 = _380 + 1.0;
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = _368 * _382;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _300 * _386;
    float _404 = fma(_376, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_396, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = fma(_400, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = _388 * _402;
    float _412 = _390 * _402;
    float _414 = -_300;
    float _416 = _414 + 1.0;
    float _418 = _318 * _402;
    float _420 = in.m_61.x;
    float _422 = in.m_61.y;
    float _424 = in.m_61.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _410);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _444 = fma(_404, _392, _430);
    float _446 = fma(_406, _392, _432);
    float _448 = fma(_428, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_436, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_440, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _466 = fma(_408, _392, _442);
    float _468 = fma(_456, _320, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _470 = fma(_460, _320, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _472 = fma(_464, _320, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _474 = fma(_448, _378, _444);
    float _476 = fma(_450, _378, _446);
    float _478 = fma(_452, _378, _466);
    float _480 = fma(_468, _338, _474);
    float _482 = fma(_470, _338, _476);
    float _484 = fma(_472, _338, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    float _492 = _486 * _420;
    float _494 = _488 * _422;
    float _496 = _490 * _424;
    bool _498 = !_284;
    float _516;
    if (!_498)
    {
        float _500 = in.m_59.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_128);
        float _522 = 1.0 / _520;
        float _524 = _162 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_59.z;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    float _534 = in.m_59.x;
    float _536 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _540 = _538 != 0;
    float _542 = in.m_59.y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = in.m_50.x;
    float _550 = in.m_50.y;
    float _552 = in.m_50.z;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _564 = _562 != 0;
    float _566 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _568 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _570 = _532 * _162;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _574 = _528 * 2.0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _578 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _580 = _534 * 2.0;
    float _582 = floor(_574);
    float _584 = _534 + _528;
    float _586 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _588 = -_544;
    float _590 = fma(_578, 2.0, _588);
    float _592 = _542 * 2.0;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _596 = fma(_586, -2.0, _546);
    float _598 = _550 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _550 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = floor(_580);
    float _604 = _550 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _606 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    float _608 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _612 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[6].x, _604);
    float _614 = _548;
    float _616 = _612;
    if (_540)
    {
        _614 = _534;
    }
    float _618 = _614;
    float _620 = _542 + (-0.5);
    bool _622 = _582 > 0.0;
    float _624 = _584 + (-1.0);
    bool _626 = _582 >= 0.0;
    bool _628 = isnan(_582);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = _542 + _528;
    float _638 = _618;
    if (!_540)
    {
        _638 = _528;
    }
    float _640 = _638;
    float _642 = floor(_592);
    int _644 = _634 ? 0 : 1;
    float _646 = _636 + (-1.0);
    bool _648 = _602 > 0.0;
    float _650 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    bool _652 = _602 >= 0.0;
    bool _654 = isnan(_602);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _664 = ~_644;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    float _670 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _672 = _668;
    float _674 = _640;
    float _676 = _650;
    if (!_622)
    {
        int _678 = ~_644;
        int _680 = _678 + 1;
        _672 = _680;
    }
    int _682 = _672;
    float _684 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    float _686 = _640 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_540)
    {
        _674 = _528;
    }
    float _688 = _674;
    float _690 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _692 = _688;
    if (_540)
    {
        _692 = _542;
    }
    float _694 = _692;
    float _696 = -_572;
    float _698 = fma(_686, 2.0, _696);
    float _700 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    int _702 = _660 ? 0 : 1;
    float _704 = exp2(_570);
    if (!_540)
    {
        _616 = _542;
    }
    float _706 = _616;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _710 = _642 > 0.0;
    float _712 = _700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _714 = _642 >= 0.0;
    bool _716 = isnan(_642);
    bool _718 = _714 || _716;
    bool _720 = isnan(0.0);
    bool _722 = _718 || _720;
    float _724 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[83].w, _708);
    float _726 = _706;
    if (_540)
    {
        _726 = _534;
    }
    float _728 = _726;
    float _730 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _732 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _734 = !_556;
    float _736 = _734 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[83].z, _576);
    int _740 = ~_702;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _748 = _744;
    float _750 = _736;
    if (!_648)
    {
        int _752 = ~_702;
        int _754 = _752 + 1;
        _748 = _754;
    }
    int _756 = _748;
    float _758 = _728 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _760 = abs(as_type<int>(_736));
    float _762 = -_704;
    float _764 = _762 + 1.0;
    float _766 = _758;
    if (_540)
    {
        _750 = _542;
    }
    float _768 = _750;
    float _770 = -_746;
    float _772 = fma(_758, 2.0, _770);
    float _774 = _768;
    if (!_540)
    {
        _774 = _534;
    }
    float _776 = _774;
    float _778 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _724);
    bool _780 = !_560;
    int _782 = _780 ? 0 : 1;
    float _784 = -_162;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[81].x, _772);
    if (!_540)
    {
        _766 = _528;
    }
    float _788 = _766;
    float _790 = _776 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _792 = abs(_782);
    float _794 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _738);
    float _796 = _788;
    if (_540)
    {
        _796 = _542;
    }
    float _798 = _796;
    float _800 = fma(_790, -2.0, _594);
    float _802 = float(_756);
    float _804 = -_162;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[86].x, _698);
    float _808 = _798 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _810 = float(_760);
    float _812 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _800);
    float _814 = float(_792);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _818 = float(_682);
    float _820 = fma(_808, -2.0, _610);
    float _822 = _814 * _802;
    float _824 = _810 * _818;
    int _826 = _722 ? 0 : 1;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _830 = in.m_63.x;
    float _832 = in.m_63.y;
    float _834 = in.m_63.z;
    bool _836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _838 = isnan(1.0);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _844 = _840 || _842;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[88].z, _816);
    float _854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _856 = _712 + _854;
    int _858 = ~_826;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _828);
    int _866 = _862;
    if (!_710)
    {
        int _868 = ~_826;
        int _870 = _868 + 1;
        _866 = _870;
    }
    int _872 = _866;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _876 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].w, _846);
    float _878 = 1.0 / _850;
    float _880 = -_162;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _886 = _730 + _884;
    float _888 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[88].w, _874);
    float _890 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _876);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _732 + _892;
    float _896 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _852);
    bool _898 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _822 * (-2.0);
    float _910 = _856 * _856;
    bool _912 = !_564;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _864);
    float _918 = _906 ? _764 : 0.0;
    float _920 = fma(_886, _886, _910);
    float _922 = fma(_908, _832, _832);
    int _924 = abs(_914);
    float _926 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _888);
    float _928 = fma(_894, _894, _920);
    float _930 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _820);
    float _932 = fma(_662, _908, _662);
    float _934 = _890;
    if (_844)
    {
        float _936 = _918 * _878;
        _164 = _936;
    }
    float _938 = _164;
    float _940 = sqrt(_928);
    float _942 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _944 = _534 + _542;
    float _946 = _536 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _948 = float(_924);
    float _950 = _944 + (-1.0);
    float _952 = rsqrt(_928);
    float _954 = float(_872);
    float _956 = _824 * (-2.0);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _960 = fma(_932, _938, _942);
    float _962 = _948 * _954;
    float _964 = fma(_956, _830, _830);
    float _966 = _940 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _968 = _528 + (-0.5);
    float _970 = _962 * (-2.0);
    float _972 = _534 + (-0.5);
    float _974 = precise::min(_946, _966);
    float _976 = fma(_670, _970, _670);
    float _978 = fma(_970, _834, _834);
    float _980 = _960 * 0.15915493667125701904296875;
    float _982 = fma(_958, _956, _958);
    float _984 = _952 * _974;
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].z, _978);
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _964);
    float _990 = _980 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = _856 * _984;
    float _996 = _886 * _984;
    float _998 = _894 * _984;
    float _1000 = fma(_982, _938, _988);
    float _1002 = -_994;
    float _1004 = _856 + _1002;
    float _1006 = -_996;
    float _1008 = _886 + _1006;
    float _1010 = -_998;
    float _1012 = _894 + _1010;
    float _1014 = fma(_976, _938, _986);
    float _1016 = _1004 * _1004;
    float _1018 = _980 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _1000 * 0.15915493667125701904296875;
    float _1024 = fma(_1008, _1008, _1016);
    float _1026 = fma(_1012, _1012, _1024);
    float _1028 = _1022 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = in.m_65.x;
    float _1034 = in.m_65.y;
    float _1036 = in.m_65.z;
    float _1038 = _1014 * 0.15915493667125701904296875;
    float _1040 = sqrt(_1026);
    float _1042 = _1038 * 6.283185482025146484375;
    float _1044 = cos(_1042);
    float _1046 = _1030 * _1020;
    float _1048 = _1030 * _992;
    float _1050 = _1022 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = _952 * _1040;
    float _1056 = _568 * _1054;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1034);
    float _1060 = _1038 * 6.283185482025146484375;
    float _1062 = sin(_1060);
    float _1064 = _1020 * _1044;
    float _1066 = _1030 * _1044;
    float _1068 = _1052 * _1020;
    float _1070 = _566 * _1054;
    float _1072 = _536 * _1054;
    float _1074 = _1052 * _992;
    float _1076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1032);
    float _1078 = _1070 * _1058;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1036);
    float _1082 = _1052 * _1044;
    float _1084 = fma(_1062, _1046, _1074);
    float _1086 = _1072 * _1076;
    float _1088 = _1066 * _1078;
    float _1090 = _992 * _1044;
    float _1092 = _1056 * _1080;
    float _1094 = -_1068;
    float _1096 = fma(_1062, _1048, _1094);
    float _1098 = -_1078;
    float _1100 = _1062 * _1098;
    float _1102 = fma(_1084, _1086, _1088);
    float _1104 = -_1048;
    float _1106 = fma(_1062, _1068, _1104);
    float _1108 = _1082 * _1078;
    float _1110 = fma(_1064, _1086, _1100);
    float _1112 = fma(_1096, _1092, _1102);
    float _1114 = fma(_1062, _1074, _1046);
    float _1116 = fma(_1106, _1086, _1108);
    float _1118 = fma(_1090, _1092, _1110);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1122 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1124 = fma(_1114, _1092, _1116);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1120);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1122);
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1134 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1138 = _732 + _1134;
    float _1140 = _730 + _1136;
    float _1142 = -_998;
    float _1144 = _732 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1138 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1140 + _1150;
    float _1154 = _1148 * _1148;
    float _1156 = fma(_1152, _1152, _1154);
    float _1158 = -_996;
    float _1160 = _730 + _1158;
    float _1162 = sqrt(_1156);
    float _1164 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1166 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1168 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1166);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1172 = floor(_1164);
    float _1174 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1168);
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1178 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1180 = floor(_1170);
    float _1182 = _712 + _1176;
    float _1184 = _1124;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    float _1188 = _1166;
    float _1190 = _1144;
    if (!_1178)
    {
        _1184 = _1140;
    }
    float _1192 = _1184;
    float _1194 = _1192;
    if (!_1178)
    {
        _1186 = _1138;
    }
    float _1196 = _1186;
    float _1198 = _1196;
    if (!_1178)
    {
        _1188 = _1182;
    }
    float _1200 = _1188;
    bool _1202 = !_1178;
    float _1204 = _1200;
    if (!_1202)
    {
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1210 = _1162 + _1208;
        float _1212 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = rsqrt(_1156);
        float _1216 = _1210 * _1206;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1218 * 6.283185482025146484375;
        float _1222 = cos(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = sin(_1224);
        float _1228 = _1222 + (-1.0);
        float _1230 = fma(_1226, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = _1214 * _1230;
        float _1236 = fma(_1182, _1222, _1232);
        float _1238 = fma(_1152, _1234, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1240 = fma(_1148, _1234, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1194 = _1238;
        _1198 = _1240;
        _1204 = _1236;
    }
    float _1242 = _1194;
    float _1244 = _1198;
    float _1246 = _1204;
    float _1248 = fma(_1242, 6.2500002968590706586837768554688e-05, 0.5);
    float _1250 = fma(_1244, 6.2500002968590706586837768554688e-05, 0.5);
    float _1252 = -_1172;
    float _1254 = _1164 + _1252;
    float _1256 = -_1180;
    float _1258 = _1170 + _1256;
    float2 _4738 = float2(_1248, _1250);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4738, float2(0.0), isnan(_4738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4738, float2(0.0), isnan(_4738)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float2 _4754 = float2(_1254, _1258);
    float _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4754, float2(0.0), isnan(_4754)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4754, float2(0.0), isnan(_4754)), level(0.0)).x;
    float _1272 = in.m_67.y;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1276 = _528 > 0.5;
    float _1278 = in.m_59.w;
    bool _1280 = _542 > 0.5;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1286 = in.m_67.x;
    float _1288 = 1.0 / _1284;
    bool _1290 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1292 = isnan(_526);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1302;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1308 = _1306 != 0;
    float _1310 = in.m_69.w;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1318 = _526 + _1316;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1322 = _1320 != 0;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1328 = _1326 != 0;
    float _1330 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_71.w = _974;
    bool _1332 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1334 = isnan(_526);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1272;
    float _1346 = _1344 + 1.0;
    float _1348 = -_994;
    float _1350 = _1348 + _1246;
    float _1352 = _1304 * _1288;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1356 = _1278 > 0.5;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1360 = _1280 ? as_type<int>(_1346) : as_type<int>(_1272);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1364 = _1356 ? as_type<int>(_1346) : as_type<int>(_1272);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1368 = _1308 ? as_type<float>(_1360) : _1272;
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1374 = _1372 != 0;
    float _1376 = fma(_1352, _1318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1380 = _1378 != 0;
    float _1382 = fma(_1366, _1368, -0.5);
    out.m_73.w = _1310;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1386 = _1374 ? as_type<float>(_1364) : _1272;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1390 = _1374;
    float _1392 = _1318;
    float _1394 = _1272;
    float _1396 = _1330;
    int _1398 = as_type<int>(_1358);
    float _1400 = _1286;
    if (_1314)
    {
        bool _1402 = _534 > 0.5;
        _1390 = _1402;
    }
    bool _1404 = _1390;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1408 = in.m_75.x;
    float _1410 = in.m_75.y;
    float _1412 = in.m_75.z;
    float _1414 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1416 = as_type<int>(_1414);
    if (!_1314)
    {
        _1392 = _1286;
    }
    float _1418 = _1392;
    float _1420 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1418;
    if (_1380)
    {
        float _1424 = _1276 ? _1346 : _1272;
        _1394 = _1424;
    }
    float _1426 = _1394;
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1430 = _1034 != 0.0;
    bool _1432 = isnan(_1034);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1386, _1330, -0.5);
    out.m_77.x = _1370;
    out.m_77.y = _1414;
    out.m_77.z = _1420;
    out.m_77.w = _1358;
    if (!_1322)
    {
        _1396 = _1286;
    }
    float _1442 = _1396;
    float _1444 = -_996;
    float _1446 = _1444 + _1242;
    bool _1448 = _1032 == 0.0;
    bool _1450 = !_1438;
    bool _1452 = _1448 && _1450;
    float _1454 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1458 = -_930;
    float _1460 = fma(_778, _1440, _1458);
    bool _1462 = _1036 == 0.0;
    bool _1464 = _1462 && _1452;
    float _1466 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1468 = -_998;
    float _1470 = _1468 + _1244;
    out.m_79.x = _1072;
    float _1472 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1474 = -_1300;
    float _1476 = _1474 + 1.0;
    float _1478 = _1442;
    if (_1314)
    {
        float _1480 = -_1286;
        float _1482 = _1480 + 1.0;
        _1416 = as_type<int>(_1482);
    }
    int _1484 = _1416;
    float _1486 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1488 = _1484;
    if (_1328)
    {
        float _1490 = -_1286;
        float _1492 = _1490 + 1.0;
        _1398 = as_type<int>(_1492);
    }
    int _1494 = _1398;
    float _1496 = _1342 * _1476;
    float _1498 = -_1342;
    float _1500 = _1498 + 1.0;
    float _1502 = _1500;
    if (_1314)
    {
        float _1504 = _1404 ? as_type<float>(_1484) : _1286;
        _1422 = _1504;
    }
    float _1506 = _1422;
    if (_1322)
    {
        float _1508 = -_1286;
        float _1510 = _1508 + 1.0;
        _1488 = as_type<int>(_1510);
    }
    int _1512 = _1488;
    float _1514 = _1376 * _1496;
    float _1516 = -_650;
    float _1518 = fma(_890, _1382, _1516);
    float _1520 = fma(_1486, _1426, -0.5);
    if (_1464)
    {
        _934 = _1408;
    }
    float _1522 = _934;
    float _1524 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1514);
    float _1526 = _1522;
    if (_1322)
    {
        float _1528 = _1276 ? as_type<float>(_1512) : _1286;
        _1478 = _1528;
    }
    float _1530 = _1478;
    float _1532 = fma(_1472, _1506, -0.5);
    if (_1328)
    {
        float _1534 = _1280 ? as_type<float>(_1494) : _1286;
        _1400 = _1534;
    }
    float _1536 = _1400;
    if (!_1464)
    {
        float _1538 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1408);
        _1526 = _1538;
    }
    float _1540 = _1526;
    float _1542 = in.m_81.x;
    float _1544 = in.m_81.y;
    float _1546 = in.m_81.z;
    float _1548 = in.m_81.w;
    if (_1464)
    {
        _676 = _1410;
    }
    float _1550 = _676;
    float _1552 = _1550;
    if (!_1464)
    {
        float _1554 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1410);
        _1552 = _1554;
    }
    float _1556 = _1552;
    float _1558 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1560 = fma(_1454, _1530, -0.5);
    float _1562 = fma(_1558, _1536, -0.5);
    float _1564 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1524);
    if (_1464)
    {
        _1502 = _1412;
    }
    float _1566 = _1502;
    float _1568 = _1566;
    if (!_1464)
    {
        float _1570 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1412);
        _1568 = _1570;
    }
    float _1572 = _1568;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1580 = fma(_916, _1532, _882);
    float _1582 = fma(_794, _1560, _786);
    float _1584 = fma(_896, _1562, _806);
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1590 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1564 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1594 = -_812;
    float _1596 = fma(_926, _1520, _1594);
    float _1598 = _1584 + 0.5;
    float _1600 = _1544 * _1412;
    float _1602 = _1546 * _1408;
    float _1604 = _1542 * _1410;
    float _1606 = _1460 + 0.5;
    float _1608 = -_1600;
    float _1610 = fma(_1546, _1410, _1608);
    float _1612 = -_1602;
    float _1614 = fma(_1542, _1412, _1612);
    float _1616 = -_1604;
    float _1618 = fma(_1544, _1408, _1616);
    float _1620 = _1518 + 0.5;
    float _1622 = _1580 + 0.5;
    float _1624 = _1582 + 0.5;
    out.m_83.x = _1586;
    out.m_83.y = _1588;
    out.m_83.z = _1590;
    out.m_83.w = _1592;
    float _1626 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1628 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1630 = _1596 + 0.5;
    out.m_85.x = _1622;
    out.m_85.y = _1620;
    out.m_85.z = _1624;
    out.m_85.w = _1606;
    float _1632 = -_1062;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1626);
    float _1636 = _1614 * _1548;
    float _1638 = _1610 * _1548;
    out.m_87.x = _1598;
    out.m_87.y = _1630;
    float _1640 = _1618 * _1548;
    float _1642 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = -_1062;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1466);
    float _1648 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1650 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1652 = -_1062;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1628);
    float _1656 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1658 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1660 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1646);
    float _1662 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1648);
    float _1664 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1650);
    float _1666 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1634);
    float _1668 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1654);
    float _1670 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1658);
    float _1672 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1656);
    float _1674 = _1660 * _1556;
    float _1676 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1678 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1664);
    float _1680 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1682 = _1660 * _1544;
    float _1684 = _1666 * _1544;
    float _1686 = _1668 * _1544;
    float _1688 = fma(_1672, _1540, _1674);
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1692 = _1350 + _1690;
    float _1694 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1680);
    float _1696 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1698 = _1666 * _1556;
    float _1700 = _1636 * _1666;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1704 = _1446 + _1702;
    float _1706 = _1692 * _1692;
    float _1708 = _1636 * _1660;
    float _1710 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1696);
    float _1712 = _1668 * _1556;
    float _1714 = fma(_1704, _1704, _1706);
    float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1718 = _1470 + _1716;
    float _1720 = _1636 * _1668;
    float _1722 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1670);
    float _1724 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1694);
    float _1726 = fma(_1718, _1718, _1714);
    float _1728 = fma(_1676, _1540, _1698);
    float _1730 = fma(_1672, _1542, _1682);
    float _1732 = fma(_1638, _1672, _1708);
    float _1734 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1710);
    float _1736 = fma(_1678, _1540, _1712);
    float _1738 = sqrt(_1726);
    float _1740 = fma(_1676, _1542, _1684);
    float _1742 = fma(_1678, _1542, _1686);
    float _1744 = fma(_1638, _1676, _1700);
    float _1746 = fma(_1638, _1678, _1720);
    float _1748 = fma(_1722, _1546, _1730);
    float _1750 = fma(_1724, _1546, _1740);
    float _1752 = fma(_1734, _1546, _1742);
    float _1754 = fma(_1722, _1572, _1688);
    float _1756 = fma(_1640, _1722, _1732);
    float _1758 = fma(_1640, _1724, _1744);
    float _1760 = fma(_1640, _1734, _1746);
    float _1762 = fma(_1724, _1572, _1728);
    float _1764 = fma(_1734, _1572, _1736);
    out.m_89.x = _1748;
    out.m_89.y = _1750;
    out.m_89.z = _1752;
    float _1766 = -_994;
    float _1768 = _712 + _1766;
    bool _1770 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1772 = isnan(_1738);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1778 = _1774 || _1776;
    out.m_91.x = _1756;
    out.m_91.y = _1758;
    out.m_91.z = _1760;
    out.m_93.x = _1754;
    out.m_93.y = _1762;
    out.m_93.z = _1764;
    float _1780 = _1640;
    float _1782 = _1722;
    if (!_1778)
    {
        _1780 = 1.0;
    }
    float _1784 = _1780;
    out.m_95.x = _1264;
    out.m_95.y = _1266;
    out.m_95.z = _1268;
    bool _1786 = !_1778;
    float _1788 = _1784;
    float _1790 = _1266;
    if (!_1786)
    {
        bool _1792 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1794 = isnan(_1738);
        bool _1796 = _1792 || _1794;
        bool _1798 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1800 = _1796 || _1798;
        if (!_1800)
        {
            float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1804 = _1738 + _1802;
            float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1808 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1814 = 1.0 / _1808;
            float _1816 = _1804 * _1814;
            float _1818 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1788 = _1818;
            _1790 = _1814;
            _1820 = true;
        }
        else
        {
            bool _1822 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1824 = isnan(_1738);
            bool _1826 = _1822 || _1824;
            bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1830 = _1826 || _1828;
            if (!_1830)
            {
                float _1832 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1834 = _1738 + _1832;
                float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1838 = _1836 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1844 = 1.0 / _1838;
                float _1846 = _1834 * _1844;
                float _1848 = fma(_1846, _1842, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1788 = _1848;
                _1790 = _1844;
                _1820 = true;
            }
            else
            {
                _1788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1820 = false;
    float _1850 = _1788;
    float _1852 = _1790;
    float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1856 = _1350 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1860 = _1446 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1864 = _1470 + _1862;
    float _1866 = fma(_1856, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1868 = fma(_1860, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1870 = fma(_1864, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1872 = -_1768;
    float _1874 = _1872 + _1866;
    float _1876 = -_1160;
    float _1878 = _1876 + _1868;
    float _1880 = -_1144;
    float _1882 = _1880 + _1870;
    float _1884 = _1874 * _1874;
    float _1886 = fma(_1878, _1878, _1884);
    float _1888 = fma(_1882, _1882, _1886);
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > 0.0;
    float _1894 = _1890;
    float _1896 = _1852;
    float _1898 = _1856;
    float _1900 = _1874;
    if (!_1892)
    {
        _1894 = _1868;
    }
    float _1902 = _1894;
    float _1904 = _1902;
    if (!_1892)
    {
        _1896 = _1866;
    }
    float _1906 = _1896;
    float _1908 = _1906;
    if (!_1892)
    {
        _1898 = _1870;
    }
    float _1910 = _1898;
    bool _1912 = !_1892;
    float _1914 = _1910;
    float _1916 = _1910;
    if (!_1912)
    {
        float _1918 = _206 * _206;
        float _1920 = fma(_204, _204, _1918);
        float _1922 = rsqrt(_1888);
        float _1924 = fma(_208, _208, _1920);
        float _1926 = sqrt(_1924);
        float _1928 = _1878 * _1922;
        float _1930 = _1874 * _1922;
        float _1932 = _1882 * _1922;
        bool _1934 = _1926 > 0.0;
        float _1936 = _1922;
        float _1938 = _1926;
        _1900 = _1930;
        if (!_1934)
        {
            _1936 = _1868;
        }
        float _1940 = _1936;
        _1904 = _1940;
        if (!_1934)
        {
            _1938 = _1866;
        }
        float _1942 = _1938;
        _1908 = _1942;
        if (!_1934)
        {
            _1914 = _1870;
        }
        float _1944 = _1914;
        bool _1946 = !_1934;
        _1916 = _1944;
        if (!_1946)
        {
            float _1948 = rsqrt(_1924);
            float _1950 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1952 = _206 * _1948;
            float _1954 = _204 * _1948;
            float _1956 = _208 * _1948;
            float _1958 = _1930 * _1952;
            float _1960 = fma(_1928, _1954, _1958);
            float _1962 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1964 = fma(_1932, _1956, _1960);
            float _1966 = _1964 * _1962;
            float _1968 = fma(_204, _1966, _1868);
            float _1970 = fma(_206, _1966, _1866);
            float _1972 = fma(_208, _1966, _1870);
            _1908 = _1970;
            _1904 = _1968;
            _1916 = _1972;
        }
    }
    float _1974 = _1908;
    float _1976 = _1904;
    float _1978 = _1916;
    float _1980 = _1900;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1974 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1992 = _1978 + _1990;
    float _1994 = _1984 * _1984;
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2000 = fma(_1992, _1992, _1996);
    float _2002 = rsqrt(_2000);
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2006 = _1988 * _2004;
    float _2008 = _1992 * _2004;
    float _2010 = _2006 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 + _2012;
    float _2016 = sqrt(_2014);
    bool _2018 = _2016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = _2016 + _2020;
    float _2024 = _2002;
    float _2026 = _2014;
    float _2028 = _2022;
    float _2030 = _1980;
    float _2032 = _2004;
    float _2034 = _2006;
    if (_2018)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2024 = _2036;
    }
    float _2038 = _2024;
    if (_2018)
    {
        float _2040 = rsqrt(_2014);
        _2026 = _2040;
    }
    float _2042 = _2026;
    float _2044 = _2042;
    if (_2018)
    {
        float _2046 = _2022 * _2038;
        _2028 = _2046;
    }
    float _2048 = _2028;
    if (_2018)
    {
        float _2050 = _2048 * 0.15915493667125701904296875;
        _2030 = _2050;
    }
    float _2052 = _2030;
    float _2054 = _1870;
    if (_2018)
    {
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2064 = precise::max(0.0, _2062);
    float _2066 = _1992;
    float _2068 = _2064;
    float _2070 = _2062;
    if (_2018)
    {
        float _2072 = _2052 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        _2066 = _2074;
    }
    float _2076 = _2066;
    float _2078 = -_2004;
    float _2080 = -_2064;
    float _2082 = fma(_1984, _2078, _2080);
    float _2084 = _2082;
    if (_2018)
    {
        float _2086 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2068 = _2086;
    }
    float _2088 = _2068;
    float _2090 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2092 = _2060;
    float _2094 = _2088;
    if (_2018)
    {
        float _2096 = fma(_2060, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2092 = _2096;
    }
    float _2098 = _2092;
    float _2100 = _2098;
    if (!_2018)
    {
        _2094 = _2008;
    }
    float _2102 = _2094;
    float _2104 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2090);
    float _2106 = _2102;
    if (_2018)
    {
        float _2108 = _2076 + (-1.0);
        _2070 = _2108;
    }
    float _2110 = _2070;
    if (_2018)
    {
        float _2112 = _2042 * _2098;
        _1782 = _2112;
    }
    float _2114 = _1782;
    if (!_2018)
    {
        _2100 = _2082;
    }
    float _2116 = _2100;
    float _2118 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2104);
    float _2120 = _2116;
    if (_2018)
    {
        float _2122 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2122;
    }
    float _2124 = _2032;
    if (_2018)
    {
        float _2126 = _2006 * _2114;
        _2034 = _2126;
    }
    float _2128 = _2034;
    if (!_2018)
    {
        _2044 = _2010;
    }
    float _2130 = _2044;
    float _2132 = _2130;
    if (_2018)
    {
        float _2134 = _2008 * _2114;
        _2106 = _2134;
    }
    float _2136 = _2106;
    if (_2018)
    {
        float _2138 = fma(_2082, _2076, _2124);
        _2120 = _2138;
    }
    float _2140 = _2120;
    if (_2018)
    {
        float _2142 = _2128 * _2128;
        _2132 = _2142;
    }
    float _2144 = _2132;
    float _2146 = sqrt(_2000);
    if (!_2018)
    {
        _2084 = _2012;
    }
    float _2148 = _2084;
    float _2150 = _2148;
    if (_2018)
    {
        float _2152 = _2136 * _2136;
        _2150 = _2152;
    }
    float _2154 = _2150;
    float _2156 = fma(_2140, _2140, _2144);
    float _2158 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2160 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = _2156 + _2154;
    float _2164 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2158);
    float _2166 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2170 = rsqrt(_2162);
    float _2172 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2164);
    float _2174 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2178 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2176);
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    float _2182 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2184 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2186 = -_2180;
    float _2188 = _2186 + 1.0;
    float _2190 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2194 = abs(_2188);
    float _2196 = log2(_2194);
    float _2198 = -_2190;
    float _2200 = fma(_2198, _1998, 1.0);
    float _2202 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2204 = _2170 * _2128;
    float _2206 = _2170 * _2140;
    float _2208 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2168);
    float _2210 = _2170 * _2136;
    float _2212 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2214 = log2(_2200);
    float _2216 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2218 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2220 = -_2212;
    float _2222 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2220);
    float _2224 = _2206 + 1.0;
    float _2226 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2216);
    float _2228 = -_2210;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2222);
    float _2232 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2234 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2226);
    float _2236 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = exp2(_2232);
    float _2242 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2234);
    float _2244 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2246 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2236);
    float _2248 = fma(_2230, 0.5, 0.5);
    float _2250 = _2214 * 0.693147182464599609375;
    float _2252 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2244);
    float _2254 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2246);
    float _2256 = 1.0 / _2242;
    float _2258 = fma(_2248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2260 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2252);
    float _2262 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2254);
    float _2264 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2266 = fma(_2248, _2258, -0.212114393711090087890625);
    float _2268 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2260);
    float _2270 = sqrt(_2238);
    float _2272 = -_2206;
    float _2274 = fma(_2240, _2224, _2272);
    float _2276 = fma(_2248, _2266, 1.570728778839111328125);
    float _2278 = fma(_2274, 0.5, 0.5);
    float _2280 = _2262 * _2256;
    float _2282 = _2268 * _2256;
    float _2284 = fma(_2280, 0.5, 0.5);
    float _2286 = fma(_2282, -0.5, 0.5);
    float _2288 = _2270 * 0.636619746685028076171875;
    float3 _6521 = float3(_2284, _2286, _2264);
    float _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6521, float3(0.0), isnan(_6521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6521, float3(0.0), isnan(_6521)), level(0.0)).x;
    float3 _6532 = float3(_2284, _2286, _2264);
    float4 _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6532, float3(0.0), isnan(_6532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6532, float3(0.0), isnan(_6532)), level(0.0)).xyzw;
    float _2295 = _2293.x;
    float _2297 = _2293.y;
    float _2299 = _2293.z;
    float _2301 = _2293.w;
    float _2303 = -_2276;
    float _2305 = fma(_2288, _2303, 1.0);
    float2 _6553 = float2(_2305, _2278);
    float3 _2307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6553, float2(0.0), isnan(_6553)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6553, float2(0.0), isnan(_6553)), level(0.0)).xyz;
    float _2309 = _2307.x;
    float _2311 = _2307.y;
    float _2313 = _2307.z;
    float _2315 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2317 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2319 = -_1270;
    float _2321 = _2319 + 1.0;
    float _2323 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2325 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2315);
    out.m_97.x = _1160;
    out.m_97.y = _1768;
    out.m_97.z = _1144;
    float _2327 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2325);
    float _2329 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2331 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2323);
    float _2333 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2335 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2329);
    float _2337 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2331);
    float _2339 = 1.0 / _2333;
    float _2341 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2335);
    float _2343 = _2262 + _2242;
    float _2345 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2337);
    out.m_99.x = _1976;
    out.m_99.y = _1974;
    out.m_99.z = _1978;
    float _2347 = _2341 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2349 = _2343 * 0.5;
    out.gl_Position.x = _2262;
    out.gl_Position.y = _2268;
    out.gl_Position.z = _2345;
    out.gl_Position.w = _2242;
    float _2351 = _2347 + _2333;
    float _2353 = _2351 * _2339;
    float _2355 = _2353 * 0.5;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2359 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2357);
    bool _2361 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan(0.5);
    bool _2369 = _2365 || _2367;
    float _2371 = 1.0 / _2359;
    float _2373 = _2337;
    float _2375 = _2317;
    float _2377 = _2321;
    float _2379 = _2268;
    float _2381 = _2262;
    if (_2369)
    {
        _2373 = 1.0;
    }
    float _2383 = _2373;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2387 = _2371 * _2385;
    float _2389 = in.m_101.x;
    float _2391 = abs(_2387);
    float _2393 = log2(_2391);
    float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2397 = exp2(_2395);
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2401 = precise::clamp(_2399, 0.0, 1.0);
    float _2403 = _2397;
    float _2405 = _2383;
    if (!_2369)
    {
        _2403 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2407 = _2403;
    float _2409 = fma(_2401, -2.0, 3.0);
    float _2411 = _2401 * _2401;
    float _2413 = _2411 * _2409;
    bool _2415 = _2387 <= 8000.0;
    bool _2417 = isnan(_2387);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(8000.0);
    bool _2423 = _2419 || _2421;
    float _2425 = float(_2423);
    float _2427 = -_2413;
    float _2429 = _2427 + 1.0;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2413);
    float _2433 = exp2(_2317);
    float _2435 = _2425 * _2431;
    float _2437 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2369)
    {
        float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2441 = _2387 + _2439;
        _2375 = _2441;
    }
    float _2443 = _2375;
    float _2445 = _2321 * _2437;
    float _2447 = precise::clamp(_2445, 0.0, 1.0);
    float _2449 = _2443;
    if (!_2369)
    {
        float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2453 = _2407 + _2451;
        _2377 = _2453;
    }
    float _2455 = _2377;
    float _2457 = _2242 * 0.5;
    float _2459 = -_2447;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2463 = _1682;
    if (!_2369)
    {
        float _2465 = 1.0 / _2455;
        _2463 = _2465;
    }
    float _2467 = _2463;
    float _2469 = -_2433;
    float _2471 = _2469 + 1.0;
    float _2473 = fma(_2268, -0.5, _2457);
    float _2475 = _2461 * _2389;
    float _2477 = _2345 + _2242;
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2481 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2483 = _2477 * 0.5;
    float _2485 = -_2479;
    float _2487 = _2485 + 1.0;
    out.m_103.x = _2481;
    float _2489 = _2479;
    float _2491 = _2487;
    if (!_2369)
    {
        float _2493 = _2443 * _2467;
        float _2495 = precise::clamp(_2493, 0.0, 1.0);
        _2405 = _2495;
    }
    float _2497 = _2405;
    out.m_105.x = _2349;
    out.m_105.y = _2473;
    out.m_105.z = _2483;
    out.m_105.w = _2242;
    bool _2499 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2501 = isnan(_2146);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2507 = _2503 || _2505;
    float _2509 = _2497 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2507)
    {
        _2379 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2511 = _2379;
    float _2513 = _2511;
    float _2515 = _2511;
    if (!_2507)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2517 = _2381;
    float _2519 = _2517;
    float _2521 = _2517;
    if (!_2507)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2523 = _2449;
    float _2525 = _2523;
    float _2527 = _2523;
    if (!_2507)
    {
        _1190 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2529 = _1190;
    float _2531 = _2479 * _2290;
    float _2533 = _2301 * _2487;
    float _2535 = _2529;
    float _2537 = _2529;
    if (!_2507)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2539 = _2489;
    float _2541 = _2301 * _2531;
    float _2543 = _2539;
    float _2545 = _2539;
    if (!_2507)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2547 = _2491;
    float _2549 = _2313 * _2531;
    float _2551 = fma(_2309, _2541, _2295);
    float _2553 = fma(_2311, _2541, _2297);
    float _2555 = fma(_2301, _2549, _2299);
    out.m_107.x = _2551;
    out.m_107.y = _2553;
    out.m_107.z = _2555;
    out.m_107.w = _2533;
    bool _2557 = !_2507;
    float _2559 = _2547;
    float _2561 = _2547;
    if (!_2557)
    {
        bool _2563 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2565 = isnan(_2146);
        bool _2567 = _2563 || _2565;
        bool _2569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2571 = _2567 || _2569;
        if (!_2571)
        {
            float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2575 = _2146 + _2573;
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2579 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2577;
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2585 = 1.0 / _2579;
            float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2603 = _2575 * _2585;
            float _2605 = precise::clamp(_2603, 0.0, 1.0);
            float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2611 = fma(_2605, _2583, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2613 = fma(_2605, _2609, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2615 = fma(_2605, _2589, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2617 = fma(_2605, _2593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2619 = fma(_2605, _2597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2621 = fma(_2605, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2521 = _2615;
            _2545 = _2619;
            _2515 = _2611;
            _2537 = _2617;
            _2527 = _2613;
            _2561 = _2621;
            _2623 = true;
        }
        else
        {
            bool _2625 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2627 = isnan(_2146);
            bool _2629 = _2625 || _2627;
            bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2633 = _2629 || _2631;
            if (!_2633)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2635 = _2513;
            _2515 = _2635;
            if (!_2633)
            {
                _2519 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2637 = _2519;
            _2521 = _2637;
            if (!_2633)
            {
                _2525 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2639 = _2525;
            _2527 = _2639;
            if (!_2633)
            {
                _2535 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2641 = _2535;
            _2537 = _2641;
            if (!_2633)
            {
                _2543 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2643 = _2543;
            _2545 = _2643;
            if (!_2633)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2645 = _2559;
            bool _2647 = !_2633;
            _2561 = _2645;
            if (!_2647)
            {
                bool _2649 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2651 = isnan(_2146);
                bool _2653 = _2649 || _2651;
                bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2657 = _2653 || _2655;
                if (!_2657)
                {
                    float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2661 = _2146 + _2659;
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2665 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2663;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2671 = 1.0 / _2665;
                    float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2689 = _2661 * _2671;
                    float _2691 = precise::clamp(_2689, 0.0, 1.0);
                    float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2697 = fma(_2691, _2669, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2699 = fma(_2691, _2695, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2701 = fma(_2691, _2675, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2703 = fma(_2691, _2679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2705 = fma(_2691, _2683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2707 = fma(_2691, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2521 = _2701;
                    _2545 = _2705;
                    _2515 = _2697;
                    _2537 = _2703;
                    _2527 = _2699;
                    _2561 = _2707;
                    _2623 = true;
                }
                else
                {
                    _2521 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2545 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2537 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2527 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2623 = false;
    float _2709 = _2521;
    float _2711 = _2545;
    float _2713 = _2515;
    float _2715 = _2537;
    float _2717 = _2527;
    float _2719 = _2561;
    float _2721 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2723 = fma(_1762, -0.5, 0.5);
    float _2725 = precise::clamp(_2723, 0.0, 1.0);
    float _2727 = -_2709;
    float _2729 = _2727 + _2711;
    float _2731 = -_2713;
    float _2733 = _2731 + _2715;
    out.m_109.x = 0.0;
    float _2735 = fma(_2725, _2729, _2709);
    float _2737 = -_2717;
    float _2739 = _2737 + _2719;
    float _2741 = fma(_2725, _2733, _2713);
    float _2743 = _2735 * 0.586610972881317138671875;
    bool _2745 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2747 = fma(_2725, _2739, _2717);
    out.m_53.x = _2721;
    float _2749 = fma(_2741, 0.298911988735198974609375, _2743);
    bool _2751 = _2497 > 0.0;
    bool _2753 = isnan(_2497);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan(0.0);
    bool _2759 = _2755 || _2757;
    float _2761 = fma(_2747, 0.114477999508380889892578125, _2749);
    float _2763 = -_2761;
    float _2765 = _2741 + _2763;
    float _2767 = -_2761;
    float _2769 = _2735 + _2767;
    float _2771 = -_2761;
    float _2773 = _2747 + _2771;
    float _2775 = fma(_2765, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    float _2777 = fma(_2769, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    float _2779 = fma(_2773, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    bool _2781 = !_2745;
    if (!_2781)
    {
        float _2783 = -_1974;
        float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2787 = -_1976;
        float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2791 = -_1978;
        float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2795 = _2785 * _2785;
        float _2797 = fma(_2789, _2789, _2795);
        float _2799 = fma(_2793, _2793, _2797);
        float _2801 = sqrt(_2799);
        float _2803 = rsqrt(_2799);
        float _2805 = -_2801;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2809 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = _2789 * _2803;
        float _2815 = _2785 * _2803;
        float _2817 = abs(_2811);
        float _2819 = log2(_2817);
        float _2821 = _2793 * _2803;
        float _2823 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2825 = _1762 * _2815;
        float _2827 = -_2815;
        float _2829 = -_2823;
        float _2831 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2829);
        float _2833 = fma(_1754, _2813, _2825);
        float _2835 = -_2821;
        float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2831);
        float _2839 = fma(_1764, _2821, _2833);
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2845 = _2837 + _2843;
        float _2847 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2849 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = exp2(_2847);
        float _2855 = _2853 * _2851;
        float _2857 = _2841 * _2855;
        float _2859 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2861 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2863 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2859;
        out.m_109.y = _2861;
        out.m_109.z = _2863;
    }
    out.m_71.x = _2775;
    out.m_71.y = _2777;
    out.m_71.z = _2779;
    if (_2759)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2865;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2623 = false;
    bool _1820 = false;
    bool _518 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_50.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2922 = as_type<float>(_144);
        out.gl_Position.z = _2922;
    }
    if (!_132)
    {
        return out;
    }
    float _148 = in.m_55.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = _162;
    if (_158)
    {
        float _166 = float(_128);
        _138 = _166;
    }
    float _168 = _138;
    bool _170 = _162 >= _168;
    bool _172 = !_158;
    bool _174 = _170 || _172;
    float _176 = _168;
    if (_174)
    {
        _176 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _176;
    if (_174)
    {
        out.m_53.x = 0.0;
    }
    if (_174)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2992 = as_type<float>(_182);
        out.gl_Position.z = _2992;
    }
    if (_174)
    {
        return out;
    }
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _200);
    float _208 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _202);
    bool _210 = !_190;
    float _228;
    if (!_210)
    {
        float _212 = in.m_59.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_128);
        float _234 = 1.0 / _232;
        float _236 = _162 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = _238 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _238 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = 1.0 / _258;
    float _270 = 1.0 / _254;
    bool _272 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _274 = isnan(_238);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 1.0 / _266;
    float _288 = _250 * _268;
    bool _290 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _292 = isnan(_238);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = 1.0 / _262;
    float _308 = _242 * _270;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _238 + _310;
    float _314 = -_282;
    float _316 = _314 + 1.0;
    float _318 = fma(_304, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = _312 * _286;
    bool _322 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _324 = isnan(_238);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -_332;
    float _336 = _334 + 1.0;
    float _338 = _332 * _316;
    float _340 = _246 * _306;
    bool _342 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_238);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    bool _358 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_238);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = _352 * _336;
    float _380 = -_352;
    float _382 = _380 + 1.0;
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = _368 * _382;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _300 * _386;
    float _404 = fma(_376, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_396, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = fma(_400, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = _388 * _402;
    float _412 = _390 * _402;
    float _414 = -_300;
    float _416 = _414 + 1.0;
    float _418 = _318 * _402;
    float _420 = in.m_61.x;
    float _422 = in.m_61.y;
    float _424 = in.m_61.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _410);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _444 = fma(_404, _392, _430);
    float _446 = fma(_406, _392, _432);
    float _448 = fma(_428, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_436, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_440, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _466 = fma(_408, _392, _442);
    float _468 = fma(_456, _320, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _470 = fma(_460, _320, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _472 = fma(_464, _320, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _474 = fma(_448, _378, _444);
    float _476 = fma(_450, _378, _446);
    float _478 = fma(_452, _378, _466);
    float _480 = fma(_468, _338, _474);
    float _482 = fma(_470, _338, _476);
    float _484 = fma(_472, _338, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    float _492 = _486 * _420;
    float _494 = _488 * _422;
    float _496 = _490 * _424;
    bool _498 = !_284;
    float _516;
    if (!_498)
    {
        float _500 = in.m_59.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_128);
        float _522 = 1.0 / _520;
        float _524 = _162 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_59.z;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    float _534 = in.m_59.x;
    float _536 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _540 = _538 != 0;
    float _542 = in.m_59.y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = in.m_50.x;
    float _550 = in.m_50.y;
    float _552 = in.m_50.z;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _564 = _562 != 0;
    float _566 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _568 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _570 = _532 * _162;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _574 = _528 * 2.0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _578 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _580 = _534 * 2.0;
    float _582 = floor(_574);
    float _584 = _534 + _528;
    float _586 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _588 = -_544;
    float _590 = fma(_578, 2.0, _588);
    float _592 = _542 * 2.0;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _596 = fma(_586, -2.0, _546);
    float _598 = _550 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _550 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = floor(_580);
    float _604 = _550 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _606 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    float _608 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _612 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[6].x, _604);
    float _614 = _548;
    float _616 = _612;
    if (_540)
    {
        _614 = _534;
    }
    float _618 = _614;
    float _620 = _542 + (-0.5);
    bool _622 = _582 > 0.0;
    float _624 = _584 + (-1.0);
    bool _626 = _582 >= 0.0;
    bool _628 = isnan(_582);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = _542 + _528;
    float _638 = _618;
    if (!_540)
    {
        _638 = _528;
    }
    float _640 = _638;
    float _642 = floor(_592);
    int _644 = _634 ? 0 : 1;
    float _646 = _636 + (-1.0);
    bool _648 = _602 > 0.0;
    float _650 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    bool _652 = _602 >= 0.0;
    bool _654 = isnan(_602);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _664 = ~_644;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    float _670 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _672 = _668;
    float _674 = _640;
    float _676 = _650;
    if (!_622)
    {
        int _678 = ~_644;
        int _680 = _678 + 1;
        _672 = _680;
    }
    int _682 = _672;
    float _684 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    float _686 = _640 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_540)
    {
        _674 = _528;
    }
    float _688 = _674;
    float _690 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _692 = _688;
    if (_540)
    {
        _692 = _542;
    }
    float _694 = _692;
    float _696 = -_572;
    float _698 = fma(_686, 2.0, _696);
    float _700 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    int _702 = _660 ? 0 : 1;
    float _704 = exp2(_570);
    if (!_540)
    {
        _616 = _542;
    }
    float _706 = _616;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _710 = _642 > 0.0;
    float _712 = _700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _714 = _642 >= 0.0;
    bool _716 = isnan(_642);
    bool _718 = _714 || _716;
    bool _720 = isnan(0.0);
    bool _722 = _718 || _720;
    float _724 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[83].w, _708);
    float _726 = _706;
    if (_540)
    {
        _726 = _534;
    }
    float _728 = _726;
    float _730 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _732 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _734 = !_556;
    float _736 = _734 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[83].z, _576);
    int _740 = ~_702;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _748 = _744;
    float _750 = _736;
    if (!_648)
    {
        int _752 = ~_702;
        int _754 = _752 + 1;
        _748 = _754;
    }
    int _756 = _748;
    float _758 = _728 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _760 = abs(as_type<int>(_736));
    float _762 = -_704;
    float _764 = _762 + 1.0;
    float _766 = _758;
    if (_540)
    {
        _750 = _542;
    }
    float _768 = _750;
    float _770 = -_746;
    float _772 = fma(_758, 2.0, _770);
    float _774 = _768;
    if (!_540)
    {
        _774 = _534;
    }
    float _776 = _774;
    float _778 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _724);
    bool _780 = !_560;
    int _782 = _780 ? 0 : 1;
    float _784 = -_162;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[81].x, _772);
    if (!_540)
    {
        _766 = _528;
    }
    float _788 = _766;
    float _790 = _776 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _792 = abs(_782);
    float _794 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _738);
    float _796 = _788;
    if (_540)
    {
        _796 = _542;
    }
    float _798 = _796;
    float _800 = fma(_790, -2.0, _594);
    float _802 = float(_756);
    float _804 = -_162;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[86].x, _698);
    float _808 = _798 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _810 = float(_760);
    float _812 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _800);
    float _814 = float(_792);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _818 = float(_682);
    float _820 = fma(_808, -2.0, _610);
    float _822 = _814 * _802;
    float _824 = _810 * _818;
    int _826 = _722 ? 0 : 1;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _830 = in.m_63.x;
    float _832 = in.m_63.y;
    float _834 = in.m_63.z;
    bool _836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _838 = isnan(1.0);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _844 = _840 || _842;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[88].z, _816);
    float _854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _856 = _712 + _854;
    int _858 = ~_826;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _828);
    int _866 = _862;
    if (!_710)
    {
        int _868 = ~_826;
        int _870 = _868 + 1;
        _866 = _870;
    }
    int _872 = _866;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _876 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].w, _846);
    float _878 = 1.0 / _850;
    float _880 = -_162;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _886 = _730 + _884;
    float _888 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[88].w, _874);
    float _890 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _876);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _732 + _892;
    float _896 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _852);
    bool _898 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _822 * (-2.0);
    float _910 = _856 * _856;
    bool _912 = !_564;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _864);
    float _918 = _906 ? _764 : 0.0;
    float _920 = fma(_886, _886, _910);
    float _922 = fma(_908, _832, _832);
    int _924 = abs(_914);
    float _926 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _888);
    float _928 = fma(_894, _894, _920);
    float _930 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _820);
    float _932 = fma(_662, _908, _662);
    float _934 = _890;
    if (_844)
    {
        float _936 = _918 * _878;
        _164 = _936;
    }
    float _938 = _164;
    float _940 = sqrt(_928);
    float _942 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _944 = _534 + _542;
    float _946 = _536 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _948 = float(_924);
    float _950 = _944 + (-1.0);
    float _952 = rsqrt(_928);
    float _954 = float(_872);
    float _956 = _824 * (-2.0);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _960 = fma(_932, _938, _942);
    float _962 = _948 * _954;
    float _964 = fma(_956, _830, _830);
    float _966 = _940 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _968 = _528 + (-0.5);
    float _970 = _962 * (-2.0);
    float _972 = _534 + (-0.5);
    float _974 = precise::min(_946, _966);
    float _976 = fma(_670, _970, _670);
    float _978 = fma(_970, _834, _834);
    float _980 = _960 * 0.15915493667125701904296875;
    float _982 = fma(_958, _956, _958);
    float _984 = _952 * _974;
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].z, _978);
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _964);
    float _990 = _980 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = _856 * _984;
    float _996 = _886 * _984;
    float _998 = _894 * _984;
    float _1000 = fma(_982, _938, _988);
    float _1002 = -_994;
    float _1004 = _856 + _1002;
    float _1006 = -_996;
    float _1008 = _886 + _1006;
    float _1010 = -_998;
    float _1012 = _894 + _1010;
    float _1014 = fma(_976, _938, _986);
    float _1016 = _1004 * _1004;
    float _1018 = _980 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _1000 * 0.15915493667125701904296875;
    float _1024 = fma(_1008, _1008, _1016);
    float _1026 = fma(_1012, _1012, _1024);
    float _1028 = _1022 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = in.m_65.x;
    float _1034 = in.m_65.y;
    float _1036 = in.m_65.z;
    float _1038 = _1014 * 0.15915493667125701904296875;
    float _1040 = sqrt(_1026);
    float _1042 = _1038 * 6.283185482025146484375;
    float _1044 = cos(_1042);
    float _1046 = _1030 * _1020;
    float _1048 = _1030 * _992;
    float _1050 = _1022 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = _952 * _1040;
    float _1056 = _568 * _1054;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1034);
    float _1060 = _1038 * 6.283185482025146484375;
    float _1062 = sin(_1060);
    float _1064 = _1020 * _1044;
    float _1066 = _1030 * _1044;
    float _1068 = _1052 * _1020;
    float _1070 = _566 * _1054;
    float _1072 = _536 * _1054;
    float _1074 = _1052 * _992;
    float _1076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1032);
    float _1078 = _1070 * _1058;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1036);
    float _1082 = _1052 * _1044;
    float _1084 = fma(_1062, _1046, _1074);
    float _1086 = _1072 * _1076;
    float _1088 = _1066 * _1078;
    float _1090 = _992 * _1044;
    float _1092 = _1056 * _1080;
    float _1094 = -_1068;
    float _1096 = fma(_1062, _1048, _1094);
    float _1098 = -_1078;
    float _1100 = _1062 * _1098;
    float _1102 = fma(_1084, _1086, _1088);
    float _1104 = -_1048;
    float _1106 = fma(_1062, _1068, _1104);
    float _1108 = _1082 * _1078;
    float _1110 = fma(_1064, _1086, _1100);
    float _1112 = fma(_1096, _1092, _1102);
    float _1114 = fma(_1062, _1074, _1046);
    float _1116 = fma(_1106, _1086, _1108);
    float _1118 = fma(_1090, _1092, _1110);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1122 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1124 = fma(_1114, _1092, _1116);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1120);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1122);
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1134 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1138 = _732 + _1134;
    float _1140 = _730 + _1136;
    float _1142 = -_998;
    float _1144 = _732 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1138 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1140 + _1150;
    float _1154 = _1148 * _1148;
    float _1156 = fma(_1152, _1152, _1154);
    float _1158 = -_996;
    float _1160 = _730 + _1158;
    float _1162 = sqrt(_1156);
    float _1164 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1166 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1168 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1166);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1172 = floor(_1164);
    float _1174 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1168);
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1178 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1180 = floor(_1170);
    float _1182 = _712 + _1176;
    float _1184 = _1124;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    float _1188 = _1166;
    float _1190 = _1144;
    if (!_1178)
    {
        _1184 = _1140;
    }
    float _1192 = _1184;
    float _1194 = _1192;
    if (!_1178)
    {
        _1186 = _1138;
    }
    float _1196 = _1186;
    float _1198 = _1196;
    if (!_1178)
    {
        _1188 = _1182;
    }
    float _1200 = _1188;
    bool _1202 = !_1178;
    float _1204 = _1200;
    if (!_1202)
    {
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1210 = _1162 + _1208;
        float _1212 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = rsqrt(_1156);
        float _1216 = _1210 * _1206;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1218 * 6.283185482025146484375;
        float _1222 = cos(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = sin(_1224);
        float _1228 = _1222 + (-1.0);
        float _1230 = fma(_1226, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = _1214 * _1230;
        float _1236 = fma(_1182, _1222, _1232);
        float _1238 = fma(_1152, _1234, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1240 = fma(_1148, _1234, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1194 = _1238;
        _1198 = _1240;
        _1204 = _1236;
    }
    float _1242 = _1194;
    float _1244 = _1198;
    float _1246 = _1204;
    float _1248 = fma(_1242, 6.2500002968590706586837768554688e-05, 0.5);
    float _1250 = fma(_1244, 6.2500002968590706586837768554688e-05, 0.5);
    float _1252 = -_1172;
    float _1254 = _1164 + _1252;
    float _1256 = -_1180;
    float _1258 = _1170 + _1256;
    float2 _4738 = float2(_1248, _1250);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4738, float2(0.0), isnan(_4738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4738, float2(0.0), isnan(_4738)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float2 _4754 = float2(_1254, _1258);
    float _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4754, float2(0.0), isnan(_4754)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4754, float2(0.0), isnan(_4754)), level(0.0)).x;
    float _1272 = in.m_67.y;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1276 = _528 > 0.5;
    float _1278 = in.m_59.w;
    bool _1280 = _542 > 0.5;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1286 = in.m_67.x;
    float _1288 = 1.0 / _1284;
    bool _1290 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1292 = isnan(_526);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1302;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1308 = _1306 != 0;
    float _1310 = in.m_69.w;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1318 = _526 + _1316;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1322 = _1320 != 0;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1328 = _1326 != 0;
    float _1330 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_71.w = _974;
    bool _1332 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1334 = isnan(_526);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1272;
    float _1346 = _1344 + 1.0;
    float _1348 = -_994;
    float _1350 = _1348 + _1246;
    float _1352 = _1304 * _1288;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1356 = _1278 > 0.5;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1360 = _1280 ? as_type<int>(_1346) : as_type<int>(_1272);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1364 = _1356 ? as_type<int>(_1346) : as_type<int>(_1272);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1368 = _1308 ? as_type<float>(_1360) : _1272;
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1374 = _1372 != 0;
    float _1376 = fma(_1352, _1318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1380 = _1378 != 0;
    float _1382 = fma(_1366, _1368, -0.5);
    out.m_73.w = _1310;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1386 = _1374 ? as_type<float>(_1364) : _1272;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1390 = _1374;
    float _1392 = _1318;
    float _1394 = _1272;
    float _1396 = _1330;
    int _1398 = as_type<int>(_1358);
    float _1400 = _1286;
    if (_1314)
    {
        bool _1402 = _534 > 0.5;
        _1390 = _1402;
    }
    bool _1404 = _1390;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1408 = in.m_75.x;
    float _1410 = in.m_75.y;
    float _1412 = in.m_75.z;
    float _1414 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1416 = as_type<int>(_1414);
    if (!_1314)
    {
        _1392 = _1286;
    }
    float _1418 = _1392;
    float _1420 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1418;
    if (_1380)
    {
        float _1424 = _1276 ? _1346 : _1272;
        _1394 = _1424;
    }
    float _1426 = _1394;
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1430 = _1034 != 0.0;
    bool _1432 = isnan(_1034);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1386, _1330, -0.5);
    out.m_77.x = _1370;
    out.m_77.y = _1414;
    out.m_77.z = _1420;
    out.m_77.w = _1358;
    if (!_1322)
    {
        _1396 = _1286;
    }
    float _1442 = _1396;
    float _1444 = -_996;
    float _1446 = _1444 + _1242;
    bool _1448 = _1032 == 0.0;
    bool _1450 = !_1438;
    bool _1452 = _1448 && _1450;
    float _1454 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1458 = -_930;
    float _1460 = fma(_778, _1440, _1458);
    bool _1462 = _1036 == 0.0;
    bool _1464 = _1462 && _1452;
    float _1466 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1468 = -_998;
    float _1470 = _1468 + _1244;
    out.m_79.x = _1072;
    float _1472 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1474 = -_1300;
    float _1476 = _1474 + 1.0;
    float _1478 = _1442;
    if (_1314)
    {
        float _1480 = -_1286;
        float _1482 = _1480 + 1.0;
        _1416 = as_type<int>(_1482);
    }
    int _1484 = _1416;
    float _1486 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1488 = _1484;
    if (_1328)
    {
        float _1490 = -_1286;
        float _1492 = _1490 + 1.0;
        _1398 = as_type<int>(_1492);
    }
    int _1494 = _1398;
    float _1496 = _1342 * _1476;
    float _1498 = -_1342;
    float _1500 = _1498 + 1.0;
    float _1502 = _1500;
    if (_1314)
    {
        float _1504 = _1404 ? as_type<float>(_1484) : _1286;
        _1422 = _1504;
    }
    float _1506 = _1422;
    if (_1322)
    {
        float _1508 = -_1286;
        float _1510 = _1508 + 1.0;
        _1488 = as_type<int>(_1510);
    }
    int _1512 = _1488;
    float _1514 = _1376 * _1496;
    float _1516 = -_650;
    float _1518 = fma(_890, _1382, _1516);
    float _1520 = fma(_1486, _1426, -0.5);
    if (_1464)
    {
        _934 = _1408;
    }
    float _1522 = _934;
    float _1524 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1514);
    float _1526 = _1522;
    if (_1322)
    {
        float _1528 = _1276 ? as_type<float>(_1512) : _1286;
        _1478 = _1528;
    }
    float _1530 = _1478;
    float _1532 = fma(_1472, _1506, -0.5);
    if (_1328)
    {
        float _1534 = _1280 ? as_type<float>(_1494) : _1286;
        _1400 = _1534;
    }
    float _1536 = _1400;
    if (!_1464)
    {
        float _1538 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1408);
        _1526 = _1538;
    }
    float _1540 = _1526;
    float _1542 = in.m_81.x;
    float _1544 = in.m_81.y;
    float _1546 = in.m_81.z;
    float _1548 = in.m_81.w;
    if (_1464)
    {
        _676 = _1410;
    }
    float _1550 = _676;
    float _1552 = _1550;
    if (!_1464)
    {
        float _1554 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1410);
        _1552 = _1554;
    }
    float _1556 = _1552;
    float _1558 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1560 = fma(_1454, _1530, -0.5);
    float _1562 = fma(_1558, _1536, -0.5);
    float _1564 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1524);
    if (_1464)
    {
        _1502 = _1412;
    }
    float _1566 = _1502;
    float _1568 = _1566;
    if (!_1464)
    {
        float _1570 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1412);
        _1568 = _1570;
    }
    float _1572 = _1568;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1580 = fma(_916, _1532, _882);
    float _1582 = fma(_794, _1560, _786);
    float _1584 = fma(_896, _1562, _806);
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1590 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1564 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1594 = -_812;
    float _1596 = fma(_926, _1520, _1594);
    float _1598 = _1584 + 0.5;
    float _1600 = _1544 * _1412;
    float _1602 = _1546 * _1408;
    float _1604 = _1542 * _1410;
    float _1606 = _1460 + 0.5;
    float _1608 = -_1600;
    float _1610 = fma(_1546, _1410, _1608);
    float _1612 = -_1602;
    float _1614 = fma(_1542, _1412, _1612);
    float _1616 = -_1604;
    float _1618 = fma(_1544, _1408, _1616);
    float _1620 = _1518 + 0.5;
    float _1622 = _1580 + 0.5;
    float _1624 = _1582 + 0.5;
    out.m_83.x = _1586;
    out.m_83.y = _1588;
    out.m_83.z = _1590;
    out.m_83.w = _1592;
    float _1626 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1628 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1630 = _1596 + 0.5;
    out.m_85.x = _1622;
    out.m_85.y = _1620;
    out.m_85.z = _1624;
    out.m_85.w = _1606;
    float _1632 = -_1062;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1626);
    float _1636 = _1614 * _1548;
    float _1638 = _1610 * _1548;
    out.m_87.x = _1598;
    out.m_87.y = _1630;
    float _1640 = _1618 * _1548;
    float _1642 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = -_1062;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1466);
    float _1648 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1650 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1652 = -_1062;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1628);
    float _1656 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1658 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1660 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1646);
    float _1662 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1648);
    float _1664 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1650);
    float _1666 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1634);
    float _1668 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1654);
    float _1670 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1658);
    float _1672 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1656);
    float _1674 = _1660 * _1556;
    float _1676 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1678 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1664);
    float _1680 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1682 = _1660 * _1544;
    float _1684 = _1666 * _1544;
    float _1686 = _1668 * _1544;
    float _1688 = fma(_1672, _1540, _1674);
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1692 = _1350 + _1690;
    float _1694 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1680);
    float _1696 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1698 = _1666 * _1556;
    float _1700 = _1636 * _1666;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1704 = _1446 + _1702;
    float _1706 = _1692 * _1692;
    float _1708 = _1636 * _1660;
    float _1710 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1696);
    float _1712 = _1668 * _1556;
    float _1714 = fma(_1704, _1704, _1706);
    float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1718 = _1470 + _1716;
    float _1720 = _1636 * _1668;
    float _1722 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1670);
    float _1724 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1694);
    float _1726 = fma(_1718, _1718, _1714);
    float _1728 = fma(_1676, _1540, _1698);
    float _1730 = fma(_1672, _1542, _1682);
    float _1732 = fma(_1638, _1672, _1708);
    float _1734 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1710);
    float _1736 = fma(_1678, _1540, _1712);
    float _1738 = sqrt(_1726);
    float _1740 = fma(_1676, _1542, _1684);
    float _1742 = fma(_1678, _1542, _1686);
    float _1744 = fma(_1638, _1676, _1700);
    float _1746 = fma(_1638, _1678, _1720);
    float _1748 = fma(_1722, _1546, _1730);
    float _1750 = fma(_1724, _1546, _1740);
    float _1752 = fma(_1734, _1546, _1742);
    float _1754 = fma(_1722, _1572, _1688);
    float _1756 = fma(_1640, _1722, _1732);
    float _1758 = fma(_1640, _1724, _1744);
    float _1760 = fma(_1640, _1734, _1746);
    float _1762 = fma(_1724, _1572, _1728);
    float _1764 = fma(_1734, _1572, _1736);
    out.m_89.x = _1748;
    out.m_89.y = _1750;
    out.m_89.z = _1752;
    float _1766 = -_994;
    float _1768 = _712 + _1766;
    bool _1770 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1772 = isnan(_1738);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1778 = _1774 || _1776;
    out.m_91.x = _1756;
    out.m_91.y = _1758;
    out.m_91.z = _1760;
    out.m_93.x = _1754;
    out.m_93.y = _1762;
    out.m_93.z = _1764;
    float _1780 = _1640;
    float _1782 = _1722;
    if (!_1778)
    {
        _1780 = 1.0;
    }
    float _1784 = _1780;
    out.m_95.x = _1264;
    out.m_95.y = _1266;
    out.m_95.z = _1268;
    bool _1786 = !_1778;
    float _1788 = _1784;
    float _1790 = _1266;
    if (!_1786)
    {
        bool _1792 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1794 = isnan(_1738);
        bool _1796 = _1792 || _1794;
        bool _1798 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1800 = _1796 || _1798;
        if (!_1800)
        {
            float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1804 = _1738 + _1802;
            float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1808 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1814 = 1.0 / _1808;
            float _1816 = _1804 * _1814;
            float _1818 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1788 = _1818;
            _1790 = _1814;
            _1820 = true;
        }
        else
        {
            bool _1822 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1824 = isnan(_1738);
            bool _1826 = _1822 || _1824;
            bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1830 = _1826 || _1828;
            if (!_1830)
            {
                float _1832 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1834 = _1738 + _1832;
                float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1838 = _1836 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1844 = 1.0 / _1838;
                float _1846 = _1834 * _1844;
                float _1848 = fma(_1846, _1842, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1788 = _1848;
                _1790 = _1844;
                _1820 = true;
            }
            else
            {
                _1788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1820 = false;
    float _1850 = _1788;
    float _1852 = _1790;
    float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1856 = _1350 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1860 = _1446 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1864 = _1470 + _1862;
    float _1866 = fma(_1856, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1868 = fma(_1860, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1870 = fma(_1864, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1872 = -_1768;
    float _1874 = _1872 + _1866;
    float _1876 = -_1160;
    float _1878 = _1876 + _1868;
    float _1880 = -_1144;
    float _1882 = _1880 + _1870;
    float _1884 = _1874 * _1874;
    float _1886 = fma(_1878, _1878, _1884);
    float _1888 = fma(_1882, _1882, _1886);
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > 0.0;
    float _1894 = _1890;
    float _1896 = _1852;
    float _1898 = _1856;
    float _1900 = _1874;
    if (!_1892)
    {
        _1894 = _1868;
    }
    float _1902 = _1894;
    float _1904 = _1902;
    if (!_1892)
    {
        _1896 = _1866;
    }
    float _1906 = _1896;
    float _1908 = _1906;
    if (!_1892)
    {
        _1898 = _1870;
    }
    float _1910 = _1898;
    bool _1912 = !_1892;
    float _1914 = _1910;
    float _1916 = _1910;
    if (!_1912)
    {
        float _1918 = _206 * _206;
        float _1920 = fma(_204, _204, _1918);
        float _1922 = rsqrt(_1888);
        float _1924 = fma(_208, _208, _1920);
        float _1926 = sqrt(_1924);
        float _1928 = _1878 * _1922;
        float _1930 = _1874 * _1922;
        float _1932 = _1882 * _1922;
        bool _1934 = _1926 > 0.0;
        float _1936 = _1922;
        float _1938 = _1926;
        _1900 = _1930;
        if (!_1934)
        {
            _1936 = _1868;
        }
        float _1940 = _1936;
        _1904 = _1940;
        if (!_1934)
        {
            _1938 = _1866;
        }
        float _1942 = _1938;
        _1908 = _1942;
        if (!_1934)
        {
            _1914 = _1870;
        }
        float _1944 = _1914;
        bool _1946 = !_1934;
        _1916 = _1944;
        if (!_1946)
        {
            float _1948 = rsqrt(_1924);
            float _1950 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1952 = _206 * _1948;
            float _1954 = _204 * _1948;
            float _1956 = _208 * _1948;
            float _1958 = _1930 * _1952;
            float _1960 = fma(_1928, _1954, _1958);
            float _1962 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1964 = fma(_1932, _1956, _1960);
            float _1966 = _1964 * _1962;
            float _1968 = fma(_204, _1966, _1868);
            float _1970 = fma(_206, _1966, _1866);
            float _1972 = fma(_208, _1966, _1870);
            _1908 = _1970;
            _1904 = _1968;
            _1916 = _1972;
        }
    }
    float _1974 = _1908;
    float _1976 = _1904;
    float _1978 = _1916;
    float _1980 = _1900;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1974 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1992 = _1978 + _1990;
    float _1994 = _1984 * _1984;
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2000 = fma(_1992, _1992, _1996);
    float _2002 = rsqrt(_2000);
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2006 = _1988 * _2004;
    float _2008 = _1992 * _2004;
    float _2010 = _2006 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 + _2012;
    float _2016 = sqrt(_2014);
    bool _2018 = _2016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = _2016 + _2020;
    float _2024 = _2002;
    float _2026 = _2014;
    float _2028 = _2022;
    float _2030 = _1980;
    float _2032 = _2004;
    float _2034 = _2006;
    if (_2018)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2024 = _2036;
    }
    float _2038 = _2024;
    if (_2018)
    {
        float _2040 = rsqrt(_2014);
        _2026 = _2040;
    }
    float _2042 = _2026;
    float _2044 = _2042;
    if (_2018)
    {
        float _2046 = _2022 * _2038;
        _2028 = _2046;
    }
    float _2048 = _2028;
    if (_2018)
    {
        float _2050 = _2048 * 0.15915493667125701904296875;
        _2030 = _2050;
    }
    float _2052 = _2030;
    float _2054 = _1870;
    if (_2018)
    {
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2064 = precise::max(0.0, _2062);
    float _2066 = _1992;
    float _2068 = _2064;
    float _2070 = _2062;
    if (_2018)
    {
        float _2072 = _2052 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        _2066 = _2074;
    }
    float _2076 = _2066;
    float _2078 = -_2004;
    float _2080 = -_2064;
    float _2082 = fma(_1984, _2078, _2080);
    float _2084 = _2082;
    if (_2018)
    {
        float _2086 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2068 = _2086;
    }
    float _2088 = _2068;
    float _2090 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2092 = _2060;
    float _2094 = _2088;
    if (_2018)
    {
        float _2096 = fma(_2060, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2092 = _2096;
    }
    float _2098 = _2092;
    float _2100 = _2098;
    if (!_2018)
    {
        _2094 = _2008;
    }
    float _2102 = _2094;
    float _2104 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2090);
    float _2106 = _2102;
    if (_2018)
    {
        float _2108 = _2076 + (-1.0);
        _2070 = _2108;
    }
    float _2110 = _2070;
    if (_2018)
    {
        float _2112 = _2042 * _2098;
        _1782 = _2112;
    }
    float _2114 = _1782;
    if (!_2018)
    {
        _2100 = _2082;
    }
    float _2116 = _2100;
    float _2118 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2104);
    float _2120 = _2116;
    if (_2018)
    {
        float _2122 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2122;
    }
    float _2124 = _2032;
    if (_2018)
    {
        float _2126 = _2006 * _2114;
        _2034 = _2126;
    }
    float _2128 = _2034;
    if (!_2018)
    {
        _2044 = _2010;
    }
    float _2130 = _2044;
    float _2132 = _2130;
    if (_2018)
    {
        float _2134 = _2008 * _2114;
        _2106 = _2134;
    }
    float _2136 = _2106;
    if (_2018)
    {
        float _2138 = fma(_2082, _2076, _2124);
        _2120 = _2138;
    }
    float _2140 = _2120;
    if (_2018)
    {
        float _2142 = _2128 * _2128;
        _2132 = _2142;
    }
    float _2144 = _2132;
    float _2146 = sqrt(_2000);
    if (!_2018)
    {
        _2084 = _2012;
    }
    float _2148 = _2084;
    float _2150 = _2148;
    if (_2018)
    {
        float _2152 = _2136 * _2136;
        _2150 = _2152;
    }
    float _2154 = _2150;
    float _2156 = fma(_2140, _2140, _2144);
    float _2158 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2160 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = _2156 + _2154;
    float _2164 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2158);
    float _2166 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2170 = rsqrt(_2162);
    float _2172 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2164);
    float _2174 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2178 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2176);
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    float _2182 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2184 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2186 = -_2180;
    float _2188 = _2186 + 1.0;
    float _2190 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2194 = abs(_2188);
    float _2196 = log2(_2194);
    float _2198 = -_2190;
    float _2200 = fma(_2198, _1998, 1.0);
    float _2202 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2204 = _2170 * _2128;
    float _2206 = _2170 * _2140;
    float _2208 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2168);
    float _2210 = _2170 * _2136;
    float _2212 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2214 = log2(_2200);
    float _2216 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2218 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2220 = -_2212;
    float _2222 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2220);
    float _2224 = _2206 + 1.0;
    float _2226 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2216);
    float _2228 = -_2210;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2222);
    float _2232 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2234 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2226);
    float _2236 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = exp2(_2232);
    float _2242 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2234);
    float _2244 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2246 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2236);
    float _2248 = fma(_2230, 0.5, 0.5);
    float _2250 = _2214 * 0.693147182464599609375;
    float _2252 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2244);
    float _2254 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2246);
    float _2256 = 1.0 / _2242;
    float _2258 = fma(_2248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2260 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2252);
    float _2262 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2254);
    float _2264 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2266 = fma(_2248, _2258, -0.212114393711090087890625);
    float _2268 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2260);
    float _2270 = sqrt(_2238);
    float _2272 = -_2206;
    float _2274 = fma(_2240, _2224, _2272);
    float _2276 = fma(_2248, _2266, 1.570728778839111328125);
    float _2278 = fma(_2274, 0.5, 0.5);
    float _2280 = _2262 * _2256;
    float _2282 = _2268 * _2256;
    float _2284 = fma(_2280, 0.5, 0.5);
    float _2286 = fma(_2282, -0.5, 0.5);
    float _2288 = _2270 * 0.636619746685028076171875;
    float3 _6521 = float3(_2284, _2286, _2264);
    float _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6521, float3(0.0), isnan(_6521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6521, float3(0.0), isnan(_6521)), level(0.0)).x;
    float3 _6532 = float3(_2284, _2286, _2264);
    float4 _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6532, float3(0.0), isnan(_6532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6532, float3(0.0), isnan(_6532)), level(0.0)).xyzw;
    float _2295 = _2293.x;
    float _2297 = _2293.y;
    float _2299 = _2293.z;
    float _2301 = _2293.w;
    float _2303 = -_2276;
    float _2305 = fma(_2288, _2303, 1.0);
    float2 _6553 = float2(_2305, _2278);
    float3 _2307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6553, float2(0.0), isnan(_6553)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6553, float2(0.0), isnan(_6553)), level(0.0)).xyz;
    float _2309 = _2307.x;
    float _2311 = _2307.y;
    float _2313 = _2307.z;
    float _2315 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2317 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2319 = -_1270;
    float _2321 = _2319 + 1.0;
    float _2323 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2325 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2315);
    out.m_97.x = _1160;
    out.m_97.y = _1768;
    out.m_97.z = _1144;
    float _2327 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2325);
    float _2329 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2331 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2323);
    float _2333 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2335 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2329);
    float _2337 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2331);
    float _2339 = 1.0 / _2333;
    float _2341 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2335);
    float _2343 = _2262 + _2242;
    float _2345 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2337);
    out.m_99.x = _1976;
    out.m_99.y = _1974;
    out.m_99.z = _1978;
    float _2347 = _2341 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2349 = _2343 * 0.5;
    out.gl_Position.x = _2262;
    out.gl_Position.y = _2268;
    out.gl_Position.z = _2345;
    out.gl_Position.w = _2242;
    float _2351 = _2347 + _2333;
    float _2353 = _2351 * _2339;
    float _2355 = _2353 * 0.5;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2359 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2357);
    bool _2361 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan(0.5);
    bool _2369 = _2365 || _2367;
    float _2371 = 1.0 / _2359;
    float _2373 = _2337;
    float _2375 = _2317;
    float _2377 = _2321;
    float _2379 = _2268;
    float _2381 = _2262;
    if (_2369)
    {
        _2373 = 1.0;
    }
    float _2383 = _2373;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2387 = _2371 * _2385;
    float _2389 = in.m_101.x;
    float _2391 = abs(_2387);
    float _2393 = log2(_2391);
    float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2397 = exp2(_2395);
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2401 = precise::clamp(_2399, 0.0, 1.0);
    float _2403 = _2397;
    float _2405 = _2383;
    if (!_2369)
    {
        _2403 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2407 = _2403;
    float _2409 = fma(_2401, -2.0, 3.0);
    float _2411 = _2401 * _2401;
    float _2413 = _2411 * _2409;
    bool _2415 = _2387 <= 8000.0;
    bool _2417 = isnan(_2387);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(8000.0);
    bool _2423 = _2419 || _2421;
    float _2425 = float(_2423);
    float _2427 = -_2413;
    float _2429 = _2427 + 1.0;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2413);
    float _2433 = exp2(_2317);
    float _2435 = _2425 * _2431;
    float _2437 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2369)
    {
        float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2441 = _2387 + _2439;
        _2375 = _2441;
    }
    float _2443 = _2375;
    float _2445 = _2321 * _2437;
    float _2447 = precise::clamp(_2445, 0.0, 1.0);
    float _2449 = _2443;
    if (!_2369)
    {
        float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2453 = _2407 + _2451;
        _2377 = _2453;
    }
    float _2455 = _2377;
    float _2457 = _2242 * 0.5;
    float _2459 = -_2447;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2463 = _1682;
    if (!_2369)
    {
        float _2465 = 1.0 / _2455;
        _2463 = _2465;
    }
    float _2467 = _2463;
    float _2469 = -_2433;
    float _2471 = _2469 + 1.0;
    float _2473 = fma(_2268, -0.5, _2457);
    float _2475 = _2461 * _2389;
    float _2477 = _2345 + _2242;
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2481 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2483 = _2477 * 0.5;
    float _2485 = -_2479;
    float _2487 = _2485 + 1.0;
    out.m_103.x = _2481;
    float _2489 = _2479;
    float _2491 = _2487;
    if (!_2369)
    {
        float _2493 = _2443 * _2467;
        float _2495 = precise::clamp(_2493, 0.0, 1.0);
        _2405 = _2495;
    }
    float _2497 = _2405;
    out.m_105.x = _2349;
    out.m_105.y = _2473;
    out.m_105.z = _2483;
    out.m_105.w = _2242;
    bool _2499 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2501 = isnan(_2146);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2507 = _2503 || _2505;
    float _2509 = _2497 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2507)
    {
        _2379 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2511 = _2379;
    float _2513 = _2511;
    float _2515 = _2511;
    if (!_2507)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2517 = _2381;
    float _2519 = _2517;
    float _2521 = _2517;
    if (!_2507)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2523 = _2449;
    float _2525 = _2523;
    float _2527 = _2523;
    if (!_2507)
    {
        _1190 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2529 = _1190;
    float _2531 = _2479 * _2290;
    float _2533 = _2301 * _2487;
    float _2535 = _2529;
    float _2537 = _2529;
    if (!_2507)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2539 = _2489;
    float _2541 = _2301 * _2531;
    float _2543 = _2539;
    float _2545 = _2539;
    if (!_2507)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2547 = _2491;
    float _2549 = _2313 * _2531;
    float _2551 = fma(_2309, _2541, _2295);
    float _2553 = fma(_2311, _2541, _2297);
    float _2555 = fma(_2301, _2549, _2299);
    out.m_107.x = _2551;
    out.m_107.y = _2553;
    out.m_107.z = _2555;
    out.m_107.w = _2533;
    bool _2557 = !_2507;
    float _2559 = _2547;
    float _2561 = _2547;
    if (!_2557)
    {
        bool _2563 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2565 = isnan(_2146);
        bool _2567 = _2563 || _2565;
        bool _2569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2571 = _2567 || _2569;
        if (!_2571)
        {
            float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2575 = _2146 + _2573;
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2579 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2577;
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2585 = 1.0 / _2579;
            float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2603 = _2575 * _2585;
            float _2605 = precise::clamp(_2603, 0.0, 1.0);
            float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2611 = fma(_2605, _2583, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2613 = fma(_2605, _2609, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2615 = fma(_2605, _2589, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2617 = fma(_2605, _2593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2619 = fma(_2605, _2597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2621 = fma(_2605, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2521 = _2615;
            _2545 = _2619;
            _2515 = _2611;
            _2537 = _2617;
            _2527 = _2613;
            _2561 = _2621;
            _2623 = true;
        }
        else
        {
            bool _2625 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2627 = isnan(_2146);
            bool _2629 = _2625 || _2627;
            bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2633 = _2629 || _2631;
            if (!_2633)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2635 = _2513;
            _2515 = _2635;
            if (!_2633)
            {
                _2519 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2637 = _2519;
            _2521 = _2637;
            if (!_2633)
            {
                _2525 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2639 = _2525;
            _2527 = _2639;
            if (!_2633)
            {
                _2535 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2641 = _2535;
            _2537 = _2641;
            if (!_2633)
            {
                _2543 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2643 = _2543;
            _2545 = _2643;
            if (!_2633)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2645 = _2559;
            bool _2647 = !_2633;
            _2561 = _2645;
            if (!_2647)
            {
                bool _2649 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2651 = isnan(_2146);
                bool _2653 = _2649 || _2651;
                bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2657 = _2653 || _2655;
                if (!_2657)
                {
                    float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2661 = _2146 + _2659;
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2665 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2663;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2671 = 1.0 / _2665;
                    float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2689 = _2661 * _2671;
                    float _2691 = precise::clamp(_2689, 0.0, 1.0);
                    float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2697 = fma(_2691, _2669, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2699 = fma(_2691, _2695, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2701 = fma(_2691, _2675, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2703 = fma(_2691, _2679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2705 = fma(_2691, _2683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2707 = fma(_2691, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2521 = _2701;
                    _2545 = _2705;
                    _2515 = _2697;
                    _2537 = _2703;
                    _2527 = _2699;
                    _2561 = _2707;
                    _2623 = true;
                }
                else
                {
                    _2521 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2545 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2537 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2527 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2623 = false;
    float _2709 = _2521;
    float _2711 = _2545;
    float _2713 = _2515;
    float _2715 = _2537;
    float _2717 = _2527;
    float _2719 = _2561;
    float _2721 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2723 = fma(_1762, -0.5, 0.5);
    float _2725 = precise::clamp(_2723, 0.0, 1.0);
    float _2727 = -_2709;
    float _2729 = _2727 + _2711;
    float _2731 = -_2713;
    float _2733 = _2731 + _2715;
    out.m_109.x = 0.0;
    float _2735 = fma(_2725, _2729, _2709);
    float _2737 = -_2717;
    float _2739 = _2737 + _2719;
    float _2741 = fma(_2725, _2733, _2713);
    float _2743 = _2735 * 0.586610972881317138671875;
    bool _2745 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2747 = fma(_2725, _2739, _2717);
    out.m_53.x = _2721;
    float _2749 = fma(_2741, 0.298911988735198974609375, _2743);
    bool _2751 = _2497 > 0.0;
    bool _2753 = isnan(_2497);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan(0.0);
    bool _2759 = _2755 || _2757;
    float _2761 = fma(_2747, 0.114477999508380889892578125, _2749);
    float _2763 = -_2761;
    float _2765 = _2741 + _2763;
    float _2767 = -_2761;
    float _2769 = _2735 + _2767;
    float _2771 = -_2761;
    float _2773 = _2747 + _2771;
    float _2775 = fma(_2765, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    float _2777 = fma(_2769, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    float _2779 = fma(_2773, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    bool _2781 = !_2745;
    if (!_2781)
    {
        float _2783 = -_1974;
        float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2787 = -_1976;
        float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2791 = -_1978;
        float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2795 = _2785 * _2785;
        float _2797 = fma(_2789, _2789, _2795);
        float _2799 = fma(_2793, _2793, _2797);
        float _2801 = sqrt(_2799);
        float _2803 = rsqrt(_2799);
        float _2805 = -_2801;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2809 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = _2789 * _2803;
        float _2815 = _2785 * _2803;
        float _2817 = abs(_2811);
        float _2819 = log2(_2817);
        float _2821 = _2793 * _2803;
        float _2823 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2825 = _1762 * _2815;
        float _2827 = -_2815;
        float _2829 = -_2823;
        float _2831 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2829);
        float _2833 = fma(_1754, _2813, _2825);
        float _2835 = -_2821;
        float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2831);
        float _2839 = fma(_1764, _2821, _2833);
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2845 = _2837 + _2843;
        float _2847 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2849 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = exp2(_2847);
        float _2855 = _2853 * _2851;
        float _2857 = _2841 * _2855;
        float _2859 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2861 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2863 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2859;
        out.m_109.y = _2861;
        out.m_109.z = _2863;
    }
    out.m_71.x = _2775;
    out.m_71.y = _2777;
    out.m_71.z = _2779;
    if (_2759)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2865;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2623 = false;
    bool _1820 = false;
    bool _518 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_50.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2922 = as_type<float>(_144);
        out.gl_Position.z = _2922;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_55.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = _162;
    if (_158)
    {
        float _166 = float(_128);
        _138 = _166;
    }
    float _168 = _138;
    bool _170 = _162 >= _168;
    bool _172 = !_158;
    bool _174 = _170 || _172;
    float _176 = _168;
    if (_174)
    {
        _176 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _176;
    if (_174)
    {
        out.m_53.x = 0.0;
    }
    if (_174)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2992 = as_type<float>(_182);
        out.gl_Position.z = _2992;
    }
    if (_174)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _200);
    float _208 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _202);
    bool _210 = !_190;
    float _228;
    if (!_210)
    {
        float _212 = in.m_59.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_128);
        float _234 = 1.0 / _232;
        float _236 = _162 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = _238 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _238 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = 1.0 / _258;
    float _270 = 1.0 / _254;
    bool _272 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _274 = isnan(_238);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _286 = 1.0 / _266;
    float _288 = _250 * _268;
    bool _290 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _292 = isnan(_238);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _302;
    float _306 = 1.0 / _262;
    float _308 = _242 * _270;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _238 + _310;
    float _314 = -_282;
    float _316 = _314 + 1.0;
    float _318 = fma(_304, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = _312 * _286;
    bool _322 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _324 = isnan(_238);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -_332;
    float _336 = _334 + 1.0;
    float _338 = _332 * _316;
    float _340 = _246 * _306;
    bool _342 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_238);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    bool _358 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_238);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = _352 * _336;
    float _380 = -_352;
    float _382 = _380 + 1.0;
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = _368 * _382;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _300 * _386;
    float _404 = fma(_376, _288, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_396, _288, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = fma(_400, _288, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = _388 * _402;
    float _412 = _390 * _402;
    float _414 = -_300;
    float _416 = _414 + 1.0;
    float _418 = _318 * _402;
    float _420 = in.m_61.x;
    float _422 = in.m_61.y;
    float _424 = in.m_61.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _410);
    float _432 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _444 = fma(_404, _392, _430);
    float _446 = fma(_406, _392, _432);
    float _448 = fma(_428, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_436, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_440, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _466 = fma(_408, _392, _442);
    float _468 = fma(_456, _320, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _470 = fma(_460, _320, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _472 = fma(_464, _320, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _474 = fma(_448, _378, _444);
    float _476 = fma(_450, _378, _446);
    float _478 = fma(_452, _378, _466);
    float _480 = fma(_468, _338, _474);
    float _482 = fma(_470, _338, _476);
    float _484 = fma(_472, _338, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    float _492 = _486 * _420;
    float _494 = _488 * _422;
    float _496 = _490 * _424;
    bool _498 = !_284;
    float _516;
    if (!_498)
    {
        float _500 = in.m_59.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_128);
        float _522 = 1.0 / _520;
        float _524 = _162 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_59.z;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    float _534 = in.m_59.x;
    float _536 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _540 = _538 != 0;
    float _542 = in.m_59.y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = in.m_50.x;
    float _550 = in.m_50.y;
    float _552 = in.m_50.z;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _564 = _562 != 0;
    float _566 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _568 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _570 = _532 * _162;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _574 = _528 * 2.0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _578 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _580 = _534 * 2.0;
    float _582 = floor(_574);
    float _584 = _534 + _528;
    float _586 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _588 = -_544;
    float _590 = fma(_578, 2.0, _588);
    float _592 = _542 * 2.0;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _596 = fma(_586, -2.0, _546);
    float _598 = _550 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _550 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = floor(_580);
    float _604 = _550 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _606 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    float _608 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _612 = fma(_548, (*spvDescriptorSet0.vp_c10)._m0[6].x, _604);
    float _614 = _548;
    float _616 = _612;
    if (_540)
    {
        _614 = _534;
    }
    float _618 = _614;
    float _620 = _542 + (-0.5);
    bool _622 = _582 > 0.0;
    float _624 = _584 + (-1.0);
    bool _626 = _582 >= 0.0;
    bool _628 = isnan(_582);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = _542 + _528;
    float _638 = _618;
    if (!_540)
    {
        _638 = _528;
    }
    float _640 = _638;
    float _642 = floor(_592);
    int _644 = _634 ? 0 : 1;
    float _646 = _636 + (-1.0);
    bool _648 = _602 > 0.0;
    float _650 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    bool _652 = _602 >= 0.0;
    bool _654 = isnan(_602);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _664 = ~_644;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    float _670 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _672 = _668;
    float _674 = _640;
    float _676 = _650;
    if (!_622)
    {
        int _678 = ~_644;
        int _680 = _678 + 1;
        _672 = _680;
    }
    int _682 = _672;
    float _684 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    float _686 = _640 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_540)
    {
        _674 = _528;
    }
    float _688 = _674;
    float _690 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _692 = _688;
    if (_540)
    {
        _692 = _542;
    }
    float _694 = _692;
    float _696 = -_572;
    float _698 = fma(_686, 2.0, _696);
    float _700 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    int _702 = _660 ? 0 : 1;
    float _704 = exp2(_570);
    if (!_540)
    {
        _616 = _542;
    }
    float _706 = _616;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _710 = _642 > 0.0;
    float _712 = _700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _714 = _642 >= 0.0;
    bool _716 = isnan(_642);
    bool _718 = _714 || _716;
    bool _720 = isnan(0.0);
    bool _722 = _718 || _720;
    float _724 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[83].w, _708);
    float _726 = _706;
    if (_540)
    {
        _726 = _534;
    }
    float _728 = _726;
    float _730 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _732 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _734 = !_556;
    float _736 = _734 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[83].z, _576);
    int _740 = ~_702;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _748 = _744;
    float _750 = _736;
    if (!_648)
    {
        int _752 = ~_702;
        int _754 = _752 + 1;
        _748 = _754;
    }
    int _756 = _748;
    float _758 = _728 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _760 = abs(as_type<int>(_736));
    float _762 = -_704;
    float _764 = _762 + 1.0;
    float _766 = _758;
    if (_540)
    {
        _750 = _542;
    }
    float _768 = _750;
    float _770 = -_746;
    float _772 = fma(_758, 2.0, _770);
    float _774 = _768;
    if (!_540)
    {
        _774 = _534;
    }
    float _776 = _774;
    float _778 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _724);
    bool _780 = !_560;
    int _782 = _780 ? 0 : 1;
    float _784 = -_162;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[81].x, _772);
    if (!_540)
    {
        _766 = _528;
    }
    float _788 = _766;
    float _790 = _776 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _792 = abs(_782);
    float _794 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _738);
    float _796 = _788;
    if (_540)
    {
        _796 = _542;
    }
    float _798 = _796;
    float _800 = fma(_790, -2.0, _594);
    float _802 = float(_756);
    float _804 = -_162;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[86].x, _698);
    float _808 = _798 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _810 = float(_760);
    float _812 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _800);
    float _814 = float(_792);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _818 = float(_682);
    float _820 = fma(_808, -2.0, _610);
    float _822 = _814 * _802;
    float _824 = _810 * _818;
    int _826 = _722 ? 0 : 1;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _830 = in.m_63.x;
    float _832 = in.m_63.y;
    float _834 = in.m_63.z;
    bool _836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _838 = isnan(1.0);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _844 = _840 || _842;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[88].z, _816);
    float _854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _856 = _712 + _854;
    int _858 = ~_826;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _828);
    int _866 = _862;
    if (!_710)
    {
        int _868 = ~_826;
        int _870 = _868 + 1;
        _866 = _870;
    }
    int _872 = _866;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _876 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].w, _846);
    float _878 = 1.0 / _850;
    float _880 = -_162;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _886 = _730 + _884;
    float _888 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[88].w, _874);
    float _890 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _876);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _732 + _892;
    float _896 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _852);
    bool _898 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(0.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _822 * (-2.0);
    float _910 = _856 * _856;
    bool _912 = !_564;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _864);
    float _918 = _906 ? _764 : 0.0;
    float _920 = fma(_886, _886, _910);
    float _922 = fma(_908, _832, _832);
    int _924 = abs(_914);
    float _926 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _888);
    float _928 = fma(_894, _894, _920);
    float _930 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _820);
    float _932 = fma(_662, _908, _662);
    float _934 = _890;
    if (_844)
    {
        float _936 = _918 * _878;
        _164 = _936;
    }
    float _938 = _164;
    float _940 = sqrt(_928);
    float _942 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _944 = _534 + _542;
    float _946 = _536 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _948 = float(_924);
    float _950 = _944 + (-1.0);
    float _952 = rsqrt(_928);
    float _954 = float(_872);
    float _956 = _824 * (-2.0);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _960 = fma(_932, _938, _942);
    float _962 = _948 * _954;
    float _964 = fma(_956, _830, _830);
    float _966 = _940 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _968 = _528 + (-0.5);
    float _970 = _962 * (-2.0);
    float _972 = _534 + (-0.5);
    float _974 = precise::min(_946, _966);
    float _976 = fma(_670, _970, _670);
    float _978 = fma(_970, _834, _834);
    float _980 = _960 * 0.15915493667125701904296875;
    float _982 = fma(_958, _956, _958);
    float _984 = _952 * _974;
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].z, _978);
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _964);
    float _990 = _980 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = _856 * _984;
    float _996 = _886 * _984;
    float _998 = _894 * _984;
    float _1000 = fma(_982, _938, _988);
    float _1002 = -_994;
    float _1004 = _856 + _1002;
    float _1006 = -_996;
    float _1008 = _886 + _1006;
    float _1010 = -_998;
    float _1012 = _894 + _1010;
    float _1014 = fma(_976, _938, _986);
    float _1016 = _1004 * _1004;
    float _1018 = _980 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _1000 * 0.15915493667125701904296875;
    float _1024 = fma(_1008, _1008, _1016);
    float _1026 = fma(_1012, _1012, _1024);
    float _1028 = _1022 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = in.m_65.x;
    float _1034 = in.m_65.y;
    float _1036 = in.m_65.z;
    float _1038 = _1014 * 0.15915493667125701904296875;
    float _1040 = sqrt(_1026);
    float _1042 = _1038 * 6.283185482025146484375;
    float _1044 = cos(_1042);
    float _1046 = _1030 * _1020;
    float _1048 = _1030 * _992;
    float _1050 = _1022 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = _952 * _1040;
    float _1056 = _568 * _1054;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1034);
    float _1060 = _1038 * 6.283185482025146484375;
    float _1062 = sin(_1060);
    float _1064 = _1020 * _1044;
    float _1066 = _1030 * _1044;
    float _1068 = _1052 * _1020;
    float _1070 = _566 * _1054;
    float _1072 = _536 * _1054;
    float _1074 = _1052 * _992;
    float _1076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1032);
    float _1078 = _1070 * _1058;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1036);
    float _1082 = _1052 * _1044;
    float _1084 = fma(_1062, _1046, _1074);
    float _1086 = _1072 * _1076;
    float _1088 = _1066 * _1078;
    float _1090 = _992 * _1044;
    float _1092 = _1056 * _1080;
    float _1094 = -_1068;
    float _1096 = fma(_1062, _1048, _1094);
    float _1098 = -_1078;
    float _1100 = _1062 * _1098;
    float _1102 = fma(_1084, _1086, _1088);
    float _1104 = -_1048;
    float _1106 = fma(_1062, _1068, _1104);
    float _1108 = _1082 * _1078;
    float _1110 = fma(_1064, _1086, _1100);
    float _1112 = fma(_1096, _1092, _1102);
    float _1114 = fma(_1062, _1074, _1046);
    float _1116 = fma(_1106, _1086, _1108);
    float _1118 = fma(_1090, _1092, _1110);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1122 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1124 = fma(_1114, _1092, _1116);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1120);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1122);
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1134 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1136 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1138 = _732 + _1134;
    float _1140 = _730 + _1136;
    float _1142 = -_998;
    float _1144 = _732 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1138 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1140 + _1150;
    float _1154 = _1148 * _1148;
    float _1156 = fma(_1152, _1152, _1154);
    float _1158 = -_996;
    float _1160 = _730 + _1158;
    float _1162 = sqrt(_1156);
    float _1164 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1166 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1168 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1166);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1172 = floor(_1164);
    float _1174 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1168);
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1178 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1180 = floor(_1170);
    float _1182 = _712 + _1176;
    float _1184 = _1124;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    float _1188 = _1166;
    float _1190 = _1144;
    if (!_1178)
    {
        _1184 = _1140;
    }
    float _1192 = _1184;
    float _1194 = _1192;
    if (!_1178)
    {
        _1186 = _1138;
    }
    float _1196 = _1186;
    float _1198 = _1196;
    if (!_1178)
    {
        _1188 = _1182;
    }
    float _1200 = _1188;
    bool _1202 = !_1178;
    float _1204 = _1200;
    if (!_1202)
    {
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1210 = _1162 + _1208;
        float _1212 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = rsqrt(_1156);
        float _1216 = _1210 * _1206;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1218 * 6.283185482025146484375;
        float _1222 = cos(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = sin(_1224);
        float _1228 = _1222 + (-1.0);
        float _1230 = fma(_1226, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = _1214 * _1230;
        float _1236 = fma(_1182, _1222, _1232);
        float _1238 = fma(_1152, _1234, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1240 = fma(_1148, _1234, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1194 = _1238;
        _1198 = _1240;
        _1204 = _1236;
    }
    float _1242 = _1194;
    float _1244 = _1198;
    float _1246 = _1204;
    float _1248 = fma(_1242, 6.2500002968590706586837768554688e-05, 0.5);
    float _1250 = fma(_1244, 6.2500002968590706586837768554688e-05, 0.5);
    float _1252 = -_1172;
    float _1254 = _1164 + _1252;
    float _1256 = -_1180;
    float _1258 = _1170 + _1256;
    float2 _4738 = float2(_1248, _1250);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4738, float2(0.0), isnan(_4738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4738, float2(0.0), isnan(_4738)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float2 _4754 = float2(_1254, _1258);
    float _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4754, float2(0.0), isnan(_4754)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4754, float2(0.0), isnan(_4754)), level(0.0)).x;
    float _1272 = in.m_67.y;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1276 = _528 > 0.5;
    float _1278 = in.m_59.w;
    bool _1280 = _542 > 0.5;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1286 = in.m_67.x;
    float _1288 = 1.0 / _1284;
    bool _1290 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1292 = isnan(_526);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1302;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1308 = _1306 != 0;
    float _1310 = in.m_69.w;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1318 = _526 + _1316;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1322 = _1320 != 0;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1328 = _1326 != 0;
    float _1330 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_71.w = _974;
    bool _1332 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1334 = isnan(_526);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1272;
    float _1346 = _1344 + 1.0;
    float _1348 = -_994;
    float _1350 = _1348 + _1246;
    float _1352 = _1304 * _1288;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1356 = _1278 > 0.5;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1360 = _1280 ? as_type<int>(_1346) : as_type<int>(_1272);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1364 = _1356 ? as_type<int>(_1346) : as_type<int>(_1272);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1368 = _1308 ? as_type<float>(_1360) : _1272;
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1374 = _1372 != 0;
    float _1376 = fma(_1352, _1318, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1380 = _1378 != 0;
    float _1382 = fma(_1366, _1368, -0.5);
    out.m_73.w = _1310;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1386 = _1374 ? as_type<float>(_1364) : _1272;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1390 = _1374;
    float _1392 = _1318;
    float _1394 = _1272;
    float _1396 = _1330;
    int _1398 = as_type<int>(_1358);
    float _1400 = _1286;
    if (_1314)
    {
        bool _1402 = _534 > 0.5;
        _1390 = _1402;
    }
    bool _1404 = _1390;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1408 = in.m_75.x;
    float _1410 = in.m_75.y;
    float _1412 = in.m_75.z;
    float _1414 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1416 = as_type<int>(_1414);
    if (!_1314)
    {
        _1392 = _1286;
    }
    float _1418 = _1392;
    float _1420 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1418;
    if (_1380)
    {
        float _1424 = _1276 ? _1346 : _1272;
        _1394 = _1424;
    }
    float _1426 = _1394;
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1430 = _1034 != 0.0;
    bool _1432 = isnan(_1034);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1386, _1330, -0.5);
    out.m_77.x = _1370;
    out.m_77.y = _1414;
    out.m_77.z = _1420;
    out.m_77.w = _1358;
    if (!_1322)
    {
        _1396 = _1286;
    }
    float _1442 = _1396;
    float _1444 = -_996;
    float _1446 = _1444 + _1242;
    bool _1448 = _1032 == 0.0;
    bool _1450 = !_1438;
    bool _1452 = _1448 && _1450;
    float _1454 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1458 = -_930;
    float _1460 = fma(_778, _1440, _1458);
    bool _1462 = _1036 == 0.0;
    bool _1464 = _1462 && _1452;
    float _1466 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1468 = -_998;
    float _1470 = _1468 + _1244;
    out.m_79.x = _1072;
    float _1472 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1474 = -_1300;
    float _1476 = _1474 + 1.0;
    float _1478 = _1442;
    if (_1314)
    {
        float _1480 = -_1286;
        float _1482 = _1480 + 1.0;
        _1416 = as_type<int>(_1482);
    }
    int _1484 = _1416;
    float _1486 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1488 = _1484;
    if (_1328)
    {
        float _1490 = -_1286;
        float _1492 = _1490 + 1.0;
        _1398 = as_type<int>(_1492);
    }
    int _1494 = _1398;
    float _1496 = _1342 * _1476;
    float _1498 = -_1342;
    float _1500 = _1498 + 1.0;
    float _1502 = _1500;
    if (_1314)
    {
        float _1504 = _1404 ? as_type<float>(_1484) : _1286;
        _1422 = _1504;
    }
    float _1506 = _1422;
    if (_1322)
    {
        float _1508 = -_1286;
        float _1510 = _1508 + 1.0;
        _1488 = as_type<int>(_1510);
    }
    int _1512 = _1488;
    float _1514 = _1376 * _1496;
    float _1516 = -_650;
    float _1518 = fma(_890, _1382, _1516);
    float _1520 = fma(_1486, _1426, -0.5);
    if (_1464)
    {
        _934 = _1408;
    }
    float _1522 = _934;
    float _1524 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1514);
    float _1526 = _1522;
    if (_1322)
    {
        float _1528 = _1276 ? as_type<float>(_1512) : _1286;
        _1478 = _1528;
    }
    float _1530 = _1478;
    float _1532 = fma(_1472, _1506, -0.5);
    if (_1328)
    {
        float _1534 = _1280 ? as_type<float>(_1494) : _1286;
        _1400 = _1534;
    }
    float _1536 = _1400;
    if (!_1464)
    {
        float _1538 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1408);
        _1526 = _1538;
    }
    float _1540 = _1526;
    float _1542 = in.m_81.x;
    float _1544 = in.m_81.y;
    float _1546 = in.m_81.z;
    float _1548 = in.m_81.w;
    if (_1464)
    {
        _676 = _1410;
    }
    float _1550 = _676;
    float _1552 = _1550;
    if (!_1464)
    {
        float _1554 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1410);
        _1552 = _1554;
    }
    float _1556 = _1552;
    float _1558 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1560 = fma(_1454, _1530, -0.5);
    float _1562 = fma(_1558, _1536, -0.5);
    float _1564 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1524);
    if (_1464)
    {
        _1502 = _1412;
    }
    float _1566 = _1502;
    float _1568 = _1566;
    if (!_1464)
    {
        float _1570 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1412);
        _1568 = _1570;
    }
    float _1572 = _1568;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1580 = fma(_916, _1532, _882);
    float _1582 = fma(_794, _1560, _786);
    float _1584 = fma(_896, _1562, _806);
    float _1586 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1590 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1564 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1594 = -_812;
    float _1596 = fma(_926, _1520, _1594);
    float _1598 = _1584 + 0.5;
    float _1600 = _1544 * _1412;
    float _1602 = _1546 * _1408;
    float _1604 = _1542 * _1410;
    float _1606 = _1460 + 0.5;
    float _1608 = -_1600;
    float _1610 = fma(_1546, _1410, _1608);
    float _1612 = -_1602;
    float _1614 = fma(_1542, _1412, _1612);
    float _1616 = -_1604;
    float _1618 = fma(_1544, _1408, _1616);
    float _1620 = _1518 + 0.5;
    float _1622 = _1580 + 0.5;
    float _1624 = _1582 + 0.5;
    out.m_83.x = _1586;
    out.m_83.y = _1588;
    out.m_83.z = _1590;
    out.m_83.w = _1592;
    float _1626 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1628 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1630 = _1596 + 0.5;
    out.m_85.x = _1622;
    out.m_85.y = _1620;
    out.m_85.z = _1624;
    out.m_85.w = _1606;
    float _1632 = -_1062;
    float _1634 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1626);
    float _1636 = _1614 * _1548;
    float _1638 = _1610 * _1548;
    out.m_87.x = _1598;
    out.m_87.y = _1630;
    float _1640 = _1618 * _1548;
    float _1642 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = -_1062;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1466);
    float _1648 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1650 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1652 = -_1062;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1628);
    float _1656 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1658 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1660 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1646);
    float _1662 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1648);
    float _1664 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1650);
    float _1666 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1634);
    float _1668 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1654);
    float _1670 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1658);
    float _1672 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1656);
    float _1674 = _1660 * _1556;
    float _1676 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1678 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1664);
    float _1680 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1682 = _1660 * _1544;
    float _1684 = _1666 * _1544;
    float _1686 = _1668 * _1544;
    float _1688 = fma(_1672, _1540, _1674);
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1692 = _1350 + _1690;
    float _1694 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1680);
    float _1696 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1698 = _1666 * _1556;
    float _1700 = _1636 * _1666;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1704 = _1446 + _1702;
    float _1706 = _1692 * _1692;
    float _1708 = _1636 * _1660;
    float _1710 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1696);
    float _1712 = _1668 * _1556;
    float _1714 = fma(_1704, _1704, _1706);
    float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1718 = _1470 + _1716;
    float _1720 = _1636 * _1668;
    float _1722 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1670);
    float _1724 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1694);
    float _1726 = fma(_1718, _1718, _1714);
    float _1728 = fma(_1676, _1540, _1698);
    float _1730 = fma(_1672, _1542, _1682);
    float _1732 = fma(_1638, _1672, _1708);
    float _1734 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1710);
    float _1736 = fma(_1678, _1540, _1712);
    float _1738 = sqrt(_1726);
    float _1740 = fma(_1676, _1542, _1684);
    float _1742 = fma(_1678, _1542, _1686);
    float _1744 = fma(_1638, _1676, _1700);
    float _1746 = fma(_1638, _1678, _1720);
    float _1748 = fma(_1722, _1546, _1730);
    float _1750 = fma(_1724, _1546, _1740);
    float _1752 = fma(_1734, _1546, _1742);
    float _1754 = fma(_1722, _1572, _1688);
    float _1756 = fma(_1640, _1722, _1732);
    float _1758 = fma(_1640, _1724, _1744);
    float _1760 = fma(_1640, _1734, _1746);
    float _1762 = fma(_1724, _1572, _1728);
    float _1764 = fma(_1734, _1572, _1736);
    out.m_89.x = _1748;
    out.m_89.y = _1750;
    out.m_89.z = _1752;
    float _1766 = -_994;
    float _1768 = _712 + _1766;
    bool _1770 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1772 = isnan(_1738);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1778 = _1774 || _1776;
    out.m_91.x = _1756;
    out.m_91.y = _1758;
    out.m_91.z = _1760;
    out.m_93.x = _1754;
    out.m_93.y = _1762;
    out.m_93.z = _1764;
    float _1780 = _1640;
    float _1782 = _1722;
    if (!_1778)
    {
        _1780 = 1.0;
    }
    float _1784 = _1780;
    out.m_95.x = _1264;
    out.m_95.y = _1266;
    out.m_95.z = _1268;
    bool _1786 = !_1778;
    float _1788 = _1784;
    float _1790 = _1266;
    if (!_1786)
    {
        bool _1792 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1794 = isnan(_1738);
        bool _1796 = _1792 || _1794;
        bool _1798 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1800 = _1796 || _1798;
        if (!_1800)
        {
            float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1804 = _1738 + _1802;
            float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1808 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1814 = 1.0 / _1808;
            float _1816 = _1804 * _1814;
            float _1818 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1788 = _1818;
            _1790 = _1814;
            _1820 = true;
        }
        else
        {
            bool _1822 = _1738 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1824 = isnan(_1738);
            bool _1826 = _1822 || _1824;
            bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1830 = _1826 || _1828;
            if (!_1830)
            {
                float _1832 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1834 = _1738 + _1832;
                float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1838 = _1836 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1844 = 1.0 / _1838;
                float _1846 = _1834 * _1844;
                float _1848 = fma(_1846, _1842, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1788 = _1848;
                _1790 = _1844;
                _1820 = true;
            }
            else
            {
                _1788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1820 = false;
    float _1850 = _1788;
    float _1852 = _1790;
    float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1856 = _1350 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1860 = _1446 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1864 = _1470 + _1862;
    float _1866 = fma(_1856, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1868 = fma(_1860, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1870 = fma(_1864, _1850, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1872 = -_1768;
    float _1874 = _1872 + _1866;
    float _1876 = -_1160;
    float _1878 = _1876 + _1868;
    float _1880 = -_1144;
    float _1882 = _1880 + _1870;
    float _1884 = _1874 * _1874;
    float _1886 = fma(_1878, _1878, _1884);
    float _1888 = fma(_1882, _1882, _1886);
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > 0.0;
    float _1894 = _1890;
    float _1896 = _1852;
    float _1898 = _1856;
    float _1900 = _1874;
    if (!_1892)
    {
        _1894 = _1868;
    }
    float _1902 = _1894;
    float _1904 = _1902;
    if (!_1892)
    {
        _1896 = _1866;
    }
    float _1906 = _1896;
    float _1908 = _1906;
    if (!_1892)
    {
        _1898 = _1870;
    }
    float _1910 = _1898;
    bool _1912 = !_1892;
    float _1914 = _1910;
    float _1916 = _1910;
    if (!_1912)
    {
        float _1918 = _206 * _206;
        float _1920 = fma(_204, _204, _1918);
        float _1922 = rsqrt(_1888);
        float _1924 = fma(_208, _208, _1920);
        float _1926 = sqrt(_1924);
        float _1928 = _1878 * _1922;
        float _1930 = _1874 * _1922;
        float _1932 = _1882 * _1922;
        bool _1934 = _1926 > 0.0;
        float _1936 = _1922;
        float _1938 = _1926;
        _1900 = _1930;
        if (!_1934)
        {
            _1936 = _1868;
        }
        float _1940 = _1936;
        _1904 = _1940;
        if (!_1934)
        {
            _1938 = _1866;
        }
        float _1942 = _1938;
        _1908 = _1942;
        if (!_1934)
        {
            _1914 = _1870;
        }
        float _1944 = _1914;
        bool _1946 = !_1934;
        _1916 = _1944;
        if (!_1946)
        {
            float _1948 = rsqrt(_1924);
            float _1950 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1952 = _206 * _1948;
            float _1954 = _204 * _1948;
            float _1956 = _208 * _1948;
            float _1958 = _1930 * _1952;
            float _1960 = fma(_1928, _1954, _1958);
            float _1962 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1964 = fma(_1932, _1956, _1960);
            float _1966 = _1964 * _1962;
            float _1968 = fma(_204, _1966, _1868);
            float _1970 = fma(_206, _1966, _1866);
            float _1972 = fma(_208, _1966, _1870);
            _1908 = _1970;
            _1904 = _1968;
            _1916 = _1972;
        }
    }
    float _1974 = _1908;
    float _1976 = _1904;
    float _1978 = _1916;
    float _1980 = _1900;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1974 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1992 = _1978 + _1990;
    float _1994 = _1984 * _1984;
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2000 = fma(_1992, _1992, _1996);
    float _2002 = rsqrt(_2000);
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2006 = _1988 * _2004;
    float _2008 = _1992 * _2004;
    float _2010 = _2006 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 + _2012;
    float _2016 = sqrt(_2014);
    bool _2018 = _2016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = _2016 + _2020;
    float _2024 = _2002;
    float _2026 = _2014;
    float _2028 = _2022;
    float _2030 = _1980;
    float _2032 = _2004;
    float _2034 = _2006;
    if (_2018)
    {
        float _2036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2024 = _2036;
    }
    float _2038 = _2024;
    if (_2018)
    {
        float _2040 = rsqrt(_2014);
        _2026 = _2040;
    }
    float _2042 = _2026;
    float _2044 = _2042;
    if (_2018)
    {
        float _2046 = _2022 * _2038;
        _2028 = _2046;
    }
    float _2048 = _2028;
    if (_2018)
    {
        float _2050 = _2048 * 0.15915493667125701904296875;
        _2030 = _2050;
    }
    float _2052 = _2030;
    float _2054 = _1870;
    if (_2018)
    {
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2064 = precise::max(0.0, _2062);
    float _2066 = _1992;
    float _2068 = _2064;
    float _2070 = _2062;
    if (_2018)
    {
        float _2072 = _2052 * 6.283185482025146484375;
        float _2074 = cos(_2072);
        _2066 = _2074;
    }
    float _2076 = _2066;
    float _2078 = -_2004;
    float _2080 = -_2064;
    float _2082 = fma(_1984, _2078, _2080);
    float _2084 = _2082;
    if (_2018)
    {
        float _2086 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2068 = _2086;
    }
    float _2088 = _2068;
    float _2090 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2092 = _2060;
    float _2094 = _2088;
    if (_2018)
    {
        float _2096 = fma(_2060, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2092 = _2096;
    }
    float _2098 = _2092;
    float _2100 = _2098;
    if (!_2018)
    {
        _2094 = _2008;
    }
    float _2102 = _2094;
    float _2104 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2090);
    float _2106 = _2102;
    if (_2018)
    {
        float _2108 = _2076 + (-1.0);
        _2070 = _2108;
    }
    float _2110 = _2070;
    if (_2018)
    {
        float _2112 = _2042 * _2098;
        _1782 = _2112;
    }
    float _2114 = _1782;
    if (!_2018)
    {
        _2100 = _2082;
    }
    float _2116 = _2100;
    float _2118 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2104);
    float _2120 = _2116;
    if (_2018)
    {
        float _2122 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2122;
    }
    float _2124 = _2032;
    if (_2018)
    {
        float _2126 = _2006 * _2114;
        _2034 = _2126;
    }
    float _2128 = _2034;
    if (!_2018)
    {
        _2044 = _2010;
    }
    float _2130 = _2044;
    float _2132 = _2130;
    if (_2018)
    {
        float _2134 = _2008 * _2114;
        _2106 = _2134;
    }
    float _2136 = _2106;
    if (_2018)
    {
        float _2138 = fma(_2082, _2076, _2124);
        _2120 = _2138;
    }
    float _2140 = _2120;
    if (_2018)
    {
        float _2142 = _2128 * _2128;
        _2132 = _2142;
    }
    float _2144 = _2132;
    float _2146 = sqrt(_2000);
    if (!_2018)
    {
        _2084 = _2012;
    }
    float _2148 = _2084;
    float _2150 = _2148;
    if (_2018)
    {
        float _2152 = _2136 * _2136;
        _2150 = _2152;
    }
    float _2154 = _2150;
    float _2156 = fma(_2140, _2140, _2144);
    float _2158 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2160 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = _2156 + _2154;
    float _2164 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2158);
    float _2166 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2170 = rsqrt(_2162);
    float _2172 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2164);
    float _2174 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2178 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2176);
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    float _2182 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2184 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2186 = -_2180;
    float _2188 = _2186 + 1.0;
    float _2190 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2194 = abs(_2188);
    float _2196 = log2(_2194);
    float _2198 = -_2190;
    float _2200 = fma(_2198, _1998, 1.0);
    float _2202 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2204 = _2170 * _2128;
    float _2206 = _2170 * _2140;
    float _2208 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2168);
    float _2210 = _2170 * _2136;
    float _2212 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2214 = log2(_2200);
    float _2216 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2218 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2220 = -_2212;
    float _2222 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2220);
    float _2224 = _2206 + 1.0;
    float _2226 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2216);
    float _2228 = -_2210;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2222);
    float _2232 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2234 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2226);
    float _2236 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = exp2(_2232);
    float _2242 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2234);
    float _2244 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2246 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2236);
    float _2248 = fma(_2230, 0.5, 0.5);
    float _2250 = _2214 * 0.693147182464599609375;
    float _2252 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2244);
    float _2254 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2246);
    float _2256 = 1.0 / _2242;
    float _2258 = fma(_2248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2260 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2252);
    float _2262 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2254);
    float _2264 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2266 = fma(_2248, _2258, -0.212114393711090087890625);
    float _2268 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2260);
    float _2270 = sqrt(_2238);
    float _2272 = -_2206;
    float _2274 = fma(_2240, _2224, _2272);
    float _2276 = fma(_2248, _2266, 1.570728778839111328125);
    float _2278 = fma(_2274, 0.5, 0.5);
    float _2280 = _2262 * _2256;
    float _2282 = _2268 * _2256;
    float _2284 = fma(_2280, 0.5, 0.5);
    float _2286 = fma(_2282, -0.5, 0.5);
    float _2288 = _2270 * 0.636619746685028076171875;
    float3 _6521 = float3(_2284, _2286, _2264);
    float _2290 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6521, float3(0.0), isnan(_6521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6521, float3(0.0), isnan(_6521)), level(0.0)).x;
    float3 _6532 = float3(_2284, _2286, _2264);
    float4 _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6532, float3(0.0), isnan(_6532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6532, float3(0.0), isnan(_6532)), level(0.0)).xyzw;
    float _2295 = _2293.x;
    float _2297 = _2293.y;
    float _2299 = _2293.z;
    float _2301 = _2293.w;
    float _2303 = -_2276;
    float _2305 = fma(_2288, _2303, 1.0);
    float2 _6553 = float2(_2305, _2278);
    float3 _2307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6553, float2(0.0), isnan(_6553)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6553, float2(0.0), isnan(_6553)), level(0.0)).xyz;
    float _2309 = _2307.x;
    float _2311 = _2307.y;
    float _2313 = _2307.z;
    float _2315 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2317 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2319 = -_1270;
    float _2321 = _2319 + 1.0;
    float _2323 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2325 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2315);
    out.m_97.x = _1160;
    out.m_97.y = _1768;
    out.m_97.z = _1144;
    float _2327 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2325);
    float _2329 = _1768 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2331 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2323);
    float _2333 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2335 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2329);
    float _2337 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2331);
    float _2339 = 1.0 / _2333;
    float _2341 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2335);
    float _2343 = _2262 + _2242;
    float _2345 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2337);
    out.m_99.x = _1976;
    out.m_99.y = _1974;
    out.m_99.z = _1978;
    float _2347 = _2341 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2349 = _2343 * 0.5;
    out.gl_Position.x = _2262;
    out.gl_Position.y = _2268;
    out.gl_Position.z = _2345;
    out.gl_Position.w = _2242;
    float _2351 = _2347 + _2333;
    float _2353 = _2351 * _2339;
    float _2355 = _2353 * 0.5;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2359 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2357);
    bool _2361 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan(0.5);
    bool _2369 = _2365 || _2367;
    float _2371 = 1.0 / _2359;
    float _2373 = _2337;
    float _2375 = _2317;
    float _2377 = _2321;
    float _2379 = _2268;
    float _2381 = _2262;
    if (_2369)
    {
        _2373 = 1.0;
    }
    float _2383 = _2373;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2387 = _2371 * _2385;
    float _2389 = in.m_101.x;
    float _2391 = abs(_2387);
    float _2393 = log2(_2391);
    float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2397 = exp2(_2395);
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2401 = precise::clamp(_2399, 0.0, 1.0);
    float _2403 = _2397;
    float _2405 = _2383;
    if (!_2369)
    {
        _2403 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2407 = _2403;
    float _2409 = fma(_2401, -2.0, 3.0);
    float _2411 = _2401 * _2401;
    float _2413 = _2411 * _2409;
    bool _2415 = _2387 <= 8000.0;
    bool _2417 = isnan(_2387);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan(8000.0);
    bool _2423 = _2419 || _2421;
    float _2425 = float(_2423);
    float _2427 = -_2413;
    float _2429 = _2427 + 1.0;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2413);
    float _2433 = exp2(_2317);
    float _2435 = _2425 * _2431;
    float _2437 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2369)
    {
        float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2441 = _2387 + _2439;
        _2375 = _2441;
    }
    float _2443 = _2375;
    float _2445 = _2321 * _2437;
    float _2447 = precise::clamp(_2445, 0.0, 1.0);
    float _2449 = _2443;
    if (!_2369)
    {
        float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2453 = _2407 + _2451;
        _2377 = _2453;
    }
    float _2455 = _2377;
    float _2457 = _2242 * 0.5;
    float _2459 = -_2447;
    float _2461 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2463 = _1682;
    if (!_2369)
    {
        float _2465 = 1.0 / _2455;
        _2463 = _2465;
    }
    float _2467 = _2463;
    float _2469 = -_2433;
    float _2471 = _2469 + 1.0;
    float _2473 = fma(_2268, -0.5, _2457);
    float _2475 = _2461 * _2389;
    float _2477 = _2345 + _2242;
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2481 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2483 = _2477 * 0.5;
    float _2485 = -_2479;
    float _2487 = _2485 + 1.0;
    out.m_103.x = _2481;
    float _2489 = _2479;
    float _2491 = _2487;
    if (!_2369)
    {
        float _2493 = _2443 * _2467;
        float _2495 = precise::clamp(_2493, 0.0, 1.0);
        _2405 = _2495;
    }
    float _2497 = _2405;
    out.m_105.x = _2349;
    out.m_105.y = _2473;
    out.m_105.z = _2483;
    out.m_105.w = _2242;
    bool _2499 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2501 = isnan(_2146);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2507 = _2503 || _2505;
    float _2509 = _2497 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2507)
    {
        _2379 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2511 = _2379;
    float _2513 = _2511;
    float _2515 = _2511;
    if (!_2507)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2517 = _2381;
    float _2519 = _2517;
    float _2521 = _2517;
    if (!_2507)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2523 = _2449;
    float _2525 = _2523;
    float _2527 = _2523;
    if (!_2507)
    {
        _1190 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2529 = _1190;
    float _2531 = _2479 * _2290;
    float _2533 = _2301 * _2487;
    float _2535 = _2529;
    float _2537 = _2529;
    if (!_2507)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2539 = _2489;
    float _2541 = _2301 * _2531;
    float _2543 = _2539;
    float _2545 = _2539;
    if (!_2507)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2547 = _2491;
    float _2549 = _2313 * _2531;
    float _2551 = fma(_2309, _2541, _2295);
    float _2553 = fma(_2311, _2541, _2297);
    float _2555 = fma(_2301, _2549, _2299);
    out.m_107.x = _2551;
    out.m_107.y = _2553;
    out.m_107.z = _2555;
    out.m_107.w = _2533;
    bool _2557 = !_2507;
    float _2559 = _2547;
    float _2561 = _2547;
    if (!_2557)
    {
        bool _2563 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2565 = isnan(_2146);
        bool _2567 = _2563 || _2565;
        bool _2569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2571 = _2567 || _2569;
        if (!_2571)
        {
            float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2575 = _2146 + _2573;
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2579 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2577;
            float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2585 = 1.0 / _2579;
            float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2603 = _2575 * _2585;
            float _2605 = precise::clamp(_2603, 0.0, 1.0);
            float _2607 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2611 = fma(_2605, _2583, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2613 = fma(_2605, _2609, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2615 = fma(_2605, _2589, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2617 = fma(_2605, _2593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2619 = fma(_2605, _2597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2621 = fma(_2605, _2601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2521 = _2615;
            _2545 = _2619;
            _2515 = _2611;
            _2537 = _2617;
            _2527 = _2613;
            _2561 = _2621;
            _2623 = true;
        }
        else
        {
            bool _2625 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2627 = isnan(_2146);
            bool _2629 = _2625 || _2627;
            bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2633 = _2629 || _2631;
            if (!_2633)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2635 = _2513;
            _2515 = _2635;
            if (!_2633)
            {
                _2519 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2637 = _2519;
            _2521 = _2637;
            if (!_2633)
            {
                _2525 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2639 = _2525;
            _2527 = _2639;
            if (!_2633)
            {
                _2535 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2641 = _2535;
            _2537 = _2641;
            if (!_2633)
            {
                _2543 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2643 = _2543;
            _2545 = _2643;
            if (!_2633)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2645 = _2559;
            bool _2647 = !_2633;
            _2561 = _2645;
            if (!_2647)
            {
                bool _2649 = _2146 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2651 = isnan(_2146);
                bool _2653 = _2649 || _2651;
                bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2657 = _2653 || _2655;
                if (!_2657)
                {
                    float _2659 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2661 = _2146 + _2659;
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2665 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2663;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2671 = 1.0 / _2665;
                    float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2675 = _2673 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2683 = _2681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2689 = _2661 * _2671;
                    float _2691 = precise::clamp(_2689, 0.0, 1.0);
                    float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2697 = fma(_2691, _2669, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2699 = fma(_2691, _2695, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2701 = fma(_2691, _2675, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2703 = fma(_2691, _2679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2705 = fma(_2691, _2683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2707 = fma(_2691, _2687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2521 = _2701;
                    _2545 = _2705;
                    _2515 = _2697;
                    _2537 = _2703;
                    _2527 = _2699;
                    _2561 = _2707;
                    _2623 = true;
                }
                else
                {
                    _2521 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2545 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2537 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2527 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2623 = false;
    float _2709 = _2521;
    float _2711 = _2545;
    float _2713 = _2515;
    float _2715 = _2537;
    float _2717 = _2527;
    float _2719 = _2561;
    float _2721 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2723 = fma(_1762, -0.5, 0.5);
    float _2725 = precise::clamp(_2723, 0.0, 1.0);
    float _2727 = -_2709;
    float _2729 = _2727 + _2711;
    float _2731 = -_2713;
    float _2733 = _2731 + _2715;
    out.m_109.x = 0.0;
    float _2735 = fma(_2725, _2729, _2709);
    float _2737 = -_2717;
    float _2739 = _2737 + _2719;
    float _2741 = fma(_2725, _2733, _2713);
    float _2743 = _2735 * 0.586610972881317138671875;
    bool _2745 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2747 = fma(_2725, _2739, _2717);
    out.m_53.x = _2721;
    float _2749 = fma(_2741, 0.298911988735198974609375, _2743);
    bool _2751 = _2497 > 0.0;
    bool _2753 = isnan(_2497);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan(0.0);
    bool _2759 = _2755 || _2757;
    float _2761 = fma(_2747, 0.114477999508380889892578125, _2749);
    float _2763 = -_2761;
    float _2765 = _2741 + _2763;
    float _2767 = -_2761;
    float _2769 = _2735 + _2767;
    float _2771 = -_2761;
    float _2773 = _2747 + _2771;
    float _2775 = fma(_2765, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    float _2777 = fma(_2769, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    float _2779 = fma(_2773, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2761);
    bool _2781 = !_2745;
    if (!_2781)
    {
        float _2783 = -_1974;
        float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2787 = -_1976;
        float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2791 = -_1978;
        float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2795 = _2785 * _2785;
        float _2797 = fma(_2789, _2789, _2795);
        float _2799 = fma(_2793, _2793, _2797);
        float _2801 = sqrt(_2799);
        float _2803 = rsqrt(_2799);
        float _2805 = -_2801;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2809 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = _2789 * _2803;
        float _2815 = _2785 * _2803;
        float _2817 = abs(_2811);
        float _2819 = log2(_2817);
        float _2821 = _2793 * _2803;
        float _2823 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2825 = _1762 * _2815;
        float _2827 = -_2815;
        float _2829 = -_2823;
        float _2831 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2829);
        float _2833 = fma(_1754, _2813, _2825);
        float _2835 = -_2821;
        float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2831);
        float _2839 = fma(_1764, _2821, _2833);
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2845 = _2837 + _2843;
        float _2847 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2849 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2851 = precise::clamp(_2849, 0.0, 1.0);
        float _2853 = exp2(_2847);
        float _2855 = _2853 * _2851;
        float _2857 = _2841 * _2855;
        float _2859 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2861 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2863 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2859;
        out.m_109.y = _2861;
        out.m_109.z = _2863;
    }
    out.m_71.x = _2775;
    out.m_71.y = _2777;
    out.m_71.z = _2779;
    if (_2759)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2865 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2865;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

