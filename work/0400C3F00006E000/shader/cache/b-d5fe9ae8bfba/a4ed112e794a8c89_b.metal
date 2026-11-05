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
    float4 m_63 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_107 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_105 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_77 [[user(locn14)]];
    float4 m_109 [[user(locn15)]];
    float4 m_95 [[user(locn16)]];
    float4 m_103 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_101 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_81 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2725 = false;
    bool _1924 = false;
    bool _622 = false;
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
        float _3024 = as_type<float>(_144);
        out.gl_Position.z = _3024;
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
        float _3094 = as_type<float>(_182);
        out.gl_Position.z = _3094;
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
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _200);
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
    bool _528 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = isnan(_526);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _544 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_526);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _526 + _560;
    float _564 = -_538;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / _542;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _572 = _554 * _566;
    float _574 = -_554;
    float _576 = _574 + 1.0;
    float _578 = _558 * _568;
    float _580 = fma(_578, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = _580 * _572;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[116].x, _588);
    float _598 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _592;
    out.m_63.y = _594;
    out.m_63.z = _598;
    out.m_63.w = _600;
    bool _602 = !_570;
    float _620;
    if (!_602)
    {
        float _604 = in.m_59.x;
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _608 = _604 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        float _624 = float(_128);
        float _626 = 1.0 / _624;
        float _628 = _162 * _626;
        _620 = _628;
    }
    _622 = false;
    float _630 = _620;
    float _632 = in.m_59.z;
    float _634 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _636 = log2(_634);
    float _638 = in.m_59.x;
    float _640 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _644 = _642 != 0;
    float _646 = in.m_59.y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _652 = in.m_50.x;
    float _654 = in.m_50.y;
    float _656 = in.m_50.z;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _664 = _662 != 0;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _668 = _666 != 0;
    float _670 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _674 = _632 * 2.0;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _678 = _638 * 2.0;
    float _680 = _638 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _682 = floor(_674);
    float _684 = _638 + _632;
    float _686 = _646 * 2.0;
    float _688 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _690 = -_648;
    float _692 = fma(_680, 2.0, _690);
    float _694 = _684 + (-1.0);
    float _696 = _654 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _698 = fma(_688, -2.0, _650);
    float _700 = floor(_678);
    float _702 = _654 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _704 = _654 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _710 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[5].x, _702);
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _714 = _652;
    float _716 = _712;
    if (_644)
    {
        _714 = _638;
    }
    float _718 = _714;
    float _720 = floor(_686);
    bool _722 = _682 > 0.0;
    float _724 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].z, _710);
    bool _726 = _682 >= 0.0;
    bool _728 = isnan(_682);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    float _736 = _646 + _632;
    float _738 = _718;
    if (!_644)
    {
        _738 = _632;
    }
    float _740 = _738;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _744 = _734 ? 0 : 1;
    float _746 = _736 + (-1.0);
    bool _748 = _700 >= 0.0;
    bool _750 = isnan(_700);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _760 = _700 > 0.0;
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _764 = ~_744;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    float _770 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _772 = _768;
    float _774 = _740;
    if (!_722)
    {
        int _776 = ~_744;
        int _778 = _776 + 1;
        _772 = _778;
    }
    int _780 = _772;
    float _782 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].z, _712);
    int _784 = _756 ? 0 : 1;
    float _786 = _724 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _788 = _720 > 0.0;
    float _790 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[78].z, _758);
    bool _792 = _720 >= 0.0;
    bool _794 = isnan(_720);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].z, _706);
    float _804 = _740 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_644)
    {
        _774 = _632;
    }
    float _806 = _774;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _786 + _808;
    float _812 = _806;
    if (_644)
    {
        _812 = _646;
    }
    float _814 = _812;
    float _816 = -_672;
    float _818 = fma(_804, 2.0, _816);
    float _820 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _822 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_644)
    {
        _716 = _646;
    }
    float _824 = _716;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _828 = _824;
    if (_644)
    {
        _828 = _638;
    }
    float _830 = _828;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _834 = !_664;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _826);
    bool _840 = !_660;
    float _842 = _840 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[83].z, _832);
    float _846 = _830 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _848 = ~_784;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _838);
    int _856 = abs(as_type<int>(_842));
    float _858 = -_676;
    float _860 = fma(_846, 2.0, _858);
    float _862 = _842;
    int _864 = _852;
    float _866 = _846;
    if (_644)
    {
        _862 = _646;
    }
    float _868 = _862;
    float _870 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    float _872 = _868;
    if (!_644)
    {
        _872 = _638;
    }
    float _874 = _872;
    float _876 = -_162;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[76].x, _692);
    if (!_760)
    {
        int _880 = ~_784;
        int _882 = _880 + 1;
        _864 = _882;
    }
    int _884 = _864;
    float _886 = -_162;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[86].x, _818);
    int _890 = abs(_836);
    float _892 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _894 = float(_780);
    float _896 = _636 * _162;
    if (!_644)
    {
        _866 = _632;
    }
    float _898 = _866;
    float _900 = fma(_892, -2.0, _708);
    float _902 = _898;
    if (_644)
    {
        _902 = _646;
    }
    float _904 = _902;
    float _906 = exp2(_896);
    float _908 = float(_890);
    float _910 = _646 + (-0.5);
    float _912 = float(_884);
    float _914 = _904 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _916 = -_162;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _860);
    int _920 = _800 ? 0 : 1;
    float _922 = _908 * _912;
    float _924 = float(_856);
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _928 = fma(_914, -2.0, _742);
    int _930 = ~_920;
    int _932 = _930 + 1;
    int _934 = _932 + 1;
    float _936 = _924 * _894;
    int _938 = _934;
    if (!_788)
    {
        int _940 = ~_920;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _948 = in.m_65.x;
    float _950 = in.m_65.y;
    float _952 = in.m_65.z;
    float _954 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].w, _926);
    float _956 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _698);
    bool _958 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _960 = isnan(1.0);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _966 = _962 || _964;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _970 = 1.0 + _968;
    float _972 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].w, _946);
    float _974 = -_906;
    float _976 = _974 + 1.0;
    bool _978 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _980 = isnan(0.0);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _986 = _982 || _984;
    float _988 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _790);
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _820 + _990;
    float _994 = _810 * _810;
    float _996 = 1.0 / _970;
    float _998 = _922 * (-2.0);
    float _1000 = fma(_992, _992, _994);
    bool _1002 = !_668;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _954);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1010 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _972);
    int _1012 = abs(_1004);
    float _1014 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _928);
    float _1016 = _986 ? _976 : 0.0;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = _822 + _1018;
    float _1022 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1008);
    float _1024 = fma(_998, _950, _950);
    float _1026 = fma(_762, _998, _762);
    float _1028 = fma(_1020, _1020, _1000);
    float _1030 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1022);
    float _1032 = float(_944);
    float _1034 = sqrt(_1028);
    float _1036 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _900);
    int _1038 = as_type<int>(_956);
    if (_966)
    {
        float _1040 = _1016 * _996;
        _164 = _1040;
    }
    float _1042 = _164;
    float _1044 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1024);
    float _1046 = _638 + _646;
    float _1048 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1050 = _936 * (-2.0);
    float _1052 = rsqrt(_1028);
    float _1054 = float(_1012);
    float _1056 = _1046 + (-1.0);
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1060 = fma(_1026, _1042, _1044);
    float _1062 = fma(_1050, _948, _948);
    float _1064 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1066 = _1054 * _1032;
    float _1068 = _1034 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1070 = _638 + (-0.5);
    float _1072 = fma(_1064, _1050, _1064);
    float _1074 = _1066 * (-2.0);
    float _1076 = _632 + (-0.5);
    float _1078 = precise::min(_1058, _1068);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1062);
    float _1082 = fma(_770, _1074, _770);
    float _1084 = fma(_1074, _952, _952);
    float _1086 = _1060 * 0.15915493667125701904296875;
    float _1088 = _1052 * _1078;
    float _1090 = fma(_1072, _1042, _1080);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1084);
    float _1094 = _1086 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _810 * _1088;
    float _1100 = _992 * _1088;
    float _1102 = fma(_1082, _1042, _1092);
    float _1104 = _1090 * 0.15915493667125701904296875;
    float _1106 = -_1098;
    float _1108 = _810 + _1106;
    float _1110 = -_1100;
    float _1112 = _992 + _1110;
    float _1114 = _1020 * _1088;
    float _1116 = _1102 * 0.15915493667125701904296875;
    float _1118 = _1108 * _1108;
    float _1120 = _1086 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -_1114;
    float _1126 = _1020 + _1124;
    float _1128 = fma(_1112, _1112, _1118);
    float _1130 = fma(_1126, _1126, _1128);
    float _1132 = _1104 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    float _1136 = in.m_67.x;
    float _1138 = in.m_67.y;
    float _1140 = in.m_67.z;
    float _1142 = sqrt(_1130);
    float _1144 = _1104 * 6.283185482025146484375;
    float _1146 = sin(_1144);
    float _1148 = _1134 * _1122;
    float _1150 = _1134 * _1096;
    float _1152 = _1116 * 6.283185482025146484375;
    float _1154 = cos(_1152);
    float _1156 = _1052 * _1142;
    float _1158 = _640 * _1156;
    float _1160 = _1048 * _1156;
    float _1162 = _670 * _1156;
    float _1164 = _1116 * 6.283185482025146484375;
    float _1166 = sin(_1164);
    float _1168 = _1146 * _1122;
    float _1170 = _1146 * _1096;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1174 = _1134 * _1154;
    float _1176 = _1122 * _1154;
    float _1178 = _1146 * _1154;
    float _1180 = _1096 * _1154;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1184 = _1158 * _1182;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1188 = _1160 * _1172;
    float _1190 = fma(_1166, _1148, _1170);
    float _1192 = _1174 * _1184;
    float _1194 = _1162 * _1186;
    float _1196 = -_1168;
    float _1198 = fma(_1166, _1150, _1196);
    float _1200 = -_1184;
    float _1202 = _1166 * _1200;
    float _1204 = fma(_1190, _1188, _1192);
    float _1206 = -_1150;
    float _1208 = fma(_1166, _1168, _1206);
    float _1210 = _1178 * _1184;
    float _1212 = fma(_1176, _1188, _1202);
    float _1214 = fma(_1198, _1194, _1204);
    float _1216 = fma(_1166, _1170, _1148);
    float _1218 = fma(_1208, _1188, _1210);
    float _1220 = fma(_1180, _1194, _1212);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1224 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1216, _1194, _1218);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1222);
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1232 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1234 = -_1114;
    float _1236 = _822 + _1234;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1230);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1232);
    float _1244 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1246 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1248 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1242);
    float _1250 = _822 + _1244;
    float _1252 = _820 + _1246;
    float _1254 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1250 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1252 + _1260;
    float _1264 = _786 + _1254;
    float _1266 = _1258 * _1258;
    float _1268 = fma(_1262, _1262, _1266);
    float _1270 = -_1100;
    float _1272 = _820 + _1270;
    float _1274 = sqrt(_1268);
    float _1276 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1278 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1280 = floor(_1276);
    bool _1282 = _1274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1284 = floor(_1278);
    float _1286 = _1220;
    float _1288 = _1226;
    float _1290 = _1214;
    float _1292 = _1098;
    float _1294 = _1236;
    if (!_1282)
    {
        _1286 = _1252;
    }
    float _1296 = _1286;
    float _1298 = _1296;
    if (!_1282)
    {
        _1288 = _1250;
    }
    float _1300 = _1288;
    float _1302 = _1300;
    if (!_1282)
    {
        _1290 = _1264;
    }
    float _1304 = _1290;
    bool _1306 = !_1282;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1274 + _1312;
        float _1316 = rsqrt(_1268);
        float _1318 = _1314 * _1310;
        float _1320 = _1264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1330, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = _1316 * _1334;
        float _1340 = fma(_1264, _1326, _1336);
        float _1342 = fma(_1262, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1344 = fma(_1258, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1342;
        _1302 = _1344;
        _1308 = _1340;
    }
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1308;
    float _1352 = fma(_1346, 6.2500002968590706586837768554688e-05, 0.5);
    float _1354 = fma(_1348, 6.2500002968590706586837768554688e-05, 0.5);
    float _1356 = -_1280;
    float _1358 = _1276 + _1356;
    float _1360 = -_1284;
    float _1362 = _1278 + _1360;
    float2 _5015 = float2(_1352, _1354);
    float3 _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5015, float2(0.0), isnan(_5015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5015, float2(0.0), isnan(_5015)), level(0.0)).xyz;
    float _1368 = _1366.x;
    float _1370 = _1366.y;
    float _1372 = _1366.z;
    float2 _5031 = float2(_1358, _1362);
    float _1374 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).x;
    float _1376 = in.m_59.w;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1380 = _632 > 0.5;
    float _1382 = in.m_69.y;
    bool _1384 = _646 > 0.5;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1390 = in.m_69.x;
    float _1392 = -_1098;
    float _1394 = _1392 + _1350;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1398 = -_1100;
    float _1400 = _1398 + _1346;
    float _1402 = in.m_71.w;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1404;
    float _1408 = -_1114;
    float _1410 = _1408 + _1348;
    out.m_73.w = _1078;
    float _1412 = 1.0 / _1388;
    out.m_75.x = _1160;
    bool _1414 = _1376 > 0.5;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1418 = -_1382;
    float _1420 = _1418 + 1.0;
    float _1422 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1426 = _1424 != 0;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1430 = _1428 != 0;
    int _1432 = _1384 ? as_type<int>(_1420) : as_type<int>(_1382);
    int _1434 = _1414 ? as_type<int>(_1420) : as_type<int>(_1382);
    out.m_77.w = _1402;
    float _1436 = _1430 ? as_type<float>(_1432) : _1382;
    float _1438 = _1406 * _1412;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1442 = _1440 != 0;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1446 = _630 + _1444;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1450 = _1448 != 0;
    float _1452 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1460 = _1458 != 0;
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1464 = _1442 ? as_type<float>(_1434) : _1382;
    float _1466 = _1406;
    bool _1468 = _1442;
    float _1470 = _1378;
    float _1472 = _1382;
    int _1474 = as_type<int>(_1416);
    if (!_1426)
    {
        _1466 = _1390;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (_1426)
    {
        bool _1480 = _638 > 0.5;
        _1468 = _1480;
    }
    bool _1482 = _1468;
    float _1484 = fma(_1438, _1446, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1486 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1488 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1490 = isnan(_630);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    if (!_1426)
    {
        _1470 = _1476;
    }
    float _1500 = _1470;
    float _1502 = _1500;
    if (_1426)
    {
        _1478 = _1390;
    }
    float _1504 = _1478;
    float _1506 = -_1498;
    float _1508 = _1506 + 1.0;
    bool _1510 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1512 = isnan(_630);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_1486, _1436, -0.5);
    float _1524 = _1522;
    float _1526 = _1508;
    if (_1450)
    {
        float _1528 = _1380 ? _1420 : _1382;
        _1472 = _1528;
    }
    float _1530 = _1472;
    if (_1426)
    {
        float _1532 = -_1504;
        float _1534 = _1532 + 1.0;
        _1474 = as_type<int>(_1534);
    }
    int _1536 = _1474;
    float _1538 = in.m_79.x;
    float _1540 = in.m_79.y;
    float _1542 = in.m_79.z;
    float _1544 = _1520 * _1508;
    bool _1546 = _1138 != 0.0;
    bool _1548 = isnan(_1138);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = -_956;
    float _1558 = fma(_1006, _1522, _1556);
    int _1560 = _1536;
    float _1562 = _1544;
    if (_1426)
    {
        float _1564 = _1482 ? as_type<float>(_1536) : _1504;
        _1502 = _1564;
    }
    float _1566 = _1502;
    float _1568 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1570 = _1484 * _1544;
    float _1572 = _1462;
    if (_1456)
    {
        float _1574 = -_1504;
        float _1576 = _1574 + 1.0;
        _1038 = as_type<int>(_1576);
    }
    int _1578 = _1038;
    if (_1460)
    {
        float _1580 = -_1504;
        float _1582 = _1580 + 1.0;
        _1560 = as_type<int>(_1582);
    }
    int _1584 = _1560;
    float _1586 = -_1520;
    float _1588 = _1586 + 1.0;
    bool _1590 = _1136 == 0.0;
    bool _1592 = !_1554;
    bool _1594 = _1590 && _1592;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1598 = as_type<float>(_1584);
    if (!_1456)
    {
        _1524 = _1504;
    }
    float _1600 = _1524;
    float _1602 = fma(_1464, _1568, -0.5);
    float _1604 = _1600;
    if (!_1460)
    {
        _1526 = _1504;
    }
    float _1606 = _1526;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1570);
    float _1610 = _1606;
    if (_1456)
    {
        float _1612 = _1380 ? as_type<float>(_1578) : _1504;
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = fma(_1422, _1566, -0.5);
    if (_1460)
    {
        float _1618 = _1384 ? as_type<float>(_1584) : _1504;
        _1610 = _1618;
    }
    float _1620 = _1610;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1624 = _1140 == 0.0;
    bool _1626 = _1624 && _1594;
    float _1628 = in.m_81.x;
    float _1630 = in.m_81.y;
    float _1632 = in.m_81.z;
    float _1634 = in.m_81.w;
    float _1636 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1608);
    float _1638 = fma(_1452, _1530, -0.5);
    float _1640 = fma(_988, _1616, _878);
    float _1642 = -_1014;
    float _1644 = fma(_854, _1602, _1642);
    float _1646 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1650 = -_1036;
    float _1652 = fma(_1010, _1638, _1650);
    float _1654 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1656 = fma(_1646, _1614, -0.5);
    float _1658 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1626)
    {
        _1572 = _1538;
    }
    float _1660 = _1572;
    float _1662 = _1660;
    if (!_1626)
    {
        float _1664 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1538);
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (_1626)
    {
        _1562 = _1540;
    }
    float _1668 = _1562;
    float _1670 = _1668;
    if (!_1626)
    {
        float _1672 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1540);
        _1670 = _1672;
    }
    float _1674 = _1670;
    float _1676 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1678 = fma(_870, _1656, _918);
    if (_1626)
    {
        _1598 = _1542;
    }
    float _1680 = _1598;
    float _1682 = _1680;
    if (!_1626)
    {
        float _1684 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1542);
        _1682 = _1684;
    }
    float _1686 = _1682;
    float _1688 = fma(_1676, _1620, -0.5);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1696 = _1630 * _1542;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1702 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1704 = _1632 * _1538;
    float _1706 = _1628 * _1540;
    float _1708 = fma(_1030, _1688, _888);
    float _1710 = -_1696;
    float _1712 = fma(_1632, _1540, _1710);
    float _1714 = -_1704;
    float _1716 = fma(_1628, _1542, _1714);
    float _1718 = -_1706;
    float _1720 = fma(_1630, _1538, _1718);
    float _1722 = _1708 + 0.5;
    out.m_83.x = _1698;
    out.m_83.y = _1700;
    out.m_83.z = _1702;
    out.m_83.w = _1648;
    float _1724 = _1558 + 0.5;
    float _1726 = _1640 + 0.5;
    float _1728 = _1678 + 0.5;
    float _1730 = _1644 + 0.5;
    float _1732 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1734 = -_1166;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1654);
    float _1738 = _1716 * _1634;
    float _1740 = -_1166;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1658);
    out.m_85.x = _1726;
    out.m_85.y = _1724;
    out.m_85.z = _1728;
    out.m_85.w = _1730;
    float _1744 = -_1166;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1732);
    float _1748 = _1652 + 0.5;
    float _1750 = _1712 * _1634;
    float _1752 = _1720 * _1634;
    float _1754 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1756 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1758 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1760 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1736);
    float _1762 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1754);
    float _1764 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1756);
    float _1766 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1758);
    float _1768 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1770 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1762);
    float _1772 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1774 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1764);
    float _1778 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1766);
    float _1780 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1772);
    float _1782 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1746);
    float _1784 = _1760 * _1630;
    float _1786 = _1760 * _1674;
    float _1788 = _1738 * _1760;
    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1792 = _1394 + _1790;
    float _1794 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1796 = _1782 * _1630;
    float _1798 = _1782 * _1674;
    float _1800 = _1738 * _1782;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1804 = _1400 + _1802;
    float _1806 = _1792 * _1792;
    float _1808 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1742);
    out.m_87.x = _1722;
    out.m_87.y = _1748;
    float _1810 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1768);
    float _1812 = fma(_1804, _1804, _1806);
    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1816 = _1410 + _1814;
    float _1818 = _1808 * _1674;
    float _1820 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1794);
    float _1822 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1780);
    float _1824 = fma(_1816, _1816, _1812);
    float _1826 = fma(_1770, _1666, _1798);
    float _1828 = fma(_1770, _1628, _1796);
    float _1830 = _1808 * _1630;
    float _1832 = _1738 * _1808;
    float _1834 = fma(_1776, _1666, _1786);
    float _1836 = fma(_1750, _1770, _1800);
    float _1838 = sqrt(_1824);
    float _1840 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1810);
    float _1842 = fma(_1778, _1666, _1818);
    float _1844 = fma(_1776, _1628, _1784);
    float _1846 = fma(_1778, _1628, _1830);
    float _1848 = fma(_1750, _1776, _1788);
    float _1850 = fma(_1750, _1778, _1832);
    float _1852 = fma(_1820, _1632, _1828);
    float _1854 = fma(_1822, _1632, _1844);
    float _1856 = fma(_1840, _1632, _1846);
    float _1858 = fma(_1752, _1820, _1836);
    float _1860 = fma(_1752, _1822, _1848);
    float _1862 = fma(_1752, _1840, _1850);
    float _1864 = fma(_1820, _1686, _1826);
    float _1866 = fma(_1822, _1686, _1834);
    float _1868 = fma(_1840, _1686, _1842);
    out.m_89.x = _1852;
    out.m_89.y = _1854;
    out.m_89.z = _1856;
    bool _1870 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1872 = isnan(_1838);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1878 = _1874 || _1876;
    float _1880 = -_1098;
    float _1882 = _786 + _1880;
    out.m_91.x = _1858;
    out.m_91.y = _1860;
    out.m_91.z = _1862;
    out.m_93.x = _1864;
    out.m_93.y = _1866;
    out.m_93.z = _1868;
    float _1884 = _1752;
    if (!_1878)
    {
        _1884 = 1.0;
    }
    float _1886 = _1884;
    out.m_95.x = _1368;
    out.m_95.y = _1370;
    out.m_95.z = _1372;
    bool _1888 = !_1878;
    float _1890 = _1886;
    float _1892 = _1370;
    float _1894 = _1372;
    if (!_1888)
    {
        bool _1896 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1898 = isnan(_1838);
        bool _1900 = _1896 || _1898;
        bool _1902 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1904 = _1900 || _1902;
        if (!_1904)
        {
            float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1908 = _1838 + _1906;
            float _1910 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1912 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1910;
            float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1916 = _1914 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1918 = 1.0 / _1912;
            float _1920 = _1908 * _1918;
            float _1922 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1890 = _1922;
            _1892 = _1918;
            _1924 = true;
        }
        else
        {
            bool _1926 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1928 = isnan(_1838);
            bool _1930 = _1926 || _1928;
            bool _1932 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1934 = _1930 || _1932;
            if (!_1934)
            {
                float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1938 = _1838 + _1936;
                float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1942 = _1940 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1946 = _1944 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1948 = 1.0 / _1942;
                float _1950 = _1938 * _1948;
                float _1952 = fma(_1950, _1946, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1890 = _1952;
                _1892 = _1948;
                _1924 = true;
            }
            else
            {
                _1890 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1924 = false;
    float _1954 = _1890;
    float _1956 = _1892;
    float _1958 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1960 = _1394 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1964 = _1400 + _1962;
    float _1966 = fma(_1960, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1968 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1970 = _1410 + _1968;
    float _1972 = fma(_1964, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1974 = -_1882;
    float _1976 = _1974 + _1966;
    float _1978 = fma(_1970, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1980 = -_1272;
    float _1982 = _1980 + _1972;
    float _1984 = _1976 * _1976;
    float _1986 = -_1236;
    float _1988 = _1986 + _1978;
    float _1990 = fma(_1982, _1982, _1984);
    float _1992 = fma(_1988, _1988, _1990);
    float _1994 = sqrt(_1992);
    bool _1996 = _1994 > 0.0;
    float _1998 = _1994;
    float _2000 = _1956;
    float _2002 = _1976;
    if (!_1996)
    {
        _1998 = _1972;
    }
    float _2004 = _1998;
    float _2006 = _2004;
    if (!_1996)
    {
        _2000 = _1966;
    }
    float _2008 = _2000;
    float _2010 = _2008;
    if (!_1996)
    {
        _1894 = _1978;
    }
    float _2012 = _1894;
    bool _2014 = !_1996;
    float _2016 = _2012;
    float _2018 = _2012;
    if (!_2014)
    {
        float _2020 = _204 * _204;
        float _2022 = fma(_206, _206, _2020);
        float _2024 = fma(_208, _208, _2022);
        float _2026 = rsqrt(_1992);
        float _2028 = sqrt(_2024);
        float _2030 = _1982 * _2026;
        float _2032 = _1976 * _2026;
        float _2034 = _1988 * _2026;
        bool _2036 = _2028 > 0.0;
        float _2038 = _2026;
        float _2040 = _2028;
        _2002 = _2032;
        if (!_2036)
        {
            _2038 = _1972;
        }
        float _2042 = _2038;
        _2006 = _2042;
        if (!_2036)
        {
            _2040 = _1966;
        }
        float _2044 = _2040;
        _2010 = _2044;
        if (!_2036)
        {
            _2016 = _1978;
        }
        float _2046 = _2016;
        bool _2048 = !_2036;
        _2018 = _2046;
        if (!_2048)
        {
            float _2050 = rsqrt(_2024);
            float _2052 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2054 = _204 * _2050;
            float _2056 = _206 * _2050;
            float _2058 = _208 * _2050;
            float _2060 = _2032 * _2054;
            float _2062 = fma(_2030, _2056, _2060);
            float _2064 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2066 = fma(_2034, _2058, _2062);
            float _2068 = _2066 * _2064;
            float _2070 = fma(_206, _2068, _1972);
            float _2072 = fma(_204, _2068, _1966);
            float _2074 = fma(_208, _2068, _1978);
            _2010 = _2072;
            _2006 = _2070;
            _2018 = _2074;
        }
    }
    float _2076 = _2010;
    float _2078 = _2006;
    float _2080 = _2018;
    float _2082 = _2002;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2086 = _2076 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2090 = _2078 + _2088;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2094 = _2080 + _2092;
    float _2096 = _2086 * _2086;
    float _2098 = fma(_2090, _2090, _2096);
    float _2100 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2102 = fma(_2094, _2094, _2098);
    float _2104 = rsqrt(_2102);
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2108 = _2090 * _2106;
    float _2110 = _2094 * _2106;
    float _2112 = _2108 * _2108;
    float _2114 = _2110 * _2110;
    float _2116 = _2112 + _2114;
    float _2118 = sqrt(_2116);
    bool _2120 = _2118 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2124 = _2118 + _2122;
    float _2126 = _2104;
    float _2128 = _2116;
    float _2130 = _2124;
    float _2132 = _2082;
    float _2134 = _2106;
    float _2136 = _2108;
    if (_2120)
    {
        float _2138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2126 = _2138;
    }
    float _2140 = _2126;
    if (_2120)
    {
        float _2142 = rsqrt(_2116);
        _2128 = _2142;
    }
    float _2144 = _2128;
    float _2146 = _2144;
    if (_2120)
    {
        float _2148 = _2124 * _2140;
        _2130 = _2148;
    }
    float _2150 = _2130;
    if (_2120)
    {
        float _2152 = _2150 * 0.15915493667125701904296875;
        _2132 = _2152;
    }
    float _2154 = _2132;
    float _2156 = _1972;
    if (_2120)
    {
        float _2158 = _2154 * 6.283185482025146484375;
        float _2160 = sin(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2166 = precise::max(0.0, _2164);
    float _2168 = _2094;
    float _2170 = _2166;
    float _2172 = _2164;
    if (_2120)
    {
        float _2174 = _2154 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        _2168 = _2176;
    }
    float _2178 = _2168;
    float _2180 = -_2106;
    float _2182 = -_2166;
    float _2184 = fma(_2086, _2180, _2182);
    float _2186 = _2184;
    if (_2120)
    {
        float _2188 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2170 = _2188;
    }
    float _2190 = _2170;
    float _2192 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2194 = _2162;
    float _2196 = _2190;
    if (_2120)
    {
        float _2198 = fma(_2162, _2190, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _2200;
    if (!_2120)
    {
        _2196 = _2110;
    }
    float _2204 = _2196;
    float _2206 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2192);
    float _2208 = _2204;
    if (_2120)
    {
        float _2210 = _2178 + (-1.0);
        _2172 = _2210;
    }
    float _2212 = _2172;
    if (_2120)
    {
        float _2214 = _2144 * _2200;
        _1292 = _2214;
    }
    float _2216 = _1292;
    if (!_2120)
    {
        _2202 = _2184;
    }
    float _2218 = _2202;
    float _2220 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2206);
    float _2222 = _2218;
    if (_2120)
    {
        float _2224 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2224;
    }
    float _2226 = _2134;
    if (_2120)
    {
        float _2228 = _2108 * _2216;
        _2136 = _2228;
    }
    float _2230 = _2136;
    if (!_2120)
    {
        _2146 = _2112;
    }
    float _2232 = _2146;
    float _2234 = _2232;
    if (_2120)
    {
        float _2236 = _2110 * _2216;
        _2208 = _2236;
    }
    float _2238 = _2208;
    if (_2120)
    {
        float _2240 = fma(_2184, _2178, _2226);
        _2222 = _2240;
    }
    float _2242 = _2222;
    if (_2120)
    {
        float _2244 = _2230 * _2230;
        _2234 = _2244;
    }
    float _2246 = _2234;
    float _2248 = sqrt(_2102);
    if (!_2120)
    {
        _2186 = _2114;
    }
    float _2250 = _2186;
    float _2252 = _2250;
    if (_2120)
    {
        float _2254 = _2238 * _2238;
        _2252 = _2254;
    }
    float _2256 = _2252;
    float _2258 = fma(_2242, _2242, _2246);
    float _2260 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2262 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2264 = _2258 + _2256;
    float _2266 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2260);
    float _2268 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2270 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2262);
    float _2272 = rsqrt(_2264);
    float _2274 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2266);
    float _2276 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2268);
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2286 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2276);
    float _2288 = -_2282;
    float _2290 = _2288 + 1.0;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = abs(_2290);
    float _2298 = log2(_2296);
    float _2300 = -_2292;
    float _2302 = fma(_2300, _2100, 1.0);
    float _2304 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2306 = _2272 * _2230;
    float _2308 = _2272 * _2242;
    float _2310 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2270);
    float _2312 = _2272 * _2238;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2316 = log2(_2302);
    float _2318 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2320 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2322 = -_2314;
    float _2324 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2322);
    float _2326 = _2308 + 1.0;
    float _2328 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2318);
    float _2330 = -_2312;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2324);
    float _2334 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2328);
    float _2338 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2340 = fma(_2332, -0.5, 0.5);
    float _2342 = exp2(_2334);
    float _2344 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2336);
    float _2346 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2348 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2338);
    float _2350 = fma(_2332, 0.5, 0.5);
    float _2352 = _2316 * 0.693147182464599609375;
    float _2354 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2346);
    float _2356 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2358 = 1.0 / _2344;
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2354);
    float _2364 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2356);
    float _2366 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2368 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2370 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2362);
    float _2372 = sqrt(_2340);
    float _2374 = -_2308;
    float _2376 = fma(_2342, _2326, _2374);
    float _2378 = fma(_2350, _2368, 1.570728778839111328125);
    float _2380 = fma(_2376, 0.5, 0.5);
    float _2382 = _2364 * _2358;
    float _2384 = _2370 * _2358;
    float _2386 = fma(_2382, 0.5, 0.5);
    float _2388 = fma(_2384, -0.5, 0.5);
    float _2390 = _2372 * 0.636619746685028076171875;
    float3 _6775 = float3(_2386, _2388, _2366);
    float _2392 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6775, float3(0.0), isnan(_6775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6775, float3(0.0), isnan(_6775)), level(0.0)).x;
    float3 _6786 = float3(_2386, _2388, _2366);
    float4 _2395 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6786, float3(0.0), isnan(_6786)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6786, float3(0.0), isnan(_6786)), level(0.0)).xyzw;
    float _2397 = _2395.x;
    float _2399 = _2395.y;
    float _2401 = _2395.z;
    float _2403 = _2395.w;
    float _2405 = -_2378;
    float _2407 = fma(_2390, _2405, 1.0);
    float2 _6807 = float2(_2407, _2380);
    float3 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6807, float2(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6807, float2(0.0), isnan(_6807)), level(0.0)).xyz;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    float _2417 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2419 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2421 = -_1374;
    float _2423 = _2421 + 1.0;
    float _2425 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2427 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2417);
    out.m_97.x = _1272;
    out.m_97.y = _1882;
    out.m_97.z = _1236;
    float _2429 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2427);
    float _2431 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2433 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2425);
    float _2435 = _2429 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2437 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2431);
    float _2439 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2433);
    float _2441 = 1.0 / _2435;
    float _2443 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2437);
    float _2445 = _2364 + _2344;
    float _2447 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2439);
    out.m_99.x = _2078;
    out.m_99.y = _2076;
    out.m_99.z = _2080;
    float _2449 = _2443 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2451 = _2445 * 0.5;
    out.gl_Position.x = _2364;
    out.gl_Position.y = _2370;
    out.gl_Position.z = _2447;
    out.gl_Position.w = _2344;
    float _2453 = _2449 + _2435;
    float _2455 = _2453 * _2441;
    float _2457 = _2455 * 0.5;
    float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2461 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2459);
    bool _2463 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan(0.5);
    bool _2471 = _2467 || _2469;
    float _2473 = 1.0 / _2461;
    float _2475 = _2439;
    float _2477 = _2419;
    float _2479 = _2423;
    float _2481 = _2370;
    float _2483 = _2364;
    if (_2471)
    {
        _2475 = 1.0;
    }
    float _2485 = _2475;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2489 = _2473 * _2487;
    float _2491 = in.m_101.x;
    float _2493 = abs(_2489);
    float _2495 = log2(_2493);
    float _2497 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2499 = exp2(_2497);
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2503 = precise::clamp(_2501, 0.0, 1.0);
    float _2505 = _2499;
    float _2507 = _2485;
    if (!_2471)
    {
        _2505 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2509 = _2505;
    float _2511 = fma(_2503, -2.0, 3.0);
    float _2513 = _2503 * _2503;
    float _2515 = _2513 * _2511;
    bool _2517 = _2489 <= 8000.0;
    bool _2519 = isnan(_2489);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(8000.0);
    bool _2525 = _2521 || _2523;
    float _2527 = float(_2525);
    float _2529 = -_2515;
    float _2531 = _2529 + 1.0;
    float _2533 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2515);
    float _2535 = exp2(_2419);
    float _2537 = _2527 * _2533;
    float _2539 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2471)
    {
        float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2543 = _2489 + _2541;
        _2477 = _2543;
    }
    float _2545 = _2477;
    float _2547 = _2423 * _2539;
    float _2549 = precise::clamp(_2547, 0.0, 1.0);
    float _2551 = _2545;
    if (!_2471)
    {
        float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2555 = _2509 + _2553;
        _2479 = _2555;
    }
    float _2557 = _2479;
    float _2559 = _2344 * 0.5;
    float _2561 = -_2549;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2565 = _1796;
    if (!_2471)
    {
        float _2567 = 1.0 / _2557;
        _2565 = _2567;
    }
    float _2569 = _2565;
    float _2571 = -_2535;
    float _2573 = _2571 + 1.0;
    float _2575 = fma(_2370, -0.5, _2559);
    float _2577 = _2563 * _2491;
    float _2579 = _2447 + _2344;
    float _2581 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2583 = _2577 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2585 = _2579 * 0.5;
    float _2587 = -_2581;
    float _2589 = _2587 + 1.0;
    out.m_103.x = _2583;
    float _2591 = _2581;
    float _2593 = _2589;
    if (!_2471)
    {
        float _2595 = _2545 * _2569;
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        _2507 = _2597;
    }
    float _2599 = _2507;
    out.m_105.x = _2451;
    out.m_105.y = _2575;
    out.m_105.z = _2585;
    out.m_105.w = _2344;
    bool _2601 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2603 = isnan(_2248);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2609 = _2605 || _2607;
    float _2611 = _2599 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2609)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2613 = _2481;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2609)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2619 = _2483;
    float _2621 = _2619;
    float _2623 = _2619;
    if (!_2609)
    {
        _2551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2625 = _2551;
    float _2627 = _2625;
    float _2629 = _2625;
    if (!_2609)
    {
        _1294 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2631 = _1294;
    float _2633 = _2581 * _2392;
    float _2635 = _2403 * _2589;
    float _2637 = _2631;
    float _2639 = _2631;
    if (!_2609)
    {
        _2591 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2641 = _2591;
    float _2643 = _2403 * _2633;
    float _2645 = _2641;
    float _2647 = _2641;
    if (!_2609)
    {
        _2593 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2649 = _2593;
    float _2651 = _2415 * _2633;
    float _2653 = fma(_2411, _2643, _2397);
    float _2655 = fma(_2413, _2643, _2399);
    float _2657 = fma(_2403, _2651, _2401);
    out.m_107.x = _2653;
    out.m_107.y = _2655;
    out.m_107.z = _2657;
    out.m_107.w = _2635;
    bool _2659 = !_2609;
    float _2661 = _2649;
    float _2663 = _2649;
    if (!_2659)
    {
        bool _2665 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2667 = isnan(_2248);
        bool _2669 = _2665 || _2667;
        bool _2671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2673 = _2669 || _2671;
        if (!_2673)
        {
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2677 = _2248 + _2675;
            float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2679;
            float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2687 = 1.0 / _2681;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2705 = _2677 * _2687;
            float _2707 = precise::clamp(_2705, 0.0, 1.0);
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2713 = fma(_2707, _2685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2715 = fma(_2707, _2711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2717 = fma(_2707, _2691, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2719 = fma(_2707, _2695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2721 = fma(_2707, _2699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2723 = fma(_2707, _2703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2623 = _2717;
            _2647 = _2721;
            _2617 = _2713;
            _2639 = _2719;
            _2629 = _2715;
            _2663 = _2723;
            _2725 = true;
        }
        else
        {
            bool _2727 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2729 = isnan(_2248);
            bool _2731 = _2727 || _2729;
            bool _2733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2735 = _2731 || _2733;
            if (!_2735)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2737 = _2615;
            _2617 = _2737;
            if (!_2735)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2739 = _2621;
            _2623 = _2739;
            if (!_2735)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2741 = _2627;
            _2629 = _2741;
            if (!_2735)
            {
                _2637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2743 = _2637;
            _2639 = _2743;
            if (!_2735)
            {
                _2645 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2745 = _2645;
            _2647 = _2745;
            if (!_2735)
            {
                _2661 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2747 = _2661;
            bool _2749 = !_2735;
            _2663 = _2747;
            if (!_2749)
            {
                bool _2751 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2753 = isnan(_2248);
                bool _2755 = _2751 || _2753;
                bool _2757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2759 = _2755 || _2757;
                if (!_2759)
                {
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2763 = _2248 + _2761;
                    float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2765;
                    float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2773 = 1.0 / _2767;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2791 = _2763 * _2773;
                    float _2793 = precise::clamp(_2791, 0.0, 1.0);
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2799 = fma(_2793, _2771, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2801 = fma(_2793, _2797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2803 = fma(_2793, _2777, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2805 = fma(_2793, _2781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2807 = fma(_2793, _2785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2809 = fma(_2793, _2789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2623 = _2803;
                    _2647 = _2807;
                    _2617 = _2799;
                    _2639 = _2805;
                    _2629 = _2801;
                    _2663 = _2809;
                    _2725 = true;
                }
                else
                {
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2647 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2663 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2725 = false;
    float _2811 = _2623;
    float _2813 = _2647;
    float _2815 = _2617;
    float _2817 = _2639;
    float _2819 = _2629;
    float _2821 = _2663;
    float _2823 = _2611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2825 = fma(_1866, -0.5, 0.5);
    float _2827 = precise::clamp(_2825, 0.0, 1.0);
    float _2829 = -_2811;
    float _2831 = _2829 + _2813;
    float _2833 = -_2815;
    float _2835 = _2833 + _2817;
    out.m_109.x = 0.0;
    float _2837 = fma(_2827, _2831, _2811);
    float _2839 = -_2819;
    float _2841 = _2839 + _2821;
    float _2843 = fma(_2827, _2835, _2815);
    float _2845 = _2837 * 0.586610972881317138671875;
    bool _2847 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2849 = fma(_2827, _2841, _2819);
    out.m_53.x = _2823;
    float _2851 = fma(_2843, 0.298911988735198974609375, _2845);
    bool _2853 = _2599 > 0.0;
    bool _2855 = isnan(_2599);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan(0.0);
    bool _2861 = _2857 || _2859;
    float _2863 = fma(_2849, 0.114477999508380889892578125, _2851);
    float _2865 = -_2863;
    float _2867 = _2843 + _2865;
    float _2869 = -_2863;
    float _2871 = _2837 + _2869;
    float _2873 = -_2863;
    float _2875 = _2849 + _2873;
    float _2877 = fma(_2867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    float _2879 = fma(_2871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    float _2881 = fma(_2875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    bool _2883 = !_2847;
    if (!_2883)
    {
        float _2885 = -_2076;
        float _2887 = _2885 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2889 = -_2078;
        float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2893 = -_2080;
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2897 = _2887 * _2887;
        float _2899 = fma(_2891, _2891, _2897);
        float _2901 = fma(_2895, _2895, _2899);
        float _2903 = sqrt(_2901);
        float _2905 = rsqrt(_2901);
        float _2907 = -_2903;
        float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2911 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2913 = precise::clamp(_2911, 0.0, 1.0);
        float _2915 = _2891 * _2905;
        float _2917 = _2887 * _2905;
        float _2919 = abs(_2913);
        float _2921 = log2(_2919);
        float _2923 = _2895 * _2905;
        float _2925 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2927 = _1866 * _2917;
        float _2929 = -_2917;
        float _2931 = -_2925;
        float _2933 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2931);
        float _2935 = fma(_1864, _2915, _2927);
        float _2937 = -_2923;
        float _2939 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2933);
        float _2941 = fma(_1868, _2923, _2935);
        float _2943 = precise::clamp(_2941, 0.0, 1.0);
        float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2947 = _2939 + _2945;
        float _2949 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2951 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2953 = precise::clamp(_2951, 0.0, 1.0);
        float _2955 = exp2(_2949);
        float _2957 = _2955 * _2953;
        float _2959 = _2943 * _2957;
        float _2961 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2963 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2965 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2961;
        out.m_109.y = _2963;
        out.m_109.z = _2965;
    }
    out.m_73.x = _2877;
    out.m_73.y = _2879;
    out.m_73.z = _2881;
    if (_2861)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2967 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2967;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2725 = false;
    bool _1924 = false;
    bool _622 = false;
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
        float _3024 = as_type<float>(_144);
        out.gl_Position.z = _3024;
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
        float _3094 = as_type<float>(_182);
        out.gl_Position.z = _3094;
    }
    if (_174)
    {
        return out;
    }
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _200);
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
    bool _528 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = isnan(_526);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _544 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_526);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _526 + _560;
    float _564 = -_538;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / _542;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _572 = _554 * _566;
    float _574 = -_554;
    float _576 = _574 + 1.0;
    float _578 = _558 * _568;
    float _580 = fma(_578, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = _580 * _572;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[116].x, _588);
    float _598 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _592;
    out.m_63.y = _594;
    out.m_63.z = _598;
    out.m_63.w = _600;
    bool _602 = !_570;
    float _620;
    if (!_602)
    {
        float _604 = in.m_59.x;
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _608 = _604 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        float _624 = float(_128);
        float _626 = 1.0 / _624;
        float _628 = _162 * _626;
        _620 = _628;
    }
    _622 = false;
    float _630 = _620;
    float _632 = in.m_59.z;
    float _634 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _636 = log2(_634);
    float _638 = in.m_59.x;
    float _640 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _644 = _642 != 0;
    float _646 = in.m_59.y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _652 = in.m_50.x;
    float _654 = in.m_50.y;
    float _656 = in.m_50.z;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _664 = _662 != 0;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _668 = _666 != 0;
    float _670 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _674 = _632 * 2.0;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _678 = _638 * 2.0;
    float _680 = _638 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _682 = floor(_674);
    float _684 = _638 + _632;
    float _686 = _646 * 2.0;
    float _688 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _690 = -_648;
    float _692 = fma(_680, 2.0, _690);
    float _694 = _684 + (-1.0);
    float _696 = _654 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _698 = fma(_688, -2.0, _650);
    float _700 = floor(_678);
    float _702 = _654 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _704 = _654 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _710 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[5].x, _702);
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _714 = _652;
    float _716 = _712;
    if (_644)
    {
        _714 = _638;
    }
    float _718 = _714;
    float _720 = floor(_686);
    bool _722 = _682 > 0.0;
    float _724 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].z, _710);
    bool _726 = _682 >= 0.0;
    bool _728 = isnan(_682);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    float _736 = _646 + _632;
    float _738 = _718;
    if (!_644)
    {
        _738 = _632;
    }
    float _740 = _738;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _744 = _734 ? 0 : 1;
    float _746 = _736 + (-1.0);
    bool _748 = _700 >= 0.0;
    bool _750 = isnan(_700);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _760 = _700 > 0.0;
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _764 = ~_744;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    float _770 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _772 = _768;
    float _774 = _740;
    if (!_722)
    {
        int _776 = ~_744;
        int _778 = _776 + 1;
        _772 = _778;
    }
    int _780 = _772;
    float _782 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].z, _712);
    int _784 = _756 ? 0 : 1;
    float _786 = _724 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _788 = _720 > 0.0;
    float _790 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[78].z, _758);
    bool _792 = _720 >= 0.0;
    bool _794 = isnan(_720);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].z, _706);
    float _804 = _740 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_644)
    {
        _774 = _632;
    }
    float _806 = _774;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _786 + _808;
    float _812 = _806;
    if (_644)
    {
        _812 = _646;
    }
    float _814 = _812;
    float _816 = -_672;
    float _818 = fma(_804, 2.0, _816);
    float _820 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _822 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_644)
    {
        _716 = _646;
    }
    float _824 = _716;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _828 = _824;
    if (_644)
    {
        _828 = _638;
    }
    float _830 = _828;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _834 = !_664;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _826);
    bool _840 = !_660;
    float _842 = _840 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[83].z, _832);
    float _846 = _830 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _848 = ~_784;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _838);
    int _856 = abs(as_type<int>(_842));
    float _858 = -_676;
    float _860 = fma(_846, 2.0, _858);
    float _862 = _842;
    int _864 = _852;
    float _866 = _846;
    if (_644)
    {
        _862 = _646;
    }
    float _868 = _862;
    float _870 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    float _872 = _868;
    if (!_644)
    {
        _872 = _638;
    }
    float _874 = _872;
    float _876 = -_162;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[76].x, _692);
    if (!_760)
    {
        int _880 = ~_784;
        int _882 = _880 + 1;
        _864 = _882;
    }
    int _884 = _864;
    float _886 = -_162;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[86].x, _818);
    int _890 = abs(_836);
    float _892 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _894 = float(_780);
    float _896 = _636 * _162;
    if (!_644)
    {
        _866 = _632;
    }
    float _898 = _866;
    float _900 = fma(_892, -2.0, _708);
    float _902 = _898;
    if (_644)
    {
        _902 = _646;
    }
    float _904 = _902;
    float _906 = exp2(_896);
    float _908 = float(_890);
    float _910 = _646 + (-0.5);
    float _912 = float(_884);
    float _914 = _904 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _916 = -_162;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _860);
    int _920 = _800 ? 0 : 1;
    float _922 = _908 * _912;
    float _924 = float(_856);
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _928 = fma(_914, -2.0, _742);
    int _930 = ~_920;
    int _932 = _930 + 1;
    int _934 = _932 + 1;
    float _936 = _924 * _894;
    int _938 = _934;
    if (!_788)
    {
        int _940 = ~_920;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _948 = in.m_65.x;
    float _950 = in.m_65.y;
    float _952 = in.m_65.z;
    float _954 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].w, _926);
    float _956 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _698);
    bool _958 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _960 = isnan(1.0);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _966 = _962 || _964;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _970 = 1.0 + _968;
    float _972 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].w, _946);
    float _974 = -_906;
    float _976 = _974 + 1.0;
    bool _978 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _980 = isnan(0.0);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _986 = _982 || _984;
    float _988 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _790);
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _820 + _990;
    float _994 = _810 * _810;
    float _996 = 1.0 / _970;
    float _998 = _922 * (-2.0);
    float _1000 = fma(_992, _992, _994);
    bool _1002 = !_668;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _954);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1010 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _972);
    int _1012 = abs(_1004);
    float _1014 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _928);
    float _1016 = _986 ? _976 : 0.0;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = _822 + _1018;
    float _1022 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1008);
    float _1024 = fma(_998, _950, _950);
    float _1026 = fma(_762, _998, _762);
    float _1028 = fma(_1020, _1020, _1000);
    float _1030 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1022);
    float _1032 = float(_944);
    float _1034 = sqrt(_1028);
    float _1036 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _900);
    int _1038 = as_type<int>(_956);
    if (_966)
    {
        float _1040 = _1016 * _996;
        _164 = _1040;
    }
    float _1042 = _164;
    float _1044 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1024);
    float _1046 = _638 + _646;
    float _1048 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1050 = _936 * (-2.0);
    float _1052 = rsqrt(_1028);
    float _1054 = float(_1012);
    float _1056 = _1046 + (-1.0);
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1060 = fma(_1026, _1042, _1044);
    float _1062 = fma(_1050, _948, _948);
    float _1064 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1066 = _1054 * _1032;
    float _1068 = _1034 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1070 = _638 + (-0.5);
    float _1072 = fma(_1064, _1050, _1064);
    float _1074 = _1066 * (-2.0);
    float _1076 = _632 + (-0.5);
    float _1078 = precise::min(_1058, _1068);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1062);
    float _1082 = fma(_770, _1074, _770);
    float _1084 = fma(_1074, _952, _952);
    float _1086 = _1060 * 0.15915493667125701904296875;
    float _1088 = _1052 * _1078;
    float _1090 = fma(_1072, _1042, _1080);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1084);
    float _1094 = _1086 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _810 * _1088;
    float _1100 = _992 * _1088;
    float _1102 = fma(_1082, _1042, _1092);
    float _1104 = _1090 * 0.15915493667125701904296875;
    float _1106 = -_1098;
    float _1108 = _810 + _1106;
    float _1110 = -_1100;
    float _1112 = _992 + _1110;
    float _1114 = _1020 * _1088;
    float _1116 = _1102 * 0.15915493667125701904296875;
    float _1118 = _1108 * _1108;
    float _1120 = _1086 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -_1114;
    float _1126 = _1020 + _1124;
    float _1128 = fma(_1112, _1112, _1118);
    float _1130 = fma(_1126, _1126, _1128);
    float _1132 = _1104 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    float _1136 = in.m_67.x;
    float _1138 = in.m_67.y;
    float _1140 = in.m_67.z;
    float _1142 = sqrt(_1130);
    float _1144 = _1104 * 6.283185482025146484375;
    float _1146 = sin(_1144);
    float _1148 = _1134 * _1122;
    float _1150 = _1134 * _1096;
    float _1152 = _1116 * 6.283185482025146484375;
    float _1154 = cos(_1152);
    float _1156 = _1052 * _1142;
    float _1158 = _640 * _1156;
    float _1160 = _1048 * _1156;
    float _1162 = _670 * _1156;
    float _1164 = _1116 * 6.283185482025146484375;
    float _1166 = sin(_1164);
    float _1168 = _1146 * _1122;
    float _1170 = _1146 * _1096;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1174 = _1134 * _1154;
    float _1176 = _1122 * _1154;
    float _1178 = _1146 * _1154;
    float _1180 = _1096 * _1154;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1184 = _1158 * _1182;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1188 = _1160 * _1172;
    float _1190 = fma(_1166, _1148, _1170);
    float _1192 = _1174 * _1184;
    float _1194 = _1162 * _1186;
    float _1196 = -_1168;
    float _1198 = fma(_1166, _1150, _1196);
    float _1200 = -_1184;
    float _1202 = _1166 * _1200;
    float _1204 = fma(_1190, _1188, _1192);
    float _1206 = -_1150;
    float _1208 = fma(_1166, _1168, _1206);
    float _1210 = _1178 * _1184;
    float _1212 = fma(_1176, _1188, _1202);
    float _1214 = fma(_1198, _1194, _1204);
    float _1216 = fma(_1166, _1170, _1148);
    float _1218 = fma(_1208, _1188, _1210);
    float _1220 = fma(_1180, _1194, _1212);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1224 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1216, _1194, _1218);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1222);
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1232 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1234 = -_1114;
    float _1236 = _822 + _1234;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1230);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1232);
    float _1244 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1246 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1248 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1242);
    float _1250 = _822 + _1244;
    float _1252 = _820 + _1246;
    float _1254 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1250 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1252 + _1260;
    float _1264 = _786 + _1254;
    float _1266 = _1258 * _1258;
    float _1268 = fma(_1262, _1262, _1266);
    float _1270 = -_1100;
    float _1272 = _820 + _1270;
    float _1274 = sqrt(_1268);
    float _1276 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1278 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1280 = floor(_1276);
    bool _1282 = _1274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1284 = floor(_1278);
    float _1286 = _1220;
    float _1288 = _1226;
    float _1290 = _1214;
    float _1292 = _1098;
    float _1294 = _1236;
    if (!_1282)
    {
        _1286 = _1252;
    }
    float _1296 = _1286;
    float _1298 = _1296;
    if (!_1282)
    {
        _1288 = _1250;
    }
    float _1300 = _1288;
    float _1302 = _1300;
    if (!_1282)
    {
        _1290 = _1264;
    }
    float _1304 = _1290;
    bool _1306 = !_1282;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1274 + _1312;
        float _1316 = rsqrt(_1268);
        float _1318 = _1314 * _1310;
        float _1320 = _1264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1330, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = _1316 * _1334;
        float _1340 = fma(_1264, _1326, _1336);
        float _1342 = fma(_1262, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1344 = fma(_1258, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1342;
        _1302 = _1344;
        _1308 = _1340;
    }
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1308;
    float _1352 = fma(_1346, 6.2500002968590706586837768554688e-05, 0.5);
    float _1354 = fma(_1348, 6.2500002968590706586837768554688e-05, 0.5);
    float _1356 = -_1280;
    float _1358 = _1276 + _1356;
    float _1360 = -_1284;
    float _1362 = _1278 + _1360;
    float2 _5015 = float2(_1352, _1354);
    float3 _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5015, float2(0.0), isnan(_5015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5015, float2(0.0), isnan(_5015)), level(0.0)).xyz;
    float _1368 = _1366.x;
    float _1370 = _1366.y;
    float _1372 = _1366.z;
    float2 _5031 = float2(_1358, _1362);
    float _1374 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).x;
    float _1376 = in.m_59.w;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1380 = _632 > 0.5;
    float _1382 = in.m_69.y;
    bool _1384 = _646 > 0.5;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1390 = in.m_69.x;
    float _1392 = -_1098;
    float _1394 = _1392 + _1350;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1398 = -_1100;
    float _1400 = _1398 + _1346;
    float _1402 = in.m_71.w;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1404;
    float _1408 = -_1114;
    float _1410 = _1408 + _1348;
    out.m_73.w = _1078;
    float _1412 = 1.0 / _1388;
    out.m_75.x = _1160;
    bool _1414 = _1376 > 0.5;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1418 = -_1382;
    float _1420 = _1418 + 1.0;
    float _1422 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1426 = _1424 != 0;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1430 = _1428 != 0;
    int _1432 = _1384 ? as_type<int>(_1420) : as_type<int>(_1382);
    int _1434 = _1414 ? as_type<int>(_1420) : as_type<int>(_1382);
    out.m_77.w = _1402;
    float _1436 = _1430 ? as_type<float>(_1432) : _1382;
    float _1438 = _1406 * _1412;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1442 = _1440 != 0;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1446 = _630 + _1444;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1450 = _1448 != 0;
    float _1452 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1460 = _1458 != 0;
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1464 = _1442 ? as_type<float>(_1434) : _1382;
    float _1466 = _1406;
    bool _1468 = _1442;
    float _1470 = _1378;
    float _1472 = _1382;
    int _1474 = as_type<int>(_1416);
    if (!_1426)
    {
        _1466 = _1390;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (_1426)
    {
        bool _1480 = _638 > 0.5;
        _1468 = _1480;
    }
    bool _1482 = _1468;
    float _1484 = fma(_1438, _1446, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1486 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1488 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1490 = isnan(_630);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    if (!_1426)
    {
        _1470 = _1476;
    }
    float _1500 = _1470;
    float _1502 = _1500;
    if (_1426)
    {
        _1478 = _1390;
    }
    float _1504 = _1478;
    float _1506 = -_1498;
    float _1508 = _1506 + 1.0;
    bool _1510 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1512 = isnan(_630);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_1486, _1436, -0.5);
    float _1524 = _1522;
    float _1526 = _1508;
    if (_1450)
    {
        float _1528 = _1380 ? _1420 : _1382;
        _1472 = _1528;
    }
    float _1530 = _1472;
    if (_1426)
    {
        float _1532 = -_1504;
        float _1534 = _1532 + 1.0;
        _1474 = as_type<int>(_1534);
    }
    int _1536 = _1474;
    float _1538 = in.m_79.x;
    float _1540 = in.m_79.y;
    float _1542 = in.m_79.z;
    float _1544 = _1520 * _1508;
    bool _1546 = _1138 != 0.0;
    bool _1548 = isnan(_1138);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = -_956;
    float _1558 = fma(_1006, _1522, _1556);
    int _1560 = _1536;
    float _1562 = _1544;
    if (_1426)
    {
        float _1564 = _1482 ? as_type<float>(_1536) : _1504;
        _1502 = _1564;
    }
    float _1566 = _1502;
    float _1568 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1570 = _1484 * _1544;
    float _1572 = _1462;
    if (_1456)
    {
        float _1574 = -_1504;
        float _1576 = _1574 + 1.0;
        _1038 = as_type<int>(_1576);
    }
    int _1578 = _1038;
    if (_1460)
    {
        float _1580 = -_1504;
        float _1582 = _1580 + 1.0;
        _1560 = as_type<int>(_1582);
    }
    int _1584 = _1560;
    float _1586 = -_1520;
    float _1588 = _1586 + 1.0;
    bool _1590 = _1136 == 0.0;
    bool _1592 = !_1554;
    bool _1594 = _1590 && _1592;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1598 = as_type<float>(_1584);
    if (!_1456)
    {
        _1524 = _1504;
    }
    float _1600 = _1524;
    float _1602 = fma(_1464, _1568, -0.5);
    float _1604 = _1600;
    if (!_1460)
    {
        _1526 = _1504;
    }
    float _1606 = _1526;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1570);
    float _1610 = _1606;
    if (_1456)
    {
        float _1612 = _1380 ? as_type<float>(_1578) : _1504;
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = fma(_1422, _1566, -0.5);
    if (_1460)
    {
        float _1618 = _1384 ? as_type<float>(_1584) : _1504;
        _1610 = _1618;
    }
    float _1620 = _1610;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1624 = _1140 == 0.0;
    bool _1626 = _1624 && _1594;
    float _1628 = in.m_81.x;
    float _1630 = in.m_81.y;
    float _1632 = in.m_81.z;
    float _1634 = in.m_81.w;
    float _1636 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1608);
    float _1638 = fma(_1452, _1530, -0.5);
    float _1640 = fma(_988, _1616, _878);
    float _1642 = -_1014;
    float _1644 = fma(_854, _1602, _1642);
    float _1646 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1650 = -_1036;
    float _1652 = fma(_1010, _1638, _1650);
    float _1654 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1656 = fma(_1646, _1614, -0.5);
    float _1658 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1626)
    {
        _1572 = _1538;
    }
    float _1660 = _1572;
    float _1662 = _1660;
    if (!_1626)
    {
        float _1664 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1538);
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (_1626)
    {
        _1562 = _1540;
    }
    float _1668 = _1562;
    float _1670 = _1668;
    if (!_1626)
    {
        float _1672 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1540);
        _1670 = _1672;
    }
    float _1674 = _1670;
    float _1676 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1678 = fma(_870, _1656, _918);
    if (_1626)
    {
        _1598 = _1542;
    }
    float _1680 = _1598;
    float _1682 = _1680;
    if (!_1626)
    {
        float _1684 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1542);
        _1682 = _1684;
    }
    float _1686 = _1682;
    float _1688 = fma(_1676, _1620, -0.5);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1696 = _1630 * _1542;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1702 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1704 = _1632 * _1538;
    float _1706 = _1628 * _1540;
    float _1708 = fma(_1030, _1688, _888);
    float _1710 = -_1696;
    float _1712 = fma(_1632, _1540, _1710);
    float _1714 = -_1704;
    float _1716 = fma(_1628, _1542, _1714);
    float _1718 = -_1706;
    float _1720 = fma(_1630, _1538, _1718);
    float _1722 = _1708 + 0.5;
    out.m_83.x = _1698;
    out.m_83.y = _1700;
    out.m_83.z = _1702;
    out.m_83.w = _1648;
    float _1724 = _1558 + 0.5;
    float _1726 = _1640 + 0.5;
    float _1728 = _1678 + 0.5;
    float _1730 = _1644 + 0.5;
    float _1732 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1734 = -_1166;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1654);
    float _1738 = _1716 * _1634;
    float _1740 = -_1166;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1658);
    out.m_85.x = _1726;
    out.m_85.y = _1724;
    out.m_85.z = _1728;
    out.m_85.w = _1730;
    float _1744 = -_1166;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1732);
    float _1748 = _1652 + 0.5;
    float _1750 = _1712 * _1634;
    float _1752 = _1720 * _1634;
    float _1754 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1756 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1758 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1760 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1736);
    float _1762 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1754);
    float _1764 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1756);
    float _1766 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1758);
    float _1768 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1770 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1762);
    float _1772 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1774 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1764);
    float _1778 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1766);
    float _1780 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1772);
    float _1782 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1746);
    float _1784 = _1760 * _1630;
    float _1786 = _1760 * _1674;
    float _1788 = _1738 * _1760;
    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1792 = _1394 + _1790;
    float _1794 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1796 = _1782 * _1630;
    float _1798 = _1782 * _1674;
    float _1800 = _1738 * _1782;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1804 = _1400 + _1802;
    float _1806 = _1792 * _1792;
    float _1808 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1742);
    out.m_87.x = _1722;
    out.m_87.y = _1748;
    float _1810 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1768);
    float _1812 = fma(_1804, _1804, _1806);
    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1816 = _1410 + _1814;
    float _1818 = _1808 * _1674;
    float _1820 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1794);
    float _1822 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1780);
    float _1824 = fma(_1816, _1816, _1812);
    float _1826 = fma(_1770, _1666, _1798);
    float _1828 = fma(_1770, _1628, _1796);
    float _1830 = _1808 * _1630;
    float _1832 = _1738 * _1808;
    float _1834 = fma(_1776, _1666, _1786);
    float _1836 = fma(_1750, _1770, _1800);
    float _1838 = sqrt(_1824);
    float _1840 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1810);
    float _1842 = fma(_1778, _1666, _1818);
    float _1844 = fma(_1776, _1628, _1784);
    float _1846 = fma(_1778, _1628, _1830);
    float _1848 = fma(_1750, _1776, _1788);
    float _1850 = fma(_1750, _1778, _1832);
    float _1852 = fma(_1820, _1632, _1828);
    float _1854 = fma(_1822, _1632, _1844);
    float _1856 = fma(_1840, _1632, _1846);
    float _1858 = fma(_1752, _1820, _1836);
    float _1860 = fma(_1752, _1822, _1848);
    float _1862 = fma(_1752, _1840, _1850);
    float _1864 = fma(_1820, _1686, _1826);
    float _1866 = fma(_1822, _1686, _1834);
    float _1868 = fma(_1840, _1686, _1842);
    out.m_89.x = _1852;
    out.m_89.y = _1854;
    out.m_89.z = _1856;
    bool _1870 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1872 = isnan(_1838);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1878 = _1874 || _1876;
    float _1880 = -_1098;
    float _1882 = _786 + _1880;
    out.m_91.x = _1858;
    out.m_91.y = _1860;
    out.m_91.z = _1862;
    out.m_93.x = _1864;
    out.m_93.y = _1866;
    out.m_93.z = _1868;
    float _1884 = _1752;
    if (!_1878)
    {
        _1884 = 1.0;
    }
    float _1886 = _1884;
    out.m_95.x = _1368;
    out.m_95.y = _1370;
    out.m_95.z = _1372;
    bool _1888 = !_1878;
    float _1890 = _1886;
    float _1892 = _1370;
    float _1894 = _1372;
    if (!_1888)
    {
        bool _1896 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1898 = isnan(_1838);
        bool _1900 = _1896 || _1898;
        bool _1902 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1904 = _1900 || _1902;
        if (!_1904)
        {
            float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1908 = _1838 + _1906;
            float _1910 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1912 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1910;
            float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1916 = _1914 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1918 = 1.0 / _1912;
            float _1920 = _1908 * _1918;
            float _1922 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1890 = _1922;
            _1892 = _1918;
            _1924 = true;
        }
        else
        {
            bool _1926 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1928 = isnan(_1838);
            bool _1930 = _1926 || _1928;
            bool _1932 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1934 = _1930 || _1932;
            if (!_1934)
            {
                float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1938 = _1838 + _1936;
                float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1942 = _1940 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1946 = _1944 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1948 = 1.0 / _1942;
                float _1950 = _1938 * _1948;
                float _1952 = fma(_1950, _1946, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1890 = _1952;
                _1892 = _1948;
                _1924 = true;
            }
            else
            {
                _1890 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1924 = false;
    float _1954 = _1890;
    float _1956 = _1892;
    float _1958 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1960 = _1394 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1964 = _1400 + _1962;
    float _1966 = fma(_1960, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1968 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1970 = _1410 + _1968;
    float _1972 = fma(_1964, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1974 = -_1882;
    float _1976 = _1974 + _1966;
    float _1978 = fma(_1970, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1980 = -_1272;
    float _1982 = _1980 + _1972;
    float _1984 = _1976 * _1976;
    float _1986 = -_1236;
    float _1988 = _1986 + _1978;
    float _1990 = fma(_1982, _1982, _1984);
    float _1992 = fma(_1988, _1988, _1990);
    float _1994 = sqrt(_1992);
    bool _1996 = _1994 > 0.0;
    float _1998 = _1994;
    float _2000 = _1956;
    float _2002 = _1976;
    if (!_1996)
    {
        _1998 = _1972;
    }
    float _2004 = _1998;
    float _2006 = _2004;
    if (!_1996)
    {
        _2000 = _1966;
    }
    float _2008 = _2000;
    float _2010 = _2008;
    if (!_1996)
    {
        _1894 = _1978;
    }
    float _2012 = _1894;
    bool _2014 = !_1996;
    float _2016 = _2012;
    float _2018 = _2012;
    if (!_2014)
    {
        float _2020 = _204 * _204;
        float _2022 = fma(_206, _206, _2020);
        float _2024 = fma(_208, _208, _2022);
        float _2026 = rsqrt(_1992);
        float _2028 = sqrt(_2024);
        float _2030 = _1982 * _2026;
        float _2032 = _1976 * _2026;
        float _2034 = _1988 * _2026;
        bool _2036 = _2028 > 0.0;
        float _2038 = _2026;
        float _2040 = _2028;
        _2002 = _2032;
        if (!_2036)
        {
            _2038 = _1972;
        }
        float _2042 = _2038;
        _2006 = _2042;
        if (!_2036)
        {
            _2040 = _1966;
        }
        float _2044 = _2040;
        _2010 = _2044;
        if (!_2036)
        {
            _2016 = _1978;
        }
        float _2046 = _2016;
        bool _2048 = !_2036;
        _2018 = _2046;
        if (!_2048)
        {
            float _2050 = rsqrt(_2024);
            float _2052 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2054 = _204 * _2050;
            float _2056 = _206 * _2050;
            float _2058 = _208 * _2050;
            float _2060 = _2032 * _2054;
            float _2062 = fma(_2030, _2056, _2060);
            float _2064 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2066 = fma(_2034, _2058, _2062);
            float _2068 = _2066 * _2064;
            float _2070 = fma(_206, _2068, _1972);
            float _2072 = fma(_204, _2068, _1966);
            float _2074 = fma(_208, _2068, _1978);
            _2010 = _2072;
            _2006 = _2070;
            _2018 = _2074;
        }
    }
    float _2076 = _2010;
    float _2078 = _2006;
    float _2080 = _2018;
    float _2082 = _2002;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2086 = _2076 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2090 = _2078 + _2088;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2094 = _2080 + _2092;
    float _2096 = _2086 * _2086;
    float _2098 = fma(_2090, _2090, _2096);
    float _2100 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2102 = fma(_2094, _2094, _2098);
    float _2104 = rsqrt(_2102);
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2108 = _2090 * _2106;
    float _2110 = _2094 * _2106;
    float _2112 = _2108 * _2108;
    float _2114 = _2110 * _2110;
    float _2116 = _2112 + _2114;
    float _2118 = sqrt(_2116);
    bool _2120 = _2118 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2124 = _2118 + _2122;
    float _2126 = _2104;
    float _2128 = _2116;
    float _2130 = _2124;
    float _2132 = _2082;
    float _2134 = _2106;
    float _2136 = _2108;
    if (_2120)
    {
        float _2138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2126 = _2138;
    }
    float _2140 = _2126;
    if (_2120)
    {
        float _2142 = rsqrt(_2116);
        _2128 = _2142;
    }
    float _2144 = _2128;
    float _2146 = _2144;
    if (_2120)
    {
        float _2148 = _2124 * _2140;
        _2130 = _2148;
    }
    float _2150 = _2130;
    if (_2120)
    {
        float _2152 = _2150 * 0.15915493667125701904296875;
        _2132 = _2152;
    }
    float _2154 = _2132;
    float _2156 = _1972;
    if (_2120)
    {
        float _2158 = _2154 * 6.283185482025146484375;
        float _2160 = sin(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2166 = precise::max(0.0, _2164);
    float _2168 = _2094;
    float _2170 = _2166;
    float _2172 = _2164;
    if (_2120)
    {
        float _2174 = _2154 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        _2168 = _2176;
    }
    float _2178 = _2168;
    float _2180 = -_2106;
    float _2182 = -_2166;
    float _2184 = fma(_2086, _2180, _2182);
    float _2186 = _2184;
    if (_2120)
    {
        float _2188 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2170 = _2188;
    }
    float _2190 = _2170;
    float _2192 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2194 = _2162;
    float _2196 = _2190;
    if (_2120)
    {
        float _2198 = fma(_2162, _2190, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _2200;
    if (!_2120)
    {
        _2196 = _2110;
    }
    float _2204 = _2196;
    float _2206 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2192);
    float _2208 = _2204;
    if (_2120)
    {
        float _2210 = _2178 + (-1.0);
        _2172 = _2210;
    }
    float _2212 = _2172;
    if (_2120)
    {
        float _2214 = _2144 * _2200;
        _1292 = _2214;
    }
    float _2216 = _1292;
    if (!_2120)
    {
        _2202 = _2184;
    }
    float _2218 = _2202;
    float _2220 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2206);
    float _2222 = _2218;
    if (_2120)
    {
        float _2224 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2224;
    }
    float _2226 = _2134;
    if (_2120)
    {
        float _2228 = _2108 * _2216;
        _2136 = _2228;
    }
    float _2230 = _2136;
    if (!_2120)
    {
        _2146 = _2112;
    }
    float _2232 = _2146;
    float _2234 = _2232;
    if (_2120)
    {
        float _2236 = _2110 * _2216;
        _2208 = _2236;
    }
    float _2238 = _2208;
    if (_2120)
    {
        float _2240 = fma(_2184, _2178, _2226);
        _2222 = _2240;
    }
    float _2242 = _2222;
    if (_2120)
    {
        float _2244 = _2230 * _2230;
        _2234 = _2244;
    }
    float _2246 = _2234;
    float _2248 = sqrt(_2102);
    if (!_2120)
    {
        _2186 = _2114;
    }
    float _2250 = _2186;
    float _2252 = _2250;
    if (_2120)
    {
        float _2254 = _2238 * _2238;
        _2252 = _2254;
    }
    float _2256 = _2252;
    float _2258 = fma(_2242, _2242, _2246);
    float _2260 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2262 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2264 = _2258 + _2256;
    float _2266 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2260);
    float _2268 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2270 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2262);
    float _2272 = rsqrt(_2264);
    float _2274 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2266);
    float _2276 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2268);
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2286 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2276);
    float _2288 = -_2282;
    float _2290 = _2288 + 1.0;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = abs(_2290);
    float _2298 = log2(_2296);
    float _2300 = -_2292;
    float _2302 = fma(_2300, _2100, 1.0);
    float _2304 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2306 = _2272 * _2230;
    float _2308 = _2272 * _2242;
    float _2310 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2270);
    float _2312 = _2272 * _2238;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2316 = log2(_2302);
    float _2318 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2320 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2322 = -_2314;
    float _2324 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2322);
    float _2326 = _2308 + 1.0;
    float _2328 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2318);
    float _2330 = -_2312;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2324);
    float _2334 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2328);
    float _2338 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2340 = fma(_2332, -0.5, 0.5);
    float _2342 = exp2(_2334);
    float _2344 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2336);
    float _2346 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2348 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2338);
    float _2350 = fma(_2332, 0.5, 0.5);
    float _2352 = _2316 * 0.693147182464599609375;
    float _2354 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2346);
    float _2356 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2358 = 1.0 / _2344;
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2354);
    float _2364 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2356);
    float _2366 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2368 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2370 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2362);
    float _2372 = sqrt(_2340);
    float _2374 = -_2308;
    float _2376 = fma(_2342, _2326, _2374);
    float _2378 = fma(_2350, _2368, 1.570728778839111328125);
    float _2380 = fma(_2376, 0.5, 0.5);
    float _2382 = _2364 * _2358;
    float _2384 = _2370 * _2358;
    float _2386 = fma(_2382, 0.5, 0.5);
    float _2388 = fma(_2384, -0.5, 0.5);
    float _2390 = _2372 * 0.636619746685028076171875;
    float3 _6775 = float3(_2386, _2388, _2366);
    float _2392 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6775, float3(0.0), isnan(_6775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6775, float3(0.0), isnan(_6775)), level(0.0)).x;
    float3 _6786 = float3(_2386, _2388, _2366);
    float4 _2395 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6786, float3(0.0), isnan(_6786)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6786, float3(0.0), isnan(_6786)), level(0.0)).xyzw;
    float _2397 = _2395.x;
    float _2399 = _2395.y;
    float _2401 = _2395.z;
    float _2403 = _2395.w;
    float _2405 = -_2378;
    float _2407 = fma(_2390, _2405, 1.0);
    float2 _6807 = float2(_2407, _2380);
    float3 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6807, float2(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6807, float2(0.0), isnan(_6807)), level(0.0)).xyz;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    float _2417 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2419 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2421 = -_1374;
    float _2423 = _2421 + 1.0;
    float _2425 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2427 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2417);
    out.m_97.x = _1272;
    out.m_97.y = _1882;
    out.m_97.z = _1236;
    float _2429 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2427);
    float _2431 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2433 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2425);
    float _2435 = _2429 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2437 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2431);
    float _2439 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2433);
    float _2441 = 1.0 / _2435;
    float _2443 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2437);
    float _2445 = _2364 + _2344;
    float _2447 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2439);
    out.m_99.x = _2078;
    out.m_99.y = _2076;
    out.m_99.z = _2080;
    float _2449 = _2443 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2451 = _2445 * 0.5;
    out.gl_Position.x = _2364;
    out.gl_Position.y = _2370;
    out.gl_Position.z = _2447;
    out.gl_Position.w = _2344;
    float _2453 = _2449 + _2435;
    float _2455 = _2453 * _2441;
    float _2457 = _2455 * 0.5;
    float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2461 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2459);
    bool _2463 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan(0.5);
    bool _2471 = _2467 || _2469;
    float _2473 = 1.0 / _2461;
    float _2475 = _2439;
    float _2477 = _2419;
    float _2479 = _2423;
    float _2481 = _2370;
    float _2483 = _2364;
    if (_2471)
    {
        _2475 = 1.0;
    }
    float _2485 = _2475;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2489 = _2473 * _2487;
    float _2491 = in.m_101.x;
    float _2493 = abs(_2489);
    float _2495 = log2(_2493);
    float _2497 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2499 = exp2(_2497);
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2503 = precise::clamp(_2501, 0.0, 1.0);
    float _2505 = _2499;
    float _2507 = _2485;
    if (!_2471)
    {
        _2505 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2509 = _2505;
    float _2511 = fma(_2503, -2.0, 3.0);
    float _2513 = _2503 * _2503;
    float _2515 = _2513 * _2511;
    bool _2517 = _2489 <= 8000.0;
    bool _2519 = isnan(_2489);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(8000.0);
    bool _2525 = _2521 || _2523;
    float _2527 = float(_2525);
    float _2529 = -_2515;
    float _2531 = _2529 + 1.0;
    float _2533 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2515);
    float _2535 = exp2(_2419);
    float _2537 = _2527 * _2533;
    float _2539 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2471)
    {
        float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2543 = _2489 + _2541;
        _2477 = _2543;
    }
    float _2545 = _2477;
    float _2547 = _2423 * _2539;
    float _2549 = precise::clamp(_2547, 0.0, 1.0);
    float _2551 = _2545;
    if (!_2471)
    {
        float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2555 = _2509 + _2553;
        _2479 = _2555;
    }
    float _2557 = _2479;
    float _2559 = _2344 * 0.5;
    float _2561 = -_2549;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2565 = _1796;
    if (!_2471)
    {
        float _2567 = 1.0 / _2557;
        _2565 = _2567;
    }
    float _2569 = _2565;
    float _2571 = -_2535;
    float _2573 = _2571 + 1.0;
    float _2575 = fma(_2370, -0.5, _2559);
    float _2577 = _2563 * _2491;
    float _2579 = _2447 + _2344;
    float _2581 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2583 = _2577 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2585 = _2579 * 0.5;
    float _2587 = -_2581;
    float _2589 = _2587 + 1.0;
    out.m_103.x = _2583;
    float _2591 = _2581;
    float _2593 = _2589;
    if (!_2471)
    {
        float _2595 = _2545 * _2569;
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        _2507 = _2597;
    }
    float _2599 = _2507;
    out.m_105.x = _2451;
    out.m_105.y = _2575;
    out.m_105.z = _2585;
    out.m_105.w = _2344;
    bool _2601 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2603 = isnan(_2248);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2609 = _2605 || _2607;
    float _2611 = _2599 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2609)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2613 = _2481;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2609)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2619 = _2483;
    float _2621 = _2619;
    float _2623 = _2619;
    if (!_2609)
    {
        _2551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2625 = _2551;
    float _2627 = _2625;
    float _2629 = _2625;
    if (!_2609)
    {
        _1294 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2631 = _1294;
    float _2633 = _2581 * _2392;
    float _2635 = _2403 * _2589;
    float _2637 = _2631;
    float _2639 = _2631;
    if (!_2609)
    {
        _2591 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2641 = _2591;
    float _2643 = _2403 * _2633;
    float _2645 = _2641;
    float _2647 = _2641;
    if (!_2609)
    {
        _2593 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2649 = _2593;
    float _2651 = _2415 * _2633;
    float _2653 = fma(_2411, _2643, _2397);
    float _2655 = fma(_2413, _2643, _2399);
    float _2657 = fma(_2403, _2651, _2401);
    out.m_107.x = _2653;
    out.m_107.y = _2655;
    out.m_107.z = _2657;
    out.m_107.w = _2635;
    bool _2659 = !_2609;
    float _2661 = _2649;
    float _2663 = _2649;
    if (!_2659)
    {
        bool _2665 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2667 = isnan(_2248);
        bool _2669 = _2665 || _2667;
        bool _2671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2673 = _2669 || _2671;
        if (!_2673)
        {
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2677 = _2248 + _2675;
            float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2679;
            float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2687 = 1.0 / _2681;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2705 = _2677 * _2687;
            float _2707 = precise::clamp(_2705, 0.0, 1.0);
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2713 = fma(_2707, _2685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2715 = fma(_2707, _2711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2717 = fma(_2707, _2691, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2719 = fma(_2707, _2695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2721 = fma(_2707, _2699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2723 = fma(_2707, _2703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2623 = _2717;
            _2647 = _2721;
            _2617 = _2713;
            _2639 = _2719;
            _2629 = _2715;
            _2663 = _2723;
            _2725 = true;
        }
        else
        {
            bool _2727 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2729 = isnan(_2248);
            bool _2731 = _2727 || _2729;
            bool _2733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2735 = _2731 || _2733;
            if (!_2735)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2737 = _2615;
            _2617 = _2737;
            if (!_2735)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2739 = _2621;
            _2623 = _2739;
            if (!_2735)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2741 = _2627;
            _2629 = _2741;
            if (!_2735)
            {
                _2637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2743 = _2637;
            _2639 = _2743;
            if (!_2735)
            {
                _2645 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2745 = _2645;
            _2647 = _2745;
            if (!_2735)
            {
                _2661 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2747 = _2661;
            bool _2749 = !_2735;
            _2663 = _2747;
            if (!_2749)
            {
                bool _2751 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2753 = isnan(_2248);
                bool _2755 = _2751 || _2753;
                bool _2757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2759 = _2755 || _2757;
                if (!_2759)
                {
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2763 = _2248 + _2761;
                    float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2765;
                    float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2773 = 1.0 / _2767;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2791 = _2763 * _2773;
                    float _2793 = precise::clamp(_2791, 0.0, 1.0);
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2799 = fma(_2793, _2771, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2801 = fma(_2793, _2797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2803 = fma(_2793, _2777, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2805 = fma(_2793, _2781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2807 = fma(_2793, _2785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2809 = fma(_2793, _2789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2623 = _2803;
                    _2647 = _2807;
                    _2617 = _2799;
                    _2639 = _2805;
                    _2629 = _2801;
                    _2663 = _2809;
                    _2725 = true;
                }
                else
                {
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2647 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2663 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2725 = false;
    float _2811 = _2623;
    float _2813 = _2647;
    float _2815 = _2617;
    float _2817 = _2639;
    float _2819 = _2629;
    float _2821 = _2663;
    float _2823 = _2611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2825 = fma(_1866, -0.5, 0.5);
    float _2827 = precise::clamp(_2825, 0.0, 1.0);
    float _2829 = -_2811;
    float _2831 = _2829 + _2813;
    float _2833 = -_2815;
    float _2835 = _2833 + _2817;
    out.m_109.x = 0.0;
    float _2837 = fma(_2827, _2831, _2811);
    float _2839 = -_2819;
    float _2841 = _2839 + _2821;
    float _2843 = fma(_2827, _2835, _2815);
    float _2845 = _2837 * 0.586610972881317138671875;
    bool _2847 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2849 = fma(_2827, _2841, _2819);
    out.m_53.x = _2823;
    float _2851 = fma(_2843, 0.298911988735198974609375, _2845);
    bool _2853 = _2599 > 0.0;
    bool _2855 = isnan(_2599);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan(0.0);
    bool _2861 = _2857 || _2859;
    float _2863 = fma(_2849, 0.114477999508380889892578125, _2851);
    float _2865 = -_2863;
    float _2867 = _2843 + _2865;
    float _2869 = -_2863;
    float _2871 = _2837 + _2869;
    float _2873 = -_2863;
    float _2875 = _2849 + _2873;
    float _2877 = fma(_2867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    float _2879 = fma(_2871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    float _2881 = fma(_2875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    bool _2883 = !_2847;
    if (!_2883)
    {
        float _2885 = -_2076;
        float _2887 = _2885 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2889 = -_2078;
        float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2893 = -_2080;
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2897 = _2887 * _2887;
        float _2899 = fma(_2891, _2891, _2897);
        float _2901 = fma(_2895, _2895, _2899);
        float _2903 = sqrt(_2901);
        float _2905 = rsqrt(_2901);
        float _2907 = -_2903;
        float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2911 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2913 = precise::clamp(_2911, 0.0, 1.0);
        float _2915 = _2891 * _2905;
        float _2917 = _2887 * _2905;
        float _2919 = abs(_2913);
        float _2921 = log2(_2919);
        float _2923 = _2895 * _2905;
        float _2925 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2927 = _1866 * _2917;
        float _2929 = -_2917;
        float _2931 = -_2925;
        float _2933 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2931);
        float _2935 = fma(_1864, _2915, _2927);
        float _2937 = -_2923;
        float _2939 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2933);
        float _2941 = fma(_1868, _2923, _2935);
        float _2943 = precise::clamp(_2941, 0.0, 1.0);
        float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2947 = _2939 + _2945;
        float _2949 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2951 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2953 = precise::clamp(_2951, 0.0, 1.0);
        float _2955 = exp2(_2949);
        float _2957 = _2955 * _2953;
        float _2959 = _2943 * _2957;
        float _2961 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2963 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2965 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2961;
        out.m_109.y = _2963;
        out.m_109.z = _2965;
    }
    out.m_73.x = _2877;
    out.m_73.y = _2879;
    out.m_73.z = _2881;
    if (_2861)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2967 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2967;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2725 = false;
    bool _1924 = false;
    bool _622 = false;
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
        float _3024 = as_type<float>(_144);
        out.gl_Position.z = _3024;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3094 = as_type<float>(_182);
        out.gl_Position.z = _3094;
    }
    if (_174)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _200);
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
    bool _528 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = isnan(_526);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _544 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_526);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _526 + _560;
    float _564 = -_538;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / _542;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _572 = _554 * _566;
    float _574 = -_554;
    float _576 = _574 + 1.0;
    float _578 = _558 * _568;
    float _580 = fma(_578, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = _580 * _572;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[116].x, _588);
    float _598 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _592;
    out.m_63.y = _594;
    out.m_63.z = _598;
    out.m_63.w = _600;
    bool _602 = !_570;
    float _620;
    if (!_602)
    {
        float _604 = in.m_59.x;
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _608 = _604 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _612 = _610 * _606;
        float _614 = floor(_612);
        float _616 = -_614;
        float _618 = _612 + _616;
        _620 = _618;
        _622 = true;
    }
    else
    {
        float _624 = float(_128);
        float _626 = 1.0 / _624;
        float _628 = _162 * _626;
        _620 = _628;
    }
    _622 = false;
    float _630 = _620;
    float _632 = in.m_59.z;
    float _634 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _636 = log2(_634);
    float _638 = in.m_59.x;
    float _640 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _644 = _642 != 0;
    float _646 = in.m_59.y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _652 = in.m_50.x;
    float _654 = in.m_50.y;
    float _656 = in.m_50.z;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _664 = _662 != 0;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _668 = _666 != 0;
    float _670 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _674 = _632 * 2.0;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _678 = _638 * 2.0;
    float _680 = _638 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _682 = floor(_674);
    float _684 = _638 + _632;
    float _686 = _646 * 2.0;
    float _688 = _646 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _690 = -_648;
    float _692 = fma(_680, 2.0, _690);
    float _694 = _684 + (-1.0);
    float _696 = _654 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _698 = fma(_688, -2.0, _650);
    float _700 = floor(_678);
    float _702 = _654 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _704 = _654 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _710 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[5].x, _702);
    float _712 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _714 = _652;
    float _716 = _712;
    if (_644)
    {
        _714 = _638;
    }
    float _718 = _714;
    float _720 = floor(_686);
    bool _722 = _682 > 0.0;
    float _724 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[5].z, _710);
    bool _726 = _682 >= 0.0;
    bool _728 = isnan(_682);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    float _736 = _646 + _632;
    float _738 = _718;
    if (!_644)
    {
        _738 = _632;
    }
    float _740 = _738;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _744 = _734 ? 0 : 1;
    float _746 = _736 + (-1.0);
    bool _748 = _700 >= 0.0;
    bool _750 = isnan(_700);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _760 = _700 > 0.0;
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _764 = ~_744;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    float _770 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _772 = _768;
    float _774 = _740;
    if (!_722)
    {
        int _776 = ~_744;
        int _778 = _776 + 1;
        _772 = _778;
    }
    int _780 = _772;
    float _782 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[6].z, _712);
    int _784 = _756 ? 0 : 1;
    float _786 = _724 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _788 = _720 > 0.0;
    float _790 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[78].z, _758);
    bool _792 = _720 >= 0.0;
    bool _794 = isnan(_720);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[4].z, _706);
    float _804 = _740 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_644)
    {
        _774 = _632;
    }
    float _806 = _774;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _786 + _808;
    float _812 = _806;
    if (_644)
    {
        _812 = _646;
    }
    float _814 = _812;
    float _816 = -_672;
    float _818 = fma(_804, 2.0, _816);
    float _820 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _822 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_644)
    {
        _716 = _646;
    }
    float _824 = _716;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _828 = _824;
    if (_644)
    {
        _828 = _638;
    }
    float _830 = _828;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _834 = !_664;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _826);
    bool _840 = !_660;
    float _842 = _840 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[83].z, _832);
    float _846 = _830 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _848 = ~_784;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _838);
    int _856 = abs(as_type<int>(_842));
    float _858 = -_676;
    float _860 = fma(_846, 2.0, _858);
    float _862 = _842;
    int _864 = _852;
    float _866 = _846;
    if (_644)
    {
        _862 = _646;
    }
    float _868 = _862;
    float _870 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    float _872 = _868;
    if (!_644)
    {
        _872 = _638;
    }
    float _874 = _872;
    float _876 = -_162;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[76].x, _692);
    if (!_760)
    {
        int _880 = ~_784;
        int _882 = _880 + 1;
        _864 = _882;
    }
    int _884 = _864;
    float _886 = -_162;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[86].x, _818);
    int _890 = abs(_836);
    float _892 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _894 = float(_780);
    float _896 = _636 * _162;
    if (!_644)
    {
        _866 = _632;
    }
    float _898 = _866;
    float _900 = fma(_892, -2.0, _708);
    float _902 = _898;
    if (_644)
    {
        _902 = _646;
    }
    float _904 = _902;
    float _906 = exp2(_896);
    float _908 = float(_890);
    float _910 = _646 + (-0.5);
    float _912 = float(_884);
    float _914 = _904 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _916 = -_162;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _860);
    int _920 = _800 ? 0 : 1;
    float _922 = _908 * _912;
    float _924 = float(_856);
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _928 = fma(_914, -2.0, _742);
    int _930 = ~_920;
    int _932 = _930 + 1;
    int _934 = _932 + 1;
    float _936 = _924 * _894;
    int _938 = _934;
    if (!_788)
    {
        int _940 = ~_920;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _948 = in.m_65.x;
    float _950 = in.m_65.y;
    float _952 = in.m_65.z;
    float _954 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[78].w, _926);
    float _956 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _698);
    bool _958 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _960 = isnan(1.0);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _966 = _962 || _964;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _970 = 1.0 + _968;
    float _972 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[88].w, _946);
    float _974 = -_906;
    float _976 = _974 + 1.0;
    bool _978 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _980 = isnan(0.0);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _986 = _982 || _984;
    float _988 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _790);
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _820 + _990;
    float _994 = _810 * _810;
    float _996 = 1.0 / _970;
    float _998 = _922 * (-2.0);
    float _1000 = fma(_992, _992, _994);
    bool _1002 = !_668;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _954);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1010 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _972);
    int _1012 = abs(_1004);
    float _1014 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _928);
    float _1016 = _986 ? _976 : 0.0;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1020 = _822 + _1018;
    float _1022 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1008);
    float _1024 = fma(_998, _950, _950);
    float _1026 = fma(_762, _998, _762);
    float _1028 = fma(_1020, _1020, _1000);
    float _1030 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1022);
    float _1032 = float(_944);
    float _1034 = sqrt(_1028);
    float _1036 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _900);
    int _1038 = as_type<int>(_956);
    if (_966)
    {
        float _1040 = _1016 * _996;
        _164 = _1040;
    }
    float _1042 = _164;
    float _1044 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1024);
    float _1046 = _638 + _646;
    float _1048 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1050 = _936 * (-2.0);
    float _1052 = rsqrt(_1028);
    float _1054 = float(_1012);
    float _1056 = _1046 + (-1.0);
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1060 = fma(_1026, _1042, _1044);
    float _1062 = fma(_1050, _948, _948);
    float _1064 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1066 = _1054 * _1032;
    float _1068 = _1034 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1070 = _638 + (-0.5);
    float _1072 = fma(_1064, _1050, _1064);
    float _1074 = _1066 * (-2.0);
    float _1076 = _632 + (-0.5);
    float _1078 = precise::min(_1058, _1068);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1062);
    float _1082 = fma(_770, _1074, _770);
    float _1084 = fma(_1074, _952, _952);
    float _1086 = _1060 * 0.15915493667125701904296875;
    float _1088 = _1052 * _1078;
    float _1090 = fma(_1072, _1042, _1080);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1084);
    float _1094 = _1086 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _810 * _1088;
    float _1100 = _992 * _1088;
    float _1102 = fma(_1082, _1042, _1092);
    float _1104 = _1090 * 0.15915493667125701904296875;
    float _1106 = -_1098;
    float _1108 = _810 + _1106;
    float _1110 = -_1100;
    float _1112 = _992 + _1110;
    float _1114 = _1020 * _1088;
    float _1116 = _1102 * 0.15915493667125701904296875;
    float _1118 = _1108 * _1108;
    float _1120 = _1086 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -_1114;
    float _1126 = _1020 + _1124;
    float _1128 = fma(_1112, _1112, _1118);
    float _1130 = fma(_1126, _1126, _1128);
    float _1132 = _1104 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    float _1136 = in.m_67.x;
    float _1138 = in.m_67.y;
    float _1140 = in.m_67.z;
    float _1142 = sqrt(_1130);
    float _1144 = _1104 * 6.283185482025146484375;
    float _1146 = sin(_1144);
    float _1148 = _1134 * _1122;
    float _1150 = _1134 * _1096;
    float _1152 = _1116 * 6.283185482025146484375;
    float _1154 = cos(_1152);
    float _1156 = _1052 * _1142;
    float _1158 = _640 * _1156;
    float _1160 = _1048 * _1156;
    float _1162 = _670 * _1156;
    float _1164 = _1116 * 6.283185482025146484375;
    float _1166 = sin(_1164);
    float _1168 = _1146 * _1122;
    float _1170 = _1146 * _1096;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1174 = _1134 * _1154;
    float _1176 = _1122 * _1154;
    float _1178 = _1146 * _1154;
    float _1180 = _1096 * _1154;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1184 = _1158 * _1182;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1188 = _1160 * _1172;
    float _1190 = fma(_1166, _1148, _1170);
    float _1192 = _1174 * _1184;
    float _1194 = _1162 * _1186;
    float _1196 = -_1168;
    float _1198 = fma(_1166, _1150, _1196);
    float _1200 = -_1184;
    float _1202 = _1166 * _1200;
    float _1204 = fma(_1190, _1188, _1192);
    float _1206 = -_1150;
    float _1208 = fma(_1166, _1168, _1206);
    float _1210 = _1178 * _1184;
    float _1212 = fma(_1176, _1188, _1202);
    float _1214 = fma(_1198, _1194, _1204);
    float _1216 = fma(_1166, _1170, _1148);
    float _1218 = fma(_1208, _1188, _1210);
    float _1220 = fma(_1180, _1194, _1212);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1224 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1226 = fma(_1216, _1194, _1218);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1222);
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1224);
    float _1232 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1234 = -_1114;
    float _1236 = _822 + _1234;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1230);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1232);
    float _1244 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1246 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1248 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1242);
    float _1250 = _822 + _1244;
    float _1252 = _820 + _1246;
    float _1254 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1250 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1252 + _1260;
    float _1264 = _786 + _1254;
    float _1266 = _1258 * _1258;
    float _1268 = fma(_1262, _1262, _1266);
    float _1270 = -_1100;
    float _1272 = _820 + _1270;
    float _1274 = sqrt(_1268);
    float _1276 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1278 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1280 = floor(_1276);
    bool _1282 = _1274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1284 = floor(_1278);
    float _1286 = _1220;
    float _1288 = _1226;
    float _1290 = _1214;
    float _1292 = _1098;
    float _1294 = _1236;
    if (!_1282)
    {
        _1286 = _1252;
    }
    float _1296 = _1286;
    float _1298 = _1296;
    if (!_1282)
    {
        _1288 = _1250;
    }
    float _1300 = _1288;
    float _1302 = _1300;
    if (!_1282)
    {
        _1290 = _1264;
    }
    float _1304 = _1290;
    bool _1306 = !_1282;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1274 + _1312;
        float _1316 = rsqrt(_1268);
        float _1318 = _1314 * _1310;
        float _1320 = _1264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1330, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = _1316 * _1334;
        float _1340 = fma(_1264, _1326, _1336);
        float _1342 = fma(_1262, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1344 = fma(_1258, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1342;
        _1302 = _1344;
        _1308 = _1340;
    }
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1308;
    float _1352 = fma(_1346, 6.2500002968590706586837768554688e-05, 0.5);
    float _1354 = fma(_1348, 6.2500002968590706586837768554688e-05, 0.5);
    float _1356 = -_1280;
    float _1358 = _1276 + _1356;
    float _1360 = -_1284;
    float _1362 = _1278 + _1360;
    float2 _5015 = float2(_1352, _1354);
    float3 _1366 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5015, float2(0.0), isnan(_5015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5015, float2(0.0), isnan(_5015)), level(0.0)).xyz;
    float _1368 = _1366.x;
    float _1370 = _1366.y;
    float _1372 = _1366.z;
    float2 _5031 = float2(_1358, _1362);
    float _1374 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5031, float2(0.0), isnan(_5031)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5031, float2(0.0), isnan(_5031)), level(0.0)).x;
    float _1376 = in.m_59.w;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1380 = _632 > 0.5;
    float _1382 = in.m_69.y;
    bool _1384 = _646 > 0.5;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1390 = in.m_69.x;
    float _1392 = -_1098;
    float _1394 = _1392 + _1350;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1398 = -_1100;
    float _1400 = _1398 + _1346;
    float _1402 = in.m_71.w;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1404;
    float _1408 = -_1114;
    float _1410 = _1408 + _1348;
    out.m_73.w = _1078;
    float _1412 = 1.0 / _1388;
    out.m_75.x = _1160;
    bool _1414 = _1376 > 0.5;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1418 = -_1382;
    float _1420 = _1418 + 1.0;
    float _1422 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1426 = _1424 != 0;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1430 = _1428 != 0;
    int _1432 = _1384 ? as_type<int>(_1420) : as_type<int>(_1382);
    int _1434 = _1414 ? as_type<int>(_1420) : as_type<int>(_1382);
    out.m_77.w = _1402;
    float _1436 = _1430 ? as_type<float>(_1432) : _1382;
    float _1438 = _1406 * _1412;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1442 = _1440 != 0;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1446 = _630 + _1444;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1450 = _1448 != 0;
    float _1452 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1460 = _1458 != 0;
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1464 = _1442 ? as_type<float>(_1434) : _1382;
    float _1466 = _1406;
    bool _1468 = _1442;
    float _1470 = _1378;
    float _1472 = _1382;
    int _1474 = as_type<int>(_1416);
    if (!_1426)
    {
        _1466 = _1390;
    }
    float _1476 = _1466;
    float _1478 = _1476;
    if (_1426)
    {
        bool _1480 = _638 > 0.5;
        _1468 = _1480;
    }
    bool _1482 = _1468;
    float _1484 = fma(_1438, _1446, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1486 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1488 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1490 = isnan(_630);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    if (!_1426)
    {
        _1470 = _1476;
    }
    float _1500 = _1470;
    float _1502 = _1500;
    if (_1426)
    {
        _1478 = _1390;
    }
    float _1504 = _1478;
    float _1506 = -_1498;
    float _1508 = _1506 + 1.0;
    bool _1510 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1512 = isnan(_630);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_1486, _1436, -0.5);
    float _1524 = _1522;
    float _1526 = _1508;
    if (_1450)
    {
        float _1528 = _1380 ? _1420 : _1382;
        _1472 = _1528;
    }
    float _1530 = _1472;
    if (_1426)
    {
        float _1532 = -_1504;
        float _1534 = _1532 + 1.0;
        _1474 = as_type<int>(_1534);
    }
    int _1536 = _1474;
    float _1538 = in.m_79.x;
    float _1540 = in.m_79.y;
    float _1542 = in.m_79.z;
    float _1544 = _1520 * _1508;
    bool _1546 = _1138 != 0.0;
    bool _1548 = isnan(_1138);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = -_956;
    float _1558 = fma(_1006, _1522, _1556);
    int _1560 = _1536;
    float _1562 = _1544;
    if (_1426)
    {
        float _1564 = _1482 ? as_type<float>(_1536) : _1504;
        _1502 = _1564;
    }
    float _1566 = _1502;
    float _1568 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1570 = _1484 * _1544;
    float _1572 = _1462;
    if (_1456)
    {
        float _1574 = -_1504;
        float _1576 = _1574 + 1.0;
        _1038 = as_type<int>(_1576);
    }
    int _1578 = _1038;
    if (_1460)
    {
        float _1580 = -_1504;
        float _1582 = _1580 + 1.0;
        _1560 = as_type<int>(_1582);
    }
    int _1584 = _1560;
    float _1586 = -_1520;
    float _1588 = _1586 + 1.0;
    bool _1590 = _1136 == 0.0;
    bool _1592 = !_1554;
    bool _1594 = _1590 && _1592;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1598 = as_type<float>(_1584);
    if (!_1456)
    {
        _1524 = _1504;
    }
    float _1600 = _1524;
    float _1602 = fma(_1464, _1568, -0.5);
    float _1604 = _1600;
    if (!_1460)
    {
        _1526 = _1504;
    }
    float _1606 = _1526;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1570);
    float _1610 = _1606;
    if (_1456)
    {
        float _1612 = _1380 ? as_type<float>(_1578) : _1504;
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = fma(_1422, _1566, -0.5);
    if (_1460)
    {
        float _1618 = _1384 ? as_type<float>(_1584) : _1504;
        _1610 = _1618;
    }
    float _1620 = _1610;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1624 = _1140 == 0.0;
    bool _1626 = _1624 && _1594;
    float _1628 = in.m_81.x;
    float _1630 = in.m_81.y;
    float _1632 = in.m_81.z;
    float _1634 = in.m_81.w;
    float _1636 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1608);
    float _1638 = fma(_1452, _1530, -0.5);
    float _1640 = fma(_988, _1616, _878);
    float _1642 = -_1014;
    float _1644 = fma(_854, _1602, _1642);
    float _1646 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1650 = -_1036;
    float _1652 = fma(_1010, _1638, _1650);
    float _1654 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1656 = fma(_1646, _1614, -0.5);
    float _1658 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1626)
    {
        _1572 = _1538;
    }
    float _1660 = _1572;
    float _1662 = _1660;
    if (!_1626)
    {
        float _1664 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1538);
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (_1626)
    {
        _1562 = _1540;
    }
    float _1668 = _1562;
    float _1670 = _1668;
    if (!_1626)
    {
        float _1672 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1540);
        _1670 = _1672;
    }
    float _1674 = _1670;
    float _1676 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1678 = fma(_870, _1656, _918);
    if (_1626)
    {
        _1598 = _1542;
    }
    float _1680 = _1598;
    float _1682 = _1680;
    if (!_1626)
    {
        float _1684 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1542);
        _1682 = _1684;
    }
    float _1686 = _1682;
    float _1688 = fma(_1676, _1620, -0.5);
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1696 = _1630 * _1542;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1702 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1704 = _1632 * _1538;
    float _1706 = _1628 * _1540;
    float _1708 = fma(_1030, _1688, _888);
    float _1710 = -_1696;
    float _1712 = fma(_1632, _1540, _1710);
    float _1714 = -_1704;
    float _1716 = fma(_1628, _1542, _1714);
    float _1718 = -_1706;
    float _1720 = fma(_1630, _1538, _1718);
    float _1722 = _1708 + 0.5;
    out.m_83.x = _1698;
    out.m_83.y = _1700;
    out.m_83.z = _1702;
    out.m_83.w = _1648;
    float _1724 = _1558 + 0.5;
    float _1726 = _1640 + 0.5;
    float _1728 = _1678 + 0.5;
    float _1730 = _1644 + 0.5;
    float _1732 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1734 = -_1166;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1654);
    float _1738 = _1716 * _1634;
    float _1740 = -_1166;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1658);
    out.m_85.x = _1726;
    out.m_85.y = _1724;
    out.m_85.z = _1728;
    out.m_85.w = _1730;
    float _1744 = -_1166;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1732);
    float _1748 = _1652 + 0.5;
    float _1750 = _1712 * _1634;
    float _1752 = _1720 * _1634;
    float _1754 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1756 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1758 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1760 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1736);
    float _1762 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1754);
    float _1764 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1756);
    float _1766 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1758);
    float _1768 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1770 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1762);
    float _1772 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1774 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1764);
    float _1778 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1766);
    float _1780 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1772);
    float _1782 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1746);
    float _1784 = _1760 * _1630;
    float _1786 = _1760 * _1674;
    float _1788 = _1738 * _1760;
    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1792 = _1394 + _1790;
    float _1794 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1796 = _1782 * _1630;
    float _1798 = _1782 * _1674;
    float _1800 = _1738 * _1782;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1804 = _1400 + _1802;
    float _1806 = _1792 * _1792;
    float _1808 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1742);
    out.m_87.x = _1722;
    out.m_87.y = _1748;
    float _1810 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1768);
    float _1812 = fma(_1804, _1804, _1806);
    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1816 = _1410 + _1814;
    float _1818 = _1808 * _1674;
    float _1820 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1794);
    float _1822 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1780);
    float _1824 = fma(_1816, _1816, _1812);
    float _1826 = fma(_1770, _1666, _1798);
    float _1828 = fma(_1770, _1628, _1796);
    float _1830 = _1808 * _1630;
    float _1832 = _1738 * _1808;
    float _1834 = fma(_1776, _1666, _1786);
    float _1836 = fma(_1750, _1770, _1800);
    float _1838 = sqrt(_1824);
    float _1840 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1810);
    float _1842 = fma(_1778, _1666, _1818);
    float _1844 = fma(_1776, _1628, _1784);
    float _1846 = fma(_1778, _1628, _1830);
    float _1848 = fma(_1750, _1776, _1788);
    float _1850 = fma(_1750, _1778, _1832);
    float _1852 = fma(_1820, _1632, _1828);
    float _1854 = fma(_1822, _1632, _1844);
    float _1856 = fma(_1840, _1632, _1846);
    float _1858 = fma(_1752, _1820, _1836);
    float _1860 = fma(_1752, _1822, _1848);
    float _1862 = fma(_1752, _1840, _1850);
    float _1864 = fma(_1820, _1686, _1826);
    float _1866 = fma(_1822, _1686, _1834);
    float _1868 = fma(_1840, _1686, _1842);
    out.m_89.x = _1852;
    out.m_89.y = _1854;
    out.m_89.z = _1856;
    bool _1870 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1872 = isnan(_1838);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1878 = _1874 || _1876;
    float _1880 = -_1098;
    float _1882 = _786 + _1880;
    out.m_91.x = _1858;
    out.m_91.y = _1860;
    out.m_91.z = _1862;
    out.m_93.x = _1864;
    out.m_93.y = _1866;
    out.m_93.z = _1868;
    float _1884 = _1752;
    if (!_1878)
    {
        _1884 = 1.0;
    }
    float _1886 = _1884;
    out.m_95.x = _1368;
    out.m_95.y = _1370;
    out.m_95.z = _1372;
    bool _1888 = !_1878;
    float _1890 = _1886;
    float _1892 = _1370;
    float _1894 = _1372;
    if (!_1888)
    {
        bool _1896 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1898 = isnan(_1838);
        bool _1900 = _1896 || _1898;
        bool _1902 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1904 = _1900 || _1902;
        if (!_1904)
        {
            float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1908 = _1838 + _1906;
            float _1910 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1912 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1910;
            float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1916 = _1914 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1918 = 1.0 / _1912;
            float _1920 = _1908 * _1918;
            float _1922 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1890 = _1922;
            _1892 = _1918;
            _1924 = true;
        }
        else
        {
            bool _1926 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1928 = isnan(_1838);
            bool _1930 = _1926 || _1928;
            bool _1932 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1934 = _1930 || _1932;
            if (!_1934)
            {
                float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1938 = _1838 + _1936;
                float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1942 = _1940 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1946 = _1944 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1948 = 1.0 / _1942;
                float _1950 = _1938 * _1948;
                float _1952 = fma(_1950, _1946, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1890 = _1952;
                _1892 = _1948;
                _1924 = true;
            }
            else
            {
                _1890 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1924 = false;
    float _1954 = _1890;
    float _1956 = _1892;
    float _1958 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1960 = _1394 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1964 = _1400 + _1962;
    float _1966 = fma(_1960, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1968 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1970 = _1410 + _1968;
    float _1972 = fma(_1964, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1974 = -_1882;
    float _1976 = _1974 + _1966;
    float _1978 = fma(_1970, _1954, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1980 = -_1272;
    float _1982 = _1980 + _1972;
    float _1984 = _1976 * _1976;
    float _1986 = -_1236;
    float _1988 = _1986 + _1978;
    float _1990 = fma(_1982, _1982, _1984);
    float _1992 = fma(_1988, _1988, _1990);
    float _1994 = sqrt(_1992);
    bool _1996 = _1994 > 0.0;
    float _1998 = _1994;
    float _2000 = _1956;
    float _2002 = _1976;
    if (!_1996)
    {
        _1998 = _1972;
    }
    float _2004 = _1998;
    float _2006 = _2004;
    if (!_1996)
    {
        _2000 = _1966;
    }
    float _2008 = _2000;
    float _2010 = _2008;
    if (!_1996)
    {
        _1894 = _1978;
    }
    float _2012 = _1894;
    bool _2014 = !_1996;
    float _2016 = _2012;
    float _2018 = _2012;
    if (!_2014)
    {
        float _2020 = _204 * _204;
        float _2022 = fma(_206, _206, _2020);
        float _2024 = fma(_208, _208, _2022);
        float _2026 = rsqrt(_1992);
        float _2028 = sqrt(_2024);
        float _2030 = _1982 * _2026;
        float _2032 = _1976 * _2026;
        float _2034 = _1988 * _2026;
        bool _2036 = _2028 > 0.0;
        float _2038 = _2026;
        float _2040 = _2028;
        _2002 = _2032;
        if (!_2036)
        {
            _2038 = _1972;
        }
        float _2042 = _2038;
        _2006 = _2042;
        if (!_2036)
        {
            _2040 = _1966;
        }
        float _2044 = _2040;
        _2010 = _2044;
        if (!_2036)
        {
            _2016 = _1978;
        }
        float _2046 = _2016;
        bool _2048 = !_2036;
        _2018 = _2046;
        if (!_2048)
        {
            float _2050 = rsqrt(_2024);
            float _2052 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2054 = _204 * _2050;
            float _2056 = _206 * _2050;
            float _2058 = _208 * _2050;
            float _2060 = _2032 * _2054;
            float _2062 = fma(_2030, _2056, _2060);
            float _2064 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2066 = fma(_2034, _2058, _2062);
            float _2068 = _2066 * _2064;
            float _2070 = fma(_206, _2068, _1972);
            float _2072 = fma(_204, _2068, _1966);
            float _2074 = fma(_208, _2068, _1978);
            _2010 = _2072;
            _2006 = _2070;
            _2018 = _2074;
        }
    }
    float _2076 = _2010;
    float _2078 = _2006;
    float _2080 = _2018;
    float _2082 = _2002;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2086 = _2076 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2090 = _2078 + _2088;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2094 = _2080 + _2092;
    float _2096 = _2086 * _2086;
    float _2098 = fma(_2090, _2090, _2096);
    float _2100 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2102 = fma(_2094, _2094, _2098);
    float _2104 = rsqrt(_2102);
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2108 = _2090 * _2106;
    float _2110 = _2094 * _2106;
    float _2112 = _2108 * _2108;
    float _2114 = _2110 * _2110;
    float _2116 = _2112 + _2114;
    float _2118 = sqrt(_2116);
    bool _2120 = _2118 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2124 = _2118 + _2122;
    float _2126 = _2104;
    float _2128 = _2116;
    float _2130 = _2124;
    float _2132 = _2082;
    float _2134 = _2106;
    float _2136 = _2108;
    if (_2120)
    {
        float _2138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2126 = _2138;
    }
    float _2140 = _2126;
    if (_2120)
    {
        float _2142 = rsqrt(_2116);
        _2128 = _2142;
    }
    float _2144 = _2128;
    float _2146 = _2144;
    if (_2120)
    {
        float _2148 = _2124 * _2140;
        _2130 = _2148;
    }
    float _2150 = _2130;
    if (_2120)
    {
        float _2152 = _2150 * 0.15915493667125701904296875;
        _2132 = _2152;
    }
    float _2154 = _2132;
    float _2156 = _1972;
    if (_2120)
    {
        float _2158 = _2154 * 6.283185482025146484375;
        float _2160 = sin(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2166 = precise::max(0.0, _2164);
    float _2168 = _2094;
    float _2170 = _2166;
    float _2172 = _2164;
    if (_2120)
    {
        float _2174 = _2154 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        _2168 = _2176;
    }
    float _2178 = _2168;
    float _2180 = -_2106;
    float _2182 = -_2166;
    float _2184 = fma(_2086, _2180, _2182);
    float _2186 = _2184;
    if (_2120)
    {
        float _2188 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2170 = _2188;
    }
    float _2190 = _2170;
    float _2192 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2194 = _2162;
    float _2196 = _2190;
    if (_2120)
    {
        float _2198 = fma(_2162, _2190, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _2200;
    if (!_2120)
    {
        _2196 = _2110;
    }
    float _2204 = _2196;
    float _2206 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2192);
    float _2208 = _2204;
    if (_2120)
    {
        float _2210 = _2178 + (-1.0);
        _2172 = _2210;
    }
    float _2212 = _2172;
    if (_2120)
    {
        float _2214 = _2144 * _2200;
        _1292 = _2214;
    }
    float _2216 = _1292;
    if (!_2120)
    {
        _2202 = _2184;
    }
    float _2218 = _2202;
    float _2220 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2206);
    float _2222 = _2218;
    if (_2120)
    {
        float _2224 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2224;
    }
    float _2226 = _2134;
    if (_2120)
    {
        float _2228 = _2108 * _2216;
        _2136 = _2228;
    }
    float _2230 = _2136;
    if (!_2120)
    {
        _2146 = _2112;
    }
    float _2232 = _2146;
    float _2234 = _2232;
    if (_2120)
    {
        float _2236 = _2110 * _2216;
        _2208 = _2236;
    }
    float _2238 = _2208;
    if (_2120)
    {
        float _2240 = fma(_2184, _2178, _2226);
        _2222 = _2240;
    }
    float _2242 = _2222;
    if (_2120)
    {
        float _2244 = _2230 * _2230;
        _2234 = _2244;
    }
    float _2246 = _2234;
    float _2248 = sqrt(_2102);
    if (!_2120)
    {
        _2186 = _2114;
    }
    float _2250 = _2186;
    float _2252 = _2250;
    if (_2120)
    {
        float _2254 = _2238 * _2238;
        _2252 = _2254;
    }
    float _2256 = _2252;
    float _2258 = fma(_2242, _2242, _2246);
    float _2260 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2262 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2264 = _2258 + _2256;
    float _2266 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2260);
    float _2268 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2270 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2262);
    float _2272 = rsqrt(_2264);
    float _2274 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2266);
    float _2276 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2268);
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2286 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2276);
    float _2288 = -_2282;
    float _2290 = _2288 + 1.0;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = abs(_2290);
    float _2298 = log2(_2296);
    float _2300 = -_2292;
    float _2302 = fma(_2300, _2100, 1.0);
    float _2304 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2306 = _2272 * _2230;
    float _2308 = _2272 * _2242;
    float _2310 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2270);
    float _2312 = _2272 * _2238;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2316 = log2(_2302);
    float _2318 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2320 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2322 = -_2314;
    float _2324 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2322);
    float _2326 = _2308 + 1.0;
    float _2328 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2318);
    float _2330 = -_2312;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2324);
    float _2334 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2328);
    float _2338 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2340 = fma(_2332, -0.5, 0.5);
    float _2342 = exp2(_2334);
    float _2344 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2336);
    float _2346 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2348 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2338);
    float _2350 = fma(_2332, 0.5, 0.5);
    float _2352 = _2316 * 0.693147182464599609375;
    float _2354 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2346);
    float _2356 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2358 = 1.0 / _2344;
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2354);
    float _2364 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2356);
    float _2366 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2368 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2370 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2362);
    float _2372 = sqrt(_2340);
    float _2374 = -_2308;
    float _2376 = fma(_2342, _2326, _2374);
    float _2378 = fma(_2350, _2368, 1.570728778839111328125);
    float _2380 = fma(_2376, 0.5, 0.5);
    float _2382 = _2364 * _2358;
    float _2384 = _2370 * _2358;
    float _2386 = fma(_2382, 0.5, 0.5);
    float _2388 = fma(_2384, -0.5, 0.5);
    float _2390 = _2372 * 0.636619746685028076171875;
    float3 _6775 = float3(_2386, _2388, _2366);
    float _2392 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6775, float3(0.0), isnan(_6775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6775, float3(0.0), isnan(_6775)), level(0.0)).x;
    float3 _6786 = float3(_2386, _2388, _2366);
    float4 _2395 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6786, float3(0.0), isnan(_6786)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6786, float3(0.0), isnan(_6786)), level(0.0)).xyzw;
    float _2397 = _2395.x;
    float _2399 = _2395.y;
    float _2401 = _2395.z;
    float _2403 = _2395.w;
    float _2405 = -_2378;
    float _2407 = fma(_2390, _2405, 1.0);
    float2 _6807 = float2(_2407, _2380);
    float3 _2409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6807, float2(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6807, float2(0.0), isnan(_6807)), level(0.0)).xyz;
    float _2411 = _2409.x;
    float _2413 = _2409.y;
    float _2415 = _2409.z;
    float _2417 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2419 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2421 = -_1374;
    float _2423 = _2421 + 1.0;
    float _2425 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2427 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2417);
    out.m_97.x = _1272;
    out.m_97.y = _1882;
    out.m_97.z = _1236;
    float _2429 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2427);
    float _2431 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2433 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2425);
    float _2435 = _2429 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2437 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2431);
    float _2439 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2433);
    float _2441 = 1.0 / _2435;
    float _2443 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2437);
    float _2445 = _2364 + _2344;
    float _2447 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2439);
    out.m_99.x = _2078;
    out.m_99.y = _2076;
    out.m_99.z = _2080;
    float _2449 = _2443 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2451 = _2445 * 0.5;
    out.gl_Position.x = _2364;
    out.gl_Position.y = _2370;
    out.gl_Position.z = _2447;
    out.gl_Position.w = _2344;
    float _2453 = _2449 + _2435;
    float _2455 = _2453 * _2441;
    float _2457 = _2455 * 0.5;
    float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2461 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2459);
    bool _2463 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan(0.5);
    bool _2471 = _2467 || _2469;
    float _2473 = 1.0 / _2461;
    float _2475 = _2439;
    float _2477 = _2419;
    float _2479 = _2423;
    float _2481 = _2370;
    float _2483 = _2364;
    if (_2471)
    {
        _2475 = 1.0;
    }
    float _2485 = _2475;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2489 = _2473 * _2487;
    float _2491 = in.m_101.x;
    float _2493 = abs(_2489);
    float _2495 = log2(_2493);
    float _2497 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2499 = exp2(_2497);
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2503 = precise::clamp(_2501, 0.0, 1.0);
    float _2505 = _2499;
    float _2507 = _2485;
    if (!_2471)
    {
        _2505 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2509 = _2505;
    float _2511 = fma(_2503, -2.0, 3.0);
    float _2513 = _2503 * _2503;
    float _2515 = _2513 * _2511;
    bool _2517 = _2489 <= 8000.0;
    bool _2519 = isnan(_2489);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(8000.0);
    bool _2525 = _2521 || _2523;
    float _2527 = float(_2525);
    float _2529 = -_2515;
    float _2531 = _2529 + 1.0;
    float _2533 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2515);
    float _2535 = exp2(_2419);
    float _2537 = _2527 * _2533;
    float _2539 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2471)
    {
        float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2543 = _2489 + _2541;
        _2477 = _2543;
    }
    float _2545 = _2477;
    float _2547 = _2423 * _2539;
    float _2549 = precise::clamp(_2547, 0.0, 1.0);
    float _2551 = _2545;
    if (!_2471)
    {
        float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2555 = _2509 + _2553;
        _2479 = _2555;
    }
    float _2557 = _2479;
    float _2559 = _2344 * 0.5;
    float _2561 = -_2549;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2565 = _1796;
    if (!_2471)
    {
        float _2567 = 1.0 / _2557;
        _2565 = _2567;
    }
    float _2569 = _2565;
    float _2571 = -_2535;
    float _2573 = _2571 + 1.0;
    float _2575 = fma(_2370, -0.5, _2559);
    float _2577 = _2563 * _2491;
    float _2579 = _2447 + _2344;
    float _2581 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2583 = _2577 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2585 = _2579 * 0.5;
    float _2587 = -_2581;
    float _2589 = _2587 + 1.0;
    out.m_103.x = _2583;
    float _2591 = _2581;
    float _2593 = _2589;
    if (!_2471)
    {
        float _2595 = _2545 * _2569;
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        _2507 = _2597;
    }
    float _2599 = _2507;
    out.m_105.x = _2451;
    out.m_105.y = _2575;
    out.m_105.z = _2585;
    out.m_105.w = _2344;
    bool _2601 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2603 = isnan(_2248);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2609 = _2605 || _2607;
    float _2611 = _2599 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2609)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2613 = _2481;
    float _2615 = _2613;
    float _2617 = _2613;
    if (!_2609)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2619 = _2483;
    float _2621 = _2619;
    float _2623 = _2619;
    if (!_2609)
    {
        _2551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2625 = _2551;
    float _2627 = _2625;
    float _2629 = _2625;
    if (!_2609)
    {
        _1294 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2631 = _1294;
    float _2633 = _2581 * _2392;
    float _2635 = _2403 * _2589;
    float _2637 = _2631;
    float _2639 = _2631;
    if (!_2609)
    {
        _2591 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2641 = _2591;
    float _2643 = _2403 * _2633;
    float _2645 = _2641;
    float _2647 = _2641;
    if (!_2609)
    {
        _2593 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2649 = _2593;
    float _2651 = _2415 * _2633;
    float _2653 = fma(_2411, _2643, _2397);
    float _2655 = fma(_2413, _2643, _2399);
    float _2657 = fma(_2403, _2651, _2401);
    out.m_107.x = _2653;
    out.m_107.y = _2655;
    out.m_107.z = _2657;
    out.m_107.w = _2635;
    bool _2659 = !_2609;
    float _2661 = _2649;
    float _2663 = _2649;
    if (!_2659)
    {
        bool _2665 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2667 = isnan(_2248);
        bool _2669 = _2665 || _2667;
        bool _2671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2673 = _2669 || _2671;
        if (!_2673)
        {
            float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2677 = _2248 + _2675;
            float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2679;
            float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2687 = 1.0 / _2681;
            float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2705 = _2677 * _2687;
            float _2707 = precise::clamp(_2705, 0.0, 1.0);
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2713 = fma(_2707, _2685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2715 = fma(_2707, _2711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2717 = fma(_2707, _2691, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2719 = fma(_2707, _2695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2721 = fma(_2707, _2699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2723 = fma(_2707, _2703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2623 = _2717;
            _2647 = _2721;
            _2617 = _2713;
            _2639 = _2719;
            _2629 = _2715;
            _2663 = _2723;
            _2725 = true;
        }
        else
        {
            bool _2727 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2729 = isnan(_2248);
            bool _2731 = _2727 || _2729;
            bool _2733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2735 = _2731 || _2733;
            if (!_2735)
            {
                _2615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2737 = _2615;
            _2617 = _2737;
            if (!_2735)
            {
                _2621 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2739 = _2621;
            _2623 = _2739;
            if (!_2735)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2741 = _2627;
            _2629 = _2741;
            if (!_2735)
            {
                _2637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2743 = _2637;
            _2639 = _2743;
            if (!_2735)
            {
                _2645 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2745 = _2645;
            _2647 = _2745;
            if (!_2735)
            {
                _2661 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2747 = _2661;
            bool _2749 = !_2735;
            _2663 = _2747;
            if (!_2749)
            {
                bool _2751 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2753 = isnan(_2248);
                bool _2755 = _2751 || _2753;
                bool _2757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2759 = _2755 || _2757;
                if (!_2759)
                {
                    float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2763 = _2248 + _2761;
                    float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2765;
                    float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2773 = 1.0 / _2767;
                    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2791 = _2763 * _2773;
                    float _2793 = precise::clamp(_2791, 0.0, 1.0);
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2799 = fma(_2793, _2771, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2801 = fma(_2793, _2797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2803 = fma(_2793, _2777, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2805 = fma(_2793, _2781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2807 = fma(_2793, _2785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2809 = fma(_2793, _2789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2623 = _2803;
                    _2647 = _2807;
                    _2617 = _2799;
                    _2639 = _2805;
                    _2629 = _2801;
                    _2663 = _2809;
                    _2725 = true;
                }
                else
                {
                    _2623 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2647 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2663 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2725 = false;
    float _2811 = _2623;
    float _2813 = _2647;
    float _2815 = _2617;
    float _2817 = _2639;
    float _2819 = _2629;
    float _2821 = _2663;
    float _2823 = _2611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2825 = fma(_1866, -0.5, 0.5);
    float _2827 = precise::clamp(_2825, 0.0, 1.0);
    float _2829 = -_2811;
    float _2831 = _2829 + _2813;
    float _2833 = -_2815;
    float _2835 = _2833 + _2817;
    out.m_109.x = 0.0;
    float _2837 = fma(_2827, _2831, _2811);
    float _2839 = -_2819;
    float _2841 = _2839 + _2821;
    float _2843 = fma(_2827, _2835, _2815);
    float _2845 = _2837 * 0.586610972881317138671875;
    bool _2847 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2849 = fma(_2827, _2841, _2819);
    out.m_53.x = _2823;
    float _2851 = fma(_2843, 0.298911988735198974609375, _2845);
    bool _2853 = _2599 > 0.0;
    bool _2855 = isnan(_2599);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan(0.0);
    bool _2861 = _2857 || _2859;
    float _2863 = fma(_2849, 0.114477999508380889892578125, _2851);
    float _2865 = -_2863;
    float _2867 = _2843 + _2865;
    float _2869 = -_2863;
    float _2871 = _2837 + _2869;
    float _2873 = -_2863;
    float _2875 = _2849 + _2873;
    float _2877 = fma(_2867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    float _2879 = fma(_2871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    float _2881 = fma(_2875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2863);
    bool _2883 = !_2847;
    if (!_2883)
    {
        float _2885 = -_2076;
        float _2887 = _2885 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2889 = -_2078;
        float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2893 = -_2080;
        float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2897 = _2887 * _2887;
        float _2899 = fma(_2891, _2891, _2897);
        float _2901 = fma(_2895, _2895, _2899);
        float _2903 = sqrt(_2901);
        float _2905 = rsqrt(_2901);
        float _2907 = -_2903;
        float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2911 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2913 = precise::clamp(_2911, 0.0, 1.0);
        float _2915 = _2891 * _2905;
        float _2917 = _2887 * _2905;
        float _2919 = abs(_2913);
        float _2921 = log2(_2919);
        float _2923 = _2895 * _2905;
        float _2925 = _2915 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2927 = _1866 * _2917;
        float _2929 = -_2917;
        float _2931 = -_2925;
        float _2933 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2931);
        float _2935 = fma(_1864, _2915, _2927);
        float _2937 = -_2923;
        float _2939 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2933);
        float _2941 = fma(_1868, _2923, _2935);
        float _2943 = precise::clamp(_2941, 0.0, 1.0);
        float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2947 = _2939 + _2945;
        float _2949 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2951 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2953 = precise::clamp(_2951, 0.0, 1.0);
        float _2955 = exp2(_2949);
        float _2957 = _2955 * _2953;
        float _2959 = _2943 * _2957;
        float _2961 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2963 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2965 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2961;
        out.m_109.y = _2963;
        out.m_109.z = _2965;
    }
    out.m_73.x = _2877;
    out.m_73.y = _2879;
    out.m_73.z = _2881;
    if (_2861)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2967 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2967;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

