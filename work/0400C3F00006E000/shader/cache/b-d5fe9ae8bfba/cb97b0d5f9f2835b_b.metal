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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 m_99 [[user(locn15)]];
    float4 m_97 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_81 [[attribute(5)]];
    float4 m_79 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_83 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5256 = false;
    bool _714 = false;
    bool _610 = false;
    bool _454 = false;
    bool _232 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_51.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5561 = as_type<float>(_138);
        out.gl_Position.z = _5561;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_53.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5630 = as_type<float>(_176);
        out.gl_Position.z = _5630;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_55.x;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_55.y;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    out.m_59.x = _178;
    out.m_59.y = _182;
    float _190 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _190);
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _194);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _200);
    bool _208 = !_180;
    float _210 = _182;
    float _212 = _178;
    float _230;
    if (!_208)
    {
        float _214 = in.m_61.x;
        float _216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _222 = _220 * _216;
        float _224 = floor(_222);
        float _226 = -_224;
        float _228 = _222 + _226;
        _230 = _228;
        _232 = true;
    }
    else
    {
        float _234 = float(_122);
        float _236 = 1.0 / _234;
        float _238 = _156 * _236;
        _230 = _238;
    }
    _232 = false;
    float _240 = _230;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _240 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _240 + _246;
    bool _250 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _252 = isnan(_240);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _240 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = 1.0 / _264;
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _282 = 1.0 / _276;
    float _284 = 1.0 / _272;
    float _286 = _244 * _278;
    bool _288 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_240);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -_260;
    float _302 = _300 + 1.0;
    float _304 = _298 * _302;
    float _306 = _248 * _282;
    bool _308 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_240);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_240);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -_298;
    float _342 = _340 + 1.0;
    float _344 = -_318;
    float _346 = _344 + 1.0;
    float _348 = _268 * _284;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = _334 * _346;
    float _360 = fma(_322, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_356, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = _318 * _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = _360 * _358;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = fma(_338, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _406;
    float _410 = fma(_396, _366, _386);
    float _412 = fma(_394, _286, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_404, _286, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_408, _286, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = fma(_398, _366, _388);
    float _420 = fma(_400, _366, _390);
    float _422 = fma(_412, _304, _410);
    float _424 = fma(_414, _304, _418);
    float _426 = fma(_416, _304, _420);
    float _428 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].x, _422);
    float _430 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].y, _424);
    float _432 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].z, _426);
    bool _434 = !_280;
    float _452;
    if (!_434)
    {
        float _436 = in.m_61.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_122);
        float _458 = 1.0 / _456;
        float _460 = _156 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _462 + _464;
    float _468 = in.m_63.x;
    float _470 = in.m_63.y;
    float _472 = in.m_63.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = isnan(_462);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _494 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    bool _510 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_462);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _476;
    float _524 = -_488;
    float _526 = _524 + 1.0;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _530 = _504 * _526;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = 1.0 / _492;
    float _538 = _508 * _522;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = _432 * _472;
    float _546 = _430 * _470;
    float _548 = fma(_538, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _550 = _428 * _468;
    float _552 = _542 * _536;
    float _554 = _548 * _530;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _462 + _560;
    float _564 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _566 = _488 * _558;
    float _568 = fma(_552, _562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _572 = fma(_568, _566, _564);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[117].x, _572);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _576;
    out.m_65.y = _586;
    out.m_65.z = _582;
    out.m_65.w = _584;
    bool _588 = !_528;
    int _590 = as_type<int>(_470);
    float _608;
    if (!_588)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_122);
        float _614 = 1.0 / _612;
        float _616 = _156 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _672 = _650 * _662;
    float _674 = fma(_672, _654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _678 = _674 * _664;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _678);
    float _684 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _682);
    float _686 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _686;
    out.m_67.y = _688;
    out.m_67.z = _690;
    out.m_67.w = _692;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_61.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[14].x, _156);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _156 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _726 = int(_724);
    float _728 = in.m_61.x;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _732 = _722 + _730;
    float _734 = float(_122);
    float _736 = in.m_61.y;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _746 = int(_744);
    float _748 = in.m_61.z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = float(_726);
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _756 = int(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _764 = float(uint(_746));
    float _766 = 1.0 / _752;
    int _768 = ~_746;
    int _770 = _768 + 1;
    bool _772 = _746 == 0;
    bool _774 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _776 = isnan(_722);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _764;
    int _788 = ~_746;
    int _790 = _788 + 1;
    float _792 = -_784;
    float _794 = _792 + 1.0;
    float _796 = float(uint(_756));
    int _798 = ~_756;
    int _800 = _798 + 1;
    int _802 = ~_756;
    int _804 = _802 + 1;
    float _806 = _766 * _156;
    float _808 = 1.0 / _796;
    bool _810 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _812 = isnan(_722);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    bool _822 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _824 = isnan(_722);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    int _834 = ~_746;
    int _836 = _834 + 1;
    int _838 = as_type<int>(_786) + (-2);
    float _840 = trunc(_806);
    int _842 = int(_840);
    float _844 = -_832;
    float _846 = _844 + 1.0;
    bool _848 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _850 = isnan(_722);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = 1.0 / _734;
    float _862 = float(uint(_842));
    float _864 = 1.0 / _760;
    float _866 = as_type<float>(_838) * _862;
    float _868 = trunc(_866);
    float _870 = precise::max(_868, 0.0);
    uint _873 = uint(_870);
    int _875 = _790 * int(_873);
    int _877 = _875 + _842;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _881 = int(_879);
    float _883 = float(uint(_877));
    float _885 = as_type<float>(_877);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _889 = _728;
    float _891 = _742;
    if (_740)
    {
        _885 = 1.0;
    }
    float _893 = _885;
    float _895 = _893;
    if (!_740)
    {
        _895 = 7.345489978790283203125;
    }
    float _897 = _895;
    float _899 = as_type<float>(_838) * _883;
    float _901 = trunc(_899);
    float _903 = precise::max(_901, 0.0);
    uint _905 = uint(_903);
    float _907 = _897 * _728;
    float _909 = float(_881);
    float _911 = 1.0 / _909;
    float _913 = float(_842);
    float _915 = floor(_907);
    int _917 = int(_873) + int(_905);
    float _919 = float(_746);
    int _921 = _770 * _917;
    int _923 = _921 + _842;
    bool _925 = _913 >= _919;
    bool _927 = isnan(_913);
    bool _929 = _925 || _927;
    bool _931 = isnan(_919);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = _911 * _156;
    bool _939 = uint(_923) >= uint(_746);
    float _941 = trunc(_935);
    int _943 = int(_941);
    bool _945 = !_939;
    int _947 = _945 ? 0 : (-1);
    float _949 = -_915;
    float _951 = _907 + _949;
    int _953 = ~_917;
    int _955 = _953 + _947;
    int _957 = _955 + 1;
    float _959 = trunc(_937);
    int _961 = int(_959);
    float _963 = _951 * _919;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _967 = _965 != 0;
    float _969 = _919 * _156;
    bool _971 = !_967;
    int _973 = _971 ? 0 : 1;
    float _975 = _969 * _860;
    float _977 = trunc(_963);
    int _979 = int(_977);
    int _981 = as_type<int>(_808) + (-2);
    int _983 = abs(_973);
    int _985 = _746 * _957;
    int _987 = _985 + _842;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _991 = _989 != 0;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _999 = _997 != 0;
    float _1001 = trunc(_975);
    int _1003 = int(_1001);
    float _1005 = float(uint(_961));
    int _1007 = ~_943;
    int _1009 = _1007 + 1;
    int _1011 = _1009 + 1;
    bool _1013 = !_772;
    int _1015 = _1013 ? _987 : (-1);
    float _1017 = as_type<float>(_981) * _1005;
    int _1019 = _746 + (-1);
    int _1021 = _979 * _983;
    int _1023 = _1021 + _842;
    bool _1025 = !_995;
    int _1027 = _1025 ? 0 : 1;
    int _1029 = _1015 * _1011;
    bool _1031 = !_991;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = trunc(_1017);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    int _1041 = abs(_1027);
    int _1043 = _943 * _1019;
    int _1045 = _1043 + _1029;
    bool _1047 = !_999;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1053 = _1051 != 0;
    int _1055 = abs(_1033);
    int _1057 = abs(_1049);
    int _1059 = _1045 * _1041;
    bool _1061 = !_1053;
    int _1063 = _1061 ? 0 : 1;
    int _1065 = _1003 * _1055;
    int _1067 = _1065 + _1059;
    int _1069 = abs(_1063);
    int _1071 = _800 * int(_1039);
    int _1073 = _1071 + _961;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1077 = _1075 != 0;
    int _1079 = _1023 * _1057;
    int _1081 = _1079 + _1067;
    float _1083 = in.m_61.w;
    float _1085 = float(uint(_1073));
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    int _1091 = _979 * _1069;
    int _1093 = _1091 + _1081;
    bool _1095 = _756 == 0;
    float _1097 = as_type<float>(_981) * _1085;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1101 = _1099 != 0;
    float _1103 = float(uint(_1093));
    float _1105 = as_type<float>(_1073);
    int _1107 = as_type<int>(_1103);
    bool _1109 = _1053;
    float _1111 = as_type<float>(_981);
    if (_1077)
    {
        _1105 = _728;
    }
    float _1113 = _1105;
    float _1115 = trunc(_1097);
    float _1117 = precise::max(_1115, 0.0);
    uint _1119 = uint(_1117);
    float _1121 = _1113;
    if (_1077)
    {
        _887 = 1.0;
    }
    float _1123 = _887;
    float _1125 = as_type<float>(_838) * _1103;
    float _1127 = _1123;
    if (!_1077)
    {
        _1121 = _736;
    }
    float _1129 = _1121;
    if (_1089)
    {
        float _1131 = -_178;
        float _1133 = _1131 + 1.0;
        _1107 = as_type<int>(_1133);
    }
    int _1135 = _1107;
    if (!_1077)
    {
        _1127 = 1.2345600128173828125;
    }
    float _1137 = _1127;
    if (_1089)
    {
        bool _1139 = _728 > 0.5;
        _1109 = _1139;
    }
    bool _1141 = _1109;
    float _1143 = trunc(_1125);
    float _1145 = precise::max(_1143, 0.0);
    uint _1147 = uint(_1145);
    float _1149 = 0.0;
    if (!_1089)
    {
        _1149 = _178;
    }
    float _1151 = _1149;
    float _1153 = _1129 * _1137;
    int _1155 = ~_746;
    int _1157 = _1155 + 1;
    int _1159 = 0;
    float _1161 = _1151;
    if (_1101)
    {
        float _1163 = -_178;
        float _1165 = _1163 + 1.0;
        _1159 = as_type<int>(_1165);
    }
    int _1167 = _1159;
    if (_1089)
    {
        float _1169 = _1141 ? as_type<float>(_1135) : _178;
        _1161 = _1169;
    }
    float _1171 = _1161;
    bool _1173 = _1083 > 0.5;
    float _1175 = floor(_1153);
    int _1177 = int(_1039) + int(_1119);
    float _1179 = float(_756);
    int _1181 = _804 * _1177;
    int _1183 = _1181 + _961;
    float _1185 = float(_961);
    int _1187 = _1157 * int(_1147);
    int _1189 = _1187 + _1093;
    bool _1191 = _736 > 0.5;
    float _1193 = _1179 * _156;
    bool _1195 = _1185 >= _1179;
    bool _1197 = isnan(_1185);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(_1179);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = float(uint(_1189));
    float _1209 = _1193 * _860;
    bool _1211 = uint(_1183) >= uint(_756);
    float _1213 = -_1175;
    float _1215 = _1153 + _1213;
    float _1217 = trunc(_1205);
    int _1219 = int(_1217);
    float _1221 = as_type<float>(_838) * _1207;
    bool _1223 = !_1211;
    int _1225 = _1223 ? 0 : (-1);
    float _1227 = -_182;
    float _1229 = _1227 + 1.0;
    float _1231 = _1179 * _1215;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1235 = _1233 != 0;
    int _1237 = ~_1177;
    int _1239 = _1237 + _1225;
    int _1241 = _1239 + 1;
    float _1243 = trunc(_1221);
    float _1245 = precise::max(_1243, 0.0);
    uint _1247 = uint(_1245);
    int _1249 = _1191 ? as_type<int>(_1229) : as_type<int>(_182);
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    int _1255 = _756 * _1241;
    int _1257 = _1255 + _961;
    int _1259 = ~_746;
    int _1261 = _1259 + 1;
    bool _1263 = !_1235;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = trunc(_1231);
    int _1269 = int(_1267);
    float _1271 = _1253 ? as_type<float>(_1249) : _182;
    bool _1273 = !_1095;
    int _1275 = _1273 ? _1257 : (-1);
    bool _1277 = _748 > 0.5;
    int _1279 = int(_1147) + int(_1247);
    int _1281 = abs(_1265);
    int _1283 = ~_1219;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    int _1289 = _1261 * _1279;
    int _1291 = _1289 + _1093;
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1299 = _1297 != 0;
    int _1301 = _1287 * _1275;
    int _1303 = _756 + (-1);
    bool _1305 = !_1299;
    int _1307 = _1305 ? 0 : 1;
    int _1309 = _1269 * _1281;
    int _1311 = _1309 + _961;
    bool _1313 = uint(_1291) >= uint(_746);
    int _1315 = _1219 * _1303;
    int _1317 = _1315 + _1301;
    float _1319 = 0.0;
    if (!_1101)
    {
        _1319 = _178;
    }
    float _1321 = _1319;
    float _1323 = trunc(_1209);
    int _1325 = int(_1323);
    float _1327 = _1321;
    if (_1101)
    {
        float _1329 = _1277 ? as_type<float>(_1167) : _178;
        _1327 = _1329;
    }
    float _1331 = _1327;
    bool _1333 = !_1313;
    int _1335 = _1333 ? 0 : (-1);
    int _1337 = abs(_1307);
    bool _1339 = !_1295;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1345 = _1343 != 0;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1349 = _1347 != 0;
    float _1351 = _748 * 2.0;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1355 = _1353 != 0;
    int _1357 = ~_1279;
    int _1359 = _1357 + _1335;
    int _1361 = _1359 + 1;
    int _1363 = abs(_1341);
    int _1365 = _746 * _1361;
    int _1367 = _1365 + _1093;
    int _1369 = _1173 ? as_type<int>(_1229) : as_type<int>(_182);
    int _1371 = _1317 * _1337;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1375 = _1373 != 0;
    bool _1377 = !_1345;
    int _1379 = _1377 ? 0 : 1;
    int _1381 = _1325 * _1363;
    int _1383 = _1381 + _1371;
    bool _1385 = _746 == 0;
    float _1387 = _1375 ? as_type<float>(_1369) : _182;
    if (_1355)
    {
        float _1389 = _1277 ? _1229 : _182;
        _210 = _1389;
    }
    float _1391 = _210;
    bool _1393 = !_1385;
    int _1395 = _1393 ? _1367 : (-1);
    int _1397 = abs(_1379);
    float _1399 = floor(_1351);
    bool _1401 = !_1349;
    int _1403 = _1401 ? 0 : 1;
    int _1405 = _1395 & 3;
    bool _1407 = _1405 != 0;
    int _1409 = _1311 * _1397;
    int _1411 = _1409 + _1383;
    int _1413 = abs(_1403);
    bool _1415 = uint(_1405) > 1u;
    int _1417 = _1395 & 3;
    bool _1419 = _1417 != 0;
    int _1421 = _1269 * _1413;
    int _1423 = _1421 + _1411;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1427 = _1425 != 0;
    float _1429 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1431 = _1419 ? 0 : 1;
    bool _1433 = _736 > 0.5;
    bool _1435 = _1433 && _1427;
    float _1437 = -_750;
    float _1439 = fma(_1429, 2.0, _1437);
    float _1441 = float(uint(_1423));
    float _1443 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1445 = ~_1431;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    int _1451 = _1449;
    if (!_1415)
    {
        int _1453 = ~_1431;
        int _1455 = _1453 + 1;
        _1451 = _1455;
    }
    int _1457 = _1451;
    float _1459 = as_type<float>(_981) * _1441;
    float _1461 = fma(_1443, -2.0, _762);
    float _1463 = 0.0;
    if (!_1427)
    {
        _1463 = _178;
    }
    float _1465 = _1463;
    int _1467 = ~_756;
    int _1469 = _1467 + 1;
    float _1471 = trunc(_1459);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = _1465;
    if (_1435)
    {
        float _1479 = -_178;
        float _1481 = _1479 + 1.0;
        _212 = _1481;
    }
    float _1483 = _212;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1489 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1461);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1493 = _1491 != 0;
    if (_1427)
    {
        _1477 = _1483;
    }
    float _1495 = _1477;
    float _1497 = _736 * 2.0;
    bool _1499 = _1399 >= 0.0;
    bool _1501 = isnan(_1399);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan(0.0);
    bool _1507 = _1503 || _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1515 = _1513 != 0;
    float _1517 = floor(_1497);
    int _1519 = _1507 ? 0 : 1;
    bool _1521 = _1399 > 0.0;
    int _1523 = _1469 * int(_1475);
    int _1525 = _1523 + _1423;
    float _1527 = 1.0 / _1487;
    float _1529 = float(uint(_1525));
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1535 = ~_1519;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1545;
    bool _1549 = uint(_1405) >= 2u;
    float _1551 = 1.0 / _1533;
    int _1553 = _1539;
    if (!_1521)
    {
        int _1555 = ~_1519;
        int _1557 = _1555 + 1;
        _1553 = _1557;
    }
    int _1559 = _1553;
    float _1561 = as_type<float>(_981) * _1529;
    bool _1563 = _1517 >= 0.0;
    bool _1565 = isnan(_1517);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan(0.0);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1585 = _1571 ? 0 : 1;
    float _1587 = 1.0 / _1511;
    bool _1589 = _1517 > 0.0;
    float _1591 = _736 + _748;
    float _1593 = float(uint(_1023));
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1603 = 1.0 / _1543;
    float _1605 = _1579 * _1551;
    float _1607 = _1597 * _864;
    float _1609 = _1601 * _1527;
    float _1611 = _1591 + (-1.0);
    int _1613 = ~_756;
    int _1615 = _1613 + 1;
    float _1617 = as_type<float>(_838) * _1593;
    float _1619 = trunc(_1561);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    float _1625 = _1547 * _1587;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (_1077)
    {
        _590 = 0;
    }
    int _1635 = _590;
    float _1637 = 1.0 / _1629;
    int _1639 = ~_1585;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    float _1645 = _1633 * _1603;
    int _1647 = _1643;
    int _1649 = _1635;
    if (!_1589)
    {
        int _1651 = ~_1585;
        int _1653 = _1651 + 1;
        _1647 = _1653;
    }
    int _1655 = _1647;
    float _1657 = _728 * 2.0;
    if (!_1077)
    {
        _1649 = 2;
    }
    int _1659 = _1649;
    bool _1661 = !_1407;
    int _1663 = _1661 ? 0 : 1;
    float _1665 = 1.0 / _1575;
    int _1667 = int(_1475) + int(_1623);
    float _1669 = _728 + _736;
    int _1671 = _1549 ? 0 : 1;
    int _1673 = _1615 * _1667;
    int _1675 = _1673 + _1423;
    float _1677 = _1669 + (-1.0);
    float _1679 = floor(_1657);
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1681;
    float _1685 = float(_1655);
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1689 = uint(_1675) >= uint(_756);
    float _1691 = _1683 * _1637;
    float _1693 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1695 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1697 = isnan(_722);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1583 * _1665;
    bool _1709 = !_1689;
    int _1711 = _1709 ? 0 : (-1);
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1715 = _722 + _1713;
    bool _1717 = _1405 != 3;
    float _1719 = _1705 * _794;
    int _1721 = as_type<int>(_1665);
    if (_1077)
    {
        _1721 = 0;
    }
    int _1723 = _1721;
    float _1725 = -_1705;
    float _1727 = _1725 + 1.0;
    int _1729 = _1723;
    if (!_1077)
    {
        _1729 = 1;
    }
    int _1731 = _1729;
    float _1733 = fma(_1625, _1715, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1735 = !_1717;
    int _1737 = _1735 ? 0 : (-1);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1741 = _722 + _1739;
    int _1743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1745 = _1743 != 0;
    int _1747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1749 = _1747 != 0;
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1753 = _1751 != 0;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1757 = _722 + _1755;
    bool _1759 = _1679 > 0.0;
    float _1761 = trunc(_1617);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    bool _1767 = _1679 >= 0.0;
    bool _1769 = isnan(_1679);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.0);
    bool _1775 = _1771 || _1773;
    float _1777 = fma(_1607, _1757, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1779 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1781 = isnan(_722);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = fma(_1645, _1741, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1793 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1795 = isnan(_722);
    bool _1797 = _1793 || _1795;
    bool _1799 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1801 = _1797 || _1799;
    float _1803 = float(_1801);
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1807 = _722 + _1805;
    bool _1809 = !_1745;
    int _1811 = _1809 ? 0 : 1;
    float _1813 = _1789 * _1727;
    float _1815 = -_1789;
    float _1817 = _1815 + 1.0;
    float _1819 = -_1803;
    float _1821 = _1819 + 1.0;
    float _1823 = fma(_1609, _1807, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1825 = _1659 != 2;
    float _1827 = _1803 * _1817;
    float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1831 = _722 + _1829;
    float _1833 = _820 * _1821;
    float _1835 = -_820;
    float _1837 = _1835 + 1.0;
    int _1839 = _836 * int(_1765);
    int _1841 = _1839 + _1023;
    float _1843 = fma(_1605, _1831, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1845 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1847 = isnan(_722);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1853 = _1849 || _1851;
    float _1855 = float(_1853);
    float _1857 = _832 * _1837;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1861 = _722 + _1859;
    bool _1863 = !_1753;
    int _1865 = _1863 ? 0 : 1;
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1869 = _1855 * _846;
    float _1871 = -_1855;
    float _1873 = _1871 + 1.0;
    float _1875 = fma(_1707, _1861, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1877 = _1775 ? 0 : 1;
    float _1879 = fma(_1691, _732, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1881 = _858 * _1873;
    float _1883 = float(uint(_1841));
    float _1885 = -_858;
    float _1887 = _1885 + 1.0;
    bool _1889 = _1731 != 1;
    float _1891 = _1733 * _1881;
    float _1893 = as_type<float>(_1731);
    if (_1825)
    {
        _1893 = _728;
    }
    float _1895 = _1893;
    float _1897 = as_type<float>(_838) * _1883;
    float _1899 = _1895;
    if (!_1825)
    {
        _1899 = _748;
    }
    float _1901 = _1899;
    float _1903 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1891);
    int _1905 = abs(_1811);
    float _1907 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1909 = abs(_1865);
    float _1911 = trunc(_1897);
    float _1913 = precise::max(_1911, 0.0);
    uint _1915 = uint(_1913);
    float _1917 = fma(_1791, _1869, _1903);
    int _1919 = ~_1877;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    float _1925 = fma(_1907, _1495, -0.5);
    int _1927 = _1923;
    if (!_1759)
    {
        int _1929 = ~_1877;
        int _1931 = _1929 + 1;
        _1927 = _1931;
    }
    int _1933 = _1927;
    float _1935 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1937 = _1405 != 3;
    float _1939 = fma(_1777, _1857, _1917);
    float _1941 = float(_1559);
    float _1943 = in.m_69.y;
    float _1945 = float(_1909);
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1949 = !_1749;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = fma(_1823, _1833, _1939);
    float _1955 = float(_1933);
    float _1957 = _1945 * _1685;
    int _1959 = int(_1765) + int(_1915);
    float _1961 = fma(_1843, _1827, _1953);
    float _1963 = in.m_48.x;
    float _1965 = in.m_48.y;
    float _1967 = in.m_48.z;
    int _1969 = ~_746;
    int _1971 = _1969 + 1;
    float _1973 = float(uint(_1311));
    int _1975 = abs(_1951);
    float _1977 = as_type<float>(_981) * _1973;
    int _1979 = ~_1667;
    int _1981 = _1979 + _1711;
    int _1983 = _1981 + 1;
    float _1985 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1987 = ~_1671;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    int _1993 = _1971 * _1959;
    int _1995 = _1993 + _1023;
    int _1997 = _1991;
    float _1999 = _1977;
    if (_1937)
    {
        int _2001 = ~_1671;
        int _2003 = _2001 + 1;
        _1997 = _2003;
    }
    int _2005 = _1997;
    float _2007 = trunc(_1977);
    float _2009 = precise::max(_2007, 0.0);
    uint _2011 = uint(_2009);
    float _2013 = float(_1905);
    int _2015 = _756 * _1983;
    int _2017 = _2015 + _1423;
    float _2019 = float(_1975);
    float _2021 = fma(_1985, _1391, -0.5);
    bool _2023 = uint(_1995) >= uint(_746);
    float _2025 = _2013 * _1941;
    int _2027 = ~_756;
    int _2029 = _2027 + 1;
    float _2031 = _2019 * _1955;
    bool _2033 = _756 == 0;
    float _2035 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2037 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2039 = _1965 + _1943;
    bool _2041 = !_2033;
    int _2043 = _2041 ? _2017 : (-1);
    float _2045 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2035);
    float _2047 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2037);
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2051 = _2039 + _2049;
    int _2053 = _2029 * int(_2011);
    int _2055 = _2053 + _1311;
    float _2057 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2045);
    float _2059 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2047);
    float _2061 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2063 = !_2023;
    int _2065 = _2063 ? 0 : (-1);
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2069 = _2059 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2071 = _2043 & 3;
    bool _2073 = _2071 != 0;
    float _2075 = _2025 * (-2.0);
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2079 = _2067 + _2077;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2083 = _2069 + _2081;
    float _2085 = float(uint(_2055));
    float _2087 = _2031 * (-2.0);
    float _2089 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2061);
    int _2091 = _1395 >> 31;
    float _2093 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2089);
    int _2095 = _2073 ? 0 : 1;
    float _2097 = as_type<float>(_981) * _2085;
    int _2099 = _2043 >> 31;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2103 = _2093 >= 0.0;
    float _2105 = fma(_1693, _2087, _1693);
    int _2107 = _2091 & 3;
    float _2109 = trunc(_2097);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = _2099 & 3;
    float _2117 = -_2101;
    float _2119 = fma(_1935, 2.0, _2117);
    int _2121 = _1395 + _2107;
    float _2123 = -_156;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2119);
    int _2127 = _2043 + _2115;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2131 = _2061;
    float _2133 = _1963;
    if (!_1889)
    {
        _2131 = _736;
    }
    float _2135 = _2131;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2139 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2129);
    float _2141 = _2135;
    if (!_1889)
    {
        _1111 = _748;
    }
    float _2143 = _1111;
    float _2145 = _2143;
    if (_2103)
    {
        out.m_51.x = 0.0;
    }
    if (_1889)
    {
        _2145 = _736;
    }
    float _2147 = _2145;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2151 = _2127 >> 2;
    float _2153 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2139);
    if (!_1889)
    {
        _1999 = _2135;
    }
    float _2155 = _1999;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2137);
    float _2159 = _2155;
    if (_1889)
    {
        _2141 = _728;
    }
    float _2161 = _2141;
    float _2163 = in.m_71.x;
    float _2165 = in.m_71.y;
    float _2167 = in.m_71.z;
    int _2169 = _2121 >> 2;
    float _2171 = fma(_2153, _1925, _2125);
    int _2173 = _2151 << 4;
    int _2175 = _2173 + 512;
    float _2177 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2149);
    int _2179 = _2169 << 4;
    int _2181 = _2179 + 368;
    float _2183 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2157);
    if (_1889)
    {
        _2159 = _728;
    }
    float _2185 = _2159;
    uint _2187 = uint(int(uint(_2175) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2177);
    int _2205 = ~_756;
    int _2207 = _2205 + 1;
    float _2209 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2211 = int(_2011) + int(_2113);
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1889)
    {
        _2215 = _748;
    }
    float _2217 = _2215;
    uint _2219 = uint(int(uint(_2181) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    float _2235 = _2217;
    if (_1889)
    {
        _2235 = _736;
    }
    float _2237 = _2235;
    int _2239 = _2207 * _2211;
    int _2241 = _2239 + _1311;
    float _2243 = -_2213;
    float _2245 = fma(_2209, 2.0, _2243);
    int _2247 = ~_1959;
    int _2249 = _2247 + _2065;
    int _2251 = _2249 + 1;
    float _2253 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2255 = uint(_2241) >= uint(_756);
    int _2257 = _2181 + 8;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[int(_2269)][_2271];
    float _2275 = fma(_1687, _2075, _1687);
    float _2277 = fma(_2075, _2163, _2163);
    bool _2279 = !_2255;
    int _2281 = _2279 ? 0 : (-1);
    float _2283 = fma(_2087, _2165, _2165);
    bool _2285 = uint(_2071) > 1u;
    int _2287 = _746 * _2251;
    int _2289 = _2287 + _1023;
    int _2291 = abs(_1457);
    int _2293 = _2175 + 8;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    uint _2297 = uint(int(uint(int(_2295)) >> uint(2)));
    int _2299 = int(_2295) & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    int _2303 = int(_2295) + 1;
    uint _2305 = uint(int(uint(_2303) >> uint(2)));
    int _2307 = _2303 & 3;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[int(_2305)][_2307];
    int _2311 = ~_2095;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = -_156;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2245);
    int _2321 = ~_2211;
    int _2323 = _2321 + _2281;
    int _2325 = _2323 + 1;
    int _2327 = abs(_1663);
    int _2329 = _756 * _2325;
    int _2331 = _2329 + _1311;
    int _2333 = ~_2291;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    int _2339 = _2315;
    if (!_2285)
    {
        int _2341 = ~_2095;
        int _2343 = _2341 + 1;
        _2339 = _2343;
    }
    int _2345 = _2339;
    bool _2347 = uint(_2071) >= 2u;
    int _2349 = abs(_2345);
    int _2351 = _2347 ? 0 : 1;
    int _2353 = _2043 & 3;
    bool _2355 = _2353 != 0;
    int _2357 = ~_2349;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    bool _2363 = !_2355;
    int _2365 = _2363 ? 0 : 1;
    bool _2367 = _2071 != 3;
    int _2369 = abs(_2365);
    int _2371 = abs(_2005);
    int _2373 = _2361 * as_type<int>(_2201);
    int _2375 = ~_2327;
    int _2377 = _2375 + 1;
    int _2379 = _2377 + 1;
    int _2381 = _2337 * as_type<int>(_2233);
    int _2383 = ~_2351;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2391 = int(_2389);
    int _2393 = ~_2371;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    int _2399 = _2379 * as_type<int>(_2225);
    int _2401 = _2399 + _2381;
    int _2403 = _2387;
    if (_2367)
    {
        int _2405 = ~_2351;
        int _2407 = _2405 + 1;
        _2403 = _2407;
    }
    int _2409 = _2403;
    int _2411 = ~_2369;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    int _2417 = _2397 * as_type<int>(_2265);
    int _2419 = _2417 + _2401;
    bool _2421 = _2071 != 3;
    float _2423 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2425 = int(_2423);
    int _2427 = abs(_2409);
    int _2429 = _2415 * as_type<int>(_2193);
    int _2431 = _2429 + _2373;
    bool _2433 = !_2421;
    int _2435 = _2433 ? 0 : (-1);
    int _2437 = abs(_1737);
    bool _2439 = !_1493;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2445 = log2(_2443);
    int _2447 = abs(_2435);
    int _2449 = abs(_2441);
    int _2451 = ~_2427;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2455 * as_type<int>(_2301);
    int _2459 = _2457 + _2431;
    int _2461 = ~_2437;
    int _2463 = _2461 + 1;
    int _2465 = _2463 + 1;
    int _2467 = ~_2447;
    int _2469 = _2467 + 1;
    int _2471 = _2469 + 1;
    float _2473 = _2445 * _156;
    float _2475 = float(uint(_2391));
    int _2477 = _2465 * as_type<int>(_2273);
    int _2479 = _2477 + _2419;
    int _2481 = _2471 * as_type<int>(_2309);
    int _2483 = _2481 + _2459;
    bool _2485 = !_1515;
    int _2487 = _2485 ? 0 : 1;
    float _2489 = 1.0 / _2475;
    int _2491 = abs(_2391);
    int _2493 = abs(_2425);
    int _2495 = ~_2449;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2425));
    float _2503 = exp2(_2473);
    int _2505 = abs(_2487);
    int _2507 = _2479 * _2499;
    bool _2509 = _746 == 0;
    float _2511 = 1.0 / _2501;
    int _2513 = ~_2505;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    bool _2519 = !_2509;
    int _2521 = _2519 ? _2289 : (-1);
    float _2523 = as_type<float>(_2465);
    float _2525 = as_type<float>(_2517);
    if (_2103)
    {
        _2523 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2527 = _2523;
    int _2529 = _2517 * _2483;
    float _2531 = float(uint(_2491));
    int _2533 = _2521 * _2449;
    int _2535 = _2533 + _2507;
    float _2537 = float(uint(_2493));
    int _2539 = as_type<int>(_2527);
    if (_2103)
    {
        float _2541 = _2527 * 5.0;
        _2539 = as_type<int>(_2541);
    }
    int _2543 = _2539;
    bool _2545 = !_2033;
    int _2547 = _2545 ? _2331 : (-1);
    float _2549 = fma(_1875, _1813, _1961);
    float _2551 = 1.0 / _2531;
    int _2553 = as_type<int>(_2489) + (-2);
    if (_2103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9143 = as_type<float>(_2543);
        out.gl_Position.z = _9143;
    }
    int _2555 = _2547 * _2505;
    int _2557 = _2555 + _2529;
    float _2559 = float(uint(_2535));
    float _2561 = fma(_1879, _1719, _2549);
    float _2563 = 1.0 / _2537;
    int _2565 = as_type<int>(_2511) + (-2);
    float _2567 = as_type<float>(_2553) * _2559;
    if (_1825)
    {
        _2525 = _736;
    }
    float _2569 = _2525;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2573 = _2569;
    if (!_1825)
    {
        _2573 = _728;
    }
    float _2575 = _2573;
    float _2577 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2561);
    float _2579 = float(uint(_2557));
    float _2581 = trunc(_2567);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    int _2587 = abs(_2557);
    float _2589 = _2575 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2591 = abs(_2535);
    float _2593 = as_type<float>(_2565) * _2579;
    float _2595 = fma(_2589, -2.0, _2571);
    int _2597 = as_type<int>(_2551) + (-2);
    out.m_73.x = _2577;
    int _2599 = as_type<int>(_2563) + (-2);
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = float(uint(_2591));
    float _2609 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2595);
    float _2611 = float(uint(_2587));
    int _2613 = ~_2391;
    int _2615 = _2613 + 1;
    float _2617 = as_type<float>(_2597) * _2607;
    int _2619 = ~_2425;
    int _2621 = _2619 + 1;
    float _2623 = as_type<float>(_2599) * _2611;
    float _2625 = _728 + (-0.5);
    float _2627 = trunc(_2617);
    float _2629 = precise::max(_2627, 0.0);
    uint _2631 = uint(_2629);
    int _2633 = _2615 * int(_2585);
    int _2635 = _2633 + _2535;
    float _2637 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2277);
    int _2639 = _2621 * int(_2605);
    int _2641 = _2639 + _2557;
    int _2643 = ~_2491;
    int _2645 = _2643 + 1;
    float _2647 = float(uint(_2635));
    float _2649 = trunc(_2623);
    float _2651 = precise::max(_2649, 0.0);
    uint _2653 = uint(_2651);
    float _2655 = float(uint(_2641));
    int _2657 = ~_2493;
    int _2659 = _2657 + 1;
    float _2661 = as_type<float>(_2553) * _2647;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2665 = as_type<float>(_2565) * _2655;
    float _2667 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2663);
    int _2669 = _2645 * int(_2631);
    int _2671 = _2669 + _2591;
    float _2673 = trunc(_2661);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    float _2679 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2667);
    bool _2681 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2683 = isnan(1.0);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2689 = _2685 || _2687;
    int _2691 = _2659 * int(_2653);
    int _2693 = _2691 + _2587;
    float _2695 = float(uint(_2671));
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2699 = 1.0 + _2697;
    float _2701 = -_2609;
    float _2703 = fma(_2679, _2021, _2701);
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2707 = float(uint(_2693));
    float _2709 = as_type<float>(_2597) * _2695;
    float _2711 = trunc(_2665);
    float _2713 = precise::max(_2711, 0.0);
    uint _2715 = uint(_2713);
    float _2717 = -_2503;
    float _2719 = _2717 + 1.0;
    float _2721 = as_type<float>(_2599) * _2707;
    float _2723 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2705);
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2729 = isnan(0.0);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2735 = _2731 || _2733;
    float _2737 = 1.0 / _2699;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2741 = fma(_2253, -2.0, _2725);
    float _2743 = _2735 ? _2719 : 0.0;
    float _2745 = -_156;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1439);
    float _2749 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2739);
    int _2751 = int(_2585) + int(_2677);
    float _2753 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2723);
    float _2755 = trunc(_2709);
    float _2757 = precise::max(_2755, 0.0);
    uint _2759 = uint(_2757);
    int _2761 = ~_2425;
    int _2763 = _2761 + 1;
    float _2765 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2749);
    float _2767 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2741);
    int _2769 = int(_2605) + int(_2715);
    int _2771 = ~_2491;
    int _2773 = _2771 + 1;
    float _2775 = trunc(_2721);
    float _2777 = precise::max(_2775, 0.0);
    uint _2779 = uint(_2777);
    if (_2689)
    {
        float _2781 = _2743 * _2737;
        _160 = _2781;
    }
    float _2783 = _160;
    int _2785 = ~_2391;
    int _2787 = _2785 + 1;
    bool _2789 = _2425 == 0;
    float _2791 = fma(_2275, _2783, _2637);
    int _2793 = _2557 ^ _2425;
    int _2795 = _2787 * _2751;
    int _2797 = _2795 + _2535;
    int _2799 = int(_2631) + int(_2759);
    int _2801 = ~_2493;
    int _2803 = _2801 + 1;
    bool _2805 = uint(_2797) >= uint(_2391);
    int _2807 = int(_2653) + int(_2779);
    int _2809 = _2773 * _2799;
    int _2811 = _2809 + _2591;
    bool _2813 = !_2805;
    int _2815 = _2813 ? 0 : (-1);
    int _2817 = _2763 * _2769;
    int _2819 = _2817 + _2557;
    float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2823 = uint(_2811) >= uint(_2491);
    bool _2825 = uint(_2819) >= uint(_2425);
    int _2827 = _2803 * _2807;
    int _2829 = _2827 + _2587;
    int _2831 = ~_2751;
    int _2833 = _2831 + _2815;
    int _2835 = _2833 + 1;
    bool _2837 = !_2825;
    int _2839 = _2837 ? 0 : (-1);
    float _2841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2843 = _2535 ^ _2391;
    int _2845 = _2391 * _2835;
    int _2847 = _2845 + _2535;
    int _2849 = ~_2769;
    int _2851 = _2849 + _2839;
    int _2853 = _2851 + 1;
    bool _2855 = uint(_2829) >= uint(_2493);
    bool _2857 = _2391 == 0;
    int _2859 = _2425 * _2853;
    int _2861 = _2859 + _2557;
    uint _2863 = uint(int(uint(_2843) >> uint(31)));
    float _2865 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2867 = _2391 == 0;
    float _2869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2871 = !_2789;
    int _2873 = _2871 ? _2861 : (-1);
    float _2875 = fma(_2865, _1171, -0.5);
    bool _2877 = !_2823;
    int _2879 = _2877 ? 0 : (-1);
    bool _2881 = !_2855;
    int _2883 = _2881 ? 0 : (-1);
    bool _2885 = _2425 == 0;
    float _2887 = _2841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2889 = !_2857;
    int _2891 = _2889 ? _2847 : (-1);
    uint _2893 = uint(int(uint(_2793) >> uint(31)));
    float _2895 = fma(_2887, _1331, -0.5);
    float _2897 = float(_2873);
    int _2899 = ~_2879;
    int _2901 = _2799 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = _2869 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2907 = ~int(_2863);
    int _2909 = _2907 + 1;
    float _2911 = fma(_2887, _2897, _2319);
    int _2913 = ~_2883;
    int _2915 = _2807 + _2913;
    int _2917 = _2915 + 1;
    float _2919 = _2051 * _2051;
    float _2921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2923 = float(_2891);
    float _2925 = fma(_1271, _2905, -0.5);
    int _2927 = ~int(_2893);
    int _2929 = _2927 + 1;
    float _2931 = fma(_2203, _2895, _2911);
    int _2933 = _2903 ^ _2909;
    float _2935 = fma(_2865, _2923, _2747);
    int _2937 = _2917 ^ _2929;
    float _2939 = _742 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2941 = ~_2909;
    int _2943 = _2941 + _2933;
    int _2945 = _2943 + 1;
    float _2947 = fma(_2079, _2079, _2919);
    int _2949 = ~_2929;
    int _2951 = _2949 + _2937;
    int _2953 = _2951 + 1;
    float _2955 = fma(_2753, _2875, _2935);
    bool _2957 = !_2867;
    int _2959 = _2957 ? _2945 : (-1);
    float _2961 = fma(_2083, _2083, _2947);
    bool _2963 = !_2885;
    int _2965 = _2963 ? _2953 : (-1);
    float _2967 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2969 = float(_2959);
    float _2971 = _2703 + 0.5;
    float _2973 = float(_2965);
    float _2975 = rsqrt(_2961);
    float _2977 = fma(_1387, _2967, -0.5);
    float _2979 = -_1489;
    float _2981 = fma(_2905, _2969, _2979);
    float _2983 = _2171 + 0.5;
    float _2985 = -_2767;
    float _2987 = fma(_2967, _2973, _2985);
    float _2989 = fma(_2765, _2925, _2981);
    float _2991 = _2955 + 0.5;
    float _2993 = fma(_2183, _2977, _2987);
    float _2995 = _2931 + 0.5;
    float _2997 = _2989 + 0.5;
    out.m_75.x = _2983;
    out.m_75.y = _2971;
    float _2999 = _2993 + 0.5;
    float _3001 = _2939 * _2975;
    out.m_77.x = _2991;
    out.m_77.y = _2997;
    out.m_77.z = _2995;
    out.m_77.w = _2999;
    float _3003 = _736 + (-0.5);
    float _3005 = _2079 * _3001;
    float _3007 = _2051 * _3001;
    float _3009 = as_type<float>(_2929);
    if (_2103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3011 = -_3007;
    float _3013 = _2039 + _3011;
    float _3015 = -_3005;
    float _3017 = _2067 + _3015;
    float _3019 = _2083 * _3001;
    float _3021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3023 = _3013 + _3021;
    float _3025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3027 = _3017 + _3025;
    float _3029 = -_3019;
    float _3031 = _2069 + _3029;
    float _3033 = -_3007;
    float _3035 = _2051 + _3033;
    float _3037 = _3023 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3039 = _728 + _748;
    float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3043 = _3031 + _3041;
    float _3045 = _748 + (-0.5);
    float _3047 = fma(_3027, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3037);
    float _3049 = _3039 + (-1.0);
    float _3051 = _1957 * (-2.0);
    float _3053 = -_3005;
    float _3055 = _2079 + _3053;
    float _3057 = fma(_3043, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3047);
    float _3059 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3061 = fma(_3051, _2167, _2167);
    float _3063 = _3035 * _3035;
    float _3065 = fma(_3003, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2283);
    bool _3067 = _3057 >= 0.0;
    float _3069 = fma(_3059, _3051, _3059);
    float _3071 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3061);
    float _3073 = fma(_3055, _3055, _3063);
    float _3075 = -_3019;
    float _3077 = _2083 + _3075;
    float _3079 = fma(_2105, _2783, _3065);
    float _3081 = fma(_3069, _2783, _3071);
    float _3083 = _2791 * 0.15915493667125701904296875;
    float _3085 = fma(_3077, _3077, _3073);
    float _3087 = _3079 * 0.15915493667125701904296875;
    float _3089 = _3081 * 0.15915493667125701904296875;
    float _3091 = _3083 * 6.283185482025146484375;
    float _3093 = sin(_3091);
    float _3095 = _3071;
    if (_3067)
    {
        _3095 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3097 = _3095;
    int _3099 = as_type<int>(_3097);
    if (_3067)
    {
        out.m_51.x = 0.0;
    }
    if (_3067)
    {
        float _3101 = _3097 * 5.0;
        _3099 = as_type<int>(_3101);
    }
    int _3103 = _3099;
    float _3105 = _3083 * 6.283185482025146484375;
    float _3107 = cos(_3105);
    if (_3067)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9996 = as_type<float>(_3103);
        out.gl_Position.z = _9996;
    }
    float _3109 = _3087 * 6.283185482025146484375;
    float _3111 = sin(_3109);
    float _3113 = _3087 * 6.283185482025146484375;
    float _3115 = cos(_3113);
    float _3117 = _3089 * 6.283185482025146484375;
    float _3119 = sin(_3117);
    float _3121 = sqrt(_3085);
    if (_3067)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3123 = in.m_79.x;
    float _3125 = in.m_79.y;
    float _3127 = in.m_79.z;
    bool _3129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _3131 = _2975 * _3121;
    bool _3133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _3135 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3137 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3139 = _3089 * 6.283185482025146484375;
    float _3141 = cos(_3139);
    float _3143 = _742 * _3131;
    float _3145 = _3131 * _3135;
    float _3147 = _3131 * _3137;
    float _3149 = _3093 * _3115;
    float _3151 = _3057;
    if (_3129)
    {
        float _3153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3151 = _3153;
    }
    float _3155 = _3151;
    float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3159 = _3157 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3161 = _3107 * _3111;
    float _3163 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3165 = _3163 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3167 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3169 = _3167 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3171 = -_3161;
    float _3173 = fma(_3119, _3149, _3171);
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _3177 = _3161;
    if (_3133)
    {
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _3175 = _3179;
    }
    float _3181 = _3175;
    float _3183 = -_3149;
    float _3185 = fma(_3119, _3161, _3183);
    float _3187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3125);
    if (_3133)
    {
        float _3189 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _3177 = _3189;
    }
    float _3191 = _3177;
    if (_3129)
    {
        float _3193 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _889 = _3193;
    }
    float _3195 = _889;
    float _3197 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3199 = _3197 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3201 = _3187 * _3145;
    float _3203 = 1.0 / _3169;
    float _3205 = _3093 * _3111;
    float _3207 = _3195;
    float _3209 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_3133)
    {
        float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _891 = _3211;
    }
    float _3213 = _891;
    float _3215 = _3213;
    if (_3129)
    {
        float _3217 = fma(_3195, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3207 = _3217;
    }
    float _3219 = _3207;
    float _3221 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3223 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _3221;
    float _3225 = 1.0 / _3165;
    if (_3129)
    {
        float _3227 = _3219 * _3155;
        _3209 = _3227;
    }
    float _3229 = _3209;
    if (_3133)
    {
        float _3231 = _3213 * _3181;
        _3215 = _3231;
    }
    float _3233 = _3215;
    float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3235;
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3243 = _3107 * _3115;
    float _3245 = 1.0 / _3199;
    float _3247 = _3241 * _3203;
    float _3249 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3255 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3253;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3261 = fma(_3119, _3243, _3205);
    float _3263 = 1.0 / _3159;
    float _3265 = _3251 * _3225;
    float _3267 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3269 = _3267 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3271 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3273 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3271;
    float _3275 = fma(_3119, _3205, _3243);
    float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3279 = _3277 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3123);
    float _3283 = _3155;
    if (_3133)
    {
        float _3285 = floor(_3233);
        _3283 = _3285;
    }
    float _3287 = _3283;
    float _3289 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3291 = _3289 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3293 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3295 = _3293 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3297 = _3281 * _3143;
    float _3299 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3301 = _3299 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3303 = _3107 * _3141;
    float _3305 = _3115 * _3141;
    float _3307 = (*spvDescriptorSet0.vp_c9)._m0[182].x;
    float _3309 = _3295;
    if (_3129)
    {
        float _3311 = floor(_3229);
        _3307 = _3311;
    }
    float _3313 = _3307;
    float _3315 = _3093 * _3141;
    float _3317 = _3111 * _3141;
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _3319;
    float _3323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3127);
    float _3325 = _3237 * _3245;
    float _3327 = _3295 * _3263;
    if (!_3133)
    {
        _3309 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3329 = _3309;
    float _3331 = 1.0 / _3259;
    float _3333 = _3329;
    if (_3133)
    {
        float _3335 = -_3287;
        float _3337 = _3233 + _3335;
        _3333 = _3337;
    }
    float _3339 = _3333;
    float _3341 = _3323 * _3147;
    if (!_3129)
    {
        _3009 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3343 = _3009;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3349 = _3303 * _3201;
    float _3351 = _3315 * _3201;
    float _3353 = 1.0 / _3279;
    float _3355 = _3343;
    if (_3129)
    {
        float _3357 = -_3313;
        float _3359 = _3229 + _3357;
        _3355 = _3359;
    }
    float _3361 = _3355;
    float _3363 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3365 = _3339 + _3363;
    float _3367 = fma(_3261, _3297, _3349);
    bool _3369 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3371 = isnan(_3339);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3377 = _3373 || _3375;
    float _3379 = float(_3377);
    float _3381 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3383 = _3361 + _3381;
    bool _3385 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3387 = isnan(_3361);
    bool _3389 = _3385 || _3387;
    bool _3391 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3393 = _3389 || _3391;
    float _3395 = float(_3393);
    float _3397 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _3399 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _3397;
    float _3401 = 1.0 / _3291;
    float _3403 = _3365 * _3331;
    float _3405 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3407 = _3361 + _3405;
    float _3409 = fma(_3247, _3383, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _3411 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3413 = isnan(_3361);
    bool _3415 = _3411 || _3413;
    bool _3417 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3419 = _3415 || _3417;
    float _3421 = float(_3419);
    float _3423 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _3425 = _3423 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3427 = fma(_3325, _3407, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3431 = _3361 + _3429;
    float _3433 = 1.0 / _3301;
    float _3435 = _3255 * _3353;
    float _3437 = fma(_3327, _3431, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3439 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3441 = _3361 + _3439;
    float _3443 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3445 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _3443;
    float _3447 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3449 = _3447 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3451 = 1.0 / _3321;
    float _3453 = _3269 * _3401;
    float _3455 = -_3201;
    float _3457 = _3119 * _3455;
    float _3459 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3461 = _3339 + _3459;
    float _3463 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3465 = _3339 + _3463;
    float _3467 = fma(_3453, _3441, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3469 = fma(_3305, _3297, _3457);
    float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3473 = _3361 + _3471;
    float _3475 = 1.0 / _3449;
    float _3477 = _3273 * _3433;
    float _3479 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3481 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _3479;
    float _3483 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3485 = _3339 + _3483;
    bool _3487 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3489 = isnan(_3361);
    bool _3491 = _3487 || _3489;
    bool _3493 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3495 = _3491 || _3493;
    float _3497 = float(_3495);
    float _3499 = fma(_3173, _3297, _3351);
    float _3501 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3503 = _3339 + _3501;
    float _3505 = fma(_3477, _3473, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3507 = 1.0 / _3347;
    float _3509 = _3461 * _3451;
    float _3511 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3513 = _3361 + _3511;
    bool _3515 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3517 = isnan(_3361);
    bool _3519 = _3515 || _3517;
    bool _3521 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3523 = _3519 || _3521;
    float _3525 = float(_3523);
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3529 = _3339 + _3527;
    bool _3531 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3533 = isnan(_3361);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3539 = _3535 || _3537;
    float _3541 = float(_3539);
    float _3543 = fma(_3435, _3513, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3545 = -_3395;
    float _3547 = _3545 + 1.0;
    float _3549 = 1.0 / _3445;
    float _3551 = _3485 * _3475;
    bool _3553 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3555 = isnan(_3361);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3561 = _3557 || _3559;
    float _3563 = float(_3561);
    float _3565 = _3497 * _3547;
    float _3567 = -_3497;
    float _3569 = _3567 + 1.0;
    bool _3571 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3573 = isnan(_3339);
    bool _3575 = _3571 || _3573;
    bool _3577 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3579 = _3575 || _3577;
    float _3581 = float(_3579);
    float _3583 = -_3541;
    float _3585 = _3583 + 1.0;
    float _3587 = fma(_3399, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _3589 = 1.0 / _3223;
    float _3591 = _3465 * _3507;
    float _3593 = -_3563;
    float _3595 = _3593 + 1.0;
    float _3597 = fma(_3185, _3341, _3367);
    float _3599 = fma(_3317, _3341, _3469);
    float _3601 = fma(_3425, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _3603 = _3395 * _3595;
    float _3605 = _3525 * _3569;
    float _3607 = 1.0 / _3481;
    float _3609 = _3503 * _3549;
    float _3611 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3613 = _3361 + _3611;
    float _3615 = -_3525;
    float _3617 = _3615 + 1.0;
    bool _3619 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3621 = isnan(_3339);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3627 = _3623 || _3625;
    float _3629 = float(_3627);
    float _3631 = fma(_3275, _3341, _3499);
    float _3633 = fma(_3265, _3613, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3635 = -_3421;
    float _3637 = _3635 + 1.0;
    float _3639 = _3529 * _3589;
    bool _3641 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3643 = isnan(_3361);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3649 = _3645 || _3647;
    float _3651 = float(_3649);
    float _3653 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3655 = _3339 + _3653;
    float _3657 = _3563 * _3637;
    float _3659 = -_3629;
    float _3661 = _3659 + 1.0;
    bool _3663 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3665 = isnan(_3361);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3671 = _3667 || _3669;
    float _3673 = float(_3671);
    float _3675 = _3651 * _3617;
    bool _3677 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3679 = isnan(_3339);
    bool _3681 = _3677 || _3679;
    bool _3683 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3685 = _3681 || _3683;
    float _3687 = float(_3685);
    float _3689 = _3655 * _3607;
    float _3691 = _3581 * _3661;
    float _3693 = _3427 * _3675;
    float _3695 = -_3581;
    float _3697 = _3695 + 1.0;
    float _3699 = -_3651;
    float _3701 = _3699 + 1.0;
    bool _3703 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3705 = isnan(_3339);
    bool _3707 = _3703 || _3705;
    bool _3709 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3711 = _3707 || _3709;
    float _3713 = float(_3711);
    float _3715 = _3421 * _3585;
    float _3717 = _3687 * _3697;
    float _3719 = -_3687;
    float _3721 = _3719 + 1.0;
    float _3723 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3693);
    float _3725 = -_3673;
    float _3727 = _3725 + 1.0;
    bool _3729 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3731 = isnan(_3339);
    bool _3733 = _3729 || _3731;
    bool _3735 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3737 = _3733 || _3735;
    float _3739 = float(_3737);
    float _3741 = -_3713;
    float _3743 = _3741 + 1.0;
    float _3745 = fma(_3409, _3605, _3723);
    float _3747 = _3541 * _3727;
    bool _3749 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3751 = isnan(_3339);
    bool _3753 = _3749 || _3751;
    bool _3755 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3757 = _3753 || _3755;
    float _3759 = float(_3757);
    float _3761 = _3713 * _3721;
    float _3763 = _3739 * _3743;
    float _3765 = -_3739;
    float _3767 = _3765 + 1.0;
    float _3769 = fma(_3633, _3565, _3745);
    bool _3771 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3773 = isnan(_3339);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3779 = _3775 || _3777;
    float _3781 = float(_3779);
    float _3783 = _3759 * _3767;
    float _3785 = -_3759;
    float _3787 = _3785 + 1.0;
    float _3789 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3789;
    float _3793 = -_3781;
    float _3795 = _3793 + 1.0;
    float _3797 = _3781 * _3787;
    float _3799 = fma(_3791, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3801 = _3379 * _3795;
    float _3803 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3805 = _3803 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3807 = -_3379;
    float _3809 = _3807 + 1.0;
    float _3811 = _3799 * _3801;
    float _3813 = fma(_3805, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3815 = _3587 * _3801;
    float _3817 = fma(_3437, _3603, _3769);
    float _3819 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3811);
    float _3821 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3821;
    float _3825 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].y, _3815);
    float _3827 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _3829 = _3827 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3831 = fma(_3813, _3797, _3819);
    float _3833 = fma(_3823, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3835 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3837 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _3835;
    float _3839 = fma(_3601, _3797, _3825);
    float _3841 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3845 = fma(_3833, _3783, _3831);
    float _3847 = fma(_3837, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _3849 = fma(_3843, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3851 = fma(_3543, _3657, _3817);
    float _3853 = fma(_3847, _3783, _3839);
    float _3855 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3855;
    float _3859 = fma(_3829, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _3861 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3863 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _3861;
    float _3865 = fma(_3849, _3763, _3845);
    float _3867 = fma(_3857, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3869 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3873 = fma(_3467, _3715, _3851);
    float _3875 = fma(_3859, _3763, _3853);
    float _3877 = fma(_3863, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _3879 = fma(_3867, _3761, _3865);
    float _3881 = fma(_3871, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3883 = fma(_3505, _3747, _3873);
    float _3885 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _3887 = _3885 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3889 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3889;
    float _3893 = fma(_3877, _3761, _3875);
    float _3895 = fma(_3881, _3717, _3879);
    float _3897 = fma(_3887, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _3899 = fma(_3891, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3901 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _3901;
    float _3905 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3907 = fma(_3673, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3883);
    float _3909 = fma(_3899, _3691, _3895);
    float _3911 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3913 = fma(_3897, _3717, _3893);
    float _3915 = fma(_3903, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _3917 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3905);
    float _3919 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3921 = _2069 + _3919;
    float _3923 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3909);
    float _3925 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _3927 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3911);
    float _3929 = fma(_3915, _3691, _3913);
    float _3931 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3917);
    float _3933 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3935 = _2067 + _3933;
    float _3937 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _3939 = -_3925;
    float _3941 = fma(_3923, _3921, _3939);
    float _3943 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3927);
    float _3945 = _3931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3947 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].y, _3929);
    float _3949 = -_3937;
    float _3951 = fma(_3923, _3935, _3949);
    float _3953 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3955 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3957 = fma(_3945, _3947, _3941);
    float _3959 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3961 = fma(_3953, _3947, _3951);
    float _3963 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3955);
    float _3965 = _3957 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3967 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3959);
    float _3969 = _3961 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3971 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3963);
    float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3975 = _3965 + _3973;
    float _3977 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3967);
    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3981 = _3969 + _3979;
    float _3983 = _3971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3985 = _3975 * _3975;
    float _3987 = _3977 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3989 = _2039 + _3983;
    float _3991 = fma(_3981, _3981, _3985);
    float _3993 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3995 = _3987 + _3993;
    float _3997 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _3999 = -_3987;
    float _4001 = _3989 + _3999;
    float _4003 = sqrt(_3991);
    float _4005 = -_3997;
    float _4007 = fma(_3923, _3995, _4005);
    float _4009 = fma(_3947, _4001, _4007);
    float _4011 = _4009 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _4013 = _4003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4017 = _4003 + _4015;
    float _4019 = _3909;
    float _4021 = _3987;
    float _4023 = _3991;
    float _4025 = _3969;
    float _4027 = _3965;
    float _4029 = _4009;
    float _4031 = _4011;
    float _4033 = _3893;
    if (_4013)
    {
        float _4035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4035;
    }
    float _4037 = _4019;
    if (_4013)
    {
        float _4039 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4021 = _4039;
    }
    float _4041 = _4021;
    float _4043 = _4041;
    if (_4013)
    {
        float _4045 = rsqrt(_3991);
        _4023 = _4045;
    }
    float _4047 = _4023;
    if (_4013)
    {
        float _4049 = _4017 * _4037;
        _2133 = _4049;
    }
    float _4051 = _2133;
    float _4053 = _4051;
    if (_4013)
    {
        float _4055 = _4051 * 0.15915493667125701904296875;
        _4053 = _4055;
    }
    float _4057 = _4053;
    float _4059 = _3599;
    if (_4013)
    {
        float _4061 = _4057 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        _4059 = _4063;
    }
    float _4065 = _4059;
    if (_4013)
    {
        float _4067 = fma(_4065, _4041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4043 = _4067;
    }
    float _4069 = _4043;
    float _4071 = _4069;
    if (_4013)
    {
        float _4073 = _4047 * _4069;
        _4071 = _4073;
    }
    float _4075 = _4071;
    if (_4013)
    {
        float _4077 = fma(_3981, _4075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _4025 = _4077;
    }
    float _4079 = _4025;
    float _4081 = _4079;
    if (_4013)
    {
        float _4083 = fma(_3975, _4075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4027 = _4083;
    }
    float _4085 = _4027;
    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _4089 = _4079 + _4087;
    float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _4093 = _4085 + _4091;
    float _4095 = fma(_4089, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _11606 = float2(_4095, _4097);
    float _4099 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_11606, float2(0.0), isnan(_11606)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_11606, float2(0.0), isnan(_11606)), level(0.0)).x;
    float _4101 = _4057;
    float _4103 = _4089;
    float _4105 = _4093;
    float _4107 = _4085;
    if (_4013)
    {
        float _4109 = _4057 * 6.283185482025146484375;
        float _4111 = cos(_4109);
        _4101 = _4111;
    }
    float _4113 = _4101;
    if (!_4013)
    {
        _4103 = _4011;
    }
    float _4115 = _4103;
    float _4117 = -_2069;
    float _4119 = _4117 + _4085;
    float _4121 = _4115;
    if (_4013)
    {
        float _4123 = _4113 + (-1.0);
        _4105 = _4123;
    }
    float _4125 = _4105;
    if (_4013)
    {
        float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4029 = _4127;
    }
    float _4129 = _4029;
    if (_4013)
    {
        float _4131 = fma(_4011, _4113, _4129);
        _4121 = _4131;
    }
    float _4133 = _4121;
    float _4135 = -_2067;
    float _4137 = _4135 + _4079;
    float _4139 = -_2039;
    float _4141 = _4139 + _4133;
    float _4143 = _4141 * _4141;
    float _4145 = fma(_4137, _4137, _4143);
    float _4147 = fma(_4119, _4119, _4145);
    float _4149 = sqrt(_4147);
    bool _4151 = _4149 > 0.0;
    float _4153 = fma(_4099, 100.0, _4133);
    float _4155 = _4149;
    float _4157 = _4141;
    if (!_4151)
    {
        _4155 = _4153;
    }
    float _4159 = _4155;
    bool _4161 = !_4151;
    float _4163 = _4159;
    if (!_4161)
    {
        float _4165 = _204 * _204;
        float _4167 = fma(_202, _202, _4165);
        float _4169 = fma(_206, _206, _4167);
        float _4171 = rsqrt(_4147);
        float _4173 = sqrt(_4169);
        float _4175 = _4137 * _4171;
        float _4177 = _4141 * _4171;
        float _4179 = _4119 * _4171;
        bool _4181 = _4173 > 0.0;
        float _4183 = _4171;
        _4031 = _4179;
        if (!_4181)
        {
            _4183 = _4153;
        }
        float _4185 = _4183;
        bool _4187 = !_4181;
        _4163 = _4185;
        if (!_4187)
        {
            float _4189 = rsqrt(_4169);
            float _4191 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4193 = _204 * _4189;
            float _4195 = _202 * _4189;
            float _4197 = _206 * _4189;
            float _4199 = _4177 * _4193;
            float _4201 = fma(_4175, _4195, _4199);
            float _4203 = _4191 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4205 = fma(_4179, _4197, _4201);
            float _4207 = _4205 * _4203;
            float _4209 = fma(_202, _4207, _4079);
            float _4211 = fma(_204, _4207, _4153);
            float _4213 = fma(_206, _4207, _4085);
            _4163 = _4211;
            _4081 = _4209;
            _4107 = _4213;
        }
    }
    float _4215 = _4163;
    float _4217 = _4081;
    float _4219 = _4107;
    float _4221 = _4031;
    float _4223 = -_3007;
    float _4225 = _4223 + _4215;
    float _4227 = -_3005;
    float _4229 = _4227 + _4217;
    float _4231 = -_3019;
    float _4233 = _4231 + _4219;
    float _4235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4237 = _4225 + _4235;
    float _4239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4241 = _4229 + _4239;
    float _4243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4245 = _4233 + _4243;
    float _4247 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4249 = _4237 * _4237;
    float _4251 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4247);
    float _4253 = fma(_4241, _4241, _4249);
    float _4255 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4251);
    float _4257 = fma(_4245, _4245, _4253);
    float _4259 = _4255 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4261 = rsqrt(_4257);
    float _4263 = sqrt(_4257);
    float _4265 = _4261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4267 = _4241 * _4265;
    float _4269 = _4245 * _4265;
    float _4271 = _4267 * _4267;
    float _4273 = _4269 * _4269;
    float _4275 = _4271 + _4273;
    float _4277 = sqrt(_4275);
    bool _4279 = _4277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4283 = _4277 + _4281;
    float _4285 = _4245;
    float _4287 = _4275;
    float _4289 = _4283;
    float _4291 = _4219;
    if (_4279)
    {
        float _4293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4285 = _4293;
    }
    float _4295 = _4285;
    if (_4279)
    {
        float _4297 = rsqrt(_4275);
        _4287 = _4297;
    }
    float _4299 = _4287;
    float _4301 = _4299;
    if (_4279)
    {
        float _4303 = _4283 * _4295;
        _4289 = _4303;
    }
    float _4305 = _4289;
    if (_4279)
    {
        float _4307 = _4305 * 0.15915493667125701904296875;
        _4291 = _4307;
    }
    float _4309 = _4291;
    float _4311 = _4295;
    float _4313 = _4309;
    if (_4279)
    {
        float _4315 = _4309 * 6.283185482025146484375;
        float _4317 = sin(_4315);
        _4311 = _4317;
    }
    float _4319 = _4311;
    float _4321 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4323 = precise::max(0.0, _4321);
    float _4325 = _4221;
    float _4327 = _4323;
    if (_4279)
    {
        float _4329 = _4309 * 6.283185482025146484375;
        float _4331 = cos(_4329);
        _4325 = _4331;
    }
    float _4333 = _4325;
    float _4335 = -_4265;
    float _4337 = -_4323;
    float _4339 = fma(_4237, _4335, _4337);
    float _4341 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4279)
    {
        float _4343 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4327 = _4343;
    }
    float _4345 = _4327;
    float _4347 = _4345;
    if (!_4279)
    {
        _4313 = _4339;
    }
    float _4349 = _4313;
    float _4351 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4353 = _4319;
    float _4355 = _4349;
    if (_4279)
    {
        float _4357 = fma(_4319, _4345, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4353 = _4357;
    }
    float _4359 = _4353;
    float _4361 = floor(_4351);
    float _4363 = _4359;
    if (_4279)
    {
        float _4365 = _4333 + (-1.0);
        _4347 = _4365;
    }
    float _4367 = _4347;
    float _4369 = _4367;
    if (_4279)
    {
        float _4371 = _4299 * _4359;
        _4157 = _4371;
    }
    float _4373 = _4157;
    if (!_4279)
    {
        _4363 = _4267;
    }
    float _4375 = _4363;
    float _4377 = _4375;
    if (_4279)
    {
        float _4379 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4341 = _4379;
    }
    float _4381 = _4341;
    float _4383 = _4381;
    if (_4279)
    {
        float _4385 = _4267 * _4373;
        _4377 = _4385;
    }
    float _4387 = _4377;
    if (!_4279)
    {
        _4301 = _4269;
    }
    float _4389 = _4301;
    float _4391 = _4389;
    if (_4279)
    {
        float _4393 = _4269 * _4373;
        _4391 = _4393;
    }
    float _4395 = _4391;
    if (!_4279)
    {
        _4369 = _4271;
    }
    float _4397 = _4369;
    float _4399 = _4397;
    if (_4279)
    {
        float _4401 = fma(_4339, _4333, _4381);
        _4355 = _4401;
    }
    float _4403 = _4355;
    if (_4279)
    {
        float _4405 = _4387 * _4387;
        _4399 = _4405;
    }
    float _4407 = _4399;
    if (!_4279)
    {
        _4383 = _4273;
    }
    float _4409 = _4383;
    float _4411 = _4409;
    if (_4279)
    {
        float _4413 = _4395 * _4395;
        _4411 = _4413;
    }
    float _4415 = _4411;
    float _4417 = fma(_4403, _4403, _4407);
    float _4419 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4421 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4423 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4425 = _4417 + _4415;
    float _4427 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4429 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4419);
    float _4431 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4421);
    float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4435 = fma(_4263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4433);
    float _4437 = precise::clamp(_4435, 0.0, 1.0);
    float _4439 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4427);
    float _4441 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4429);
    float _4443 = rsqrt(_4425);
    float _4445 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4431);
    float _4447 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4439);
    float _4449 = _4441 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4451 = -_4437;
    float _4453 = _4451 + 1.0;
    float _4455 = _4445 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4457 = _4447 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4459 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4461 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4463 = _4455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4465 = abs(_4453);
    float _4467 = log2(_4465);
    float _4469 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4459);
    float _4471 = -_4361;
    float _4473 = _4351 + _4471;
    float _4475 = -_4463;
    float _4477 = fma(_4475, _4461, 1.0);
    float _4479 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4481 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4469);
    float _4483 = _4443 * _4387;
    float _4485 = _4443 * _4403;
    float _4487 = _4443 * _4395;
    float _4489 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4481);
    float _4491 = _4483 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4493 = floor(_4423);
    float _4495 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4497 = -_4491;
    float _4499 = fma(_4485, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4497);
    float _4501 = _4467 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4503 = -_4487;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4499);
    float _4507 = log2(_4477);
    float _4509 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4495);
    float _4511 = _4485 + 1.0;
    float _4513 = fma(_4505, -0.5, 0.5);
    float _4515 = fma(_4505, 0.5, 0.5);
    float _4517 = exp2(_4501);
    float _4519 = -_4493;
    float _4521 = _4423 + _4519;
    float _4523 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4479);
    float _4525 = fma(_4515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4527 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4509);
    float _4529 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4523);
    float _4531 = fma(_4515, _4525, -0.212114393711090087890625);
    float _4533 = 1.0 / _4489;
    float _4535 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4527);
    float _4537 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4529);
    float _4539 = fma(_4515, _4531, 1.570728778839111328125);
    float _4541 = _4507 * 0.693147182464599609375;
    float _4543 = sqrt(_4513);
    float _4545 = -_4485;
    float _4547 = fma(_4517, _4511, _4545);
    float _4549 = _4541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4551 = fma(_4547, 0.5, 0.5);
    float _4553 = _4537 * _4533;
    float _4555 = _4535 * _4533;
    float _4557 = fma(_4553, 0.5, 0.5);
    float _4559 = fma(_4555, -0.5, 0.5);
    float _4561 = _4543 * 0.636619746685028076171875;
    float2 _12363 = float2(_4473, _4521);
    float _4563 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12363, float2(0.0), isnan(_12363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12363, float2(0.0), isnan(_12363)), level(0.0)).x;
    float _4565 = -_4539;
    float _4567 = fma(_4561, _4565, 1.0);
    float3 _12377 = float3(_4557, _4559, _4549);
    float _4569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12377, float3(0.0), isnan(_12377)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12377, float3(0.0), isnan(_12377)), level(0.0)).x;
    float3 _12388 = float3(_4557, _4559, _4549);
    float4 _4572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12388, float3(0.0), isnan(_12388)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12388, float3(0.0), isnan(_12388)), level(0.0)).xyzw;
    float _4574 = _4572.x;
    float _4576 = _4572.y;
    float _4578 = _4572.z;
    float _4580 = _4572.w;
    float2 _12404 = float2(_4567, _4551);
    float3 _4584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12404, float2(0.0), isnan(_12404)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12404, float2(0.0), isnan(_12404)), level(0.0)).xyz;
    float _4586 = _4584.x;
    float _4588 = _4584.y;
    float _4590 = _4584.z;
    float _4592 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4594 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4596 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _4598 = _3125 != 0.0;
    bool _4600 = isnan(_3125);
    bool _4602 = _4598 || _4600;
    bool _4604 = isnan(0.0);
    bool _4606 = _4602 || _4604;
    float _4608 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4592);
    float _4610 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4594);
    float _4612 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4596);
    bool _4614 = _3123 == 0.0;
    bool _4616 = !_4606;
    bool _4618 = _4614 && _4616;
    float _4620 = in.m_81.x;
    float _4622 = in.m_81.y;
    float _4624 = in.m_81.z;
    float _4626 = fma(_4099, 100.0, _2039);
    bool _4628 = _3127 == 0.0;
    bool _4630 = _4628 && _4618;
    out.m_65.x = _576;
    out.m_65.y = _586;
    out.m_65.z = _582;
    out.m_65.w = _584;
    out.m_67.x = _686;
    out.m_67.y = _688;
    out.m_67.z = _690;
    out.m_67.w = _692;
    float _4632 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _4634 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _4632;
    float _4636 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4608);
    float _4638 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4610);
    float _4640 = in.m_83.x;
    float _4642 = in.m_83.y;
    float _4644 = in.m_83.z;
    float _4646 = in.m_83.w;
    float _4648 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4612);
    float _4650 = fma(_4634, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _4652 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _4654 = _4652 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _4656 = -_3007;
    float _4658 = _4656 + _4626;
    float _4660 = _4467 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4662 = _4650 * _3801;
    float _4664 = fma(_4654, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _4666 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4668 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4670 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4672 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4674 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4676 = -_3119;
    float _4678 = fma(_4676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4666);
    float _4680 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4682 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4668);
    float _4684 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4670);
    float _4686 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4672);
    float _4688 = _4686;
    float _4690 = _4620;
    if (_4630)
    {
        _4033 = _4620;
    }
    float _4692 = _4033;
    float _4694 = -_3119;
    float _4696 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4674);
    float _4698 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4678);
    float _4700 = -_3119;
    float _4702 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4680);
    float _4704 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4682);
    float _4706 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4684);
    float _4708 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4686);
    float _4710 = _4692;
    float _4712 = _4702;
    if (_4630)
    {
        _4688 = _4692;
    }
    float _4714 = _4688;
    float _4716 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4696);
    float _4718 = _4714;
    if (!_4630)
    {
        _4710 = _4620;
    }
    float _4720 = _4710;
    float _4722 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4702);
    if (_4630)
    {
        _4712 = _4622;
    }
    float _4724 = _4712;
    float _4726 = _4698 * _4642;
    float _4728 = _4724;
    if (!_4630)
    {
        float _4730 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4622);
        _4728 = _4730;
    }
    float _4732 = _4728;
    float _4734 = _4716 * _4642;
    float _4736 = _4722 * _4642;
    float _4738 = _4644 * _4720;
    if (_4630)
    {
        _4690 = _4624;
    }
    float _4740 = _4690;
    float _4742 = _4740;
    if (!_4630)
    {
        float _4744 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4720);
        _4718 = _4744;
    }
    float _4746 = _4718;
    float _4748 = fma(_4638, _4640, _4726);
    float _4750 = fma(_4636, _4640, _4734);
    float _4752 = fma(_4648, _4640, _4736);
    if (!_4630)
    {
        float _4754 = fma(_3127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4624);
        _4742 = _4754;
    }
    float _4756 = _4742;
    float _4758 = -_4738;
    float _4760 = fma(_4640, _4624, _4758);
    float _4762 = _4640 * _4622;
    float _4764 = fma(_4706, _4644, _4748);
    float _4766 = fma(_4704, _4644, _4750);
    float _4768 = fma(_4708, _4644, _4752);
    float _4770 = _4642 * _4624;
    float _4772 = -_4762;
    float _4774 = fma(_4642, _4720, _4772);
    float _4776 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _4778 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _4776;
    float _4780 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].z, _4662);
    out.m_85.x = _4766;
    out.m_85.y = _4764;
    out.m_85.z = _4768;
    float _4782 = -_4770;
    float _4784 = fma(_4644, _4622, _4782);
    float _4786 = fma(_4778, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _4788 = fma(_4664, _3797, _4780);
    float _4790 = in.m_69.x;
    float _4792 = _4784 * _4646;
    float _4794 = exp2(_4660);
    float _4796 = fma(_4786, _3783, _4788);
    float _4798 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _4800 = _4798 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _4802 = fma(_4800, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _4804 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _4806 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _4804;
    float _4808 = fma(_4802, _3763, _4796);
    float _4810 = _4760 * _4646;
    float _4812 = _4774 * _4646;
    float _4814 = fma(_4806, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _4816 = _4698 * _4732;
    float _4818 = _4810 * _4716;
    float _4820 = _4722 * _4732;
    float _4822 = _4810 * _4698;
    float _4824 = _4810 * _4722;
    float _4826 = fma(_4792, _4636, _4818);
    float _4828 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _4830 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _4828;
    float _4832 = fma(_4792, _4638, _4822);
    float _4834 = fma(_4792, _4648, _4824);
    float _4836 = fma(_4812, _4704, _4826);
    float _4838 = _4658 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4840 = fma(_4812, _4706, _4832);
    float _4842 = fma(_4812, _4708, _4834);
    float _4844 = _4658 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4846 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4838);
    float _4848 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _4850 = _4848 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _4852 = fma(_4638, _4746, _4816);
    out.m_87.x = _4836;
    out.m_87.y = _4840;
    out.m_87.z = _4842;
    float _4854 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4846);
    float _4856 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4844);
    float _4858 = fma(_4830, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _4860 = fma(_4850, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _4862 = fma(_4706, _4756, _4852);
    float _4864 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4856);
    float _4866 = fma(_4858, _3761, _4808);
    float _4868 = _4716 * _4732;
    float _4870 = _4864 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4872 = _4854 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4874 = fma(_4636, _4746, _4868);
    float _4876 = fma(_4648, _4746, _4820);
    float _4878 = fma(_4860, _3717, _4866);
    float _4880 = 1.0 / _4872;
    float _4882 = _4870 + _4872;
    float _4884 = fma(_4814, _3691, _4878);
    bool _4886 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4888 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4890 = _4886 || _4888;
    bool _4892 = isnan(0.5);
    bool _4894 = _4890 || _4892;
    float _4896 = fma(_4704, _4756, _4874);
    float _4898 = fma(_4708, _4756, _4876);
    float _4900 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].z, _4884);
    out.m_89.x = _4900;
    float _4902 = _4882 * _4880;
    float _4904 = _4902 * 0.5;
    float _4906 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_4894)
    {
        _4906 = 1.0;
    }
    float _4908 = _4906;
    float _4910 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4912 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4910);
    float _4914 = _4489 * 0.5;
    float _4916 = 1.0 / _4912;
    float _4918 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4920 = _4916 * _4918;
    float _4922 = abs(_4920);
    float _4924 = log2(_4922);
    bool _4926 = _4920 <= 8000.0;
    bool _4928 = isnan(_4920);
    bool _4930 = _4926 || _4928;
    bool _4932 = isnan(8000.0);
    bool _4934 = _4930 || _4932;
    float _4936 = float(_4934);
    float _4938 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4940 = exp2(_4938);
    float _4942 = fma(_4940, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4944 = precise::clamp(_4942, 0.0, 1.0);
    float _4946 = fma(_4944, -2.0, 3.0);
    float _4948 = _4944 * _4944;
    float _4950 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4952 = _4948 * _4946;
    float _4954 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4950);
    float _4956 = _4537 + _4489;
    float _4958 = -_4952;
    float _4960 = _4958 + 1.0;
    float _4962 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4954);
    float _4964 = _4956 * 0.5;
    float _4966 = fma(_4960, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4952);
    float _4968 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4962);
    float _4970 = fma(_4535, -0.5, _4914);
    float _4972 = _4914;
    float _4974 = _4908;
    float _4976 = _4489;
    float _4978 = _4970;
    if (_4894)
    {
        _4972 = 1.0;
    }
    float _4980 = _4972;
    float _4982 = _4968 + _4489;
    float _4984 = _4982 * 0.5;
    float _4986 = _4980;
    float _4988 = _4984;
    if (!_4894)
    {
        float _4990 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4992 = _4990 * 0.15915493667125701904296875;
        float _4994 = _4992 * 6.283185482025146484375;
        float _4996 = cos(_4994);
        float _4998 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5000 = _4998 * 0.15915493667125701904296875;
        float _5002 = _4992 * 6.283185482025146484375;
        float _5004 = sin(_5002);
        float _5006 = 1.0 / _4996;
        float _5008 = _5000 * 6.283185482025146484375;
        float _5010 = cos(_5008);
        float _5012 = _5004 * _5006;
        float _5014 = _5000 * 6.283185482025146484375;
        float _5016 = sin(_5014);
        float _5018 = _5010 * _5012;
        float _5020 = 1.0 / _5018;
        float _5022 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5024 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5022;
        float _5026 = 1.0 / _5024;
        float _5028 = _5016 * _5020;
        float _5030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5032 = fma(_4920, _5028, _5030);
        float _5034 = _5032 * _5026;
        float _5036 = precise::clamp(_5034, 0.0, 1.0);
        _4986 = _5036;
    }
    float _5038 = _4986;
    if (!_4894)
    {
        float _5040 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5042 = _5040 * 0.15915493667125701904296875;
        float _5044 = _5042 * 6.283185482025146484375;
        float _5046 = cos(_5044);
        float _5048 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5050 = _5048 * 0.15915493667125701904296875;
        float _5052 = _5042 * 6.283185482025146484375;
        float _5054 = sin(_5052);
        float _5056 = 1.0 / _5046;
        float _5058 = _5050 * 6.283185482025146484375;
        float _5060 = cos(_5058);
        float _5062 = _5054 * _5056;
        float _5064 = _5050 * 6.283185482025146484375;
        float _5066 = sin(_5064);
        float _5068 = _5060 * _5062;
        float _5070 = 1.0 / _5068;
        float _5072 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5074 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _5072;
        float _5076 = 1.0 / _5074;
        float _5078 = _5066 * _5070;
        float _5080 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5082 = fma(_4920, _5078, _5080);
        float _5084 = _5082 * _5076;
        float _5086 = precise::clamp(_5084, 0.0, 1.0);
        float _5088 = -_5086;
        float _5090 = _5088 + 1.0;
        _4974 = _5090;
    }
    float _5092 = _4974;
    float _5094 = -_4794;
    float _5096 = _5094 + 1.0;
    float _5098 = _4936 * _4966;
    out.gl_Position.x = _4537;
    out.gl_Position.y = _4535;
    out.gl_Position.z = _4968;
    out.gl_Position.w = _4489;
    float _5100 = -_4563;
    float _5102 = _5100 + 1.0;
    float _5104 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5106 = _5098 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _4896;
    out.m_91.y = _4862;
    out.m_91.z = _4898;
    float _5108 = _5104 * _4569;
    float _5110 = -_5104;
    float _5112 = _5110 + 1.0;
    out.m_93.x = _4229;
    out.m_93.y = _4225;
    out.m_93.z = _4233;
    float _5114 = _5102 * _5106;
    float _5116 = precise::clamp(_5114, 0.0, 1.0);
    float _5118 = _4580 * _5108;
    float _5120 = _4590 * _5108;
    bool _5122 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5124 = isnan(_4263);
    bool _5126 = _5122 || _5124;
    bool _5128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5130 = _5126 || _5128;
    float _5132 = -_5116;
    float _5134 = fma(_5132, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5136 = fma(_4586, _5118, _4574);
    float _5138 = fma(_4588, _5118, _4576);
    float _5140 = _4580 * _5112;
    float _5142 = fma(_4580, _5120, _4578);
    float _5144 = _5134 * _4790;
    out.m_95.x = _4964;
    out.m_95.y = _4970;
    out.m_95.z = _4984;
    out.m_95.w = _4489;
    float _5146 = _5038 * _5092;
    out.m_97.x = _5136;
    out.m_97.y = _5138;
    out.m_97.z = _5142;
    out.m_97.w = _5140;
    float _5148 = _5146 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5150 = _5118;
    float _5152 = _5144;
    if (!_5130)
    {
        _5150 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5154 = _5150;
    float _5156 = _5144 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5158 = _5156;
    float _5160 = _5154;
    float _5162 = _5154;
    if (!_5130)
    {
        _5152 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5164 = _5152;
    float _5166 = _5164;
    float _5168 = _5164;
    if (!_5130)
    {
        _4976 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5170 = _4976;
    out.m_99.x = _5156;
    float _5172 = _5170;
    float _5174 = _5170;
    if (!_5130)
    {
        _4988 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5176 = _4988;
    float _5178 = _5176;
    float _5180 = _5176;
    if (!_5130)
    {
        _4978 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5182 = _4978;
    float _5184 = _5182;
    float _5186 = _5182;
    if (!_5130)
    {
        _5158 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5188 = _5158;
    bool _5190 = !_5130;
    float _5192 = _5188;
    float _5194 = _5188;
    if (!_5190)
    {
        bool _5196 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5198 = isnan(_4263);
        bool _5200 = _5196 || _5198;
        bool _5202 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5204 = _5200 || _5202;
        if (!_5204)
        {
            float _5206 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5208 = _4263 + _5206;
            float _5210 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5212 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5210;
            float _5214 = 1.0 / _5212;
            float _5216 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5218 = _5216 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5220 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5222 = _5220 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5224 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5226 = _5224 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5230 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5234 = _5232 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5236 = _5208 * _5214;
            float _5238 = precise::clamp(_5236, 0.0, 1.0);
            float _5240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5242 = _5240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5244 = fma(_5238, _5218, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5246 = fma(_5238, _5242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5248 = fma(_5238, _5222, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5250 = fma(_5238, _5226, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5252 = fma(_5238, _5230, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5254 = fma(_5238, _5234, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5162 = _5246;
            _5186 = _5252;
            _5168 = _5244;
            _5180 = _5250;
            _5174 = _5248;
            _5194 = _5254;
            _5256 = true;
        }
        else
        {
            bool _5258 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5260 = isnan(_4263);
            bool _5262 = _5258 || _5260;
            bool _5264 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5266 = _5262 || _5264;
            if (!_5266)
            {
                _5166 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5268 = _5166;
            _5168 = _5268;
            if (!_5266)
            {
                _5160 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5270 = _5160;
            _5162 = _5270;
            if (!_5266)
            {
                _5172 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5272 = _5172;
            _5174 = _5272;
            if (!_5266)
            {
                _5178 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5274 = _5178;
            _5180 = _5274;
            if (!_5266)
            {
                _5184 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5276 = _5184;
            _5186 = _5276;
            if (!_5266)
            {
                _5192 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5278 = _5192;
            bool _5280 = !_5266;
            _5194 = _5278;
            if (!_5280)
            {
                bool _5282 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5284 = isnan(_4263);
                bool _5286 = _5282 || _5284;
                bool _5288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5290 = _5286 || _5288;
                if (!_5290)
                {
                    float _5292 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5294 = _4263 + _5292;
                    float _5296 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5298 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5296;
                    float _5300 = 1.0 / _5298;
                    float _5302 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5304 = _5302 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5306 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5308 = _5306 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5310 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5312 = _5310 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5314 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5316 = _5314 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5320 = _5318 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5322 = _5294 * _5300;
                    float _5324 = precise::clamp(_5322, 0.0, 1.0);
                    float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5330 = fma(_5324, _5304, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5332 = fma(_5324, _5328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5334 = fma(_5324, _5308, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5336 = fma(_5324, _5312, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5338 = fma(_5324, _5316, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5340 = fma(_5324, _5320, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5162 = _5332;
                    _5186 = _5338;
                    _5168 = _5330;
                    _5180 = _5336;
                    _5174 = _5334;
                    _5194 = _5340;
                    _5256 = true;
                }
                else
                {
                    _5162 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5186 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5168 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5180 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5174 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5194 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5256 = false;
    float _5342 = _5162;
    float _5344 = _5186;
    float _5346 = _5168;
    float _5348 = _5180;
    float _5350 = _5174;
    float _5352 = _5194;
    float _5354 = fma(_4862, -0.5, 0.5);
    float _5356 = precise::clamp(_5354, 0.0, 1.0);
    float _5358 = -_5342;
    float _5360 = _5358 + _5344;
    float _5362 = _5148 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5364 = -_5346;
    float _5366 = _5364 + _5348;
    float _5368 = fma(_5356, _5360, _5342);
    out.m_101.x = 0.0;
    float _5370 = -_5350;
    float _5372 = _5370 + _5352;
    float _5374 = fma(_5356, _5366, _5346);
    float _5376 = _5368 * 0.586610972881317138671875;
    out.m_51.x = _5362;
    bool _5378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5380 = fma(_5356, _5372, _5350);
    float _5382 = fma(_5374, 0.298911988735198974609375, _5376);
    bool _5384 = _5038 > 0.0;
    bool _5386 = isnan(_5038);
    bool _5388 = _5384 || _5386;
    bool _5390 = isnan(0.0);
    bool _5392 = _5388 || _5390;
    float _5394 = fma(_5380, 0.114477999508380889892578125, _5382);
    bool _5396 = _5092 <= 0.0;
    bool _5398 = !_5392;
    bool _5400 = _5396 || _5398;
    float _5402 = -_5394;
    float _5404 = _5374 + _5402;
    float _5406 = -_5394;
    float _5408 = _5368 + _5406;
    float _5410 = -_5394;
    float _5412 = _5380 + _5410;
    float _5414 = fma(_5404, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    float _5416 = fma(_5408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    float _5418 = fma(_5412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    bool _5420 = !_5378;
    if (!_5420)
    {
        float _5422 = -_4225;
        float _5424 = _5422 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5426 = -_4229;
        float _5428 = _5426 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5430 = -_4233;
        float _5432 = _5430 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5434 = _5424 * _5424;
        float _5436 = fma(_5428, _5428, _5434);
        float _5438 = fma(_5432, _5432, _5436);
        float _5440 = sqrt(_5438);
        float _5442 = rsqrt(_5438);
        float _5444 = -_5440;
        float _5446 = _5444 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5448 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5450 = precise::clamp(_5448, 0.0, 1.0);
        float _5452 = _5428 * _5442;
        float _5454 = _5424 * _5442;
        float _5456 = abs(_5450);
        float _5458 = log2(_5456);
        float _5460 = _5432 * _5442;
        float _5462 = _5452 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5464 = _4862 * _5454;
        float _5466 = -_5454;
        float _5468 = -_5462;
        float _5470 = fma(_5466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5468);
        float _5472 = fma(_4896, _5452, _5464);
        float _5474 = -_5460;
        float _5476 = fma(_5474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5470);
        float _5478 = fma(_4898, _5460, _5472);
        float _5480 = precise::clamp(_5478, 0.0, 1.0);
        float _5482 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5484 = _5476 + _5482;
        float _5486 = _5458 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5488 = _5484 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5490 = precise::clamp(_5488, 0.0, 1.0);
        float _5492 = exp2(_5486);
        float _5494 = _5492 * _5490;
        float _5496 = _5480 * _5494;
        float _5498 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5500 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5502 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _5498;
        out.m_101.y = _5500;
        out.m_101.z = _5502;
    }
    out.m_103.x = _5414;
    out.m_103.y = _5416;
    out.m_103.z = _5418;
    if (!_5400)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _5504 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5504;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5256 = false;
    bool _714 = false;
    bool _610 = false;
    bool _454 = false;
    bool _232 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_51.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5561 = as_type<float>(_138);
        out.gl_Position.z = _5561;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_53.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5630 = as_type<float>(_176);
        out.gl_Position.z = _5630;
    }
    if (_170)
    {
        return out;
    }
    float _178 = in.m_55.x;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_55.y;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    out.m_59.x = _178;
    out.m_59.y = _182;
    float _190 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _190);
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _194);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _200);
    bool _208 = !_180;
    float _210 = _182;
    float _212 = _178;
    float _230;
    if (!_208)
    {
        float _214 = in.m_61.x;
        float _216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _222 = _220 * _216;
        float _224 = floor(_222);
        float _226 = -_224;
        float _228 = _222 + _226;
        _230 = _228;
        _232 = true;
    }
    else
    {
        float _234 = float(_122);
        float _236 = 1.0 / _234;
        float _238 = _156 * _236;
        _230 = _238;
    }
    _232 = false;
    float _240 = _230;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _240 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _240 + _246;
    bool _250 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _252 = isnan(_240);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _240 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = 1.0 / _264;
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _282 = 1.0 / _276;
    float _284 = 1.0 / _272;
    float _286 = _244 * _278;
    bool _288 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_240);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -_260;
    float _302 = _300 + 1.0;
    float _304 = _298 * _302;
    float _306 = _248 * _282;
    bool _308 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_240);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_240);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -_298;
    float _342 = _340 + 1.0;
    float _344 = -_318;
    float _346 = _344 + 1.0;
    float _348 = _268 * _284;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = _334 * _346;
    float _360 = fma(_322, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_356, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = _318 * _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = _360 * _358;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = fma(_338, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _406;
    float _410 = fma(_396, _366, _386);
    float _412 = fma(_394, _286, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_404, _286, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_408, _286, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = fma(_398, _366, _388);
    float _420 = fma(_400, _366, _390);
    float _422 = fma(_412, _304, _410);
    float _424 = fma(_414, _304, _418);
    float _426 = fma(_416, _304, _420);
    float _428 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].x, _422);
    float _430 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].y, _424);
    float _432 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].z, _426);
    bool _434 = !_280;
    float _452;
    if (!_434)
    {
        float _436 = in.m_61.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_122);
        float _458 = 1.0 / _456;
        float _460 = _156 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _462 + _464;
    float _468 = in.m_63.x;
    float _470 = in.m_63.y;
    float _472 = in.m_63.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = isnan(_462);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _494 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    bool _510 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_462);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _476;
    float _524 = -_488;
    float _526 = _524 + 1.0;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _530 = _504 * _526;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = 1.0 / _492;
    float _538 = _508 * _522;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = _432 * _472;
    float _546 = _430 * _470;
    float _548 = fma(_538, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _550 = _428 * _468;
    float _552 = _542 * _536;
    float _554 = _548 * _530;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _462 + _560;
    float _564 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _566 = _488 * _558;
    float _568 = fma(_552, _562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _572 = fma(_568, _566, _564);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[117].x, _572);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _576;
    out.m_65.y = _586;
    out.m_65.z = _582;
    out.m_65.w = _584;
    bool _588 = !_528;
    int _590 = as_type<int>(_470);
    float _608;
    if (!_588)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_122);
        float _614 = 1.0 / _612;
        float _616 = _156 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _672 = _650 * _662;
    float _674 = fma(_672, _654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _678 = _674 * _664;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _678);
    float _684 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _682);
    float _686 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _686;
    out.m_67.y = _688;
    out.m_67.z = _690;
    out.m_67.w = _692;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_61.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[14].x, _156);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _156 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _726 = int(_724);
    float _728 = in.m_61.x;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _732 = _722 + _730;
    float _734 = float(_122);
    float _736 = in.m_61.y;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _746 = int(_744);
    float _748 = in.m_61.z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = float(_726);
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _756 = int(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _764 = float(uint(_746));
    float _766 = 1.0 / _752;
    int _768 = ~_746;
    int _770 = _768 + 1;
    bool _772 = _746 == 0;
    bool _774 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _776 = isnan(_722);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _764;
    int _788 = ~_746;
    int _790 = _788 + 1;
    float _792 = -_784;
    float _794 = _792 + 1.0;
    float _796 = float(uint(_756));
    int _798 = ~_756;
    int _800 = _798 + 1;
    int _802 = ~_756;
    int _804 = _802 + 1;
    float _806 = _766 * _156;
    float _808 = 1.0 / _796;
    bool _810 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _812 = isnan(_722);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    bool _822 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _824 = isnan(_722);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    int _834 = ~_746;
    int _836 = _834 + 1;
    int _838 = as_type<int>(_786) + (-2);
    float _840 = trunc(_806);
    int _842 = int(_840);
    float _844 = -_832;
    float _846 = _844 + 1.0;
    bool _848 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _850 = isnan(_722);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = 1.0 / _734;
    float _862 = float(uint(_842));
    float _864 = 1.0 / _760;
    float _866 = as_type<float>(_838) * _862;
    float _868 = trunc(_866);
    float _870 = precise::max(_868, 0.0);
    uint _873 = uint(_870);
    int _875 = _790 * int(_873);
    int _877 = _875 + _842;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _881 = int(_879);
    float _883 = float(uint(_877));
    float _885 = as_type<float>(_877);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _889 = _728;
    float _891 = _742;
    if (_740)
    {
        _885 = 1.0;
    }
    float _893 = _885;
    float _895 = _893;
    if (!_740)
    {
        _895 = 7.345489978790283203125;
    }
    float _897 = _895;
    float _899 = as_type<float>(_838) * _883;
    float _901 = trunc(_899);
    float _903 = precise::max(_901, 0.0);
    uint _905 = uint(_903);
    float _907 = _897 * _728;
    float _909 = float(_881);
    float _911 = 1.0 / _909;
    float _913 = float(_842);
    float _915 = floor(_907);
    int _917 = int(_873) + int(_905);
    float _919 = float(_746);
    int _921 = _770 * _917;
    int _923 = _921 + _842;
    bool _925 = _913 >= _919;
    bool _927 = isnan(_913);
    bool _929 = _925 || _927;
    bool _931 = isnan(_919);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = _911 * _156;
    bool _939 = uint(_923) >= uint(_746);
    float _941 = trunc(_935);
    int _943 = int(_941);
    bool _945 = !_939;
    int _947 = _945 ? 0 : (-1);
    float _949 = -_915;
    float _951 = _907 + _949;
    int _953 = ~_917;
    int _955 = _953 + _947;
    int _957 = _955 + 1;
    float _959 = trunc(_937);
    int _961 = int(_959);
    float _963 = _951 * _919;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _967 = _965 != 0;
    float _969 = _919 * _156;
    bool _971 = !_967;
    int _973 = _971 ? 0 : 1;
    float _975 = _969 * _860;
    float _977 = trunc(_963);
    int _979 = int(_977);
    int _981 = as_type<int>(_808) + (-2);
    int _983 = abs(_973);
    int _985 = _746 * _957;
    int _987 = _985 + _842;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _991 = _989 != 0;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _999 = _997 != 0;
    float _1001 = trunc(_975);
    int _1003 = int(_1001);
    float _1005 = float(uint(_961));
    int _1007 = ~_943;
    int _1009 = _1007 + 1;
    int _1011 = _1009 + 1;
    bool _1013 = !_772;
    int _1015 = _1013 ? _987 : (-1);
    float _1017 = as_type<float>(_981) * _1005;
    int _1019 = _746 + (-1);
    int _1021 = _979 * _983;
    int _1023 = _1021 + _842;
    bool _1025 = !_995;
    int _1027 = _1025 ? 0 : 1;
    int _1029 = _1015 * _1011;
    bool _1031 = !_991;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = trunc(_1017);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    int _1041 = abs(_1027);
    int _1043 = _943 * _1019;
    int _1045 = _1043 + _1029;
    bool _1047 = !_999;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1053 = _1051 != 0;
    int _1055 = abs(_1033);
    int _1057 = abs(_1049);
    int _1059 = _1045 * _1041;
    bool _1061 = !_1053;
    int _1063 = _1061 ? 0 : 1;
    int _1065 = _1003 * _1055;
    int _1067 = _1065 + _1059;
    int _1069 = abs(_1063);
    int _1071 = _800 * int(_1039);
    int _1073 = _1071 + _961;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1077 = _1075 != 0;
    int _1079 = _1023 * _1057;
    int _1081 = _1079 + _1067;
    float _1083 = in.m_61.w;
    float _1085 = float(uint(_1073));
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    int _1091 = _979 * _1069;
    int _1093 = _1091 + _1081;
    bool _1095 = _756 == 0;
    float _1097 = as_type<float>(_981) * _1085;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1101 = _1099 != 0;
    float _1103 = float(uint(_1093));
    float _1105 = as_type<float>(_1073);
    int _1107 = as_type<int>(_1103);
    bool _1109 = _1053;
    float _1111 = as_type<float>(_981);
    if (_1077)
    {
        _1105 = _728;
    }
    float _1113 = _1105;
    float _1115 = trunc(_1097);
    float _1117 = precise::max(_1115, 0.0);
    uint _1119 = uint(_1117);
    float _1121 = _1113;
    if (_1077)
    {
        _887 = 1.0;
    }
    float _1123 = _887;
    float _1125 = as_type<float>(_838) * _1103;
    float _1127 = _1123;
    if (!_1077)
    {
        _1121 = _736;
    }
    float _1129 = _1121;
    if (_1089)
    {
        float _1131 = -_178;
        float _1133 = _1131 + 1.0;
        _1107 = as_type<int>(_1133);
    }
    int _1135 = _1107;
    if (!_1077)
    {
        _1127 = 1.2345600128173828125;
    }
    float _1137 = _1127;
    if (_1089)
    {
        bool _1139 = _728 > 0.5;
        _1109 = _1139;
    }
    bool _1141 = _1109;
    float _1143 = trunc(_1125);
    float _1145 = precise::max(_1143, 0.0);
    uint _1147 = uint(_1145);
    float _1149 = 0.0;
    if (!_1089)
    {
        _1149 = _178;
    }
    float _1151 = _1149;
    float _1153 = _1129 * _1137;
    int _1155 = ~_746;
    int _1157 = _1155 + 1;
    int _1159 = 0;
    float _1161 = _1151;
    if (_1101)
    {
        float _1163 = -_178;
        float _1165 = _1163 + 1.0;
        _1159 = as_type<int>(_1165);
    }
    int _1167 = _1159;
    if (_1089)
    {
        float _1169 = _1141 ? as_type<float>(_1135) : _178;
        _1161 = _1169;
    }
    float _1171 = _1161;
    bool _1173 = _1083 > 0.5;
    float _1175 = floor(_1153);
    int _1177 = int(_1039) + int(_1119);
    float _1179 = float(_756);
    int _1181 = _804 * _1177;
    int _1183 = _1181 + _961;
    float _1185 = float(_961);
    int _1187 = _1157 * int(_1147);
    int _1189 = _1187 + _1093;
    bool _1191 = _736 > 0.5;
    float _1193 = _1179 * _156;
    bool _1195 = _1185 >= _1179;
    bool _1197 = isnan(_1185);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(_1179);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = float(uint(_1189));
    float _1209 = _1193 * _860;
    bool _1211 = uint(_1183) >= uint(_756);
    float _1213 = -_1175;
    float _1215 = _1153 + _1213;
    float _1217 = trunc(_1205);
    int _1219 = int(_1217);
    float _1221 = as_type<float>(_838) * _1207;
    bool _1223 = !_1211;
    int _1225 = _1223 ? 0 : (-1);
    float _1227 = -_182;
    float _1229 = _1227 + 1.0;
    float _1231 = _1179 * _1215;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1235 = _1233 != 0;
    int _1237 = ~_1177;
    int _1239 = _1237 + _1225;
    int _1241 = _1239 + 1;
    float _1243 = trunc(_1221);
    float _1245 = precise::max(_1243, 0.0);
    uint _1247 = uint(_1245);
    int _1249 = _1191 ? as_type<int>(_1229) : as_type<int>(_182);
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    int _1255 = _756 * _1241;
    int _1257 = _1255 + _961;
    int _1259 = ~_746;
    int _1261 = _1259 + 1;
    bool _1263 = !_1235;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = trunc(_1231);
    int _1269 = int(_1267);
    float _1271 = _1253 ? as_type<float>(_1249) : _182;
    bool _1273 = !_1095;
    int _1275 = _1273 ? _1257 : (-1);
    bool _1277 = _748 > 0.5;
    int _1279 = int(_1147) + int(_1247);
    int _1281 = abs(_1265);
    int _1283 = ~_1219;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    int _1289 = _1261 * _1279;
    int _1291 = _1289 + _1093;
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1299 = _1297 != 0;
    int _1301 = _1287 * _1275;
    int _1303 = _756 + (-1);
    bool _1305 = !_1299;
    int _1307 = _1305 ? 0 : 1;
    int _1309 = _1269 * _1281;
    int _1311 = _1309 + _961;
    bool _1313 = uint(_1291) >= uint(_746);
    int _1315 = _1219 * _1303;
    int _1317 = _1315 + _1301;
    float _1319 = 0.0;
    if (!_1101)
    {
        _1319 = _178;
    }
    float _1321 = _1319;
    float _1323 = trunc(_1209);
    int _1325 = int(_1323);
    float _1327 = _1321;
    if (_1101)
    {
        float _1329 = _1277 ? as_type<float>(_1167) : _178;
        _1327 = _1329;
    }
    float _1331 = _1327;
    bool _1333 = !_1313;
    int _1335 = _1333 ? 0 : (-1);
    int _1337 = abs(_1307);
    bool _1339 = !_1295;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1345 = _1343 != 0;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1349 = _1347 != 0;
    float _1351 = _748 * 2.0;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1355 = _1353 != 0;
    int _1357 = ~_1279;
    int _1359 = _1357 + _1335;
    int _1361 = _1359 + 1;
    int _1363 = abs(_1341);
    int _1365 = _746 * _1361;
    int _1367 = _1365 + _1093;
    int _1369 = _1173 ? as_type<int>(_1229) : as_type<int>(_182);
    int _1371 = _1317 * _1337;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1375 = _1373 != 0;
    bool _1377 = !_1345;
    int _1379 = _1377 ? 0 : 1;
    int _1381 = _1325 * _1363;
    int _1383 = _1381 + _1371;
    bool _1385 = _746 == 0;
    float _1387 = _1375 ? as_type<float>(_1369) : _182;
    if (_1355)
    {
        float _1389 = _1277 ? _1229 : _182;
        _210 = _1389;
    }
    float _1391 = _210;
    bool _1393 = !_1385;
    int _1395 = _1393 ? _1367 : (-1);
    int _1397 = abs(_1379);
    float _1399 = floor(_1351);
    bool _1401 = !_1349;
    int _1403 = _1401 ? 0 : 1;
    int _1405 = _1395 & 3;
    bool _1407 = _1405 != 0;
    int _1409 = _1311 * _1397;
    int _1411 = _1409 + _1383;
    int _1413 = abs(_1403);
    bool _1415 = uint(_1405) > 1u;
    int _1417 = _1395 & 3;
    bool _1419 = _1417 != 0;
    int _1421 = _1269 * _1413;
    int _1423 = _1421 + _1411;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1427 = _1425 != 0;
    float _1429 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1431 = _1419 ? 0 : 1;
    bool _1433 = _736 > 0.5;
    bool _1435 = _1433 && _1427;
    float _1437 = -_750;
    float _1439 = fma(_1429, 2.0, _1437);
    float _1441 = float(uint(_1423));
    float _1443 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1445 = ~_1431;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    int _1451 = _1449;
    if (!_1415)
    {
        int _1453 = ~_1431;
        int _1455 = _1453 + 1;
        _1451 = _1455;
    }
    int _1457 = _1451;
    float _1459 = as_type<float>(_981) * _1441;
    float _1461 = fma(_1443, -2.0, _762);
    float _1463 = 0.0;
    if (!_1427)
    {
        _1463 = _178;
    }
    float _1465 = _1463;
    int _1467 = ~_756;
    int _1469 = _1467 + 1;
    float _1471 = trunc(_1459);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = _1465;
    if (_1435)
    {
        float _1479 = -_178;
        float _1481 = _1479 + 1.0;
        _212 = _1481;
    }
    float _1483 = _212;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1489 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1461);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1493 = _1491 != 0;
    if (_1427)
    {
        _1477 = _1483;
    }
    float _1495 = _1477;
    float _1497 = _736 * 2.0;
    bool _1499 = _1399 >= 0.0;
    bool _1501 = isnan(_1399);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan(0.0);
    bool _1507 = _1503 || _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1515 = _1513 != 0;
    float _1517 = floor(_1497);
    int _1519 = _1507 ? 0 : 1;
    bool _1521 = _1399 > 0.0;
    int _1523 = _1469 * int(_1475);
    int _1525 = _1523 + _1423;
    float _1527 = 1.0 / _1487;
    float _1529 = float(uint(_1525));
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1535 = ~_1519;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1545;
    bool _1549 = uint(_1405) >= 2u;
    float _1551 = 1.0 / _1533;
    int _1553 = _1539;
    if (!_1521)
    {
        int _1555 = ~_1519;
        int _1557 = _1555 + 1;
        _1553 = _1557;
    }
    int _1559 = _1553;
    float _1561 = as_type<float>(_981) * _1529;
    bool _1563 = _1517 >= 0.0;
    bool _1565 = isnan(_1517);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan(0.0);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1585 = _1571 ? 0 : 1;
    float _1587 = 1.0 / _1511;
    bool _1589 = _1517 > 0.0;
    float _1591 = _736 + _748;
    float _1593 = float(uint(_1023));
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1603 = 1.0 / _1543;
    float _1605 = _1579 * _1551;
    float _1607 = _1597 * _864;
    float _1609 = _1601 * _1527;
    float _1611 = _1591 + (-1.0);
    int _1613 = ~_756;
    int _1615 = _1613 + 1;
    float _1617 = as_type<float>(_838) * _1593;
    float _1619 = trunc(_1561);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    float _1625 = _1547 * _1587;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (_1077)
    {
        _590 = 0;
    }
    int _1635 = _590;
    float _1637 = 1.0 / _1629;
    int _1639 = ~_1585;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    float _1645 = _1633 * _1603;
    int _1647 = _1643;
    int _1649 = _1635;
    if (!_1589)
    {
        int _1651 = ~_1585;
        int _1653 = _1651 + 1;
        _1647 = _1653;
    }
    int _1655 = _1647;
    float _1657 = _728 * 2.0;
    if (!_1077)
    {
        _1649 = 2;
    }
    int _1659 = _1649;
    bool _1661 = !_1407;
    int _1663 = _1661 ? 0 : 1;
    float _1665 = 1.0 / _1575;
    int _1667 = int(_1475) + int(_1623);
    float _1669 = _728 + _736;
    int _1671 = _1549 ? 0 : 1;
    int _1673 = _1615 * _1667;
    int _1675 = _1673 + _1423;
    float _1677 = _1669 + (-1.0);
    float _1679 = floor(_1657);
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1681;
    float _1685 = float(_1655);
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1689 = uint(_1675) >= uint(_756);
    float _1691 = _1683 * _1637;
    float _1693 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1695 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1697 = isnan(_722);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1583 * _1665;
    bool _1709 = !_1689;
    int _1711 = _1709 ? 0 : (-1);
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1715 = _722 + _1713;
    bool _1717 = _1405 != 3;
    float _1719 = _1705 * _794;
    int _1721 = as_type<int>(_1665);
    if (_1077)
    {
        _1721 = 0;
    }
    int _1723 = _1721;
    float _1725 = -_1705;
    float _1727 = _1725 + 1.0;
    int _1729 = _1723;
    if (!_1077)
    {
        _1729 = 1;
    }
    int _1731 = _1729;
    float _1733 = fma(_1625, _1715, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1735 = !_1717;
    int _1737 = _1735 ? 0 : (-1);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1741 = _722 + _1739;
    int _1743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1745 = _1743 != 0;
    int _1747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1749 = _1747 != 0;
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1753 = _1751 != 0;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1757 = _722 + _1755;
    bool _1759 = _1679 > 0.0;
    float _1761 = trunc(_1617);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    bool _1767 = _1679 >= 0.0;
    bool _1769 = isnan(_1679);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.0);
    bool _1775 = _1771 || _1773;
    float _1777 = fma(_1607, _1757, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1779 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1781 = isnan(_722);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = fma(_1645, _1741, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1793 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1795 = isnan(_722);
    bool _1797 = _1793 || _1795;
    bool _1799 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1801 = _1797 || _1799;
    float _1803 = float(_1801);
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1807 = _722 + _1805;
    bool _1809 = !_1745;
    int _1811 = _1809 ? 0 : 1;
    float _1813 = _1789 * _1727;
    float _1815 = -_1789;
    float _1817 = _1815 + 1.0;
    float _1819 = -_1803;
    float _1821 = _1819 + 1.0;
    float _1823 = fma(_1609, _1807, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1825 = _1659 != 2;
    float _1827 = _1803 * _1817;
    float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1831 = _722 + _1829;
    float _1833 = _820 * _1821;
    float _1835 = -_820;
    float _1837 = _1835 + 1.0;
    int _1839 = _836 * int(_1765);
    int _1841 = _1839 + _1023;
    float _1843 = fma(_1605, _1831, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1845 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1847 = isnan(_722);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1853 = _1849 || _1851;
    float _1855 = float(_1853);
    float _1857 = _832 * _1837;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1861 = _722 + _1859;
    bool _1863 = !_1753;
    int _1865 = _1863 ? 0 : 1;
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1869 = _1855 * _846;
    float _1871 = -_1855;
    float _1873 = _1871 + 1.0;
    float _1875 = fma(_1707, _1861, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1877 = _1775 ? 0 : 1;
    float _1879 = fma(_1691, _732, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1881 = _858 * _1873;
    float _1883 = float(uint(_1841));
    float _1885 = -_858;
    float _1887 = _1885 + 1.0;
    bool _1889 = _1731 != 1;
    float _1891 = _1733 * _1881;
    float _1893 = as_type<float>(_1731);
    if (_1825)
    {
        _1893 = _728;
    }
    float _1895 = _1893;
    float _1897 = as_type<float>(_838) * _1883;
    float _1899 = _1895;
    if (!_1825)
    {
        _1899 = _748;
    }
    float _1901 = _1899;
    float _1903 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1891);
    int _1905 = abs(_1811);
    float _1907 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1909 = abs(_1865);
    float _1911 = trunc(_1897);
    float _1913 = precise::max(_1911, 0.0);
    uint _1915 = uint(_1913);
    float _1917 = fma(_1791, _1869, _1903);
    int _1919 = ~_1877;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    float _1925 = fma(_1907, _1495, -0.5);
    int _1927 = _1923;
    if (!_1759)
    {
        int _1929 = ~_1877;
        int _1931 = _1929 + 1;
        _1927 = _1931;
    }
    int _1933 = _1927;
    float _1935 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1937 = _1405 != 3;
    float _1939 = fma(_1777, _1857, _1917);
    float _1941 = float(_1559);
    float _1943 = in.m_69.y;
    float _1945 = float(_1909);
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1949 = !_1749;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = fma(_1823, _1833, _1939);
    float _1955 = float(_1933);
    float _1957 = _1945 * _1685;
    int _1959 = int(_1765) + int(_1915);
    float _1961 = fma(_1843, _1827, _1953);
    float _1963 = in.m_48.x;
    float _1965 = in.m_48.y;
    float _1967 = in.m_48.z;
    int _1969 = ~_746;
    int _1971 = _1969 + 1;
    float _1973 = float(uint(_1311));
    int _1975 = abs(_1951);
    float _1977 = as_type<float>(_981) * _1973;
    int _1979 = ~_1667;
    int _1981 = _1979 + _1711;
    int _1983 = _1981 + 1;
    float _1985 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1987 = ~_1671;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    int _1993 = _1971 * _1959;
    int _1995 = _1993 + _1023;
    int _1997 = _1991;
    float _1999 = _1977;
    if (_1937)
    {
        int _2001 = ~_1671;
        int _2003 = _2001 + 1;
        _1997 = _2003;
    }
    int _2005 = _1997;
    float _2007 = trunc(_1977);
    float _2009 = precise::max(_2007, 0.0);
    uint _2011 = uint(_2009);
    float _2013 = float(_1905);
    int _2015 = _756 * _1983;
    int _2017 = _2015 + _1423;
    float _2019 = float(_1975);
    float _2021 = fma(_1985, _1391, -0.5);
    bool _2023 = uint(_1995) >= uint(_746);
    float _2025 = _2013 * _1941;
    int _2027 = ~_756;
    int _2029 = _2027 + 1;
    float _2031 = _2019 * _1955;
    bool _2033 = _756 == 0;
    float _2035 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2037 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2039 = _1965 + _1943;
    bool _2041 = !_2033;
    int _2043 = _2041 ? _2017 : (-1);
    float _2045 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2035);
    float _2047 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2037);
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2051 = _2039 + _2049;
    int _2053 = _2029 * int(_2011);
    int _2055 = _2053 + _1311;
    float _2057 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2045);
    float _2059 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2047);
    float _2061 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2063 = !_2023;
    int _2065 = _2063 ? 0 : (-1);
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2069 = _2059 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2071 = _2043 & 3;
    bool _2073 = _2071 != 0;
    float _2075 = _2025 * (-2.0);
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2079 = _2067 + _2077;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2083 = _2069 + _2081;
    float _2085 = float(uint(_2055));
    float _2087 = _2031 * (-2.0);
    float _2089 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2061);
    int _2091 = _1395 >> 31;
    float _2093 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2089);
    int _2095 = _2073 ? 0 : 1;
    float _2097 = as_type<float>(_981) * _2085;
    int _2099 = _2043 >> 31;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2103 = _2093 >= 0.0;
    float _2105 = fma(_1693, _2087, _1693);
    int _2107 = _2091 & 3;
    float _2109 = trunc(_2097);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = _2099 & 3;
    float _2117 = -_2101;
    float _2119 = fma(_1935, 2.0, _2117);
    int _2121 = _1395 + _2107;
    float _2123 = -_156;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2119);
    int _2127 = _2043 + _2115;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2131 = _2061;
    float _2133 = _1963;
    if (!_1889)
    {
        _2131 = _736;
    }
    float _2135 = _2131;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2139 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2129);
    float _2141 = _2135;
    if (!_1889)
    {
        _1111 = _748;
    }
    float _2143 = _1111;
    float _2145 = _2143;
    if (_2103)
    {
        out.m_51.x = 0.0;
    }
    if (_1889)
    {
        _2145 = _736;
    }
    float _2147 = _2145;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2151 = _2127 >> 2;
    float _2153 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2139);
    if (!_1889)
    {
        _1999 = _2135;
    }
    float _2155 = _1999;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2137);
    float _2159 = _2155;
    if (_1889)
    {
        _2141 = _728;
    }
    float _2161 = _2141;
    float _2163 = in.m_71.x;
    float _2165 = in.m_71.y;
    float _2167 = in.m_71.z;
    int _2169 = _2121 >> 2;
    float _2171 = fma(_2153, _1925, _2125);
    int _2173 = _2151 << 4;
    int _2175 = _2173 + 512;
    float _2177 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2149);
    int _2179 = _2169 << 4;
    int _2181 = _2179 + 368;
    float _2183 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2157);
    if (_1889)
    {
        _2159 = _728;
    }
    float _2185 = _2159;
    uint _2187 = uint(int(uint(_2175) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2177);
    int _2205 = ~_756;
    int _2207 = _2205 + 1;
    float _2209 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2211 = int(_2011) + int(_2113);
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1889)
    {
        _2215 = _748;
    }
    float _2217 = _2215;
    uint _2219 = uint(int(uint(_2181) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    float _2235 = _2217;
    if (_1889)
    {
        _2235 = _736;
    }
    float _2237 = _2235;
    int _2239 = _2207 * _2211;
    int _2241 = _2239 + _1311;
    float _2243 = -_2213;
    float _2245 = fma(_2209, 2.0, _2243);
    int _2247 = ~_1959;
    int _2249 = _2247 + _2065;
    int _2251 = _2249 + 1;
    float _2253 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2255 = uint(_2241) >= uint(_756);
    int _2257 = _2181 + 8;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[int(_2269)][_2271];
    float _2275 = fma(_1687, _2075, _1687);
    float _2277 = fma(_2075, _2163, _2163);
    bool _2279 = !_2255;
    int _2281 = _2279 ? 0 : (-1);
    float _2283 = fma(_2087, _2165, _2165);
    bool _2285 = uint(_2071) > 1u;
    int _2287 = _746 * _2251;
    int _2289 = _2287 + _1023;
    int _2291 = abs(_1457);
    int _2293 = _2175 + 8;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    uint _2297 = uint(int(uint(int(_2295)) >> uint(2)));
    int _2299 = int(_2295) & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    int _2303 = int(_2295) + 1;
    uint _2305 = uint(int(uint(_2303) >> uint(2)));
    int _2307 = _2303 & 3;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[int(_2305)][_2307];
    int _2311 = ~_2095;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = -_156;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2245);
    int _2321 = ~_2211;
    int _2323 = _2321 + _2281;
    int _2325 = _2323 + 1;
    int _2327 = abs(_1663);
    int _2329 = _756 * _2325;
    int _2331 = _2329 + _1311;
    int _2333 = ~_2291;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    int _2339 = _2315;
    if (!_2285)
    {
        int _2341 = ~_2095;
        int _2343 = _2341 + 1;
        _2339 = _2343;
    }
    int _2345 = _2339;
    bool _2347 = uint(_2071) >= 2u;
    int _2349 = abs(_2345);
    int _2351 = _2347 ? 0 : 1;
    int _2353 = _2043 & 3;
    bool _2355 = _2353 != 0;
    int _2357 = ~_2349;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    bool _2363 = !_2355;
    int _2365 = _2363 ? 0 : 1;
    bool _2367 = _2071 != 3;
    int _2369 = abs(_2365);
    int _2371 = abs(_2005);
    int _2373 = _2361 * as_type<int>(_2201);
    int _2375 = ~_2327;
    int _2377 = _2375 + 1;
    int _2379 = _2377 + 1;
    int _2381 = _2337 * as_type<int>(_2233);
    int _2383 = ~_2351;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2391 = int(_2389);
    int _2393 = ~_2371;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    int _2399 = _2379 * as_type<int>(_2225);
    int _2401 = _2399 + _2381;
    int _2403 = _2387;
    if (_2367)
    {
        int _2405 = ~_2351;
        int _2407 = _2405 + 1;
        _2403 = _2407;
    }
    int _2409 = _2403;
    int _2411 = ~_2369;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    int _2417 = _2397 * as_type<int>(_2265);
    int _2419 = _2417 + _2401;
    bool _2421 = _2071 != 3;
    float _2423 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2425 = int(_2423);
    int _2427 = abs(_2409);
    int _2429 = _2415 * as_type<int>(_2193);
    int _2431 = _2429 + _2373;
    bool _2433 = !_2421;
    int _2435 = _2433 ? 0 : (-1);
    int _2437 = abs(_1737);
    bool _2439 = !_1493;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2445 = log2(_2443);
    int _2447 = abs(_2435);
    int _2449 = abs(_2441);
    int _2451 = ~_2427;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2455 * as_type<int>(_2301);
    int _2459 = _2457 + _2431;
    int _2461 = ~_2437;
    int _2463 = _2461 + 1;
    int _2465 = _2463 + 1;
    int _2467 = ~_2447;
    int _2469 = _2467 + 1;
    int _2471 = _2469 + 1;
    float _2473 = _2445 * _156;
    float _2475 = float(uint(_2391));
    int _2477 = _2465 * as_type<int>(_2273);
    int _2479 = _2477 + _2419;
    int _2481 = _2471 * as_type<int>(_2309);
    int _2483 = _2481 + _2459;
    bool _2485 = !_1515;
    int _2487 = _2485 ? 0 : 1;
    float _2489 = 1.0 / _2475;
    int _2491 = abs(_2391);
    int _2493 = abs(_2425);
    int _2495 = ~_2449;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2425));
    float _2503 = exp2(_2473);
    int _2505 = abs(_2487);
    int _2507 = _2479 * _2499;
    bool _2509 = _746 == 0;
    float _2511 = 1.0 / _2501;
    int _2513 = ~_2505;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    bool _2519 = !_2509;
    int _2521 = _2519 ? _2289 : (-1);
    float _2523 = as_type<float>(_2465);
    float _2525 = as_type<float>(_2517);
    if (_2103)
    {
        _2523 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2527 = _2523;
    int _2529 = _2517 * _2483;
    float _2531 = float(uint(_2491));
    int _2533 = _2521 * _2449;
    int _2535 = _2533 + _2507;
    float _2537 = float(uint(_2493));
    int _2539 = as_type<int>(_2527);
    if (_2103)
    {
        float _2541 = _2527 * 5.0;
        _2539 = as_type<int>(_2541);
    }
    int _2543 = _2539;
    bool _2545 = !_2033;
    int _2547 = _2545 ? _2331 : (-1);
    float _2549 = fma(_1875, _1813, _1961);
    float _2551 = 1.0 / _2531;
    int _2553 = as_type<int>(_2489) + (-2);
    if (_2103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9143 = as_type<float>(_2543);
        out.gl_Position.z = _9143;
    }
    int _2555 = _2547 * _2505;
    int _2557 = _2555 + _2529;
    float _2559 = float(uint(_2535));
    float _2561 = fma(_1879, _1719, _2549);
    float _2563 = 1.0 / _2537;
    int _2565 = as_type<int>(_2511) + (-2);
    float _2567 = as_type<float>(_2553) * _2559;
    if (_1825)
    {
        _2525 = _736;
    }
    float _2569 = _2525;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2573 = _2569;
    if (!_1825)
    {
        _2573 = _728;
    }
    float _2575 = _2573;
    float _2577 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2561);
    float _2579 = float(uint(_2557));
    float _2581 = trunc(_2567);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    int _2587 = abs(_2557);
    float _2589 = _2575 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2591 = abs(_2535);
    float _2593 = as_type<float>(_2565) * _2579;
    float _2595 = fma(_2589, -2.0, _2571);
    int _2597 = as_type<int>(_2551) + (-2);
    out.m_73.x = _2577;
    int _2599 = as_type<int>(_2563) + (-2);
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = float(uint(_2591));
    float _2609 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2595);
    float _2611 = float(uint(_2587));
    int _2613 = ~_2391;
    int _2615 = _2613 + 1;
    float _2617 = as_type<float>(_2597) * _2607;
    int _2619 = ~_2425;
    int _2621 = _2619 + 1;
    float _2623 = as_type<float>(_2599) * _2611;
    float _2625 = _728 + (-0.5);
    float _2627 = trunc(_2617);
    float _2629 = precise::max(_2627, 0.0);
    uint _2631 = uint(_2629);
    int _2633 = _2615 * int(_2585);
    int _2635 = _2633 + _2535;
    float _2637 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2277);
    int _2639 = _2621 * int(_2605);
    int _2641 = _2639 + _2557;
    int _2643 = ~_2491;
    int _2645 = _2643 + 1;
    float _2647 = float(uint(_2635));
    float _2649 = trunc(_2623);
    float _2651 = precise::max(_2649, 0.0);
    uint _2653 = uint(_2651);
    float _2655 = float(uint(_2641));
    int _2657 = ~_2493;
    int _2659 = _2657 + 1;
    float _2661 = as_type<float>(_2553) * _2647;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2665 = as_type<float>(_2565) * _2655;
    float _2667 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2663);
    int _2669 = _2645 * int(_2631);
    int _2671 = _2669 + _2591;
    float _2673 = trunc(_2661);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    float _2679 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2667);
    bool _2681 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2683 = isnan(1.0);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2689 = _2685 || _2687;
    int _2691 = _2659 * int(_2653);
    int _2693 = _2691 + _2587;
    float _2695 = float(uint(_2671));
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2699 = 1.0 + _2697;
    float _2701 = -_2609;
    float _2703 = fma(_2679, _2021, _2701);
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2707 = float(uint(_2693));
    float _2709 = as_type<float>(_2597) * _2695;
    float _2711 = trunc(_2665);
    float _2713 = precise::max(_2711, 0.0);
    uint _2715 = uint(_2713);
    float _2717 = -_2503;
    float _2719 = _2717 + 1.0;
    float _2721 = as_type<float>(_2599) * _2707;
    float _2723 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2705);
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2729 = isnan(0.0);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2735 = _2731 || _2733;
    float _2737 = 1.0 / _2699;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2741 = fma(_2253, -2.0, _2725);
    float _2743 = _2735 ? _2719 : 0.0;
    float _2745 = -_156;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1439);
    float _2749 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2739);
    int _2751 = int(_2585) + int(_2677);
    float _2753 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2723);
    float _2755 = trunc(_2709);
    float _2757 = precise::max(_2755, 0.0);
    uint _2759 = uint(_2757);
    int _2761 = ~_2425;
    int _2763 = _2761 + 1;
    float _2765 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2749);
    float _2767 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2741);
    int _2769 = int(_2605) + int(_2715);
    int _2771 = ~_2491;
    int _2773 = _2771 + 1;
    float _2775 = trunc(_2721);
    float _2777 = precise::max(_2775, 0.0);
    uint _2779 = uint(_2777);
    if (_2689)
    {
        float _2781 = _2743 * _2737;
        _160 = _2781;
    }
    float _2783 = _160;
    int _2785 = ~_2391;
    int _2787 = _2785 + 1;
    bool _2789 = _2425 == 0;
    float _2791 = fma(_2275, _2783, _2637);
    int _2793 = _2557 ^ _2425;
    int _2795 = _2787 * _2751;
    int _2797 = _2795 + _2535;
    int _2799 = int(_2631) + int(_2759);
    int _2801 = ~_2493;
    int _2803 = _2801 + 1;
    bool _2805 = uint(_2797) >= uint(_2391);
    int _2807 = int(_2653) + int(_2779);
    int _2809 = _2773 * _2799;
    int _2811 = _2809 + _2591;
    bool _2813 = !_2805;
    int _2815 = _2813 ? 0 : (-1);
    int _2817 = _2763 * _2769;
    int _2819 = _2817 + _2557;
    float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2823 = uint(_2811) >= uint(_2491);
    bool _2825 = uint(_2819) >= uint(_2425);
    int _2827 = _2803 * _2807;
    int _2829 = _2827 + _2587;
    int _2831 = ~_2751;
    int _2833 = _2831 + _2815;
    int _2835 = _2833 + 1;
    bool _2837 = !_2825;
    int _2839 = _2837 ? 0 : (-1);
    float _2841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2843 = _2535 ^ _2391;
    int _2845 = _2391 * _2835;
    int _2847 = _2845 + _2535;
    int _2849 = ~_2769;
    int _2851 = _2849 + _2839;
    int _2853 = _2851 + 1;
    bool _2855 = uint(_2829) >= uint(_2493);
    bool _2857 = _2391 == 0;
    int _2859 = _2425 * _2853;
    int _2861 = _2859 + _2557;
    uint _2863 = uint(int(uint(_2843) >> uint(31)));
    float _2865 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2867 = _2391 == 0;
    float _2869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2871 = !_2789;
    int _2873 = _2871 ? _2861 : (-1);
    float _2875 = fma(_2865, _1171, -0.5);
    bool _2877 = !_2823;
    int _2879 = _2877 ? 0 : (-1);
    bool _2881 = !_2855;
    int _2883 = _2881 ? 0 : (-1);
    bool _2885 = _2425 == 0;
    float _2887 = _2841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2889 = !_2857;
    int _2891 = _2889 ? _2847 : (-1);
    uint _2893 = uint(int(uint(_2793) >> uint(31)));
    float _2895 = fma(_2887, _1331, -0.5);
    float _2897 = float(_2873);
    int _2899 = ~_2879;
    int _2901 = _2799 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = _2869 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2907 = ~int(_2863);
    int _2909 = _2907 + 1;
    float _2911 = fma(_2887, _2897, _2319);
    int _2913 = ~_2883;
    int _2915 = _2807 + _2913;
    int _2917 = _2915 + 1;
    float _2919 = _2051 * _2051;
    float _2921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2923 = float(_2891);
    float _2925 = fma(_1271, _2905, -0.5);
    int _2927 = ~int(_2893);
    int _2929 = _2927 + 1;
    float _2931 = fma(_2203, _2895, _2911);
    int _2933 = _2903 ^ _2909;
    float _2935 = fma(_2865, _2923, _2747);
    int _2937 = _2917 ^ _2929;
    float _2939 = _742 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2941 = ~_2909;
    int _2943 = _2941 + _2933;
    int _2945 = _2943 + 1;
    float _2947 = fma(_2079, _2079, _2919);
    int _2949 = ~_2929;
    int _2951 = _2949 + _2937;
    int _2953 = _2951 + 1;
    float _2955 = fma(_2753, _2875, _2935);
    bool _2957 = !_2867;
    int _2959 = _2957 ? _2945 : (-1);
    float _2961 = fma(_2083, _2083, _2947);
    bool _2963 = !_2885;
    int _2965 = _2963 ? _2953 : (-1);
    float _2967 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2969 = float(_2959);
    float _2971 = _2703 + 0.5;
    float _2973 = float(_2965);
    float _2975 = rsqrt(_2961);
    float _2977 = fma(_1387, _2967, -0.5);
    float _2979 = -_1489;
    float _2981 = fma(_2905, _2969, _2979);
    float _2983 = _2171 + 0.5;
    float _2985 = -_2767;
    float _2987 = fma(_2967, _2973, _2985);
    float _2989 = fma(_2765, _2925, _2981);
    float _2991 = _2955 + 0.5;
    float _2993 = fma(_2183, _2977, _2987);
    float _2995 = _2931 + 0.5;
    float _2997 = _2989 + 0.5;
    out.m_75.x = _2983;
    out.m_75.y = _2971;
    float _2999 = _2993 + 0.5;
    float _3001 = _2939 * _2975;
    out.m_77.x = _2991;
    out.m_77.y = _2997;
    out.m_77.z = _2995;
    out.m_77.w = _2999;
    float _3003 = _736 + (-0.5);
    float _3005 = _2079 * _3001;
    float _3007 = _2051 * _3001;
    float _3009 = as_type<float>(_2929);
    if (_2103)
    {
        return out;
    }
    float _3011 = -_3007;
    float _3013 = _2039 + _3011;
    float _3015 = -_3005;
    float _3017 = _2067 + _3015;
    float _3019 = _2083 * _3001;
    float _3021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3023 = _3013 + _3021;
    float _3025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3027 = _3017 + _3025;
    float _3029 = -_3019;
    float _3031 = _2069 + _3029;
    float _3033 = -_3007;
    float _3035 = _2051 + _3033;
    float _3037 = _3023 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3039 = _728 + _748;
    float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3043 = _3031 + _3041;
    float _3045 = _748 + (-0.5);
    float _3047 = fma(_3027, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3037);
    float _3049 = _3039 + (-1.0);
    float _3051 = _1957 * (-2.0);
    float _3053 = -_3005;
    float _3055 = _2079 + _3053;
    float _3057 = fma(_3043, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3047);
    float _3059 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3061 = fma(_3051, _2167, _2167);
    float _3063 = _3035 * _3035;
    float _3065 = fma(_3003, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2283);
    bool _3067 = _3057 >= 0.0;
    float _3069 = fma(_3059, _3051, _3059);
    float _3071 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3061);
    float _3073 = fma(_3055, _3055, _3063);
    float _3075 = -_3019;
    float _3077 = _2083 + _3075;
    float _3079 = fma(_2105, _2783, _3065);
    float _3081 = fma(_3069, _2783, _3071);
    float _3083 = _2791 * 0.15915493667125701904296875;
    float _3085 = fma(_3077, _3077, _3073);
    float _3087 = _3079 * 0.15915493667125701904296875;
    float _3089 = _3081 * 0.15915493667125701904296875;
    float _3091 = _3083 * 6.283185482025146484375;
    float _3093 = sin(_3091);
    float _3095 = _3071;
    if (_3067)
    {
        _3095 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3097 = _3095;
    int _3099 = as_type<int>(_3097);
    if (_3067)
    {
        out.m_51.x = 0.0;
    }
    if (_3067)
    {
        float _3101 = _3097 * 5.0;
        _3099 = as_type<int>(_3101);
    }
    int _3103 = _3099;
    float _3105 = _3083 * 6.283185482025146484375;
    float _3107 = cos(_3105);
    if (_3067)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9996 = as_type<float>(_3103);
        out.gl_Position.z = _9996;
    }
    float _3109 = _3087 * 6.283185482025146484375;
    float _3111 = sin(_3109);
    float _3113 = _3087 * 6.283185482025146484375;
    float _3115 = cos(_3113);
    float _3117 = _3089 * 6.283185482025146484375;
    float _3119 = sin(_3117);
    float _3121 = sqrt(_3085);
    if (_3067)
    {
        return out;
    }
    float _3123 = in.m_79.x;
    float _3125 = in.m_79.y;
    float _3127 = in.m_79.z;
    bool _3129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _3131 = _2975 * _3121;
    bool _3133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _3135 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3137 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3139 = _3089 * 6.283185482025146484375;
    float _3141 = cos(_3139);
    float _3143 = _742 * _3131;
    float _3145 = _3131 * _3135;
    float _3147 = _3131 * _3137;
    float _3149 = _3093 * _3115;
    float _3151 = _3057;
    if (_3129)
    {
        float _3153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3151 = _3153;
    }
    float _3155 = _3151;
    float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3159 = _3157 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3161 = _3107 * _3111;
    float _3163 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3165 = _3163 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3167 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3169 = _3167 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3171 = -_3161;
    float _3173 = fma(_3119, _3149, _3171);
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _3177 = _3161;
    if (_3133)
    {
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _3175 = _3179;
    }
    float _3181 = _3175;
    float _3183 = -_3149;
    float _3185 = fma(_3119, _3161, _3183);
    float _3187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3125);
    if (_3133)
    {
        float _3189 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _3177 = _3189;
    }
    float _3191 = _3177;
    if (_3129)
    {
        float _3193 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _889 = _3193;
    }
    float _3195 = _889;
    float _3197 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3199 = _3197 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3201 = _3187 * _3145;
    float _3203 = 1.0 / _3169;
    float _3205 = _3093 * _3111;
    float _3207 = _3195;
    float _3209 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_3133)
    {
        float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _891 = _3211;
    }
    float _3213 = _891;
    float _3215 = _3213;
    if (_3129)
    {
        float _3217 = fma(_3195, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3207 = _3217;
    }
    float _3219 = _3207;
    float _3221 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3223 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _3221;
    float _3225 = 1.0 / _3165;
    if (_3129)
    {
        float _3227 = _3219 * _3155;
        _3209 = _3227;
    }
    float _3229 = _3209;
    if (_3133)
    {
        float _3231 = _3213 * _3181;
        _3215 = _3231;
    }
    float _3233 = _3215;
    float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3235;
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3243 = _3107 * _3115;
    float _3245 = 1.0 / _3199;
    float _3247 = _3241 * _3203;
    float _3249 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3255 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3253;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3261 = fma(_3119, _3243, _3205);
    float _3263 = 1.0 / _3159;
    float _3265 = _3251 * _3225;
    float _3267 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3269 = _3267 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3271 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3273 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3271;
    float _3275 = fma(_3119, _3205, _3243);
    float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3279 = _3277 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3123);
    float _3283 = _3155;
    if (_3133)
    {
        float _3285 = floor(_3233);
        _3283 = _3285;
    }
    float _3287 = _3283;
    float _3289 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3291 = _3289 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3293 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3295 = _3293 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3297 = _3281 * _3143;
    float _3299 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3301 = _3299 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3303 = _3107 * _3141;
    float _3305 = _3115 * _3141;
    float _3307 = (*spvDescriptorSet0.vp_c9)._m0[182].x;
    float _3309 = _3295;
    if (_3129)
    {
        float _3311 = floor(_3229);
        _3307 = _3311;
    }
    float _3313 = _3307;
    float _3315 = _3093 * _3141;
    float _3317 = _3111 * _3141;
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _3319;
    float _3323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3127);
    float _3325 = _3237 * _3245;
    float _3327 = _3295 * _3263;
    if (!_3133)
    {
        _3309 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3329 = _3309;
    float _3331 = 1.0 / _3259;
    float _3333 = _3329;
    if (_3133)
    {
        float _3335 = -_3287;
        float _3337 = _3233 + _3335;
        _3333 = _3337;
    }
    float _3339 = _3333;
    float _3341 = _3323 * _3147;
    if (!_3129)
    {
        _3009 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3343 = _3009;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3349 = _3303 * _3201;
    float _3351 = _3315 * _3201;
    float _3353 = 1.0 / _3279;
    float _3355 = _3343;
    if (_3129)
    {
        float _3357 = -_3313;
        float _3359 = _3229 + _3357;
        _3355 = _3359;
    }
    float _3361 = _3355;
    float _3363 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3365 = _3339 + _3363;
    float _3367 = fma(_3261, _3297, _3349);
    bool _3369 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3371 = isnan(_3339);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3377 = _3373 || _3375;
    float _3379 = float(_3377);
    float _3381 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3383 = _3361 + _3381;
    bool _3385 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3387 = isnan(_3361);
    bool _3389 = _3385 || _3387;
    bool _3391 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3393 = _3389 || _3391;
    float _3395 = float(_3393);
    float _3397 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _3399 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _3397;
    float _3401 = 1.0 / _3291;
    float _3403 = _3365 * _3331;
    float _3405 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3407 = _3361 + _3405;
    float _3409 = fma(_3247, _3383, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _3411 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3413 = isnan(_3361);
    bool _3415 = _3411 || _3413;
    bool _3417 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3419 = _3415 || _3417;
    float _3421 = float(_3419);
    float _3423 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _3425 = _3423 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3427 = fma(_3325, _3407, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3431 = _3361 + _3429;
    float _3433 = 1.0 / _3301;
    float _3435 = _3255 * _3353;
    float _3437 = fma(_3327, _3431, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3439 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3441 = _3361 + _3439;
    float _3443 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3445 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _3443;
    float _3447 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3449 = _3447 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3451 = 1.0 / _3321;
    float _3453 = _3269 * _3401;
    float _3455 = -_3201;
    float _3457 = _3119 * _3455;
    float _3459 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3461 = _3339 + _3459;
    float _3463 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3465 = _3339 + _3463;
    float _3467 = fma(_3453, _3441, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3469 = fma(_3305, _3297, _3457);
    float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3473 = _3361 + _3471;
    float _3475 = 1.0 / _3449;
    float _3477 = _3273 * _3433;
    float _3479 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3481 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _3479;
    float _3483 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3485 = _3339 + _3483;
    bool _3487 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3489 = isnan(_3361);
    bool _3491 = _3487 || _3489;
    bool _3493 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3495 = _3491 || _3493;
    float _3497 = float(_3495);
    float _3499 = fma(_3173, _3297, _3351);
    float _3501 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3503 = _3339 + _3501;
    float _3505 = fma(_3477, _3473, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3507 = 1.0 / _3347;
    float _3509 = _3461 * _3451;
    float _3511 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3513 = _3361 + _3511;
    bool _3515 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3517 = isnan(_3361);
    bool _3519 = _3515 || _3517;
    bool _3521 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3523 = _3519 || _3521;
    float _3525 = float(_3523);
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3529 = _3339 + _3527;
    bool _3531 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3533 = isnan(_3361);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3539 = _3535 || _3537;
    float _3541 = float(_3539);
    float _3543 = fma(_3435, _3513, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3545 = -_3395;
    float _3547 = _3545 + 1.0;
    float _3549 = 1.0 / _3445;
    float _3551 = _3485 * _3475;
    bool _3553 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3555 = isnan(_3361);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3561 = _3557 || _3559;
    float _3563 = float(_3561);
    float _3565 = _3497 * _3547;
    float _3567 = -_3497;
    float _3569 = _3567 + 1.0;
    bool _3571 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3573 = isnan(_3339);
    bool _3575 = _3571 || _3573;
    bool _3577 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3579 = _3575 || _3577;
    float _3581 = float(_3579);
    float _3583 = -_3541;
    float _3585 = _3583 + 1.0;
    float _3587 = fma(_3399, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _3589 = 1.0 / _3223;
    float _3591 = _3465 * _3507;
    float _3593 = -_3563;
    float _3595 = _3593 + 1.0;
    float _3597 = fma(_3185, _3341, _3367);
    float _3599 = fma(_3317, _3341, _3469);
    float _3601 = fma(_3425, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _3603 = _3395 * _3595;
    float _3605 = _3525 * _3569;
    float _3607 = 1.0 / _3481;
    float _3609 = _3503 * _3549;
    float _3611 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3613 = _3361 + _3611;
    float _3615 = -_3525;
    float _3617 = _3615 + 1.0;
    bool _3619 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3621 = isnan(_3339);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3627 = _3623 || _3625;
    float _3629 = float(_3627);
    float _3631 = fma(_3275, _3341, _3499);
    float _3633 = fma(_3265, _3613, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3635 = -_3421;
    float _3637 = _3635 + 1.0;
    float _3639 = _3529 * _3589;
    bool _3641 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3643 = isnan(_3361);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3649 = _3645 || _3647;
    float _3651 = float(_3649);
    float _3653 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3655 = _3339 + _3653;
    float _3657 = _3563 * _3637;
    float _3659 = -_3629;
    float _3661 = _3659 + 1.0;
    bool _3663 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3665 = isnan(_3361);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3671 = _3667 || _3669;
    float _3673 = float(_3671);
    float _3675 = _3651 * _3617;
    bool _3677 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3679 = isnan(_3339);
    bool _3681 = _3677 || _3679;
    bool _3683 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3685 = _3681 || _3683;
    float _3687 = float(_3685);
    float _3689 = _3655 * _3607;
    float _3691 = _3581 * _3661;
    float _3693 = _3427 * _3675;
    float _3695 = -_3581;
    float _3697 = _3695 + 1.0;
    float _3699 = -_3651;
    float _3701 = _3699 + 1.0;
    bool _3703 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3705 = isnan(_3339);
    bool _3707 = _3703 || _3705;
    bool _3709 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3711 = _3707 || _3709;
    float _3713 = float(_3711);
    float _3715 = _3421 * _3585;
    float _3717 = _3687 * _3697;
    float _3719 = -_3687;
    float _3721 = _3719 + 1.0;
    float _3723 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3693);
    float _3725 = -_3673;
    float _3727 = _3725 + 1.0;
    bool _3729 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3731 = isnan(_3339);
    bool _3733 = _3729 || _3731;
    bool _3735 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3737 = _3733 || _3735;
    float _3739 = float(_3737);
    float _3741 = -_3713;
    float _3743 = _3741 + 1.0;
    float _3745 = fma(_3409, _3605, _3723);
    float _3747 = _3541 * _3727;
    bool _3749 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3751 = isnan(_3339);
    bool _3753 = _3749 || _3751;
    bool _3755 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3757 = _3753 || _3755;
    float _3759 = float(_3757);
    float _3761 = _3713 * _3721;
    float _3763 = _3739 * _3743;
    float _3765 = -_3739;
    float _3767 = _3765 + 1.0;
    float _3769 = fma(_3633, _3565, _3745);
    bool _3771 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3773 = isnan(_3339);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3779 = _3775 || _3777;
    float _3781 = float(_3779);
    float _3783 = _3759 * _3767;
    float _3785 = -_3759;
    float _3787 = _3785 + 1.0;
    float _3789 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3789;
    float _3793 = -_3781;
    float _3795 = _3793 + 1.0;
    float _3797 = _3781 * _3787;
    float _3799 = fma(_3791, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3801 = _3379 * _3795;
    float _3803 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3805 = _3803 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3807 = -_3379;
    float _3809 = _3807 + 1.0;
    float _3811 = _3799 * _3801;
    float _3813 = fma(_3805, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3815 = _3587 * _3801;
    float _3817 = fma(_3437, _3603, _3769);
    float _3819 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3811);
    float _3821 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3821;
    float _3825 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].y, _3815);
    float _3827 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _3829 = _3827 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3831 = fma(_3813, _3797, _3819);
    float _3833 = fma(_3823, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3835 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3837 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _3835;
    float _3839 = fma(_3601, _3797, _3825);
    float _3841 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3845 = fma(_3833, _3783, _3831);
    float _3847 = fma(_3837, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _3849 = fma(_3843, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3851 = fma(_3543, _3657, _3817);
    float _3853 = fma(_3847, _3783, _3839);
    float _3855 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3855;
    float _3859 = fma(_3829, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _3861 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3863 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _3861;
    float _3865 = fma(_3849, _3763, _3845);
    float _3867 = fma(_3857, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3869 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3873 = fma(_3467, _3715, _3851);
    float _3875 = fma(_3859, _3763, _3853);
    float _3877 = fma(_3863, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _3879 = fma(_3867, _3761, _3865);
    float _3881 = fma(_3871, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3883 = fma(_3505, _3747, _3873);
    float _3885 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _3887 = _3885 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3889 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3889;
    float _3893 = fma(_3877, _3761, _3875);
    float _3895 = fma(_3881, _3717, _3879);
    float _3897 = fma(_3887, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _3899 = fma(_3891, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3901 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _3901;
    float _3905 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3907 = fma(_3673, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3883);
    float _3909 = fma(_3899, _3691, _3895);
    float _3911 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3913 = fma(_3897, _3717, _3893);
    float _3915 = fma(_3903, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _3917 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3905);
    float _3919 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3921 = _2069 + _3919;
    float _3923 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3909);
    float _3925 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _3927 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3911);
    float _3929 = fma(_3915, _3691, _3913);
    float _3931 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3917);
    float _3933 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3935 = _2067 + _3933;
    float _3937 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _3939 = -_3925;
    float _3941 = fma(_3923, _3921, _3939);
    float _3943 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3927);
    float _3945 = _3931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3947 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].y, _3929);
    float _3949 = -_3937;
    float _3951 = fma(_3923, _3935, _3949);
    float _3953 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3955 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3957 = fma(_3945, _3947, _3941);
    float _3959 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3961 = fma(_3953, _3947, _3951);
    float _3963 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3955);
    float _3965 = _3957 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3967 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3959);
    float _3969 = _3961 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3971 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3963);
    float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3975 = _3965 + _3973;
    float _3977 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3967);
    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3981 = _3969 + _3979;
    float _3983 = _3971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3985 = _3975 * _3975;
    float _3987 = _3977 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3989 = _2039 + _3983;
    float _3991 = fma(_3981, _3981, _3985);
    float _3993 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3995 = _3987 + _3993;
    float _3997 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _3999 = -_3987;
    float _4001 = _3989 + _3999;
    float _4003 = sqrt(_3991);
    float _4005 = -_3997;
    float _4007 = fma(_3923, _3995, _4005);
    float _4009 = fma(_3947, _4001, _4007);
    float _4011 = _4009 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _4013 = _4003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4017 = _4003 + _4015;
    float _4019 = _3909;
    float _4021 = _3987;
    float _4023 = _3991;
    float _4025 = _3969;
    float _4027 = _3965;
    float _4029 = _4009;
    float _4031 = _4011;
    float _4033 = _3893;
    if (_4013)
    {
        float _4035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4035;
    }
    float _4037 = _4019;
    if (_4013)
    {
        float _4039 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4021 = _4039;
    }
    float _4041 = _4021;
    float _4043 = _4041;
    if (_4013)
    {
        float _4045 = rsqrt(_3991);
        _4023 = _4045;
    }
    float _4047 = _4023;
    if (_4013)
    {
        float _4049 = _4017 * _4037;
        _2133 = _4049;
    }
    float _4051 = _2133;
    float _4053 = _4051;
    if (_4013)
    {
        float _4055 = _4051 * 0.15915493667125701904296875;
        _4053 = _4055;
    }
    float _4057 = _4053;
    float _4059 = _3599;
    if (_4013)
    {
        float _4061 = _4057 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        _4059 = _4063;
    }
    float _4065 = _4059;
    if (_4013)
    {
        float _4067 = fma(_4065, _4041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4043 = _4067;
    }
    float _4069 = _4043;
    float _4071 = _4069;
    if (_4013)
    {
        float _4073 = _4047 * _4069;
        _4071 = _4073;
    }
    float _4075 = _4071;
    if (_4013)
    {
        float _4077 = fma(_3981, _4075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _4025 = _4077;
    }
    float _4079 = _4025;
    float _4081 = _4079;
    if (_4013)
    {
        float _4083 = fma(_3975, _4075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4027 = _4083;
    }
    float _4085 = _4027;
    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _4089 = _4079 + _4087;
    float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _4093 = _4085 + _4091;
    float _4095 = fma(_4089, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _11606 = float2(_4095, _4097);
    float _4099 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_11606, float2(0.0), isnan(_11606)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_11606, float2(0.0), isnan(_11606)), level(0.0)).x;
    float _4101 = _4057;
    float _4103 = _4089;
    float _4105 = _4093;
    float _4107 = _4085;
    if (_4013)
    {
        float _4109 = _4057 * 6.283185482025146484375;
        float _4111 = cos(_4109);
        _4101 = _4111;
    }
    float _4113 = _4101;
    if (!_4013)
    {
        _4103 = _4011;
    }
    float _4115 = _4103;
    float _4117 = -_2069;
    float _4119 = _4117 + _4085;
    float _4121 = _4115;
    if (_4013)
    {
        float _4123 = _4113 + (-1.0);
        _4105 = _4123;
    }
    float _4125 = _4105;
    if (_4013)
    {
        float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4029 = _4127;
    }
    float _4129 = _4029;
    if (_4013)
    {
        float _4131 = fma(_4011, _4113, _4129);
        _4121 = _4131;
    }
    float _4133 = _4121;
    float _4135 = -_2067;
    float _4137 = _4135 + _4079;
    float _4139 = -_2039;
    float _4141 = _4139 + _4133;
    float _4143 = _4141 * _4141;
    float _4145 = fma(_4137, _4137, _4143);
    float _4147 = fma(_4119, _4119, _4145);
    float _4149 = sqrt(_4147);
    bool _4151 = _4149 > 0.0;
    float _4153 = fma(_4099, 100.0, _4133);
    float _4155 = _4149;
    float _4157 = _4141;
    if (!_4151)
    {
        _4155 = _4153;
    }
    float _4159 = _4155;
    bool _4161 = !_4151;
    float _4163 = _4159;
    if (!_4161)
    {
        float _4165 = _204 * _204;
        float _4167 = fma(_202, _202, _4165);
        float _4169 = fma(_206, _206, _4167);
        float _4171 = rsqrt(_4147);
        float _4173 = sqrt(_4169);
        float _4175 = _4137 * _4171;
        float _4177 = _4141 * _4171;
        float _4179 = _4119 * _4171;
        bool _4181 = _4173 > 0.0;
        float _4183 = _4171;
        _4031 = _4179;
        if (!_4181)
        {
            _4183 = _4153;
        }
        float _4185 = _4183;
        bool _4187 = !_4181;
        _4163 = _4185;
        if (!_4187)
        {
            float _4189 = rsqrt(_4169);
            float _4191 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4193 = _204 * _4189;
            float _4195 = _202 * _4189;
            float _4197 = _206 * _4189;
            float _4199 = _4177 * _4193;
            float _4201 = fma(_4175, _4195, _4199);
            float _4203 = _4191 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4205 = fma(_4179, _4197, _4201);
            float _4207 = _4205 * _4203;
            float _4209 = fma(_202, _4207, _4079);
            float _4211 = fma(_204, _4207, _4153);
            float _4213 = fma(_206, _4207, _4085);
            _4163 = _4211;
            _4081 = _4209;
            _4107 = _4213;
        }
    }
    float _4215 = _4163;
    float _4217 = _4081;
    float _4219 = _4107;
    float _4221 = _4031;
    float _4223 = -_3007;
    float _4225 = _4223 + _4215;
    float _4227 = -_3005;
    float _4229 = _4227 + _4217;
    float _4231 = -_3019;
    float _4233 = _4231 + _4219;
    float _4235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4237 = _4225 + _4235;
    float _4239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4241 = _4229 + _4239;
    float _4243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4245 = _4233 + _4243;
    float _4247 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4249 = _4237 * _4237;
    float _4251 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4247);
    float _4253 = fma(_4241, _4241, _4249);
    float _4255 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4251);
    float _4257 = fma(_4245, _4245, _4253);
    float _4259 = _4255 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4261 = rsqrt(_4257);
    float _4263 = sqrt(_4257);
    float _4265 = _4261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4267 = _4241 * _4265;
    float _4269 = _4245 * _4265;
    float _4271 = _4267 * _4267;
    float _4273 = _4269 * _4269;
    float _4275 = _4271 + _4273;
    float _4277 = sqrt(_4275);
    bool _4279 = _4277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4283 = _4277 + _4281;
    float _4285 = _4245;
    float _4287 = _4275;
    float _4289 = _4283;
    float _4291 = _4219;
    if (_4279)
    {
        float _4293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4285 = _4293;
    }
    float _4295 = _4285;
    if (_4279)
    {
        float _4297 = rsqrt(_4275);
        _4287 = _4297;
    }
    float _4299 = _4287;
    float _4301 = _4299;
    if (_4279)
    {
        float _4303 = _4283 * _4295;
        _4289 = _4303;
    }
    float _4305 = _4289;
    if (_4279)
    {
        float _4307 = _4305 * 0.15915493667125701904296875;
        _4291 = _4307;
    }
    float _4309 = _4291;
    float _4311 = _4295;
    float _4313 = _4309;
    if (_4279)
    {
        float _4315 = _4309 * 6.283185482025146484375;
        float _4317 = sin(_4315);
        _4311 = _4317;
    }
    float _4319 = _4311;
    float _4321 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4323 = precise::max(0.0, _4321);
    float _4325 = _4221;
    float _4327 = _4323;
    if (_4279)
    {
        float _4329 = _4309 * 6.283185482025146484375;
        float _4331 = cos(_4329);
        _4325 = _4331;
    }
    float _4333 = _4325;
    float _4335 = -_4265;
    float _4337 = -_4323;
    float _4339 = fma(_4237, _4335, _4337);
    float _4341 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4279)
    {
        float _4343 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4327 = _4343;
    }
    float _4345 = _4327;
    float _4347 = _4345;
    if (!_4279)
    {
        _4313 = _4339;
    }
    float _4349 = _4313;
    float _4351 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4353 = _4319;
    float _4355 = _4349;
    if (_4279)
    {
        float _4357 = fma(_4319, _4345, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4353 = _4357;
    }
    float _4359 = _4353;
    float _4361 = floor(_4351);
    float _4363 = _4359;
    if (_4279)
    {
        float _4365 = _4333 + (-1.0);
        _4347 = _4365;
    }
    float _4367 = _4347;
    float _4369 = _4367;
    if (_4279)
    {
        float _4371 = _4299 * _4359;
        _4157 = _4371;
    }
    float _4373 = _4157;
    if (!_4279)
    {
        _4363 = _4267;
    }
    float _4375 = _4363;
    float _4377 = _4375;
    if (_4279)
    {
        float _4379 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4341 = _4379;
    }
    float _4381 = _4341;
    float _4383 = _4381;
    if (_4279)
    {
        float _4385 = _4267 * _4373;
        _4377 = _4385;
    }
    float _4387 = _4377;
    if (!_4279)
    {
        _4301 = _4269;
    }
    float _4389 = _4301;
    float _4391 = _4389;
    if (_4279)
    {
        float _4393 = _4269 * _4373;
        _4391 = _4393;
    }
    float _4395 = _4391;
    if (!_4279)
    {
        _4369 = _4271;
    }
    float _4397 = _4369;
    float _4399 = _4397;
    if (_4279)
    {
        float _4401 = fma(_4339, _4333, _4381);
        _4355 = _4401;
    }
    float _4403 = _4355;
    if (_4279)
    {
        float _4405 = _4387 * _4387;
        _4399 = _4405;
    }
    float _4407 = _4399;
    if (!_4279)
    {
        _4383 = _4273;
    }
    float _4409 = _4383;
    float _4411 = _4409;
    if (_4279)
    {
        float _4413 = _4395 * _4395;
        _4411 = _4413;
    }
    float _4415 = _4411;
    float _4417 = fma(_4403, _4403, _4407);
    float _4419 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4421 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4423 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4425 = _4417 + _4415;
    float _4427 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4429 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4419);
    float _4431 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4421);
    float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4435 = fma(_4263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4433);
    float _4437 = precise::clamp(_4435, 0.0, 1.0);
    float _4439 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4427);
    float _4441 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4429);
    float _4443 = rsqrt(_4425);
    float _4445 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4431);
    float _4447 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4439);
    float _4449 = _4441 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4451 = -_4437;
    float _4453 = _4451 + 1.0;
    float _4455 = _4445 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4457 = _4447 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4459 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4461 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4463 = _4455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4465 = abs(_4453);
    float _4467 = log2(_4465);
    float _4469 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4459);
    float _4471 = -_4361;
    float _4473 = _4351 + _4471;
    float _4475 = -_4463;
    float _4477 = fma(_4475, _4461, 1.0);
    float _4479 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4481 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4469);
    float _4483 = _4443 * _4387;
    float _4485 = _4443 * _4403;
    float _4487 = _4443 * _4395;
    float _4489 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4481);
    float _4491 = _4483 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4493 = floor(_4423);
    float _4495 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4497 = -_4491;
    float _4499 = fma(_4485, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4497);
    float _4501 = _4467 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4503 = -_4487;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4499);
    float _4507 = log2(_4477);
    float _4509 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4495);
    float _4511 = _4485 + 1.0;
    float _4513 = fma(_4505, -0.5, 0.5);
    float _4515 = fma(_4505, 0.5, 0.5);
    float _4517 = exp2(_4501);
    float _4519 = -_4493;
    float _4521 = _4423 + _4519;
    float _4523 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4479);
    float _4525 = fma(_4515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4527 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4509);
    float _4529 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4523);
    float _4531 = fma(_4515, _4525, -0.212114393711090087890625);
    float _4533 = 1.0 / _4489;
    float _4535 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4527);
    float _4537 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4529);
    float _4539 = fma(_4515, _4531, 1.570728778839111328125);
    float _4541 = _4507 * 0.693147182464599609375;
    float _4543 = sqrt(_4513);
    float _4545 = -_4485;
    float _4547 = fma(_4517, _4511, _4545);
    float _4549 = _4541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4551 = fma(_4547, 0.5, 0.5);
    float _4553 = _4537 * _4533;
    float _4555 = _4535 * _4533;
    float _4557 = fma(_4553, 0.5, 0.5);
    float _4559 = fma(_4555, -0.5, 0.5);
    float _4561 = _4543 * 0.636619746685028076171875;
    float2 _12363 = float2(_4473, _4521);
    float _4563 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12363, float2(0.0), isnan(_12363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12363, float2(0.0), isnan(_12363)), level(0.0)).x;
    float _4565 = -_4539;
    float _4567 = fma(_4561, _4565, 1.0);
    float3 _12377 = float3(_4557, _4559, _4549);
    float _4569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12377, float3(0.0), isnan(_12377)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12377, float3(0.0), isnan(_12377)), level(0.0)).x;
    float3 _12388 = float3(_4557, _4559, _4549);
    float4 _4572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12388, float3(0.0), isnan(_12388)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12388, float3(0.0), isnan(_12388)), level(0.0)).xyzw;
    float _4574 = _4572.x;
    float _4576 = _4572.y;
    float _4578 = _4572.z;
    float _4580 = _4572.w;
    float2 _12404 = float2(_4567, _4551);
    float3 _4584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12404, float2(0.0), isnan(_12404)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12404, float2(0.0), isnan(_12404)), level(0.0)).xyz;
    float _4586 = _4584.x;
    float _4588 = _4584.y;
    float _4590 = _4584.z;
    float _4592 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4594 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4596 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _4598 = _3125 != 0.0;
    bool _4600 = isnan(_3125);
    bool _4602 = _4598 || _4600;
    bool _4604 = isnan(0.0);
    bool _4606 = _4602 || _4604;
    float _4608 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4592);
    float _4610 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4594);
    float _4612 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4596);
    bool _4614 = _3123 == 0.0;
    bool _4616 = !_4606;
    bool _4618 = _4614 && _4616;
    float _4620 = in.m_81.x;
    float _4622 = in.m_81.y;
    float _4624 = in.m_81.z;
    float _4626 = fma(_4099, 100.0, _2039);
    bool _4628 = _3127 == 0.0;
    bool _4630 = _4628 && _4618;
    out.m_65.x = _576;
    out.m_65.y = _586;
    out.m_65.z = _582;
    out.m_65.w = _584;
    out.m_67.x = _686;
    out.m_67.y = _688;
    out.m_67.z = _690;
    out.m_67.w = _692;
    float _4632 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _4634 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _4632;
    float _4636 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4608);
    float _4638 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4610);
    float _4640 = in.m_83.x;
    float _4642 = in.m_83.y;
    float _4644 = in.m_83.z;
    float _4646 = in.m_83.w;
    float _4648 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4612);
    float _4650 = fma(_4634, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _4652 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _4654 = _4652 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _4656 = -_3007;
    float _4658 = _4656 + _4626;
    float _4660 = _4467 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4662 = _4650 * _3801;
    float _4664 = fma(_4654, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _4666 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4668 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4670 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4672 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4674 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4676 = -_3119;
    float _4678 = fma(_4676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4666);
    float _4680 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4682 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4668);
    float _4684 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4670);
    float _4686 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4672);
    float _4688 = _4686;
    float _4690 = _4620;
    if (_4630)
    {
        _4033 = _4620;
    }
    float _4692 = _4033;
    float _4694 = -_3119;
    float _4696 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4674);
    float _4698 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4678);
    float _4700 = -_3119;
    float _4702 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4680);
    float _4704 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4682);
    float _4706 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4684);
    float _4708 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4686);
    float _4710 = _4692;
    float _4712 = _4702;
    if (_4630)
    {
        _4688 = _4692;
    }
    float _4714 = _4688;
    float _4716 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4696);
    float _4718 = _4714;
    if (!_4630)
    {
        _4710 = _4620;
    }
    float _4720 = _4710;
    float _4722 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4702);
    if (_4630)
    {
        _4712 = _4622;
    }
    float _4724 = _4712;
    float _4726 = _4698 * _4642;
    float _4728 = _4724;
    if (!_4630)
    {
        float _4730 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4622);
        _4728 = _4730;
    }
    float _4732 = _4728;
    float _4734 = _4716 * _4642;
    float _4736 = _4722 * _4642;
    float _4738 = _4644 * _4720;
    if (_4630)
    {
        _4690 = _4624;
    }
    float _4740 = _4690;
    float _4742 = _4740;
    if (!_4630)
    {
        float _4744 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4720);
        _4718 = _4744;
    }
    float _4746 = _4718;
    float _4748 = fma(_4638, _4640, _4726);
    float _4750 = fma(_4636, _4640, _4734);
    float _4752 = fma(_4648, _4640, _4736);
    if (!_4630)
    {
        float _4754 = fma(_3127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4624);
        _4742 = _4754;
    }
    float _4756 = _4742;
    float _4758 = -_4738;
    float _4760 = fma(_4640, _4624, _4758);
    float _4762 = _4640 * _4622;
    float _4764 = fma(_4706, _4644, _4748);
    float _4766 = fma(_4704, _4644, _4750);
    float _4768 = fma(_4708, _4644, _4752);
    float _4770 = _4642 * _4624;
    float _4772 = -_4762;
    float _4774 = fma(_4642, _4720, _4772);
    float _4776 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _4778 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _4776;
    float _4780 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].z, _4662);
    out.m_85.x = _4766;
    out.m_85.y = _4764;
    out.m_85.z = _4768;
    float _4782 = -_4770;
    float _4784 = fma(_4644, _4622, _4782);
    float _4786 = fma(_4778, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _4788 = fma(_4664, _3797, _4780);
    float _4790 = in.m_69.x;
    float _4792 = _4784 * _4646;
    float _4794 = exp2(_4660);
    float _4796 = fma(_4786, _3783, _4788);
    float _4798 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _4800 = _4798 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _4802 = fma(_4800, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _4804 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _4806 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _4804;
    float _4808 = fma(_4802, _3763, _4796);
    float _4810 = _4760 * _4646;
    float _4812 = _4774 * _4646;
    float _4814 = fma(_4806, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _4816 = _4698 * _4732;
    float _4818 = _4810 * _4716;
    float _4820 = _4722 * _4732;
    float _4822 = _4810 * _4698;
    float _4824 = _4810 * _4722;
    float _4826 = fma(_4792, _4636, _4818);
    float _4828 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _4830 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _4828;
    float _4832 = fma(_4792, _4638, _4822);
    float _4834 = fma(_4792, _4648, _4824);
    float _4836 = fma(_4812, _4704, _4826);
    float _4838 = _4658 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4840 = fma(_4812, _4706, _4832);
    float _4842 = fma(_4812, _4708, _4834);
    float _4844 = _4658 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4846 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4838);
    float _4848 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _4850 = _4848 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _4852 = fma(_4638, _4746, _4816);
    out.m_87.x = _4836;
    out.m_87.y = _4840;
    out.m_87.z = _4842;
    float _4854 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4846);
    float _4856 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4844);
    float _4858 = fma(_4830, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _4860 = fma(_4850, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _4862 = fma(_4706, _4756, _4852);
    float _4864 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4856);
    float _4866 = fma(_4858, _3761, _4808);
    float _4868 = _4716 * _4732;
    float _4870 = _4864 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4872 = _4854 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4874 = fma(_4636, _4746, _4868);
    float _4876 = fma(_4648, _4746, _4820);
    float _4878 = fma(_4860, _3717, _4866);
    float _4880 = 1.0 / _4872;
    float _4882 = _4870 + _4872;
    float _4884 = fma(_4814, _3691, _4878);
    bool _4886 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4888 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4890 = _4886 || _4888;
    bool _4892 = isnan(0.5);
    bool _4894 = _4890 || _4892;
    float _4896 = fma(_4704, _4756, _4874);
    float _4898 = fma(_4708, _4756, _4876);
    float _4900 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].z, _4884);
    out.m_89.x = _4900;
    float _4902 = _4882 * _4880;
    float _4904 = _4902 * 0.5;
    float _4906 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_4894)
    {
        _4906 = 1.0;
    }
    float _4908 = _4906;
    float _4910 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4912 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4910);
    float _4914 = _4489 * 0.5;
    float _4916 = 1.0 / _4912;
    float _4918 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4920 = _4916 * _4918;
    float _4922 = abs(_4920);
    float _4924 = log2(_4922);
    bool _4926 = _4920 <= 8000.0;
    bool _4928 = isnan(_4920);
    bool _4930 = _4926 || _4928;
    bool _4932 = isnan(8000.0);
    bool _4934 = _4930 || _4932;
    float _4936 = float(_4934);
    float _4938 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4940 = exp2(_4938);
    float _4942 = fma(_4940, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4944 = precise::clamp(_4942, 0.0, 1.0);
    float _4946 = fma(_4944, -2.0, 3.0);
    float _4948 = _4944 * _4944;
    float _4950 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4952 = _4948 * _4946;
    float _4954 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4950);
    float _4956 = _4537 + _4489;
    float _4958 = -_4952;
    float _4960 = _4958 + 1.0;
    float _4962 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4954);
    float _4964 = _4956 * 0.5;
    float _4966 = fma(_4960, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4952);
    float _4968 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4962);
    float _4970 = fma(_4535, -0.5, _4914);
    float _4972 = _4914;
    float _4974 = _4908;
    float _4976 = _4489;
    float _4978 = _4970;
    if (_4894)
    {
        _4972 = 1.0;
    }
    float _4980 = _4972;
    float _4982 = _4968 + _4489;
    float _4984 = _4982 * 0.5;
    float _4986 = _4980;
    float _4988 = _4984;
    if (!_4894)
    {
        float _4990 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4992 = _4990 * 0.15915493667125701904296875;
        float _4994 = _4992 * 6.283185482025146484375;
        float _4996 = cos(_4994);
        float _4998 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5000 = _4998 * 0.15915493667125701904296875;
        float _5002 = _4992 * 6.283185482025146484375;
        float _5004 = sin(_5002);
        float _5006 = 1.0 / _4996;
        float _5008 = _5000 * 6.283185482025146484375;
        float _5010 = cos(_5008);
        float _5012 = _5004 * _5006;
        float _5014 = _5000 * 6.283185482025146484375;
        float _5016 = sin(_5014);
        float _5018 = _5010 * _5012;
        float _5020 = 1.0 / _5018;
        float _5022 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5024 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5022;
        float _5026 = 1.0 / _5024;
        float _5028 = _5016 * _5020;
        float _5030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5032 = fma(_4920, _5028, _5030);
        float _5034 = _5032 * _5026;
        float _5036 = precise::clamp(_5034, 0.0, 1.0);
        _4986 = _5036;
    }
    float _5038 = _4986;
    if (!_4894)
    {
        float _5040 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5042 = _5040 * 0.15915493667125701904296875;
        float _5044 = _5042 * 6.283185482025146484375;
        float _5046 = cos(_5044);
        float _5048 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5050 = _5048 * 0.15915493667125701904296875;
        float _5052 = _5042 * 6.283185482025146484375;
        float _5054 = sin(_5052);
        float _5056 = 1.0 / _5046;
        float _5058 = _5050 * 6.283185482025146484375;
        float _5060 = cos(_5058);
        float _5062 = _5054 * _5056;
        float _5064 = _5050 * 6.283185482025146484375;
        float _5066 = sin(_5064);
        float _5068 = _5060 * _5062;
        float _5070 = 1.0 / _5068;
        float _5072 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5074 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _5072;
        float _5076 = 1.0 / _5074;
        float _5078 = _5066 * _5070;
        float _5080 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5082 = fma(_4920, _5078, _5080);
        float _5084 = _5082 * _5076;
        float _5086 = precise::clamp(_5084, 0.0, 1.0);
        float _5088 = -_5086;
        float _5090 = _5088 + 1.0;
        _4974 = _5090;
    }
    float _5092 = _4974;
    float _5094 = -_4794;
    float _5096 = _5094 + 1.0;
    float _5098 = _4936 * _4966;
    out.gl_Position.x = _4537;
    out.gl_Position.y = _4535;
    out.gl_Position.z = _4968;
    out.gl_Position.w = _4489;
    float _5100 = -_4563;
    float _5102 = _5100 + 1.0;
    float _5104 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5106 = _5098 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _4896;
    out.m_91.y = _4862;
    out.m_91.z = _4898;
    float _5108 = _5104 * _4569;
    float _5110 = -_5104;
    float _5112 = _5110 + 1.0;
    out.m_93.x = _4229;
    out.m_93.y = _4225;
    out.m_93.z = _4233;
    float _5114 = _5102 * _5106;
    float _5116 = precise::clamp(_5114, 0.0, 1.0);
    float _5118 = _4580 * _5108;
    float _5120 = _4590 * _5108;
    bool _5122 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5124 = isnan(_4263);
    bool _5126 = _5122 || _5124;
    bool _5128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5130 = _5126 || _5128;
    float _5132 = -_5116;
    float _5134 = fma(_5132, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5136 = fma(_4586, _5118, _4574);
    float _5138 = fma(_4588, _5118, _4576);
    float _5140 = _4580 * _5112;
    float _5142 = fma(_4580, _5120, _4578);
    float _5144 = _5134 * _4790;
    out.m_95.x = _4964;
    out.m_95.y = _4970;
    out.m_95.z = _4984;
    out.m_95.w = _4489;
    float _5146 = _5038 * _5092;
    out.m_97.x = _5136;
    out.m_97.y = _5138;
    out.m_97.z = _5142;
    out.m_97.w = _5140;
    float _5148 = _5146 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5150 = _5118;
    float _5152 = _5144;
    if (!_5130)
    {
        _5150 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5154 = _5150;
    float _5156 = _5144 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5158 = _5156;
    float _5160 = _5154;
    float _5162 = _5154;
    if (!_5130)
    {
        _5152 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5164 = _5152;
    float _5166 = _5164;
    float _5168 = _5164;
    if (!_5130)
    {
        _4976 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5170 = _4976;
    out.m_99.x = _5156;
    float _5172 = _5170;
    float _5174 = _5170;
    if (!_5130)
    {
        _4988 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5176 = _4988;
    float _5178 = _5176;
    float _5180 = _5176;
    if (!_5130)
    {
        _4978 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5182 = _4978;
    float _5184 = _5182;
    float _5186 = _5182;
    if (!_5130)
    {
        _5158 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5188 = _5158;
    bool _5190 = !_5130;
    float _5192 = _5188;
    float _5194 = _5188;
    if (!_5190)
    {
        bool _5196 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5198 = isnan(_4263);
        bool _5200 = _5196 || _5198;
        bool _5202 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5204 = _5200 || _5202;
        if (!_5204)
        {
            float _5206 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5208 = _4263 + _5206;
            float _5210 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5212 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5210;
            float _5214 = 1.0 / _5212;
            float _5216 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5218 = _5216 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5220 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5222 = _5220 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5224 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5226 = _5224 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5230 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5234 = _5232 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5236 = _5208 * _5214;
            float _5238 = precise::clamp(_5236, 0.0, 1.0);
            float _5240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5242 = _5240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5244 = fma(_5238, _5218, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5246 = fma(_5238, _5242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5248 = fma(_5238, _5222, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5250 = fma(_5238, _5226, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5252 = fma(_5238, _5230, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5254 = fma(_5238, _5234, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5162 = _5246;
            _5186 = _5252;
            _5168 = _5244;
            _5180 = _5250;
            _5174 = _5248;
            _5194 = _5254;
            _5256 = true;
        }
        else
        {
            bool _5258 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5260 = isnan(_4263);
            bool _5262 = _5258 || _5260;
            bool _5264 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5266 = _5262 || _5264;
            if (!_5266)
            {
                _5166 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5268 = _5166;
            _5168 = _5268;
            if (!_5266)
            {
                _5160 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5270 = _5160;
            _5162 = _5270;
            if (!_5266)
            {
                _5172 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5272 = _5172;
            _5174 = _5272;
            if (!_5266)
            {
                _5178 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5274 = _5178;
            _5180 = _5274;
            if (!_5266)
            {
                _5184 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5276 = _5184;
            _5186 = _5276;
            if (!_5266)
            {
                _5192 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5278 = _5192;
            bool _5280 = !_5266;
            _5194 = _5278;
            if (!_5280)
            {
                bool _5282 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5284 = isnan(_4263);
                bool _5286 = _5282 || _5284;
                bool _5288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5290 = _5286 || _5288;
                if (!_5290)
                {
                    float _5292 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5294 = _4263 + _5292;
                    float _5296 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5298 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5296;
                    float _5300 = 1.0 / _5298;
                    float _5302 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5304 = _5302 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5306 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5308 = _5306 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5310 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5312 = _5310 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5314 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5316 = _5314 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5320 = _5318 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5322 = _5294 * _5300;
                    float _5324 = precise::clamp(_5322, 0.0, 1.0);
                    float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5330 = fma(_5324, _5304, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5332 = fma(_5324, _5328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5334 = fma(_5324, _5308, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5336 = fma(_5324, _5312, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5338 = fma(_5324, _5316, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5340 = fma(_5324, _5320, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5162 = _5332;
                    _5186 = _5338;
                    _5168 = _5330;
                    _5180 = _5336;
                    _5174 = _5334;
                    _5194 = _5340;
                    _5256 = true;
                }
                else
                {
                    _5162 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5186 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5168 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5180 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5174 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5194 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5256 = false;
    float _5342 = _5162;
    float _5344 = _5186;
    float _5346 = _5168;
    float _5348 = _5180;
    float _5350 = _5174;
    float _5352 = _5194;
    float _5354 = fma(_4862, -0.5, 0.5);
    float _5356 = precise::clamp(_5354, 0.0, 1.0);
    float _5358 = -_5342;
    float _5360 = _5358 + _5344;
    float _5362 = _5148 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5364 = -_5346;
    float _5366 = _5364 + _5348;
    float _5368 = fma(_5356, _5360, _5342);
    out.m_101.x = 0.0;
    float _5370 = -_5350;
    float _5372 = _5370 + _5352;
    float _5374 = fma(_5356, _5366, _5346);
    float _5376 = _5368 * 0.586610972881317138671875;
    out.m_51.x = _5362;
    bool _5378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5380 = fma(_5356, _5372, _5350);
    float _5382 = fma(_5374, 0.298911988735198974609375, _5376);
    bool _5384 = _5038 > 0.0;
    bool _5386 = isnan(_5038);
    bool _5388 = _5384 || _5386;
    bool _5390 = isnan(0.0);
    bool _5392 = _5388 || _5390;
    float _5394 = fma(_5380, 0.114477999508380889892578125, _5382);
    bool _5396 = _5092 <= 0.0;
    bool _5398 = !_5392;
    bool _5400 = _5396 || _5398;
    float _5402 = -_5394;
    float _5404 = _5374 + _5402;
    float _5406 = -_5394;
    float _5408 = _5368 + _5406;
    float _5410 = -_5394;
    float _5412 = _5380 + _5410;
    float _5414 = fma(_5404, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    float _5416 = fma(_5408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    float _5418 = fma(_5412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    bool _5420 = !_5378;
    if (!_5420)
    {
        float _5422 = -_4225;
        float _5424 = _5422 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5426 = -_4229;
        float _5428 = _5426 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5430 = -_4233;
        float _5432 = _5430 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5434 = _5424 * _5424;
        float _5436 = fma(_5428, _5428, _5434);
        float _5438 = fma(_5432, _5432, _5436);
        float _5440 = sqrt(_5438);
        float _5442 = rsqrt(_5438);
        float _5444 = -_5440;
        float _5446 = _5444 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5448 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5450 = precise::clamp(_5448, 0.0, 1.0);
        float _5452 = _5428 * _5442;
        float _5454 = _5424 * _5442;
        float _5456 = abs(_5450);
        float _5458 = log2(_5456);
        float _5460 = _5432 * _5442;
        float _5462 = _5452 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5464 = _4862 * _5454;
        float _5466 = -_5454;
        float _5468 = -_5462;
        float _5470 = fma(_5466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5468);
        float _5472 = fma(_4896, _5452, _5464);
        float _5474 = -_5460;
        float _5476 = fma(_5474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5470);
        float _5478 = fma(_4898, _5460, _5472);
        float _5480 = precise::clamp(_5478, 0.0, 1.0);
        float _5482 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5484 = _5476 + _5482;
        float _5486 = _5458 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5488 = _5484 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5490 = precise::clamp(_5488, 0.0, 1.0);
        float _5492 = exp2(_5486);
        float _5494 = _5492 * _5490;
        float _5496 = _5480 * _5494;
        float _5498 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5500 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5502 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _5498;
        out.m_101.y = _5500;
        out.m_101.z = _5502;
    }
    out.m_103.x = _5414;
    out.m_103.y = _5416;
    out.m_103.z = _5418;
    if (!_5400)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _5504 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5504;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5256 = false;
    bool _714 = false;
    bool _610 = false;
    bool _454 = false;
    bool _232 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_51.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5561 = as_type<float>(_138);
        out.gl_Position.z = _5561;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_53.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5630 = as_type<float>(_176);
        out.gl_Position.z = _5630;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_55.x;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_55.y;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    out.m_59.x = _178;
    out.m_59.y = _182;
    float _190 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _192 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _190);
    float _198 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _194);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _196);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _198);
    float _206 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _200);
    bool _208 = !_180;
    float _210 = _182;
    float _212 = _178;
    float _230;
    if (!_208)
    {
        float _214 = in.m_61.x;
        float _216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _222 = _220 * _216;
        float _224 = floor(_222);
        float _226 = -_224;
        float _228 = _222 + _226;
        _230 = _228;
        _232 = true;
    }
    else
    {
        float _234 = float(_122);
        float _236 = 1.0 / _234;
        float _238 = _156 * _236;
        _230 = _238;
    }
    _232 = false;
    float _240 = _230;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _240 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _240 + _246;
    bool _250 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _252 = isnan(_240);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _240 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = 1.0 / _264;
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _282 = 1.0 / _276;
    float _284 = 1.0 / _272;
    float _286 = _244 * _278;
    bool _288 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_240);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -_260;
    float _302 = _300 + 1.0;
    float _304 = _298 * _302;
    float _306 = _248 * _282;
    bool _308 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_240);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_240);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -_298;
    float _342 = _340 + 1.0;
    float _344 = -_318;
    float _346 = _344 + 1.0;
    float _348 = _268 * _284;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _354;
    float _358 = _334 * _346;
    float _360 = fma(_322, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_356, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = _318 * _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = _360 * _358;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = fma(_338, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _406;
    float _410 = fma(_396, _366, _386);
    float _412 = fma(_394, _286, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_404, _286, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_408, _286, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = fma(_398, _366, _388);
    float _420 = fma(_400, _366, _390);
    float _422 = fma(_412, _304, _410);
    float _424 = fma(_414, _304, _418);
    float _426 = fma(_416, _304, _420);
    float _428 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].x, _422);
    float _430 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].y, _424);
    float _432 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[146].z, _426);
    bool _434 = !_280;
    float _452;
    if (!_434)
    {
        float _436 = in.m_61.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_122);
        float _458 = 1.0 / _456;
        float _460 = _156 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _462 + _464;
    float _468 = in.m_63.x;
    float _470 = in.m_63.y;
    float _472 = in.m_63.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = isnan(_462);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _494 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    bool _510 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_462);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _476;
    float _524 = -_488;
    float _526 = _524 + 1.0;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _530 = _504 * _526;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = 1.0 / _492;
    float _538 = _508 * _522;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = _432 * _472;
    float _546 = _430 * _470;
    float _548 = fma(_538, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _550 = _428 * _468;
    float _552 = _542 * _536;
    float _554 = _548 * _530;
    float _556 = -_520;
    float _558 = _556 + 1.0;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _462 + _560;
    float _564 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _566 = _488 * _558;
    float _568 = fma(_552, _562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _572 = fma(_568, _566, _564);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[117].x, _572);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _576;
    out.m_65.y = _586;
    out.m_65.z = _582;
    out.m_65.w = _584;
    bool _588 = !_528;
    int _590 = as_type<int>(_470);
    float _608;
    if (!_588)
    {
        float _592 = in.m_61.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_122);
        float _614 = 1.0 / _612;
        float _616 = _156 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _672 = _650 * _662;
    float _674 = fma(_672, _654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _678 = _674 * _664;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[131].x, _678);
    float _684 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[132].x, _682);
    float _686 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _686;
    out.m_67.y = _688;
    out.m_67.z = _690;
    out.m_67.w = _692;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_61.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[14].x, _156);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _156 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _726 = int(_724);
    float _728 = in.m_61.x;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _732 = _722 + _730;
    float _734 = float(_122);
    float _736 = in.m_61.y;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _740 = _738 != 0;
    float _742 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _746 = int(_744);
    float _748 = in.m_61.z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _752 = float(_726);
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _756 = int(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _764 = float(uint(_746));
    float _766 = 1.0 / _752;
    int _768 = ~_746;
    int _770 = _768 + 1;
    bool _772 = _746 == 0;
    bool _774 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _776 = isnan(_722);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _764;
    int _788 = ~_746;
    int _790 = _788 + 1;
    float _792 = -_784;
    float _794 = _792 + 1.0;
    float _796 = float(uint(_756));
    int _798 = ~_756;
    int _800 = _798 + 1;
    int _802 = ~_756;
    int _804 = _802 + 1;
    float _806 = _766 * _156;
    float _808 = 1.0 / _796;
    bool _810 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _812 = isnan(_722);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    bool _822 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _824 = isnan(_722);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    int _834 = ~_746;
    int _836 = _834 + 1;
    int _838 = as_type<int>(_786) + (-2);
    float _840 = trunc(_806);
    int _842 = int(_840);
    float _844 = -_832;
    float _846 = _844 + 1.0;
    bool _848 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _850 = isnan(_722);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = 1.0 / _734;
    float _862 = float(uint(_842));
    float _864 = 1.0 / _760;
    float _866 = as_type<float>(_838) * _862;
    float _868 = trunc(_866);
    float _870 = precise::max(_868, 0.0);
    uint _873 = uint(_870);
    int _875 = _790 * int(_873);
    int _877 = _875 + _842;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _881 = int(_879);
    float _883 = float(uint(_877));
    float _885 = as_type<float>(_877);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _889 = _728;
    float _891 = _742;
    if (_740)
    {
        _885 = 1.0;
    }
    float _893 = _885;
    float _895 = _893;
    if (!_740)
    {
        _895 = 7.345489978790283203125;
    }
    float _897 = _895;
    float _899 = as_type<float>(_838) * _883;
    float _901 = trunc(_899);
    float _903 = precise::max(_901, 0.0);
    uint _905 = uint(_903);
    float _907 = _897 * _728;
    float _909 = float(_881);
    float _911 = 1.0 / _909;
    float _913 = float(_842);
    float _915 = floor(_907);
    int _917 = int(_873) + int(_905);
    float _919 = float(_746);
    int _921 = _770 * _917;
    int _923 = _921 + _842;
    bool _925 = _913 >= _919;
    bool _927 = isnan(_913);
    bool _929 = _925 || _927;
    bool _931 = isnan(_919);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = _911 * _156;
    bool _939 = uint(_923) >= uint(_746);
    float _941 = trunc(_935);
    int _943 = int(_941);
    bool _945 = !_939;
    int _947 = _945 ? 0 : (-1);
    float _949 = -_915;
    float _951 = _907 + _949;
    int _953 = ~_917;
    int _955 = _953 + _947;
    int _957 = _955 + 1;
    float _959 = trunc(_937);
    int _961 = int(_959);
    float _963 = _951 * _919;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _967 = _965 != 0;
    float _969 = _919 * _156;
    bool _971 = !_967;
    int _973 = _971 ? 0 : 1;
    float _975 = _969 * _860;
    float _977 = trunc(_963);
    int _979 = int(_977);
    int _981 = as_type<int>(_808) + (-2);
    int _983 = abs(_973);
    int _985 = _746 * _957;
    int _987 = _985 + _842;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _991 = _989 != 0;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _995 = _993 != 0;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _999 = _997 != 0;
    float _1001 = trunc(_975);
    int _1003 = int(_1001);
    float _1005 = float(uint(_961));
    int _1007 = ~_943;
    int _1009 = _1007 + 1;
    int _1011 = _1009 + 1;
    bool _1013 = !_772;
    int _1015 = _1013 ? _987 : (-1);
    float _1017 = as_type<float>(_981) * _1005;
    int _1019 = _746 + (-1);
    int _1021 = _979 * _983;
    int _1023 = _1021 + _842;
    bool _1025 = !_995;
    int _1027 = _1025 ? 0 : 1;
    int _1029 = _1015 * _1011;
    bool _1031 = !_991;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = trunc(_1017);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    int _1041 = abs(_1027);
    int _1043 = _943 * _1019;
    int _1045 = _1043 + _1029;
    bool _1047 = !_999;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1053 = _1051 != 0;
    int _1055 = abs(_1033);
    int _1057 = abs(_1049);
    int _1059 = _1045 * _1041;
    bool _1061 = !_1053;
    int _1063 = _1061 ? 0 : 1;
    int _1065 = _1003 * _1055;
    int _1067 = _1065 + _1059;
    int _1069 = abs(_1063);
    int _1071 = _800 * int(_1039);
    int _1073 = _1071 + _961;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1077 = _1075 != 0;
    int _1079 = _1023 * _1057;
    int _1081 = _1079 + _1067;
    float _1083 = in.m_61.w;
    float _1085 = float(uint(_1073));
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    int _1091 = _979 * _1069;
    int _1093 = _1091 + _1081;
    bool _1095 = _756 == 0;
    float _1097 = as_type<float>(_981) * _1085;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1101 = _1099 != 0;
    float _1103 = float(uint(_1093));
    float _1105 = as_type<float>(_1073);
    int _1107 = as_type<int>(_1103);
    bool _1109 = _1053;
    float _1111 = as_type<float>(_981);
    if (_1077)
    {
        _1105 = _728;
    }
    float _1113 = _1105;
    float _1115 = trunc(_1097);
    float _1117 = precise::max(_1115, 0.0);
    uint _1119 = uint(_1117);
    float _1121 = _1113;
    if (_1077)
    {
        _887 = 1.0;
    }
    float _1123 = _887;
    float _1125 = as_type<float>(_838) * _1103;
    float _1127 = _1123;
    if (!_1077)
    {
        _1121 = _736;
    }
    float _1129 = _1121;
    if (_1089)
    {
        float _1131 = -_178;
        float _1133 = _1131 + 1.0;
        _1107 = as_type<int>(_1133);
    }
    int _1135 = _1107;
    if (!_1077)
    {
        _1127 = 1.2345600128173828125;
    }
    float _1137 = _1127;
    if (_1089)
    {
        bool _1139 = _728 > 0.5;
        _1109 = _1139;
    }
    bool _1141 = _1109;
    float _1143 = trunc(_1125);
    float _1145 = precise::max(_1143, 0.0);
    uint _1147 = uint(_1145);
    float _1149 = 0.0;
    if (!_1089)
    {
        _1149 = _178;
    }
    float _1151 = _1149;
    float _1153 = _1129 * _1137;
    int _1155 = ~_746;
    int _1157 = _1155 + 1;
    int _1159 = 0;
    float _1161 = _1151;
    if (_1101)
    {
        float _1163 = -_178;
        float _1165 = _1163 + 1.0;
        _1159 = as_type<int>(_1165);
    }
    int _1167 = _1159;
    if (_1089)
    {
        float _1169 = _1141 ? as_type<float>(_1135) : _178;
        _1161 = _1169;
    }
    float _1171 = _1161;
    bool _1173 = _1083 > 0.5;
    float _1175 = floor(_1153);
    int _1177 = int(_1039) + int(_1119);
    float _1179 = float(_756);
    int _1181 = _804 * _1177;
    int _1183 = _1181 + _961;
    float _1185 = float(_961);
    int _1187 = _1157 * int(_1147);
    int _1189 = _1187 + _1093;
    bool _1191 = _736 > 0.5;
    float _1193 = _1179 * _156;
    bool _1195 = _1185 >= _1179;
    bool _1197 = isnan(_1185);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(_1179);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = float(uint(_1189));
    float _1209 = _1193 * _860;
    bool _1211 = uint(_1183) >= uint(_756);
    float _1213 = -_1175;
    float _1215 = _1153 + _1213;
    float _1217 = trunc(_1205);
    int _1219 = int(_1217);
    float _1221 = as_type<float>(_838) * _1207;
    bool _1223 = !_1211;
    int _1225 = _1223 ? 0 : (-1);
    float _1227 = -_182;
    float _1229 = _1227 + 1.0;
    float _1231 = _1179 * _1215;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1235 = _1233 != 0;
    int _1237 = ~_1177;
    int _1239 = _1237 + _1225;
    int _1241 = _1239 + 1;
    float _1243 = trunc(_1221);
    float _1245 = precise::max(_1243, 0.0);
    uint _1247 = uint(_1245);
    int _1249 = _1191 ? as_type<int>(_1229) : as_type<int>(_182);
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    int _1255 = _756 * _1241;
    int _1257 = _1255 + _961;
    int _1259 = ~_746;
    int _1261 = _1259 + 1;
    bool _1263 = !_1235;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = trunc(_1231);
    int _1269 = int(_1267);
    float _1271 = _1253 ? as_type<float>(_1249) : _182;
    bool _1273 = !_1095;
    int _1275 = _1273 ? _1257 : (-1);
    bool _1277 = _748 > 0.5;
    int _1279 = int(_1147) + int(_1247);
    int _1281 = abs(_1265);
    int _1283 = ~_1219;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    int _1289 = _1261 * _1279;
    int _1291 = _1289 + _1093;
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1299 = _1297 != 0;
    int _1301 = _1287 * _1275;
    int _1303 = _756 + (-1);
    bool _1305 = !_1299;
    int _1307 = _1305 ? 0 : 1;
    int _1309 = _1269 * _1281;
    int _1311 = _1309 + _961;
    bool _1313 = uint(_1291) >= uint(_746);
    int _1315 = _1219 * _1303;
    int _1317 = _1315 + _1301;
    float _1319 = 0.0;
    if (!_1101)
    {
        _1319 = _178;
    }
    float _1321 = _1319;
    float _1323 = trunc(_1209);
    int _1325 = int(_1323);
    float _1327 = _1321;
    if (_1101)
    {
        float _1329 = _1277 ? as_type<float>(_1167) : _178;
        _1327 = _1329;
    }
    float _1331 = _1327;
    bool _1333 = !_1313;
    int _1335 = _1333 ? 0 : (-1);
    int _1337 = abs(_1307);
    bool _1339 = !_1295;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1345 = _1343 != 0;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1349 = _1347 != 0;
    float _1351 = _748 * 2.0;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1355 = _1353 != 0;
    int _1357 = ~_1279;
    int _1359 = _1357 + _1335;
    int _1361 = _1359 + 1;
    int _1363 = abs(_1341);
    int _1365 = _746 * _1361;
    int _1367 = _1365 + _1093;
    int _1369 = _1173 ? as_type<int>(_1229) : as_type<int>(_182);
    int _1371 = _1317 * _1337;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1375 = _1373 != 0;
    bool _1377 = !_1345;
    int _1379 = _1377 ? 0 : 1;
    int _1381 = _1325 * _1363;
    int _1383 = _1381 + _1371;
    bool _1385 = _746 == 0;
    float _1387 = _1375 ? as_type<float>(_1369) : _182;
    if (_1355)
    {
        float _1389 = _1277 ? _1229 : _182;
        _210 = _1389;
    }
    float _1391 = _210;
    bool _1393 = !_1385;
    int _1395 = _1393 ? _1367 : (-1);
    int _1397 = abs(_1379);
    float _1399 = floor(_1351);
    bool _1401 = !_1349;
    int _1403 = _1401 ? 0 : 1;
    int _1405 = _1395 & 3;
    bool _1407 = _1405 != 0;
    int _1409 = _1311 * _1397;
    int _1411 = _1409 + _1383;
    int _1413 = abs(_1403);
    bool _1415 = uint(_1405) > 1u;
    int _1417 = _1395 & 3;
    bool _1419 = _1417 != 0;
    int _1421 = _1269 * _1413;
    int _1423 = _1421 + _1411;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1427 = _1425 != 0;
    float _1429 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1431 = _1419 ? 0 : 1;
    bool _1433 = _736 > 0.5;
    bool _1435 = _1433 && _1427;
    float _1437 = -_750;
    float _1439 = fma(_1429, 2.0, _1437);
    float _1441 = float(uint(_1423));
    float _1443 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1445 = ~_1431;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    int _1451 = _1449;
    if (!_1415)
    {
        int _1453 = ~_1431;
        int _1455 = _1453 + 1;
        _1451 = _1455;
    }
    int _1457 = _1451;
    float _1459 = as_type<float>(_981) * _1441;
    float _1461 = fma(_1443, -2.0, _762);
    float _1463 = 0.0;
    if (!_1427)
    {
        _1463 = _178;
    }
    float _1465 = _1463;
    int _1467 = ~_756;
    int _1469 = _1467 + 1;
    float _1471 = trunc(_1459);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = _1465;
    if (_1435)
    {
        float _1479 = -_178;
        float _1481 = _1479 + 1.0;
        _212 = _1481;
    }
    float _1483 = _212;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1489 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1461);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1493 = _1491 != 0;
    if (_1427)
    {
        _1477 = _1483;
    }
    float _1495 = _1477;
    float _1497 = _736 * 2.0;
    bool _1499 = _1399 >= 0.0;
    bool _1501 = isnan(_1399);
    bool _1503 = _1499 || _1501;
    bool _1505 = isnan(0.0);
    bool _1507 = _1503 || _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1515 = _1513 != 0;
    float _1517 = floor(_1497);
    int _1519 = _1507 ? 0 : 1;
    bool _1521 = _1399 > 0.0;
    int _1523 = _1469 * int(_1475);
    int _1525 = _1523 + _1423;
    float _1527 = 1.0 / _1487;
    float _1529 = float(uint(_1525));
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1535 = ~_1519;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1545;
    bool _1549 = uint(_1405) >= 2u;
    float _1551 = 1.0 / _1533;
    int _1553 = _1539;
    if (!_1521)
    {
        int _1555 = ~_1519;
        int _1557 = _1555 + 1;
        _1553 = _1557;
    }
    int _1559 = _1553;
    float _1561 = as_type<float>(_981) * _1529;
    bool _1563 = _1517 >= 0.0;
    bool _1565 = isnan(_1517);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan(0.0);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1585 = _1571 ? 0 : 1;
    float _1587 = 1.0 / _1511;
    bool _1589 = _1517 > 0.0;
    float _1591 = _736 + _748;
    float _1593 = float(uint(_1023));
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1603 = 1.0 / _1543;
    float _1605 = _1579 * _1551;
    float _1607 = _1597 * _864;
    float _1609 = _1601 * _1527;
    float _1611 = _1591 + (-1.0);
    int _1613 = ~_756;
    int _1615 = _1613 + 1;
    float _1617 = as_type<float>(_838) * _1593;
    float _1619 = trunc(_1561);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    float _1625 = _1547 * _1587;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (_1077)
    {
        _590 = 0;
    }
    int _1635 = _590;
    float _1637 = 1.0 / _1629;
    int _1639 = ~_1585;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    float _1645 = _1633 * _1603;
    int _1647 = _1643;
    int _1649 = _1635;
    if (!_1589)
    {
        int _1651 = ~_1585;
        int _1653 = _1651 + 1;
        _1647 = _1653;
    }
    int _1655 = _1647;
    float _1657 = _728 * 2.0;
    if (!_1077)
    {
        _1649 = 2;
    }
    int _1659 = _1649;
    bool _1661 = !_1407;
    int _1663 = _1661 ? 0 : 1;
    float _1665 = 1.0 / _1575;
    int _1667 = int(_1475) + int(_1623);
    float _1669 = _728 + _736;
    int _1671 = _1549 ? 0 : 1;
    int _1673 = _1615 * _1667;
    int _1675 = _1673 + _1423;
    float _1677 = _1669 + (-1.0);
    float _1679 = floor(_1657);
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1681;
    float _1685 = float(_1655);
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1689 = uint(_1675) >= uint(_756);
    float _1691 = _1683 * _1637;
    float _1693 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1695 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1697 = isnan(_722);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1583 * _1665;
    bool _1709 = !_1689;
    int _1711 = _1709 ? 0 : (-1);
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1715 = _722 + _1713;
    bool _1717 = _1405 != 3;
    float _1719 = _1705 * _794;
    int _1721 = as_type<int>(_1665);
    if (_1077)
    {
        _1721 = 0;
    }
    int _1723 = _1721;
    float _1725 = -_1705;
    float _1727 = _1725 + 1.0;
    int _1729 = _1723;
    if (!_1077)
    {
        _1729 = 1;
    }
    int _1731 = _1729;
    float _1733 = fma(_1625, _1715, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1735 = !_1717;
    int _1737 = _1735 ? 0 : (-1);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1741 = _722 + _1739;
    int _1743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1745 = _1743 != 0;
    int _1747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1749 = _1747 != 0;
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1753 = _1751 != 0;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1757 = _722 + _1755;
    bool _1759 = _1679 > 0.0;
    float _1761 = trunc(_1617);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    bool _1767 = _1679 >= 0.0;
    bool _1769 = isnan(_1679);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.0);
    bool _1775 = _1771 || _1773;
    float _1777 = fma(_1607, _1757, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1779 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1781 = isnan(_722);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = fma(_1645, _1741, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1793 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1795 = isnan(_722);
    bool _1797 = _1793 || _1795;
    bool _1799 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1801 = _1797 || _1799;
    float _1803 = float(_1801);
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1807 = _722 + _1805;
    bool _1809 = !_1745;
    int _1811 = _1809 ? 0 : 1;
    float _1813 = _1789 * _1727;
    float _1815 = -_1789;
    float _1817 = _1815 + 1.0;
    float _1819 = -_1803;
    float _1821 = _1819 + 1.0;
    float _1823 = fma(_1609, _1807, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1825 = _1659 != 2;
    float _1827 = _1803 * _1817;
    float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1831 = _722 + _1829;
    float _1833 = _820 * _1821;
    float _1835 = -_820;
    float _1837 = _1835 + 1.0;
    int _1839 = _836 * int(_1765);
    int _1841 = _1839 + _1023;
    float _1843 = fma(_1605, _1831, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1845 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1847 = isnan(_722);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1853 = _1849 || _1851;
    float _1855 = float(_1853);
    float _1857 = _832 * _1837;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1861 = _722 + _1859;
    bool _1863 = !_1753;
    int _1865 = _1863 ? 0 : 1;
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1869 = _1855 * _846;
    float _1871 = -_1855;
    float _1873 = _1871 + 1.0;
    float _1875 = fma(_1707, _1861, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1877 = _1775 ? 0 : 1;
    float _1879 = fma(_1691, _732, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1881 = _858 * _1873;
    float _1883 = float(uint(_1841));
    float _1885 = -_858;
    float _1887 = _1885 + 1.0;
    bool _1889 = _1731 != 1;
    float _1891 = _1733 * _1881;
    float _1893 = as_type<float>(_1731);
    if (_1825)
    {
        _1893 = _728;
    }
    float _1895 = _1893;
    float _1897 = as_type<float>(_838) * _1883;
    float _1899 = _1895;
    if (!_1825)
    {
        _1899 = _748;
    }
    float _1901 = _1899;
    float _1903 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1891);
    int _1905 = abs(_1811);
    float _1907 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1909 = abs(_1865);
    float _1911 = trunc(_1897);
    float _1913 = precise::max(_1911, 0.0);
    uint _1915 = uint(_1913);
    float _1917 = fma(_1791, _1869, _1903);
    int _1919 = ~_1877;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    float _1925 = fma(_1907, _1495, -0.5);
    int _1927 = _1923;
    if (!_1759)
    {
        int _1929 = ~_1877;
        int _1931 = _1929 + 1;
        _1927 = _1931;
    }
    int _1933 = _1927;
    float _1935 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1937 = _1405 != 3;
    float _1939 = fma(_1777, _1857, _1917);
    float _1941 = float(_1559);
    float _1943 = in.m_69.y;
    float _1945 = float(_1909);
    float _1947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1949 = !_1749;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = fma(_1823, _1833, _1939);
    float _1955 = float(_1933);
    float _1957 = _1945 * _1685;
    int _1959 = int(_1765) + int(_1915);
    float _1961 = fma(_1843, _1827, _1953);
    float _1963 = in.m_48.x;
    float _1965 = in.m_48.y;
    float _1967 = in.m_48.z;
    int _1969 = ~_746;
    int _1971 = _1969 + 1;
    float _1973 = float(uint(_1311));
    int _1975 = abs(_1951);
    float _1977 = as_type<float>(_981) * _1973;
    int _1979 = ~_1667;
    int _1981 = _1979 + _1711;
    int _1983 = _1981 + 1;
    float _1985 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1987 = ~_1671;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    int _1993 = _1971 * _1959;
    int _1995 = _1993 + _1023;
    int _1997 = _1991;
    float _1999 = _1977;
    if (_1937)
    {
        int _2001 = ~_1671;
        int _2003 = _2001 + 1;
        _1997 = _2003;
    }
    int _2005 = _1997;
    float _2007 = trunc(_1977);
    float _2009 = precise::max(_2007, 0.0);
    uint _2011 = uint(_2009);
    float _2013 = float(_1905);
    int _2015 = _756 * _1983;
    int _2017 = _2015 + _1423;
    float _2019 = float(_1975);
    float _2021 = fma(_1985, _1391, -0.5);
    bool _2023 = uint(_1995) >= uint(_746);
    float _2025 = _2013 * _1941;
    int _2027 = ~_756;
    int _2029 = _2027 + 1;
    float _2031 = _2019 * _1955;
    bool _2033 = _756 == 0;
    float _2035 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2037 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2039 = _1965 + _1943;
    bool _2041 = !_2033;
    int _2043 = _2041 ? _2017 : (-1);
    float _2045 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2035);
    float _2047 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2037);
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2051 = _2039 + _2049;
    int _2053 = _2029 * int(_2011);
    int _2055 = _2053 + _1311;
    float _2057 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2045);
    float _2059 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2047);
    float _2061 = _2051 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2063 = !_2023;
    int _2065 = _2063 ? 0 : (-1);
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2069 = _2059 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2071 = _2043 & 3;
    bool _2073 = _2071 != 0;
    float _2075 = _2025 * (-2.0);
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2079 = _2067 + _2077;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2083 = _2069 + _2081;
    float _2085 = float(uint(_2055));
    float _2087 = _2031 * (-2.0);
    float _2089 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2061);
    int _2091 = _1395 >> 31;
    float _2093 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2089);
    int _2095 = _2073 ? 0 : 1;
    float _2097 = as_type<float>(_981) * _2085;
    int _2099 = _2043 >> 31;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2103 = _2093 >= 0.0;
    float _2105 = fma(_1693, _2087, _1693);
    int _2107 = _2091 & 3;
    float _2109 = trunc(_2097);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = _2099 & 3;
    float _2117 = -_2101;
    float _2119 = fma(_1935, 2.0, _2117);
    int _2121 = _1395 + _2107;
    float _2123 = -_156;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2119);
    int _2127 = _2043 + _2115;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2131 = _2061;
    float _2133 = _1963;
    if (!_1889)
    {
        _2131 = _736;
    }
    float _2135 = _2131;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2139 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2129);
    float _2141 = _2135;
    if (!_1889)
    {
        _1111 = _748;
    }
    float _2143 = _1111;
    float _2145 = _2143;
    if (_2103)
    {
        out.m_51.x = 0.0;
    }
    if (_1889)
    {
        _2145 = _736;
    }
    float _2147 = _2145;
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2151 = _2127 >> 2;
    float _2153 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2139);
    if (!_1889)
    {
        _1999 = _2135;
    }
    float _2155 = _1999;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2137);
    float _2159 = _2155;
    if (_1889)
    {
        _2141 = _728;
    }
    float _2161 = _2141;
    float _2163 = in.m_71.x;
    float _2165 = in.m_71.y;
    float _2167 = in.m_71.z;
    int _2169 = _2121 >> 2;
    float _2171 = fma(_2153, _1925, _2125);
    int _2173 = _2151 << 4;
    int _2175 = _2173 + 512;
    float _2177 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2149);
    int _2179 = _2169 << 4;
    int _2181 = _2179 + 368;
    float _2183 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2157);
    if (_1889)
    {
        _2159 = _728;
    }
    float _2185 = _2159;
    uint _2187 = uint(int(uint(_2175) >> uint(2)));
    uint _2189 = uint(int(uint(int(_2187)) >> uint(2)));
    int _2191 = int(_2187) & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = int(_2187) + 1;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    int _2199 = _2195 & 3;
    float _2201 = (*spvDescriptorSet0.vp_c9)._m0[int(_2197)][_2199];
    float _2203 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2177);
    int _2205 = ~_756;
    int _2207 = _2205 + 1;
    float _2209 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2211 = int(_2011) + int(_2113);
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1889)
    {
        _2215 = _748;
    }
    float _2217 = _2215;
    uint _2219 = uint(int(uint(_2181) >> uint(2)));
    uint _2221 = uint(int(uint(int(_2219)) >> uint(2)));
    int _2223 = int(_2219) & 3;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[int(_2221)][_2223];
    int _2227 = int(_2219) + 1;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    int _2231 = _2227 & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    float _2235 = _2217;
    if (_1889)
    {
        _2235 = _736;
    }
    float _2237 = _2235;
    int _2239 = _2207 * _2211;
    int _2241 = _2239 + _1311;
    float _2243 = -_2213;
    float _2245 = fma(_2209, 2.0, _2243);
    int _2247 = ~_1959;
    int _2249 = _2247 + _2065;
    int _2251 = _2249 + 1;
    float _2253 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2255 = uint(_2241) >= uint(_756);
    int _2257 = _2181 + 8;
    uint _2259 = uint(int(uint(_2257) >> uint(2)));
    uint _2261 = uint(int(uint(int(_2259)) >> uint(2)));
    int _2263 = int(_2259) & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    int _2267 = int(_2259) + 1;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    int _2271 = _2267 & 3;
    float _2273 = (*spvDescriptorSet0.vp_c9)._m0[int(_2269)][_2271];
    float _2275 = fma(_1687, _2075, _1687);
    float _2277 = fma(_2075, _2163, _2163);
    bool _2279 = !_2255;
    int _2281 = _2279 ? 0 : (-1);
    float _2283 = fma(_2087, _2165, _2165);
    bool _2285 = uint(_2071) > 1u;
    int _2287 = _746 * _2251;
    int _2289 = _2287 + _1023;
    int _2291 = abs(_1457);
    int _2293 = _2175 + 8;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    uint _2297 = uint(int(uint(int(_2295)) >> uint(2)));
    int _2299 = int(_2295) & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    int _2303 = int(_2295) + 1;
    uint _2305 = uint(int(uint(_2303) >> uint(2)));
    int _2307 = _2303 & 3;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[int(_2305)][_2307];
    int _2311 = ~_2095;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = -_156;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2245);
    int _2321 = ~_2211;
    int _2323 = _2321 + _2281;
    int _2325 = _2323 + 1;
    int _2327 = abs(_1663);
    int _2329 = _756 * _2325;
    int _2331 = _2329 + _1311;
    int _2333 = ~_2291;
    int _2335 = _2333 + 1;
    int _2337 = _2335 + 1;
    int _2339 = _2315;
    if (!_2285)
    {
        int _2341 = ~_2095;
        int _2343 = _2341 + 1;
        _2339 = _2343;
    }
    int _2345 = _2339;
    bool _2347 = uint(_2071) >= 2u;
    int _2349 = abs(_2345);
    int _2351 = _2347 ? 0 : 1;
    int _2353 = _2043 & 3;
    bool _2355 = _2353 != 0;
    int _2357 = ~_2349;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    bool _2363 = !_2355;
    int _2365 = _2363 ? 0 : 1;
    bool _2367 = _2071 != 3;
    int _2369 = abs(_2365);
    int _2371 = abs(_2005);
    int _2373 = _2361 * as_type<int>(_2201);
    int _2375 = ~_2327;
    int _2377 = _2375 + 1;
    int _2379 = _2377 + 1;
    int _2381 = _2337 * as_type<int>(_2233);
    int _2383 = ~_2351;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2391 = int(_2389);
    int _2393 = ~_2371;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    int _2399 = _2379 * as_type<int>(_2225);
    int _2401 = _2399 + _2381;
    int _2403 = _2387;
    if (_2367)
    {
        int _2405 = ~_2351;
        int _2407 = _2405 + 1;
        _2403 = _2407;
    }
    int _2409 = _2403;
    int _2411 = ~_2369;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    int _2417 = _2397 * as_type<int>(_2265);
    int _2419 = _2417 + _2401;
    bool _2421 = _2071 != 3;
    float _2423 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2425 = int(_2423);
    int _2427 = abs(_2409);
    int _2429 = _2415 * as_type<int>(_2193);
    int _2431 = _2429 + _2373;
    bool _2433 = !_2421;
    int _2435 = _2433 ? 0 : (-1);
    int _2437 = abs(_1737);
    bool _2439 = !_1493;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2445 = log2(_2443);
    int _2447 = abs(_2435);
    int _2449 = abs(_2441);
    int _2451 = ~_2427;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2455 * as_type<int>(_2301);
    int _2459 = _2457 + _2431;
    int _2461 = ~_2437;
    int _2463 = _2461 + 1;
    int _2465 = _2463 + 1;
    int _2467 = ~_2447;
    int _2469 = _2467 + 1;
    int _2471 = _2469 + 1;
    float _2473 = _2445 * _156;
    float _2475 = float(uint(_2391));
    int _2477 = _2465 * as_type<int>(_2273);
    int _2479 = _2477 + _2419;
    int _2481 = _2471 * as_type<int>(_2309);
    int _2483 = _2481 + _2459;
    bool _2485 = !_1515;
    int _2487 = _2485 ? 0 : 1;
    float _2489 = 1.0 / _2475;
    int _2491 = abs(_2391);
    int _2493 = abs(_2425);
    int _2495 = ~_2449;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2425));
    float _2503 = exp2(_2473);
    int _2505 = abs(_2487);
    int _2507 = _2479 * _2499;
    bool _2509 = _746 == 0;
    float _2511 = 1.0 / _2501;
    int _2513 = ~_2505;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    bool _2519 = !_2509;
    int _2521 = _2519 ? _2289 : (-1);
    float _2523 = as_type<float>(_2465);
    float _2525 = as_type<float>(_2517);
    if (_2103)
    {
        _2523 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2527 = _2523;
    int _2529 = _2517 * _2483;
    float _2531 = float(uint(_2491));
    int _2533 = _2521 * _2449;
    int _2535 = _2533 + _2507;
    float _2537 = float(uint(_2493));
    int _2539 = as_type<int>(_2527);
    if (_2103)
    {
        float _2541 = _2527 * 5.0;
        _2539 = as_type<int>(_2541);
    }
    int _2543 = _2539;
    bool _2545 = !_2033;
    int _2547 = _2545 ? _2331 : (-1);
    float _2549 = fma(_1875, _1813, _1961);
    float _2551 = 1.0 / _2531;
    int _2553 = as_type<int>(_2489) + (-2);
    if (_2103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9143 = as_type<float>(_2543);
        out.gl_Position.z = _9143;
    }
    int _2555 = _2547 * _2505;
    int _2557 = _2555 + _2529;
    float _2559 = float(uint(_2535));
    float _2561 = fma(_1879, _1719, _2549);
    float _2563 = 1.0 / _2537;
    int _2565 = as_type<int>(_2511) + (-2);
    float _2567 = as_type<float>(_2553) * _2559;
    if (_1825)
    {
        _2525 = _736;
    }
    float _2569 = _2525;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2573 = _2569;
    if (!_1825)
    {
        _2573 = _728;
    }
    float _2575 = _2573;
    float _2577 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2561);
    float _2579 = float(uint(_2557));
    float _2581 = trunc(_2567);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    int _2587 = abs(_2557);
    float _2589 = _2575 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2591 = abs(_2535);
    float _2593 = as_type<float>(_2565) * _2579;
    float _2595 = fma(_2589, -2.0, _2571);
    int _2597 = as_type<int>(_2551) + (-2);
    out.m_73.x = _2577;
    int _2599 = as_type<int>(_2563) + (-2);
    float _2601 = trunc(_2593);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = float(uint(_2591));
    float _2609 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2595);
    float _2611 = float(uint(_2587));
    int _2613 = ~_2391;
    int _2615 = _2613 + 1;
    float _2617 = as_type<float>(_2597) * _2607;
    int _2619 = ~_2425;
    int _2621 = _2619 + 1;
    float _2623 = as_type<float>(_2599) * _2611;
    float _2625 = _728 + (-0.5);
    float _2627 = trunc(_2617);
    float _2629 = precise::max(_2627, 0.0);
    uint _2631 = uint(_2629);
    int _2633 = _2615 * int(_2585);
    int _2635 = _2633 + _2535;
    float _2637 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2277);
    int _2639 = _2621 * int(_2605);
    int _2641 = _2639 + _2557;
    int _2643 = ~_2491;
    int _2645 = _2643 + 1;
    float _2647 = float(uint(_2635));
    float _2649 = trunc(_2623);
    float _2651 = precise::max(_2649, 0.0);
    uint _2653 = uint(_2651);
    float _2655 = float(uint(_2641));
    int _2657 = ~_2493;
    int _2659 = _2657 + 1;
    float _2661 = as_type<float>(_2553) * _2647;
    float _2663 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2665 = as_type<float>(_2565) * _2655;
    float _2667 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2663);
    int _2669 = _2645 * int(_2631);
    int _2671 = _2669 + _2591;
    float _2673 = trunc(_2661);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    float _2679 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2667);
    bool _2681 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2683 = isnan(1.0);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2689 = _2685 || _2687;
    int _2691 = _2659 * int(_2653);
    int _2693 = _2691 + _2587;
    float _2695 = float(uint(_2671));
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2699 = 1.0 + _2697;
    float _2701 = -_2609;
    float _2703 = fma(_2679, _2021, _2701);
    float _2705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2707 = float(uint(_2693));
    float _2709 = as_type<float>(_2597) * _2695;
    float _2711 = trunc(_2665);
    float _2713 = precise::max(_2711, 0.0);
    uint _2715 = uint(_2713);
    float _2717 = -_2503;
    float _2719 = _2717 + 1.0;
    float _2721 = as_type<float>(_2599) * _2707;
    float _2723 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2705);
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2727 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2729 = isnan(0.0);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2735 = _2731 || _2733;
    float _2737 = 1.0 / _2699;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2741 = fma(_2253, -2.0, _2725);
    float _2743 = _2735 ? _2719 : 0.0;
    float _2745 = -_156;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1439);
    float _2749 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2739);
    int _2751 = int(_2585) + int(_2677);
    float _2753 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2723);
    float _2755 = trunc(_2709);
    float _2757 = precise::max(_2755, 0.0);
    uint _2759 = uint(_2757);
    int _2761 = ~_2425;
    int _2763 = _2761 + 1;
    float _2765 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2749);
    float _2767 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2741);
    int _2769 = int(_2605) + int(_2715);
    int _2771 = ~_2491;
    int _2773 = _2771 + 1;
    float _2775 = trunc(_2721);
    float _2777 = precise::max(_2775, 0.0);
    uint _2779 = uint(_2777);
    if (_2689)
    {
        float _2781 = _2743 * _2737;
        _160 = _2781;
    }
    float _2783 = _160;
    int _2785 = ~_2391;
    int _2787 = _2785 + 1;
    bool _2789 = _2425 == 0;
    float _2791 = fma(_2275, _2783, _2637);
    int _2793 = _2557 ^ _2425;
    int _2795 = _2787 * _2751;
    int _2797 = _2795 + _2535;
    int _2799 = int(_2631) + int(_2759);
    int _2801 = ~_2493;
    int _2803 = _2801 + 1;
    bool _2805 = uint(_2797) >= uint(_2391);
    int _2807 = int(_2653) + int(_2779);
    int _2809 = _2773 * _2799;
    int _2811 = _2809 + _2591;
    bool _2813 = !_2805;
    int _2815 = _2813 ? 0 : (-1);
    int _2817 = _2763 * _2769;
    int _2819 = _2817 + _2557;
    float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2823 = uint(_2811) >= uint(_2491);
    bool _2825 = uint(_2819) >= uint(_2425);
    int _2827 = _2803 * _2807;
    int _2829 = _2827 + _2587;
    int _2831 = ~_2751;
    int _2833 = _2831 + _2815;
    int _2835 = _2833 + 1;
    bool _2837 = !_2825;
    int _2839 = _2837 ? 0 : (-1);
    float _2841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2843 = _2535 ^ _2391;
    int _2845 = _2391 * _2835;
    int _2847 = _2845 + _2535;
    int _2849 = ~_2769;
    int _2851 = _2849 + _2839;
    int _2853 = _2851 + 1;
    bool _2855 = uint(_2829) >= uint(_2493);
    bool _2857 = _2391 == 0;
    int _2859 = _2425 * _2853;
    int _2861 = _2859 + _2557;
    uint _2863 = uint(int(uint(_2843) >> uint(31)));
    float _2865 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2867 = _2391 == 0;
    float _2869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2871 = !_2789;
    int _2873 = _2871 ? _2861 : (-1);
    float _2875 = fma(_2865, _1171, -0.5);
    bool _2877 = !_2823;
    int _2879 = _2877 ? 0 : (-1);
    bool _2881 = !_2855;
    int _2883 = _2881 ? 0 : (-1);
    bool _2885 = _2425 == 0;
    float _2887 = _2841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2889 = !_2857;
    int _2891 = _2889 ? _2847 : (-1);
    uint _2893 = uint(int(uint(_2793) >> uint(31)));
    float _2895 = fma(_2887, _1331, -0.5);
    float _2897 = float(_2873);
    int _2899 = ~_2879;
    int _2901 = _2799 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = _2869 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2907 = ~int(_2863);
    int _2909 = _2907 + 1;
    float _2911 = fma(_2887, _2897, _2319);
    int _2913 = ~_2883;
    int _2915 = _2807 + _2913;
    int _2917 = _2915 + 1;
    float _2919 = _2051 * _2051;
    float _2921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2923 = float(_2891);
    float _2925 = fma(_1271, _2905, -0.5);
    int _2927 = ~int(_2893);
    int _2929 = _2927 + 1;
    float _2931 = fma(_2203, _2895, _2911);
    int _2933 = _2903 ^ _2909;
    float _2935 = fma(_2865, _2923, _2747);
    int _2937 = _2917 ^ _2929;
    float _2939 = _742 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2941 = ~_2909;
    int _2943 = _2941 + _2933;
    int _2945 = _2943 + 1;
    float _2947 = fma(_2079, _2079, _2919);
    int _2949 = ~_2929;
    int _2951 = _2949 + _2937;
    int _2953 = _2951 + 1;
    float _2955 = fma(_2753, _2875, _2935);
    bool _2957 = !_2867;
    int _2959 = _2957 ? _2945 : (-1);
    float _2961 = fma(_2083, _2083, _2947);
    bool _2963 = !_2885;
    int _2965 = _2963 ? _2953 : (-1);
    float _2967 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2969 = float(_2959);
    float _2971 = _2703 + 0.5;
    float _2973 = float(_2965);
    float _2975 = rsqrt(_2961);
    float _2977 = fma(_1387, _2967, -0.5);
    float _2979 = -_1489;
    float _2981 = fma(_2905, _2969, _2979);
    float _2983 = _2171 + 0.5;
    float _2985 = -_2767;
    float _2987 = fma(_2967, _2973, _2985);
    float _2989 = fma(_2765, _2925, _2981);
    float _2991 = _2955 + 0.5;
    float _2993 = fma(_2183, _2977, _2987);
    float _2995 = _2931 + 0.5;
    float _2997 = _2989 + 0.5;
    out.m_75.x = _2983;
    out.m_75.y = _2971;
    float _2999 = _2993 + 0.5;
    float _3001 = _2939 * _2975;
    out.m_77.x = _2991;
    out.m_77.y = _2997;
    out.m_77.z = _2995;
    out.m_77.w = _2999;
    float _3003 = _736 + (-0.5);
    float _3005 = _2079 * _3001;
    float _3007 = _2051 * _3001;
    float _3009 = as_type<float>(_2929);
    if (_2103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3011 = -_3007;
    float _3013 = _2039 + _3011;
    float _3015 = -_3005;
    float _3017 = _2067 + _3015;
    float _3019 = _2083 * _3001;
    float _3021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3023 = _3013 + _3021;
    float _3025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3027 = _3017 + _3025;
    float _3029 = -_3019;
    float _3031 = _2069 + _3029;
    float _3033 = -_3007;
    float _3035 = _2051 + _3033;
    float _3037 = _3023 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3039 = _728 + _748;
    float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3043 = _3031 + _3041;
    float _3045 = _748 + (-0.5);
    float _3047 = fma(_3027, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3037);
    float _3049 = _3039 + (-1.0);
    float _3051 = _1957 * (-2.0);
    float _3053 = -_3005;
    float _3055 = _2079 + _3053;
    float _3057 = fma(_3043, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3047);
    float _3059 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3061 = fma(_3051, _2167, _2167);
    float _3063 = _3035 * _3035;
    float _3065 = fma(_3003, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2283);
    bool _3067 = _3057 >= 0.0;
    float _3069 = fma(_3059, _3051, _3059);
    float _3071 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3061);
    float _3073 = fma(_3055, _3055, _3063);
    float _3075 = -_3019;
    float _3077 = _2083 + _3075;
    float _3079 = fma(_2105, _2783, _3065);
    float _3081 = fma(_3069, _2783, _3071);
    float _3083 = _2791 * 0.15915493667125701904296875;
    float _3085 = fma(_3077, _3077, _3073);
    float _3087 = _3079 * 0.15915493667125701904296875;
    float _3089 = _3081 * 0.15915493667125701904296875;
    float _3091 = _3083 * 6.283185482025146484375;
    float _3093 = sin(_3091);
    float _3095 = _3071;
    if (_3067)
    {
        _3095 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3097 = _3095;
    int _3099 = as_type<int>(_3097);
    if (_3067)
    {
        out.m_51.x = 0.0;
    }
    if (_3067)
    {
        float _3101 = _3097 * 5.0;
        _3099 = as_type<int>(_3101);
    }
    int _3103 = _3099;
    float _3105 = _3083 * 6.283185482025146484375;
    float _3107 = cos(_3105);
    if (_3067)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9996 = as_type<float>(_3103);
        out.gl_Position.z = _9996;
    }
    float _3109 = _3087 * 6.283185482025146484375;
    float _3111 = sin(_3109);
    float _3113 = _3087 * 6.283185482025146484375;
    float _3115 = cos(_3113);
    float _3117 = _3089 * 6.283185482025146484375;
    float _3119 = sin(_3117);
    float _3121 = sqrt(_3085);
    if (_3067)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3123 = in.m_79.x;
    float _3125 = in.m_79.y;
    float _3127 = in.m_79.z;
    bool _3129 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _3131 = _2975 * _3121;
    bool _3133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _3135 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3137 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3139 = _3089 * 6.283185482025146484375;
    float _3141 = cos(_3139);
    float _3143 = _742 * _3131;
    float _3145 = _3131 * _3135;
    float _3147 = _3131 * _3137;
    float _3149 = _3093 * _3115;
    float _3151 = _3057;
    if (_3129)
    {
        float _3153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3151 = _3153;
    }
    float _3155 = _3151;
    float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3159 = _3157 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3161 = _3107 * _3111;
    float _3163 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3165 = _3163 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3167 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3169 = _3167 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3171 = -_3161;
    float _3173 = fma(_3119, _3149, _3171);
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _3177 = _3161;
    if (_3133)
    {
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _3175 = _3179;
    }
    float _3181 = _3175;
    float _3183 = -_3149;
    float _3185 = fma(_3119, _3161, _3183);
    float _3187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3125);
    if (_3133)
    {
        float _3189 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _3177 = _3189;
    }
    float _3191 = _3177;
    if (_3129)
    {
        float _3193 = _728 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _889 = _3193;
    }
    float _3195 = _889;
    float _3197 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3199 = _3197 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3201 = _3187 * _3145;
    float _3203 = 1.0 / _3169;
    float _3205 = _3093 * _3111;
    float _3207 = _3195;
    float _3209 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_3133)
    {
        float _3211 = fma(_3191, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _891 = _3211;
    }
    float _3213 = _891;
    float _3215 = _3213;
    if (_3129)
    {
        float _3217 = fma(_3195, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _3207 = _3217;
    }
    float _3219 = _3207;
    float _3221 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3223 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _3221;
    float _3225 = 1.0 / _3165;
    if (_3129)
    {
        float _3227 = _3219 * _3155;
        _3209 = _3227;
    }
    float _3229 = _3209;
    if (_3133)
    {
        float _3231 = _3213 * _3181;
        _3215 = _3231;
    }
    float _3233 = _3215;
    float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3237 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3235;
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3243 = _3107 * _3115;
    float _3245 = 1.0 / _3199;
    float _3247 = _3241 * _3203;
    float _3249 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3255 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3253;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3261 = fma(_3119, _3243, _3205);
    float _3263 = 1.0 / _3159;
    float _3265 = _3251 * _3225;
    float _3267 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3269 = _3267 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3271 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3273 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3271;
    float _3275 = fma(_3119, _3205, _3243);
    float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3279 = _3277 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3123);
    float _3283 = _3155;
    if (_3133)
    {
        float _3285 = floor(_3233);
        _3283 = _3285;
    }
    float _3287 = _3283;
    float _3289 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3291 = _3289 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3293 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3295 = _3293 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3297 = _3281 * _3143;
    float _3299 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3301 = _3299 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3303 = _3107 * _3141;
    float _3305 = _3115 * _3141;
    float _3307 = (*spvDescriptorSet0.vp_c9)._m0[182].x;
    float _3309 = _3295;
    if (_3129)
    {
        float _3311 = floor(_3229);
        _3307 = _3311;
    }
    float _3313 = _3307;
    float _3315 = _3093 * _3141;
    float _3317 = _3111 * _3141;
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3321 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _3319;
    float _3323 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3127);
    float _3325 = _3237 * _3245;
    float _3327 = _3295 * _3263;
    if (!_3133)
    {
        _3309 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3329 = _3309;
    float _3331 = 1.0 / _3259;
    float _3333 = _3329;
    if (_3133)
    {
        float _3335 = -_3287;
        float _3337 = _3233 + _3335;
        _3333 = _3337;
    }
    float _3339 = _3333;
    float _3341 = _3323 * _3147;
    if (!_3129)
    {
        _3009 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _3343 = _3009;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3349 = _3303 * _3201;
    float _3351 = _3315 * _3201;
    float _3353 = 1.0 / _3279;
    float _3355 = _3343;
    if (_3129)
    {
        float _3357 = -_3313;
        float _3359 = _3229 + _3357;
        _3355 = _3359;
    }
    float _3361 = _3355;
    float _3363 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3365 = _3339 + _3363;
    float _3367 = fma(_3261, _3297, _3349);
    bool _3369 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3371 = isnan(_3339);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3377 = _3373 || _3375;
    float _3379 = float(_3377);
    float _3381 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3383 = _3361 + _3381;
    bool _3385 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3387 = isnan(_3361);
    bool _3389 = _3385 || _3387;
    bool _3391 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3393 = _3389 || _3391;
    float _3395 = float(_3393);
    float _3397 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _3399 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _3397;
    float _3401 = 1.0 / _3291;
    float _3403 = _3365 * _3331;
    float _3405 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3407 = _3361 + _3405;
    float _3409 = fma(_3247, _3383, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    bool _3411 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3413 = isnan(_3361);
    bool _3415 = _3411 || _3413;
    bool _3417 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3419 = _3415 || _3417;
    float _3421 = float(_3419);
    float _3423 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _3425 = _3423 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3427 = fma(_3325, _3407, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3429 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3431 = _3361 + _3429;
    float _3433 = 1.0 / _3301;
    float _3435 = _3255 * _3353;
    float _3437 = fma(_3327, _3431, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3439 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3441 = _3361 + _3439;
    float _3443 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3445 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _3443;
    float _3447 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3449 = _3447 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3451 = 1.0 / _3321;
    float _3453 = _3269 * _3401;
    float _3455 = -_3201;
    float _3457 = _3119 * _3455;
    float _3459 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3461 = _3339 + _3459;
    float _3463 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3465 = _3339 + _3463;
    float _3467 = fma(_3453, _3441, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3469 = fma(_3305, _3297, _3457);
    float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3473 = _3361 + _3471;
    float _3475 = 1.0 / _3449;
    float _3477 = _3273 * _3433;
    float _3479 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3481 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _3479;
    float _3483 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3485 = _3339 + _3483;
    bool _3487 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3489 = isnan(_3361);
    bool _3491 = _3487 || _3489;
    bool _3493 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3495 = _3491 || _3493;
    float _3497 = float(_3495);
    float _3499 = fma(_3173, _3297, _3351);
    float _3501 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3503 = _3339 + _3501;
    float _3505 = fma(_3477, _3473, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3507 = 1.0 / _3347;
    float _3509 = _3461 * _3451;
    float _3511 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3513 = _3361 + _3511;
    bool _3515 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3517 = isnan(_3361);
    bool _3519 = _3515 || _3517;
    bool _3521 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3523 = _3519 || _3521;
    float _3525 = float(_3523);
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3529 = _3339 + _3527;
    bool _3531 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3533 = isnan(_3361);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3539 = _3535 || _3537;
    float _3541 = float(_3539);
    float _3543 = fma(_3435, _3513, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3545 = -_3395;
    float _3547 = _3545 + 1.0;
    float _3549 = 1.0 / _3445;
    float _3551 = _3485 * _3475;
    bool _3553 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3555 = isnan(_3361);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3561 = _3557 || _3559;
    float _3563 = float(_3561);
    float _3565 = _3497 * _3547;
    float _3567 = -_3497;
    float _3569 = _3567 + 1.0;
    bool _3571 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3573 = isnan(_3339);
    bool _3575 = _3571 || _3573;
    bool _3577 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3579 = _3575 || _3577;
    float _3581 = float(_3579);
    float _3583 = -_3541;
    float _3585 = _3583 + 1.0;
    float _3587 = fma(_3399, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _3589 = 1.0 / _3223;
    float _3591 = _3465 * _3507;
    float _3593 = -_3563;
    float _3595 = _3593 + 1.0;
    float _3597 = fma(_3185, _3341, _3367);
    float _3599 = fma(_3317, _3341, _3469);
    float _3601 = fma(_3425, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _3603 = _3395 * _3595;
    float _3605 = _3525 * _3569;
    float _3607 = 1.0 / _3481;
    float _3609 = _3503 * _3549;
    float _3611 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3613 = _3361 + _3611;
    float _3615 = -_3525;
    float _3617 = _3615 + 1.0;
    bool _3619 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3621 = isnan(_3339);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3627 = _3623 || _3625;
    float _3629 = float(_3627);
    float _3631 = fma(_3275, _3341, _3499);
    float _3633 = fma(_3265, _3613, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3635 = -_3421;
    float _3637 = _3635 + 1.0;
    float _3639 = _3529 * _3589;
    bool _3641 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3643 = isnan(_3361);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3649 = _3645 || _3647;
    float _3651 = float(_3649);
    float _3653 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3655 = _3339 + _3653;
    float _3657 = _3563 * _3637;
    float _3659 = -_3629;
    float _3661 = _3659 + 1.0;
    bool _3663 = _3361 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3665 = isnan(_3361);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3671 = _3667 || _3669;
    float _3673 = float(_3671);
    float _3675 = _3651 * _3617;
    bool _3677 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3679 = isnan(_3339);
    bool _3681 = _3677 || _3679;
    bool _3683 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3685 = _3681 || _3683;
    float _3687 = float(_3685);
    float _3689 = _3655 * _3607;
    float _3691 = _3581 * _3661;
    float _3693 = _3427 * _3675;
    float _3695 = -_3581;
    float _3697 = _3695 + 1.0;
    float _3699 = -_3651;
    float _3701 = _3699 + 1.0;
    bool _3703 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3705 = isnan(_3339);
    bool _3707 = _3703 || _3705;
    bool _3709 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3711 = _3707 || _3709;
    float _3713 = float(_3711);
    float _3715 = _3421 * _3585;
    float _3717 = _3687 * _3697;
    float _3719 = -_3687;
    float _3721 = _3719 + 1.0;
    float _3723 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3693);
    float _3725 = -_3673;
    float _3727 = _3725 + 1.0;
    bool _3729 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3731 = isnan(_3339);
    bool _3733 = _3729 || _3731;
    bool _3735 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3737 = _3733 || _3735;
    float _3739 = float(_3737);
    float _3741 = -_3713;
    float _3743 = _3741 + 1.0;
    float _3745 = fma(_3409, _3605, _3723);
    float _3747 = _3541 * _3727;
    bool _3749 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3751 = isnan(_3339);
    bool _3753 = _3749 || _3751;
    bool _3755 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3757 = _3753 || _3755;
    float _3759 = float(_3757);
    float _3761 = _3713 * _3721;
    float _3763 = _3739 * _3743;
    float _3765 = -_3739;
    float _3767 = _3765 + 1.0;
    float _3769 = fma(_3633, _3565, _3745);
    bool _3771 = _3339 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3773 = isnan(_3339);
    bool _3775 = _3771 || _3773;
    bool _3777 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3779 = _3775 || _3777;
    float _3781 = float(_3779);
    float _3783 = _3759 * _3767;
    float _3785 = -_3759;
    float _3787 = _3785 + 1.0;
    float _3789 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3789;
    float _3793 = -_3781;
    float _3795 = _3793 + 1.0;
    float _3797 = _3781 * _3787;
    float _3799 = fma(_3791, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3801 = _3379 * _3795;
    float _3803 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3805 = _3803 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3807 = -_3379;
    float _3809 = _3807 + 1.0;
    float _3811 = _3799 * _3801;
    float _3813 = fma(_3805, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3815 = _3587 * _3801;
    float _3817 = fma(_3437, _3603, _3769);
    float _3819 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3811);
    float _3821 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3821;
    float _3825 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].y, _3815);
    float _3827 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _3829 = _3827 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3831 = fma(_3813, _3797, _3819);
    float _3833 = fma(_3823, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3835 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _3837 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _3835;
    float _3839 = fma(_3601, _3797, _3825);
    float _3841 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3843 = _3841 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3845 = fma(_3833, _3783, _3831);
    float _3847 = fma(_3837, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _3849 = fma(_3843, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3851 = fma(_3543, _3657, _3817);
    float _3853 = fma(_3847, _3783, _3839);
    float _3855 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3855;
    float _3859 = fma(_3829, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _3861 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _3863 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _3861;
    float _3865 = fma(_3849, _3763, _3845);
    float _3867 = fma(_3857, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3869 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3873 = fma(_3467, _3715, _3851);
    float _3875 = fma(_3859, _3763, _3853);
    float _3877 = fma(_3863, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _3879 = fma(_3867, _3761, _3865);
    float _3881 = fma(_3871, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3883 = fma(_3505, _3747, _3873);
    float _3885 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _3887 = _3885 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3889 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3889;
    float _3893 = fma(_3877, _3761, _3875);
    float _3895 = fma(_3881, _3717, _3879);
    float _3897 = fma(_3887, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _3899 = fma(_3891, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3901 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _3901;
    float _3905 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3907 = fma(_3673, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3883);
    float _3909 = fma(_3899, _3691, _3895);
    float _3911 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3913 = fma(_3897, _3717, _3893);
    float _3915 = fma(_3903, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _3917 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3905);
    float _3919 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3921 = _2069 + _3919;
    float _3923 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3909);
    float _3925 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _3927 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3911);
    float _3929 = fma(_3915, _3691, _3913);
    float _3931 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3917);
    float _3933 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3935 = _2067 + _3933;
    float _3937 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _3939 = -_3925;
    float _3941 = fma(_3923, _3921, _3939);
    float _3943 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3927);
    float _3945 = _3931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3947 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].y, _3929);
    float _3949 = -_3937;
    float _3951 = fma(_3923, _3935, _3949);
    float _3953 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3955 = _3597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3957 = fma(_3945, _3947, _3941);
    float _3959 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3961 = fma(_3953, _3947, _3951);
    float _3963 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3955);
    float _3965 = _3957 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _3967 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3959);
    float _3969 = _3961 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _3971 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3963);
    float _3973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3975 = _3965 + _3973;
    float _3977 = fma(_1967, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3967);
    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3981 = _3969 + _3979;
    float _3983 = _3971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3985 = _3975 * _3975;
    float _3987 = _3977 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3989 = _2039 + _3983;
    float _3991 = fma(_3981, _3981, _3985);
    float _3993 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _3995 = _3987 + _3993;
    float _3997 = _3907 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _3999 = -_3987;
    float _4001 = _3989 + _3999;
    float _4003 = sqrt(_3991);
    float _4005 = -_3997;
    float _4007 = fma(_3923, _3995, _4005);
    float _4009 = fma(_3947, _4001, _4007);
    float _4011 = _4009 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _4013 = _4003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4017 = _4003 + _4015;
    float _4019 = _3909;
    float _4021 = _3987;
    float _4023 = _3991;
    float _4025 = _3969;
    float _4027 = _3965;
    float _4029 = _4009;
    float _4031 = _4011;
    float _4033 = _3893;
    if (_4013)
    {
        float _4035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4035;
    }
    float _4037 = _4019;
    if (_4013)
    {
        float _4039 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4021 = _4039;
    }
    float _4041 = _4021;
    float _4043 = _4041;
    if (_4013)
    {
        float _4045 = rsqrt(_3991);
        _4023 = _4045;
    }
    float _4047 = _4023;
    if (_4013)
    {
        float _4049 = _4017 * _4037;
        _2133 = _4049;
    }
    float _4051 = _2133;
    float _4053 = _4051;
    if (_4013)
    {
        float _4055 = _4051 * 0.15915493667125701904296875;
        _4053 = _4055;
    }
    float _4057 = _4053;
    float _4059 = _3599;
    if (_4013)
    {
        float _4061 = _4057 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        _4059 = _4063;
    }
    float _4065 = _4059;
    if (_4013)
    {
        float _4067 = fma(_4065, _4041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4043 = _4067;
    }
    float _4069 = _4043;
    float _4071 = _4069;
    if (_4013)
    {
        float _4073 = _4047 * _4069;
        _4071 = _4073;
    }
    float _4075 = _4071;
    if (_4013)
    {
        float _4077 = fma(_3981, _4075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _4025 = _4077;
    }
    float _4079 = _4025;
    float _4081 = _4079;
    if (_4013)
    {
        float _4083 = fma(_3975, _4075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4027 = _4083;
    }
    float _4085 = _4027;
    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _4089 = _4079 + _4087;
    float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _4093 = _4085 + _4091;
    float _4095 = fma(_4089, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _11606 = float2(_4095, _4097);
    float _4099 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_11606, float2(0.0), isnan(_11606)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_11606, float2(0.0), isnan(_11606)), level(0.0)).x;
    float _4101 = _4057;
    float _4103 = _4089;
    float _4105 = _4093;
    float _4107 = _4085;
    if (_4013)
    {
        float _4109 = _4057 * 6.283185482025146484375;
        float _4111 = cos(_4109);
        _4101 = _4111;
    }
    float _4113 = _4101;
    if (!_4013)
    {
        _4103 = _4011;
    }
    float _4115 = _4103;
    float _4117 = -_2069;
    float _4119 = _4117 + _4085;
    float _4121 = _4115;
    if (_4013)
    {
        float _4123 = _4113 + (-1.0);
        _4105 = _4123;
    }
    float _4125 = _4105;
    if (_4013)
    {
        float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4029 = _4127;
    }
    float _4129 = _4029;
    if (_4013)
    {
        float _4131 = fma(_4011, _4113, _4129);
        _4121 = _4131;
    }
    float _4133 = _4121;
    float _4135 = -_2067;
    float _4137 = _4135 + _4079;
    float _4139 = -_2039;
    float _4141 = _4139 + _4133;
    float _4143 = _4141 * _4141;
    float _4145 = fma(_4137, _4137, _4143);
    float _4147 = fma(_4119, _4119, _4145);
    float _4149 = sqrt(_4147);
    bool _4151 = _4149 > 0.0;
    float _4153 = fma(_4099, 100.0, _4133);
    float _4155 = _4149;
    float _4157 = _4141;
    if (!_4151)
    {
        _4155 = _4153;
    }
    float _4159 = _4155;
    bool _4161 = !_4151;
    float _4163 = _4159;
    if (!_4161)
    {
        float _4165 = _204 * _204;
        float _4167 = fma(_202, _202, _4165);
        float _4169 = fma(_206, _206, _4167);
        float _4171 = rsqrt(_4147);
        float _4173 = sqrt(_4169);
        float _4175 = _4137 * _4171;
        float _4177 = _4141 * _4171;
        float _4179 = _4119 * _4171;
        bool _4181 = _4173 > 0.0;
        float _4183 = _4171;
        _4031 = _4179;
        if (!_4181)
        {
            _4183 = _4153;
        }
        float _4185 = _4183;
        bool _4187 = !_4181;
        _4163 = _4185;
        if (!_4187)
        {
            float _4189 = rsqrt(_4169);
            float _4191 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4193 = _204 * _4189;
            float _4195 = _202 * _4189;
            float _4197 = _206 * _4189;
            float _4199 = _4177 * _4193;
            float _4201 = fma(_4175, _4195, _4199);
            float _4203 = _4191 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4205 = fma(_4179, _4197, _4201);
            float _4207 = _4205 * _4203;
            float _4209 = fma(_202, _4207, _4079);
            float _4211 = fma(_204, _4207, _4153);
            float _4213 = fma(_206, _4207, _4085);
            _4163 = _4211;
            _4081 = _4209;
            _4107 = _4213;
        }
    }
    float _4215 = _4163;
    float _4217 = _4081;
    float _4219 = _4107;
    float _4221 = _4031;
    float _4223 = -_3007;
    float _4225 = _4223 + _4215;
    float _4227 = -_3005;
    float _4229 = _4227 + _4217;
    float _4231 = -_3019;
    float _4233 = _4231 + _4219;
    float _4235 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4237 = _4225 + _4235;
    float _4239 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4241 = _4229 + _4239;
    float _4243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4245 = _4233 + _4243;
    float _4247 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4249 = _4237 * _4237;
    float _4251 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4247);
    float _4253 = fma(_4241, _4241, _4249);
    float _4255 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4251);
    float _4257 = fma(_4245, _4245, _4253);
    float _4259 = _4255 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4261 = rsqrt(_4257);
    float _4263 = sqrt(_4257);
    float _4265 = _4261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4267 = _4241 * _4265;
    float _4269 = _4245 * _4265;
    float _4271 = _4267 * _4267;
    float _4273 = _4269 * _4269;
    float _4275 = _4271 + _4273;
    float _4277 = sqrt(_4275);
    bool _4279 = _4277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4283 = _4277 + _4281;
    float _4285 = _4245;
    float _4287 = _4275;
    float _4289 = _4283;
    float _4291 = _4219;
    if (_4279)
    {
        float _4293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4285 = _4293;
    }
    float _4295 = _4285;
    if (_4279)
    {
        float _4297 = rsqrt(_4275);
        _4287 = _4297;
    }
    float _4299 = _4287;
    float _4301 = _4299;
    if (_4279)
    {
        float _4303 = _4283 * _4295;
        _4289 = _4303;
    }
    float _4305 = _4289;
    if (_4279)
    {
        float _4307 = _4305 * 0.15915493667125701904296875;
        _4291 = _4307;
    }
    float _4309 = _4291;
    float _4311 = _4295;
    float _4313 = _4309;
    if (_4279)
    {
        float _4315 = _4309 * 6.283185482025146484375;
        float _4317 = sin(_4315);
        _4311 = _4317;
    }
    float _4319 = _4311;
    float _4321 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4323 = precise::max(0.0, _4321);
    float _4325 = _4221;
    float _4327 = _4323;
    if (_4279)
    {
        float _4329 = _4309 * 6.283185482025146484375;
        float _4331 = cos(_4329);
        _4325 = _4331;
    }
    float _4333 = _4325;
    float _4335 = -_4265;
    float _4337 = -_4323;
    float _4339 = fma(_4237, _4335, _4337);
    float _4341 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4279)
    {
        float _4343 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4327 = _4343;
    }
    float _4345 = _4327;
    float _4347 = _4345;
    if (!_4279)
    {
        _4313 = _4339;
    }
    float _4349 = _4313;
    float _4351 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4353 = _4319;
    float _4355 = _4349;
    if (_4279)
    {
        float _4357 = fma(_4319, _4345, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4353 = _4357;
    }
    float _4359 = _4353;
    float _4361 = floor(_4351);
    float _4363 = _4359;
    if (_4279)
    {
        float _4365 = _4333 + (-1.0);
        _4347 = _4365;
    }
    float _4367 = _4347;
    float _4369 = _4367;
    if (_4279)
    {
        float _4371 = _4299 * _4359;
        _4157 = _4371;
    }
    float _4373 = _4157;
    if (!_4279)
    {
        _4363 = _4267;
    }
    float _4375 = _4363;
    float _4377 = _4375;
    if (_4279)
    {
        float _4379 = _4367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4341 = _4379;
    }
    float _4381 = _4341;
    float _4383 = _4381;
    if (_4279)
    {
        float _4385 = _4267 * _4373;
        _4377 = _4385;
    }
    float _4387 = _4377;
    if (!_4279)
    {
        _4301 = _4269;
    }
    float _4389 = _4301;
    float _4391 = _4389;
    if (_4279)
    {
        float _4393 = _4269 * _4373;
        _4391 = _4393;
    }
    float _4395 = _4391;
    if (!_4279)
    {
        _4369 = _4271;
    }
    float _4397 = _4369;
    float _4399 = _4397;
    if (_4279)
    {
        float _4401 = fma(_4339, _4333, _4381);
        _4355 = _4401;
    }
    float _4403 = _4355;
    if (_4279)
    {
        float _4405 = _4387 * _4387;
        _4399 = _4405;
    }
    float _4407 = _4399;
    if (!_4279)
    {
        _4383 = _4273;
    }
    float _4409 = _4383;
    float _4411 = _4409;
    if (_4279)
    {
        float _4413 = _4395 * _4395;
        _4411 = _4413;
    }
    float _4415 = _4411;
    float _4417 = fma(_4403, _4403, _4407);
    float _4419 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4421 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4423 = fma(_3031, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4425 = _4417 + _4415;
    float _4427 = _4225 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4429 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4419);
    float _4431 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4421);
    float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4435 = fma(_4263, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4433);
    float _4437 = precise::clamp(_4435, 0.0, 1.0);
    float _4439 = fma(_4229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4427);
    float _4441 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4429);
    float _4443 = rsqrt(_4425);
    float _4445 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4431);
    float _4447 = fma(_4233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4439);
    float _4449 = _4441 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4451 = -_4437;
    float _4453 = _4451 + 1.0;
    float _4455 = _4445 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4457 = _4447 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4459 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4461 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4463 = _4455 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4465 = abs(_4453);
    float _4467 = log2(_4465);
    float _4469 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4459);
    float _4471 = -_4361;
    float _4473 = _4351 + _4471;
    float _4475 = -_4463;
    float _4477 = fma(_4475, _4461, 1.0);
    float _4479 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4481 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4469);
    float _4483 = _4443 * _4387;
    float _4485 = _4443 * _4403;
    float _4487 = _4443 * _4395;
    float _4489 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4481);
    float _4491 = _4483 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4493 = floor(_4423);
    float _4495 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4497 = -_4491;
    float _4499 = fma(_4485, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4497);
    float _4501 = _4467 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4503 = -_4487;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4499);
    float _4507 = log2(_4477);
    float _4509 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4495);
    float _4511 = _4485 + 1.0;
    float _4513 = fma(_4505, -0.5, 0.5);
    float _4515 = fma(_4505, 0.5, 0.5);
    float _4517 = exp2(_4501);
    float _4519 = -_4493;
    float _4521 = _4423 + _4519;
    float _4523 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4479);
    float _4525 = fma(_4515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4527 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4509);
    float _4529 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4523);
    float _4531 = fma(_4515, _4525, -0.212114393711090087890625);
    float _4533 = 1.0 / _4489;
    float _4535 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4527);
    float _4537 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4529);
    float _4539 = fma(_4515, _4531, 1.570728778839111328125);
    float _4541 = _4507 * 0.693147182464599609375;
    float _4543 = sqrt(_4513);
    float _4545 = -_4485;
    float _4547 = fma(_4517, _4511, _4545);
    float _4549 = _4541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4551 = fma(_4547, 0.5, 0.5);
    float _4553 = _4537 * _4533;
    float _4555 = _4535 * _4533;
    float _4557 = fma(_4553, 0.5, 0.5);
    float _4559 = fma(_4555, -0.5, 0.5);
    float _4561 = _4543 * 0.636619746685028076171875;
    float2 _12363 = float2(_4473, _4521);
    float _4563 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12363, float2(0.0), isnan(_12363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12363, float2(0.0), isnan(_12363)), level(0.0)).x;
    float _4565 = -_4539;
    float _4567 = fma(_4561, _4565, 1.0);
    float3 _12377 = float3(_4557, _4559, _4549);
    float _4569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12377, float3(0.0), isnan(_12377)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12377, float3(0.0), isnan(_12377)), level(0.0)).x;
    float3 _12388 = float3(_4557, _4559, _4549);
    float4 _4572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12388, float3(0.0), isnan(_12388)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12388, float3(0.0), isnan(_12388)), level(0.0)).xyzw;
    float _4574 = _4572.x;
    float _4576 = _4572.y;
    float _4578 = _4572.z;
    float _4580 = _4572.w;
    float2 _12404 = float2(_4567, _4551);
    float3 _4584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12404, float2(0.0), isnan(_12404)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12404, float2(0.0), isnan(_12404)), level(0.0)).xyz;
    float _4586 = _4584.x;
    float _4588 = _4584.y;
    float _4590 = _4584.z;
    float _4592 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4594 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4596 = _3261 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _4598 = _3125 != 0.0;
    bool _4600 = isnan(_3125);
    bool _4602 = _4598 || _4600;
    bool _4604 = isnan(0.0);
    bool _4606 = _4602 || _4604;
    float _4608 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4592);
    float _4610 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4594);
    float _4612 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4596);
    bool _4614 = _3123 == 0.0;
    bool _4616 = !_4606;
    bool _4618 = _4614 && _4616;
    float _4620 = in.m_81.x;
    float _4622 = in.m_81.y;
    float _4624 = in.m_81.z;
    float _4626 = fma(_4099, 100.0, _2039);
    bool _4628 = _3127 == 0.0;
    bool _4630 = _4628 && _4618;
    out.m_65.x = _576;
    out.m_65.y = _586;
    out.m_65.z = _582;
    out.m_65.w = _584;
    out.m_67.x = _686;
    out.m_67.y = _688;
    out.m_67.z = _690;
    out.m_67.w = _692;
    float _4632 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _4634 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _4632;
    float _4636 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4608);
    float _4638 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4610);
    float _4640 = in.m_83.x;
    float _4642 = in.m_83.y;
    float _4644 = in.m_83.z;
    float _4646 = in.m_83.w;
    float _4648 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4612);
    float _4650 = fma(_4634, _3509, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _4652 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _4654 = _4652 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _4656 = -_3007;
    float _4658 = _4656 + _4626;
    float _4660 = _4467 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4662 = _4650 * _3801;
    float _4664 = fma(_4654, _3591, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _4666 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4668 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4670 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4672 = _3185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4674 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4676 = -_3119;
    float _4678 = fma(_4676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4666);
    float _4680 = _3303 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4682 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4668);
    float _4684 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4670);
    float _4686 = fma(_3317, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4672);
    float _4688 = _4686;
    float _4690 = _4620;
    if (_4630)
    {
        _4033 = _4620;
    }
    float _4692 = _4033;
    float _4694 = -_3119;
    float _4696 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4674);
    float _4698 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4678);
    float _4700 = -_3119;
    float _4702 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4680);
    float _4704 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4682);
    float _4706 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4684);
    float _4708 = fma(_3275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4686);
    float _4710 = _4692;
    float _4712 = _4702;
    if (_4630)
    {
        _4688 = _4692;
    }
    float _4714 = _4688;
    float _4716 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4696);
    float _4718 = _4714;
    if (!_4630)
    {
        _4710 = _4620;
    }
    float _4720 = _4710;
    float _4722 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4702);
    if (_4630)
    {
        _4712 = _4622;
    }
    float _4724 = _4712;
    float _4726 = _4698 * _4642;
    float _4728 = _4724;
    if (!_4630)
    {
        float _4730 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4622);
        _4728 = _4730;
    }
    float _4732 = _4728;
    float _4734 = _4716 * _4642;
    float _4736 = _4722 * _4642;
    float _4738 = _4644 * _4720;
    if (_4630)
    {
        _4690 = _4624;
    }
    float _4740 = _4690;
    float _4742 = _4740;
    if (!_4630)
    {
        float _4744 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4720);
        _4718 = _4744;
    }
    float _4746 = _4718;
    float _4748 = fma(_4638, _4640, _4726);
    float _4750 = fma(_4636, _4640, _4734);
    float _4752 = fma(_4648, _4640, _4736);
    if (!_4630)
    {
        float _4754 = fma(_3127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4624);
        _4742 = _4754;
    }
    float _4756 = _4742;
    float _4758 = -_4738;
    float _4760 = fma(_4640, _4624, _4758);
    float _4762 = _4640 * _4622;
    float _4764 = fma(_4706, _4644, _4748);
    float _4766 = fma(_4704, _4644, _4750);
    float _4768 = fma(_4708, _4644, _4752);
    float _4770 = _4642 * _4624;
    float _4772 = -_4762;
    float _4774 = fma(_4642, _4720, _4772);
    float _4776 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _4778 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _4776;
    float _4780 = fma(_3809, (*spvDescriptorSet0.vp_c9)._m0[167].z, _4662);
    out.m_85.x = _4766;
    out.m_85.y = _4764;
    out.m_85.z = _4768;
    float _4782 = -_4770;
    float _4784 = fma(_4644, _4622, _4782);
    float _4786 = fma(_4778, _3639, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _4788 = fma(_4664, _3797, _4780);
    float _4790 = in.m_69.x;
    float _4792 = _4784 * _4646;
    float _4794 = exp2(_4660);
    float _4796 = fma(_4786, _3783, _4788);
    float _4798 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _4800 = _4798 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _4802 = fma(_4800, _3403, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _4804 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _4806 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _4804;
    float _4808 = fma(_4802, _3763, _4796);
    float _4810 = _4760 * _4646;
    float _4812 = _4774 * _4646;
    float _4814 = fma(_4806, _3689, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _4816 = _4698 * _4732;
    float _4818 = _4810 * _4716;
    float _4820 = _4722 * _4732;
    float _4822 = _4810 * _4698;
    float _4824 = _4810 * _4722;
    float _4826 = fma(_4792, _4636, _4818);
    float _4828 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _4830 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _4828;
    float _4832 = fma(_4792, _4638, _4822);
    float _4834 = fma(_4792, _4648, _4824);
    float _4836 = fma(_4812, _4704, _4826);
    float _4838 = _4658 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4840 = fma(_4812, _4706, _4832);
    float _4842 = fma(_4812, _4708, _4834);
    float _4844 = _4658 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4846 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4838);
    float _4848 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _4850 = _4848 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _4852 = fma(_4638, _4746, _4816);
    out.m_87.x = _4836;
    out.m_87.y = _4840;
    out.m_87.z = _4842;
    float _4854 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4846);
    float _4856 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4844);
    float _4858 = fma(_4830, _3609, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _4860 = fma(_4850, _3551, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _4862 = fma(_4706, _4756, _4852);
    float _4864 = fma(_3031, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4856);
    float _4866 = fma(_4858, _3761, _4808);
    float _4868 = _4716 * _4732;
    float _4870 = _4864 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4872 = _4854 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4874 = fma(_4636, _4746, _4868);
    float _4876 = fma(_4648, _4746, _4820);
    float _4878 = fma(_4860, _3717, _4866);
    float _4880 = 1.0 / _4872;
    float _4882 = _4870 + _4872;
    float _4884 = fma(_4814, _3691, _4878);
    bool _4886 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4888 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4890 = _4886 || _4888;
    bool _4892 = isnan(0.5);
    bool _4894 = _4890 || _4892;
    float _4896 = fma(_4704, _4756, _4874);
    float _4898 = fma(_4708, _4756, _4876);
    float _4900 = fma(_3629, (*spvDescriptorSet0.vp_c9)._m0[174].z, _4884);
    out.m_89.x = _4900;
    float _4902 = _4882 * _4880;
    float _4904 = _4902 * 0.5;
    float _4906 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_4894)
    {
        _4906 = 1.0;
    }
    float _4908 = _4906;
    float _4910 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4912 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4910);
    float _4914 = _4489 * 0.5;
    float _4916 = 1.0 / _4912;
    float _4918 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4920 = _4916 * _4918;
    float _4922 = abs(_4920);
    float _4924 = log2(_4922);
    bool _4926 = _4920 <= 8000.0;
    bool _4928 = isnan(_4920);
    bool _4930 = _4926 || _4928;
    bool _4932 = isnan(8000.0);
    bool _4934 = _4930 || _4932;
    float _4936 = float(_4934);
    float _4938 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4940 = exp2(_4938);
    float _4942 = fma(_4940, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4944 = precise::clamp(_4942, 0.0, 1.0);
    float _4946 = fma(_4944, -2.0, 3.0);
    float _4948 = _4944 * _4944;
    float _4950 = _4449 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4952 = _4948 * _4946;
    float _4954 = fma(_4457, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4950);
    float _4956 = _4537 + _4489;
    float _4958 = -_4952;
    float _4960 = _4958 + 1.0;
    float _4962 = fma(_4455, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4954);
    float _4964 = _4956 * 0.5;
    float _4966 = fma(_4960, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4952);
    float _4968 = fma(_4259, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4962);
    float _4970 = fma(_4535, -0.5, _4914);
    float _4972 = _4914;
    float _4974 = _4908;
    float _4976 = _4489;
    float _4978 = _4970;
    if (_4894)
    {
        _4972 = 1.0;
    }
    float _4980 = _4972;
    float _4982 = _4968 + _4489;
    float _4984 = _4982 * 0.5;
    float _4986 = _4980;
    float _4988 = _4984;
    if (!_4894)
    {
        float _4990 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4992 = _4990 * 0.15915493667125701904296875;
        float _4994 = _4992 * 6.283185482025146484375;
        float _4996 = cos(_4994);
        float _4998 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5000 = _4998 * 0.15915493667125701904296875;
        float _5002 = _4992 * 6.283185482025146484375;
        float _5004 = sin(_5002);
        float _5006 = 1.0 / _4996;
        float _5008 = _5000 * 6.283185482025146484375;
        float _5010 = cos(_5008);
        float _5012 = _5004 * _5006;
        float _5014 = _5000 * 6.283185482025146484375;
        float _5016 = sin(_5014);
        float _5018 = _5010 * _5012;
        float _5020 = 1.0 / _5018;
        float _5022 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5024 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5022;
        float _5026 = 1.0 / _5024;
        float _5028 = _5016 * _5020;
        float _5030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5032 = fma(_4920, _5028, _5030);
        float _5034 = _5032 * _5026;
        float _5036 = precise::clamp(_5034, 0.0, 1.0);
        _4986 = _5036;
    }
    float _5038 = _4986;
    if (!_4894)
    {
        float _5040 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5042 = _5040 * 0.15915493667125701904296875;
        float _5044 = _5042 * 6.283185482025146484375;
        float _5046 = cos(_5044);
        float _5048 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5050 = _5048 * 0.15915493667125701904296875;
        float _5052 = _5042 * 6.283185482025146484375;
        float _5054 = sin(_5052);
        float _5056 = 1.0 / _5046;
        float _5058 = _5050 * 6.283185482025146484375;
        float _5060 = cos(_5058);
        float _5062 = _5054 * _5056;
        float _5064 = _5050 * 6.283185482025146484375;
        float _5066 = sin(_5064);
        float _5068 = _5060 * _5062;
        float _5070 = 1.0 / _5068;
        float _5072 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5074 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _5072;
        float _5076 = 1.0 / _5074;
        float _5078 = _5066 * _5070;
        float _5080 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5082 = fma(_4920, _5078, _5080);
        float _5084 = _5082 * _5076;
        float _5086 = precise::clamp(_5084, 0.0, 1.0);
        float _5088 = -_5086;
        float _5090 = _5088 + 1.0;
        _4974 = _5090;
    }
    float _5092 = _4974;
    float _5094 = -_4794;
    float _5096 = _5094 + 1.0;
    float _5098 = _4936 * _4966;
    out.gl_Position.x = _4537;
    out.gl_Position.y = _4535;
    out.gl_Position.z = _4968;
    out.gl_Position.w = _4489;
    float _5100 = -_4563;
    float _5102 = _5100 + 1.0;
    float _5104 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5106 = _5098 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _4896;
    out.m_91.y = _4862;
    out.m_91.z = _4898;
    float _5108 = _5104 * _4569;
    float _5110 = -_5104;
    float _5112 = _5110 + 1.0;
    out.m_93.x = _4229;
    out.m_93.y = _4225;
    out.m_93.z = _4233;
    float _5114 = _5102 * _5106;
    float _5116 = precise::clamp(_5114, 0.0, 1.0);
    float _5118 = _4580 * _5108;
    float _5120 = _4590 * _5108;
    bool _5122 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5124 = isnan(_4263);
    bool _5126 = _5122 || _5124;
    bool _5128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5130 = _5126 || _5128;
    float _5132 = -_5116;
    float _5134 = fma(_5132, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5136 = fma(_4586, _5118, _4574);
    float _5138 = fma(_4588, _5118, _4576);
    float _5140 = _4580 * _5112;
    float _5142 = fma(_4580, _5120, _4578);
    float _5144 = _5134 * _4790;
    out.m_95.x = _4964;
    out.m_95.y = _4970;
    out.m_95.z = _4984;
    out.m_95.w = _4489;
    float _5146 = _5038 * _5092;
    out.m_97.x = _5136;
    out.m_97.y = _5138;
    out.m_97.z = _5142;
    out.m_97.w = _5140;
    float _5148 = _5146 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5150 = _5118;
    float _5152 = _5144;
    if (!_5130)
    {
        _5150 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5154 = _5150;
    float _5156 = _5144 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5158 = _5156;
    float _5160 = _5154;
    float _5162 = _5154;
    if (!_5130)
    {
        _5152 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5164 = _5152;
    float _5166 = _5164;
    float _5168 = _5164;
    if (!_5130)
    {
        _4976 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5170 = _4976;
    out.m_99.x = _5156;
    float _5172 = _5170;
    float _5174 = _5170;
    if (!_5130)
    {
        _4988 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5176 = _4988;
    float _5178 = _5176;
    float _5180 = _5176;
    if (!_5130)
    {
        _4978 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5182 = _4978;
    float _5184 = _5182;
    float _5186 = _5182;
    if (!_5130)
    {
        _5158 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5188 = _5158;
    bool _5190 = !_5130;
    float _5192 = _5188;
    float _5194 = _5188;
    if (!_5190)
    {
        bool _5196 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5198 = isnan(_4263);
        bool _5200 = _5196 || _5198;
        bool _5202 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5204 = _5200 || _5202;
        if (!_5204)
        {
            float _5206 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5208 = _4263 + _5206;
            float _5210 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5212 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5210;
            float _5214 = 1.0 / _5212;
            float _5216 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5218 = _5216 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5220 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5222 = _5220 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5224 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5226 = _5224 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5230 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5234 = _5232 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5236 = _5208 * _5214;
            float _5238 = precise::clamp(_5236, 0.0, 1.0);
            float _5240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5242 = _5240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5244 = fma(_5238, _5218, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5246 = fma(_5238, _5242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5248 = fma(_5238, _5222, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5250 = fma(_5238, _5226, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5252 = fma(_5238, _5230, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5254 = fma(_5238, _5234, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5162 = _5246;
            _5186 = _5252;
            _5168 = _5244;
            _5180 = _5250;
            _5174 = _5248;
            _5194 = _5254;
            _5256 = true;
        }
        else
        {
            bool _5258 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5260 = isnan(_4263);
            bool _5262 = _5258 || _5260;
            bool _5264 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5266 = _5262 || _5264;
            if (!_5266)
            {
                _5166 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5268 = _5166;
            _5168 = _5268;
            if (!_5266)
            {
                _5160 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5270 = _5160;
            _5162 = _5270;
            if (!_5266)
            {
                _5172 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5272 = _5172;
            _5174 = _5272;
            if (!_5266)
            {
                _5178 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5274 = _5178;
            _5180 = _5274;
            if (!_5266)
            {
                _5184 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5276 = _5184;
            _5186 = _5276;
            if (!_5266)
            {
                _5192 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5278 = _5192;
            bool _5280 = !_5266;
            _5194 = _5278;
            if (!_5280)
            {
                bool _5282 = _4263 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5284 = isnan(_4263);
                bool _5286 = _5282 || _5284;
                bool _5288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5290 = _5286 || _5288;
                if (!_5290)
                {
                    float _5292 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5294 = _4263 + _5292;
                    float _5296 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5298 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5296;
                    float _5300 = 1.0 / _5298;
                    float _5302 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5304 = _5302 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5306 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5308 = _5306 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5310 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5312 = _5310 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5314 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5316 = _5314 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5320 = _5318 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5322 = _5294 * _5300;
                    float _5324 = precise::clamp(_5322, 0.0, 1.0);
                    float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5330 = fma(_5324, _5304, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5332 = fma(_5324, _5328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5334 = fma(_5324, _5308, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5336 = fma(_5324, _5312, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5338 = fma(_5324, _5316, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5340 = fma(_5324, _5320, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5162 = _5332;
                    _5186 = _5338;
                    _5168 = _5330;
                    _5180 = _5336;
                    _5174 = _5334;
                    _5194 = _5340;
                    _5256 = true;
                }
                else
                {
                    _5162 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5186 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5168 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5180 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5174 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5194 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5256 = false;
    float _5342 = _5162;
    float _5344 = _5186;
    float _5346 = _5168;
    float _5348 = _5180;
    float _5350 = _5174;
    float _5352 = _5194;
    float _5354 = fma(_4862, -0.5, 0.5);
    float _5356 = precise::clamp(_5354, 0.0, 1.0);
    float _5358 = -_5342;
    float _5360 = _5358 + _5344;
    float _5362 = _5148 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5364 = -_5346;
    float _5366 = _5364 + _5348;
    float _5368 = fma(_5356, _5360, _5342);
    out.m_101.x = 0.0;
    float _5370 = -_5350;
    float _5372 = _5370 + _5352;
    float _5374 = fma(_5356, _5366, _5346);
    float _5376 = _5368 * 0.586610972881317138671875;
    out.m_51.x = _5362;
    bool _5378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5380 = fma(_5356, _5372, _5350);
    float _5382 = fma(_5374, 0.298911988735198974609375, _5376);
    bool _5384 = _5038 > 0.0;
    bool _5386 = isnan(_5038);
    bool _5388 = _5384 || _5386;
    bool _5390 = isnan(0.0);
    bool _5392 = _5388 || _5390;
    float _5394 = fma(_5380, 0.114477999508380889892578125, _5382);
    bool _5396 = _5092 <= 0.0;
    bool _5398 = !_5392;
    bool _5400 = _5396 || _5398;
    float _5402 = -_5394;
    float _5404 = _5374 + _5402;
    float _5406 = -_5394;
    float _5408 = _5368 + _5406;
    float _5410 = -_5394;
    float _5412 = _5380 + _5410;
    float _5414 = fma(_5404, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    float _5416 = fma(_5408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    float _5418 = fma(_5412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5394);
    bool _5420 = !_5378;
    if (!_5420)
    {
        float _5422 = -_4225;
        float _5424 = _5422 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5426 = -_4229;
        float _5428 = _5426 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5430 = -_4233;
        float _5432 = _5430 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5434 = _5424 * _5424;
        float _5436 = fma(_5428, _5428, _5434);
        float _5438 = fma(_5432, _5432, _5436);
        float _5440 = sqrt(_5438);
        float _5442 = rsqrt(_5438);
        float _5444 = -_5440;
        float _5446 = _5444 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5448 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5450 = precise::clamp(_5448, 0.0, 1.0);
        float _5452 = _5428 * _5442;
        float _5454 = _5424 * _5442;
        float _5456 = abs(_5450);
        float _5458 = log2(_5456);
        float _5460 = _5432 * _5442;
        float _5462 = _5452 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5464 = _4862 * _5454;
        float _5466 = -_5454;
        float _5468 = -_5462;
        float _5470 = fma(_5466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5468);
        float _5472 = fma(_4896, _5452, _5464);
        float _5474 = -_5460;
        float _5476 = fma(_5474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5470);
        float _5478 = fma(_4898, _5460, _5472);
        float _5480 = precise::clamp(_5478, 0.0, 1.0);
        float _5482 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5484 = _5476 + _5482;
        float _5486 = _5458 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5488 = _5484 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5490 = precise::clamp(_5488, 0.0, 1.0);
        float _5492 = exp2(_5486);
        float _5494 = _5492 * _5490;
        float _5496 = _5480 * _5494;
        float _5498 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5500 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5502 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _5498;
        out.m_101.y = _5500;
        out.m_101.z = _5502;
    }
    out.m_103.x = _5414;
    out.m_103.y = _5416;
    out.m_103.z = _5418;
    if (!_5400)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _5504 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5504;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

