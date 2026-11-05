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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_49 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2751 = as_type<float>(_116);
        out.gl_Position.z = _2751;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_152);
        out.gl_Position.z = _2820;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_49.y;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = in.m_51.x;
    float _188 = in.m_51.y;
    float _190 = in.m_51.z;
    float _192 = in.m_51.w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _196 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = 0.0;
    float _200 = _156;
    if (!_166)
    {
        float _202 = _156 * _156;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _210 = _206;
    if (!_166)
    {
        float _212 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_166;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _156 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _156);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _156 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _200 = _272;
    }
    float _274 = _200;
    out.m_53.y = _154;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    float _282 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_274, _170, _278);
    float _286 = fma(_274, _168, _280);
    float _288 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = fma(_274, _172, _282);
    float _292 = fma(_284, _192, _178);
    float _294 = fma(_286, _192, _176);
    float _296 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = fma(_290, _192, _180);
    float _300 = _190 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _302 = !_276;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_100);
        float _326 = 1.0 / _324;
        float _328 = _134 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _334 = int(_332);
    float _336 = in.m_49.x;
    float _338 = -_154;
    float _340 = _338 + 1.0;
    float _342 = in.m_57.x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _346 = _344 != 0;
    float _348 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _350 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _352 = int(_350);
    float _354 = in.m_57.z;
    float _356 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _348);
    float _358 = in.m_59.w;
    float _360 = float(_100);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _362;
    float _366 = float(_334);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _374 = 1.0 / _364;
    float _376 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _380 = _330 + _378;
    float _382 = float(uint(_352));
    float _384 = _376 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _386 = ~_352;
    int _388 = _386 + 1;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _392 = 1.0 / _366;
    float _394 = 0.0;
    if (!_346)
    {
        _394 = _336;
    }
    float _396 = _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _398;
    float _402 = float(_352);
    float _404 = 1.0 / _382;
    out.m_61.w = _358;
    float _406 = _380 * _374;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _408;
    int _412 = _352 + (-1);
    float _414 = _134 * _392;
    float _416 = in.m_57.w;
    float _418 = 1.0 / _370;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _428 = as_type<int>(_404) + (-2);
    float _430 = trunc(_414);
    int _432 = int(_430);
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _436 = 1.0 / _400;
    float _438 = float(uint(_432));
    float _440 = 1.0 / _360;
    float _442 = as_type<float>(_428) * _438;
    float _444 = trunc(_442);
    float _446 = precise::max(_444, 0.0);
    uint _449 = uint(_446);
    int _451 = as_type<int>(_442);
    float _453 = _396;
    if (_346)
    {
        float _455 = -_336;
        float _457 = _455 + 1.0;
        _451 = as_type<int>(_457);
    }
    int _459 = _451;
    int _461 = _388 * int(_449);
    int _463 = _461 + _432;
    float _465 = float(uint(_463));
    float _467 = in.m_57.y;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = as_type<float>(_428) * _465;
    bool _483 = _276;
    if (_346)
    {
        bool _485 = _342 > 0.5;
        _483 = _485;
    }
    bool _487 = _483;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _491 = _489 != 0;
    if (_346)
    {
        float _493 = _487 ? as_type<float>(_459) : _336;
        _453 = _493;
    }
    float _495 = _453;
    float _497 = trunc(_481);
    float _499 = precise::max(_497, 0.0);
    uint _501 = uint(_499);
    bool _503 = !_479;
    int _505 = _503 ? 0 : 1;
    bool _507 = _354 > 0.5;
    bool _509 = _416 > 0.5;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    bool _515 = !_491;
    int _517 = _515 ? 0 : 1;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _521 = _519 != 0;
    int _523 = _507 ? as_type<int>(_340) : as_type<int>(_154);
    bool _525 = !_475;
    int _527 = _525 ? 0 : 1;
    int _529 = int(_449) + int(_501);
    int _531 = ~_352;
    int _533 = _531 + 1;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _537 = _535 != 0;
    bool _539 = !_513;
    float _541 = _539 ? 7.345489978790283203125 : 1.0;
    int _543 = _533 * _529;
    int _545 = _543 + _432;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _549 = _330 + _547;
    int _551 = abs(_527);
    int _553 = abs(_505);
    float _555 = _549 * _436;
    bool _557 = uint(_545) >= uint(_352);
    float _559 = fma(_410, _406, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _561 = !_471;
    int _563 = _561 ? 0 : 1;
    bool _565 = !_557;
    int _567 = _565 ? 0 : (-1);
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _571 = _569 != 0;
    bool _573 = _467 > 0.5;
    bool _575 = !_571;
    int _577 = _575 ? 0 : 1;
    int _579 = _573 ? as_type<int>(_340) : as_type<int>(_154);
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _583 = _581 != 0;
    float _585 = _521 ? as_type<float>(_579) : _154;
    float _587 = _583 ? as_type<float>(_523) : _154;
    int _589 = _509 ? as_type<int>(_340) : as_type<int>(_154);
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _601 = _599 != 0;
    float _603 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _605 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _607 = ~_529;
    int _609 = _607 + _567;
    int _611 = _609 + 1;
    float _613 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _603);
    float _615 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _605);
    float _617 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _619 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _621 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _613);
    float _623 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _625 = -_372;
    float _627 = fma(_617, 2.0, _625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _635 = _330 + _633;
    float _637 = _541 * _342;
    float _639 = fma(_619, -2.0, _390);
    float _641 = _635 * _418;
    float _643 = 1.0 / _631;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _647 = _330 + _645;
    float _649 = _134 * _402;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _651;
    int _655 = _352 * _611;
    int _657 = _655 + _432;
    float _659 = _649 * _440;
    int _661 = abs(_517);
    float _663 = floor(_637);
    float _665 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    int _667 = 0;
    float _669 = _467;
    if (_597)
    {
        float _671 = -_336;
        float _673 = _671 + 1.0;
        _667 = as_type<int>(_673);
    }
    int _675 = _667;
    float _677 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _679 = _647 * _643;
    float _681 = float(_432);
    float _683 = 1.0 / _653;
    bool _685 = _681 >= _402;
    bool _687 = isnan(_681);
    bool _689 = _685 || _687;
    bool _691 = isnan(_402);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _697;
    float _701 = -_663;
    float _703 = _637 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _709 = fma(_699, _406, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _711 = trunc(_695);
    int _713 = int(_711);
    float _715 = _703 * _402;
    float _717 = _601 ? as_type<float>(_589) : _154;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _721 = _330 + _719;
    bool _723 = _352 == 0;
    float _725 = fma(_422, _406, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _727 = fma(_707, _641, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _729 = _721 * _683;
    bool _731 = !_723;
    int _733 = _731 ? _657 : (-1);
    float _735 = trunc(_715);
    int _737 = int(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _743;
    float _747 = fma(_741, _641, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _749;
    int _753 = ~_713;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _761 = fma(_745, _555, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    int _763 = abs(_563);
    float _765 = fma(_426, _641, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _767 = _733 * _757;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _777 = fma(_751, _555, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _779 = _713 * _412;
    int _781 = _779 + _767;
    float _783 = trunc(_659);
    int _785 = int(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _795 = abs(_577);
    int _797 = _781 * _551;
    float _799 = fma(_789, _679, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _801 = _759 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _805 = fma(_793, _679, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _807 = fma(_775, _679, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _809 = fma(_771, _555, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _811 = _737 * _795;
    int _813 = _811 + _432;
    int _815 = _785 * _763;
    int _817 = _815 + _797;
    float _819 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _823 = fma(_717, _801, -0.5);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _827 = _803 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _829 = _813 * _553;
    int _831 = _829 + _817;
    float _833 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _821);
    bool _835 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _837 = isnan(_330);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[88].w, _825);
    float _849 = fma(_587, _827, -0.5);
    bool _851 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _853 = isnan(_330);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    int _863 = _737 * _661;
    int _865 = _863 + _831;
    float _867 = -_845;
    float _869 = _867 + 1.0;
    bool _871 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _873 = isnan(_330);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_861;
    float _885 = _883 + 1.0;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _891;
    bool _895 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _897 = isnan(_330);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _881 * _869;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _909;
    float _913 = -_881;
    float _915 = _913 + 1.0;
    float _917 = _845 * _885;
    float _919 = fma(_889, _729, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _921 = fma(_893, _729, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _923 = fma(_911, _729, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _925 = _905 * _915;
    float _927 = -_905;
    float _929 = _927 + 1.0;
    float _931 = float(uint(_865));
    bool _933 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _935 = isnan(_330);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    bool _945 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _947 = isnan(_330);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _833);
    float _959 = as_type<float>(_428) * _931;
    float _961 = -_943;
    float _963 = _961 + 1.0;
    int _965 = ~_352;
    int _967 = _965 + 1;
    float _969 = -_665;
    float _971 = fma(_957, _819, _969);
    float _973 = trunc(_959);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = _955 * _963;
    float _981 = _943 * _929;
    float _983 = _943;
    int _985 = as_type<int>(_959);
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _989 = as_type<float>(_763);
    float _991 = _955;
    float _993 = _747;
    if (_513)
    {
        _983 = _342;
    }
    float _995 = _983;
    float _997 = _725 * _979;
    float _999 = _709 * _979;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1003 = _995;
    if (_593)
    {
        float _1005 = -_336;
        float _1007 = _1005 + 1.0;
        _985 = as_type<int>(_1007);
    }
    int _1009 = _985;
    if (!_593)
    {
        _987 = _336;
    }
    float _1011 = _987;
    float _1013 = _559 * _979;
    float _1015 = _1011;
    if (!_513)
    {
        _1003 = _354;
    }
    float _1017 = _1003;
    float _1019 = _1017;
    if (_593)
    {
        float _1021 = _507 ? as_type<float>(_1009) : _336;
        _1015 = _1021;
    }
    float _1023 = _1015;
    int _1025 = _967 * int(_977);
    int _1027 = _1025 + _865;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_513)
    {
        _989 = _467;
    }
    float _1031 = _989;
    float _1033 = _1031;
    if (!_597)
    {
        _1019 = _336;
    }
    float _1035 = _1019;
    float _1037 = -_1001;
    float _1039 = fma(_1029, 2.0, _1037);
    float _1041 = float(uint(_1027));
    float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1045 = _1035;
    if (_597)
    {
        float _1047 = _573 ? as_type<float>(_675) : _336;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = as_type<float>(_428) * _1041;
    if (_513)
    {
        _1033 = _342;
    }
    float _1053 = _1033;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1057 = -_955;
    float _1059 = _1057 + 1.0;
    if (!_513)
    {
        _991 = _354;
    }
    float _1061 = _991;
    float _1063 = trunc(_1051);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1055);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1073 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1075 = _1061;
    if (_513)
    {
        _1075 = _467;
    }
    float _1077 = _1075;
    float _1079 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].x, _999);
    float _1081 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1013);
    float _1083 = -_1071;
    float _1085 = fma(_1073, 2.0, _1083);
    float _1087 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].z, _997);
    float _1089 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[83].w, _434);
    float _1091 = fma(_727, _981, _1079);
    float _1093 = fma(_747, _981, _1081);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1097 = fma(_765, _981, _1087);
    int _1099 = ~_352;
    int _1101 = _1099 + 1;
    float _1103 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1105 = int(_977) + int(_1067);
    float _1107 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1109 = float(uint(_813));
    float _1111 = -_134;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1085);
    float _1115 = fma(_1107, _1023, -0.5);
    if (!_513)
    {
        _993 = _354;
    }
    float _1117 = _993;
    float _1119 = as_type<float>(_428) * _1109;
    int _1121 = _1101 * _1105;
    int _1123 = _1121 + _865;
    float _1125 = _1117;
    if (_513)
    {
        _1125 = _467;
    }
    float _1127 = _1125;
    float _1129 = -_134;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1039);
    float _1133 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1137 = trunc(_1119);
    float _1139 = precise::max(_1137, 0.0);
    uint _1141 = uint(_1139);
    float _1143 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1145 = uint(_1123) >= uint(_352);
    float _1147 = fma(_761, _925, _1091);
    float _1149 = fma(_1143, -2.0, _1135);
    float _1151 = fma(_1133, _1049, -0.5);
    bool _1153 = !_1145;
    int _1155 = _1153 ? 0 : (-1);
    float _1157 = fma(_777, _925, _1093);
    int _1159 = ~_352;
    int _1161 = _1159 + 1;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1165 = ~_1105;
    int _1167 = _1165 + _1155;
    int _1169 = _1167 + 1;
    float _1171 = fma(_809, _925, _1097);
    float _1173 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1163);
    if (!_513)
    {
        _669 = _342;
    }
    float _1175 = _669;
    int _1177 = _352 * _1169;
    int _1179 = _1177 + _865;
    float _1181 = -_134;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    int _1185 = _1161 * int(_1141);
    int _1187 = _1185 + _813;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1173);
    bool _1193 = !_723;
    int _1195 = _1193 ? _1179 : (-1);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _384 + _1197;
    float _1201 = float(uint(_1187));
    float _1203 = fma(_1191, _1103, _1183);
    int _1205 = _1195 >> 31;
    float _1207 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1209 = as_type<float>(_428) * _1201;
    int _1211 = _1205 & 3;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1215 = _677 + _1213;
    float _1217 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1221 = _1195 + _1211;
    float _1223 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1225 = trunc(_1209);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    int _1231 = _1195 & 3;
    bool _1233 = _1231 != 0;
    float _1235 = fma(_805, _907, _1157);
    int _1237 = _1221 >> 2;
    float _1239 = fma(_807, _907, _1171);
    int _1241 = _1233 ? 0 : 1;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1223 + _1243;
    int _1247 = _1237 << 4;
    int _1249 = _1247 + 368;
    float _1251 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1253 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1217);
    float _1255 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    uint _1257 = uint(int(uint(_1249) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    float _1273 = fma(_1251, _1115, _1113);
    float _1275 = fma(_799, _907, _1147);
    int _1277 = _1195 & 3;
    bool _1279 = _1277 != 0;
    float _1281 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _847);
    float _1283 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1285 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1149);
    bool _1287 = uint(_1277) > 1u;
    int _1289 = _1249 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = _1277 != 3;
    float _1309 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1253);
    int _1311 = ~_1241;
    int _1313 = _1311 + 1;
    int _1315 = _1313 + 1;
    float _1317 = -_1285;
    float _1319 = fma(_1283, _823, _1317);
    float _1321 = fma(_1255, -2.0, _1219);
    bool _1323 = uint(_1277) >= 2u;
    float _1325 = fma(_921, _917, _1235);
    bool _1327 = !_1279;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1321);
    bool _1333 = _1309 >= 0.0;
    float _1335 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    int _1337 = _1315;
    float _1339 = _1239;
    int _1341 = as_type<int>(_1319);
    if (!_1287)
    {
        int _1343 = ~_1241;
        int _1345 = _1343 + 1;
        _1337 = _1345;
    }
    int _1347 = _1337;
    float _1349 = fma(_919, _917, _1275);
    int _1351 = ~_352;
    int _1353 = _1351 + 1;
    float _1355 = -_1331;
    float _1357 = fma(_1281, _849, _1355);
    int _1359 = abs(_1347);
    float _1361 = fma(_923, _917, _1239);
    int _1363 = int(_1141) + int(_1229);
    float _1365 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1349);
    int _1367 = _1323 ? 0 : 1;
    float _1369 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1325);
    int _1371 = abs(_1329);
    int _1373 = _1353 * _1363;
    int _1375 = _1373 + _813;
    float _1377 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1361);
    int _1379 = ~_1367;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    float _1385 = fma(_1335, _1151, _1131);
    int _1387 = _1383;
    if (_1307)
    {
        int _1389 = ~_1367;
        int _1391 = _1389 + 1;
        _1387 = _1391;
    }
    int _1393 = _1387;
    if (_1333)
    {
        out.m_45.x = 0.0;
    }
    int _1395 = ~_1359;
    int _1397 = _1395 + 1;
    int _1399 = _1397 + 1;
    float _1401 = _1385 + 0.5;
    int _1403 = abs(_1393);
    float _1405 = _1357 + 0.5;
    int _1407 = ~_1371;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    bool _1413 = uint(_1375) >= uint(_352);
    if (_1333)
    {
        _1339 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1415 = _1339;
    out.m_63.x = _1401;
    out.m_63.y = _1405;
    int _1417 = _1399 * as_type<int>(_1271);
    int _1419 = ~_1403;
    int _1421 = _1419 + 1;
    int _1423 = _1421 + 1;
    float _1425 = _1199 * _1199;
    bool _1427 = !_1413;
    int _1429 = _1427 ? 0 : (-1);
    int _1431 = _1411 * as_type<int>(_1263);
    int _1433 = _1431 + _1417;
    bool _1435 = _1277 != 3;
    float _1437 = _1203 + 0.5;
    bool _1439 = !_537;
    int _1441 = _1439 ? 0 : 1;
    int _1443 = _1423 * as_type<int>(_1297);
    int _1445 = _1443 + _1433;
    bool _1447 = !_1435;
    int _1449 = _1447 ? 0 : (-1);
    int _1451 = ~_1363;
    int _1453 = _1451 + _1429;
    int _1455 = _1453 + 1;
    int _1457 = abs(_1449);
    int _1459 = abs(_1441);
    float _1461 = fma(_1215, _1215, _1425);
    int _1463 = ~_1457;
    int _1465 = _1463 + 1;
    int _1467 = _1465 + 1;
    int _1469 = _352 * _1455;
    int _1471 = _1469 + _813;
    float _1473 = _1319 + 0.5;
    int _1475 = ~_1459;
    int _1477 = _1475 + 1;
    int _1479 = _1477 + 1;
    if (_1333)
    {
        float _1481 = _1415 * 5.0;
        _1341 = as_type<int>(_1481);
    }
    int _1483 = _1341;
    int _1485 = _1467 * as_type<int>(_1305);
    int _1487 = _1485 + _1445;
    float _1489 = fma(_1245, _1245, _1461);
    float _1491 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1493 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1495 = _1487 * _1479;
    bool _1497 = !_723;
    int _1499 = _1497 ? _1471 : (-1);
    float _1501 = _971 + 0.5;
    float _1503 = rsqrt(_1489);
    float _1505 = _1273 + 0.5;
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1509 = _1499 * _1459;
    int _1511 = _1509 + _1495;
    float _1513 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1515 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1437;
    out.m_65.y = _1501;
    out.m_65.z = _1505;
    out.m_65.w = _1473;
    float _1517 = float(_1511);
    float _1519 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = as_type<float>(_1483);
    if (_1333)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5008 = as_type<float>(_1483);
        out.gl_Position.z = _5008;
    }
    out.m_67.x = _1517;
    out.m_69.x = _1519;
    out.m_69.y = _1507;
    out.m_69.z = _1515;
    float _1523 = _1199 * _1503;
    float _1525 = _1215 * _1503;
    if (_1333)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1527 = -_1523;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _384);
    float _1531 = _1245 * _1503;
    float _1533 = -_1525;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _677);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1539 = _1529 + _1537;
    float _1541 = -_1531;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1223);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1547 = _1535 + _1545;
    float _1549 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1543 + _1551;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1549);
    float _1557 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    bool _1559 = _1557 >= 0.0;
    float _1561 = _1543;
    if (_1559)
    {
        _1521 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1563 = _1521;
    int _1565 = as_type<int>(_1563);
    if (_1559)
    {
        out.m_45.x = 0.0;
    }
    if (_1559)
    {
        float _1567 = _1563 * 5.0;
        _1565 = as_type<int>(_1567);
    }
    int _1569 = _1565;
    if (_1559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5113 = as_type<float>(_1569);
        out.gl_Position.z = _5113;
    }
    if (_1559)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1571 = -_384;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = -_677;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1579 = -_1223;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1583 = _1573 * _1573;
    float _1585 = -_1523;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1589 = fma(_1577, _1577, _1583);
    float _1591 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1593 = -_1525;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1215);
    float _1597 = fma(_1581, _1581, _1589);
    float _1599 = -_1591;
    float _1601 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1603 = _1587 * _1587;
    float _1605 = rsqrt(_1597);
    float _1607 = -_1531;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1611 = _354 * 6.283185482025146484375;
    float _1613 = fma(_134, 0.310000002384185791015625, _1611);
    float _1615 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1617 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1619 = -_1615;
    float _1621 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1619);
    float _1623 = -_1617;
    float _1625 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1623);
    float _1627 = _1577 * _1605;
    float _1629 = _1581 * _1605;
    float _1631 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1633 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1635 = _1627 * _1627;
    float _1637 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1639 = -_1631;
    float _1641 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1643 = _1573 * _1605;
    float _1645 = fma(_1629, _1629, _1635);
    float _1647 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1649 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1651 = -_1637;
    float _1653 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1651);
    float _1655 = rsqrt(_1645);
    float _1657 = -_1647;
    float _1659 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1657);
    float _1661 = -_1649;
    float _1663 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1661);
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1641);
    float _1667 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1669 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1671 = -_1633;
    float _1673 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1671);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1677 = -_1667;
    float _1679 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1677);
    float _1681 = -_1669;
    float _1683 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1681);
    float _1685 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1673);
    float _1687 = _1629 * _1655;
    float _1689 = _1627 * _1655;
    float _1691 = -_1675;
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1691);
    float _1695 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1653);
    float _1697 = -_1687;
    float _1699 = _1629 * _1697;
    float _1701 = -_1687;
    float _1703 = _1643 * _1701;
    float _1705 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1693);
    float _1707 = -_1699;
    float _1709 = fma(_1627, _1689, _1707);
    float _1711 = _1643 * _1689;
    float _1713 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1679);
    float _1715 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1717 = _1709 * _1709;
    float _1719 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = -_1713;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1705);
    float _1725 = -_1715;
    float _1727 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1725);
    float _1729 = fma(_1711, _1711, _1717);
    float _1731 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1733 = -_1719;
    float _1735 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1733);
    float _1737 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1727);
    float _1739 = fma(_1703, _1703, _1729);
    float _1741 = 1.0 / _1723;
    float _1743 = -_1731;
    float _1745 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1743);
    float _1747 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1735);
    float _1749 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1745);
    float _1751 = rsqrt(_1739);
    float _1753 = fma(_1737, _1741, -1.0);
    float _1755 = 1.0 / _296;
    float _1757 = _1709 * _1751;
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = 1.0 / _300;
    float _1763 = -_1759;
    float _1765 = _1763 + 1.0;
    float _1767 = _1765 * _1741;
    float _1769 = fma(_1765, _1753, 1.0);
    float _1771 = 1.0 / _288;
    float _1773 = _1749 * _1767;
    float _1775 = _1769 * _1769;
    float _1777 = _1747 * _1767;
    float _1779 = fma(_1773, _1773, _1775);
    float _1781 = fma(_1777, _1777, _1779);
    float _1783 = rsqrt(_1781);
    float _1785 = _1777 * _1783;
    float _1787 = _1773 * _1783;
    float _1789 = _1769 * _1783;
    float _1791 = -_1785;
    float _1793 = _1627 * _1791;
    float _1795 = _1629 * _1789;
    float _1797 = -_1787;
    float _1799 = -_1793;
    float _1801 = fma(_1629, _1797, _1799);
    float _1803 = -_1787;
    float _1805 = _1643 * _1803;
    float _1807 = -_1785;
    float _1809 = -_1795;
    float _1811 = fma(_1643, _1807, _1809);
    float _1813 = _1801 * _1801;
    float _1815 = -_1805;
    float _1817 = fma(_1627, _1789, _1815);
    float _1819 = fma(_1811, _1811, _1813);
    float _1821 = fma(_1817, _1817, _1819);
    float _1823 = rsqrt(_1821);
    float _1825 = _1811 * _1823;
    float _1827 = _1817 * _1823;
    float _1829 = _1801 * _1823;
    float _1831 = _1629 * _1825;
    float _1833 = _1643 * _1827;
    float _1835 = -_1831;
    float _1837 = fma(_1627, _1827, _1835);
    float _1839 = _1627 * _1829;
    float _1841 = -_1833;
    float _1843 = fma(_1629, _1829, _1841);
    float _1845 = _1837 * _1837;
    float _1847 = -_1839;
    float _1849 = fma(_1643, _1825, _1847);
    float _1851 = fma(_1595, _1595, _1603);
    float _1853 = in.m_71.x;
    float _1855 = in.m_71.y;
    float _1857 = in.m_71.z;
    float _1859 = fma(_1843, _1843, _1845);
    float _1861 = fma(_1609, _1609, _1851);
    float _1863 = fma(_1849, _1849, _1859);
    float _1865 = sqrt(_1861);
    float _1867 = rsqrt(_1863);
    float _1869 = _1771 * _1853;
    float _1871 = _1761 * _1857;
    float _1873 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1875 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1877 = _342 * 6.283185482025146484375;
    float _1879 = _1849 * _1867;
    float _1881 = _1837 * _1867;
    float _1883 = _1843 * _1867;
    float _1885 = -_154;
    float _1887 = fma(_1885, 0.5, 0.5);
    float _1889 = _1627 * _1879;
    float _1891 = _1629 * _1881;
    float _1893 = -_1889;
    float _1895 = fma(_1629, _1883, _1893);
    float _1897 = -_1891;
    float _1899 = fma(_1643, _1879, _1897);
    float _1901 = _1643 * _1883;
    float _1903 = _1895 * _1895;
    float _1905 = -_1901;
    float _1907 = fma(_1627, _1881, _1905);
    float _1909 = fma(_1899, _1899, _1903);
    float _1911 = _1755 * _1855;
    float _1913 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1869);
    float _1917 = fma(_1907, _1907, _1909);
    float _1919 = _1503 * _1865;
    float _1921 = rsqrt(_1917);
    float _1923 = _1873 * _1919;
    float _1925 = _1913 * _1919;
    float _1927 = _1875 * _1919;
    float _1929 = fma(_134, 0.10999999940395355224609375, _1877);
    float _1931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1911);
    float _1933 = _1923 * _1915;
    float _1935 = _1613 * 0.15915493667125701904296875;
    float _1937 = _1935 * 6.283185482025146484375;
    float _1939 = sin(_1937);
    float _1941 = _1895 * _1921;
    float _1943 = _1925 * _1931;
    float _1945 = _1899 * _1921;
    float _1947 = _1907 * _1921;
    float _1949 = _1871 * _1927;
    float _1951 = _1943 * _1881;
    float _1953 = _1943 * _1883;
    float _1955 = _1943 * _1879;
    float _1957 = _1929 * 0.15915493667125701904296875;
    float _1959 = fma(_1933, _1941, _1951);
    float _1961 = fma(_1933, _1945, _1953);
    float _1963 = fma(_1933, _1947, _1955);
    float _1965 = fma(_1643, _1949, _1959);
    float _1967 = _1957 * 6.283185482025146484375;
    float _1969 = sin(_1967);
    float _1971 = fma(_1627, _1949, _1961);
    float _1973 = fma(_1629, _1949, _1963);
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1979 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1981 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1975);
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1977);
    float _1985 = _384 + _1965;
    float _1987 = fma(_1939, 0.12999999523162841796875, 1.0);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1981);
    float _1991 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1979);
    float _1993 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1983);
    float _1995 = _677 + _1971;
    float _1997 = _1927 * _1989;
    float _1999 = fma(_1969, 0.300000011920928955078125, _1987);
    float _2001 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1991);
    float _2003 = _1925 * _1993;
    float _2005 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2009 = _1923 * _2001;
    float _2011 = _1999 * _1887;
    float _2013 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2005);
    float _2015 = _1223 + _1973;
    float _2017 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2007);
    float _2019 = _1925 * _2011;
    float _2021 = _2019 * 2.0;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2013);
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2027 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2017);
    float _2029 = _2015 + _2023;
    float _2031 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2025);
    float _2033 = _1995 + _2027;
    float _2035 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2029);
    float _2037 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2031);
    float _2039 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2033);
    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2043 = _2035 + _2041;
    float _2045 = _1985 + _2037;
    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2049 = _2039 + _2047;
    float _2051 = _2043 * _2043;
    float _2053 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2045);
    float _2055 = fma(_2049, _2049, _2051);
    float _2057 = sqrt(_2055);
    bool _2059 = _2057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = _2051;
    float _2063 = _2039;
    float _2065 = _2035;
    float _2067 = _2045;
    float _2069 = _2043;
    float _2071 = _2053;
    float _2073 = _2011;
    float _2075 = _1945;
    if (!_2059)
    {
        _2061 = _2039;
    }
    float _2077 = _2061;
    float _2079 = _2077;
    if (!_2059)
    {
        _2063 = _2035;
    }
    float _2081 = _2063;
    float _2083 = _2081;
    if (!_2059)
    {
        _2065 = _2053;
    }
    float _2085 = _2065;
    bool _2087 = !_2059;
    float _2089 = _2085;
    if (!_2087)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2095 = _2057 + _2093;
        float _2097 = rsqrt(_2055);
        float _2099 = _2095 * _2091;
        float _2101 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2103 = _2099 * 0.15915493667125701904296875;
        float _2105 = _2103 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        float _2109 = _2103 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = fma(_2107, _2101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2115 = _2097 * _2113;
        float _2117 = _2111 + (-1.0);
        float _2119 = fma(_2049, _2115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2121 = fma(_2043, _2115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2123 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2125 = fma(_2053, _2111, _2123);
        _2089 = _2125;
        _2079 = _2119;
        _2083 = _2121;
        _2067 = _2103;
    }
    float _2127 = _2089;
    float _2129 = _2079;
    float _2131 = _2083;
    float _2133 = _2067;
    float _2135 = -_1523;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2127);
    float _2139 = -_1525;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2129);
    float _2143 = -_1531;
    float _2145 = fma(_2143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2131);
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2149 = _2137 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2153 = _2141 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2157 = _2145 + _2155;
    float _2159 = _2149 * _2149;
    float _2161 = fma(_2153, _2153, _2159);
    float _2163 = fma(_2157, _2157, _2161);
    float _2165 = rsqrt(_2163);
    float _2167 = sqrt(_2163);
    float _2169 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2171 = _2153 * _2169;
    float _2173 = _2157 * _2169;
    float _2175 = _2171 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 + _2177;
    float _2181 = sqrt(_2179);
    bool _2183 = _2181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = _2181 + _2185;
    float _2189 = _2057;
    float _2191 = _2133;
    float _2193 = _2187;
    if (_2183)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2189 = _2195;
    }
    float _2197 = _2189;
    if (_2183)
    {
        float _2199 = rsqrt(_2179);
        _2191 = _2199;
    }
    float _2201 = _2191;
    float _2203 = _2201;
    if (_2183)
    {
        float _2205 = _2187 * _2197;
        _2193 = _2205;
    }
    float _2207 = _2193;
    if (_2183)
    {
        float _2209 = _2207 * 0.15915493667125701904296875;
        _2069 = _2209;
    }
    float _2211 = _2069;
    float _2213 = _1523;
    float _2215 = _2211;
    if (_2183)
    {
        float _2217 = _2211 * 6.283185482025146484375;
        float _2219 = sin(_2217);
        _2213 = _2219;
    }
    float _2221 = _2213;
    float _2223 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2225 = precise::max(0.0, _2223);
    float _2227 = _2049;
    float _2229 = _2225;
    float _2231 = _2223;
    if (_2183)
    {
        float _2233 = _2211 * 6.283185482025146484375;
        float _2235 = cos(_2233);
        _2227 = _2235;
    }
    float _2237 = _2227;
    float _2239 = -_2169;
    float _2241 = -_2225;
    float _2243 = fma(_2149, _2239, _2241);
    if (_2183)
    {
        float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2245;
    }
    float _2247 = _2229;
    float _2249 = _2247;
    float _2251 = _2221;
    if (_2183)
    {
        float _2253 = fma(_2221, _2247, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2071 = _2253;
    }
    float _2255 = _2071;
    float _2257 = _2255;
    if (!_2183)
    {
        _2249 = _2171;
    }
    float _2259 = _2249;
    float _2261 = _2259;
    if (!_2183)
    {
        _2251 = _2243;
    }
    float _2263 = _2251;
    float _2265 = _2263;
    if (_2183)
    {
        float _2267 = _2237 + (-1.0);
        _2231 = _2267;
    }
    float _2269 = _2231;
    float _2271 = _2269;
    if (_2183)
    {
        float _2273 = _2201 * _2255;
        _2073 = _2273;
    }
    float _2275 = _2073;
    if (!_2183)
    {
        _2203 = _2173;
    }
    float _2277 = _2203;
    float _2279 = _2277;
    if (_2183)
    {
        float _2281 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2215 = _2281;
    }
    float _2283 = _2215;
    if (_2183)
    {
        float _2285 = _2171 * _2275;
        _2261 = _2285;
    }
    float _2287 = _2261;
    if (!_2183)
    {
        _2257 = _2175;
    }
    float _2289 = _2257;
    float _2291 = _2289;
    if (_2183)
    {
        float _2293 = _2173 * _2275;
        _2279 = _2293;
    }
    float _2295 = _2279;
    if (_2183)
    {
        float _2297 = fma(_2243, _2237, _2283);
        _2265 = _2297;
    }
    float _2299 = _2265;
    if (_2183)
    {
        float _2301 = _2287 * _2287;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (!_2183)
    {
        _2271 = _2177;
    }
    float _2305 = _2271;
    float _2307 = _2305;
    if (_2183)
    {
        float _2309 = _2295 * _2295;
        _2307 = _2309;
    }
    float _2311 = _2307;
    float _2313 = fma(_2299, _2299, _2303);
    float _2315 = _2313 + _2311;
    float _2317 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2321 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2319);
    float _2323 = precise::clamp(_2321, 0.0, 1.0);
    float _2325 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2327 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2329 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2317);
    float _2331 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2333 = rsqrt(_2315);
    float _2335 = -_2323;
    float _2337 = _2335 + 1.0;
    float _2339 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2325);
    float _2341 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2331);
    float _2343 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2345 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2329);
    float _2347 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2339);
    float _2349 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2341);
    float _2351 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2343);
    float _2353 = abs(_2337);
    float _2355 = log2(_2353);
    float _2357 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2359 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2361 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2351);
    float _2363 = _2345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2365 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2367 = _2333 * _2287;
    float _2369 = _2333 * _2295;
    float _2371 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2373 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2365);
    float _2375 = _2333 * _2299;
    float _2377 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2379 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2373);
    float _2383 = -_2371;
    float _2385 = fma(_2383, _2327, 1.0);
    float _2387 = -_2377;
    float _2389 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2387);
    float _2391 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2381);
    float _2395 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2397 = -_2369;
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2389);
    float _2401 = log2(_2385);
    float _2403 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2395);
    float _2407 = fma(_2399, -0.5, 0.5);
    float _2409 = fma(_2399, 0.5, 0.5);
    float _2411 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2405);
    float _2415 = _2375 + 1.0;
    float _2417 = 1.0 / _2393;
    float _2419 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2411);
    float _2421 = fma(_2409, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2423 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2413);
    float _2425 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2427 = fma(_2409, _2421, -0.212114393711090087890625);
    float _2429 = exp2(_2391);
    float _2431 = _2401 * 0.693147182464599609375;
    float _2433 = fma(_2409, _2427, 1.570728778839111328125);
    float _2435 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2437 = sqrt(_2407);
    float _2439 = _2423 * _2417;
    float _2441 = _2425 * _2417;
    float _2443 = fma(_2439, 0.5, 0.5);
    float _2445 = fma(_2441, -0.5, 0.5);
    float _2447 = -_2375;
    float _2449 = fma(_2429, _2415, _2447);
    float3 _6582 = float3(_2443, _2445, _2435);
    float _2451 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6582, float3(0.0), isnan(_6582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6582, float3(0.0), isnan(_6582)), level(0.0)).x;
    float _2453 = fma(_2449, 0.5, 0.5);
    float _2455 = _2437 * 0.636619746685028076171875;
    float _2457 = -_2433;
    float _2459 = fma(_2455, _2457, 1.0);
    float3 _6603 = float3(_2443, _2445, _2435);
    float4 _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6603, float3(0.0), isnan(_6603)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6603, float3(0.0), isnan(_6603)), level(0.0)).xyzw;
    float _2464 = _2462.x;
    float _2466 = _2462.y;
    float _2468 = _2462.z;
    float _2470 = _2462.w;
    float2 _6620 = float2(_2459, _2453);
    float3 _2474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6620, float2(0.0), isnan(_6620)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6620, float2(0.0), isnan(_6620)), level(0.0)).xyz;
    float _2476 = _2474.x;
    float _2478 = _2474.y;
    float _2480 = _2474.z;
    float _2482 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2484 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2486 = isnan(0.5);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2492 = _2488 || _2490;
    float _2494 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2496 = _1911 != 0.0;
    bool _2498 = isnan(_1911);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(0.0);
    bool _2504 = _2500 || _2502;
    float _2506 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2482);
    float _2508 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2510 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2494);
    bool _2512 = _1869 == 0.0;
    bool _2514 = !_2504;
    bool _2516 = _2512 && _2514;
    float _2518 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2506);
    float _2520 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2522 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2510);
    bool _2524 = _1871 == 0.0;
    bool _2526 = _2524 && _2516;
    float _2528 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2530 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2520);
    float _2532 = in.m_73.x;
    float _2534 = in.m_73.y;
    float _2536 = in.m_73.z;
    float _2538 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2540 = 1.0 / _2528;
    if (!_2492)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2542 = _1561;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    float _2544 = _2538 + _2528;
    float _2546 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2530);
    out.m_69.x = _1519;
    out.m_69.y = _1507;
    out.m_69.z = _1515;
    out.m_75.x = _2153;
    out.m_75.y = _2149;
    out.m_75.z = _2157;
    float _2548 = _2544 * _2540;
    float _2550 = _2548 * 0.5;
    float _2552 = _2540;
    float _2554 = _2550;
    float _2556 = _2542;
    if (!_2492)
    {
        float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2560 = fma(_2550, _2542, _2558);
        _2552 = _2560;
    }
    float _2562 = _2552;
    if (!_2492)
    {
        _2554 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2564 = _2554;
    float _2566 = _2534;
    float _2568 = _2532;
    float _2570 = _2536;
    float _2572 = _2564;
    if (!_2526)
    {
        float _2574 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2534);
        _2566 = _2574;
    }
    float _2576 = _2566;
    if (!_2526)
    {
        float _2578 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2532);
        _2568 = _2578;
    }
    float _2580 = _2568;
    if (!_2526)
    {
        float _2582 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2536);
        _2570 = _2582;
    }
    float _2584 = _2570;
    float _2586 = _1881 * _2576;
    if (!_2492)
    {
        float _2588 = -_2564;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2556 = _2590;
    }
    float _2592 = _2556;
    float _2594 = _2562;
    if (!_2492)
    {
        float _2596 = 1.0 / _2562;
        _2594 = _2596;
    }
    float _2598 = _2594;
    float _2600 = _1883 * _2576;
    float _2602 = fma(_1941, _2580, _2586);
    float _2604 = _1879 * _2576;
    float _2606 = fma(_1945, _2580, _2600);
    if (_2492)
    {
        _2075 = 1.0;
    }
    float _2608 = _2075;
    float _2610 = fma(_1947, _2580, _2604);
    float _2612 = exp2(_2508);
    float _2614 = fma(_1627, _2584, _2606);
    float _2616 = fma(_1643, _2584, _2602);
    float _2618 = fma(_1629, _2584, _2610);
    float _2620 = _2393 * 0.5;
    float _2622 = _2592;
    float _2624 = _2608;
    if (!_2492)
    {
        float _2626 = 1.0 / _2592;
        _2622 = _2626;
    }
    float _2628 = _2622;
    if (!_2492)
    {
        float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2632 = -_2564;
        float _2634 = fma(_2598, _2630, _2632);
        _2572 = _2634;
    }
    float _2636 = _2572;
    float _2638 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2546);
    float _2640 = _2423 + _2393;
    out.m_77.x = _2614;
    out.m_77.y = _2616;
    out.m_77.z = _2618;
    float _2642 = _2640 * 0.5;
    float _2644 = -_2612;
    float _2646 = _2644 + 1.0;
    out.gl_Position.x = _2423;
    out.gl_Position.y = _2425;
    out.gl_Position.z = _2638;
    out.gl_Position.w = _2393;
    float _2648 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2492)
    {
        float _2650 = _2636 * _2628;
        float _2652 = precise::clamp(_2650, 0.0, 1.0);
        _2624 = _2652;
    }
    float _2654 = _2624;
    float _2656 = _2638 + _2393;
    float _2658 = fma(_2425, -0.5, _2620);
    float _2660 = _2654 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2662 = _2654 > 0.0;
    bool _2664 = isnan(_2654);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = _2656 * 0.5;
    float _2674 = _2660 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = _2642;
    out.m_79.y = _2658;
    out.m_79.z = _2672;
    out.m_79.w = _2393;
    out.m_45.x = _2674;
    float _2676 = _2648 * _2451;
    float _2678 = -_2648;
    float _2680 = _2678 + 1.0;
    float _2682 = _2470 * _2676;
    float _2684 = _2470 * _2680;
    float _2686 = _2480 * _2676;
    float _2688 = fma(_2476, _2682, _2464);
    float _2690 = fma(_2478, _2682, _2466);
    float _2692 = fma(_2470, _2686, _2468);
    out.m_81.x = _2688;
    out.m_81.y = _2690;
    out.m_81.z = _2692;
    out.m_81.w = _2684;
    if (_2670)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2694;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2751 = as_type<float>(_116);
        out.gl_Position.z = _2751;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_152);
        out.gl_Position.z = _2820;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_49.y;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = in.m_51.x;
    float _188 = in.m_51.y;
    float _190 = in.m_51.z;
    float _192 = in.m_51.w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _196 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = 0.0;
    float _200 = _156;
    if (!_166)
    {
        float _202 = _156 * _156;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _210 = _206;
    if (!_166)
    {
        float _212 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_166;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _156 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _156);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _156 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _200 = _272;
    }
    float _274 = _200;
    out.m_53.y = _154;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    float _282 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_274, _170, _278);
    float _286 = fma(_274, _168, _280);
    float _288 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = fma(_274, _172, _282);
    float _292 = fma(_284, _192, _178);
    float _294 = fma(_286, _192, _176);
    float _296 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = fma(_290, _192, _180);
    float _300 = _190 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _302 = !_276;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_100);
        float _326 = 1.0 / _324;
        float _328 = _134 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _334 = int(_332);
    float _336 = in.m_49.x;
    float _338 = -_154;
    float _340 = _338 + 1.0;
    float _342 = in.m_57.x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _346 = _344 != 0;
    float _348 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _350 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _352 = int(_350);
    float _354 = in.m_57.z;
    float _356 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _348);
    float _358 = in.m_59.w;
    float _360 = float(_100);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _362;
    float _366 = float(_334);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _374 = 1.0 / _364;
    float _376 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _380 = _330 + _378;
    float _382 = float(uint(_352));
    float _384 = _376 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _386 = ~_352;
    int _388 = _386 + 1;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _392 = 1.0 / _366;
    float _394 = 0.0;
    if (!_346)
    {
        _394 = _336;
    }
    float _396 = _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _398;
    float _402 = float(_352);
    float _404 = 1.0 / _382;
    out.m_61.w = _358;
    float _406 = _380 * _374;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _408;
    int _412 = _352 + (-1);
    float _414 = _134 * _392;
    float _416 = in.m_57.w;
    float _418 = 1.0 / _370;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _428 = as_type<int>(_404) + (-2);
    float _430 = trunc(_414);
    int _432 = int(_430);
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _436 = 1.0 / _400;
    float _438 = float(uint(_432));
    float _440 = 1.0 / _360;
    float _442 = as_type<float>(_428) * _438;
    float _444 = trunc(_442);
    float _446 = precise::max(_444, 0.0);
    uint _449 = uint(_446);
    int _451 = as_type<int>(_442);
    float _453 = _396;
    if (_346)
    {
        float _455 = -_336;
        float _457 = _455 + 1.0;
        _451 = as_type<int>(_457);
    }
    int _459 = _451;
    int _461 = _388 * int(_449);
    int _463 = _461 + _432;
    float _465 = float(uint(_463));
    float _467 = in.m_57.y;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = as_type<float>(_428) * _465;
    bool _483 = _276;
    if (_346)
    {
        bool _485 = _342 > 0.5;
        _483 = _485;
    }
    bool _487 = _483;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _491 = _489 != 0;
    if (_346)
    {
        float _493 = _487 ? as_type<float>(_459) : _336;
        _453 = _493;
    }
    float _495 = _453;
    float _497 = trunc(_481);
    float _499 = precise::max(_497, 0.0);
    uint _501 = uint(_499);
    bool _503 = !_479;
    int _505 = _503 ? 0 : 1;
    bool _507 = _354 > 0.5;
    bool _509 = _416 > 0.5;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    bool _515 = !_491;
    int _517 = _515 ? 0 : 1;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _521 = _519 != 0;
    int _523 = _507 ? as_type<int>(_340) : as_type<int>(_154);
    bool _525 = !_475;
    int _527 = _525 ? 0 : 1;
    int _529 = int(_449) + int(_501);
    int _531 = ~_352;
    int _533 = _531 + 1;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _537 = _535 != 0;
    bool _539 = !_513;
    float _541 = _539 ? 7.345489978790283203125 : 1.0;
    int _543 = _533 * _529;
    int _545 = _543 + _432;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _549 = _330 + _547;
    int _551 = abs(_527);
    int _553 = abs(_505);
    float _555 = _549 * _436;
    bool _557 = uint(_545) >= uint(_352);
    float _559 = fma(_410, _406, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _561 = !_471;
    int _563 = _561 ? 0 : 1;
    bool _565 = !_557;
    int _567 = _565 ? 0 : (-1);
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _571 = _569 != 0;
    bool _573 = _467 > 0.5;
    bool _575 = !_571;
    int _577 = _575 ? 0 : 1;
    int _579 = _573 ? as_type<int>(_340) : as_type<int>(_154);
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _583 = _581 != 0;
    float _585 = _521 ? as_type<float>(_579) : _154;
    float _587 = _583 ? as_type<float>(_523) : _154;
    int _589 = _509 ? as_type<int>(_340) : as_type<int>(_154);
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _601 = _599 != 0;
    float _603 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _605 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _607 = ~_529;
    int _609 = _607 + _567;
    int _611 = _609 + 1;
    float _613 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _603);
    float _615 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _605);
    float _617 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _619 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _621 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _613);
    float _623 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _625 = -_372;
    float _627 = fma(_617, 2.0, _625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _635 = _330 + _633;
    float _637 = _541 * _342;
    float _639 = fma(_619, -2.0, _390);
    float _641 = _635 * _418;
    float _643 = 1.0 / _631;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _647 = _330 + _645;
    float _649 = _134 * _402;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _651;
    int _655 = _352 * _611;
    int _657 = _655 + _432;
    float _659 = _649 * _440;
    int _661 = abs(_517);
    float _663 = floor(_637);
    float _665 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    int _667 = 0;
    float _669 = _467;
    if (_597)
    {
        float _671 = -_336;
        float _673 = _671 + 1.0;
        _667 = as_type<int>(_673);
    }
    int _675 = _667;
    float _677 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _679 = _647 * _643;
    float _681 = float(_432);
    float _683 = 1.0 / _653;
    bool _685 = _681 >= _402;
    bool _687 = isnan(_681);
    bool _689 = _685 || _687;
    bool _691 = isnan(_402);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _697;
    float _701 = -_663;
    float _703 = _637 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _709 = fma(_699, _406, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _711 = trunc(_695);
    int _713 = int(_711);
    float _715 = _703 * _402;
    float _717 = _601 ? as_type<float>(_589) : _154;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _721 = _330 + _719;
    bool _723 = _352 == 0;
    float _725 = fma(_422, _406, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _727 = fma(_707, _641, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _729 = _721 * _683;
    bool _731 = !_723;
    int _733 = _731 ? _657 : (-1);
    float _735 = trunc(_715);
    int _737 = int(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _743;
    float _747 = fma(_741, _641, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _749;
    int _753 = ~_713;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _761 = fma(_745, _555, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    int _763 = abs(_563);
    float _765 = fma(_426, _641, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _767 = _733 * _757;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _777 = fma(_751, _555, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _779 = _713 * _412;
    int _781 = _779 + _767;
    float _783 = trunc(_659);
    int _785 = int(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _795 = abs(_577);
    int _797 = _781 * _551;
    float _799 = fma(_789, _679, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _801 = _759 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _805 = fma(_793, _679, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _807 = fma(_775, _679, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _809 = fma(_771, _555, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _811 = _737 * _795;
    int _813 = _811 + _432;
    int _815 = _785 * _763;
    int _817 = _815 + _797;
    float _819 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _823 = fma(_717, _801, -0.5);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _827 = _803 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _829 = _813 * _553;
    int _831 = _829 + _817;
    float _833 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _821);
    bool _835 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _837 = isnan(_330);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[88].w, _825);
    float _849 = fma(_587, _827, -0.5);
    bool _851 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _853 = isnan(_330);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    int _863 = _737 * _661;
    int _865 = _863 + _831;
    float _867 = -_845;
    float _869 = _867 + 1.0;
    bool _871 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _873 = isnan(_330);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_861;
    float _885 = _883 + 1.0;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _891;
    bool _895 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _897 = isnan(_330);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _881 * _869;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _909;
    float _913 = -_881;
    float _915 = _913 + 1.0;
    float _917 = _845 * _885;
    float _919 = fma(_889, _729, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _921 = fma(_893, _729, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _923 = fma(_911, _729, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _925 = _905 * _915;
    float _927 = -_905;
    float _929 = _927 + 1.0;
    float _931 = float(uint(_865));
    bool _933 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _935 = isnan(_330);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    bool _945 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _947 = isnan(_330);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _833);
    float _959 = as_type<float>(_428) * _931;
    float _961 = -_943;
    float _963 = _961 + 1.0;
    int _965 = ~_352;
    int _967 = _965 + 1;
    float _969 = -_665;
    float _971 = fma(_957, _819, _969);
    float _973 = trunc(_959);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = _955 * _963;
    float _981 = _943 * _929;
    float _983 = _943;
    int _985 = as_type<int>(_959);
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _989 = as_type<float>(_763);
    float _991 = _955;
    float _993 = _747;
    if (_513)
    {
        _983 = _342;
    }
    float _995 = _983;
    float _997 = _725 * _979;
    float _999 = _709 * _979;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1003 = _995;
    if (_593)
    {
        float _1005 = -_336;
        float _1007 = _1005 + 1.0;
        _985 = as_type<int>(_1007);
    }
    int _1009 = _985;
    if (!_593)
    {
        _987 = _336;
    }
    float _1011 = _987;
    float _1013 = _559 * _979;
    float _1015 = _1011;
    if (!_513)
    {
        _1003 = _354;
    }
    float _1017 = _1003;
    float _1019 = _1017;
    if (_593)
    {
        float _1021 = _507 ? as_type<float>(_1009) : _336;
        _1015 = _1021;
    }
    float _1023 = _1015;
    int _1025 = _967 * int(_977);
    int _1027 = _1025 + _865;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_513)
    {
        _989 = _467;
    }
    float _1031 = _989;
    float _1033 = _1031;
    if (!_597)
    {
        _1019 = _336;
    }
    float _1035 = _1019;
    float _1037 = -_1001;
    float _1039 = fma(_1029, 2.0, _1037);
    float _1041 = float(uint(_1027));
    float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1045 = _1035;
    if (_597)
    {
        float _1047 = _573 ? as_type<float>(_675) : _336;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = as_type<float>(_428) * _1041;
    if (_513)
    {
        _1033 = _342;
    }
    float _1053 = _1033;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1057 = -_955;
    float _1059 = _1057 + 1.0;
    if (!_513)
    {
        _991 = _354;
    }
    float _1061 = _991;
    float _1063 = trunc(_1051);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1055);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1073 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1075 = _1061;
    if (_513)
    {
        _1075 = _467;
    }
    float _1077 = _1075;
    float _1079 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].x, _999);
    float _1081 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1013);
    float _1083 = -_1071;
    float _1085 = fma(_1073, 2.0, _1083);
    float _1087 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].z, _997);
    float _1089 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[83].w, _434);
    float _1091 = fma(_727, _981, _1079);
    float _1093 = fma(_747, _981, _1081);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1097 = fma(_765, _981, _1087);
    int _1099 = ~_352;
    int _1101 = _1099 + 1;
    float _1103 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1105 = int(_977) + int(_1067);
    float _1107 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1109 = float(uint(_813));
    float _1111 = -_134;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1085);
    float _1115 = fma(_1107, _1023, -0.5);
    if (!_513)
    {
        _993 = _354;
    }
    float _1117 = _993;
    float _1119 = as_type<float>(_428) * _1109;
    int _1121 = _1101 * _1105;
    int _1123 = _1121 + _865;
    float _1125 = _1117;
    if (_513)
    {
        _1125 = _467;
    }
    float _1127 = _1125;
    float _1129 = -_134;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1039);
    float _1133 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1137 = trunc(_1119);
    float _1139 = precise::max(_1137, 0.0);
    uint _1141 = uint(_1139);
    float _1143 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1145 = uint(_1123) >= uint(_352);
    float _1147 = fma(_761, _925, _1091);
    float _1149 = fma(_1143, -2.0, _1135);
    float _1151 = fma(_1133, _1049, -0.5);
    bool _1153 = !_1145;
    int _1155 = _1153 ? 0 : (-1);
    float _1157 = fma(_777, _925, _1093);
    int _1159 = ~_352;
    int _1161 = _1159 + 1;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1165 = ~_1105;
    int _1167 = _1165 + _1155;
    int _1169 = _1167 + 1;
    float _1171 = fma(_809, _925, _1097);
    float _1173 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1163);
    if (!_513)
    {
        _669 = _342;
    }
    float _1175 = _669;
    int _1177 = _352 * _1169;
    int _1179 = _1177 + _865;
    float _1181 = -_134;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    int _1185 = _1161 * int(_1141);
    int _1187 = _1185 + _813;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1173);
    bool _1193 = !_723;
    int _1195 = _1193 ? _1179 : (-1);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _384 + _1197;
    float _1201 = float(uint(_1187));
    float _1203 = fma(_1191, _1103, _1183);
    int _1205 = _1195 >> 31;
    float _1207 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1209 = as_type<float>(_428) * _1201;
    int _1211 = _1205 & 3;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1215 = _677 + _1213;
    float _1217 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1221 = _1195 + _1211;
    float _1223 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1225 = trunc(_1209);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    int _1231 = _1195 & 3;
    bool _1233 = _1231 != 0;
    float _1235 = fma(_805, _907, _1157);
    int _1237 = _1221 >> 2;
    float _1239 = fma(_807, _907, _1171);
    int _1241 = _1233 ? 0 : 1;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1223 + _1243;
    int _1247 = _1237 << 4;
    int _1249 = _1247 + 368;
    float _1251 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1253 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1217);
    float _1255 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    uint _1257 = uint(int(uint(_1249) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    float _1273 = fma(_1251, _1115, _1113);
    float _1275 = fma(_799, _907, _1147);
    int _1277 = _1195 & 3;
    bool _1279 = _1277 != 0;
    float _1281 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _847);
    float _1283 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1285 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1149);
    bool _1287 = uint(_1277) > 1u;
    int _1289 = _1249 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = _1277 != 3;
    float _1309 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1253);
    int _1311 = ~_1241;
    int _1313 = _1311 + 1;
    int _1315 = _1313 + 1;
    float _1317 = -_1285;
    float _1319 = fma(_1283, _823, _1317);
    float _1321 = fma(_1255, -2.0, _1219);
    bool _1323 = uint(_1277) >= 2u;
    float _1325 = fma(_921, _917, _1235);
    bool _1327 = !_1279;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1321);
    bool _1333 = _1309 >= 0.0;
    float _1335 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    int _1337 = _1315;
    float _1339 = _1239;
    int _1341 = as_type<int>(_1319);
    if (!_1287)
    {
        int _1343 = ~_1241;
        int _1345 = _1343 + 1;
        _1337 = _1345;
    }
    int _1347 = _1337;
    float _1349 = fma(_919, _917, _1275);
    int _1351 = ~_352;
    int _1353 = _1351 + 1;
    float _1355 = -_1331;
    float _1357 = fma(_1281, _849, _1355);
    int _1359 = abs(_1347);
    float _1361 = fma(_923, _917, _1239);
    int _1363 = int(_1141) + int(_1229);
    float _1365 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1349);
    int _1367 = _1323 ? 0 : 1;
    float _1369 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1325);
    int _1371 = abs(_1329);
    int _1373 = _1353 * _1363;
    int _1375 = _1373 + _813;
    float _1377 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1361);
    int _1379 = ~_1367;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    float _1385 = fma(_1335, _1151, _1131);
    int _1387 = _1383;
    if (_1307)
    {
        int _1389 = ~_1367;
        int _1391 = _1389 + 1;
        _1387 = _1391;
    }
    int _1393 = _1387;
    if (_1333)
    {
        out.m_45.x = 0.0;
    }
    int _1395 = ~_1359;
    int _1397 = _1395 + 1;
    int _1399 = _1397 + 1;
    float _1401 = _1385 + 0.5;
    int _1403 = abs(_1393);
    float _1405 = _1357 + 0.5;
    int _1407 = ~_1371;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    bool _1413 = uint(_1375) >= uint(_352);
    if (_1333)
    {
        _1339 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1415 = _1339;
    out.m_63.x = _1401;
    out.m_63.y = _1405;
    int _1417 = _1399 * as_type<int>(_1271);
    int _1419 = ~_1403;
    int _1421 = _1419 + 1;
    int _1423 = _1421 + 1;
    float _1425 = _1199 * _1199;
    bool _1427 = !_1413;
    int _1429 = _1427 ? 0 : (-1);
    int _1431 = _1411 * as_type<int>(_1263);
    int _1433 = _1431 + _1417;
    bool _1435 = _1277 != 3;
    float _1437 = _1203 + 0.5;
    bool _1439 = !_537;
    int _1441 = _1439 ? 0 : 1;
    int _1443 = _1423 * as_type<int>(_1297);
    int _1445 = _1443 + _1433;
    bool _1447 = !_1435;
    int _1449 = _1447 ? 0 : (-1);
    int _1451 = ~_1363;
    int _1453 = _1451 + _1429;
    int _1455 = _1453 + 1;
    int _1457 = abs(_1449);
    int _1459 = abs(_1441);
    float _1461 = fma(_1215, _1215, _1425);
    int _1463 = ~_1457;
    int _1465 = _1463 + 1;
    int _1467 = _1465 + 1;
    int _1469 = _352 * _1455;
    int _1471 = _1469 + _813;
    float _1473 = _1319 + 0.5;
    int _1475 = ~_1459;
    int _1477 = _1475 + 1;
    int _1479 = _1477 + 1;
    if (_1333)
    {
        float _1481 = _1415 * 5.0;
        _1341 = as_type<int>(_1481);
    }
    int _1483 = _1341;
    int _1485 = _1467 * as_type<int>(_1305);
    int _1487 = _1485 + _1445;
    float _1489 = fma(_1245, _1245, _1461);
    float _1491 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1493 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1495 = _1487 * _1479;
    bool _1497 = !_723;
    int _1499 = _1497 ? _1471 : (-1);
    float _1501 = _971 + 0.5;
    float _1503 = rsqrt(_1489);
    float _1505 = _1273 + 0.5;
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1509 = _1499 * _1459;
    int _1511 = _1509 + _1495;
    float _1513 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1515 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1437;
    out.m_65.y = _1501;
    out.m_65.z = _1505;
    out.m_65.w = _1473;
    float _1517 = float(_1511);
    float _1519 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = as_type<float>(_1483);
    if (_1333)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5008 = as_type<float>(_1483);
        out.gl_Position.z = _5008;
    }
    out.m_67.x = _1517;
    out.m_69.x = _1519;
    out.m_69.y = _1507;
    out.m_69.z = _1515;
    float _1523 = _1199 * _1503;
    float _1525 = _1215 * _1503;
    if (_1333)
    {
        return out;
    }
    float _1527 = -_1523;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _384);
    float _1531 = _1245 * _1503;
    float _1533 = -_1525;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _677);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1539 = _1529 + _1537;
    float _1541 = -_1531;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1223);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1547 = _1535 + _1545;
    float _1549 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1543 + _1551;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1549);
    float _1557 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    bool _1559 = _1557 >= 0.0;
    float _1561 = _1543;
    if (_1559)
    {
        _1521 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1563 = _1521;
    int _1565 = as_type<int>(_1563);
    if (_1559)
    {
        out.m_45.x = 0.0;
    }
    if (_1559)
    {
        float _1567 = _1563 * 5.0;
        _1565 = as_type<int>(_1567);
    }
    int _1569 = _1565;
    if (_1559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5113 = as_type<float>(_1569);
        out.gl_Position.z = _5113;
    }
    if (_1559)
    {
        return out;
    }
    float _1571 = -_384;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = -_677;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1579 = -_1223;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1583 = _1573 * _1573;
    float _1585 = -_1523;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1589 = fma(_1577, _1577, _1583);
    float _1591 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1593 = -_1525;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1215);
    float _1597 = fma(_1581, _1581, _1589);
    float _1599 = -_1591;
    float _1601 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1603 = _1587 * _1587;
    float _1605 = rsqrt(_1597);
    float _1607 = -_1531;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1611 = _354 * 6.283185482025146484375;
    float _1613 = fma(_134, 0.310000002384185791015625, _1611);
    float _1615 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1617 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1619 = -_1615;
    float _1621 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1619);
    float _1623 = -_1617;
    float _1625 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1623);
    float _1627 = _1577 * _1605;
    float _1629 = _1581 * _1605;
    float _1631 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1633 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1635 = _1627 * _1627;
    float _1637 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1639 = -_1631;
    float _1641 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1643 = _1573 * _1605;
    float _1645 = fma(_1629, _1629, _1635);
    float _1647 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1649 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1651 = -_1637;
    float _1653 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1651);
    float _1655 = rsqrt(_1645);
    float _1657 = -_1647;
    float _1659 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1657);
    float _1661 = -_1649;
    float _1663 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1661);
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1641);
    float _1667 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1669 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1671 = -_1633;
    float _1673 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1671);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1677 = -_1667;
    float _1679 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1677);
    float _1681 = -_1669;
    float _1683 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1681);
    float _1685 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1673);
    float _1687 = _1629 * _1655;
    float _1689 = _1627 * _1655;
    float _1691 = -_1675;
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1691);
    float _1695 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1653);
    float _1697 = -_1687;
    float _1699 = _1629 * _1697;
    float _1701 = -_1687;
    float _1703 = _1643 * _1701;
    float _1705 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1693);
    float _1707 = -_1699;
    float _1709 = fma(_1627, _1689, _1707);
    float _1711 = _1643 * _1689;
    float _1713 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1679);
    float _1715 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1717 = _1709 * _1709;
    float _1719 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = -_1713;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1705);
    float _1725 = -_1715;
    float _1727 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1725);
    float _1729 = fma(_1711, _1711, _1717);
    float _1731 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1733 = -_1719;
    float _1735 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1733);
    float _1737 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1727);
    float _1739 = fma(_1703, _1703, _1729);
    float _1741 = 1.0 / _1723;
    float _1743 = -_1731;
    float _1745 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1743);
    float _1747 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1735);
    float _1749 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1745);
    float _1751 = rsqrt(_1739);
    float _1753 = fma(_1737, _1741, -1.0);
    float _1755 = 1.0 / _296;
    float _1757 = _1709 * _1751;
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = 1.0 / _300;
    float _1763 = -_1759;
    float _1765 = _1763 + 1.0;
    float _1767 = _1765 * _1741;
    float _1769 = fma(_1765, _1753, 1.0);
    float _1771 = 1.0 / _288;
    float _1773 = _1749 * _1767;
    float _1775 = _1769 * _1769;
    float _1777 = _1747 * _1767;
    float _1779 = fma(_1773, _1773, _1775);
    float _1781 = fma(_1777, _1777, _1779);
    float _1783 = rsqrt(_1781);
    float _1785 = _1777 * _1783;
    float _1787 = _1773 * _1783;
    float _1789 = _1769 * _1783;
    float _1791 = -_1785;
    float _1793 = _1627 * _1791;
    float _1795 = _1629 * _1789;
    float _1797 = -_1787;
    float _1799 = -_1793;
    float _1801 = fma(_1629, _1797, _1799);
    float _1803 = -_1787;
    float _1805 = _1643 * _1803;
    float _1807 = -_1785;
    float _1809 = -_1795;
    float _1811 = fma(_1643, _1807, _1809);
    float _1813 = _1801 * _1801;
    float _1815 = -_1805;
    float _1817 = fma(_1627, _1789, _1815);
    float _1819 = fma(_1811, _1811, _1813);
    float _1821 = fma(_1817, _1817, _1819);
    float _1823 = rsqrt(_1821);
    float _1825 = _1811 * _1823;
    float _1827 = _1817 * _1823;
    float _1829 = _1801 * _1823;
    float _1831 = _1629 * _1825;
    float _1833 = _1643 * _1827;
    float _1835 = -_1831;
    float _1837 = fma(_1627, _1827, _1835);
    float _1839 = _1627 * _1829;
    float _1841 = -_1833;
    float _1843 = fma(_1629, _1829, _1841);
    float _1845 = _1837 * _1837;
    float _1847 = -_1839;
    float _1849 = fma(_1643, _1825, _1847);
    float _1851 = fma(_1595, _1595, _1603);
    float _1853 = in.m_71.x;
    float _1855 = in.m_71.y;
    float _1857 = in.m_71.z;
    float _1859 = fma(_1843, _1843, _1845);
    float _1861 = fma(_1609, _1609, _1851);
    float _1863 = fma(_1849, _1849, _1859);
    float _1865 = sqrt(_1861);
    float _1867 = rsqrt(_1863);
    float _1869 = _1771 * _1853;
    float _1871 = _1761 * _1857;
    float _1873 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1875 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1877 = _342 * 6.283185482025146484375;
    float _1879 = _1849 * _1867;
    float _1881 = _1837 * _1867;
    float _1883 = _1843 * _1867;
    float _1885 = -_154;
    float _1887 = fma(_1885, 0.5, 0.5);
    float _1889 = _1627 * _1879;
    float _1891 = _1629 * _1881;
    float _1893 = -_1889;
    float _1895 = fma(_1629, _1883, _1893);
    float _1897 = -_1891;
    float _1899 = fma(_1643, _1879, _1897);
    float _1901 = _1643 * _1883;
    float _1903 = _1895 * _1895;
    float _1905 = -_1901;
    float _1907 = fma(_1627, _1881, _1905);
    float _1909 = fma(_1899, _1899, _1903);
    float _1911 = _1755 * _1855;
    float _1913 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1869);
    float _1917 = fma(_1907, _1907, _1909);
    float _1919 = _1503 * _1865;
    float _1921 = rsqrt(_1917);
    float _1923 = _1873 * _1919;
    float _1925 = _1913 * _1919;
    float _1927 = _1875 * _1919;
    float _1929 = fma(_134, 0.10999999940395355224609375, _1877);
    float _1931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1911);
    float _1933 = _1923 * _1915;
    float _1935 = _1613 * 0.15915493667125701904296875;
    float _1937 = _1935 * 6.283185482025146484375;
    float _1939 = sin(_1937);
    float _1941 = _1895 * _1921;
    float _1943 = _1925 * _1931;
    float _1945 = _1899 * _1921;
    float _1947 = _1907 * _1921;
    float _1949 = _1871 * _1927;
    float _1951 = _1943 * _1881;
    float _1953 = _1943 * _1883;
    float _1955 = _1943 * _1879;
    float _1957 = _1929 * 0.15915493667125701904296875;
    float _1959 = fma(_1933, _1941, _1951);
    float _1961 = fma(_1933, _1945, _1953);
    float _1963 = fma(_1933, _1947, _1955);
    float _1965 = fma(_1643, _1949, _1959);
    float _1967 = _1957 * 6.283185482025146484375;
    float _1969 = sin(_1967);
    float _1971 = fma(_1627, _1949, _1961);
    float _1973 = fma(_1629, _1949, _1963);
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1979 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1981 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1975);
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1977);
    float _1985 = _384 + _1965;
    float _1987 = fma(_1939, 0.12999999523162841796875, 1.0);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1981);
    float _1991 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1979);
    float _1993 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1983);
    float _1995 = _677 + _1971;
    float _1997 = _1927 * _1989;
    float _1999 = fma(_1969, 0.300000011920928955078125, _1987);
    float _2001 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1991);
    float _2003 = _1925 * _1993;
    float _2005 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2009 = _1923 * _2001;
    float _2011 = _1999 * _1887;
    float _2013 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2005);
    float _2015 = _1223 + _1973;
    float _2017 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2007);
    float _2019 = _1925 * _2011;
    float _2021 = _2019 * 2.0;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2013);
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2027 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2017);
    float _2029 = _2015 + _2023;
    float _2031 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2025);
    float _2033 = _1995 + _2027;
    float _2035 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2029);
    float _2037 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2031);
    float _2039 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2033);
    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2043 = _2035 + _2041;
    float _2045 = _1985 + _2037;
    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2049 = _2039 + _2047;
    float _2051 = _2043 * _2043;
    float _2053 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2045);
    float _2055 = fma(_2049, _2049, _2051);
    float _2057 = sqrt(_2055);
    bool _2059 = _2057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = _2051;
    float _2063 = _2039;
    float _2065 = _2035;
    float _2067 = _2045;
    float _2069 = _2043;
    float _2071 = _2053;
    float _2073 = _2011;
    float _2075 = _1945;
    if (!_2059)
    {
        _2061 = _2039;
    }
    float _2077 = _2061;
    float _2079 = _2077;
    if (!_2059)
    {
        _2063 = _2035;
    }
    float _2081 = _2063;
    float _2083 = _2081;
    if (!_2059)
    {
        _2065 = _2053;
    }
    float _2085 = _2065;
    bool _2087 = !_2059;
    float _2089 = _2085;
    if (!_2087)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2095 = _2057 + _2093;
        float _2097 = rsqrt(_2055);
        float _2099 = _2095 * _2091;
        float _2101 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2103 = _2099 * 0.15915493667125701904296875;
        float _2105 = _2103 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        float _2109 = _2103 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = fma(_2107, _2101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2115 = _2097 * _2113;
        float _2117 = _2111 + (-1.0);
        float _2119 = fma(_2049, _2115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2121 = fma(_2043, _2115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2123 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2125 = fma(_2053, _2111, _2123);
        _2089 = _2125;
        _2079 = _2119;
        _2083 = _2121;
        _2067 = _2103;
    }
    float _2127 = _2089;
    float _2129 = _2079;
    float _2131 = _2083;
    float _2133 = _2067;
    float _2135 = -_1523;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2127);
    float _2139 = -_1525;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2129);
    float _2143 = -_1531;
    float _2145 = fma(_2143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2131);
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2149 = _2137 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2153 = _2141 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2157 = _2145 + _2155;
    float _2159 = _2149 * _2149;
    float _2161 = fma(_2153, _2153, _2159);
    float _2163 = fma(_2157, _2157, _2161);
    float _2165 = rsqrt(_2163);
    float _2167 = sqrt(_2163);
    float _2169 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2171 = _2153 * _2169;
    float _2173 = _2157 * _2169;
    float _2175 = _2171 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 + _2177;
    float _2181 = sqrt(_2179);
    bool _2183 = _2181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = _2181 + _2185;
    float _2189 = _2057;
    float _2191 = _2133;
    float _2193 = _2187;
    if (_2183)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2189 = _2195;
    }
    float _2197 = _2189;
    if (_2183)
    {
        float _2199 = rsqrt(_2179);
        _2191 = _2199;
    }
    float _2201 = _2191;
    float _2203 = _2201;
    if (_2183)
    {
        float _2205 = _2187 * _2197;
        _2193 = _2205;
    }
    float _2207 = _2193;
    if (_2183)
    {
        float _2209 = _2207 * 0.15915493667125701904296875;
        _2069 = _2209;
    }
    float _2211 = _2069;
    float _2213 = _1523;
    float _2215 = _2211;
    if (_2183)
    {
        float _2217 = _2211 * 6.283185482025146484375;
        float _2219 = sin(_2217);
        _2213 = _2219;
    }
    float _2221 = _2213;
    float _2223 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2225 = precise::max(0.0, _2223);
    float _2227 = _2049;
    float _2229 = _2225;
    float _2231 = _2223;
    if (_2183)
    {
        float _2233 = _2211 * 6.283185482025146484375;
        float _2235 = cos(_2233);
        _2227 = _2235;
    }
    float _2237 = _2227;
    float _2239 = -_2169;
    float _2241 = -_2225;
    float _2243 = fma(_2149, _2239, _2241);
    if (_2183)
    {
        float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2245;
    }
    float _2247 = _2229;
    float _2249 = _2247;
    float _2251 = _2221;
    if (_2183)
    {
        float _2253 = fma(_2221, _2247, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2071 = _2253;
    }
    float _2255 = _2071;
    float _2257 = _2255;
    if (!_2183)
    {
        _2249 = _2171;
    }
    float _2259 = _2249;
    float _2261 = _2259;
    if (!_2183)
    {
        _2251 = _2243;
    }
    float _2263 = _2251;
    float _2265 = _2263;
    if (_2183)
    {
        float _2267 = _2237 + (-1.0);
        _2231 = _2267;
    }
    float _2269 = _2231;
    float _2271 = _2269;
    if (_2183)
    {
        float _2273 = _2201 * _2255;
        _2073 = _2273;
    }
    float _2275 = _2073;
    if (!_2183)
    {
        _2203 = _2173;
    }
    float _2277 = _2203;
    float _2279 = _2277;
    if (_2183)
    {
        float _2281 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2215 = _2281;
    }
    float _2283 = _2215;
    if (_2183)
    {
        float _2285 = _2171 * _2275;
        _2261 = _2285;
    }
    float _2287 = _2261;
    if (!_2183)
    {
        _2257 = _2175;
    }
    float _2289 = _2257;
    float _2291 = _2289;
    if (_2183)
    {
        float _2293 = _2173 * _2275;
        _2279 = _2293;
    }
    float _2295 = _2279;
    if (_2183)
    {
        float _2297 = fma(_2243, _2237, _2283);
        _2265 = _2297;
    }
    float _2299 = _2265;
    if (_2183)
    {
        float _2301 = _2287 * _2287;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (!_2183)
    {
        _2271 = _2177;
    }
    float _2305 = _2271;
    float _2307 = _2305;
    if (_2183)
    {
        float _2309 = _2295 * _2295;
        _2307 = _2309;
    }
    float _2311 = _2307;
    float _2313 = fma(_2299, _2299, _2303);
    float _2315 = _2313 + _2311;
    float _2317 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2321 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2319);
    float _2323 = precise::clamp(_2321, 0.0, 1.0);
    float _2325 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2327 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2329 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2317);
    float _2331 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2333 = rsqrt(_2315);
    float _2335 = -_2323;
    float _2337 = _2335 + 1.0;
    float _2339 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2325);
    float _2341 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2331);
    float _2343 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2345 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2329);
    float _2347 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2339);
    float _2349 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2341);
    float _2351 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2343);
    float _2353 = abs(_2337);
    float _2355 = log2(_2353);
    float _2357 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2359 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2361 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2351);
    float _2363 = _2345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2365 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2367 = _2333 * _2287;
    float _2369 = _2333 * _2295;
    float _2371 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2373 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2365);
    float _2375 = _2333 * _2299;
    float _2377 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2379 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2373);
    float _2383 = -_2371;
    float _2385 = fma(_2383, _2327, 1.0);
    float _2387 = -_2377;
    float _2389 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2387);
    float _2391 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2381);
    float _2395 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2397 = -_2369;
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2389);
    float _2401 = log2(_2385);
    float _2403 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2395);
    float _2407 = fma(_2399, -0.5, 0.5);
    float _2409 = fma(_2399, 0.5, 0.5);
    float _2411 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2405);
    float _2415 = _2375 + 1.0;
    float _2417 = 1.0 / _2393;
    float _2419 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2411);
    float _2421 = fma(_2409, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2423 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2413);
    float _2425 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2427 = fma(_2409, _2421, -0.212114393711090087890625);
    float _2429 = exp2(_2391);
    float _2431 = _2401 * 0.693147182464599609375;
    float _2433 = fma(_2409, _2427, 1.570728778839111328125);
    float _2435 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2437 = sqrt(_2407);
    float _2439 = _2423 * _2417;
    float _2441 = _2425 * _2417;
    float _2443 = fma(_2439, 0.5, 0.5);
    float _2445 = fma(_2441, -0.5, 0.5);
    float _2447 = -_2375;
    float _2449 = fma(_2429, _2415, _2447);
    float3 _6582 = float3(_2443, _2445, _2435);
    float _2451 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6582, float3(0.0), isnan(_6582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6582, float3(0.0), isnan(_6582)), level(0.0)).x;
    float _2453 = fma(_2449, 0.5, 0.5);
    float _2455 = _2437 * 0.636619746685028076171875;
    float _2457 = -_2433;
    float _2459 = fma(_2455, _2457, 1.0);
    float3 _6603 = float3(_2443, _2445, _2435);
    float4 _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6603, float3(0.0), isnan(_6603)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6603, float3(0.0), isnan(_6603)), level(0.0)).xyzw;
    float _2464 = _2462.x;
    float _2466 = _2462.y;
    float _2468 = _2462.z;
    float _2470 = _2462.w;
    float2 _6620 = float2(_2459, _2453);
    float3 _2474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6620, float2(0.0), isnan(_6620)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6620, float2(0.0), isnan(_6620)), level(0.0)).xyz;
    float _2476 = _2474.x;
    float _2478 = _2474.y;
    float _2480 = _2474.z;
    float _2482 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2484 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2486 = isnan(0.5);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2492 = _2488 || _2490;
    float _2494 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2496 = _1911 != 0.0;
    bool _2498 = isnan(_1911);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(0.0);
    bool _2504 = _2500 || _2502;
    float _2506 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2482);
    float _2508 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2510 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2494);
    bool _2512 = _1869 == 0.0;
    bool _2514 = !_2504;
    bool _2516 = _2512 && _2514;
    float _2518 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2506);
    float _2520 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2522 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2510);
    bool _2524 = _1871 == 0.0;
    bool _2526 = _2524 && _2516;
    float _2528 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2530 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2520);
    float _2532 = in.m_73.x;
    float _2534 = in.m_73.y;
    float _2536 = in.m_73.z;
    float _2538 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2540 = 1.0 / _2528;
    if (!_2492)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2542 = _1561;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    float _2544 = _2538 + _2528;
    float _2546 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2530);
    out.m_69.x = _1519;
    out.m_69.y = _1507;
    out.m_69.z = _1515;
    out.m_75.x = _2153;
    out.m_75.y = _2149;
    out.m_75.z = _2157;
    float _2548 = _2544 * _2540;
    float _2550 = _2548 * 0.5;
    float _2552 = _2540;
    float _2554 = _2550;
    float _2556 = _2542;
    if (!_2492)
    {
        float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2560 = fma(_2550, _2542, _2558);
        _2552 = _2560;
    }
    float _2562 = _2552;
    if (!_2492)
    {
        _2554 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2564 = _2554;
    float _2566 = _2534;
    float _2568 = _2532;
    float _2570 = _2536;
    float _2572 = _2564;
    if (!_2526)
    {
        float _2574 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2534);
        _2566 = _2574;
    }
    float _2576 = _2566;
    if (!_2526)
    {
        float _2578 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2532);
        _2568 = _2578;
    }
    float _2580 = _2568;
    if (!_2526)
    {
        float _2582 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2536);
        _2570 = _2582;
    }
    float _2584 = _2570;
    float _2586 = _1881 * _2576;
    if (!_2492)
    {
        float _2588 = -_2564;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2556 = _2590;
    }
    float _2592 = _2556;
    float _2594 = _2562;
    if (!_2492)
    {
        float _2596 = 1.0 / _2562;
        _2594 = _2596;
    }
    float _2598 = _2594;
    float _2600 = _1883 * _2576;
    float _2602 = fma(_1941, _2580, _2586);
    float _2604 = _1879 * _2576;
    float _2606 = fma(_1945, _2580, _2600);
    if (_2492)
    {
        _2075 = 1.0;
    }
    float _2608 = _2075;
    float _2610 = fma(_1947, _2580, _2604);
    float _2612 = exp2(_2508);
    float _2614 = fma(_1627, _2584, _2606);
    float _2616 = fma(_1643, _2584, _2602);
    float _2618 = fma(_1629, _2584, _2610);
    float _2620 = _2393 * 0.5;
    float _2622 = _2592;
    float _2624 = _2608;
    if (!_2492)
    {
        float _2626 = 1.0 / _2592;
        _2622 = _2626;
    }
    float _2628 = _2622;
    if (!_2492)
    {
        float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2632 = -_2564;
        float _2634 = fma(_2598, _2630, _2632);
        _2572 = _2634;
    }
    float _2636 = _2572;
    float _2638 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2546);
    float _2640 = _2423 + _2393;
    out.m_77.x = _2614;
    out.m_77.y = _2616;
    out.m_77.z = _2618;
    float _2642 = _2640 * 0.5;
    float _2644 = -_2612;
    float _2646 = _2644 + 1.0;
    out.gl_Position.x = _2423;
    out.gl_Position.y = _2425;
    out.gl_Position.z = _2638;
    out.gl_Position.w = _2393;
    float _2648 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2492)
    {
        float _2650 = _2636 * _2628;
        float _2652 = precise::clamp(_2650, 0.0, 1.0);
        _2624 = _2652;
    }
    float _2654 = _2624;
    float _2656 = _2638 + _2393;
    float _2658 = fma(_2425, -0.5, _2620);
    float _2660 = _2654 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2662 = _2654 > 0.0;
    bool _2664 = isnan(_2654);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = _2656 * 0.5;
    float _2674 = _2660 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = _2642;
    out.m_79.y = _2658;
    out.m_79.z = _2672;
    out.m_79.w = _2393;
    out.m_45.x = _2674;
    float _2676 = _2648 * _2451;
    float _2678 = -_2648;
    float _2680 = _2678 + 1.0;
    float _2682 = _2470 * _2676;
    float _2684 = _2470 * _2680;
    float _2686 = _2480 * _2676;
    float _2688 = fma(_2476, _2682, _2464);
    float _2690 = fma(_2478, _2682, _2466);
    float _2692 = fma(_2470, _2686, _2468);
    out.m_81.x = _2688;
    out.m_81.y = _2690;
    out.m_81.z = _2692;
    out.m_81.w = _2684;
    if (_2670)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2694;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2751 = as_type<float>(_116);
        out.gl_Position.z = _2751;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_152);
        out.gl_Position.z = _2820;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_49.y;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = in.m_51.x;
    float _188 = in.m_51.y;
    float _190 = in.m_51.z;
    float _192 = in.m_51.w;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _196 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = 0.0;
    float _200 = _156;
    if (!_166)
    {
        float _202 = _156 * _156;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _210 = _206;
    if (!_166)
    {
        float _212 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_166;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _156 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _156);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _156 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _200 = _272;
    }
    float _274 = _200;
    out.m_53.y = _154;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    float _282 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_274, _170, _278);
    float _286 = fma(_274, _168, _280);
    float _288 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = fma(_274, _172, _282);
    float _292 = fma(_284, _192, _178);
    float _294 = fma(_286, _192, _176);
    float _296 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = fma(_290, _192, _180);
    float _300 = _190 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _302 = !_276;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_100);
        float _326 = 1.0 / _324;
        float _328 = _134 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _334 = int(_332);
    float _336 = in.m_49.x;
    float _338 = -_154;
    float _340 = _338 + 1.0;
    float _342 = in.m_57.x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _346 = _344 != 0;
    float _348 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _350 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _352 = int(_350);
    float _354 = in.m_57.z;
    float _356 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _348);
    float _358 = in.m_59.w;
    float _360 = float(_100);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _362;
    float _366 = float(_334);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _374 = 1.0 / _364;
    float _376 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _380 = _330 + _378;
    float _382 = float(uint(_352));
    float _384 = _376 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _386 = ~_352;
    int _388 = _386 + 1;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _392 = 1.0 / _366;
    float _394 = 0.0;
    if (!_346)
    {
        _394 = _336;
    }
    float _396 = _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _398;
    float _402 = float(_352);
    float _404 = 1.0 / _382;
    out.m_61.w = _358;
    float _406 = _380 * _374;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _408;
    int _412 = _352 + (-1);
    float _414 = _134 * _392;
    float _416 = in.m_57.w;
    float _418 = 1.0 / _370;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _428 = as_type<int>(_404) + (-2);
    float _430 = trunc(_414);
    int _432 = int(_430);
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _436 = 1.0 / _400;
    float _438 = float(uint(_432));
    float _440 = 1.0 / _360;
    float _442 = as_type<float>(_428) * _438;
    float _444 = trunc(_442);
    float _446 = precise::max(_444, 0.0);
    uint _449 = uint(_446);
    int _451 = as_type<int>(_442);
    float _453 = _396;
    if (_346)
    {
        float _455 = -_336;
        float _457 = _455 + 1.0;
        _451 = as_type<int>(_457);
    }
    int _459 = _451;
    int _461 = _388 * int(_449);
    int _463 = _461 + _432;
    float _465 = float(uint(_463));
    float _467 = in.m_57.y;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = as_type<float>(_428) * _465;
    bool _483 = _276;
    if (_346)
    {
        bool _485 = _342 > 0.5;
        _483 = _485;
    }
    bool _487 = _483;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _491 = _489 != 0;
    if (_346)
    {
        float _493 = _487 ? as_type<float>(_459) : _336;
        _453 = _493;
    }
    float _495 = _453;
    float _497 = trunc(_481);
    float _499 = precise::max(_497, 0.0);
    uint _501 = uint(_499);
    bool _503 = !_479;
    int _505 = _503 ? 0 : 1;
    bool _507 = _354 > 0.5;
    bool _509 = _416 > 0.5;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    bool _515 = !_491;
    int _517 = _515 ? 0 : 1;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _521 = _519 != 0;
    int _523 = _507 ? as_type<int>(_340) : as_type<int>(_154);
    bool _525 = !_475;
    int _527 = _525 ? 0 : 1;
    int _529 = int(_449) + int(_501);
    int _531 = ~_352;
    int _533 = _531 + 1;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _537 = _535 != 0;
    bool _539 = !_513;
    float _541 = _539 ? 7.345489978790283203125 : 1.0;
    int _543 = _533 * _529;
    int _545 = _543 + _432;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _549 = _330 + _547;
    int _551 = abs(_527);
    int _553 = abs(_505);
    float _555 = _549 * _436;
    bool _557 = uint(_545) >= uint(_352);
    float _559 = fma(_410, _406, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _561 = !_471;
    int _563 = _561 ? 0 : 1;
    bool _565 = !_557;
    int _567 = _565 ? 0 : (-1);
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _571 = _569 != 0;
    bool _573 = _467 > 0.5;
    bool _575 = !_571;
    int _577 = _575 ? 0 : 1;
    int _579 = _573 ? as_type<int>(_340) : as_type<int>(_154);
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _583 = _581 != 0;
    float _585 = _521 ? as_type<float>(_579) : _154;
    float _587 = _583 ? as_type<float>(_523) : _154;
    int _589 = _509 ? as_type<int>(_340) : as_type<int>(_154);
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _593 = _591 != 0;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _601 = _599 != 0;
    float _603 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _605 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _607 = ~_529;
    int _609 = _607 + _567;
    int _611 = _609 + 1;
    float _613 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _603);
    float _615 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _605);
    float _617 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _619 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _621 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _613);
    float _623 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _615);
    float _625 = -_372;
    float _627 = fma(_617, 2.0, _625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _635 = _330 + _633;
    float _637 = _541 * _342;
    float _639 = fma(_619, -2.0, _390);
    float _641 = _635 * _418;
    float _643 = 1.0 / _631;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _647 = _330 + _645;
    float _649 = _134 * _402;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _651;
    int _655 = _352 * _611;
    int _657 = _655 + _432;
    float _659 = _649 * _440;
    int _661 = abs(_517);
    float _663 = floor(_637);
    float _665 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    int _667 = 0;
    float _669 = _467;
    if (_597)
    {
        float _671 = -_336;
        float _673 = _671 + 1.0;
        _667 = as_type<int>(_673);
    }
    int _675 = _667;
    float _677 = _621 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _679 = _647 * _643;
    float _681 = float(_432);
    float _683 = 1.0 / _653;
    bool _685 = _681 >= _402;
    bool _687 = isnan(_681);
    bool _689 = _685 || _687;
    bool _691 = isnan(_402);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _697;
    float _701 = -_663;
    float _703 = _637 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _709 = fma(_699, _406, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _711 = trunc(_695);
    int _713 = int(_711);
    float _715 = _703 * _402;
    float _717 = _601 ? as_type<float>(_589) : _154;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _721 = _330 + _719;
    bool _723 = _352 == 0;
    float _725 = fma(_422, _406, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _727 = fma(_707, _641, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _729 = _721 * _683;
    bool _731 = !_723;
    int _733 = _731 ? _657 : (-1);
    float _735 = trunc(_715);
    int _737 = int(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _743;
    float _747 = fma(_741, _641, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _749;
    int _753 = ~_713;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _761 = fma(_745, _555, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    int _763 = abs(_563);
    float _765 = fma(_426, _641, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _767 = _733 * _757;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _777 = fma(_751, _555, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _779 = _713 * _412;
    int _781 = _779 + _767;
    float _783 = trunc(_659);
    int _785 = int(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _795 = abs(_577);
    int _797 = _781 * _551;
    float _799 = fma(_789, _679, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _801 = _759 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _805 = fma(_793, _679, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _807 = fma(_775, _679, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _809 = fma(_771, _555, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _811 = _737 * _795;
    int _813 = _811 + _432;
    int _815 = _785 * _763;
    int _817 = _815 + _797;
    float _819 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _823 = fma(_717, _801, -0.5);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _827 = _803 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _829 = _813 * _553;
    int _831 = _829 + _817;
    float _833 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _821);
    bool _835 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _837 = isnan(_330);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[88].w, _825);
    float _849 = fma(_587, _827, -0.5);
    bool _851 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _853 = isnan(_330);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    int _863 = _737 * _661;
    int _865 = _863 + _831;
    float _867 = -_845;
    float _869 = _867 + 1.0;
    bool _871 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _873 = isnan(_330);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_861;
    float _885 = _883 + 1.0;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _891;
    bool _895 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _897 = isnan(_330);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _881 * _869;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _909;
    float _913 = -_881;
    float _915 = _913 + 1.0;
    float _917 = _845 * _885;
    float _919 = fma(_889, _729, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _921 = fma(_893, _729, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _923 = fma(_911, _729, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _925 = _905 * _915;
    float _927 = -_905;
    float _929 = _927 + 1.0;
    float _931 = float(uint(_865));
    bool _933 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _935 = isnan(_330);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _941 = _937 || _939;
    float _943 = float(_941);
    bool _945 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _947 = isnan(_330);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _833);
    float _959 = as_type<float>(_428) * _931;
    float _961 = -_943;
    float _963 = _961 + 1.0;
    int _965 = ~_352;
    int _967 = _965 + 1;
    float _969 = -_665;
    float _971 = fma(_957, _819, _969);
    float _973 = trunc(_959);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = _955 * _963;
    float _981 = _943 * _929;
    float _983 = _943;
    int _985 = as_type<int>(_959);
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _989 = as_type<float>(_763);
    float _991 = _955;
    float _993 = _747;
    if (_513)
    {
        _983 = _342;
    }
    float _995 = _983;
    float _997 = _725 * _979;
    float _999 = _709 * _979;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1003 = _995;
    if (_593)
    {
        float _1005 = -_336;
        float _1007 = _1005 + 1.0;
        _985 = as_type<int>(_1007);
    }
    int _1009 = _985;
    if (!_593)
    {
        _987 = _336;
    }
    float _1011 = _987;
    float _1013 = _559 * _979;
    float _1015 = _1011;
    if (!_513)
    {
        _1003 = _354;
    }
    float _1017 = _1003;
    float _1019 = _1017;
    if (_593)
    {
        float _1021 = _507 ? as_type<float>(_1009) : _336;
        _1015 = _1021;
    }
    float _1023 = _1015;
    int _1025 = _967 * int(_977);
    int _1027 = _1025 + _865;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_513)
    {
        _989 = _467;
    }
    float _1031 = _989;
    float _1033 = _1031;
    if (!_597)
    {
        _1019 = _336;
    }
    float _1035 = _1019;
    float _1037 = -_1001;
    float _1039 = fma(_1029, 2.0, _1037);
    float _1041 = float(uint(_1027));
    float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1045 = _1035;
    if (_597)
    {
        float _1047 = _573 ? as_type<float>(_675) : _336;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = as_type<float>(_428) * _1041;
    if (_513)
    {
        _1033 = _342;
    }
    float _1053 = _1033;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1057 = -_955;
    float _1059 = _1057 + 1.0;
    if (!_513)
    {
        _991 = _354;
    }
    float _1061 = _991;
    float _1063 = trunc(_1051);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1055);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1073 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1075 = _1061;
    if (_513)
    {
        _1075 = _467;
    }
    float _1077 = _1075;
    float _1079 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].x, _999);
    float _1081 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1013);
    float _1083 = -_1071;
    float _1085 = fma(_1073, 2.0, _1083);
    float _1087 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[123].z, _997);
    float _1089 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[83].w, _434);
    float _1091 = fma(_727, _981, _1079);
    float _1093 = fma(_747, _981, _1081);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1097 = fma(_765, _981, _1087);
    int _1099 = ~_352;
    int _1101 = _1099 + 1;
    float _1103 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1105 = int(_977) + int(_1067);
    float _1107 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1109 = float(uint(_813));
    float _1111 = -_134;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1085);
    float _1115 = fma(_1107, _1023, -0.5);
    if (!_513)
    {
        _993 = _354;
    }
    float _1117 = _993;
    float _1119 = as_type<float>(_428) * _1109;
    int _1121 = _1101 * _1105;
    int _1123 = _1121 + _865;
    float _1125 = _1117;
    if (_513)
    {
        _1125 = _467;
    }
    float _1127 = _1125;
    float _1129 = -_134;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1039);
    float _1133 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1137 = trunc(_1119);
    float _1139 = precise::max(_1137, 0.0);
    uint _1141 = uint(_1139);
    float _1143 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1145 = uint(_1123) >= uint(_352);
    float _1147 = fma(_761, _925, _1091);
    float _1149 = fma(_1143, -2.0, _1135);
    float _1151 = fma(_1133, _1049, -0.5);
    bool _1153 = !_1145;
    int _1155 = _1153 ? 0 : (-1);
    float _1157 = fma(_777, _925, _1093);
    int _1159 = ~_352;
    int _1161 = _1159 + 1;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1165 = ~_1105;
    int _1167 = _1165 + _1155;
    int _1169 = _1167 + 1;
    float _1171 = fma(_809, _925, _1097);
    float _1173 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1163);
    if (!_513)
    {
        _669 = _342;
    }
    float _1175 = _669;
    int _1177 = _352 * _1169;
    int _1179 = _1177 + _865;
    float _1181 = -_134;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    int _1185 = _1161 * int(_1141);
    int _1187 = _1185 + _813;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1173);
    bool _1193 = !_723;
    int _1195 = _1193 ? _1179 : (-1);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _384 + _1197;
    float _1201 = float(uint(_1187));
    float _1203 = fma(_1191, _1103, _1183);
    int _1205 = _1195 >> 31;
    float _1207 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1209 = as_type<float>(_428) * _1201;
    int _1211 = _1205 & 3;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1215 = _677 + _1213;
    float _1217 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1221 = _1195 + _1211;
    float _1223 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1225 = trunc(_1209);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    int _1231 = _1195 & 3;
    bool _1233 = _1231 != 0;
    float _1235 = fma(_805, _907, _1157);
    int _1237 = _1221 >> 2;
    float _1239 = fma(_807, _907, _1171);
    int _1241 = _1233 ? 0 : 1;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1223 + _1243;
    int _1247 = _1237 << 4;
    int _1249 = _1247 + 368;
    float _1251 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1069);
    float _1253 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1217);
    float _1255 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    uint _1257 = uint(int(uint(_1249) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    float _1273 = fma(_1251, _1115, _1113);
    float _1275 = fma(_799, _907, _1147);
    int _1277 = _1195 & 3;
    bool _1279 = _1277 != 0;
    float _1281 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _847);
    float _1283 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1089);
    float _1285 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1149);
    bool _1287 = uint(_1277) > 1u;
    int _1289 = _1249 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    bool _1307 = _1277 != 3;
    float _1309 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1253);
    int _1311 = ~_1241;
    int _1313 = _1311 + 1;
    int _1315 = _1313 + 1;
    float _1317 = -_1285;
    float _1319 = fma(_1283, _823, _1317);
    float _1321 = fma(_1255, -2.0, _1219);
    bool _1323 = uint(_1277) >= 2u;
    float _1325 = fma(_921, _917, _1235);
    bool _1327 = !_1279;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1321);
    bool _1333 = _1309 >= 0.0;
    float _1335 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    int _1337 = _1315;
    float _1339 = _1239;
    int _1341 = as_type<int>(_1319);
    if (!_1287)
    {
        int _1343 = ~_1241;
        int _1345 = _1343 + 1;
        _1337 = _1345;
    }
    int _1347 = _1337;
    float _1349 = fma(_919, _917, _1275);
    int _1351 = ~_352;
    int _1353 = _1351 + 1;
    float _1355 = -_1331;
    float _1357 = fma(_1281, _849, _1355);
    int _1359 = abs(_1347);
    float _1361 = fma(_923, _917, _1239);
    int _1363 = int(_1141) + int(_1229);
    float _1365 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1349);
    int _1367 = _1323 ? 0 : 1;
    float _1369 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1325);
    int _1371 = abs(_1329);
    int _1373 = _1353 * _1363;
    int _1375 = _1373 + _813;
    float _1377 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1361);
    int _1379 = ~_1367;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    float _1385 = fma(_1335, _1151, _1131);
    int _1387 = _1383;
    if (_1307)
    {
        int _1389 = ~_1367;
        int _1391 = _1389 + 1;
        _1387 = _1391;
    }
    int _1393 = _1387;
    if (_1333)
    {
        out.m_45.x = 0.0;
    }
    int _1395 = ~_1359;
    int _1397 = _1395 + 1;
    int _1399 = _1397 + 1;
    float _1401 = _1385 + 0.5;
    int _1403 = abs(_1393);
    float _1405 = _1357 + 0.5;
    int _1407 = ~_1371;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    bool _1413 = uint(_1375) >= uint(_352);
    if (_1333)
    {
        _1339 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1415 = _1339;
    out.m_63.x = _1401;
    out.m_63.y = _1405;
    int _1417 = _1399 * as_type<int>(_1271);
    int _1419 = ~_1403;
    int _1421 = _1419 + 1;
    int _1423 = _1421 + 1;
    float _1425 = _1199 * _1199;
    bool _1427 = !_1413;
    int _1429 = _1427 ? 0 : (-1);
    int _1431 = _1411 * as_type<int>(_1263);
    int _1433 = _1431 + _1417;
    bool _1435 = _1277 != 3;
    float _1437 = _1203 + 0.5;
    bool _1439 = !_537;
    int _1441 = _1439 ? 0 : 1;
    int _1443 = _1423 * as_type<int>(_1297);
    int _1445 = _1443 + _1433;
    bool _1447 = !_1435;
    int _1449 = _1447 ? 0 : (-1);
    int _1451 = ~_1363;
    int _1453 = _1451 + _1429;
    int _1455 = _1453 + 1;
    int _1457 = abs(_1449);
    int _1459 = abs(_1441);
    float _1461 = fma(_1215, _1215, _1425);
    int _1463 = ~_1457;
    int _1465 = _1463 + 1;
    int _1467 = _1465 + 1;
    int _1469 = _352 * _1455;
    int _1471 = _1469 + _813;
    float _1473 = _1319 + 0.5;
    int _1475 = ~_1459;
    int _1477 = _1475 + 1;
    int _1479 = _1477 + 1;
    if (_1333)
    {
        float _1481 = _1415 * 5.0;
        _1341 = as_type<int>(_1481);
    }
    int _1483 = _1341;
    int _1485 = _1467 * as_type<int>(_1305);
    int _1487 = _1485 + _1445;
    float _1489 = fma(_1245, _1245, _1461);
    float _1491 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1493 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1495 = _1487 * _1479;
    bool _1497 = !_723;
    int _1499 = _1497 ? _1471 : (-1);
    float _1501 = _971 + 0.5;
    float _1503 = rsqrt(_1489);
    float _1505 = _1273 + 0.5;
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1509 = _1499 * _1459;
    int _1511 = _1509 + _1495;
    float _1513 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1515 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1437;
    out.m_65.y = _1501;
    out.m_65.z = _1505;
    out.m_65.w = _1473;
    float _1517 = float(_1511);
    float _1519 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = as_type<float>(_1483);
    if (_1333)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5008 = as_type<float>(_1483);
        out.gl_Position.z = _5008;
    }
    out.m_67.x = _1517;
    out.m_69.x = _1519;
    out.m_69.y = _1507;
    out.m_69.z = _1515;
    float _1523 = _1199 * _1503;
    float _1525 = _1215 * _1503;
    if (_1333)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1527 = -_1523;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _384);
    float _1531 = _1245 * _1503;
    float _1533 = -_1525;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _677);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1539 = _1529 + _1537;
    float _1541 = -_1531;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1223);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1547 = _1535 + _1545;
    float _1549 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1543 + _1551;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1549);
    float _1557 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    bool _1559 = _1557 >= 0.0;
    float _1561 = _1543;
    if (_1559)
    {
        _1521 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1563 = _1521;
    int _1565 = as_type<int>(_1563);
    if (_1559)
    {
        out.m_45.x = 0.0;
    }
    if (_1559)
    {
        float _1567 = _1563 * 5.0;
        _1565 = as_type<int>(_1567);
    }
    int _1569 = _1565;
    if (_1559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5113 = as_type<float>(_1569);
        out.gl_Position.z = _5113;
    }
    if (_1559)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1571 = -_384;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = -_677;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1579 = -_1223;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1583 = _1573 * _1573;
    float _1585 = -_1523;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1589 = fma(_1577, _1577, _1583);
    float _1591 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1593 = -_1525;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1215);
    float _1597 = fma(_1581, _1581, _1589);
    float _1599 = -_1591;
    float _1601 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1603 = _1587 * _1587;
    float _1605 = rsqrt(_1597);
    float _1607 = -_1531;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1611 = _354 * 6.283185482025146484375;
    float _1613 = fma(_134, 0.310000002384185791015625, _1611);
    float _1615 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1617 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1619 = -_1615;
    float _1621 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1619);
    float _1623 = -_1617;
    float _1625 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1623);
    float _1627 = _1577 * _1605;
    float _1629 = _1581 * _1605;
    float _1631 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1633 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1635 = _1627 * _1627;
    float _1637 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1639 = -_1631;
    float _1641 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1643 = _1573 * _1605;
    float _1645 = fma(_1629, _1629, _1635);
    float _1647 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1649 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1651 = -_1637;
    float _1653 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1651);
    float _1655 = rsqrt(_1645);
    float _1657 = -_1647;
    float _1659 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1657);
    float _1661 = -_1649;
    float _1663 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1661);
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1641);
    float _1667 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1669 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1671 = -_1633;
    float _1673 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1671);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1677 = -_1667;
    float _1679 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1677);
    float _1681 = -_1669;
    float _1683 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1681);
    float _1685 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1673);
    float _1687 = _1629 * _1655;
    float _1689 = _1627 * _1655;
    float _1691 = -_1675;
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1691);
    float _1695 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1653);
    float _1697 = -_1687;
    float _1699 = _1629 * _1697;
    float _1701 = -_1687;
    float _1703 = _1643 * _1701;
    float _1705 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1693);
    float _1707 = -_1699;
    float _1709 = fma(_1627, _1689, _1707);
    float _1711 = _1643 * _1689;
    float _1713 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1679);
    float _1715 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1717 = _1709 * _1709;
    float _1719 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = -_1713;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1705);
    float _1725 = -_1715;
    float _1727 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1725);
    float _1729 = fma(_1711, _1711, _1717);
    float _1731 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1733 = -_1719;
    float _1735 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1733);
    float _1737 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1727);
    float _1739 = fma(_1703, _1703, _1729);
    float _1741 = 1.0 / _1723;
    float _1743 = -_1731;
    float _1745 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1743);
    float _1747 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1735);
    float _1749 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1745);
    float _1751 = rsqrt(_1739);
    float _1753 = fma(_1737, _1741, -1.0);
    float _1755 = 1.0 / _296;
    float _1757 = _1709 * _1751;
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = 1.0 / _300;
    float _1763 = -_1759;
    float _1765 = _1763 + 1.0;
    float _1767 = _1765 * _1741;
    float _1769 = fma(_1765, _1753, 1.0);
    float _1771 = 1.0 / _288;
    float _1773 = _1749 * _1767;
    float _1775 = _1769 * _1769;
    float _1777 = _1747 * _1767;
    float _1779 = fma(_1773, _1773, _1775);
    float _1781 = fma(_1777, _1777, _1779);
    float _1783 = rsqrt(_1781);
    float _1785 = _1777 * _1783;
    float _1787 = _1773 * _1783;
    float _1789 = _1769 * _1783;
    float _1791 = -_1785;
    float _1793 = _1627 * _1791;
    float _1795 = _1629 * _1789;
    float _1797 = -_1787;
    float _1799 = -_1793;
    float _1801 = fma(_1629, _1797, _1799);
    float _1803 = -_1787;
    float _1805 = _1643 * _1803;
    float _1807 = -_1785;
    float _1809 = -_1795;
    float _1811 = fma(_1643, _1807, _1809);
    float _1813 = _1801 * _1801;
    float _1815 = -_1805;
    float _1817 = fma(_1627, _1789, _1815);
    float _1819 = fma(_1811, _1811, _1813);
    float _1821 = fma(_1817, _1817, _1819);
    float _1823 = rsqrt(_1821);
    float _1825 = _1811 * _1823;
    float _1827 = _1817 * _1823;
    float _1829 = _1801 * _1823;
    float _1831 = _1629 * _1825;
    float _1833 = _1643 * _1827;
    float _1835 = -_1831;
    float _1837 = fma(_1627, _1827, _1835);
    float _1839 = _1627 * _1829;
    float _1841 = -_1833;
    float _1843 = fma(_1629, _1829, _1841);
    float _1845 = _1837 * _1837;
    float _1847 = -_1839;
    float _1849 = fma(_1643, _1825, _1847);
    float _1851 = fma(_1595, _1595, _1603);
    float _1853 = in.m_71.x;
    float _1855 = in.m_71.y;
    float _1857 = in.m_71.z;
    float _1859 = fma(_1843, _1843, _1845);
    float _1861 = fma(_1609, _1609, _1851);
    float _1863 = fma(_1849, _1849, _1859);
    float _1865 = sqrt(_1861);
    float _1867 = rsqrt(_1863);
    float _1869 = _1771 * _1853;
    float _1871 = _1761 * _1857;
    float _1873 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1875 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1877 = _342 * 6.283185482025146484375;
    float _1879 = _1849 * _1867;
    float _1881 = _1837 * _1867;
    float _1883 = _1843 * _1867;
    float _1885 = -_154;
    float _1887 = fma(_1885, 0.5, 0.5);
    float _1889 = _1627 * _1879;
    float _1891 = _1629 * _1881;
    float _1893 = -_1889;
    float _1895 = fma(_1629, _1883, _1893);
    float _1897 = -_1891;
    float _1899 = fma(_1643, _1879, _1897);
    float _1901 = _1643 * _1883;
    float _1903 = _1895 * _1895;
    float _1905 = -_1901;
    float _1907 = fma(_1627, _1881, _1905);
    float _1909 = fma(_1899, _1899, _1903);
    float _1911 = _1755 * _1855;
    float _1913 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1869);
    float _1917 = fma(_1907, _1907, _1909);
    float _1919 = _1503 * _1865;
    float _1921 = rsqrt(_1917);
    float _1923 = _1873 * _1919;
    float _1925 = _1913 * _1919;
    float _1927 = _1875 * _1919;
    float _1929 = fma(_134, 0.10999999940395355224609375, _1877);
    float _1931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1911);
    float _1933 = _1923 * _1915;
    float _1935 = _1613 * 0.15915493667125701904296875;
    float _1937 = _1935 * 6.283185482025146484375;
    float _1939 = sin(_1937);
    float _1941 = _1895 * _1921;
    float _1943 = _1925 * _1931;
    float _1945 = _1899 * _1921;
    float _1947 = _1907 * _1921;
    float _1949 = _1871 * _1927;
    float _1951 = _1943 * _1881;
    float _1953 = _1943 * _1883;
    float _1955 = _1943 * _1879;
    float _1957 = _1929 * 0.15915493667125701904296875;
    float _1959 = fma(_1933, _1941, _1951);
    float _1961 = fma(_1933, _1945, _1953);
    float _1963 = fma(_1933, _1947, _1955);
    float _1965 = fma(_1643, _1949, _1959);
    float _1967 = _1957 * 6.283185482025146484375;
    float _1969 = sin(_1967);
    float _1971 = fma(_1627, _1949, _1961);
    float _1973 = fma(_1629, _1949, _1963);
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1979 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1981 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1975);
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1977);
    float _1985 = _384 + _1965;
    float _1987 = fma(_1939, 0.12999999523162841796875, 1.0);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1981);
    float _1991 = fma(_1971, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1979);
    float _1993 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1983);
    float _1995 = _677 + _1971;
    float _1997 = _1927 * _1989;
    float _1999 = fma(_1969, 0.300000011920928955078125, _1987);
    float _2001 = fma(_1973, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1991);
    float _2003 = _1925 * _1993;
    float _2005 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2009 = _1923 * _2001;
    float _2011 = _1999 * _1887;
    float _2013 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2005);
    float _2015 = _1223 + _1973;
    float _2017 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2007);
    float _2019 = _1925 * _2011;
    float _2021 = _2019 * 2.0;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2013);
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2027 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2017);
    float _2029 = _2015 + _2023;
    float _2031 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2025);
    float _2033 = _1995 + _2027;
    float _2035 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2029);
    float _2037 = fma(_2009, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2031);
    float _2039 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2033);
    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2043 = _2035 + _2041;
    float _2045 = _1985 + _2037;
    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2049 = _2039 + _2047;
    float _2051 = _2043 * _2043;
    float _2053 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2045);
    float _2055 = fma(_2049, _2049, _2051);
    float _2057 = sqrt(_2055);
    bool _2059 = _2057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = _2051;
    float _2063 = _2039;
    float _2065 = _2035;
    float _2067 = _2045;
    float _2069 = _2043;
    float _2071 = _2053;
    float _2073 = _2011;
    float _2075 = _1945;
    if (!_2059)
    {
        _2061 = _2039;
    }
    float _2077 = _2061;
    float _2079 = _2077;
    if (!_2059)
    {
        _2063 = _2035;
    }
    float _2081 = _2063;
    float _2083 = _2081;
    if (!_2059)
    {
        _2065 = _2053;
    }
    float _2085 = _2065;
    bool _2087 = !_2059;
    float _2089 = _2085;
    if (!_2087)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2095 = _2057 + _2093;
        float _2097 = rsqrt(_2055);
        float _2099 = _2095 * _2091;
        float _2101 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2103 = _2099 * 0.15915493667125701904296875;
        float _2105 = _2103 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        float _2109 = _2103 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = fma(_2107, _2101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2115 = _2097 * _2113;
        float _2117 = _2111 + (-1.0);
        float _2119 = fma(_2049, _2115, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2121 = fma(_2043, _2115, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2123 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2125 = fma(_2053, _2111, _2123);
        _2089 = _2125;
        _2079 = _2119;
        _2083 = _2121;
        _2067 = _2103;
    }
    float _2127 = _2089;
    float _2129 = _2079;
    float _2131 = _2083;
    float _2133 = _2067;
    float _2135 = -_1523;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2127);
    float _2139 = -_1525;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2129);
    float _2143 = -_1531;
    float _2145 = fma(_2143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2131);
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2149 = _2137 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2153 = _2141 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2157 = _2145 + _2155;
    float _2159 = _2149 * _2149;
    float _2161 = fma(_2153, _2153, _2159);
    float _2163 = fma(_2157, _2157, _2161);
    float _2165 = rsqrt(_2163);
    float _2167 = sqrt(_2163);
    float _2169 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2171 = _2153 * _2169;
    float _2173 = _2157 * _2169;
    float _2175 = _2171 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 + _2177;
    float _2181 = sqrt(_2179);
    bool _2183 = _2181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = _2181 + _2185;
    float _2189 = _2057;
    float _2191 = _2133;
    float _2193 = _2187;
    if (_2183)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2189 = _2195;
    }
    float _2197 = _2189;
    if (_2183)
    {
        float _2199 = rsqrt(_2179);
        _2191 = _2199;
    }
    float _2201 = _2191;
    float _2203 = _2201;
    if (_2183)
    {
        float _2205 = _2187 * _2197;
        _2193 = _2205;
    }
    float _2207 = _2193;
    if (_2183)
    {
        float _2209 = _2207 * 0.15915493667125701904296875;
        _2069 = _2209;
    }
    float _2211 = _2069;
    float _2213 = _1523;
    float _2215 = _2211;
    if (_2183)
    {
        float _2217 = _2211 * 6.283185482025146484375;
        float _2219 = sin(_2217);
        _2213 = _2219;
    }
    float _2221 = _2213;
    float _2223 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2225 = precise::max(0.0, _2223);
    float _2227 = _2049;
    float _2229 = _2225;
    float _2231 = _2223;
    if (_2183)
    {
        float _2233 = _2211 * 6.283185482025146484375;
        float _2235 = cos(_2233);
        _2227 = _2235;
    }
    float _2237 = _2227;
    float _2239 = -_2169;
    float _2241 = -_2225;
    float _2243 = fma(_2149, _2239, _2241);
    if (_2183)
    {
        float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2245;
    }
    float _2247 = _2229;
    float _2249 = _2247;
    float _2251 = _2221;
    if (_2183)
    {
        float _2253 = fma(_2221, _2247, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2071 = _2253;
    }
    float _2255 = _2071;
    float _2257 = _2255;
    if (!_2183)
    {
        _2249 = _2171;
    }
    float _2259 = _2249;
    float _2261 = _2259;
    if (!_2183)
    {
        _2251 = _2243;
    }
    float _2263 = _2251;
    float _2265 = _2263;
    if (_2183)
    {
        float _2267 = _2237 + (-1.0);
        _2231 = _2267;
    }
    float _2269 = _2231;
    float _2271 = _2269;
    if (_2183)
    {
        float _2273 = _2201 * _2255;
        _2073 = _2273;
    }
    float _2275 = _2073;
    if (!_2183)
    {
        _2203 = _2173;
    }
    float _2277 = _2203;
    float _2279 = _2277;
    if (_2183)
    {
        float _2281 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2215 = _2281;
    }
    float _2283 = _2215;
    if (_2183)
    {
        float _2285 = _2171 * _2275;
        _2261 = _2285;
    }
    float _2287 = _2261;
    if (!_2183)
    {
        _2257 = _2175;
    }
    float _2289 = _2257;
    float _2291 = _2289;
    if (_2183)
    {
        float _2293 = _2173 * _2275;
        _2279 = _2293;
    }
    float _2295 = _2279;
    if (_2183)
    {
        float _2297 = fma(_2243, _2237, _2283);
        _2265 = _2297;
    }
    float _2299 = _2265;
    if (_2183)
    {
        float _2301 = _2287 * _2287;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (!_2183)
    {
        _2271 = _2177;
    }
    float _2305 = _2271;
    float _2307 = _2305;
    if (_2183)
    {
        float _2309 = _2295 * _2295;
        _2307 = _2309;
    }
    float _2311 = _2307;
    float _2313 = fma(_2299, _2299, _2303);
    float _2315 = _2313 + _2311;
    float _2317 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2319 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2321 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2319);
    float _2323 = precise::clamp(_2321, 0.0, 1.0);
    float _2325 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2327 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2329 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2317);
    float _2331 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2333 = rsqrt(_2315);
    float _2335 = -_2323;
    float _2337 = _2335 + 1.0;
    float _2339 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2325);
    float _2341 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2331);
    float _2343 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2345 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2329);
    float _2347 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2339);
    float _2349 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2341);
    float _2351 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2343);
    float _2353 = abs(_2337);
    float _2355 = log2(_2353);
    float _2357 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2359 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2361 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2351);
    float _2363 = _2345 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2365 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2367 = _2333 * _2287;
    float _2369 = _2333 * _2295;
    float _2371 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2373 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2365);
    float _2375 = _2333 * _2299;
    float _2377 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2379 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2373);
    float _2383 = -_2371;
    float _2385 = fma(_2383, _2327, 1.0);
    float _2387 = -_2377;
    float _2389 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2387);
    float _2391 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2381);
    float _2395 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2397 = -_2369;
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2389);
    float _2401 = log2(_2385);
    float _2403 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2395);
    float _2407 = fma(_2399, -0.5, 0.5);
    float _2409 = fma(_2399, 0.5, 0.5);
    float _2411 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2405);
    float _2415 = _2375 + 1.0;
    float _2417 = 1.0 / _2393;
    float _2419 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2411);
    float _2421 = fma(_2409, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2423 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2413);
    float _2425 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2427 = fma(_2409, _2421, -0.212114393711090087890625);
    float _2429 = exp2(_2391);
    float _2431 = _2401 * 0.693147182464599609375;
    float _2433 = fma(_2409, _2427, 1.570728778839111328125);
    float _2435 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2437 = sqrt(_2407);
    float _2439 = _2423 * _2417;
    float _2441 = _2425 * _2417;
    float _2443 = fma(_2439, 0.5, 0.5);
    float _2445 = fma(_2441, -0.5, 0.5);
    float _2447 = -_2375;
    float _2449 = fma(_2429, _2415, _2447);
    float3 _6582 = float3(_2443, _2445, _2435);
    float _2451 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6582, float3(0.0), isnan(_6582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6582, float3(0.0), isnan(_6582)), level(0.0)).x;
    float _2453 = fma(_2449, 0.5, 0.5);
    float _2455 = _2437 * 0.636619746685028076171875;
    float _2457 = -_2433;
    float _2459 = fma(_2455, _2457, 1.0);
    float3 _6603 = float3(_2443, _2445, _2435);
    float4 _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6603, float3(0.0), isnan(_6603)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6603, float3(0.0), isnan(_6603)), level(0.0)).xyzw;
    float _2464 = _2462.x;
    float _2466 = _2462.y;
    float _2468 = _2462.z;
    float _2470 = _2462.w;
    float2 _6620 = float2(_2459, _2453);
    float3 _2474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6620, float2(0.0), isnan(_6620)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6620, float2(0.0), isnan(_6620)), level(0.0)).xyz;
    float _2476 = _2474.x;
    float _2478 = _2474.y;
    float _2480 = _2474.z;
    float _2482 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2484 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2486 = isnan(0.5);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2492 = _2488 || _2490;
    float _2494 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2496 = _1911 != 0.0;
    bool _2498 = isnan(_1911);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(0.0);
    bool _2504 = _2500 || _2502;
    float _2506 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2482);
    float _2508 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2510 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2494);
    bool _2512 = _1869 == 0.0;
    bool _2514 = !_2504;
    bool _2516 = _2512 && _2514;
    float _2518 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2506);
    float _2520 = _2359 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2522 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2510);
    bool _2524 = _1871 == 0.0;
    bool _2526 = _2524 && _2516;
    float _2528 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2530 = fma(_2357, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2520);
    float _2532 = in.m_73.x;
    float _2534 = in.m_73.y;
    float _2536 = in.m_73.z;
    float _2538 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2540 = 1.0 / _2528;
    if (!_2492)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2542 = _1561;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    float _2544 = _2538 + _2528;
    float _2546 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2530);
    out.m_69.x = _1519;
    out.m_69.y = _1507;
    out.m_69.z = _1515;
    out.m_75.x = _2153;
    out.m_75.y = _2149;
    out.m_75.z = _2157;
    float _2548 = _2544 * _2540;
    float _2550 = _2548 * 0.5;
    float _2552 = _2540;
    float _2554 = _2550;
    float _2556 = _2542;
    if (!_2492)
    {
        float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2560 = fma(_2550, _2542, _2558);
        _2552 = _2560;
    }
    float _2562 = _2552;
    if (!_2492)
    {
        _2554 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2564 = _2554;
    float _2566 = _2534;
    float _2568 = _2532;
    float _2570 = _2536;
    float _2572 = _2564;
    if (!_2526)
    {
        float _2574 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2534);
        _2566 = _2574;
    }
    float _2576 = _2566;
    if (!_2526)
    {
        float _2578 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2532);
        _2568 = _2578;
    }
    float _2580 = _2568;
    if (!_2526)
    {
        float _2582 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2536);
        _2570 = _2582;
    }
    float _2584 = _2570;
    float _2586 = _1881 * _2576;
    if (!_2492)
    {
        float _2588 = -_2564;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2556 = _2590;
    }
    float _2592 = _2556;
    float _2594 = _2562;
    if (!_2492)
    {
        float _2596 = 1.0 / _2562;
        _2594 = _2596;
    }
    float _2598 = _2594;
    float _2600 = _1883 * _2576;
    float _2602 = fma(_1941, _2580, _2586);
    float _2604 = _1879 * _2576;
    float _2606 = fma(_1945, _2580, _2600);
    if (_2492)
    {
        _2075 = 1.0;
    }
    float _2608 = _2075;
    float _2610 = fma(_1947, _2580, _2604);
    float _2612 = exp2(_2508);
    float _2614 = fma(_1627, _2584, _2606);
    float _2616 = fma(_1643, _2584, _2602);
    float _2618 = fma(_1629, _2584, _2610);
    float _2620 = _2393 * 0.5;
    float _2622 = _2592;
    float _2624 = _2608;
    if (!_2492)
    {
        float _2626 = 1.0 / _2592;
        _2622 = _2626;
    }
    float _2628 = _2622;
    if (!_2492)
    {
        float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2632 = -_2564;
        float _2634 = fma(_2598, _2630, _2632);
        _2572 = _2634;
    }
    float _2636 = _2572;
    float _2638 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2546);
    float _2640 = _2423 + _2393;
    out.m_77.x = _2614;
    out.m_77.y = _2616;
    out.m_77.z = _2618;
    float _2642 = _2640 * 0.5;
    float _2644 = -_2612;
    float _2646 = _2644 + 1.0;
    out.gl_Position.x = _2423;
    out.gl_Position.y = _2425;
    out.gl_Position.z = _2638;
    out.gl_Position.w = _2393;
    float _2648 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2492)
    {
        float _2650 = _2636 * _2628;
        float _2652 = precise::clamp(_2650, 0.0, 1.0);
        _2624 = _2652;
    }
    float _2654 = _2624;
    float _2656 = _2638 + _2393;
    float _2658 = fma(_2425, -0.5, _2620);
    float _2660 = _2654 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2662 = _2654 > 0.0;
    bool _2664 = isnan(_2654);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = _2656 * 0.5;
    float _2674 = _2660 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = _2642;
    out.m_79.y = _2658;
    out.m_79.z = _2672;
    out.m_79.w = _2393;
    out.m_45.x = _2674;
    float _2676 = _2648 * _2451;
    float _2678 = -_2648;
    float _2680 = _2678 + 1.0;
    float _2682 = _2470 * _2676;
    float _2684 = _2470 * _2680;
    float _2686 = _2480 * _2676;
    float _2688 = fma(_2476, _2682, _2464);
    float _2690 = fma(_2478, _2682, _2466);
    float _2692 = fma(_2470, _2686, _2468);
    out.m_81.x = _2688;
    out.m_81.y = _2690;
    out.m_81.z = _2692;
    out.m_81.w = _2684;
    if (_2670)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2694;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

