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
        float _2545 = as_type<float>(_116);
        out.gl_Position.z = _2545;
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
        float _2614 = as_type<float>(_152);
        out.gl_Position.z = _2614;
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
    float _995 = _917;
    if (_513)
    {
        _983 = _342;
    }
    float _997 = _983;
    float _999 = _725 * _979;
    float _1001 = _709 * _979;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1005 = _997;
    if (_593)
    {
        float _1007 = -_336;
        float _1009 = _1007 + 1.0;
        _985 = as_type<int>(_1009);
    }
    int _1011 = _985;
    if (!_593)
    {
        _987 = _336;
    }
    float _1013 = _987;
    float _1015 = _559 * _979;
    float _1017 = _1013;
    if (!_513)
    {
        _1005 = _354;
    }
    float _1019 = _1005;
    float _1021 = _1019;
    if (_593)
    {
        float _1023 = _507 ? as_type<float>(_1011) : _336;
        _1017 = _1023;
    }
    float _1025 = _1017;
    int _1027 = _967 * int(_977);
    int _1029 = _1027 + _865;
    float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_513)
    {
        _989 = _467;
    }
    float _1033 = _989;
    float _1035 = _1033;
    if (!_597)
    {
        _1021 = _336;
    }
    float _1037 = _1021;
    float _1039 = -_1003;
    float _1041 = fma(_1031, 2.0, _1039);
    float _1043 = float(uint(_1029));
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1047 = _1037;
    if (_597)
    {
        float _1049 = _573 ? as_type<float>(_675) : _336;
        _1047 = _1049;
    }
    float _1051 = _1047;
    float _1053 = as_type<float>(_428) * _1043;
    if (_513)
    {
        _1035 = _342;
    }
    float _1055 = _1035;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1059 = -_955;
    float _1061 = _1059 + 1.0;
    if (!_513)
    {
        _991 = _354;
    }
    float _1063 = _991;
    float _1065 = trunc(_1053);
    float _1067 = precise::max(_1065, 0.0);
    uint _1069 = uint(_1067);
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1077 = _1063;
    if (_513)
    {
        _1077 = _467;
    }
    float _1079 = _1077;
    float _1081 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1001);
    float _1083 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1015);
    float _1085 = -_1073;
    float _1087 = fma(_1075, 2.0, _1085);
    float _1089 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].z, _999);
    float _1091 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[83].w, _434);
    float _1093 = fma(_727, _981, _1081);
    float _1095 = fma(_747, _981, _1083);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1099 = fma(_765, _981, _1089);
    int _1101 = ~_352;
    int _1103 = _1101 + 1;
    float _1105 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1107 = int(_977) + int(_1069);
    float _1109 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1111 = float(uint(_813));
    float _1113 = -_134;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1087);
    float _1117 = fma(_1109, _1025, -0.5);
    if (!_513)
    {
        _993 = _354;
    }
    float _1119 = _993;
    float _1121 = as_type<float>(_428) * _1111;
    int _1123 = _1103 * _1107;
    int _1125 = _1123 + _865;
    float _1127 = _1119;
    if (_513)
    {
        _1127 = _467;
    }
    float _1129 = _1127;
    float _1131 = -_134;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1041);
    float _1135 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1139 = trunc(_1121);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1147 = uint(_1125) >= uint(_352);
    float _1149 = fma(_761, _925, _1093);
    float _1151 = fma(_1145, -2.0, _1137);
    float _1153 = fma(_1135, _1051, -0.5);
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    float _1159 = fma(_777, _925, _1095);
    int _1161 = ~_352;
    int _1163 = _1161 + 1;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1167 = ~_1107;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = fma(_809, _925, _1099);
    float _1175 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1165);
    if (!_513)
    {
        _669 = _342;
    }
    float _1177 = _669;
    int _1179 = _352 * _1171;
    int _1181 = _1179 + _865;
    float _1183 = -_134;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    int _1187 = _1163 * int(_1143);
    int _1189 = _1187 + _813;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1193 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1175);
    bool _1195 = !_723;
    int _1197 = _1195 ? _1181 : (-1);
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1201 = _384 + _1199;
    float _1203 = float(uint(_1189));
    float _1205 = fma(_1193, _1105, _1185);
    int _1207 = _1197 >> 31;
    float _1209 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1191);
    float _1211 = as_type<float>(_428) * _1203;
    int _1213 = _1207 & 3;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1217 = _677 + _1215;
    float _1219 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1223 = _1197 + _1213;
    float _1225 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1227 = trunc(_1211);
    float _1229 = precise::max(_1227, 0.0);
    uint _1231 = uint(_1229);
    int _1233 = _1197 & 3;
    bool _1235 = _1233 != 0;
    float _1237 = fma(_807, _907, _1173);
    int _1239 = _1223 >> 2;
    float _1241 = fma(_805, _907, _1159);
    int _1243 = _1235 ? 0 : 1;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1247 = _1225 + _1245;
    int _1249 = _1239 << 4;
    int _1251 = _1249 + 368;
    float _1253 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1071);
    float _1255 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1219);
    float _1257 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    uint _1259 = uint(int(uint(_1251) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    float _1275 = fma(_1253, _1117, _1115);
    float _1277 = fma(_799, _907, _1149);
    int _1279 = _1197 & 3;
    bool _1281 = _1279 != 0;
    float _1283 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _847);
    float _1285 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1091);
    float _1287 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1151);
    bool _1289 = uint(_1279) > 1u;
    int _1291 = _1251 + 8;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    uint _1295 = uint(int(uint(int(_1293)) >> uint(2)));
    int _1297 = int(_1293) & 3;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[int(_1295)][_1297];
    int _1301 = int(_1293) + 1;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    int _1305 = _1301 & 3;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[int(_1303)][_1305];
    bool _1309 = _1279 != 3;
    float _1311 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1255);
    int _1313 = ~_1243;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = -_1287;
    float _1321 = fma(_1285, _823, _1319);
    float _1323 = fma(_1257, -2.0, _1221);
    bool _1325 = uint(_1279) >= 2u;
    float _1327 = fma(_921, _917, _1241);
    bool _1329 = !_1281;
    int _1331 = _1329 ? 0 : 1;
    float _1333 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1323);
    bool _1335 = _1311 >= 0.0;
    float _1337 = fma(_923, _917, _1237);
    int _1339 = _1317;
    int _1341 = as_type<int>(_1321);
    float _1343 = _1225;
    if (!_1289)
    {
        int _1345 = ~_1243;
        int _1347 = _1345 + 1;
        _1339 = _1347;
    }
    int _1349 = _1339;
    float _1351 = fma(_919, _917, _1277);
    int _1353 = ~_352;
    int _1355 = _1353 + 1;
    float _1357 = -_1333;
    float _1359 = fma(_1283, _849, _1357);
    int _1361 = abs(_1349);
    float _1363 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1209);
    int _1365 = int(_1143) + int(_1231);
    float _1367 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1351);
    int _1369 = _1325 ? 0 : 1;
    float _1371 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1327);
    int _1373 = abs(_1331);
    int _1375 = _1355 * _1365;
    int _1377 = _1375 + _813;
    float _1379 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1337);
    int _1381 = ~_1369;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = fma(_1363, _1153, _1133);
    int _1389 = _1385;
    if (_1309)
    {
        int _1391 = ~_1369;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    if (_1335)
    {
        out.m_45.x = 0.0;
    }
    int _1397 = ~_1361;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = _1387 + 0.5;
    int _1405 = abs(_1395);
    float _1407 = _1359 + 0.5;
    int _1409 = ~_1373;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    bool _1415 = uint(_1377) >= uint(_352);
    if (_1335)
    {
        _995 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1417 = _995;
    out.m_63.x = _1403;
    out.m_63.y = _1407;
    int _1419 = _1401 * as_type<int>(_1273);
    int _1421 = ~_1405;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = _1201 * _1201;
    bool _1429 = !_1415;
    int _1431 = _1429 ? 0 : (-1);
    int _1433 = _1413 * as_type<int>(_1265);
    int _1435 = _1433 + _1419;
    bool _1437 = _1279 != 3;
    float _1439 = _1205 + 0.5;
    bool _1441 = !_537;
    int _1443 = _1441 ? 0 : 1;
    int _1445 = _1425 * as_type<int>(_1299);
    int _1447 = _1445 + _1435;
    bool _1449 = !_1437;
    int _1451 = _1449 ? 0 : (-1);
    int _1453 = ~_1365;
    int _1455 = _1453 + _1431;
    int _1457 = _1455 + 1;
    int _1459 = abs(_1451);
    int _1461 = abs(_1443);
    float _1463 = fma(_1217, _1217, _1427);
    int _1465 = ~_1459;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    int _1471 = _352 * _1457;
    int _1473 = _1471 + _813;
    float _1475 = _1321 + 0.5;
    int _1477 = ~_1461;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    if (_1335)
    {
        float _1483 = _1417 * 5.0;
        _1341 = as_type<int>(_1483);
    }
    int _1485 = _1341;
    int _1487 = _1469 * as_type<int>(_1307);
    int _1489 = _1487 + _1447;
    float _1491 = fma(_1247, _1247, _1463);
    float _1493 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1495 = _1379 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1497 = _1489 * _1481;
    bool _1499 = !_723;
    int _1501 = _1499 ? _1473 : (-1);
    float _1503 = _971 + 0.5;
    float _1505 = rsqrt(_1491);
    float _1507 = _1275 + 0.5;
    float _1509 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1511 = _1501 * _1461;
    int _1513 = _1511 + _1497;
    float _1515 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1517 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1439;
    out.m_65.y = _1503;
    out.m_65.z = _1507;
    out.m_65.w = _1475;
    float _1519 = float(_1513);
    float _1521 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4801 = as_type<float>(_1485);
        out.gl_Position.z = _4801;
    }
    out.m_67.x = _1519;
    out.m_69.x = _1521;
    out.m_69.y = _1509;
    out.m_69.z = _1517;
    float _1523 = _1201 * _1505;
    float _1525 = _1217 * _1505;
    if (_1335)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1527 = -_1523;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _384);
    float _1531 = _1247 * _1505;
    float _1533 = -_1525;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _677);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1539 = _1529 + _1537;
    float _1541 = -_1531;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1547 = _1535 + _1545;
    float _1549 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1543 + _1551;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1549);
    float _1557 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    bool _1559 = _1557 >= 0.0;
    float _1561 = _1553;
    float _1563 = _1543;
    float _1565 = _1529;
    if (_1559)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1567 = _1561;
    int _1569 = as_type<int>(_1567);
    if (_1559)
    {
        out.m_45.x = 0.0;
    }
    if (_1559)
    {
        float _1571 = _1567 * 5.0;
        _1569 = as_type<int>(_1571);
    }
    int _1573 = _1569;
    if (_1559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4908 = as_type<float>(_1573);
        out.gl_Position.z = _4908;
    }
    if (_1559)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1575 = -_384;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1579 = -_677;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1583 = -_1225;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1587 = -_1523;
    float _1589 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1201);
    float _1591 = _1577 * _1577;
    float _1593 = -_1525;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    float _1597 = -_1531;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1601 = _1589 * _1589;
    float _1603 = fma(_1581, _1581, _1591);
    float _1605 = 1.0 / _288;
    float _1607 = _354 * 6.283185482025146484375;
    float _1609 = fma(_1595, _1595, _1601);
    float _1611 = fma(_1585, _1585, _1603);
    float _1613 = in.m_71.x;
    float _1615 = in.m_71.y;
    float _1617 = in.m_71.z;
    float _1619 = fma(_134, 0.310000002384185791015625, _1607);
    float _1621 = rsqrt(_1611);
    float _1623 = 1.0 / _300;
    float _1625 = fma(_1599, _1599, _1609);
    float _1627 = _1581 * _1621;
    float _1629 = _1585 * _1621;
    float _1631 = _1577 * _1621;
    float _1633 = 1.0 / _296;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1637 = _1627 * _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = _1629 * _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1645 = _1631 * _1643;
    float _1647 = _1605 * _1613;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1651 = -_1637;
    float _1653 = fma(_1629, _1649, _1651);
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1657 = -_1641;
    float _1659 = fma(_1631, _1655, _1657);
    float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1663 = -_1645;
    float _1665 = fma(_1627, _1661, _1663);
    float _1667 = sqrt(_1625);
    float _1669 = _1653 * _1653;
    float _1671 = _1623 * _1617;
    float _1673 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1675 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1677 = fma(_1659, _1659, _1669);
    float _1679 = _342 * 6.283185482025146484375;
    float _1681 = _1633 * _1615;
    float _1683 = fma(_1665, _1665, _1677);
    float _1685 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1687 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1671);
    float _1689 = rsqrt(_1683);
    float _1691 = _1505 * _1667;
    float _1693 = fma(_134, 0.10999999940395355224609375, _1679);
    float _1695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1681);
    float _1697 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1647);
    float _1699 = _1685 * _1691;
    float _1701 = _1673 * _1691;
    float _1703 = _1675 * _1691;
    float _1705 = _1619 * 0.15915493667125701904296875;
    float _1707 = _1699 * _1695;
    float _1709 = _1701 * _1697;
    float _1711 = _1703 * _1687;
    float _1713 = _1693 * 0.15915493667125701904296875;
    float _1715 = _1705 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = _1665 * _1689;
    float _1721 = _1659 * _1689;
    float _1723 = _1653 * _1689;
    float _1725 = -_154;
    float _1727 = fma(_1725, 0.5, 0.5);
    float _1729 = _1627 * _1719;
    float _1731 = _1631 * _1721;
    float _1733 = _1629 * _1723;
    float _1735 = _1713 * 6.283185482025146484375;
    float _1737 = sin(_1735);
    float _1739 = -_1729;
    float _1741 = fma(_1629, _1721, _1739);
    float _1743 = -_1731;
    float _1745 = fma(_1627, _1723, _1743);
    float _1747 = -_1733;
    float _1749 = fma(_1631, _1719, _1747);
    float _1751 = _1707 * _1741;
    float _1753 = _1707 * _1745;
    float _1755 = _1707 * _1749;
    float _1757 = fma(_1709, _1723, _1751);
    float _1759 = fma(_1709, _1719, _1753);
    float _1761 = fma(_1709, _1721, _1755);
    float _1763 = fma(_1711, _1631, _1757);
    float _1765 = fma(_1711, _1629, _1759);
    float _1767 = fma(_1711, _1627, _1761);
    float _1769 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1771 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1775 = _384 + _1763;
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1769);
    float _1779 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1771);
    float _1781 = fma(_1717, 0.12999999523162841796875, 1.0);
    float _1783 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1773);
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1777);
    float _1787 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1779);
    float _1789 = fma(_1737, 0.300000011920928955078125, _1781);
    float _1791 = _677 + _1767;
    float _1793 = _1703 * _1785;
    float _1795 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1783);
    float _1797 = _1699 * _1787;
    float _1799 = _1789 * _1727;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1803 = _1701 * _1795;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1807 = _1225 + _1765;
    float _1809 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1801);
    float _1811 = _1699 * _1799;
    float _1813 = _1811 * 2.0;
    float _1815 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1805);
    float _1817 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1809);
    float _1821 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1815);
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1817);
    float _1825 = _1807 + _1819;
    float _1827 = _1791 + _1821;
    float _1829 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1823);
    float _1831 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1825);
    float _1833 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1827);
    float _1835 = _1775 + _1829;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1839 = _1831 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1843 = _1833 + _1841;
    float _1845 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1835);
    float _1847 = _1839 * _1839;
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = sqrt(_1849);
    bool _1853 = _1851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1855 = _1793;
    float _1857 = _1835;
    float _1859 = _1847;
    float _1861 = _1851;
    float _1863 = _1833;
    float _1865 = _1803;
    float _1867 = _1829;
    float _1869 = _1839;
    if (!_1853)
    {
        _1855 = _1833;
    }
    float _1871 = _1855;
    float _1873 = _1871;
    if (!_1853)
    {
        _1857 = _1831;
    }
    float _1875 = _1857;
    float _1877 = _1875;
    if (!_1853)
    {
        _1859 = _1845;
    }
    float _1879 = _1859;
    bool _1881 = !_1853;
    float _1883 = _1879;
    if (!_1881)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1889 = _1851 + _1887;
        float _1891 = _1845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1893 = rsqrt(_1849);
        float _1895 = _1889 * _1885;
        float _1897 = _1895 * 0.15915493667125701904296875;
        float _1899 = _1897 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1897 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = _1901 + (-1.0);
        float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1911 = fma(_1905, _1891, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1913 = fma(_1845, _1901, _1909);
        float _1915 = _1893 * _1911;
        float _1917 = fma(_1843, _1915, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1919 = fma(_1839, _1915, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1883 = _1913;
        _1873 = _1917;
        _1877 = _1919;
        _1861 = _1915;
        _1863 = _1897;
    }
    float _1921 = _1883;
    float _1923 = _1873;
    float _1925 = _1877;
    float _1927 = _1861;
    float _1929 = _1863;
    float _1931 = -_1523;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1921);
    float _1935 = -_1525;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1923);
    float _1939 = -_1531;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1925);
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1945 = _1933 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1953 = _1941 + _1951;
    float _1955 = _1945 * _1945;
    float _1957 = fma(_1949, _1949, _1955);
    float _1959 = fma(_1953, _1953, _1957);
    float _1961 = rsqrt(_1959);
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1965 = _1949 * _1963;
    float _1967 = _1953 * _1963;
    float _1969 = _1965 * _1965;
    float _1971 = _1967 * _1967;
    float _1973 = _1969 + _1971;
    float _1975 = sqrt(_1973);
    bool _1977 = _1975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1975 + _1979;
    float _1983 = _1845;
    float _1985 = _1929;
    float _1987 = _1981;
    if (_1977)
    {
        float _1989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1983 = _1989;
    }
    float _1991 = _1983;
    if (_1977)
    {
        float _1993 = rsqrt(_1973);
        _1985 = _1993;
    }
    float _1995 = _1985;
    float _1997 = _1995;
    if (_1977)
    {
        float _1999 = _1981 * _1991;
        _1987 = _1999;
    }
    float _2001 = _1987;
    if (_1977)
    {
        float _2003 = _2001 * 0.15915493667125701904296875;
        _1865 = _2003;
    }
    float _2005 = _1865;
    float _2007 = _1523;
    if (_1977)
    {
        float _2009 = _2005 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        _2007 = _2011;
    }
    float _2013 = _2007;
    float _2015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2017 = precise::max(0.0, _2015);
    float _2019 = _1927;
    float _2021 = _2017;
    float _2023 = _2015;
    if (_1977)
    {
        float _2025 = _2005 * 6.283185482025146484375;
        float _2027 = cos(_2025);
        _2019 = _2027;
    }
    float _2029 = _2019;
    float _2031 = -_1963;
    float _2033 = -_2017;
    float _2035 = fma(_1945, _2031, _2033);
    if (_1977)
    {
        float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2037;
    }
    float _2039 = _2021;
    float _2041 = sqrt(_1959);
    float _2043 = _2039;
    float _2045 = _2013;
    if (_1977)
    {
        float _2047 = fma(_2013, _2039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1867 = _2047;
    }
    float _2049 = _1867;
    float _2051 = _2049;
    if (!_1977)
    {
        _2043 = _1965;
    }
    float _2053 = _2043;
    float _2055 = _2053;
    if (!_1977)
    {
        _2045 = _2035;
    }
    float _2057 = _2045;
    float _2059 = _2057;
    if (_1977)
    {
        float _2061 = _2029 + (-1.0);
        _2023 = _2061;
    }
    float _2063 = _2023;
    float _2065 = _2063;
    if (_1977)
    {
        float _2067 = _1995 * _2049;
        _1343 = _2067;
    }
    float _2069 = _1343;
    if (!_1977)
    {
        _1997 = _1967;
    }
    float _2071 = _1997;
    float _2073 = _2071;
    if (_1977)
    {
        float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1869 = _2075;
    }
    float _2077 = _1869;
    if (_1977)
    {
        float _2079 = _1965 * _2069;
        _2055 = _2079;
    }
    float _2081 = _2055;
    if (!_1977)
    {
        _2051 = _1969;
    }
    float _2083 = _2051;
    float _2085 = _2083;
    if (_1977)
    {
        float _2087 = _1967 * _2069;
        _2073 = _2087;
    }
    float _2089 = _2073;
    if (_1977)
    {
        float _2091 = fma(_2035, _2029, _2077);
        _2059 = _2091;
    }
    float _2093 = _2059;
    if (_1977)
    {
        float _2095 = _2081 * _2081;
        _2085 = _2095;
    }
    float _2097 = _2085;
    if (!_1977)
    {
        _2065 = _1971;
    }
    float _2099 = _2065;
    float _2101 = _2099;
    if (_1977)
    {
        float _2103 = _2089 * _2089;
        _2101 = _2103;
    }
    float _2105 = _2101;
    float _2107 = fma(_2093, _2093, _2097);
    float _2109 = _2107 + _2105;
    float _2111 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2115 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2113);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2121 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2123 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2111);
    float _2125 = rsqrt(_2109);
    float _2127 = -_2117;
    float _2129 = _2127 + 1.0;
    float _2131 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2133 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2119);
    float _2135 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2137 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2139 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2131);
    float _2141 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    float _2143 = abs(_2129);
    float _2145 = log2(_2143);
    float _2147 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2135);
    float _2149 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2153 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2155 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2147);
    float _2157 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2159 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2161 = _2125 * _2081;
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2165 = _2125 * _2089;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2159);
    float _2169 = _2125 * _2093;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2175 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2177 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2179 = -_2171;
    float _2181 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = -_2163;
    float _2185 = fma(_2183, _2121, 1.0);
    float _2187 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2189 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2191 = -_2165;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2195 = exp2(_2177);
    float _2197 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2199 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2189);
    float _2201 = fma(_2193, -0.5, 0.5);
    float _2203 = fma(_2193, 0.5, 0.5);
    float _2205 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2197);
    float _2207 = _2169 + 1.0;
    float _2209 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2199);
    float _2211 = 1.0 / _2187;
    float _2213 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2215 = fma(_2203, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2209);
    float _2219 = fma(_2203, _2215, -0.212114393711090087890625);
    float _2221 = log2(_2185);
    float _2223 = -_2169;
    float _2225 = fma(_2195, _2207, _2223);
    float _2227 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2213);
    float _2229 = fma(_2203, _2219, 1.570728778839111328125);
    float _2231 = fma(_2225, 0.5, 0.5);
    float _2233 = sqrt(_2201);
    float _2235 = _2217 * _2211;
    float _2237 = _2227 * _2211;
    float _2239 = fma(_2235, 0.5, 0.5);
    float _2241 = fma(_2237, -0.5, 0.5);
    float _2243 = _2221 * 0.693147182464599609375;
    float _2245 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = _2233 * 0.636619746685028076171875;
    float3 _6018 = float3(_2239, _2241, _2245);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6018, float3(0.0), isnan(_6018)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6018, float3(0.0), isnan(_6018)), level(0.0)).x;
    float _2251 = -_2229;
    float _2253 = fma(_2247, _2251, 1.0);
    float3 _6034 = float3(_2239, _2241, _2245);
    float4 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6034, float3(0.0), isnan(_6034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6034, float3(0.0), isnan(_6034)), level(0.0)).xyzw;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = _2256.w;
    float2 _6051 = float2(_2253, _2231);
    float3 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6051, float2(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6051, float2(0.0), isnan(_6051)), level(0.0)).xyz;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2278 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2280 = isnan(0.5);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2286 = _2282 || _2284;
    float _2288 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2290 = _1681 != 0.0;
    bool _2292 = isnan(_1681);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(0.0);
    bool _2298 = _2294 || _2296;
    float _2300 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2276);
    float _2302 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    bool _2304 = _1647 == 0.0;
    bool _2306 = !_2298;
    bool _2308 = _2304 && _2306;
    float _2310 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2300);
    float _2312 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2302);
    float _2314 = exp2(_2288);
    bool _2316 = _1671 == 0.0;
    bool _2318 = _2316 && _2308;
    float _2320 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2322 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2312);
    float _2324 = _2153;
    if (!_2286)
    {
        _1563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2326 = _1563;
    float _2328 = in.m_73.x;
    float _2330 = in.m_73.y;
    float _2332 = in.m_73.z;
    float _2334 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2336 = 1.0 / _2320;
    out.m_69.x = _1521;
    out.m_69.y = _1509;
    out.m_69.z = _1517;
    float _2338 = _2334 + _2320;
    out.m_75.x = _1949;
    out.m_75.y = _1945;
    out.m_75.z = _1953;
    float _2340 = -_2314;
    float _2342 = _2340 + 1.0;
    float _2344 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2346 = _2217 + _2187;
    float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2350 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2344);
    float _2352 = _2346 * 0.5;
    float _2354 = _2338 * _2336;
    float _2356 = _2354 * 0.5;
    float _2358 = -_2348;
    float _2360 = _2358 + 1.0;
    float _2362 = _2356;
    float _2364 = _2326;
    float _2366 = _2336;
    if (!_2286)
    {
        float _2368 = -_2326;
        float _2370 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2368);
        _2362 = _2370;
    }
    float _2372 = _2362;
    if (!_2286)
    {
        _2364 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2374 = _2364;
    float _2376 = _2330;
    float _2378 = _2328;
    float _2380 = _2332;
    if (!_2318)
    {
        float _2382 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2330);
        _2376 = _2382;
    }
    float _2384 = _2376;
    if (!_2318)
    {
        float _2386 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2328);
        _2378 = _2386;
    }
    float _2388 = _2378;
    if (!_2318)
    {
        float _2390 = fma(_1671, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2332);
        _2380 = _2390;
    }
    float _2392 = _2380;
    if (!_2286)
    {
        float _2394 = -_2374;
        float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2366 = _2396;
    }
    float _2398 = _2366;
    float _2400 = _2372;
    if (!_2286)
    {
        float _2402 = 1.0 / _2372;
        _2400 = _2402;
    }
    float _2404 = _2400;
    float _2406 = _1741 * _2384;
    float _2408 = fma(_1723, _2388, _2406);
    float _2410 = _2398;
    if (!_2286)
    {
        float _2412 = 1.0 / _2398;
        _2410 = _2412;
    }
    float _2414 = _2410;
    if (!_2286)
    {
        float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2418 = -_2374;
        float _2420 = fma(_2404, _2416, _2418);
        _1565 = _2420;
    }
    float _2422 = _1565;
    float _2424 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    if (_2286)
    {
        _2324 = 1.0;
    }
    float _2426 = _2324;
    float _2428 = _1749 * _2384;
    float _2430 = _1745 * _2384;
    float _2432 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2424);
    float _2434 = fma(_1721, _2388, _2428);
    float _2436 = _2426;
    if (!_2286)
    {
        float _2438 = _2422 * _2414;
        float _2440 = precise::clamp(_2438, 0.0, 1.0);
        _2436 = _2440;
    }
    float _2442 = _2436;
    float _2444 = fma(_1719, _2388, _2430);
    float _2446 = _2187 * 0.5;
    float _2448 = _2432 + _2187;
    float _2450 = _2442 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2452 = _2442 > 0.0;
    bool _2454 = isnan(_2442);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan(0.0);
    bool _2460 = _2456 || _2458;
    float _2462 = fma(_1627, _2392, _2434);
    float _2464 = fma(_1631, _2392, _2408);
    float _2466 = fma(_1629, _2392, _2444);
    float _2468 = fma(_2227, -0.5, _2446);
    float _2470 = _2448 * 0.5;
    float _2472 = _2450 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2462;
    out.m_77.y = _2464;
    out.m_77.z = _2466;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2227;
    out.gl_Position.z = _2432;
    out.gl_Position.w = _2187;
    out.m_79.x = _2352;
    out.m_79.y = _2468;
    out.m_79.z = _2470;
    out.m_79.w = _2187;
    out.m_45.x = _2472;
    float _2474 = _2348 * _2249;
    float _2476 = _2264 * _2474;
    float _2478 = _2264 * _2360;
    float _2480 = _2274 * _2474;
    float _2482 = fma(_2270, _2476, _2258);
    float _2484 = fma(_2272, _2476, _2260);
    float _2486 = fma(_2264, _2480, _2262);
    out.m_81.x = _2482;
    out.m_81.y = _2484;
    out.m_81.z = _2486;
    out.m_81.w = _2478;
    if (_2460)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2488 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2488;
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
        float _2545 = as_type<float>(_116);
        out.gl_Position.z = _2545;
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
        float _2614 = as_type<float>(_152);
        out.gl_Position.z = _2614;
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
    float _995 = _917;
    if (_513)
    {
        _983 = _342;
    }
    float _997 = _983;
    float _999 = _725 * _979;
    float _1001 = _709 * _979;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1005 = _997;
    if (_593)
    {
        float _1007 = -_336;
        float _1009 = _1007 + 1.0;
        _985 = as_type<int>(_1009);
    }
    int _1011 = _985;
    if (!_593)
    {
        _987 = _336;
    }
    float _1013 = _987;
    float _1015 = _559 * _979;
    float _1017 = _1013;
    if (!_513)
    {
        _1005 = _354;
    }
    float _1019 = _1005;
    float _1021 = _1019;
    if (_593)
    {
        float _1023 = _507 ? as_type<float>(_1011) : _336;
        _1017 = _1023;
    }
    float _1025 = _1017;
    int _1027 = _967 * int(_977);
    int _1029 = _1027 + _865;
    float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_513)
    {
        _989 = _467;
    }
    float _1033 = _989;
    float _1035 = _1033;
    if (!_597)
    {
        _1021 = _336;
    }
    float _1037 = _1021;
    float _1039 = -_1003;
    float _1041 = fma(_1031, 2.0, _1039);
    float _1043 = float(uint(_1029));
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1047 = _1037;
    if (_597)
    {
        float _1049 = _573 ? as_type<float>(_675) : _336;
        _1047 = _1049;
    }
    float _1051 = _1047;
    float _1053 = as_type<float>(_428) * _1043;
    if (_513)
    {
        _1035 = _342;
    }
    float _1055 = _1035;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1059 = -_955;
    float _1061 = _1059 + 1.0;
    if (!_513)
    {
        _991 = _354;
    }
    float _1063 = _991;
    float _1065 = trunc(_1053);
    float _1067 = precise::max(_1065, 0.0);
    uint _1069 = uint(_1067);
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1077 = _1063;
    if (_513)
    {
        _1077 = _467;
    }
    float _1079 = _1077;
    float _1081 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1001);
    float _1083 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1015);
    float _1085 = -_1073;
    float _1087 = fma(_1075, 2.0, _1085);
    float _1089 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].z, _999);
    float _1091 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[83].w, _434);
    float _1093 = fma(_727, _981, _1081);
    float _1095 = fma(_747, _981, _1083);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1099 = fma(_765, _981, _1089);
    int _1101 = ~_352;
    int _1103 = _1101 + 1;
    float _1105 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1107 = int(_977) + int(_1069);
    float _1109 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1111 = float(uint(_813));
    float _1113 = -_134;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1087);
    float _1117 = fma(_1109, _1025, -0.5);
    if (!_513)
    {
        _993 = _354;
    }
    float _1119 = _993;
    float _1121 = as_type<float>(_428) * _1111;
    int _1123 = _1103 * _1107;
    int _1125 = _1123 + _865;
    float _1127 = _1119;
    if (_513)
    {
        _1127 = _467;
    }
    float _1129 = _1127;
    float _1131 = -_134;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1041);
    float _1135 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1139 = trunc(_1121);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1147 = uint(_1125) >= uint(_352);
    float _1149 = fma(_761, _925, _1093);
    float _1151 = fma(_1145, -2.0, _1137);
    float _1153 = fma(_1135, _1051, -0.5);
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    float _1159 = fma(_777, _925, _1095);
    int _1161 = ~_352;
    int _1163 = _1161 + 1;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1167 = ~_1107;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = fma(_809, _925, _1099);
    float _1175 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1165);
    if (!_513)
    {
        _669 = _342;
    }
    float _1177 = _669;
    int _1179 = _352 * _1171;
    int _1181 = _1179 + _865;
    float _1183 = -_134;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    int _1187 = _1163 * int(_1143);
    int _1189 = _1187 + _813;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1193 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1175);
    bool _1195 = !_723;
    int _1197 = _1195 ? _1181 : (-1);
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1201 = _384 + _1199;
    float _1203 = float(uint(_1189));
    float _1205 = fma(_1193, _1105, _1185);
    int _1207 = _1197 >> 31;
    float _1209 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1191);
    float _1211 = as_type<float>(_428) * _1203;
    int _1213 = _1207 & 3;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1217 = _677 + _1215;
    float _1219 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1223 = _1197 + _1213;
    float _1225 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1227 = trunc(_1211);
    float _1229 = precise::max(_1227, 0.0);
    uint _1231 = uint(_1229);
    int _1233 = _1197 & 3;
    bool _1235 = _1233 != 0;
    float _1237 = fma(_807, _907, _1173);
    int _1239 = _1223 >> 2;
    float _1241 = fma(_805, _907, _1159);
    int _1243 = _1235 ? 0 : 1;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1247 = _1225 + _1245;
    int _1249 = _1239 << 4;
    int _1251 = _1249 + 368;
    float _1253 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1071);
    float _1255 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1219);
    float _1257 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    uint _1259 = uint(int(uint(_1251) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    float _1275 = fma(_1253, _1117, _1115);
    float _1277 = fma(_799, _907, _1149);
    int _1279 = _1197 & 3;
    bool _1281 = _1279 != 0;
    float _1283 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _847);
    float _1285 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1091);
    float _1287 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1151);
    bool _1289 = uint(_1279) > 1u;
    int _1291 = _1251 + 8;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    uint _1295 = uint(int(uint(int(_1293)) >> uint(2)));
    int _1297 = int(_1293) & 3;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[int(_1295)][_1297];
    int _1301 = int(_1293) + 1;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    int _1305 = _1301 & 3;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[int(_1303)][_1305];
    bool _1309 = _1279 != 3;
    float _1311 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1255);
    int _1313 = ~_1243;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = -_1287;
    float _1321 = fma(_1285, _823, _1319);
    float _1323 = fma(_1257, -2.0, _1221);
    bool _1325 = uint(_1279) >= 2u;
    float _1327 = fma(_921, _917, _1241);
    bool _1329 = !_1281;
    int _1331 = _1329 ? 0 : 1;
    float _1333 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1323);
    bool _1335 = _1311 >= 0.0;
    float _1337 = fma(_923, _917, _1237);
    int _1339 = _1317;
    int _1341 = as_type<int>(_1321);
    float _1343 = _1225;
    if (!_1289)
    {
        int _1345 = ~_1243;
        int _1347 = _1345 + 1;
        _1339 = _1347;
    }
    int _1349 = _1339;
    float _1351 = fma(_919, _917, _1277);
    int _1353 = ~_352;
    int _1355 = _1353 + 1;
    float _1357 = -_1333;
    float _1359 = fma(_1283, _849, _1357);
    int _1361 = abs(_1349);
    float _1363 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1209);
    int _1365 = int(_1143) + int(_1231);
    float _1367 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1351);
    int _1369 = _1325 ? 0 : 1;
    float _1371 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1327);
    int _1373 = abs(_1331);
    int _1375 = _1355 * _1365;
    int _1377 = _1375 + _813;
    float _1379 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1337);
    int _1381 = ~_1369;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = fma(_1363, _1153, _1133);
    int _1389 = _1385;
    if (_1309)
    {
        int _1391 = ~_1369;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    if (_1335)
    {
        out.m_45.x = 0.0;
    }
    int _1397 = ~_1361;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = _1387 + 0.5;
    int _1405 = abs(_1395);
    float _1407 = _1359 + 0.5;
    int _1409 = ~_1373;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    bool _1415 = uint(_1377) >= uint(_352);
    if (_1335)
    {
        _995 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1417 = _995;
    out.m_63.x = _1403;
    out.m_63.y = _1407;
    int _1419 = _1401 * as_type<int>(_1273);
    int _1421 = ~_1405;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = _1201 * _1201;
    bool _1429 = !_1415;
    int _1431 = _1429 ? 0 : (-1);
    int _1433 = _1413 * as_type<int>(_1265);
    int _1435 = _1433 + _1419;
    bool _1437 = _1279 != 3;
    float _1439 = _1205 + 0.5;
    bool _1441 = !_537;
    int _1443 = _1441 ? 0 : 1;
    int _1445 = _1425 * as_type<int>(_1299);
    int _1447 = _1445 + _1435;
    bool _1449 = !_1437;
    int _1451 = _1449 ? 0 : (-1);
    int _1453 = ~_1365;
    int _1455 = _1453 + _1431;
    int _1457 = _1455 + 1;
    int _1459 = abs(_1451);
    int _1461 = abs(_1443);
    float _1463 = fma(_1217, _1217, _1427);
    int _1465 = ~_1459;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    int _1471 = _352 * _1457;
    int _1473 = _1471 + _813;
    float _1475 = _1321 + 0.5;
    int _1477 = ~_1461;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    if (_1335)
    {
        float _1483 = _1417 * 5.0;
        _1341 = as_type<int>(_1483);
    }
    int _1485 = _1341;
    int _1487 = _1469 * as_type<int>(_1307);
    int _1489 = _1487 + _1447;
    float _1491 = fma(_1247, _1247, _1463);
    float _1493 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1495 = _1379 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1497 = _1489 * _1481;
    bool _1499 = !_723;
    int _1501 = _1499 ? _1473 : (-1);
    float _1503 = _971 + 0.5;
    float _1505 = rsqrt(_1491);
    float _1507 = _1275 + 0.5;
    float _1509 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1511 = _1501 * _1461;
    int _1513 = _1511 + _1497;
    float _1515 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1517 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1439;
    out.m_65.y = _1503;
    out.m_65.z = _1507;
    out.m_65.w = _1475;
    float _1519 = float(_1513);
    float _1521 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4801 = as_type<float>(_1485);
        out.gl_Position.z = _4801;
    }
    out.m_67.x = _1519;
    out.m_69.x = _1521;
    out.m_69.y = _1509;
    out.m_69.z = _1517;
    float _1523 = _1201 * _1505;
    float _1525 = _1217 * _1505;
    if (_1335)
    {
        return out;
    }
    float _1527 = -_1523;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _384);
    float _1531 = _1247 * _1505;
    float _1533 = -_1525;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _677);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1539 = _1529 + _1537;
    float _1541 = -_1531;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1547 = _1535 + _1545;
    float _1549 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1543 + _1551;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1549);
    float _1557 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    bool _1559 = _1557 >= 0.0;
    float _1561 = _1553;
    float _1563 = _1543;
    float _1565 = _1529;
    if (_1559)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1567 = _1561;
    int _1569 = as_type<int>(_1567);
    if (_1559)
    {
        out.m_45.x = 0.0;
    }
    if (_1559)
    {
        float _1571 = _1567 * 5.0;
        _1569 = as_type<int>(_1571);
    }
    int _1573 = _1569;
    if (_1559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4908 = as_type<float>(_1573);
        out.gl_Position.z = _4908;
    }
    if (_1559)
    {
        return out;
    }
    float _1575 = -_384;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1579 = -_677;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1583 = -_1225;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1587 = -_1523;
    float _1589 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1201);
    float _1591 = _1577 * _1577;
    float _1593 = -_1525;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    float _1597 = -_1531;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1601 = _1589 * _1589;
    float _1603 = fma(_1581, _1581, _1591);
    float _1605 = 1.0 / _288;
    float _1607 = _354 * 6.283185482025146484375;
    float _1609 = fma(_1595, _1595, _1601);
    float _1611 = fma(_1585, _1585, _1603);
    float _1613 = in.m_71.x;
    float _1615 = in.m_71.y;
    float _1617 = in.m_71.z;
    float _1619 = fma(_134, 0.310000002384185791015625, _1607);
    float _1621 = rsqrt(_1611);
    float _1623 = 1.0 / _300;
    float _1625 = fma(_1599, _1599, _1609);
    float _1627 = _1581 * _1621;
    float _1629 = _1585 * _1621;
    float _1631 = _1577 * _1621;
    float _1633 = 1.0 / _296;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1637 = _1627 * _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = _1629 * _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1645 = _1631 * _1643;
    float _1647 = _1605 * _1613;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1651 = -_1637;
    float _1653 = fma(_1629, _1649, _1651);
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1657 = -_1641;
    float _1659 = fma(_1631, _1655, _1657);
    float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1663 = -_1645;
    float _1665 = fma(_1627, _1661, _1663);
    float _1667 = sqrt(_1625);
    float _1669 = _1653 * _1653;
    float _1671 = _1623 * _1617;
    float _1673 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1675 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1677 = fma(_1659, _1659, _1669);
    float _1679 = _342 * 6.283185482025146484375;
    float _1681 = _1633 * _1615;
    float _1683 = fma(_1665, _1665, _1677);
    float _1685 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1687 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1671);
    float _1689 = rsqrt(_1683);
    float _1691 = _1505 * _1667;
    float _1693 = fma(_134, 0.10999999940395355224609375, _1679);
    float _1695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1681);
    float _1697 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1647);
    float _1699 = _1685 * _1691;
    float _1701 = _1673 * _1691;
    float _1703 = _1675 * _1691;
    float _1705 = _1619 * 0.15915493667125701904296875;
    float _1707 = _1699 * _1695;
    float _1709 = _1701 * _1697;
    float _1711 = _1703 * _1687;
    float _1713 = _1693 * 0.15915493667125701904296875;
    float _1715 = _1705 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = _1665 * _1689;
    float _1721 = _1659 * _1689;
    float _1723 = _1653 * _1689;
    float _1725 = -_154;
    float _1727 = fma(_1725, 0.5, 0.5);
    float _1729 = _1627 * _1719;
    float _1731 = _1631 * _1721;
    float _1733 = _1629 * _1723;
    float _1735 = _1713 * 6.283185482025146484375;
    float _1737 = sin(_1735);
    float _1739 = -_1729;
    float _1741 = fma(_1629, _1721, _1739);
    float _1743 = -_1731;
    float _1745 = fma(_1627, _1723, _1743);
    float _1747 = -_1733;
    float _1749 = fma(_1631, _1719, _1747);
    float _1751 = _1707 * _1741;
    float _1753 = _1707 * _1745;
    float _1755 = _1707 * _1749;
    float _1757 = fma(_1709, _1723, _1751);
    float _1759 = fma(_1709, _1719, _1753);
    float _1761 = fma(_1709, _1721, _1755);
    float _1763 = fma(_1711, _1631, _1757);
    float _1765 = fma(_1711, _1629, _1759);
    float _1767 = fma(_1711, _1627, _1761);
    float _1769 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1771 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1775 = _384 + _1763;
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1769);
    float _1779 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1771);
    float _1781 = fma(_1717, 0.12999999523162841796875, 1.0);
    float _1783 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1773);
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1777);
    float _1787 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1779);
    float _1789 = fma(_1737, 0.300000011920928955078125, _1781);
    float _1791 = _677 + _1767;
    float _1793 = _1703 * _1785;
    float _1795 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1783);
    float _1797 = _1699 * _1787;
    float _1799 = _1789 * _1727;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1803 = _1701 * _1795;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1807 = _1225 + _1765;
    float _1809 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1801);
    float _1811 = _1699 * _1799;
    float _1813 = _1811 * 2.0;
    float _1815 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1805);
    float _1817 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1809);
    float _1821 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1815);
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1817);
    float _1825 = _1807 + _1819;
    float _1827 = _1791 + _1821;
    float _1829 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1823);
    float _1831 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1825);
    float _1833 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1827);
    float _1835 = _1775 + _1829;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1839 = _1831 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1843 = _1833 + _1841;
    float _1845 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1835);
    float _1847 = _1839 * _1839;
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = sqrt(_1849);
    bool _1853 = _1851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1855 = _1793;
    float _1857 = _1835;
    float _1859 = _1847;
    float _1861 = _1851;
    float _1863 = _1833;
    float _1865 = _1803;
    float _1867 = _1829;
    float _1869 = _1839;
    if (!_1853)
    {
        _1855 = _1833;
    }
    float _1871 = _1855;
    float _1873 = _1871;
    if (!_1853)
    {
        _1857 = _1831;
    }
    float _1875 = _1857;
    float _1877 = _1875;
    if (!_1853)
    {
        _1859 = _1845;
    }
    float _1879 = _1859;
    bool _1881 = !_1853;
    float _1883 = _1879;
    if (!_1881)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1889 = _1851 + _1887;
        float _1891 = _1845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1893 = rsqrt(_1849);
        float _1895 = _1889 * _1885;
        float _1897 = _1895 * 0.15915493667125701904296875;
        float _1899 = _1897 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1897 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = _1901 + (-1.0);
        float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1911 = fma(_1905, _1891, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1913 = fma(_1845, _1901, _1909);
        float _1915 = _1893 * _1911;
        float _1917 = fma(_1843, _1915, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1919 = fma(_1839, _1915, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1883 = _1913;
        _1873 = _1917;
        _1877 = _1919;
        _1861 = _1915;
        _1863 = _1897;
    }
    float _1921 = _1883;
    float _1923 = _1873;
    float _1925 = _1877;
    float _1927 = _1861;
    float _1929 = _1863;
    float _1931 = -_1523;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1921);
    float _1935 = -_1525;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1923);
    float _1939 = -_1531;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1925);
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1945 = _1933 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1953 = _1941 + _1951;
    float _1955 = _1945 * _1945;
    float _1957 = fma(_1949, _1949, _1955);
    float _1959 = fma(_1953, _1953, _1957);
    float _1961 = rsqrt(_1959);
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1965 = _1949 * _1963;
    float _1967 = _1953 * _1963;
    float _1969 = _1965 * _1965;
    float _1971 = _1967 * _1967;
    float _1973 = _1969 + _1971;
    float _1975 = sqrt(_1973);
    bool _1977 = _1975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1975 + _1979;
    float _1983 = _1845;
    float _1985 = _1929;
    float _1987 = _1981;
    if (_1977)
    {
        float _1989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1983 = _1989;
    }
    float _1991 = _1983;
    if (_1977)
    {
        float _1993 = rsqrt(_1973);
        _1985 = _1993;
    }
    float _1995 = _1985;
    float _1997 = _1995;
    if (_1977)
    {
        float _1999 = _1981 * _1991;
        _1987 = _1999;
    }
    float _2001 = _1987;
    if (_1977)
    {
        float _2003 = _2001 * 0.15915493667125701904296875;
        _1865 = _2003;
    }
    float _2005 = _1865;
    float _2007 = _1523;
    if (_1977)
    {
        float _2009 = _2005 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        _2007 = _2011;
    }
    float _2013 = _2007;
    float _2015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2017 = precise::max(0.0, _2015);
    float _2019 = _1927;
    float _2021 = _2017;
    float _2023 = _2015;
    if (_1977)
    {
        float _2025 = _2005 * 6.283185482025146484375;
        float _2027 = cos(_2025);
        _2019 = _2027;
    }
    float _2029 = _2019;
    float _2031 = -_1963;
    float _2033 = -_2017;
    float _2035 = fma(_1945, _2031, _2033);
    if (_1977)
    {
        float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2037;
    }
    float _2039 = _2021;
    float _2041 = sqrt(_1959);
    float _2043 = _2039;
    float _2045 = _2013;
    if (_1977)
    {
        float _2047 = fma(_2013, _2039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1867 = _2047;
    }
    float _2049 = _1867;
    float _2051 = _2049;
    if (!_1977)
    {
        _2043 = _1965;
    }
    float _2053 = _2043;
    float _2055 = _2053;
    if (!_1977)
    {
        _2045 = _2035;
    }
    float _2057 = _2045;
    float _2059 = _2057;
    if (_1977)
    {
        float _2061 = _2029 + (-1.0);
        _2023 = _2061;
    }
    float _2063 = _2023;
    float _2065 = _2063;
    if (_1977)
    {
        float _2067 = _1995 * _2049;
        _1343 = _2067;
    }
    float _2069 = _1343;
    if (!_1977)
    {
        _1997 = _1967;
    }
    float _2071 = _1997;
    float _2073 = _2071;
    if (_1977)
    {
        float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1869 = _2075;
    }
    float _2077 = _1869;
    if (_1977)
    {
        float _2079 = _1965 * _2069;
        _2055 = _2079;
    }
    float _2081 = _2055;
    if (!_1977)
    {
        _2051 = _1969;
    }
    float _2083 = _2051;
    float _2085 = _2083;
    if (_1977)
    {
        float _2087 = _1967 * _2069;
        _2073 = _2087;
    }
    float _2089 = _2073;
    if (_1977)
    {
        float _2091 = fma(_2035, _2029, _2077);
        _2059 = _2091;
    }
    float _2093 = _2059;
    if (_1977)
    {
        float _2095 = _2081 * _2081;
        _2085 = _2095;
    }
    float _2097 = _2085;
    if (!_1977)
    {
        _2065 = _1971;
    }
    float _2099 = _2065;
    float _2101 = _2099;
    if (_1977)
    {
        float _2103 = _2089 * _2089;
        _2101 = _2103;
    }
    float _2105 = _2101;
    float _2107 = fma(_2093, _2093, _2097);
    float _2109 = _2107 + _2105;
    float _2111 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2115 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2113);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2121 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2123 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2111);
    float _2125 = rsqrt(_2109);
    float _2127 = -_2117;
    float _2129 = _2127 + 1.0;
    float _2131 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2133 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2119);
    float _2135 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2137 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2139 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2131);
    float _2141 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    float _2143 = abs(_2129);
    float _2145 = log2(_2143);
    float _2147 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2135);
    float _2149 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2153 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2155 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2147);
    float _2157 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2159 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2161 = _2125 * _2081;
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2165 = _2125 * _2089;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2159);
    float _2169 = _2125 * _2093;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2175 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2177 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2179 = -_2171;
    float _2181 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = -_2163;
    float _2185 = fma(_2183, _2121, 1.0);
    float _2187 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2189 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2191 = -_2165;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2195 = exp2(_2177);
    float _2197 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2199 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2189);
    float _2201 = fma(_2193, -0.5, 0.5);
    float _2203 = fma(_2193, 0.5, 0.5);
    float _2205 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2197);
    float _2207 = _2169 + 1.0;
    float _2209 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2199);
    float _2211 = 1.0 / _2187;
    float _2213 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2215 = fma(_2203, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2209);
    float _2219 = fma(_2203, _2215, -0.212114393711090087890625);
    float _2221 = log2(_2185);
    float _2223 = -_2169;
    float _2225 = fma(_2195, _2207, _2223);
    float _2227 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2213);
    float _2229 = fma(_2203, _2219, 1.570728778839111328125);
    float _2231 = fma(_2225, 0.5, 0.5);
    float _2233 = sqrt(_2201);
    float _2235 = _2217 * _2211;
    float _2237 = _2227 * _2211;
    float _2239 = fma(_2235, 0.5, 0.5);
    float _2241 = fma(_2237, -0.5, 0.5);
    float _2243 = _2221 * 0.693147182464599609375;
    float _2245 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = _2233 * 0.636619746685028076171875;
    float3 _6018 = float3(_2239, _2241, _2245);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6018, float3(0.0), isnan(_6018)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6018, float3(0.0), isnan(_6018)), level(0.0)).x;
    float _2251 = -_2229;
    float _2253 = fma(_2247, _2251, 1.0);
    float3 _6034 = float3(_2239, _2241, _2245);
    float4 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6034, float3(0.0), isnan(_6034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6034, float3(0.0), isnan(_6034)), level(0.0)).xyzw;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = _2256.w;
    float2 _6051 = float2(_2253, _2231);
    float3 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6051, float2(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6051, float2(0.0), isnan(_6051)), level(0.0)).xyz;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2278 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2280 = isnan(0.5);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2286 = _2282 || _2284;
    float _2288 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2290 = _1681 != 0.0;
    bool _2292 = isnan(_1681);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(0.0);
    bool _2298 = _2294 || _2296;
    float _2300 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2276);
    float _2302 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    bool _2304 = _1647 == 0.0;
    bool _2306 = !_2298;
    bool _2308 = _2304 && _2306;
    float _2310 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2300);
    float _2312 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2302);
    float _2314 = exp2(_2288);
    bool _2316 = _1671 == 0.0;
    bool _2318 = _2316 && _2308;
    float _2320 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2322 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2312);
    float _2324 = _2153;
    if (!_2286)
    {
        _1563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2326 = _1563;
    float _2328 = in.m_73.x;
    float _2330 = in.m_73.y;
    float _2332 = in.m_73.z;
    float _2334 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2336 = 1.0 / _2320;
    out.m_69.x = _1521;
    out.m_69.y = _1509;
    out.m_69.z = _1517;
    float _2338 = _2334 + _2320;
    out.m_75.x = _1949;
    out.m_75.y = _1945;
    out.m_75.z = _1953;
    float _2340 = -_2314;
    float _2342 = _2340 + 1.0;
    float _2344 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2346 = _2217 + _2187;
    float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2350 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2344);
    float _2352 = _2346 * 0.5;
    float _2354 = _2338 * _2336;
    float _2356 = _2354 * 0.5;
    float _2358 = -_2348;
    float _2360 = _2358 + 1.0;
    float _2362 = _2356;
    float _2364 = _2326;
    float _2366 = _2336;
    if (!_2286)
    {
        float _2368 = -_2326;
        float _2370 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2368);
        _2362 = _2370;
    }
    float _2372 = _2362;
    if (!_2286)
    {
        _2364 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2374 = _2364;
    float _2376 = _2330;
    float _2378 = _2328;
    float _2380 = _2332;
    if (!_2318)
    {
        float _2382 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2330);
        _2376 = _2382;
    }
    float _2384 = _2376;
    if (!_2318)
    {
        float _2386 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2328);
        _2378 = _2386;
    }
    float _2388 = _2378;
    if (!_2318)
    {
        float _2390 = fma(_1671, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2332);
        _2380 = _2390;
    }
    float _2392 = _2380;
    if (!_2286)
    {
        float _2394 = -_2374;
        float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2366 = _2396;
    }
    float _2398 = _2366;
    float _2400 = _2372;
    if (!_2286)
    {
        float _2402 = 1.0 / _2372;
        _2400 = _2402;
    }
    float _2404 = _2400;
    float _2406 = _1741 * _2384;
    float _2408 = fma(_1723, _2388, _2406);
    float _2410 = _2398;
    if (!_2286)
    {
        float _2412 = 1.0 / _2398;
        _2410 = _2412;
    }
    float _2414 = _2410;
    if (!_2286)
    {
        float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2418 = -_2374;
        float _2420 = fma(_2404, _2416, _2418);
        _1565 = _2420;
    }
    float _2422 = _1565;
    float _2424 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    if (_2286)
    {
        _2324 = 1.0;
    }
    float _2426 = _2324;
    float _2428 = _1749 * _2384;
    float _2430 = _1745 * _2384;
    float _2432 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2424);
    float _2434 = fma(_1721, _2388, _2428);
    float _2436 = _2426;
    if (!_2286)
    {
        float _2438 = _2422 * _2414;
        float _2440 = precise::clamp(_2438, 0.0, 1.0);
        _2436 = _2440;
    }
    float _2442 = _2436;
    float _2444 = fma(_1719, _2388, _2430);
    float _2446 = _2187 * 0.5;
    float _2448 = _2432 + _2187;
    float _2450 = _2442 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2452 = _2442 > 0.0;
    bool _2454 = isnan(_2442);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan(0.0);
    bool _2460 = _2456 || _2458;
    float _2462 = fma(_1627, _2392, _2434);
    float _2464 = fma(_1631, _2392, _2408);
    float _2466 = fma(_1629, _2392, _2444);
    float _2468 = fma(_2227, -0.5, _2446);
    float _2470 = _2448 * 0.5;
    float _2472 = _2450 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2462;
    out.m_77.y = _2464;
    out.m_77.z = _2466;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2227;
    out.gl_Position.z = _2432;
    out.gl_Position.w = _2187;
    out.m_79.x = _2352;
    out.m_79.y = _2468;
    out.m_79.z = _2470;
    out.m_79.w = _2187;
    out.m_45.x = _2472;
    float _2474 = _2348 * _2249;
    float _2476 = _2264 * _2474;
    float _2478 = _2264 * _2360;
    float _2480 = _2274 * _2474;
    float _2482 = fma(_2270, _2476, _2258);
    float _2484 = fma(_2272, _2476, _2260);
    float _2486 = fma(_2264, _2480, _2262);
    out.m_81.x = _2482;
    out.m_81.y = _2484;
    out.m_81.z = _2486;
    out.m_81.w = _2478;
    if (_2460)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2488 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2488;
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
        float _2545 = as_type<float>(_116);
        out.gl_Position.z = _2545;
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
        float _2614 = as_type<float>(_152);
        out.gl_Position.z = _2614;
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
    float _995 = _917;
    if (_513)
    {
        _983 = _342;
    }
    float _997 = _983;
    float _999 = _725 * _979;
    float _1001 = _709 * _979;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1005 = _997;
    if (_593)
    {
        float _1007 = -_336;
        float _1009 = _1007 + 1.0;
        _985 = as_type<int>(_1009);
    }
    int _1011 = _985;
    if (!_593)
    {
        _987 = _336;
    }
    float _1013 = _987;
    float _1015 = _559 * _979;
    float _1017 = _1013;
    if (!_513)
    {
        _1005 = _354;
    }
    float _1019 = _1005;
    float _1021 = _1019;
    if (_593)
    {
        float _1023 = _507 ? as_type<float>(_1011) : _336;
        _1017 = _1023;
    }
    float _1025 = _1017;
    int _1027 = _967 * int(_977);
    int _1029 = _1027 + _865;
    float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_513)
    {
        _989 = _467;
    }
    float _1033 = _989;
    float _1035 = _1033;
    if (!_597)
    {
        _1021 = _336;
    }
    float _1037 = _1021;
    float _1039 = -_1003;
    float _1041 = fma(_1031, 2.0, _1039);
    float _1043 = float(uint(_1029));
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1047 = _1037;
    if (_597)
    {
        float _1049 = _573 ? as_type<float>(_675) : _336;
        _1047 = _1049;
    }
    float _1051 = _1047;
    float _1053 = as_type<float>(_428) * _1043;
    if (_513)
    {
        _1035 = _342;
    }
    float _1055 = _1035;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1059 = -_955;
    float _1061 = _1059 + 1.0;
    if (!_513)
    {
        _991 = _354;
    }
    float _1063 = _991;
    float _1065 = trunc(_1053);
    float _1067 = precise::max(_1065, 0.0);
    uint _1069 = uint(_1067);
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1075 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1077 = _1063;
    if (_513)
    {
        _1077 = _467;
    }
    float _1079 = _1077;
    float _1081 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1001);
    float _1083 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1015);
    float _1085 = -_1073;
    float _1087 = fma(_1075, 2.0, _1085);
    float _1089 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[123].z, _999);
    float _1091 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[83].w, _434);
    float _1093 = fma(_727, _981, _1081);
    float _1095 = fma(_747, _981, _1083);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1099 = fma(_765, _981, _1089);
    int _1101 = ~_352;
    int _1103 = _1101 + 1;
    float _1105 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1107 = int(_977) + int(_1069);
    float _1109 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1111 = float(uint(_813));
    float _1113 = -_134;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1087);
    float _1117 = fma(_1109, _1025, -0.5);
    if (!_513)
    {
        _993 = _354;
    }
    float _1119 = _993;
    float _1121 = as_type<float>(_428) * _1111;
    int _1123 = _1103 * _1107;
    int _1125 = _1123 + _865;
    float _1127 = _1119;
    if (_513)
    {
        _1127 = _467;
    }
    float _1129 = _1127;
    float _1131 = -_134;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1041);
    float _1135 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1139 = trunc(_1121);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1147 = uint(_1125) >= uint(_352);
    float _1149 = fma(_761, _925, _1093);
    float _1151 = fma(_1145, -2.0, _1137);
    float _1153 = fma(_1135, _1051, -0.5);
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    float _1159 = fma(_777, _925, _1095);
    int _1161 = ~_352;
    int _1163 = _1161 + 1;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1167 = ~_1107;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = fma(_809, _925, _1099);
    float _1175 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1165);
    if (!_513)
    {
        _669 = _342;
    }
    float _1177 = _669;
    int _1179 = _352 * _1171;
    int _1181 = _1179 + _865;
    float _1183 = -_134;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    int _1187 = _1163 * int(_1143);
    int _1189 = _1187 + _813;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1193 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1175);
    bool _1195 = !_723;
    int _1197 = _1195 ? _1181 : (-1);
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1201 = _384 + _1199;
    float _1203 = float(uint(_1189));
    float _1205 = fma(_1193, _1105, _1185);
    int _1207 = _1197 >> 31;
    float _1209 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1191);
    float _1211 = as_type<float>(_428) * _1203;
    int _1213 = _1207 & 3;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1217 = _677 + _1215;
    float _1219 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1223 = _1197 + _1213;
    float _1225 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1227 = trunc(_1211);
    float _1229 = precise::max(_1227, 0.0);
    uint _1231 = uint(_1229);
    int _1233 = _1197 & 3;
    bool _1235 = _1233 != 0;
    float _1237 = fma(_807, _907, _1173);
    int _1239 = _1223 >> 2;
    float _1241 = fma(_805, _907, _1159);
    int _1243 = _1235 ? 0 : 1;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1247 = _1225 + _1245;
    int _1249 = _1239 << 4;
    int _1251 = _1249 + 368;
    float _1253 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1071);
    float _1255 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1219);
    float _1257 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    uint _1259 = uint(int(uint(_1251) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    float _1275 = fma(_1253, _1117, _1115);
    float _1277 = fma(_799, _907, _1149);
    int _1279 = _1197 & 3;
    bool _1281 = _1279 != 0;
    float _1283 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _847);
    float _1285 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1091);
    float _1287 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1151);
    bool _1289 = uint(_1279) > 1u;
    int _1291 = _1251 + 8;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    uint _1295 = uint(int(uint(int(_1293)) >> uint(2)));
    int _1297 = int(_1293) & 3;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[int(_1295)][_1297];
    int _1301 = int(_1293) + 1;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    int _1305 = _1301 & 3;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[int(_1303)][_1305];
    bool _1309 = _1279 != 3;
    float _1311 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1255);
    int _1313 = ~_1243;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = -_1287;
    float _1321 = fma(_1285, _823, _1319);
    float _1323 = fma(_1257, -2.0, _1221);
    bool _1325 = uint(_1279) >= 2u;
    float _1327 = fma(_921, _917, _1241);
    bool _1329 = !_1281;
    int _1331 = _1329 ? 0 : 1;
    float _1333 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1323);
    bool _1335 = _1311 >= 0.0;
    float _1337 = fma(_923, _917, _1237);
    int _1339 = _1317;
    int _1341 = as_type<int>(_1321);
    float _1343 = _1225;
    if (!_1289)
    {
        int _1345 = ~_1243;
        int _1347 = _1345 + 1;
        _1339 = _1347;
    }
    int _1349 = _1339;
    float _1351 = fma(_919, _917, _1277);
    int _1353 = ~_352;
    int _1355 = _1353 + 1;
    float _1357 = -_1333;
    float _1359 = fma(_1283, _849, _1357);
    int _1361 = abs(_1349);
    float _1363 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1209);
    int _1365 = int(_1143) + int(_1231);
    float _1367 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1351);
    int _1369 = _1325 ? 0 : 1;
    float _1371 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1327);
    int _1373 = abs(_1331);
    int _1375 = _1355 * _1365;
    int _1377 = _1375 + _813;
    float _1379 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1337);
    int _1381 = ~_1369;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = fma(_1363, _1153, _1133);
    int _1389 = _1385;
    if (_1309)
    {
        int _1391 = ~_1369;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    if (_1335)
    {
        out.m_45.x = 0.0;
    }
    int _1397 = ~_1361;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = _1387 + 0.5;
    int _1405 = abs(_1395);
    float _1407 = _1359 + 0.5;
    int _1409 = ~_1373;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    bool _1415 = uint(_1377) >= uint(_352);
    if (_1335)
    {
        _995 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1417 = _995;
    out.m_63.x = _1403;
    out.m_63.y = _1407;
    int _1419 = _1401 * as_type<int>(_1273);
    int _1421 = ~_1405;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = _1201 * _1201;
    bool _1429 = !_1415;
    int _1431 = _1429 ? 0 : (-1);
    int _1433 = _1413 * as_type<int>(_1265);
    int _1435 = _1433 + _1419;
    bool _1437 = _1279 != 3;
    float _1439 = _1205 + 0.5;
    bool _1441 = !_537;
    int _1443 = _1441 ? 0 : 1;
    int _1445 = _1425 * as_type<int>(_1299);
    int _1447 = _1445 + _1435;
    bool _1449 = !_1437;
    int _1451 = _1449 ? 0 : (-1);
    int _1453 = ~_1365;
    int _1455 = _1453 + _1431;
    int _1457 = _1455 + 1;
    int _1459 = abs(_1451);
    int _1461 = abs(_1443);
    float _1463 = fma(_1217, _1217, _1427);
    int _1465 = ~_1459;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    int _1471 = _352 * _1457;
    int _1473 = _1471 + _813;
    float _1475 = _1321 + 0.5;
    int _1477 = ~_1461;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    if (_1335)
    {
        float _1483 = _1417 * 5.0;
        _1341 = as_type<int>(_1483);
    }
    int _1485 = _1341;
    int _1487 = _1469 * as_type<int>(_1307);
    int _1489 = _1487 + _1447;
    float _1491 = fma(_1247, _1247, _1463);
    float _1493 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1495 = _1379 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1497 = _1489 * _1481;
    bool _1499 = !_723;
    int _1501 = _1499 ? _1473 : (-1);
    float _1503 = _971 + 0.5;
    float _1505 = rsqrt(_1491);
    float _1507 = _1275 + 0.5;
    float _1509 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1511 = _1501 * _1461;
    int _1513 = _1511 + _1497;
    float _1515 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1517 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1439;
    out.m_65.y = _1503;
    out.m_65.z = _1507;
    out.m_65.w = _1475;
    float _1519 = float(_1513);
    float _1521 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4801 = as_type<float>(_1485);
        out.gl_Position.z = _4801;
    }
    out.m_67.x = _1519;
    out.m_69.x = _1521;
    out.m_69.y = _1509;
    out.m_69.z = _1517;
    float _1523 = _1201 * _1505;
    float _1525 = _1217 * _1505;
    if (_1335)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1527 = -_1523;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _384);
    float _1531 = _1247 * _1505;
    float _1533 = -_1525;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _677);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1539 = _1529 + _1537;
    float _1541 = -_1531;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1547 = _1535 + _1545;
    float _1549 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1543 + _1551;
    float _1555 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1549);
    float _1557 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    bool _1559 = _1557 >= 0.0;
    float _1561 = _1553;
    float _1563 = _1543;
    float _1565 = _1529;
    if (_1559)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1567 = _1561;
    int _1569 = as_type<int>(_1567);
    if (_1559)
    {
        out.m_45.x = 0.0;
    }
    if (_1559)
    {
        float _1571 = _1567 * 5.0;
        _1569 = as_type<int>(_1571);
    }
    int _1573 = _1569;
    if (_1559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4908 = as_type<float>(_1573);
        out.gl_Position.z = _4908;
    }
    if (_1559)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1575 = -_384;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1579 = -_677;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1583 = -_1225;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1587 = -_1523;
    float _1589 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1201);
    float _1591 = _1577 * _1577;
    float _1593 = -_1525;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    float _1597 = -_1531;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1601 = _1589 * _1589;
    float _1603 = fma(_1581, _1581, _1591);
    float _1605 = 1.0 / _288;
    float _1607 = _354 * 6.283185482025146484375;
    float _1609 = fma(_1595, _1595, _1601);
    float _1611 = fma(_1585, _1585, _1603);
    float _1613 = in.m_71.x;
    float _1615 = in.m_71.y;
    float _1617 = in.m_71.z;
    float _1619 = fma(_134, 0.310000002384185791015625, _1607);
    float _1621 = rsqrt(_1611);
    float _1623 = 1.0 / _300;
    float _1625 = fma(_1599, _1599, _1609);
    float _1627 = _1581 * _1621;
    float _1629 = _1585 * _1621;
    float _1631 = _1577 * _1621;
    float _1633 = 1.0 / _296;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1637 = _1627 * _1635;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = _1629 * _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1645 = _1631 * _1643;
    float _1647 = _1605 * _1613;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1651 = -_1637;
    float _1653 = fma(_1629, _1649, _1651);
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1657 = -_1641;
    float _1659 = fma(_1631, _1655, _1657);
    float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1663 = -_1645;
    float _1665 = fma(_1627, _1661, _1663);
    float _1667 = sqrt(_1625);
    float _1669 = _1653 * _1653;
    float _1671 = _1623 * _1617;
    float _1673 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1675 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1677 = fma(_1659, _1659, _1669);
    float _1679 = _342 * 6.283185482025146484375;
    float _1681 = _1633 * _1615;
    float _1683 = fma(_1665, _1665, _1677);
    float _1685 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1687 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1671);
    float _1689 = rsqrt(_1683);
    float _1691 = _1505 * _1667;
    float _1693 = fma(_134, 0.10999999940395355224609375, _1679);
    float _1695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1681);
    float _1697 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1647);
    float _1699 = _1685 * _1691;
    float _1701 = _1673 * _1691;
    float _1703 = _1675 * _1691;
    float _1705 = _1619 * 0.15915493667125701904296875;
    float _1707 = _1699 * _1695;
    float _1709 = _1701 * _1697;
    float _1711 = _1703 * _1687;
    float _1713 = _1693 * 0.15915493667125701904296875;
    float _1715 = _1705 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = _1665 * _1689;
    float _1721 = _1659 * _1689;
    float _1723 = _1653 * _1689;
    float _1725 = -_154;
    float _1727 = fma(_1725, 0.5, 0.5);
    float _1729 = _1627 * _1719;
    float _1731 = _1631 * _1721;
    float _1733 = _1629 * _1723;
    float _1735 = _1713 * 6.283185482025146484375;
    float _1737 = sin(_1735);
    float _1739 = -_1729;
    float _1741 = fma(_1629, _1721, _1739);
    float _1743 = -_1731;
    float _1745 = fma(_1627, _1723, _1743);
    float _1747 = -_1733;
    float _1749 = fma(_1631, _1719, _1747);
    float _1751 = _1707 * _1741;
    float _1753 = _1707 * _1745;
    float _1755 = _1707 * _1749;
    float _1757 = fma(_1709, _1723, _1751);
    float _1759 = fma(_1709, _1719, _1753);
    float _1761 = fma(_1709, _1721, _1755);
    float _1763 = fma(_1711, _1631, _1757);
    float _1765 = fma(_1711, _1629, _1759);
    float _1767 = fma(_1711, _1627, _1761);
    float _1769 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1771 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1775 = _384 + _1763;
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1769);
    float _1779 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1771);
    float _1781 = fma(_1717, 0.12999999523162841796875, 1.0);
    float _1783 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1773);
    float _1785 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1777);
    float _1787 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1779);
    float _1789 = fma(_1737, 0.300000011920928955078125, _1781);
    float _1791 = _677 + _1767;
    float _1793 = _1703 * _1785;
    float _1795 = fma(_1765, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1783);
    float _1797 = _1699 * _1787;
    float _1799 = _1789 * _1727;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1803 = _1701 * _1795;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1807 = _1225 + _1765;
    float _1809 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1801);
    float _1811 = _1699 * _1799;
    float _1813 = _1811 * 2.0;
    float _1815 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1805);
    float _1817 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1809);
    float _1821 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1815);
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1817);
    float _1825 = _1807 + _1819;
    float _1827 = _1791 + _1821;
    float _1829 = fma(_1803, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1823);
    float _1831 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1825);
    float _1833 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1827);
    float _1835 = _1775 + _1829;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1839 = _1831 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1843 = _1833 + _1841;
    float _1845 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1835);
    float _1847 = _1839 * _1839;
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = sqrt(_1849);
    bool _1853 = _1851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1855 = _1793;
    float _1857 = _1835;
    float _1859 = _1847;
    float _1861 = _1851;
    float _1863 = _1833;
    float _1865 = _1803;
    float _1867 = _1829;
    float _1869 = _1839;
    if (!_1853)
    {
        _1855 = _1833;
    }
    float _1871 = _1855;
    float _1873 = _1871;
    if (!_1853)
    {
        _1857 = _1831;
    }
    float _1875 = _1857;
    float _1877 = _1875;
    if (!_1853)
    {
        _1859 = _1845;
    }
    float _1879 = _1859;
    bool _1881 = !_1853;
    float _1883 = _1879;
    if (!_1881)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1889 = _1851 + _1887;
        float _1891 = _1845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1893 = rsqrt(_1849);
        float _1895 = _1889 * _1885;
        float _1897 = _1895 * 0.15915493667125701904296875;
        float _1899 = _1897 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1897 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = _1901 + (-1.0);
        float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1911 = fma(_1905, _1891, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1913 = fma(_1845, _1901, _1909);
        float _1915 = _1893 * _1911;
        float _1917 = fma(_1843, _1915, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1919 = fma(_1839, _1915, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1883 = _1913;
        _1873 = _1917;
        _1877 = _1919;
        _1861 = _1915;
        _1863 = _1897;
    }
    float _1921 = _1883;
    float _1923 = _1873;
    float _1925 = _1877;
    float _1927 = _1861;
    float _1929 = _1863;
    float _1931 = -_1523;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1921);
    float _1935 = -_1525;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1923);
    float _1939 = -_1531;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1925);
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1945 = _1933 + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1949 = _1937 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1953 = _1941 + _1951;
    float _1955 = _1945 * _1945;
    float _1957 = fma(_1949, _1949, _1955);
    float _1959 = fma(_1953, _1953, _1957);
    float _1961 = rsqrt(_1959);
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1965 = _1949 * _1963;
    float _1967 = _1953 * _1963;
    float _1969 = _1965 * _1965;
    float _1971 = _1967 * _1967;
    float _1973 = _1969 + _1971;
    float _1975 = sqrt(_1973);
    bool _1977 = _1975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1975 + _1979;
    float _1983 = _1845;
    float _1985 = _1929;
    float _1987 = _1981;
    if (_1977)
    {
        float _1989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1983 = _1989;
    }
    float _1991 = _1983;
    if (_1977)
    {
        float _1993 = rsqrt(_1973);
        _1985 = _1993;
    }
    float _1995 = _1985;
    float _1997 = _1995;
    if (_1977)
    {
        float _1999 = _1981 * _1991;
        _1987 = _1999;
    }
    float _2001 = _1987;
    if (_1977)
    {
        float _2003 = _2001 * 0.15915493667125701904296875;
        _1865 = _2003;
    }
    float _2005 = _1865;
    float _2007 = _1523;
    if (_1977)
    {
        float _2009 = _2005 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        _2007 = _2011;
    }
    float _2013 = _2007;
    float _2015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2017 = precise::max(0.0, _2015);
    float _2019 = _1927;
    float _2021 = _2017;
    float _2023 = _2015;
    if (_1977)
    {
        float _2025 = _2005 * 6.283185482025146484375;
        float _2027 = cos(_2025);
        _2019 = _2027;
    }
    float _2029 = _2019;
    float _2031 = -_1963;
    float _2033 = -_2017;
    float _2035 = fma(_1945, _2031, _2033);
    if (_1977)
    {
        float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2037;
    }
    float _2039 = _2021;
    float _2041 = sqrt(_1959);
    float _2043 = _2039;
    float _2045 = _2013;
    if (_1977)
    {
        float _2047 = fma(_2013, _2039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1867 = _2047;
    }
    float _2049 = _1867;
    float _2051 = _2049;
    if (!_1977)
    {
        _2043 = _1965;
    }
    float _2053 = _2043;
    float _2055 = _2053;
    if (!_1977)
    {
        _2045 = _2035;
    }
    float _2057 = _2045;
    float _2059 = _2057;
    if (_1977)
    {
        float _2061 = _2029 + (-1.0);
        _2023 = _2061;
    }
    float _2063 = _2023;
    float _2065 = _2063;
    if (_1977)
    {
        float _2067 = _1995 * _2049;
        _1343 = _2067;
    }
    float _2069 = _1343;
    if (!_1977)
    {
        _1997 = _1967;
    }
    float _2071 = _1997;
    float _2073 = _2071;
    if (_1977)
    {
        float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1869 = _2075;
    }
    float _2077 = _1869;
    if (_1977)
    {
        float _2079 = _1965 * _2069;
        _2055 = _2079;
    }
    float _2081 = _2055;
    if (!_1977)
    {
        _2051 = _1969;
    }
    float _2083 = _2051;
    float _2085 = _2083;
    if (_1977)
    {
        float _2087 = _1967 * _2069;
        _2073 = _2087;
    }
    float _2089 = _2073;
    if (_1977)
    {
        float _2091 = fma(_2035, _2029, _2077);
        _2059 = _2091;
    }
    float _2093 = _2059;
    if (_1977)
    {
        float _2095 = _2081 * _2081;
        _2085 = _2095;
    }
    float _2097 = _2085;
    if (!_1977)
    {
        _2065 = _1971;
    }
    float _2099 = _2065;
    float _2101 = _2099;
    if (_1977)
    {
        float _2103 = _2089 * _2089;
        _2101 = _2103;
    }
    float _2105 = _2101;
    float _2107 = fma(_2093, _2093, _2097);
    float _2109 = _2107 + _2105;
    float _2111 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2115 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2113);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2121 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2123 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2111);
    float _2125 = rsqrt(_2109);
    float _2127 = -_2117;
    float _2129 = _2127 + 1.0;
    float _2131 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2133 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2119);
    float _2135 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2137 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2139 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2131);
    float _2141 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    float _2143 = abs(_2129);
    float _2145 = log2(_2143);
    float _2147 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2135);
    float _2149 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2153 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2155 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2147);
    float _2157 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2159 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2161 = _2125 * _2081;
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2165 = _2125 * _2089;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2159);
    float _2169 = _2125 * _2093;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2175 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2177 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2179 = -_2171;
    float _2181 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = -_2163;
    float _2185 = fma(_2183, _2121, 1.0);
    float _2187 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2189 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2191 = -_2165;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2195 = exp2(_2177);
    float _2197 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2199 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2189);
    float _2201 = fma(_2193, -0.5, 0.5);
    float _2203 = fma(_2193, 0.5, 0.5);
    float _2205 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2197);
    float _2207 = _2169 + 1.0;
    float _2209 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2199);
    float _2211 = 1.0 / _2187;
    float _2213 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2215 = fma(_2203, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2209);
    float _2219 = fma(_2203, _2215, -0.212114393711090087890625);
    float _2221 = log2(_2185);
    float _2223 = -_2169;
    float _2225 = fma(_2195, _2207, _2223);
    float _2227 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2213);
    float _2229 = fma(_2203, _2219, 1.570728778839111328125);
    float _2231 = fma(_2225, 0.5, 0.5);
    float _2233 = sqrt(_2201);
    float _2235 = _2217 * _2211;
    float _2237 = _2227 * _2211;
    float _2239 = fma(_2235, 0.5, 0.5);
    float _2241 = fma(_2237, -0.5, 0.5);
    float _2243 = _2221 * 0.693147182464599609375;
    float _2245 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = _2233 * 0.636619746685028076171875;
    float3 _6018 = float3(_2239, _2241, _2245);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6018, float3(0.0), isnan(_6018)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6018, float3(0.0), isnan(_6018)), level(0.0)).x;
    float _2251 = -_2229;
    float _2253 = fma(_2247, _2251, 1.0);
    float3 _6034 = float3(_2239, _2241, _2245);
    float4 _2256 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6034, float3(0.0), isnan(_6034)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6034, float3(0.0), isnan(_6034)), level(0.0)).xyzw;
    float _2258 = _2256.x;
    float _2260 = _2256.y;
    float _2262 = _2256.z;
    float _2264 = _2256.w;
    float2 _6051 = float2(_2253, _2231);
    float3 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6051, float2(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6051, float2(0.0), isnan(_6051)), level(0.0)).xyz;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2278 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2280 = isnan(0.5);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2286 = _2282 || _2284;
    float _2288 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2290 = _1681 != 0.0;
    bool _2292 = isnan(_1681);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(0.0);
    bool _2298 = _2294 || _2296;
    float _2300 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2276);
    float _2302 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_55.x = _184;
    out.m_55.y = _196;
    out.m_55.z = _208;
    bool _2304 = _1647 == 0.0;
    bool _2306 = !_2298;
    bool _2308 = _2304 && _2306;
    float _2310 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2300);
    float _2312 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2302);
    float _2314 = exp2(_2288);
    bool _2316 = _1671 == 0.0;
    bool _2318 = _2316 && _2308;
    float _2320 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2322 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2312);
    float _2324 = _2153;
    if (!_2286)
    {
        _1563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2326 = _1563;
    float _2328 = in.m_73.x;
    float _2330 = in.m_73.y;
    float _2332 = in.m_73.z;
    float _2334 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2336 = 1.0 / _2320;
    out.m_69.x = _1521;
    out.m_69.y = _1509;
    out.m_69.z = _1517;
    float _2338 = _2334 + _2320;
    out.m_75.x = _1949;
    out.m_75.y = _1945;
    out.m_75.z = _1953;
    float _2340 = -_2314;
    float _2342 = _2340 + 1.0;
    float _2344 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2346 = _2217 + _2187;
    float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2350 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2344);
    float _2352 = _2346 * 0.5;
    float _2354 = _2338 * _2336;
    float _2356 = _2354 * 0.5;
    float _2358 = -_2348;
    float _2360 = _2358 + 1.0;
    float _2362 = _2356;
    float _2364 = _2326;
    float _2366 = _2336;
    if (!_2286)
    {
        float _2368 = -_2326;
        float _2370 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2368);
        _2362 = _2370;
    }
    float _2372 = _2362;
    if (!_2286)
    {
        _2364 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2374 = _2364;
    float _2376 = _2330;
    float _2378 = _2328;
    float _2380 = _2332;
    if (!_2318)
    {
        float _2382 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2330);
        _2376 = _2382;
    }
    float _2384 = _2376;
    if (!_2318)
    {
        float _2386 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2328);
        _2378 = _2386;
    }
    float _2388 = _2378;
    if (!_2318)
    {
        float _2390 = fma(_1671, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2332);
        _2380 = _2390;
    }
    float _2392 = _2380;
    if (!_2286)
    {
        float _2394 = -_2374;
        float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2366 = _2396;
    }
    float _2398 = _2366;
    float _2400 = _2372;
    if (!_2286)
    {
        float _2402 = 1.0 / _2372;
        _2400 = _2402;
    }
    float _2404 = _2400;
    float _2406 = _1741 * _2384;
    float _2408 = fma(_1723, _2388, _2406);
    float _2410 = _2398;
    if (!_2286)
    {
        float _2412 = 1.0 / _2398;
        _2410 = _2412;
    }
    float _2414 = _2410;
    if (!_2286)
    {
        float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2418 = -_2374;
        float _2420 = fma(_2404, _2416, _2418);
        _1565 = _2420;
    }
    float _2422 = _1565;
    float _2424 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    if (_2286)
    {
        _2324 = 1.0;
    }
    float _2426 = _2324;
    float _2428 = _1749 * _2384;
    float _2430 = _1745 * _2384;
    float _2432 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2424);
    float _2434 = fma(_1721, _2388, _2428);
    float _2436 = _2426;
    if (!_2286)
    {
        float _2438 = _2422 * _2414;
        float _2440 = precise::clamp(_2438, 0.0, 1.0);
        _2436 = _2440;
    }
    float _2442 = _2436;
    float _2444 = fma(_1719, _2388, _2430);
    float _2446 = _2187 * 0.5;
    float _2448 = _2432 + _2187;
    float _2450 = _2442 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2452 = _2442 > 0.0;
    bool _2454 = isnan(_2442);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan(0.0);
    bool _2460 = _2456 || _2458;
    float _2462 = fma(_1627, _2392, _2434);
    float _2464 = fma(_1631, _2392, _2408);
    float _2466 = fma(_1629, _2392, _2444);
    float _2468 = fma(_2227, -0.5, _2446);
    float _2470 = _2448 * 0.5;
    float _2472 = _2450 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2462;
    out.m_77.y = _2464;
    out.m_77.z = _2466;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2227;
    out.gl_Position.z = _2432;
    out.gl_Position.w = _2187;
    out.m_79.x = _2352;
    out.m_79.y = _2468;
    out.m_79.z = _2470;
    out.m_79.w = _2187;
    out.m_45.x = _2472;
    float _2474 = _2348 * _2249;
    float _2476 = _2264 * _2474;
    float _2478 = _2264 * _2360;
    float _2480 = _2274 * _2474;
    float _2482 = fma(_2270, _2476, _2258);
    float _2484 = fma(_2272, _2476, _2260);
    float _2486 = fma(_2264, _2480, _2262);
    out.m_81.x = _2482;
    out.m_81.y = _2484;
    out.m_81.z = _2486;
    out.m_81.w = _2478;
    if (_2460)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2488 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2488;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

