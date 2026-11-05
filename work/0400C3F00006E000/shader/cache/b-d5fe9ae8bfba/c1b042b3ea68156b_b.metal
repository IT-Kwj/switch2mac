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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_105 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_67 [[user(locn14)]];
    float4 m_79 [[user(locn15)]];
    float4 m_107 [[user(locn16)]];
    float4 m_101 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_71 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_48 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_95 [[attribute(7)]];
    float4 m_89 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_73 [[attribute(12)]];
    float4 m_65 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2754 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = in.m_50.w;
    float _125 = trunc(_121);
    int _128 = int(_125);
    float _130 = -_123;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _132;
    bool _136 = _128 >= 1;
    float _138 = 0.0;
    float _140 = _123;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _138;
    if (!_136)
    {
        out.m_55.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3069 = as_type<float>(_148);
        out.gl_Position.z = _3069;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _152 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_123);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_128);
    bool _164 = _132 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    if (_168)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _140;
    if (_168)
    {
        out.m_55.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _150 = as_type<int>(_172);
    }
    int _174 = _150;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_174);
        out.gl_Position.z = _3124;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = 1.0 / _162;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _132 * _176;
    bool _182 = !_178;
    float _184 = _180;
    float _202;
    if (!_182)
    {
        float _186 = in.m_57.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _180;
    }
    _204 = false;
    float _206 = _202;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    float _212 = in.m_59.x;
    float _214 = in.m_59.y;
    float _216 = in.m_59.z;
    bool _218 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_206);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    bool _234 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_206);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_228;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = 1.0 / _232;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = _244 * _248;
    float _260 = -_244;
    float _262 = _260 + 1.0;
    float _264 = _210 * _254;
    float _266 = fma(_252, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = _266 * _258;
    float _278 = fma(_270, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = fma(_274, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].x, _276);
    float _284 = _278 * _258;
    float _286 = _280 * _258;
    float _288 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].x, _282);
    float _290 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].y, _284);
    float _292 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].z, _286);
    float _294 = _288 * _212;
    float _296 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    float _300 = _296 * _214;
    float _302 = _298 * _216;
    bool _304 = !_256;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _184 = _320;
    }
    float _322 = _184;
    float _324 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _326 = int(_324);
    float _328 = in.m_48.x;
    float _330 = in.m_48.y;
    float _332 = in.m_48.z;
    float _334 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _338 = _336 != 0;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    float _346 = in.m_61.w;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _350 = int(_348);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _354 = _352 != 0;
    float _356 = in.m_63.y;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _360 = _358 != 0;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _364 = _362 != 0;
    float _366 = in.m_65.w;
    float _368 = float(_326);
    bool _370 = !_364;
    int _372 = _370 ? 0 : 1;
    float _374 = 1.0 / _368;
    float _376 = float(uint(_350));
    int _378 = ~_350;
    int _380 = _378 + 1;
    int _382 = ~_350;
    int _384 = _382 + 1;
    float _386 = 1.0 / _376;
    float _388 = _132 * _374;
    out.m_67.w = _366;
    float _390 = trunc(_388);
    int _392 = int(_390);
    int _394 = as_type<int>(_386) + (-2);
    float _396 = float(uint(_392));
    float _398 = float(_392);
    float _400 = as_type<float>(_394) * _396;
    float _402 = trunc(_400);
    float _404 = precise::max(_402, 0.0);
    uint _407 = uint(_404);
    bool _409 = !_338;
    float _411 = _409 ? 7.345489978790283203125 : 1.0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _415 = _413 != 0;
    int _417 = _380 * int(_407);
    int _419 = _417 + _392;
    float _421 = float(uint(_419));
    float _423 = in.m_57.x;
    float _425 = in.m_57.y;
    float _427 = in.m_57.z;
    float _429 = as_type<float>(_394) * _421;
    float _431 = trunc(_429);
    float _433 = precise::max(_431, 0.0);
    uint _435 = uint(_433);
    float _437 = in.m_69.x;
    float _439 = in.m_69.y;
    float _441 = in.m_69.z;
    float _443 = in.m_69.w;
    int _445 = int(_407) + int(_435);
    float _447 = _411 * _423;
    float _449 = in.m_71.x;
    float _451 = in.m_71.y;
    float _453 = in.m_71.z;
    float _455 = in.m_71.w;
    int _457 = _384 * _445;
    int _459 = _457 + _392;
    float _461 = floor(_447);
    bool _463 = uint(_459) >= uint(_350);
    float _465 = float(_350);
    bool _467 = !_463;
    int _469 = _467 ? 0 : (-1);
    bool _471 = _398 >= _465;
    bool _473 = isnan(_398);
    bool _475 = _471 || _473;
    bool _477 = isnan(_465);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _330 * _439;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _499 = _497 != 0;
    float _501 = trunc(_481);
    int _503 = int(_501);
    float _505 = -_461;
    float _507 = _447 + _505;
    int _509 = ~_445;
    int _511 = _509 + _469;
    int _513 = _511 + 1;
    float _515 = _330 * _342;
    float _517 = _330 * _451;
    float _519 = _507 * _465;
    float _521 = in.m_73.y;
    float _523 = _132 * _465;
    float _525 = _330 + _356;
    bool _527 = !_491;
    int _529 = _527 ? 0 : 1;
    int _531 = _350 * _513;
    int _533 = _531 + _392;
    float _535 = _523 * _176;
    bool _537 = _350 == 0;
    float _539 = trunc(_519);
    int _541 = int(_539);
    float _543 = fma(_328, _340, _515);
    int _545 = _350 + (-1);
    float _547 = as_type<float>(_513);
    float _549 = _525;
    if (_354)
    {
        float _551 = in.m_57.x;
        _547 = _551;
    }
    float _553 = _547;
    int _555 = ~_503;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_332, _344, _543);
    bool _563 = !_537;
    int _565 = _563 ? _533 : (-1);
    float _567 = trunc(_535);
    int _569 = int(_567);
    int _571 = abs(_529);
    float _573 = _561 + _346;
    int _575 = _565 * _559;
    float _577 = fma(_328, _449, _517);
    float _579 = fma(_328, _437, _483);
    bool _581 = !_487;
    int _583 = _581 ? 0 : 1;
    int _585 = _503 * _545;
    int _587 = _585 + _575;
    bool _589 = !_495;
    int _591 = _589 ? 0 : 1;
    float _593 = fma(_332, _441, _579);
    int _595 = abs(_372);
    int _597 = _587 * _571;
    int _599 = abs(_583);
    float _601 = -_521;
    float _603 = _601 + 1.0;
    int _605 = abs(_591);
    int _607 = _541 * _595;
    int _609 = _607 + _392;
    bool _611 = _425 > 0.5;
    int _613 = _569 * _599;
    int _615 = _613 + _597;
    float _617 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _619 = _521;
    float _621 = _561;
    float _623 = _573;
    if (_360)
    {
        float _625 = _611 ? _603 : _521;
        _619 = _625;
    }
    float _627 = _619;
    float _629 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _631 = !_499;
    int _633 = _631 ? 0 : 1;
    int _635 = _609 * _605;
    int _637 = _635 + _615;
    float _639 = _593 + _443;
    int _641 = abs(_633);
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _645 = _541 * _641;
    int _647 = _645 + _637;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _651 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].z, _643);
    float _653 = float(uint(_647));
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _663 = as_type<float>(_394) * _653;
    float _665 = 1.0 / _657;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _669 = -_649;
    float _671 = fma(_617, 2.0, _669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[79].z, _667);
    float _679 = -_132;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _671);
    float _683 = trunc(_663);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = 1.0 / _661;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _701 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _707 = _553 > 0.5;
    bool _709 = _707 && _354;
    float _711 = 1.0 / _675;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _715 = fma(_332, _453, _577);
    int _717 = ~_350;
    int _719 = _717 + 1;
    float _721 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].w, _705);
    float _723 = fma(_629, -2.0, _713);
    out.m_75.x = _695;
    out.m_75.y = _701;
    out.m_75.z = _703;
    out.m_75.w = _699;
    int _725 = _719 * int(_687);
    int _727 = _725 + _647;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = _715 + _455;
    float _743 = _735 * _697;
    bool _745 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _747 = isnan(_322);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = float(uint(_609));
    float _759 = float(uint(_727));
    float _761 = _739 * _711;
    float _763 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.934999942779541015625);
    float _765 = _731 * _665;
    float _767 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 4.870999813079833984375);
    float _769 = as_type<float>(_394) * _759;
    float _771 = precise::min(_763, 3.0);
    float _773 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _723);
    float _775 = precise::min(_767, 5.0);
    float _777 = trunc(_769);
    float _779 = precise::max(_777, 0.0);
    uint _781 = uint(_779);
    float _783 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _651);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _787 = _322 + _785;
    bool _789 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _791 = isnan(_322);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[79].x, _677);
    float _803 = fma(_775, -7.751926898956298828125, 38.75963592529296875);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _807 = _322 + _805;
    float _809 = in.m_73.x;
    float _811 = fma(_743, _787, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _813 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _721);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _817 = _322 + _815;
    float _819 = -_799;
    float _821 = _819 + 1.0;
    float _823 = fma(_765, _807, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _825 = ~_350;
    int _827 = _825 + 1;
    float _829 = fma(_761, _817, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _831 = _755 * _821;
    int _833 = int(_687) + int(_781);
    float _835 = as_type<float>(_394) * _757;
    bool _837 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = isnan(_322);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_755;
    float _851 = _849 + 1.0;
    float _853 = trunc(_835);
    float _855 = precise::max(_853, 0.0);
    uint _857 = uint(_855);
    bool _859 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _861 = isnan(_322);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -_847;
    float _873 = _871 + 1.0;
    float _875 = _847 * _851;
    int _877 = _827 * _833;
    int _879 = _877 + _647;
    float _881 = _801 * (-0.15915493667125701904296875);
    float _883 = _869 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _741 + _885;
    float _889 = -_869;
    float _891 = _889 + 1.0;
    bool _893 = uint(_879) >= uint(_350);
    float _895 = _811 * _883;
    float _897 = _809;
    float _899 = _803;
    if (_354)
    {
        _621 = _809;
    }
    float _901 = _621;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = _639 + _903;
    bool _907 = !_893;
    int _909 = _907 ? 0 : (-1);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[115].x, _895);
    int _913 = ~_350;
    int _915 = _913 + 1;
    float _917 = _901;
    if (_709)
    {
        float _919 = -_901;
        float _921 = _919 + 1.0;
        _917 = _921;
    }
    float _923 = _917;
    int _925 = ~_833;
    int _927 = _925 + _909;
    int _929 = _927 + 1;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _573 + _931;
    float _935 = _881 * 6.283185482025146484375;
    float _937 = sin(_935);
    int _939 = _915 * int(_857);
    int _941 = _939 + _609;
    if (_354)
    {
        _897 = _923;
    }
    float _943 = _897;
    float _945 = _933 * _933;
    int _947 = _350 * _929;
    int _949 = _947 + _647;
    float _951 = fma(_829, _875, _911);
    float _953 = float(uint(_941));
    float _955 = fma(_887, _887, _945);
    float _957 = _881 * 6.283185482025146484375;
    float _959 = cos(_957);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _963 = _525 + _961;
    float _965 = fma(_905, _905, _955);
    bool _967 = !_537;
    int _969 = _967 ? _949 : (-1);
    float _971 = as_type<float>(_394) * _953;
    float _973 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _975 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _977 = sqrt(_965);
    int _979 = _969 >> 31;
    float _981 = fma(_963, _963, _945);
    float _983 = fma(_823, _831, _951);
    int _985 = _969 & 3;
    bool _987 = _985 != 0;
    int _989 = _979 & 3;
    float _991 = _937 * _973;
    float _993 = trunc(_971);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    int _999 = _969 + _989;
    float _1001 = _959 * _973;
    float _1003 = -_991;
    float _1005 = fma(_959, _975, _1003);
    float _1007 = fma(_905, _905, _981);
    int _1009 = _999 >> 2;
    float _1011 = fma(_937, _975, _1001);
    float _1013 = _963 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = rsqrt(_965);
    int _1017 = _1009 << 4;
    int _1019 = _1017 + 368;
    float _1021 = _334 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1023 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    float _1025 = -_773;
    float _1027 = fma(_813, _1011, _1025);
    uint _1029 = uint(int(uint(_1019) >> uint(2)));
    uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
    int _1033 = int(_1029) & 3;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[int(_1031)][_1033];
    int _1037 = int(_1029) + 1;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    int _1041 = _1037 & 3;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[int(_1039)][_1041];
    float _1045 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[118].x, _983);
    float _1047 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1023);
    float _1049 = rsqrt(_1007);
    float _1051 = _977 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1053 = fma(_783, _1005, _681);
    int _1055 = _969 & 3;
    bool _1057 = _1055 != 0;
    float _1059 = fma(_771, 15.384601593017578125, -45.153804779052734375);
    bool _1061 = _1047 >= 0.0;
    float _1063 = precise::min(_1021, _1051);
    int _1065 = _1019 + 8;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
    int _1071 = int(_1067) & 3;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[int(_1069)][_1071];
    int _1075 = int(_1067) + 1;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    int _1079 = _1075 & 3;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[int(_1077)][_1079];
    bool _1083 = uint(_1055) > 1u;
    float _1085 = _1015 * _1063;
    int _1087 = int(_857) + int(_997);
    out.m_77.w = _1063;
    int _1089 = ~_350;
    int _1091 = _1089 + 1;
    float _1093 = _963 * _1049;
    float _1095 = _933 * _1049;
    float _1097 = _933 * _1085;
    bool _1099 = !_1057;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = -_1093;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    int _1107 = _987 ? 0 : 1;
    float _1109 = -_1095;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _933);
    bool _1113 = uint(_1055) >= 2u;
    float _1115 = _1105 * _1105;
    int _1117 = ~_1107;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = _887 * _1085;
    int _1125 = _1121;
    float _1127 = _1123;
    float _1129 = _1097;
    if (!_1083)
    {
        int _1131 = ~_1107;
        int _1133 = _1131 + 1;
        _1125 = _1133;
    }
    int _1135 = _1125;
    int _1137 = _1091 * _1087;
    int _1139 = _1137 + _609;
    bool _1141 = _1055 != 3;
    float _1143 = -_1123;
    float _1145 = _887 + _1143;
    int _1147 = abs(_1135);
    float _1149 = -_1097;
    float _1151 = _933 + _1149;
    bool _1153 = uint(_1139) >= uint(_350);
    float _1155 = _1145 * _1145;
    int _1157 = ~_1147;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = fma(_1111, _1111, _1115);
    bool _1165 = _1055 != 3;
    float _1167 = fma(_1151, _1151, _1155);
    int _1169 = _1113 ? 0 : 1;
    float _1171 = _905 * _1049;
    int _1173 = abs(_1101);
    float _1175 = _1059 * _803;
    float _1177 = precise::clamp(_1175, 0.0, 1.0);
    int _1179 = ~_1169;
    int _1181 = _1179 + 1;
    int _1183 = _1181 + 1;
    int _1185 = _1183;
    if (_1061)
    {
        out.m_55.x = 0.0;
    }
    int _1187 = _1161 * as_type<int>(_1043);
    bool _1189 = !_1165;
    int _1191 = _1189 ? 0 : (-1);
    float _1193 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    if (_1141)
    {
        int _1195 = ~_1169;
        int _1197 = _1195 + 1;
        _1185 = _1197;
    }
    int _1199 = _1185;
    bool _1201 = !_1153;
    int _1203 = _1201 ? 0 : (-1);
    int _1205 = abs(_1191);
    out.m_79.x = _1193;
    int _1207 = ~_1173;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    float _1213 = _905 * _1085;
    int _1215 = abs(_1199);
    int _1217 = ~_1087;
    int _1219 = _1217 + _1203;
    int _1221 = _1219 + 1;
    float _1223 = -_1171;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    int _1227 = ~_1215;
    int _1229 = _1227 + 1;
    int _1231 = _1229 + 1;
    float _1233 = -_1213;
    float _1235 = _905 + _1233;
    int _1237 = _1211 * as_type<int>(_1035);
    int _1239 = _1237 + _1187;
    int _1241 = ~_1205;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = fma(_1225, _1225, _1163);
    float _1249 = fma(_1235, _1235, _1167);
    int _1251 = _1231 * as_type<int>(_1073);
    int _1253 = _1251 + _1239;
    int _1255 = _350 * _1221;
    int _1257 = _1255 + _609;
    float _1259 = sqrt(_1249);
    int _1261 = _1245 * as_type<int>(_1081);
    int _1263 = _1261 + _1253;
    bool _1265 = !_415;
    int _1267 = _1265 ? 0 : 1;
    float _1269 = _1027 + 0.5;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1273 = abs(_1267);
    float _1275 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1277 = sqrt(_1247);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1281 = _1053 + 0.5;
    int _1283 = ~_1273;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    float _1289 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1293 = !_537;
    int _1295 = _1293 ? _1257 : (-1);
    out.m_81.x = _1281;
    out.m_81.y = _1269;
    int _1297 = _1263 * _1287;
    float _1299 = _1015 * _1259;
    if (_1061)
    {
        _899 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1301 = _899;
    int _1303 = _1295 * _1273;
    int _1305 = _1303 + _1297;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1309 = _1049 * _1277;
    float _1311 = _334 * _1299;
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1315 = as_type<int>(_1301);
    if (_1061)
    {
        float _1317 = _1301 * 5.0;
        _1315 = as_type<int>(_1317);
    }
    int _1319 = _1315;
    float _1321 = float(_1305);
    float _1323 = _1311 * _1309;
    out.m_83.x = _1289;
    out.m_83.y = _1313;
    out.m_83.z = _1291;
    out.m_83.w = _1275;
    if (_1061)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4871 = as_type<float>(_1319);
        out.gl_Position.z = _4871;
    }
    out.m_85.x = _1321;
    out.m_87.x = _1323;
    if (_1061)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1325 = -_1093;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _1329 = -_1095;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _1333 = -_1171;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1327 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1343 = _1331 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1347 = _1335 + _1345;
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1349);
    float _1353 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1351);
    bool _1355 = _1353 >= 0.0;
    float _1357 = _1347;
    if (_1355)
    {
        _1357 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1359 = _1357;
    int _1361 = as_type<int>(_1359);
    if (_1355)
    {
        out.m_55.x = 0.0;
    }
    if (_1355)
    {
        float _1363 = _1359 * 5.0;
        _1361 = as_type<int>(_1363);
    }
    int _1365 = _1361;
    if (_1355)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4962 = as_type<float>(_1365);
        out.gl_Position.z = _4962;
    }
    if (_1355)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1367 = -_525;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = -_573;
    float _1373 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = -_639;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1369 * _1369;
    float _1381 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1383 = fma(_1373, _1373, _1379);
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1387 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1389 = fma(_1377, _1377, _1383);
    float _1391 = -_1385;
    float _1393 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1391);
    float _1395 = rsqrt(_1389);
    float _1397 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1401 = -_1397;
    float _1403 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1401);
    float _1405 = -_1399;
    float _1407 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1405);
    float _1409 = _1373 * _1395;
    float _1411 = _1377 * _1395;
    float _1413 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1415 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1417 = _1409 * _1409;
    float _1419 = _1369 * _1395;
    float _1421 = -_1415;
    float _1423 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1421);
    float _1425 = fma(_1411, _1411, _1417);
    float _1427 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1431 = rsqrt(_1425);
    float _1433 = -_1427;
    float _1435 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1433);
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1439 = -_1429;
    float _1441 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1439);
    float _1443 = -_1437;
    float _1445 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1443);
    float _1447 = -_1413;
    float _1449 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1447);
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1423);
    float _1453 = _1411 * _1431;
    float _1455 = _1409 * _1431;
    float _1457 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1459 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1449);
    float _1461 = -_1453;
    float _1463 = _1411 * _1461;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1469 = -_1457;
    float _1471 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1473 = -_1463;
    float _1475 = fma(_1409, _1455, _1473);
    float _1477 = _1419 * _1455;
    float _1479 = -_1465;
    float _1481 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1483 = -_1453;
    float _1485 = _1419 * _1483;
    float _1487 = _1475 * _1475;
    float _1489 = -_1467;
    float _1491 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1471);
    float _1495 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1497 = fma(_1477, _1477, _1487);
    float _1499 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1491);
    float _1501 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1503 = -_1495;
    float _1505 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1507 = fma(_1485, _1485, _1497);
    float _1509 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1511 = -_1499;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1501);
    float _1515 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1505);
    float _1517 = rsqrt(_1507);
    float _1519 = -_1509;
    float _1521 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1519);
    float _1523 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1525 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1521);
    float _1527 = -_1523;
    float _1529 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = 1.0 / _1513;
    float _1543 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1529);
    float _1545 = _1475 * _1517;
    float _1547 = precise::clamp(_1545, 0.0, 1.0);
    float _1549 = -_1547;
    float _1551 = _1549 + 1.0;
    float _1553 = fma(_1515, _1541, -1.0);
    float _1555 = _1551 * _1541;
    float _1557 = fma(_1551, _1553, 1.0);
    float _1559 = _1525 * _1555;
    float _1561 = _1543 * _1555;
    float _1563 = _1557 * _1557;
    float _1565 = fma(_1559, _1559, _1563);
    float _1567 = fma(_1561, _1561, _1565);
    float _1569 = rsqrt(_1567);
    float _1571 = _1561 * _1569;
    float _1573 = _1559 * _1569;
    float _1575 = _1557 * _1569;
    float _1577 = _1299 * _1309;
    float _1579 = -_1571;
    float _1581 = _1409 * _1579;
    float _1583 = _1411 * _1575;
    float _1585 = _1381 * _1577;
    float _1587 = -_1573;
    float _1589 = -_1581;
    float _1591 = fma(_1411, _1587, _1589);
    float _1593 = -_1573;
    float _1595 = _1419 * _1593;
    float _1597 = -_1571;
    float _1599 = -_1583;
    float _1601 = fma(_1419, _1597, _1599);
    float _1603 = _1387 * _1577;
    float _1605 = _1591 * _1591;
    float _1607 = -_1595;
    float _1609 = fma(_1409, _1575, _1607);
    float _1611 = -_1097;
    float _1613 = _573 + _1611;
    float _1615 = -_1213;
    float _1617 = _639 + _1615;
    float _1619 = fma(_1601, _1601, _1605);
    float _1621 = fma(_1609, _1609, _1619);
    float _1623 = rsqrt(_1621);
    float _1625 = _1601 * _1623;
    float _1627 = _1609 * _1623;
    float _1629 = _1591 * _1623;
    float _1631 = _1411 * _1625;
    float _1633 = _1419 * _1627;
    float _1635 = -_1631;
    float _1637 = fma(_1409, _1627, _1635);
    float _1639 = _1409 * _1629;
    float _1641 = -_1633;
    float _1643 = fma(_1411, _1629, _1641);
    float _1645 = _1637 * _1637;
    float _1647 = -_1639;
    float _1649 = fma(_1419, _1625, _1647);
    float _1651 = in.m_89.x;
    float _1653 = in.m_89.y;
    float _1655 = in.m_89.z;
    float _1657 = fma(_1643, _1643, _1645);
    float _1659 = fma(_1649, _1649, _1657);
    float _1661 = rsqrt(_1659);
    float _1663 = -_1651;
    float _1665 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1663);
    float _1667 = _1649 * _1661;
    float _1669 = _1637 * _1661;
    float _1671 = _1643 * _1661;
    float _1673 = fma(_1193, _1665, _1651);
    float _1675 = _1409 * _1667;
    float _1677 = _1411 * _1669;
    float _1679 = -_1655;
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1679);
    float _1683 = -_1675;
    float _1685 = fma(_1411, _1671, _1683);
    float _1687 = -_1677;
    float _1689 = fma(_1419, _1667, _1687);
    float _1691 = _1419 * _1671;
    float _1693 = _1685 * _1685;
    float _1695 = -_1691;
    float _1697 = fma(_1409, _1669, _1695);
    float _1699 = -_1653;
    float _1701 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1699);
    float _1703 = fma(_1689, _1689, _1693);
    float _1705 = fma(_1193, _1701, _1653);
    float _1707 = fma(_1697, _1697, _1703);
    float _1709 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1673);
    float _1711 = fma(_1193, _1681, _1655);
    float _1713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1705);
    float _1715 = _1323 * _1709;
    float _1717 = rsqrt(_1707);
    float _1719 = _1585 * _1713;
    float _1721 = _1711 * _1603;
    float _1723 = _1719 * _1667;
    float _1725 = _1719 * _1671;
    float _1727 = _1697 * _1717;
    float _1729 = _1689 * _1717;
    float _1731 = _1685 * _1717;
    float _1733 = _1719 * _1669;
    float _1735 = fma(_1715, _1727, _1723);
    float _1737 = fma(_1715, _1729, _1725);
    float _1739 = fma(_1715, _1731, _1733);
    float _1741 = fma(_1721, _1411, _1735);
    float _1743 = -_1123;
    float _1745 = _1743 + _525;
    float _1747 = fma(_1721, _1409, _1737);
    float _1749 = fma(_1721, _1419, _1739);
    float _1751 = _639 + _1741;
    float _1753 = -_1093;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1745);
    float _1757 = _573 + _1747;
    float _1759 = -_1095;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1613);
    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1765 = _1751 + _1763;
    float _1767 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1771 = _1757 + _1769;
    float _1773 = -_1171;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1777 = _1765 * _1765;
    float _1779 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1767);
    float _1781 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = fma(_1771, _1771, _1777);
    float _1785 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1779);
    float _1787 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1789 = _525 + _1749;
    float _1791 = sqrt(_1783);
    float _1793 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1795 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1787);
    float _1797 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = 1.0 / _1793;
    float _1811 = _1797 + _1793;
    bool _1813 = _1791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1815 = _1811 * _1809;
    float _1817 = _1815 * 0.5;
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1821 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1819);
    float _1823 = _1739;
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1827 = _1817;
    float _1829 = _1793;
    float _1831 = _1775;
    if (!_1813)
    {
        _1823 = _1757;
    }
    float _1833 = _1823;
    float _1835 = _1833;
    if (!_1813)
    {
        _1825 = _1751;
    }
    float _1837 = _1825;
    float _1839 = _1837;
    if (!_1813)
    {
        _1827 = _1789;
    }
    float _1841 = _1827;
    bool _1843 = !_1813;
    float _1845 = _1841;
    if (!_1843)
    {
        float _1847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1851 = _1791 + _1849;
        float _1853 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1855 = rsqrt(_1783);
        float _1857 = _1851 * _1847;
        float _1859 = _1857 * 0.15915493667125701904296875;
        float _1861 = _1859 * 6.283185482025146484375;
        float _1863 = cos(_1861);
        float _1865 = _1859 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = _1863 + (-1.0);
        float _1871 = fma(_1867, _1853, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1873 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1875 = _1855 * _1871;
        float _1877 = fma(_1789, _1863, _1873);
        float _1879 = fma(_1771, _1875, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1881 = fma(_1765, _1875, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1835 = _1879;
        _1845 = _1877;
        _1839 = _1881;
    }
    float _1883 = _1835;
    float _1885 = _1845;
    float _1887 = _1839;
    float _1889 = 1.0 / _1821;
    float _1891 = -_1097;
    float _1893 = _1891 + _1883;
    float _1895 = -_1123;
    float _1897 = _1895 + _1885;
    float _1899 = -_1213;
    float _1901 = _1899 + _1887;
    if (_1539)
    {
        _1829 = 1.0;
    }
    float _1903 = _1829;
    float _1905 = -_1095;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _1909 = -_1093;
    float _1911 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1897);
    float _1913 = -_1171;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1901);
    float _1917 = _1911;
    float _1919 = _1907;
    float _1921 = _1915;
    float _1923 = _1903;
    if (!_1807)
    {
        float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1927 = _1755 + _1925;
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1931 = _1761 + _1929;
        float _1933 = 1.0 / _1309;
        float _1935 = -_573;
        float _1937 = _1935 + _1883;
        float _1939 = _1927 * _1927;
        float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1943 = _1775 + _1941;
        float _1945 = -_525;
        float _1947 = _1945 + _1885;
        float _1949 = -_639;
        float _1951 = _1949 + _1887;
        float _1953 = fma(_1931, _1931, _1939);
        float _1955 = fma(_1943, _1943, _1953);
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1959 = sqrt(_1955);
        float _1961 = precise::min(_1959, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1963 = _1961 * _1957;
        float _1965 = _1963 * _1933;
        float _1967 = fma(_1937, _1965, _1761);
        float _1969 = fma(_1947, _1965, _1755);
        float _1971 = fma(_1951, _1965, _1775);
        _1917 = _1969;
        _1919 = _1967;
        _1921 = _1971;
        _623 = _1937;
    }
    float _1973 = _1917;
    float _1975 = _1919;
    float _1977 = _1921;
    float _1979 = _623;
    float _1981 = _1979;
    if (_1539)
    {
        _549 = 1.0;
    }
    float _1983 = _549;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1987 = _1889 * _1985;
    float _1989 = _1983;
    if (!_1539)
    {
        float _1991 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = _1993 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2001 = _1999 * 0.15915493667125701904296875;
        float _2003 = _1993 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        float _2007 = 1.0 / _1997;
        float _2009 = _2001 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = _2001 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = 1.0 / _2019;
        float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2025 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2023;
        float _2027 = 1.0 / _2025;
        float _2029 = _2017 * _2021;
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = fma(_1987, _2029, _2031);
        float _2035 = _2033 * _2027;
        float _2037 = precise::clamp(_2035, 0.0, 1.0);
        _1127 = _1993;
        _1923 = _2037;
    }
    float _2039 = _1127;
    float _2041 = _1923;
    if (!_1539)
    {
        float _2043 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2045 = _2043 * 0.15915493667125701904296875;
        float _2047 = _2045 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2053 = _2051 * 0.15915493667125701904296875;
        float _2055 = _2045 * 6.283185482025146484375;
        float _2057 = sin(_2055);
        float _2059 = 1.0 / _2049;
        float _2061 = _2053 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = _2057 * _2059;
        float _2067 = _2053 * 6.283185482025146484375;
        float _2069 = sin(_2067);
        float _2071 = _2063 * _2065;
        float _2073 = 1.0 / _2071;
        float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2077 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2075;
        float _2079 = 1.0 / _2077;
        float _2081 = _2069 * _2073;
        float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2085 = fma(_1987, _2081, _2083);
        float _2087 = _2085 * _2079;
        float _2089 = precise::clamp(_2087, 0.0, 1.0);
        float _2091 = -_2089;
        float _2093 = _2091 + 1.0;
        _1989 = _2093;
    }
    float _2095 = _1989;
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2099 = _1973 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _1975 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2107 = _1977 + _2105;
    float _2109 = _2099 * _2099;
    float _2111 = fma(_2103, _2103, _2109);
    float _2113 = fma(_2107, _2107, _2111);
    float _2115 = rsqrt(_2113);
    float _2117 = sqrt(_2113);
    float _2119 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2121 = _2103 * _2119;
    float _2123 = _2107 * _2119;
    float _2125 = _2121 * _2121;
    float _2127 = _2123 * _2123;
    float _2129 = _2125 + _2127;
    float _2131 = sqrt(_2129);
    bool _2133 = _2131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2137 = _2131 + _2135;
    float _2139 = _2115;
    float _2141 = _2137;
    float _2143 = _2099;
    if (_2133)
    {
        float _2145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = _2147;
    if (_2133)
    {
        float _2151 = _2137 * _2147;
        _2141 = _2151;
    }
    float _2153 = _2141;
    if (_2133)
    {
        float _2155 = rsqrt(_2129);
        _2149 = _2155;
    }
    float _2157 = _2149;
    float _2159 = _2157;
    if (_2133)
    {
        float _2161 = _2153 * 0.15915493667125701904296875;
        _1129 = _2161;
    }
    float _2163 = _1129;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = _2107;
    float _2169 = _2163;
    if (_2133)
    {
        float _2171 = _2163 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        _2167 = _2173;
    }
    float _2175 = _2167;
    float _2177 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2179 = precise::max(0.0, _2165);
    float _2181 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2177);
    float _2183 = _2039;
    float _2185 = _2179;
    if (_2133)
    {
        float _2187 = _2163 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        _2183 = _2189;
    }
    float _2191 = _2183;
    float _2193 = -_2119;
    float _2195 = -_2179;
    float _2197 = fma(_2099, _2193, _2195);
    float _2199 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2181);
    if (_2133)
    {
        float _2201 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2143 = _2201;
    }
    float _2203 = _2143;
    float _2205 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2207 = _2175;
    float _2209 = _2203;
    if (_2133)
    {
        float _2211 = fma(_2175, _2203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1981 = _2211;
    }
    float _2213 = _1981;
    float _2215 = _2213;
    if (!_2133)
    {
        _2207 = _2197;
    }
    float _2217 = _2207;
    float _2219 = _2217;
    if (!_2133)
    {
        _2169 = _2123;
    }
    float _2221 = _2169;
    float _2223 = _2221;
    if (_2133)
    {
        float _2225 = _2157 * _2213;
        _2209 = _2225;
    }
    float _2227 = _2209;
    if (!_2133)
    {
        _2159 = _2121;
    }
    float _2229 = _2159;
    float _2231 = _2229;
    float _2233 = _2191;
    if (_2133)
    {
        float _2235 = _2191 + (-1.0);
        _2185 = _2235;
    }
    float _2237 = _2185;
    float _2239 = _2237;
    if (_2133)
    {
        float _2241 = _2121 * _2227;
        _2231 = _2241;
    }
    float _2243 = _2231;
    if (_2133)
    {
        float _2245 = _2123 * _2227;
        _2223 = _2245;
    }
    float _2247 = _2223;
    if (!_2133)
    {
        _2215 = _2127;
    }
    float _2249 = _2215;
    float _2251 = _2249;
    if (_2133)
    {
        float _2253 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    float _2257 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2133)
    {
        float _2259 = _2247 * _2247;
        _2251 = _2259;
    }
    float _2261 = _2251;
    if (_2133)
    {
        float _2263 = fma(_2197, _2191, _2255);
        _2219 = _2263;
    }
    float _2265 = _2219;
    if (!_2133)
    {
        _2233 = _2125;
    }
    float _2267 = _2233;
    float _2269 = _2267;
    if (_2133)
    {
        float _2271 = _2243 * _2243;
        _2269 = _2271;
    }
    float _2273 = _2269;
    float _2275 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2257);
    float _2277 = fma(_2265, _2265, _2273);
    float _2279 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2275);
    float _2281 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2283 = _2277 + _2261;
    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2287 = fma(_2117, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2285);
    float _2289 = precise::clamp(_2287, 0.0, 1.0);
    float _2291 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2293 = rsqrt(_2283);
    float _2295 = -_2289;
    float _2297 = _2295 + 1.0;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2301 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2303 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2305 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2307 = abs(_2297);
    float _2309 = log2(_2307);
    float _2311 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2313 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2303);
    float _2315 = -_2299;
    float _2317 = fma(_2315, _2305, 1.0);
    float _2319 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2311);
    float _2321 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2313);
    float _2323 = _2293 * _2243;
    float _2325 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2319);
    float _2327 = floor(_2281);
    float _2329 = _2293 * _2265;
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2333 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2335 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2337 = _2293 * _2247;
    float _2339 = -_2331;
    float _2341 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2339);
    float _2343 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2345 = floor(_2301);
    float _2347 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2349 = -_2337;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2341);
    float _2353 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2343);
    float _2355 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2357 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2353);
    float _2359 = exp2(_2347);
    float _2361 = -_2327;
    float _2363 = _2281 + _2361;
    float _2365 = fma(_1883, 6.2500002968590706586837768554688e-05, 0.5);
    float _2367 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2357);
    float _2369 = fma(_1887, 6.2500002968590706586837768554688e-05, 0.5);
    float _2371 = _2329 + 1.0;
    float _2373 = log2(_2317);
    float _2375 = -_2345;
    float _2377 = _2301 + _2375;
    float _2379 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2381 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2355);
    float _2383 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2379);
    float _2385 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2381);
    float _2387 = 1.0 / _2367;
    float _2389 = fma(_2351, -0.5, 0.5);
    float _2391 = fma(_2351, 0.5, 0.5);
    float _2393 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2383);
    float _2395 = -_2329;
    float _2397 = fma(_2359, _2371, _2395);
    float _2399 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2401 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2393);
    float _2403 = sqrt(_2389);
    float _2405 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2385);
    float _2407 = fma(_2391, _2399, -0.212114393711090087890625);
    float _2409 = _2373 * 0.693147182464599609375;
    float _2411 = fma(_2391, _2407, 1.570728778839111328125);
    float _2413 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2415 = _2401 * _2387;
    float _2417 = _2405 * _2387;
    float _2419 = fma(_2397, 0.5, 0.5);
    float _2421 = fma(_2415, 0.5, 0.5);
    float _2423 = fma(_2417, -0.5, 0.5);
    float _2425 = _2403 * 0.636619746685028076171875;
    float2 _6663 = float2(_2363, _2377);
    float _2427 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6663, float2(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6663, float2(0.0), isnan(_6663)), level(0.0)).x;
    float3 _6674 = float3(_2421, _2423, _2413);
    float _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6674, float3(0.0), isnan(_6674)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6674, float3(0.0), isnan(_6674)), level(0.0)).x;
    float _2431 = -_2411;
    float _2433 = fma(_2425, _2431, 1.0);
    float3 _6690 = float3(_2421, _2423, _2413);
    float4 _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6690, float3(0.0), isnan(_6690)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6690, float3(0.0), isnan(_6690)), level(0.0)).xyzw;
    float _2438 = _2436.x;
    float _2440 = _2436.y;
    float _2442 = _2436.z;
    float _2444 = _2436.w;
    float2 _6706 = float2(_2433, _2419);
    float3 _2448 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).xyz;
    float _2450 = _2448.x;
    float _2452 = _2448.y;
    float _2454 = _2448.z;
    float2 _6720 = float2(_2365, _2369);
    float3 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6720, float2(0.0), isnan(_6720)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6720, float2(0.0), isnan(_6720)), level(0.0)).xyz;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = abs(_1987);
    float _2466 = log2(_2464);
    bool _2468 = _1705 != 0.0;
    bool _2470 = isnan(_1705);
    bool _2472 = _2468 || _2470;
    bool _2474 = isnan(0.0);
    bool _2476 = _2472 || _2474;
    out.m_91.x = _1761;
    out.m_91.y = _1755;
    out.m_91.z = _1775;
    bool _2478 = _1673 == 0.0;
    bool _2480 = !_2476;
    bool _2482 = _2478 && _2480;
    out.m_93.x = _1975;
    out.m_93.y = _1973;
    out.m_93.z = _1977;
    bool _2484 = _1711 == 0.0;
    bool _2486 = _2484 && _2482;
    bool _2488 = _1987 <= 8000.0;
    bool _2490 = isnan(_1987);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(8000.0);
    bool _2496 = _2492 || _2494;
    float _2498 = float(_2496);
    float _2500 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2502 = in.m_95.x;
    float _2504 = in.m_95.y;
    float _2506 = in.m_95.z;
    float _2508 = exp2(_2500);
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2504;
    float _2516 = _2502;
    float _2518 = _2506;
    float _2520 = _2405;
    float _2522 = _2401;
    if (!_2486)
    {
        float _2524 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2504);
        _2514 = _2524;
    }
    float _2526 = _2514;
    if (!_2486)
    {
        float _2528 = fma(_1673, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2502);
        _2516 = _2528;
    }
    float _2530 = _2516;
    float _2532 = fma(_2512, -2.0, 3.0);
    float _2534 = _2512 * _2512;
    float _2536 = _1671 * _2526;
    float _2538 = _1669 * _2526;
    float _2540 = _1667 * _2526;
    float _2542 = _2534 * _2532;
    float _2544 = fma(_1729, _2530, _2536);
    float _2546 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2486)
    {
        float _2548 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2506);
        _2518 = _2548;
    }
    float _2550 = _2518;
    float _2552 = -_2542;
    float _2554 = _2552 + 1.0;
    float _2556 = _2367 * 0.5;
    float _2558 = exp2(_2546);
    float _2560 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2542);
    float _2562 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2564 = fma(_2405, -0.5, _2556);
    float _2566 = _2498 * _2560;
    float _2568 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2562);
    float _2570 = fma(_1731, _2530, _2538);
    float _2572 = _2401 + _2367;
    bool _2574 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2576 = isnan(_2117);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2582 = _2578 || _2580;
    float _2584 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2568);
    float _2586 = fma(_1727, _2530, _2540);
    float _2588 = fma(_1409, _2550, _2544);
    float _2590 = fma(_1419, _2550, _2570);
    float _2592 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2584);
    float _2594 = fma(_1411, _2550, _2586);
    float _2596 = -_2558;
    float _2598 = _2596 + 1.0;
    float _2600 = in.m_63.x;
    float _2602 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2604 = _2592 + _2367;
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2608 = _2572 * 0.5;
    out.m_97.x = _2588;
    out.m_97.y = _2590;
    out.m_97.z = _2594;
    float _2610 = _2604 * 0.5;
    if (!_2582)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2612 = _1831;
    out.gl_Position.x = _2401;
    out.gl_Position.y = _2405;
    out.gl_Position.z = _2592;
    out.gl_Position.w = _2367;
    out.m_99.x = _2608;
    out.m_99.y = _2564;
    out.m_99.z = _2610;
    out.m_99.w = _2367;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2582)
    {
        _2520 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2618 = _2520;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2582)
    {
        _2522 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2624 = _2522;
    float _2626 = -_2427;
    float _2628 = _2626 + 1.0;
    float _2630 = _2606 * _2429;
    float _2632 = -_2606;
    float _2634 = _2632 + 1.0;
    float _2636 = _2628 * _2602;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2444 * _2630;
    float _2642 = _2444 * _2634;
    float _2644 = -_2638;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2648 = _2454 * _2630;
    float _2650 = fma(_2450, _2640, _2438);
    float _2652 = fma(_2452, _2640, _2440);
    out.m_101.x = _2458;
    out.m_101.y = _2460;
    out.m_101.z = _2462;
    float _2654 = fma(_2444, _2648, _2442);
    float _2656 = _2646 * _2600;
    float _2658 = _2041 * _2095;
    out.m_103.x = _2650;
    out.m_103.y = _2652;
    out.m_103.z = _2654;
    out.m_103.w = _2642;
    float _2660 = _2656 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2662 = _2658 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2664 = _2656;
    float _2666 = _2658;
    float _2668 = _2660;
    float _2670 = _2624;
    float _2672 = _2624;
    if (!_2582)
    {
        _2664 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2664;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2582)
    {
        _2666 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2680 = _2666;
    out.m_105.x = _2660;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2582)
    {
        _2668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2686 = _2668;
    bool _2688 = !_2582;
    float _2690 = _2686;
    float _2692 = _2686;
    if (!_2688)
    {
        bool _2694 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2696 = isnan(_2117);
        bool _2698 = _2694 || _2696;
        bool _2700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2702 = _2698 || _2700;
        if (!_2702)
        {
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2706 = _2117 + _2704;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2710 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2708;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2716 = 1.0 / _2710;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2734 = _2706 * _2716;
            float _2736 = precise::clamp(_2734, 0.0, 1.0);
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2742 = fma(_2736, _2714, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2744 = fma(_2736, _2740, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2746 = fma(_2736, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2748 = fma(_2736, _2724, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2750 = fma(_2736, _2728, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2752 = fma(_2736, _2732, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2672 = _2746;
            _2692 = _2750;
            _2622 = _2742;
            _2616 = _2748;
            _2678 = _2744;
            _2684 = _2752;
            _2754 = true;
        }
        else
        {
            bool _2756 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2758 = isnan(_2117);
            bool _2760 = _2756 || _2758;
            bool _2762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2764 = _2760 || _2762;
            if (!_2764)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2766 = _2620;
            _2622 = _2766;
            if (!_2764)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2768 = _2670;
            _2672 = _2768;
            if (!_2764)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2770 = _2676;
            _2678 = _2770;
            if (!_2764)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2772 = _2614;
            _2616 = _2772;
            if (!_2764)
            {
                _2690 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2774 = _2690;
            _2692 = _2774;
            if (!_2764)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2776 = _2682;
            bool _2778 = !_2764;
            _2684 = _2776;
            if (!_2778)
            {
                bool _2780 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2782 = isnan(_2117);
                bool _2784 = _2780 || _2782;
                bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2788 = _2784 || _2786;
                if (!_2788)
                {
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2792 = _2117 + _2790;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2796 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2794;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2802 = 1.0 / _2796;
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2820 = _2792 * _2802;
                    float _2822 = precise::clamp(_2820, 0.0, 1.0);
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2828 = fma(_2822, _2800, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2830 = fma(_2822, _2826, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2832 = fma(_2822, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2834 = fma(_2822, _2810, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2836 = fma(_2822, _2814, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2838 = fma(_2822, _2818, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2672 = _2832;
                    _2692 = _2836;
                    _2622 = _2828;
                    _2616 = _2834;
                    _2678 = _2830;
                    _2684 = _2838;
                    _2754 = true;
                }
                else
                {
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2692 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2754 = false;
    float _2840 = _2672;
    float _2842 = _2692;
    float _2844 = _2622;
    float _2846 = _2616;
    float _2848 = _2678;
    float _2850 = _2684;
    float _2852 = _2662 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2854 = fma(_2590, -0.5, 0.5);
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = -_2840;
    float _2860 = _2858 + _2842;
    float _2862 = -_2844;
    float _2864 = _2862 + _2846;
    out.m_107.x = 0.0;
    float _2866 = fma(_2856, _2860, _2840);
    float _2868 = -_2848;
    float _2870 = _2868 + _2850;
    float _2872 = fma(_2856, _2864, _2844);
    float _2874 = _2866 * 0.586610972881317138671875;
    bool _2876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2878 = fma(_2856, _2870, _2848);
    out.m_55.x = _2852;
    float _2880 = fma(_2872, 0.298911988735198974609375, _2874);
    bool _2882 = _2041 > 0.0;
    bool _2884 = isnan(_2041);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan(0.0);
    bool _2890 = _2886 || _2888;
    float _2892 = fma(_2878, 0.114477999508380889892578125, _2880);
    bool _2894 = _2095 <= 0.0;
    bool _2896 = !_2890;
    bool _2898 = _2894 || _2896;
    float _2900 = -_2892;
    float _2902 = _2872 + _2900;
    float _2904 = -_2892;
    float _2906 = _2866 + _2904;
    float _2908 = -_2892;
    float _2910 = _2878 + _2908;
    float _2912 = fma(_2902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    float _2914 = fma(_2906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    float _2916 = fma(_2910, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    bool _2918 = !_2876;
    if (!_2918)
    {
        float _2920 = -_1973;
        float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2924 = -_1975;
        float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2928 = -_1977;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2932 = _2922 * _2922;
        float _2934 = fma(_2926, _2926, _2932);
        float _2936 = fma(_2930, _2930, _2934);
        float _2938 = sqrt(_2936);
        float _2940 = rsqrt(_2936);
        float _2942 = -_2938;
        float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2948 = precise::clamp(_2946, 0.0, 1.0);
        float _2950 = _2926 * _2940;
        float _2952 = _2922 * _2940;
        float _2954 = abs(_2948);
        float _2956 = log2(_2954);
        float _2958 = _2930 * _2940;
        float _2960 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2962 = _2590 * _2952;
        float _2964 = -_2952;
        float _2966 = -_2960;
        float _2968 = fma(_2964, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2966);
        float _2970 = fma(_2588, _2950, _2962);
        float _2972 = -_2958;
        float _2974 = fma(_2972, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2968);
        float _2976 = fma(_2594, _2958, _2970);
        float _2978 = precise::clamp(_2976, 0.0, 1.0);
        float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2982 = _2974 + _2980;
        float _2984 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2988 = precise::clamp(_2986, 0.0, 1.0);
        float _2990 = exp2(_2984);
        float _2992 = _2990 * _2988;
        float _2994 = _2978 * _2992;
        float _2996 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2998 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3000 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2996;
        out.m_107.y = _2998;
        out.m_107.z = _3000;
    }
    out.m_77.x = _2912;
    out.m_77.y = _2914;
    out.m_77.z = _2916;
    if (!_2898)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3002 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3002;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2754 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = in.m_50.w;
    float _125 = trunc(_121);
    int _128 = int(_125);
    float _130 = -_123;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _132;
    bool _136 = _128 >= 1;
    float _138 = 0.0;
    float _140 = _123;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _138;
    if (!_136)
    {
        out.m_55.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3069 = as_type<float>(_148);
        out.gl_Position.z = _3069;
    }
    if (!_136)
    {
        return out;
    }
    bool _152 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_123);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_128);
    bool _164 = _132 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    if (_168)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _140;
    if (_168)
    {
        out.m_55.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _150 = as_type<int>(_172);
    }
    int _174 = _150;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_174);
        out.gl_Position.z = _3124;
    }
    if (_168)
    {
        return out;
    }
    float _176 = 1.0 / _162;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _132 * _176;
    bool _182 = !_178;
    float _184 = _180;
    float _202;
    if (!_182)
    {
        float _186 = in.m_57.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _180;
    }
    _204 = false;
    float _206 = _202;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    float _212 = in.m_59.x;
    float _214 = in.m_59.y;
    float _216 = in.m_59.z;
    bool _218 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_206);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    bool _234 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_206);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_228;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = 1.0 / _232;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = _244 * _248;
    float _260 = -_244;
    float _262 = _260 + 1.0;
    float _264 = _210 * _254;
    float _266 = fma(_252, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = _266 * _258;
    float _278 = fma(_270, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = fma(_274, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].x, _276);
    float _284 = _278 * _258;
    float _286 = _280 * _258;
    float _288 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].x, _282);
    float _290 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].y, _284);
    float _292 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].z, _286);
    float _294 = _288 * _212;
    float _296 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    float _300 = _296 * _214;
    float _302 = _298 * _216;
    bool _304 = !_256;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _184 = _320;
    }
    float _322 = _184;
    float _324 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _326 = int(_324);
    float _328 = in.m_48.x;
    float _330 = in.m_48.y;
    float _332 = in.m_48.z;
    float _334 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _338 = _336 != 0;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    float _346 = in.m_61.w;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _350 = int(_348);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _354 = _352 != 0;
    float _356 = in.m_63.y;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _360 = _358 != 0;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _364 = _362 != 0;
    float _366 = in.m_65.w;
    float _368 = float(_326);
    bool _370 = !_364;
    int _372 = _370 ? 0 : 1;
    float _374 = 1.0 / _368;
    float _376 = float(uint(_350));
    int _378 = ~_350;
    int _380 = _378 + 1;
    int _382 = ~_350;
    int _384 = _382 + 1;
    float _386 = 1.0 / _376;
    float _388 = _132 * _374;
    out.m_67.w = _366;
    float _390 = trunc(_388);
    int _392 = int(_390);
    int _394 = as_type<int>(_386) + (-2);
    float _396 = float(uint(_392));
    float _398 = float(_392);
    float _400 = as_type<float>(_394) * _396;
    float _402 = trunc(_400);
    float _404 = precise::max(_402, 0.0);
    uint _407 = uint(_404);
    bool _409 = !_338;
    float _411 = _409 ? 7.345489978790283203125 : 1.0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _415 = _413 != 0;
    int _417 = _380 * int(_407);
    int _419 = _417 + _392;
    float _421 = float(uint(_419));
    float _423 = in.m_57.x;
    float _425 = in.m_57.y;
    float _427 = in.m_57.z;
    float _429 = as_type<float>(_394) * _421;
    float _431 = trunc(_429);
    float _433 = precise::max(_431, 0.0);
    uint _435 = uint(_433);
    float _437 = in.m_69.x;
    float _439 = in.m_69.y;
    float _441 = in.m_69.z;
    float _443 = in.m_69.w;
    int _445 = int(_407) + int(_435);
    float _447 = _411 * _423;
    float _449 = in.m_71.x;
    float _451 = in.m_71.y;
    float _453 = in.m_71.z;
    float _455 = in.m_71.w;
    int _457 = _384 * _445;
    int _459 = _457 + _392;
    float _461 = floor(_447);
    bool _463 = uint(_459) >= uint(_350);
    float _465 = float(_350);
    bool _467 = !_463;
    int _469 = _467 ? 0 : (-1);
    bool _471 = _398 >= _465;
    bool _473 = isnan(_398);
    bool _475 = _471 || _473;
    bool _477 = isnan(_465);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _330 * _439;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _499 = _497 != 0;
    float _501 = trunc(_481);
    int _503 = int(_501);
    float _505 = -_461;
    float _507 = _447 + _505;
    int _509 = ~_445;
    int _511 = _509 + _469;
    int _513 = _511 + 1;
    float _515 = _330 * _342;
    float _517 = _330 * _451;
    float _519 = _507 * _465;
    float _521 = in.m_73.y;
    float _523 = _132 * _465;
    float _525 = _330 + _356;
    bool _527 = !_491;
    int _529 = _527 ? 0 : 1;
    int _531 = _350 * _513;
    int _533 = _531 + _392;
    float _535 = _523 * _176;
    bool _537 = _350 == 0;
    float _539 = trunc(_519);
    int _541 = int(_539);
    float _543 = fma(_328, _340, _515);
    int _545 = _350 + (-1);
    float _547 = as_type<float>(_513);
    float _549 = _525;
    if (_354)
    {
        float _551 = in.m_57.x;
        _547 = _551;
    }
    float _553 = _547;
    int _555 = ~_503;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_332, _344, _543);
    bool _563 = !_537;
    int _565 = _563 ? _533 : (-1);
    float _567 = trunc(_535);
    int _569 = int(_567);
    int _571 = abs(_529);
    float _573 = _561 + _346;
    int _575 = _565 * _559;
    float _577 = fma(_328, _449, _517);
    float _579 = fma(_328, _437, _483);
    bool _581 = !_487;
    int _583 = _581 ? 0 : 1;
    int _585 = _503 * _545;
    int _587 = _585 + _575;
    bool _589 = !_495;
    int _591 = _589 ? 0 : 1;
    float _593 = fma(_332, _441, _579);
    int _595 = abs(_372);
    int _597 = _587 * _571;
    int _599 = abs(_583);
    float _601 = -_521;
    float _603 = _601 + 1.0;
    int _605 = abs(_591);
    int _607 = _541 * _595;
    int _609 = _607 + _392;
    bool _611 = _425 > 0.5;
    int _613 = _569 * _599;
    int _615 = _613 + _597;
    float _617 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _619 = _521;
    float _621 = _561;
    float _623 = _573;
    if (_360)
    {
        float _625 = _611 ? _603 : _521;
        _619 = _625;
    }
    float _627 = _619;
    float _629 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _631 = !_499;
    int _633 = _631 ? 0 : 1;
    int _635 = _609 * _605;
    int _637 = _635 + _615;
    float _639 = _593 + _443;
    int _641 = abs(_633);
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _645 = _541 * _641;
    int _647 = _645 + _637;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _651 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].z, _643);
    float _653 = float(uint(_647));
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _663 = as_type<float>(_394) * _653;
    float _665 = 1.0 / _657;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _669 = -_649;
    float _671 = fma(_617, 2.0, _669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[79].z, _667);
    float _679 = -_132;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _671);
    float _683 = trunc(_663);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = 1.0 / _661;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _701 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _707 = _553 > 0.5;
    bool _709 = _707 && _354;
    float _711 = 1.0 / _675;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _715 = fma(_332, _453, _577);
    int _717 = ~_350;
    int _719 = _717 + 1;
    float _721 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].w, _705);
    float _723 = fma(_629, -2.0, _713);
    out.m_75.x = _695;
    out.m_75.y = _701;
    out.m_75.z = _703;
    out.m_75.w = _699;
    int _725 = _719 * int(_687);
    int _727 = _725 + _647;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = _715 + _455;
    float _743 = _735 * _697;
    bool _745 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _747 = isnan(_322);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = float(uint(_609));
    float _759 = float(uint(_727));
    float _761 = _739 * _711;
    float _763 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.934999942779541015625);
    float _765 = _731 * _665;
    float _767 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 4.870999813079833984375);
    float _769 = as_type<float>(_394) * _759;
    float _771 = precise::min(_763, 3.0);
    float _773 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _723);
    float _775 = precise::min(_767, 5.0);
    float _777 = trunc(_769);
    float _779 = precise::max(_777, 0.0);
    uint _781 = uint(_779);
    float _783 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _651);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _787 = _322 + _785;
    bool _789 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _791 = isnan(_322);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[79].x, _677);
    float _803 = fma(_775, -7.751926898956298828125, 38.75963592529296875);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _807 = _322 + _805;
    float _809 = in.m_73.x;
    float _811 = fma(_743, _787, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _813 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _721);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _817 = _322 + _815;
    float _819 = -_799;
    float _821 = _819 + 1.0;
    float _823 = fma(_765, _807, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _825 = ~_350;
    int _827 = _825 + 1;
    float _829 = fma(_761, _817, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _831 = _755 * _821;
    int _833 = int(_687) + int(_781);
    float _835 = as_type<float>(_394) * _757;
    bool _837 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = isnan(_322);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_755;
    float _851 = _849 + 1.0;
    float _853 = trunc(_835);
    float _855 = precise::max(_853, 0.0);
    uint _857 = uint(_855);
    bool _859 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _861 = isnan(_322);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -_847;
    float _873 = _871 + 1.0;
    float _875 = _847 * _851;
    int _877 = _827 * _833;
    int _879 = _877 + _647;
    float _881 = _801 * (-0.15915493667125701904296875);
    float _883 = _869 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _741 + _885;
    float _889 = -_869;
    float _891 = _889 + 1.0;
    bool _893 = uint(_879) >= uint(_350);
    float _895 = _811 * _883;
    float _897 = _809;
    float _899 = _803;
    if (_354)
    {
        _621 = _809;
    }
    float _901 = _621;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = _639 + _903;
    bool _907 = !_893;
    int _909 = _907 ? 0 : (-1);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[115].x, _895);
    int _913 = ~_350;
    int _915 = _913 + 1;
    float _917 = _901;
    if (_709)
    {
        float _919 = -_901;
        float _921 = _919 + 1.0;
        _917 = _921;
    }
    float _923 = _917;
    int _925 = ~_833;
    int _927 = _925 + _909;
    int _929 = _927 + 1;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _573 + _931;
    float _935 = _881 * 6.283185482025146484375;
    float _937 = sin(_935);
    int _939 = _915 * int(_857);
    int _941 = _939 + _609;
    if (_354)
    {
        _897 = _923;
    }
    float _943 = _897;
    float _945 = _933 * _933;
    int _947 = _350 * _929;
    int _949 = _947 + _647;
    float _951 = fma(_829, _875, _911);
    float _953 = float(uint(_941));
    float _955 = fma(_887, _887, _945);
    float _957 = _881 * 6.283185482025146484375;
    float _959 = cos(_957);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _963 = _525 + _961;
    float _965 = fma(_905, _905, _955);
    bool _967 = !_537;
    int _969 = _967 ? _949 : (-1);
    float _971 = as_type<float>(_394) * _953;
    float _973 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _975 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _977 = sqrt(_965);
    int _979 = _969 >> 31;
    float _981 = fma(_963, _963, _945);
    float _983 = fma(_823, _831, _951);
    int _985 = _969 & 3;
    bool _987 = _985 != 0;
    int _989 = _979 & 3;
    float _991 = _937 * _973;
    float _993 = trunc(_971);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    int _999 = _969 + _989;
    float _1001 = _959 * _973;
    float _1003 = -_991;
    float _1005 = fma(_959, _975, _1003);
    float _1007 = fma(_905, _905, _981);
    int _1009 = _999 >> 2;
    float _1011 = fma(_937, _975, _1001);
    float _1013 = _963 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = rsqrt(_965);
    int _1017 = _1009 << 4;
    int _1019 = _1017 + 368;
    float _1021 = _334 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1023 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    float _1025 = -_773;
    float _1027 = fma(_813, _1011, _1025);
    uint _1029 = uint(int(uint(_1019) >> uint(2)));
    uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
    int _1033 = int(_1029) & 3;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[int(_1031)][_1033];
    int _1037 = int(_1029) + 1;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    int _1041 = _1037 & 3;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[int(_1039)][_1041];
    float _1045 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[118].x, _983);
    float _1047 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1023);
    float _1049 = rsqrt(_1007);
    float _1051 = _977 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1053 = fma(_783, _1005, _681);
    int _1055 = _969 & 3;
    bool _1057 = _1055 != 0;
    float _1059 = fma(_771, 15.384601593017578125, -45.153804779052734375);
    bool _1061 = _1047 >= 0.0;
    float _1063 = precise::min(_1021, _1051);
    int _1065 = _1019 + 8;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
    int _1071 = int(_1067) & 3;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[int(_1069)][_1071];
    int _1075 = int(_1067) + 1;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    int _1079 = _1075 & 3;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[int(_1077)][_1079];
    bool _1083 = uint(_1055) > 1u;
    float _1085 = _1015 * _1063;
    int _1087 = int(_857) + int(_997);
    out.m_77.w = _1063;
    int _1089 = ~_350;
    int _1091 = _1089 + 1;
    float _1093 = _963 * _1049;
    float _1095 = _933 * _1049;
    float _1097 = _933 * _1085;
    bool _1099 = !_1057;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = -_1093;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    int _1107 = _987 ? 0 : 1;
    float _1109 = -_1095;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _933);
    bool _1113 = uint(_1055) >= 2u;
    float _1115 = _1105 * _1105;
    int _1117 = ~_1107;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = _887 * _1085;
    int _1125 = _1121;
    float _1127 = _1123;
    float _1129 = _1097;
    if (!_1083)
    {
        int _1131 = ~_1107;
        int _1133 = _1131 + 1;
        _1125 = _1133;
    }
    int _1135 = _1125;
    int _1137 = _1091 * _1087;
    int _1139 = _1137 + _609;
    bool _1141 = _1055 != 3;
    float _1143 = -_1123;
    float _1145 = _887 + _1143;
    int _1147 = abs(_1135);
    float _1149 = -_1097;
    float _1151 = _933 + _1149;
    bool _1153 = uint(_1139) >= uint(_350);
    float _1155 = _1145 * _1145;
    int _1157 = ~_1147;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = fma(_1111, _1111, _1115);
    bool _1165 = _1055 != 3;
    float _1167 = fma(_1151, _1151, _1155);
    int _1169 = _1113 ? 0 : 1;
    float _1171 = _905 * _1049;
    int _1173 = abs(_1101);
    float _1175 = _1059 * _803;
    float _1177 = precise::clamp(_1175, 0.0, 1.0);
    int _1179 = ~_1169;
    int _1181 = _1179 + 1;
    int _1183 = _1181 + 1;
    int _1185 = _1183;
    if (_1061)
    {
        out.m_55.x = 0.0;
    }
    int _1187 = _1161 * as_type<int>(_1043);
    bool _1189 = !_1165;
    int _1191 = _1189 ? 0 : (-1);
    float _1193 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    if (_1141)
    {
        int _1195 = ~_1169;
        int _1197 = _1195 + 1;
        _1185 = _1197;
    }
    int _1199 = _1185;
    bool _1201 = !_1153;
    int _1203 = _1201 ? 0 : (-1);
    int _1205 = abs(_1191);
    out.m_79.x = _1193;
    int _1207 = ~_1173;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    float _1213 = _905 * _1085;
    int _1215 = abs(_1199);
    int _1217 = ~_1087;
    int _1219 = _1217 + _1203;
    int _1221 = _1219 + 1;
    float _1223 = -_1171;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    int _1227 = ~_1215;
    int _1229 = _1227 + 1;
    int _1231 = _1229 + 1;
    float _1233 = -_1213;
    float _1235 = _905 + _1233;
    int _1237 = _1211 * as_type<int>(_1035);
    int _1239 = _1237 + _1187;
    int _1241 = ~_1205;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = fma(_1225, _1225, _1163);
    float _1249 = fma(_1235, _1235, _1167);
    int _1251 = _1231 * as_type<int>(_1073);
    int _1253 = _1251 + _1239;
    int _1255 = _350 * _1221;
    int _1257 = _1255 + _609;
    float _1259 = sqrt(_1249);
    int _1261 = _1245 * as_type<int>(_1081);
    int _1263 = _1261 + _1253;
    bool _1265 = !_415;
    int _1267 = _1265 ? 0 : 1;
    float _1269 = _1027 + 0.5;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1273 = abs(_1267);
    float _1275 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1277 = sqrt(_1247);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1281 = _1053 + 0.5;
    int _1283 = ~_1273;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    float _1289 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1293 = !_537;
    int _1295 = _1293 ? _1257 : (-1);
    out.m_81.x = _1281;
    out.m_81.y = _1269;
    int _1297 = _1263 * _1287;
    float _1299 = _1015 * _1259;
    if (_1061)
    {
        _899 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1301 = _899;
    int _1303 = _1295 * _1273;
    int _1305 = _1303 + _1297;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1309 = _1049 * _1277;
    float _1311 = _334 * _1299;
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1315 = as_type<int>(_1301);
    if (_1061)
    {
        float _1317 = _1301 * 5.0;
        _1315 = as_type<int>(_1317);
    }
    int _1319 = _1315;
    float _1321 = float(_1305);
    float _1323 = _1311 * _1309;
    out.m_83.x = _1289;
    out.m_83.y = _1313;
    out.m_83.z = _1291;
    out.m_83.w = _1275;
    if (_1061)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4871 = as_type<float>(_1319);
        out.gl_Position.z = _4871;
    }
    out.m_85.x = _1321;
    out.m_87.x = _1323;
    if (_1061)
    {
        return out;
    }
    float _1325 = -_1093;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _1329 = -_1095;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _1333 = -_1171;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1327 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1343 = _1331 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1347 = _1335 + _1345;
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1349);
    float _1353 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1351);
    bool _1355 = _1353 >= 0.0;
    float _1357 = _1347;
    if (_1355)
    {
        _1357 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1359 = _1357;
    int _1361 = as_type<int>(_1359);
    if (_1355)
    {
        out.m_55.x = 0.0;
    }
    if (_1355)
    {
        float _1363 = _1359 * 5.0;
        _1361 = as_type<int>(_1363);
    }
    int _1365 = _1361;
    if (_1355)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4962 = as_type<float>(_1365);
        out.gl_Position.z = _4962;
    }
    if (_1355)
    {
        return out;
    }
    float _1367 = -_525;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = -_573;
    float _1373 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = -_639;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1369 * _1369;
    float _1381 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1383 = fma(_1373, _1373, _1379);
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1387 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1389 = fma(_1377, _1377, _1383);
    float _1391 = -_1385;
    float _1393 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1391);
    float _1395 = rsqrt(_1389);
    float _1397 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1401 = -_1397;
    float _1403 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1401);
    float _1405 = -_1399;
    float _1407 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1405);
    float _1409 = _1373 * _1395;
    float _1411 = _1377 * _1395;
    float _1413 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1415 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1417 = _1409 * _1409;
    float _1419 = _1369 * _1395;
    float _1421 = -_1415;
    float _1423 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1421);
    float _1425 = fma(_1411, _1411, _1417);
    float _1427 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1431 = rsqrt(_1425);
    float _1433 = -_1427;
    float _1435 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1433);
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1439 = -_1429;
    float _1441 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1439);
    float _1443 = -_1437;
    float _1445 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1443);
    float _1447 = -_1413;
    float _1449 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1447);
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1423);
    float _1453 = _1411 * _1431;
    float _1455 = _1409 * _1431;
    float _1457 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1459 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1449);
    float _1461 = -_1453;
    float _1463 = _1411 * _1461;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1469 = -_1457;
    float _1471 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1473 = -_1463;
    float _1475 = fma(_1409, _1455, _1473);
    float _1477 = _1419 * _1455;
    float _1479 = -_1465;
    float _1481 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1483 = -_1453;
    float _1485 = _1419 * _1483;
    float _1487 = _1475 * _1475;
    float _1489 = -_1467;
    float _1491 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1471);
    float _1495 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1497 = fma(_1477, _1477, _1487);
    float _1499 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1491);
    float _1501 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1503 = -_1495;
    float _1505 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1507 = fma(_1485, _1485, _1497);
    float _1509 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1511 = -_1499;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1501);
    float _1515 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1505);
    float _1517 = rsqrt(_1507);
    float _1519 = -_1509;
    float _1521 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1519);
    float _1523 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1525 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1521);
    float _1527 = -_1523;
    float _1529 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = 1.0 / _1513;
    float _1543 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1529);
    float _1545 = _1475 * _1517;
    float _1547 = precise::clamp(_1545, 0.0, 1.0);
    float _1549 = -_1547;
    float _1551 = _1549 + 1.0;
    float _1553 = fma(_1515, _1541, -1.0);
    float _1555 = _1551 * _1541;
    float _1557 = fma(_1551, _1553, 1.0);
    float _1559 = _1525 * _1555;
    float _1561 = _1543 * _1555;
    float _1563 = _1557 * _1557;
    float _1565 = fma(_1559, _1559, _1563);
    float _1567 = fma(_1561, _1561, _1565);
    float _1569 = rsqrt(_1567);
    float _1571 = _1561 * _1569;
    float _1573 = _1559 * _1569;
    float _1575 = _1557 * _1569;
    float _1577 = _1299 * _1309;
    float _1579 = -_1571;
    float _1581 = _1409 * _1579;
    float _1583 = _1411 * _1575;
    float _1585 = _1381 * _1577;
    float _1587 = -_1573;
    float _1589 = -_1581;
    float _1591 = fma(_1411, _1587, _1589);
    float _1593 = -_1573;
    float _1595 = _1419 * _1593;
    float _1597 = -_1571;
    float _1599 = -_1583;
    float _1601 = fma(_1419, _1597, _1599);
    float _1603 = _1387 * _1577;
    float _1605 = _1591 * _1591;
    float _1607 = -_1595;
    float _1609 = fma(_1409, _1575, _1607);
    float _1611 = -_1097;
    float _1613 = _573 + _1611;
    float _1615 = -_1213;
    float _1617 = _639 + _1615;
    float _1619 = fma(_1601, _1601, _1605);
    float _1621 = fma(_1609, _1609, _1619);
    float _1623 = rsqrt(_1621);
    float _1625 = _1601 * _1623;
    float _1627 = _1609 * _1623;
    float _1629 = _1591 * _1623;
    float _1631 = _1411 * _1625;
    float _1633 = _1419 * _1627;
    float _1635 = -_1631;
    float _1637 = fma(_1409, _1627, _1635);
    float _1639 = _1409 * _1629;
    float _1641 = -_1633;
    float _1643 = fma(_1411, _1629, _1641);
    float _1645 = _1637 * _1637;
    float _1647 = -_1639;
    float _1649 = fma(_1419, _1625, _1647);
    float _1651 = in.m_89.x;
    float _1653 = in.m_89.y;
    float _1655 = in.m_89.z;
    float _1657 = fma(_1643, _1643, _1645);
    float _1659 = fma(_1649, _1649, _1657);
    float _1661 = rsqrt(_1659);
    float _1663 = -_1651;
    float _1665 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1663);
    float _1667 = _1649 * _1661;
    float _1669 = _1637 * _1661;
    float _1671 = _1643 * _1661;
    float _1673 = fma(_1193, _1665, _1651);
    float _1675 = _1409 * _1667;
    float _1677 = _1411 * _1669;
    float _1679 = -_1655;
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1679);
    float _1683 = -_1675;
    float _1685 = fma(_1411, _1671, _1683);
    float _1687 = -_1677;
    float _1689 = fma(_1419, _1667, _1687);
    float _1691 = _1419 * _1671;
    float _1693 = _1685 * _1685;
    float _1695 = -_1691;
    float _1697 = fma(_1409, _1669, _1695);
    float _1699 = -_1653;
    float _1701 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1699);
    float _1703 = fma(_1689, _1689, _1693);
    float _1705 = fma(_1193, _1701, _1653);
    float _1707 = fma(_1697, _1697, _1703);
    float _1709 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1673);
    float _1711 = fma(_1193, _1681, _1655);
    float _1713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1705);
    float _1715 = _1323 * _1709;
    float _1717 = rsqrt(_1707);
    float _1719 = _1585 * _1713;
    float _1721 = _1711 * _1603;
    float _1723 = _1719 * _1667;
    float _1725 = _1719 * _1671;
    float _1727 = _1697 * _1717;
    float _1729 = _1689 * _1717;
    float _1731 = _1685 * _1717;
    float _1733 = _1719 * _1669;
    float _1735 = fma(_1715, _1727, _1723);
    float _1737 = fma(_1715, _1729, _1725);
    float _1739 = fma(_1715, _1731, _1733);
    float _1741 = fma(_1721, _1411, _1735);
    float _1743 = -_1123;
    float _1745 = _1743 + _525;
    float _1747 = fma(_1721, _1409, _1737);
    float _1749 = fma(_1721, _1419, _1739);
    float _1751 = _639 + _1741;
    float _1753 = -_1093;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1745);
    float _1757 = _573 + _1747;
    float _1759 = -_1095;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1613);
    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1765 = _1751 + _1763;
    float _1767 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1771 = _1757 + _1769;
    float _1773 = -_1171;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1777 = _1765 * _1765;
    float _1779 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1767);
    float _1781 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = fma(_1771, _1771, _1777);
    float _1785 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1779);
    float _1787 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1789 = _525 + _1749;
    float _1791 = sqrt(_1783);
    float _1793 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1795 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1787);
    float _1797 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = 1.0 / _1793;
    float _1811 = _1797 + _1793;
    bool _1813 = _1791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1815 = _1811 * _1809;
    float _1817 = _1815 * 0.5;
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1821 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1819);
    float _1823 = _1739;
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1827 = _1817;
    float _1829 = _1793;
    float _1831 = _1775;
    if (!_1813)
    {
        _1823 = _1757;
    }
    float _1833 = _1823;
    float _1835 = _1833;
    if (!_1813)
    {
        _1825 = _1751;
    }
    float _1837 = _1825;
    float _1839 = _1837;
    if (!_1813)
    {
        _1827 = _1789;
    }
    float _1841 = _1827;
    bool _1843 = !_1813;
    float _1845 = _1841;
    if (!_1843)
    {
        float _1847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1851 = _1791 + _1849;
        float _1853 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1855 = rsqrt(_1783);
        float _1857 = _1851 * _1847;
        float _1859 = _1857 * 0.15915493667125701904296875;
        float _1861 = _1859 * 6.283185482025146484375;
        float _1863 = cos(_1861);
        float _1865 = _1859 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = _1863 + (-1.0);
        float _1871 = fma(_1867, _1853, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1873 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1875 = _1855 * _1871;
        float _1877 = fma(_1789, _1863, _1873);
        float _1879 = fma(_1771, _1875, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1881 = fma(_1765, _1875, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1835 = _1879;
        _1845 = _1877;
        _1839 = _1881;
    }
    float _1883 = _1835;
    float _1885 = _1845;
    float _1887 = _1839;
    float _1889 = 1.0 / _1821;
    float _1891 = -_1097;
    float _1893 = _1891 + _1883;
    float _1895 = -_1123;
    float _1897 = _1895 + _1885;
    float _1899 = -_1213;
    float _1901 = _1899 + _1887;
    if (_1539)
    {
        _1829 = 1.0;
    }
    float _1903 = _1829;
    float _1905 = -_1095;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _1909 = -_1093;
    float _1911 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1897);
    float _1913 = -_1171;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1901);
    float _1917 = _1911;
    float _1919 = _1907;
    float _1921 = _1915;
    float _1923 = _1903;
    if (!_1807)
    {
        float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1927 = _1755 + _1925;
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1931 = _1761 + _1929;
        float _1933 = 1.0 / _1309;
        float _1935 = -_573;
        float _1937 = _1935 + _1883;
        float _1939 = _1927 * _1927;
        float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1943 = _1775 + _1941;
        float _1945 = -_525;
        float _1947 = _1945 + _1885;
        float _1949 = -_639;
        float _1951 = _1949 + _1887;
        float _1953 = fma(_1931, _1931, _1939);
        float _1955 = fma(_1943, _1943, _1953);
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1959 = sqrt(_1955);
        float _1961 = precise::min(_1959, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1963 = _1961 * _1957;
        float _1965 = _1963 * _1933;
        float _1967 = fma(_1937, _1965, _1761);
        float _1969 = fma(_1947, _1965, _1755);
        float _1971 = fma(_1951, _1965, _1775);
        _1917 = _1969;
        _1919 = _1967;
        _1921 = _1971;
        _623 = _1937;
    }
    float _1973 = _1917;
    float _1975 = _1919;
    float _1977 = _1921;
    float _1979 = _623;
    float _1981 = _1979;
    if (_1539)
    {
        _549 = 1.0;
    }
    float _1983 = _549;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1987 = _1889 * _1985;
    float _1989 = _1983;
    if (!_1539)
    {
        float _1991 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = _1993 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2001 = _1999 * 0.15915493667125701904296875;
        float _2003 = _1993 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        float _2007 = 1.0 / _1997;
        float _2009 = _2001 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = _2001 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = 1.0 / _2019;
        float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2025 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2023;
        float _2027 = 1.0 / _2025;
        float _2029 = _2017 * _2021;
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = fma(_1987, _2029, _2031);
        float _2035 = _2033 * _2027;
        float _2037 = precise::clamp(_2035, 0.0, 1.0);
        _1127 = _1993;
        _1923 = _2037;
    }
    float _2039 = _1127;
    float _2041 = _1923;
    if (!_1539)
    {
        float _2043 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2045 = _2043 * 0.15915493667125701904296875;
        float _2047 = _2045 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2053 = _2051 * 0.15915493667125701904296875;
        float _2055 = _2045 * 6.283185482025146484375;
        float _2057 = sin(_2055);
        float _2059 = 1.0 / _2049;
        float _2061 = _2053 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = _2057 * _2059;
        float _2067 = _2053 * 6.283185482025146484375;
        float _2069 = sin(_2067);
        float _2071 = _2063 * _2065;
        float _2073 = 1.0 / _2071;
        float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2077 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2075;
        float _2079 = 1.0 / _2077;
        float _2081 = _2069 * _2073;
        float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2085 = fma(_1987, _2081, _2083);
        float _2087 = _2085 * _2079;
        float _2089 = precise::clamp(_2087, 0.0, 1.0);
        float _2091 = -_2089;
        float _2093 = _2091 + 1.0;
        _1989 = _2093;
    }
    float _2095 = _1989;
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2099 = _1973 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _1975 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2107 = _1977 + _2105;
    float _2109 = _2099 * _2099;
    float _2111 = fma(_2103, _2103, _2109);
    float _2113 = fma(_2107, _2107, _2111);
    float _2115 = rsqrt(_2113);
    float _2117 = sqrt(_2113);
    float _2119 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2121 = _2103 * _2119;
    float _2123 = _2107 * _2119;
    float _2125 = _2121 * _2121;
    float _2127 = _2123 * _2123;
    float _2129 = _2125 + _2127;
    float _2131 = sqrt(_2129);
    bool _2133 = _2131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2137 = _2131 + _2135;
    float _2139 = _2115;
    float _2141 = _2137;
    float _2143 = _2099;
    if (_2133)
    {
        float _2145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = _2147;
    if (_2133)
    {
        float _2151 = _2137 * _2147;
        _2141 = _2151;
    }
    float _2153 = _2141;
    if (_2133)
    {
        float _2155 = rsqrt(_2129);
        _2149 = _2155;
    }
    float _2157 = _2149;
    float _2159 = _2157;
    if (_2133)
    {
        float _2161 = _2153 * 0.15915493667125701904296875;
        _1129 = _2161;
    }
    float _2163 = _1129;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = _2107;
    float _2169 = _2163;
    if (_2133)
    {
        float _2171 = _2163 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        _2167 = _2173;
    }
    float _2175 = _2167;
    float _2177 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2179 = precise::max(0.0, _2165);
    float _2181 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2177);
    float _2183 = _2039;
    float _2185 = _2179;
    if (_2133)
    {
        float _2187 = _2163 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        _2183 = _2189;
    }
    float _2191 = _2183;
    float _2193 = -_2119;
    float _2195 = -_2179;
    float _2197 = fma(_2099, _2193, _2195);
    float _2199 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2181);
    if (_2133)
    {
        float _2201 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2143 = _2201;
    }
    float _2203 = _2143;
    float _2205 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2207 = _2175;
    float _2209 = _2203;
    if (_2133)
    {
        float _2211 = fma(_2175, _2203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1981 = _2211;
    }
    float _2213 = _1981;
    float _2215 = _2213;
    if (!_2133)
    {
        _2207 = _2197;
    }
    float _2217 = _2207;
    float _2219 = _2217;
    if (!_2133)
    {
        _2169 = _2123;
    }
    float _2221 = _2169;
    float _2223 = _2221;
    if (_2133)
    {
        float _2225 = _2157 * _2213;
        _2209 = _2225;
    }
    float _2227 = _2209;
    if (!_2133)
    {
        _2159 = _2121;
    }
    float _2229 = _2159;
    float _2231 = _2229;
    float _2233 = _2191;
    if (_2133)
    {
        float _2235 = _2191 + (-1.0);
        _2185 = _2235;
    }
    float _2237 = _2185;
    float _2239 = _2237;
    if (_2133)
    {
        float _2241 = _2121 * _2227;
        _2231 = _2241;
    }
    float _2243 = _2231;
    if (_2133)
    {
        float _2245 = _2123 * _2227;
        _2223 = _2245;
    }
    float _2247 = _2223;
    if (!_2133)
    {
        _2215 = _2127;
    }
    float _2249 = _2215;
    float _2251 = _2249;
    if (_2133)
    {
        float _2253 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    float _2257 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2133)
    {
        float _2259 = _2247 * _2247;
        _2251 = _2259;
    }
    float _2261 = _2251;
    if (_2133)
    {
        float _2263 = fma(_2197, _2191, _2255);
        _2219 = _2263;
    }
    float _2265 = _2219;
    if (!_2133)
    {
        _2233 = _2125;
    }
    float _2267 = _2233;
    float _2269 = _2267;
    if (_2133)
    {
        float _2271 = _2243 * _2243;
        _2269 = _2271;
    }
    float _2273 = _2269;
    float _2275 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2257);
    float _2277 = fma(_2265, _2265, _2273);
    float _2279 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2275);
    float _2281 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2283 = _2277 + _2261;
    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2287 = fma(_2117, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2285);
    float _2289 = precise::clamp(_2287, 0.0, 1.0);
    float _2291 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2293 = rsqrt(_2283);
    float _2295 = -_2289;
    float _2297 = _2295 + 1.0;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2301 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2303 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2305 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2307 = abs(_2297);
    float _2309 = log2(_2307);
    float _2311 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2313 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2303);
    float _2315 = -_2299;
    float _2317 = fma(_2315, _2305, 1.0);
    float _2319 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2311);
    float _2321 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2313);
    float _2323 = _2293 * _2243;
    float _2325 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2319);
    float _2327 = floor(_2281);
    float _2329 = _2293 * _2265;
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2333 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2335 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2337 = _2293 * _2247;
    float _2339 = -_2331;
    float _2341 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2339);
    float _2343 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2345 = floor(_2301);
    float _2347 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2349 = -_2337;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2341);
    float _2353 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2343);
    float _2355 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2357 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2353);
    float _2359 = exp2(_2347);
    float _2361 = -_2327;
    float _2363 = _2281 + _2361;
    float _2365 = fma(_1883, 6.2500002968590706586837768554688e-05, 0.5);
    float _2367 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2357);
    float _2369 = fma(_1887, 6.2500002968590706586837768554688e-05, 0.5);
    float _2371 = _2329 + 1.0;
    float _2373 = log2(_2317);
    float _2375 = -_2345;
    float _2377 = _2301 + _2375;
    float _2379 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2381 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2355);
    float _2383 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2379);
    float _2385 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2381);
    float _2387 = 1.0 / _2367;
    float _2389 = fma(_2351, -0.5, 0.5);
    float _2391 = fma(_2351, 0.5, 0.5);
    float _2393 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2383);
    float _2395 = -_2329;
    float _2397 = fma(_2359, _2371, _2395);
    float _2399 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2401 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2393);
    float _2403 = sqrt(_2389);
    float _2405 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2385);
    float _2407 = fma(_2391, _2399, -0.212114393711090087890625);
    float _2409 = _2373 * 0.693147182464599609375;
    float _2411 = fma(_2391, _2407, 1.570728778839111328125);
    float _2413 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2415 = _2401 * _2387;
    float _2417 = _2405 * _2387;
    float _2419 = fma(_2397, 0.5, 0.5);
    float _2421 = fma(_2415, 0.5, 0.5);
    float _2423 = fma(_2417, -0.5, 0.5);
    float _2425 = _2403 * 0.636619746685028076171875;
    float2 _6663 = float2(_2363, _2377);
    float _2427 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6663, float2(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6663, float2(0.0), isnan(_6663)), level(0.0)).x;
    float3 _6674 = float3(_2421, _2423, _2413);
    float _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6674, float3(0.0), isnan(_6674)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6674, float3(0.0), isnan(_6674)), level(0.0)).x;
    float _2431 = -_2411;
    float _2433 = fma(_2425, _2431, 1.0);
    float3 _6690 = float3(_2421, _2423, _2413);
    float4 _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6690, float3(0.0), isnan(_6690)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6690, float3(0.0), isnan(_6690)), level(0.0)).xyzw;
    float _2438 = _2436.x;
    float _2440 = _2436.y;
    float _2442 = _2436.z;
    float _2444 = _2436.w;
    float2 _6706 = float2(_2433, _2419);
    float3 _2448 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).xyz;
    float _2450 = _2448.x;
    float _2452 = _2448.y;
    float _2454 = _2448.z;
    float2 _6720 = float2(_2365, _2369);
    float3 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6720, float2(0.0), isnan(_6720)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6720, float2(0.0), isnan(_6720)), level(0.0)).xyz;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = abs(_1987);
    float _2466 = log2(_2464);
    bool _2468 = _1705 != 0.0;
    bool _2470 = isnan(_1705);
    bool _2472 = _2468 || _2470;
    bool _2474 = isnan(0.0);
    bool _2476 = _2472 || _2474;
    out.m_91.x = _1761;
    out.m_91.y = _1755;
    out.m_91.z = _1775;
    bool _2478 = _1673 == 0.0;
    bool _2480 = !_2476;
    bool _2482 = _2478 && _2480;
    out.m_93.x = _1975;
    out.m_93.y = _1973;
    out.m_93.z = _1977;
    bool _2484 = _1711 == 0.0;
    bool _2486 = _2484 && _2482;
    bool _2488 = _1987 <= 8000.0;
    bool _2490 = isnan(_1987);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(8000.0);
    bool _2496 = _2492 || _2494;
    float _2498 = float(_2496);
    float _2500 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2502 = in.m_95.x;
    float _2504 = in.m_95.y;
    float _2506 = in.m_95.z;
    float _2508 = exp2(_2500);
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2504;
    float _2516 = _2502;
    float _2518 = _2506;
    float _2520 = _2405;
    float _2522 = _2401;
    if (!_2486)
    {
        float _2524 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2504);
        _2514 = _2524;
    }
    float _2526 = _2514;
    if (!_2486)
    {
        float _2528 = fma(_1673, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2502);
        _2516 = _2528;
    }
    float _2530 = _2516;
    float _2532 = fma(_2512, -2.0, 3.0);
    float _2534 = _2512 * _2512;
    float _2536 = _1671 * _2526;
    float _2538 = _1669 * _2526;
    float _2540 = _1667 * _2526;
    float _2542 = _2534 * _2532;
    float _2544 = fma(_1729, _2530, _2536);
    float _2546 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2486)
    {
        float _2548 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2506);
        _2518 = _2548;
    }
    float _2550 = _2518;
    float _2552 = -_2542;
    float _2554 = _2552 + 1.0;
    float _2556 = _2367 * 0.5;
    float _2558 = exp2(_2546);
    float _2560 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2542);
    float _2562 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2564 = fma(_2405, -0.5, _2556);
    float _2566 = _2498 * _2560;
    float _2568 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2562);
    float _2570 = fma(_1731, _2530, _2538);
    float _2572 = _2401 + _2367;
    bool _2574 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2576 = isnan(_2117);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2582 = _2578 || _2580;
    float _2584 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2568);
    float _2586 = fma(_1727, _2530, _2540);
    float _2588 = fma(_1409, _2550, _2544);
    float _2590 = fma(_1419, _2550, _2570);
    float _2592 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2584);
    float _2594 = fma(_1411, _2550, _2586);
    float _2596 = -_2558;
    float _2598 = _2596 + 1.0;
    float _2600 = in.m_63.x;
    float _2602 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2604 = _2592 + _2367;
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2608 = _2572 * 0.5;
    out.m_97.x = _2588;
    out.m_97.y = _2590;
    out.m_97.z = _2594;
    float _2610 = _2604 * 0.5;
    if (!_2582)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2612 = _1831;
    out.gl_Position.x = _2401;
    out.gl_Position.y = _2405;
    out.gl_Position.z = _2592;
    out.gl_Position.w = _2367;
    out.m_99.x = _2608;
    out.m_99.y = _2564;
    out.m_99.z = _2610;
    out.m_99.w = _2367;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2582)
    {
        _2520 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2618 = _2520;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2582)
    {
        _2522 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2624 = _2522;
    float _2626 = -_2427;
    float _2628 = _2626 + 1.0;
    float _2630 = _2606 * _2429;
    float _2632 = -_2606;
    float _2634 = _2632 + 1.0;
    float _2636 = _2628 * _2602;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2444 * _2630;
    float _2642 = _2444 * _2634;
    float _2644 = -_2638;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2648 = _2454 * _2630;
    float _2650 = fma(_2450, _2640, _2438);
    float _2652 = fma(_2452, _2640, _2440);
    out.m_101.x = _2458;
    out.m_101.y = _2460;
    out.m_101.z = _2462;
    float _2654 = fma(_2444, _2648, _2442);
    float _2656 = _2646 * _2600;
    float _2658 = _2041 * _2095;
    out.m_103.x = _2650;
    out.m_103.y = _2652;
    out.m_103.z = _2654;
    out.m_103.w = _2642;
    float _2660 = _2656 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2662 = _2658 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2664 = _2656;
    float _2666 = _2658;
    float _2668 = _2660;
    float _2670 = _2624;
    float _2672 = _2624;
    if (!_2582)
    {
        _2664 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2664;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2582)
    {
        _2666 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2680 = _2666;
    out.m_105.x = _2660;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2582)
    {
        _2668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2686 = _2668;
    bool _2688 = !_2582;
    float _2690 = _2686;
    float _2692 = _2686;
    if (!_2688)
    {
        bool _2694 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2696 = isnan(_2117);
        bool _2698 = _2694 || _2696;
        bool _2700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2702 = _2698 || _2700;
        if (!_2702)
        {
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2706 = _2117 + _2704;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2710 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2708;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2716 = 1.0 / _2710;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2734 = _2706 * _2716;
            float _2736 = precise::clamp(_2734, 0.0, 1.0);
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2742 = fma(_2736, _2714, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2744 = fma(_2736, _2740, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2746 = fma(_2736, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2748 = fma(_2736, _2724, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2750 = fma(_2736, _2728, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2752 = fma(_2736, _2732, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2672 = _2746;
            _2692 = _2750;
            _2622 = _2742;
            _2616 = _2748;
            _2678 = _2744;
            _2684 = _2752;
            _2754 = true;
        }
        else
        {
            bool _2756 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2758 = isnan(_2117);
            bool _2760 = _2756 || _2758;
            bool _2762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2764 = _2760 || _2762;
            if (!_2764)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2766 = _2620;
            _2622 = _2766;
            if (!_2764)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2768 = _2670;
            _2672 = _2768;
            if (!_2764)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2770 = _2676;
            _2678 = _2770;
            if (!_2764)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2772 = _2614;
            _2616 = _2772;
            if (!_2764)
            {
                _2690 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2774 = _2690;
            _2692 = _2774;
            if (!_2764)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2776 = _2682;
            bool _2778 = !_2764;
            _2684 = _2776;
            if (!_2778)
            {
                bool _2780 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2782 = isnan(_2117);
                bool _2784 = _2780 || _2782;
                bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2788 = _2784 || _2786;
                if (!_2788)
                {
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2792 = _2117 + _2790;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2796 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2794;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2802 = 1.0 / _2796;
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2820 = _2792 * _2802;
                    float _2822 = precise::clamp(_2820, 0.0, 1.0);
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2828 = fma(_2822, _2800, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2830 = fma(_2822, _2826, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2832 = fma(_2822, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2834 = fma(_2822, _2810, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2836 = fma(_2822, _2814, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2838 = fma(_2822, _2818, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2672 = _2832;
                    _2692 = _2836;
                    _2622 = _2828;
                    _2616 = _2834;
                    _2678 = _2830;
                    _2684 = _2838;
                    _2754 = true;
                }
                else
                {
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2692 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2754 = false;
    float _2840 = _2672;
    float _2842 = _2692;
    float _2844 = _2622;
    float _2846 = _2616;
    float _2848 = _2678;
    float _2850 = _2684;
    float _2852 = _2662 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2854 = fma(_2590, -0.5, 0.5);
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = -_2840;
    float _2860 = _2858 + _2842;
    float _2862 = -_2844;
    float _2864 = _2862 + _2846;
    out.m_107.x = 0.0;
    float _2866 = fma(_2856, _2860, _2840);
    float _2868 = -_2848;
    float _2870 = _2868 + _2850;
    float _2872 = fma(_2856, _2864, _2844);
    float _2874 = _2866 * 0.586610972881317138671875;
    bool _2876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2878 = fma(_2856, _2870, _2848);
    out.m_55.x = _2852;
    float _2880 = fma(_2872, 0.298911988735198974609375, _2874);
    bool _2882 = _2041 > 0.0;
    bool _2884 = isnan(_2041);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan(0.0);
    bool _2890 = _2886 || _2888;
    float _2892 = fma(_2878, 0.114477999508380889892578125, _2880);
    bool _2894 = _2095 <= 0.0;
    bool _2896 = !_2890;
    bool _2898 = _2894 || _2896;
    float _2900 = -_2892;
    float _2902 = _2872 + _2900;
    float _2904 = -_2892;
    float _2906 = _2866 + _2904;
    float _2908 = -_2892;
    float _2910 = _2878 + _2908;
    float _2912 = fma(_2902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    float _2914 = fma(_2906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    float _2916 = fma(_2910, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    bool _2918 = !_2876;
    if (!_2918)
    {
        float _2920 = -_1973;
        float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2924 = -_1975;
        float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2928 = -_1977;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2932 = _2922 * _2922;
        float _2934 = fma(_2926, _2926, _2932);
        float _2936 = fma(_2930, _2930, _2934);
        float _2938 = sqrt(_2936);
        float _2940 = rsqrt(_2936);
        float _2942 = -_2938;
        float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2948 = precise::clamp(_2946, 0.0, 1.0);
        float _2950 = _2926 * _2940;
        float _2952 = _2922 * _2940;
        float _2954 = abs(_2948);
        float _2956 = log2(_2954);
        float _2958 = _2930 * _2940;
        float _2960 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2962 = _2590 * _2952;
        float _2964 = -_2952;
        float _2966 = -_2960;
        float _2968 = fma(_2964, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2966);
        float _2970 = fma(_2588, _2950, _2962);
        float _2972 = -_2958;
        float _2974 = fma(_2972, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2968);
        float _2976 = fma(_2594, _2958, _2970);
        float _2978 = precise::clamp(_2976, 0.0, 1.0);
        float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2982 = _2974 + _2980;
        float _2984 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2988 = precise::clamp(_2986, 0.0, 1.0);
        float _2990 = exp2(_2984);
        float _2992 = _2990 * _2988;
        float _2994 = _2978 * _2992;
        float _2996 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2998 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3000 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2996;
        out.m_107.y = _2998;
        out.m_107.z = _3000;
    }
    out.m_77.x = _2912;
    out.m_77.y = _2914;
    out.m_77.z = _2916;
    if (!_2898)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3002 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3002;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2754 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = in.m_50.w;
    float _125 = trunc(_121);
    int _128 = int(_125);
    float _130 = -_123;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _132;
    bool _136 = _128 >= 1;
    float _138 = 0.0;
    float _140 = _123;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _138;
    if (!_136)
    {
        out.m_55.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3069 = as_type<float>(_148);
        out.gl_Position.z = _3069;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _152 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_123);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_128);
    bool _164 = _132 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    if (_168)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _140;
    if (_168)
    {
        out.m_55.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _150 = as_type<int>(_172);
    }
    int _174 = _150;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_174);
        out.gl_Position.z = _3124;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = 1.0 / _162;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _132 * _176;
    bool _182 = !_178;
    float _184 = _180;
    float _202;
    if (!_182)
    {
        float _186 = in.m_57.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _180;
    }
    _204 = false;
    float _206 = _202;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    float _212 = in.m_59.x;
    float _214 = in.m_59.y;
    float _216 = in.m_59.z;
    bool _218 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_206);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    bool _234 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_206);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_228;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = 1.0 / _232;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = _244 * _248;
    float _260 = -_244;
    float _262 = _260 + 1.0;
    float _264 = _210 * _254;
    float _266 = fma(_252, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = _266 * _258;
    float _278 = fma(_270, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = fma(_274, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].x, _276);
    float _284 = _278 * _258;
    float _286 = _280 * _258;
    float _288 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].x, _282);
    float _290 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].y, _284);
    float _292 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[143].z, _286);
    float _294 = _288 * _212;
    float _296 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    float _300 = _296 * _214;
    float _302 = _298 * _216;
    bool _304 = !_256;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _184 = _320;
    }
    float _322 = _184;
    float _324 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _326 = int(_324);
    float _328 = in.m_48.x;
    float _330 = in.m_48.y;
    float _332 = in.m_48.z;
    float _334 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _338 = _336 != 0;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    float _346 = in.m_61.w;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _350 = int(_348);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _354 = _352 != 0;
    float _356 = in.m_63.y;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _360 = _358 != 0;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _364 = _362 != 0;
    float _366 = in.m_65.w;
    float _368 = float(_326);
    bool _370 = !_364;
    int _372 = _370 ? 0 : 1;
    float _374 = 1.0 / _368;
    float _376 = float(uint(_350));
    int _378 = ~_350;
    int _380 = _378 + 1;
    int _382 = ~_350;
    int _384 = _382 + 1;
    float _386 = 1.0 / _376;
    float _388 = _132 * _374;
    out.m_67.w = _366;
    float _390 = trunc(_388);
    int _392 = int(_390);
    int _394 = as_type<int>(_386) + (-2);
    float _396 = float(uint(_392));
    float _398 = float(_392);
    float _400 = as_type<float>(_394) * _396;
    float _402 = trunc(_400);
    float _404 = precise::max(_402, 0.0);
    uint _407 = uint(_404);
    bool _409 = !_338;
    float _411 = _409 ? 7.345489978790283203125 : 1.0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _415 = _413 != 0;
    int _417 = _380 * int(_407);
    int _419 = _417 + _392;
    float _421 = float(uint(_419));
    float _423 = in.m_57.x;
    float _425 = in.m_57.y;
    float _427 = in.m_57.z;
    float _429 = as_type<float>(_394) * _421;
    float _431 = trunc(_429);
    float _433 = precise::max(_431, 0.0);
    uint _435 = uint(_433);
    float _437 = in.m_69.x;
    float _439 = in.m_69.y;
    float _441 = in.m_69.z;
    float _443 = in.m_69.w;
    int _445 = int(_407) + int(_435);
    float _447 = _411 * _423;
    float _449 = in.m_71.x;
    float _451 = in.m_71.y;
    float _453 = in.m_71.z;
    float _455 = in.m_71.w;
    int _457 = _384 * _445;
    int _459 = _457 + _392;
    float _461 = floor(_447);
    bool _463 = uint(_459) >= uint(_350);
    float _465 = float(_350);
    bool _467 = !_463;
    int _469 = _467 ? 0 : (-1);
    bool _471 = _398 >= _465;
    bool _473 = isnan(_398);
    bool _475 = _471 || _473;
    bool _477 = isnan(_465);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _330 * _439;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _499 = _497 != 0;
    float _501 = trunc(_481);
    int _503 = int(_501);
    float _505 = -_461;
    float _507 = _447 + _505;
    int _509 = ~_445;
    int _511 = _509 + _469;
    int _513 = _511 + 1;
    float _515 = _330 * _342;
    float _517 = _330 * _451;
    float _519 = _507 * _465;
    float _521 = in.m_73.y;
    float _523 = _132 * _465;
    float _525 = _330 + _356;
    bool _527 = !_491;
    int _529 = _527 ? 0 : 1;
    int _531 = _350 * _513;
    int _533 = _531 + _392;
    float _535 = _523 * _176;
    bool _537 = _350 == 0;
    float _539 = trunc(_519);
    int _541 = int(_539);
    float _543 = fma(_328, _340, _515);
    int _545 = _350 + (-1);
    float _547 = as_type<float>(_513);
    float _549 = _525;
    if (_354)
    {
        float _551 = in.m_57.x;
        _547 = _551;
    }
    float _553 = _547;
    int _555 = ~_503;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_332, _344, _543);
    bool _563 = !_537;
    int _565 = _563 ? _533 : (-1);
    float _567 = trunc(_535);
    int _569 = int(_567);
    int _571 = abs(_529);
    float _573 = _561 + _346;
    int _575 = _565 * _559;
    float _577 = fma(_328, _449, _517);
    float _579 = fma(_328, _437, _483);
    bool _581 = !_487;
    int _583 = _581 ? 0 : 1;
    int _585 = _503 * _545;
    int _587 = _585 + _575;
    bool _589 = !_495;
    int _591 = _589 ? 0 : 1;
    float _593 = fma(_332, _441, _579);
    int _595 = abs(_372);
    int _597 = _587 * _571;
    int _599 = abs(_583);
    float _601 = -_521;
    float _603 = _601 + 1.0;
    int _605 = abs(_591);
    int _607 = _541 * _595;
    int _609 = _607 + _392;
    bool _611 = _425 > 0.5;
    int _613 = _569 * _599;
    int _615 = _613 + _597;
    float _617 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _619 = _521;
    float _621 = _561;
    float _623 = _573;
    if (_360)
    {
        float _625 = _611 ? _603 : _521;
        _619 = _625;
    }
    float _627 = _619;
    float _629 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _631 = !_499;
    int _633 = _631 ? 0 : 1;
    int _635 = _609 * _605;
    int _637 = _635 + _615;
    float _639 = _593 + _443;
    int _641 = abs(_633);
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _645 = _541 * _641;
    int _647 = _645 + _637;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _651 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].z, _643);
    float _653 = float(uint(_647));
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _663 = as_type<float>(_394) * _653;
    float _665 = 1.0 / _657;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _669 = -_649;
    float _671 = fma(_617, 2.0, _669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[79].z, _667);
    float _679 = -_132;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _671);
    float _683 = trunc(_663);
    float _685 = precise::max(_683, 0.0);
    uint _687 = uint(_685);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = 1.0 / _661;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _701 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _707 = _553 > 0.5;
    bool _709 = _707 && _354;
    float _711 = 1.0 / _675;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _715 = fma(_332, _453, _577);
    int _717 = ~_350;
    int _719 = _717 + 1;
    float _721 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].w, _705);
    float _723 = fma(_629, -2.0, _713);
    out.m_75.x = _695;
    out.m_75.y = _701;
    out.m_75.z = _703;
    out.m_75.w = _699;
    int _725 = _719 * int(_687);
    int _727 = _725 + _647;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = _715 + _455;
    float _743 = _735 * _697;
    bool _745 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _747 = isnan(_322);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = float(uint(_609));
    float _759 = float(uint(_727));
    float _761 = _739 * _711;
    float _763 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.934999942779541015625);
    float _765 = _731 * _665;
    float _767 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 4.870999813079833984375);
    float _769 = as_type<float>(_394) * _759;
    float _771 = precise::min(_763, 3.0);
    float _773 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _723);
    float _775 = precise::min(_767, 5.0);
    float _777 = trunc(_769);
    float _779 = precise::max(_777, 0.0);
    uint _781 = uint(_779);
    float _783 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _651);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _787 = _322 + _785;
    bool _789 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _791 = isnan(_322);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[79].x, _677);
    float _803 = fma(_775, -7.751926898956298828125, 38.75963592529296875);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _807 = _322 + _805;
    float _809 = in.m_73.x;
    float _811 = fma(_743, _787, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _813 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _721);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _817 = _322 + _815;
    float _819 = -_799;
    float _821 = _819 + 1.0;
    float _823 = fma(_765, _807, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _825 = ~_350;
    int _827 = _825 + 1;
    float _829 = fma(_761, _817, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _831 = _755 * _821;
    int _833 = int(_687) + int(_781);
    float _835 = as_type<float>(_394) * _757;
    bool _837 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = isnan(_322);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -_755;
    float _851 = _849 + 1.0;
    float _853 = trunc(_835);
    float _855 = precise::max(_853, 0.0);
    uint _857 = uint(_855);
    bool _859 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _861 = isnan(_322);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -_847;
    float _873 = _871 + 1.0;
    float _875 = _847 * _851;
    int _877 = _827 * _833;
    int _879 = _877 + _647;
    float _881 = _801 * (-0.15915493667125701904296875);
    float _883 = _869 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _741 + _885;
    float _889 = -_869;
    float _891 = _889 + 1.0;
    bool _893 = uint(_879) >= uint(_350);
    float _895 = _811 * _883;
    float _897 = _809;
    float _899 = _803;
    if (_354)
    {
        _621 = _809;
    }
    float _901 = _621;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = _639 + _903;
    bool _907 = !_893;
    int _909 = _907 ? 0 : (-1);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[115].x, _895);
    int _913 = ~_350;
    int _915 = _913 + 1;
    float _917 = _901;
    if (_709)
    {
        float _919 = -_901;
        float _921 = _919 + 1.0;
        _917 = _921;
    }
    float _923 = _917;
    int _925 = ~_833;
    int _927 = _925 + _909;
    int _929 = _927 + 1;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _933 = _573 + _931;
    float _935 = _881 * 6.283185482025146484375;
    float _937 = sin(_935);
    int _939 = _915 * int(_857);
    int _941 = _939 + _609;
    if (_354)
    {
        _897 = _923;
    }
    float _943 = _897;
    float _945 = _933 * _933;
    int _947 = _350 * _929;
    int _949 = _947 + _647;
    float _951 = fma(_829, _875, _911);
    float _953 = float(uint(_941));
    float _955 = fma(_887, _887, _945);
    float _957 = _881 * 6.283185482025146484375;
    float _959 = cos(_957);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _963 = _525 + _961;
    float _965 = fma(_905, _905, _955);
    bool _967 = !_537;
    int _969 = _967 ? _949 : (-1);
    float _971 = as_type<float>(_394) * _953;
    float _973 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _975 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _977 = sqrt(_965);
    int _979 = _969 >> 31;
    float _981 = fma(_963, _963, _945);
    float _983 = fma(_823, _831, _951);
    int _985 = _969 & 3;
    bool _987 = _985 != 0;
    int _989 = _979 & 3;
    float _991 = _937 * _973;
    float _993 = trunc(_971);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    int _999 = _969 + _989;
    float _1001 = _959 * _973;
    float _1003 = -_991;
    float _1005 = fma(_959, _975, _1003);
    float _1007 = fma(_905, _905, _981);
    int _1009 = _999 >> 2;
    float _1011 = fma(_937, _975, _1001);
    float _1013 = _963 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1015 = rsqrt(_965);
    int _1017 = _1009 << 4;
    int _1019 = _1017 + 368;
    float _1021 = _334 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1023 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1013);
    float _1025 = -_773;
    float _1027 = fma(_813, _1011, _1025);
    uint _1029 = uint(int(uint(_1019) >> uint(2)));
    uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
    int _1033 = int(_1029) & 3;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[int(_1031)][_1033];
    int _1037 = int(_1029) + 1;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    int _1041 = _1037 & 3;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[int(_1039)][_1041];
    float _1045 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[118].x, _983);
    float _1047 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1023);
    float _1049 = rsqrt(_1007);
    float _1051 = _977 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1053 = fma(_783, _1005, _681);
    int _1055 = _969 & 3;
    bool _1057 = _1055 != 0;
    float _1059 = fma(_771, 15.384601593017578125, -45.153804779052734375);
    bool _1061 = _1047 >= 0.0;
    float _1063 = precise::min(_1021, _1051);
    int _1065 = _1019 + 8;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
    int _1071 = int(_1067) & 3;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[int(_1069)][_1071];
    int _1075 = int(_1067) + 1;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    int _1079 = _1075 & 3;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[int(_1077)][_1079];
    bool _1083 = uint(_1055) > 1u;
    float _1085 = _1015 * _1063;
    int _1087 = int(_857) + int(_997);
    out.m_77.w = _1063;
    int _1089 = ~_350;
    int _1091 = _1089 + 1;
    float _1093 = _963 * _1049;
    float _1095 = _933 * _1049;
    float _1097 = _933 * _1085;
    bool _1099 = !_1057;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = -_1093;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    int _1107 = _987 ? 0 : 1;
    float _1109 = -_1095;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _933);
    bool _1113 = uint(_1055) >= 2u;
    float _1115 = _1105 * _1105;
    int _1117 = ~_1107;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = _887 * _1085;
    int _1125 = _1121;
    float _1127 = _1123;
    float _1129 = _1097;
    if (!_1083)
    {
        int _1131 = ~_1107;
        int _1133 = _1131 + 1;
        _1125 = _1133;
    }
    int _1135 = _1125;
    int _1137 = _1091 * _1087;
    int _1139 = _1137 + _609;
    bool _1141 = _1055 != 3;
    float _1143 = -_1123;
    float _1145 = _887 + _1143;
    int _1147 = abs(_1135);
    float _1149 = -_1097;
    float _1151 = _933 + _1149;
    bool _1153 = uint(_1139) >= uint(_350);
    float _1155 = _1145 * _1145;
    int _1157 = ~_1147;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = fma(_1111, _1111, _1115);
    bool _1165 = _1055 != 3;
    float _1167 = fma(_1151, _1151, _1155);
    int _1169 = _1113 ? 0 : 1;
    float _1171 = _905 * _1049;
    int _1173 = abs(_1101);
    float _1175 = _1059 * _803;
    float _1177 = precise::clamp(_1175, 0.0, 1.0);
    int _1179 = ~_1169;
    int _1181 = _1179 + 1;
    int _1183 = _1181 + 1;
    int _1185 = _1183;
    if (_1061)
    {
        out.m_55.x = 0.0;
    }
    int _1187 = _1161 * as_type<int>(_1043);
    bool _1189 = !_1165;
    int _1191 = _1189 ? 0 : (-1);
    float _1193 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    if (_1141)
    {
        int _1195 = ~_1169;
        int _1197 = _1195 + 1;
        _1185 = _1197;
    }
    int _1199 = _1185;
    bool _1201 = !_1153;
    int _1203 = _1201 ? 0 : (-1);
    int _1205 = abs(_1191);
    out.m_79.x = _1193;
    int _1207 = ~_1173;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    float _1213 = _905 * _1085;
    int _1215 = abs(_1199);
    int _1217 = ~_1087;
    int _1219 = _1217 + _1203;
    int _1221 = _1219 + 1;
    float _1223 = -_1171;
    float _1225 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    int _1227 = ~_1215;
    int _1229 = _1227 + 1;
    int _1231 = _1229 + 1;
    float _1233 = -_1213;
    float _1235 = _905 + _1233;
    int _1237 = _1211 * as_type<int>(_1035);
    int _1239 = _1237 + _1187;
    int _1241 = ~_1205;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = fma(_1225, _1225, _1163);
    float _1249 = fma(_1235, _1235, _1167);
    int _1251 = _1231 * as_type<int>(_1073);
    int _1253 = _1251 + _1239;
    int _1255 = _350 * _1221;
    int _1257 = _1255 + _609;
    float _1259 = sqrt(_1249);
    int _1261 = _1245 * as_type<int>(_1081);
    int _1263 = _1261 + _1253;
    bool _1265 = !_415;
    int _1267 = _1265 ? 0 : 1;
    float _1269 = _1027 + 0.5;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1273 = abs(_1267);
    float _1275 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1277 = sqrt(_1247);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1281 = _1053 + 0.5;
    int _1283 = ~_1273;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    float _1289 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1293 = !_537;
    int _1295 = _1293 ? _1257 : (-1);
    out.m_81.x = _1281;
    out.m_81.y = _1269;
    int _1297 = _1263 * _1287;
    float _1299 = _1015 * _1259;
    if (_1061)
    {
        _899 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1301 = _899;
    int _1303 = _1295 * _1273;
    int _1305 = _1303 + _1297;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1309 = _1049 * _1277;
    float _1311 = _334 * _1299;
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1315 = as_type<int>(_1301);
    if (_1061)
    {
        float _1317 = _1301 * 5.0;
        _1315 = as_type<int>(_1317);
    }
    int _1319 = _1315;
    float _1321 = float(_1305);
    float _1323 = _1311 * _1309;
    out.m_83.x = _1289;
    out.m_83.y = _1313;
    out.m_83.z = _1291;
    out.m_83.w = _1275;
    if (_1061)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4871 = as_type<float>(_1319);
        out.gl_Position.z = _4871;
    }
    out.m_85.x = _1321;
    out.m_87.x = _1323;
    if (_1061)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1325 = -_1093;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _1329 = -_1095;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _1333 = -_1171;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1327 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1343 = _1331 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1347 = _1335 + _1345;
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1351 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1349);
    float _1353 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1351);
    bool _1355 = _1353 >= 0.0;
    float _1357 = _1347;
    if (_1355)
    {
        _1357 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1359 = _1357;
    int _1361 = as_type<int>(_1359);
    if (_1355)
    {
        out.m_55.x = 0.0;
    }
    if (_1355)
    {
        float _1363 = _1359 * 5.0;
        _1361 = as_type<int>(_1363);
    }
    int _1365 = _1361;
    if (_1355)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4962 = as_type<float>(_1365);
        out.gl_Position.z = _4962;
    }
    if (_1355)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1367 = -_525;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = -_573;
    float _1373 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = -_639;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1369 * _1369;
    float _1381 = _300 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1383 = fma(_1373, _1373, _1379);
    float _1385 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1387 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1389 = fma(_1377, _1377, _1383);
    float _1391 = -_1385;
    float _1393 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1391);
    float _1395 = rsqrt(_1389);
    float _1397 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1401 = -_1397;
    float _1403 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1401);
    float _1405 = -_1399;
    float _1407 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1405);
    float _1409 = _1373 * _1395;
    float _1411 = _1377 * _1395;
    float _1413 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1415 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1417 = _1409 * _1409;
    float _1419 = _1369 * _1395;
    float _1421 = -_1415;
    float _1423 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1421);
    float _1425 = fma(_1411, _1411, _1417);
    float _1427 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1431 = rsqrt(_1425);
    float _1433 = -_1427;
    float _1435 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1433);
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1439 = -_1429;
    float _1441 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1439);
    float _1443 = -_1437;
    float _1445 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1443);
    float _1447 = -_1413;
    float _1449 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1447);
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1423);
    float _1453 = _1411 * _1431;
    float _1455 = _1409 * _1431;
    float _1457 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1459 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1449);
    float _1461 = -_1453;
    float _1463 = _1411 * _1461;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1441 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1469 = -_1457;
    float _1471 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1473 = -_1463;
    float _1475 = fma(_1409, _1455, _1473);
    float _1477 = _1419 * _1455;
    float _1479 = -_1465;
    float _1481 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1483 = -_1453;
    float _1485 = _1419 * _1483;
    float _1487 = _1475 * _1475;
    float _1489 = -_1467;
    float _1491 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1489);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1471);
    float _1495 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1497 = fma(_1477, _1477, _1487);
    float _1499 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1491);
    float _1501 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1503 = -_1495;
    float _1505 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1503);
    float _1507 = fma(_1485, _1485, _1497);
    float _1509 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1511 = -_1499;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1501);
    float _1515 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1505);
    float _1517 = rsqrt(_1507);
    float _1519 = -_1509;
    float _1521 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1519);
    float _1523 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1525 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1521);
    float _1527 = -_1523;
    float _1529 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    bool _1531 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    float _1541 = 1.0 / _1513;
    float _1543 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1529);
    float _1545 = _1475 * _1517;
    float _1547 = precise::clamp(_1545, 0.0, 1.0);
    float _1549 = -_1547;
    float _1551 = _1549 + 1.0;
    float _1553 = fma(_1515, _1541, -1.0);
    float _1555 = _1551 * _1541;
    float _1557 = fma(_1551, _1553, 1.0);
    float _1559 = _1525 * _1555;
    float _1561 = _1543 * _1555;
    float _1563 = _1557 * _1557;
    float _1565 = fma(_1559, _1559, _1563);
    float _1567 = fma(_1561, _1561, _1565);
    float _1569 = rsqrt(_1567);
    float _1571 = _1561 * _1569;
    float _1573 = _1559 * _1569;
    float _1575 = _1557 * _1569;
    float _1577 = _1299 * _1309;
    float _1579 = -_1571;
    float _1581 = _1409 * _1579;
    float _1583 = _1411 * _1575;
    float _1585 = _1381 * _1577;
    float _1587 = -_1573;
    float _1589 = -_1581;
    float _1591 = fma(_1411, _1587, _1589);
    float _1593 = -_1573;
    float _1595 = _1419 * _1593;
    float _1597 = -_1571;
    float _1599 = -_1583;
    float _1601 = fma(_1419, _1597, _1599);
    float _1603 = _1387 * _1577;
    float _1605 = _1591 * _1591;
    float _1607 = -_1595;
    float _1609 = fma(_1409, _1575, _1607);
    float _1611 = -_1097;
    float _1613 = _573 + _1611;
    float _1615 = -_1213;
    float _1617 = _639 + _1615;
    float _1619 = fma(_1601, _1601, _1605);
    float _1621 = fma(_1609, _1609, _1619);
    float _1623 = rsqrt(_1621);
    float _1625 = _1601 * _1623;
    float _1627 = _1609 * _1623;
    float _1629 = _1591 * _1623;
    float _1631 = _1411 * _1625;
    float _1633 = _1419 * _1627;
    float _1635 = -_1631;
    float _1637 = fma(_1409, _1627, _1635);
    float _1639 = _1409 * _1629;
    float _1641 = -_1633;
    float _1643 = fma(_1411, _1629, _1641);
    float _1645 = _1637 * _1637;
    float _1647 = -_1639;
    float _1649 = fma(_1419, _1625, _1647);
    float _1651 = in.m_89.x;
    float _1653 = in.m_89.y;
    float _1655 = in.m_89.z;
    float _1657 = fma(_1643, _1643, _1645);
    float _1659 = fma(_1649, _1649, _1657);
    float _1661 = rsqrt(_1659);
    float _1663 = -_1651;
    float _1665 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1663);
    float _1667 = _1649 * _1661;
    float _1669 = _1637 * _1661;
    float _1671 = _1643 * _1661;
    float _1673 = fma(_1193, _1665, _1651);
    float _1675 = _1409 * _1667;
    float _1677 = _1411 * _1669;
    float _1679 = -_1655;
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1679);
    float _1683 = -_1675;
    float _1685 = fma(_1411, _1671, _1683);
    float _1687 = -_1677;
    float _1689 = fma(_1419, _1667, _1687);
    float _1691 = _1419 * _1671;
    float _1693 = _1685 * _1685;
    float _1695 = -_1691;
    float _1697 = fma(_1409, _1669, _1695);
    float _1699 = -_1653;
    float _1701 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1699);
    float _1703 = fma(_1689, _1689, _1693);
    float _1705 = fma(_1193, _1701, _1653);
    float _1707 = fma(_1697, _1697, _1703);
    float _1709 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1673);
    float _1711 = fma(_1193, _1681, _1655);
    float _1713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1705);
    float _1715 = _1323 * _1709;
    float _1717 = rsqrt(_1707);
    float _1719 = _1585 * _1713;
    float _1721 = _1711 * _1603;
    float _1723 = _1719 * _1667;
    float _1725 = _1719 * _1671;
    float _1727 = _1697 * _1717;
    float _1729 = _1689 * _1717;
    float _1731 = _1685 * _1717;
    float _1733 = _1719 * _1669;
    float _1735 = fma(_1715, _1727, _1723);
    float _1737 = fma(_1715, _1729, _1725);
    float _1739 = fma(_1715, _1731, _1733);
    float _1741 = fma(_1721, _1411, _1735);
    float _1743 = -_1123;
    float _1745 = _1743 + _525;
    float _1747 = fma(_1721, _1409, _1737);
    float _1749 = fma(_1721, _1419, _1739);
    float _1751 = _639 + _1741;
    float _1753 = -_1093;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1745);
    float _1757 = _573 + _1747;
    float _1759 = -_1095;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1613);
    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1765 = _1751 + _1763;
    float _1767 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1771 = _1757 + _1769;
    float _1773 = -_1171;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1617);
    float _1777 = _1765 * _1765;
    float _1779 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1767);
    float _1781 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = fma(_1771, _1771, _1777);
    float _1785 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1779);
    float _1787 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1789 = _525 + _1749;
    float _1791 = sqrt(_1783);
    float _1793 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1795 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1787);
    float _1797 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = 1.0 / _1793;
    float _1811 = _1797 + _1793;
    bool _1813 = _1791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1815 = _1811 * _1809;
    float _1817 = _1815 * 0.5;
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1821 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1819);
    float _1823 = _1739;
    float _1825 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1827 = _1817;
    float _1829 = _1793;
    float _1831 = _1775;
    if (!_1813)
    {
        _1823 = _1757;
    }
    float _1833 = _1823;
    float _1835 = _1833;
    if (!_1813)
    {
        _1825 = _1751;
    }
    float _1837 = _1825;
    float _1839 = _1837;
    if (!_1813)
    {
        _1827 = _1789;
    }
    float _1841 = _1827;
    bool _1843 = !_1813;
    float _1845 = _1841;
    if (!_1843)
    {
        float _1847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1851 = _1791 + _1849;
        float _1853 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1855 = rsqrt(_1783);
        float _1857 = _1851 * _1847;
        float _1859 = _1857 * 0.15915493667125701904296875;
        float _1861 = _1859 * 6.283185482025146484375;
        float _1863 = cos(_1861);
        float _1865 = _1859 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = _1863 + (-1.0);
        float _1871 = fma(_1867, _1853, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1873 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1875 = _1855 * _1871;
        float _1877 = fma(_1789, _1863, _1873);
        float _1879 = fma(_1771, _1875, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1881 = fma(_1765, _1875, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1835 = _1879;
        _1845 = _1877;
        _1839 = _1881;
    }
    float _1883 = _1835;
    float _1885 = _1845;
    float _1887 = _1839;
    float _1889 = 1.0 / _1821;
    float _1891 = -_1097;
    float _1893 = _1891 + _1883;
    float _1895 = -_1123;
    float _1897 = _1895 + _1885;
    float _1899 = -_1213;
    float _1901 = _1899 + _1887;
    if (_1539)
    {
        _1829 = 1.0;
    }
    float _1903 = _1829;
    float _1905 = -_1095;
    float _1907 = fma(_1905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1893);
    float _1909 = -_1093;
    float _1911 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1897);
    float _1913 = -_1171;
    float _1915 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1901);
    float _1917 = _1911;
    float _1919 = _1907;
    float _1921 = _1915;
    float _1923 = _1903;
    if (!_1807)
    {
        float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1927 = _1755 + _1925;
        float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1931 = _1761 + _1929;
        float _1933 = 1.0 / _1309;
        float _1935 = -_573;
        float _1937 = _1935 + _1883;
        float _1939 = _1927 * _1927;
        float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1943 = _1775 + _1941;
        float _1945 = -_525;
        float _1947 = _1945 + _1885;
        float _1949 = -_639;
        float _1951 = _1949 + _1887;
        float _1953 = fma(_1931, _1931, _1939);
        float _1955 = fma(_1943, _1943, _1953);
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1959 = sqrt(_1955);
        float _1961 = precise::min(_1959, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1963 = _1961 * _1957;
        float _1965 = _1963 * _1933;
        float _1967 = fma(_1937, _1965, _1761);
        float _1969 = fma(_1947, _1965, _1755);
        float _1971 = fma(_1951, _1965, _1775);
        _1917 = _1969;
        _1919 = _1967;
        _1921 = _1971;
        _623 = _1937;
    }
    float _1973 = _1917;
    float _1975 = _1919;
    float _1977 = _1921;
    float _1979 = _623;
    float _1981 = _1979;
    if (_1539)
    {
        _549 = 1.0;
    }
    float _1983 = _549;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1987 = _1889 * _1985;
    float _1989 = _1983;
    if (!_1539)
    {
        float _1991 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = _1993 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2001 = _1999 * 0.15915493667125701904296875;
        float _2003 = _1993 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        float _2007 = 1.0 / _1997;
        float _2009 = _2001 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = _2001 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = 1.0 / _2019;
        float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2025 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2023;
        float _2027 = 1.0 / _2025;
        float _2029 = _2017 * _2021;
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = fma(_1987, _2029, _2031);
        float _2035 = _2033 * _2027;
        float _2037 = precise::clamp(_2035, 0.0, 1.0);
        _1127 = _1993;
        _1923 = _2037;
    }
    float _2039 = _1127;
    float _2041 = _1923;
    if (!_1539)
    {
        float _2043 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2045 = _2043 * 0.15915493667125701904296875;
        float _2047 = _2045 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2053 = _2051 * 0.15915493667125701904296875;
        float _2055 = _2045 * 6.283185482025146484375;
        float _2057 = sin(_2055);
        float _2059 = 1.0 / _2049;
        float _2061 = _2053 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = _2057 * _2059;
        float _2067 = _2053 * 6.283185482025146484375;
        float _2069 = sin(_2067);
        float _2071 = _2063 * _2065;
        float _2073 = 1.0 / _2071;
        float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2077 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2075;
        float _2079 = 1.0 / _2077;
        float _2081 = _2069 * _2073;
        float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2085 = fma(_1987, _2081, _2083);
        float _2087 = _2085 * _2079;
        float _2089 = precise::clamp(_2087, 0.0, 1.0);
        float _2091 = -_2089;
        float _2093 = _2091 + 1.0;
        _1989 = _2093;
    }
    float _2095 = _1989;
    float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2099 = _1973 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _1975 + _2101;
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2107 = _1977 + _2105;
    float _2109 = _2099 * _2099;
    float _2111 = fma(_2103, _2103, _2109);
    float _2113 = fma(_2107, _2107, _2111);
    float _2115 = rsqrt(_2113);
    float _2117 = sqrt(_2113);
    float _2119 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2121 = _2103 * _2119;
    float _2123 = _2107 * _2119;
    float _2125 = _2121 * _2121;
    float _2127 = _2123 * _2123;
    float _2129 = _2125 + _2127;
    float _2131 = sqrt(_2129);
    bool _2133 = _2131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2137 = _2131 + _2135;
    float _2139 = _2115;
    float _2141 = _2137;
    float _2143 = _2099;
    if (_2133)
    {
        float _2145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = _2147;
    if (_2133)
    {
        float _2151 = _2137 * _2147;
        _2141 = _2151;
    }
    float _2153 = _2141;
    if (_2133)
    {
        float _2155 = rsqrt(_2129);
        _2149 = _2155;
    }
    float _2157 = _2149;
    float _2159 = _2157;
    if (_2133)
    {
        float _2161 = _2153 * 0.15915493667125701904296875;
        _1129 = _2161;
    }
    float _2163 = _1129;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = _2107;
    float _2169 = _2163;
    if (_2133)
    {
        float _2171 = _2163 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        _2167 = _2173;
    }
    float _2175 = _2167;
    float _2177 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2179 = precise::max(0.0, _2165);
    float _2181 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2177);
    float _2183 = _2039;
    float _2185 = _2179;
    if (_2133)
    {
        float _2187 = _2163 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        _2183 = _2189;
    }
    float _2191 = _2183;
    float _2193 = -_2119;
    float _2195 = -_2179;
    float _2197 = fma(_2099, _2193, _2195);
    float _2199 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2181);
    if (_2133)
    {
        float _2201 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2143 = _2201;
    }
    float _2203 = _2143;
    float _2205 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2207 = _2175;
    float _2209 = _2203;
    if (_2133)
    {
        float _2211 = fma(_2175, _2203, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1981 = _2211;
    }
    float _2213 = _1981;
    float _2215 = _2213;
    if (!_2133)
    {
        _2207 = _2197;
    }
    float _2217 = _2207;
    float _2219 = _2217;
    if (!_2133)
    {
        _2169 = _2123;
    }
    float _2221 = _2169;
    float _2223 = _2221;
    if (_2133)
    {
        float _2225 = _2157 * _2213;
        _2209 = _2225;
    }
    float _2227 = _2209;
    if (!_2133)
    {
        _2159 = _2121;
    }
    float _2229 = _2159;
    float _2231 = _2229;
    float _2233 = _2191;
    if (_2133)
    {
        float _2235 = _2191 + (-1.0);
        _2185 = _2235;
    }
    float _2237 = _2185;
    float _2239 = _2237;
    if (_2133)
    {
        float _2241 = _2121 * _2227;
        _2231 = _2241;
    }
    float _2243 = _2231;
    if (_2133)
    {
        float _2245 = _2123 * _2227;
        _2223 = _2245;
    }
    float _2247 = _2223;
    if (!_2133)
    {
        _2215 = _2127;
    }
    float _2249 = _2215;
    float _2251 = _2249;
    if (_2133)
    {
        float _2253 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    float _2257 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2133)
    {
        float _2259 = _2247 * _2247;
        _2251 = _2259;
    }
    float _2261 = _2251;
    if (_2133)
    {
        float _2263 = fma(_2197, _2191, _2255);
        _2219 = _2263;
    }
    float _2265 = _2219;
    if (!_2133)
    {
        _2233 = _2125;
    }
    float _2267 = _2233;
    float _2269 = _2267;
    if (_2133)
    {
        float _2271 = _2243 * _2243;
        _2269 = _2271;
    }
    float _2273 = _2269;
    float _2275 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2257);
    float _2277 = fma(_2265, _2265, _2273);
    float _2279 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2275);
    float _2281 = fma(_1761, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2283 = _2277 + _2261;
    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2287 = fma(_2117, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2285);
    float _2289 = precise::clamp(_2287, 0.0, 1.0);
    float _2291 = _2279 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2293 = rsqrt(_2283);
    float _2295 = -_2289;
    float _2297 = _2295 + 1.0;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2301 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2303 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2305 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2307 = abs(_2297);
    float _2309 = log2(_2307);
    float _2311 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2313 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2303);
    float _2315 = -_2299;
    float _2317 = fma(_2315, _2305, 1.0);
    float _2319 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2311);
    float _2321 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2313);
    float _2323 = _2293 * _2243;
    float _2325 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2319);
    float _2327 = floor(_2281);
    float _2329 = _2293 * _2265;
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2333 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2335 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2337 = _2293 * _2247;
    float _2339 = -_2331;
    float _2341 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2339);
    float _2343 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2345 = floor(_2301);
    float _2347 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2349 = -_2337;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2341);
    float _2353 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2343);
    float _2355 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2357 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2353);
    float _2359 = exp2(_2347);
    float _2361 = -_2327;
    float _2363 = _2281 + _2361;
    float _2365 = fma(_1883, 6.2500002968590706586837768554688e-05, 0.5);
    float _2367 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2357);
    float _2369 = fma(_1887, 6.2500002968590706586837768554688e-05, 0.5);
    float _2371 = _2329 + 1.0;
    float _2373 = log2(_2317);
    float _2375 = -_2345;
    float _2377 = _2301 + _2375;
    float _2379 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2381 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2355);
    float _2383 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2379);
    float _2385 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2381);
    float _2387 = 1.0 / _2367;
    float _2389 = fma(_2351, -0.5, 0.5);
    float _2391 = fma(_2351, 0.5, 0.5);
    float _2393 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2383);
    float _2395 = -_2329;
    float _2397 = fma(_2359, _2371, _2395);
    float _2399 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2401 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2393);
    float _2403 = sqrt(_2389);
    float _2405 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2385);
    float _2407 = fma(_2391, _2399, -0.212114393711090087890625);
    float _2409 = _2373 * 0.693147182464599609375;
    float _2411 = fma(_2391, _2407, 1.570728778839111328125);
    float _2413 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2415 = _2401 * _2387;
    float _2417 = _2405 * _2387;
    float _2419 = fma(_2397, 0.5, 0.5);
    float _2421 = fma(_2415, 0.5, 0.5);
    float _2423 = fma(_2417, -0.5, 0.5);
    float _2425 = _2403 * 0.636619746685028076171875;
    float2 _6663 = float2(_2363, _2377);
    float _2427 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6663, float2(0.0), isnan(_6663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6663, float2(0.0), isnan(_6663)), level(0.0)).x;
    float3 _6674 = float3(_2421, _2423, _2413);
    float _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6674, float3(0.0), isnan(_6674)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6674, float3(0.0), isnan(_6674)), level(0.0)).x;
    float _2431 = -_2411;
    float _2433 = fma(_2425, _2431, 1.0);
    float3 _6690 = float3(_2421, _2423, _2413);
    float4 _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6690, float3(0.0), isnan(_6690)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6690, float3(0.0), isnan(_6690)), level(0.0)).xyzw;
    float _2438 = _2436.x;
    float _2440 = _2436.y;
    float _2442 = _2436.z;
    float _2444 = _2436.w;
    float2 _6706 = float2(_2433, _2419);
    float3 _2448 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).xyz;
    float _2450 = _2448.x;
    float _2452 = _2448.y;
    float _2454 = _2448.z;
    float2 _6720 = float2(_2365, _2369);
    float3 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6720, float2(0.0), isnan(_6720)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6720, float2(0.0), isnan(_6720)), level(0.0)).xyz;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = abs(_1987);
    float _2466 = log2(_2464);
    bool _2468 = _1705 != 0.0;
    bool _2470 = isnan(_1705);
    bool _2472 = _2468 || _2470;
    bool _2474 = isnan(0.0);
    bool _2476 = _2472 || _2474;
    out.m_91.x = _1761;
    out.m_91.y = _1755;
    out.m_91.z = _1775;
    bool _2478 = _1673 == 0.0;
    bool _2480 = !_2476;
    bool _2482 = _2478 && _2480;
    out.m_93.x = _1975;
    out.m_93.y = _1973;
    out.m_93.z = _1977;
    bool _2484 = _1711 == 0.0;
    bool _2486 = _2484 && _2482;
    bool _2488 = _1987 <= 8000.0;
    bool _2490 = isnan(_1987);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(8000.0);
    bool _2496 = _2492 || _2494;
    float _2498 = float(_2496);
    float _2500 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2502 = in.m_95.x;
    float _2504 = in.m_95.y;
    float _2506 = in.m_95.z;
    float _2508 = exp2(_2500);
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2504;
    float _2516 = _2502;
    float _2518 = _2506;
    float _2520 = _2405;
    float _2522 = _2401;
    if (!_2486)
    {
        float _2524 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2504);
        _2514 = _2524;
    }
    float _2526 = _2514;
    if (!_2486)
    {
        float _2528 = fma(_1673, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2502);
        _2516 = _2528;
    }
    float _2530 = _2516;
    float _2532 = fma(_2512, -2.0, 3.0);
    float _2534 = _2512 * _2512;
    float _2536 = _1671 * _2526;
    float _2538 = _1669 * _2526;
    float _2540 = _1667 * _2526;
    float _2542 = _2534 * _2532;
    float _2544 = fma(_1729, _2530, _2536);
    float _2546 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2486)
    {
        float _2548 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2506);
        _2518 = _2548;
    }
    float _2550 = _2518;
    float _2552 = -_2542;
    float _2554 = _2552 + 1.0;
    float _2556 = _2367 * 0.5;
    float _2558 = exp2(_2546);
    float _2560 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2542);
    float _2562 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2564 = fma(_2405, -0.5, _2556);
    float _2566 = _2498 * _2560;
    float _2568 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2562);
    float _2570 = fma(_1731, _2530, _2538);
    float _2572 = _2401 + _2367;
    bool _2574 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2576 = isnan(_2117);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2582 = _2578 || _2580;
    float _2584 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2568);
    float _2586 = fma(_1727, _2530, _2540);
    float _2588 = fma(_1409, _2550, _2544);
    float _2590 = fma(_1419, _2550, _2570);
    float _2592 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2584);
    float _2594 = fma(_1411, _2550, _2586);
    float _2596 = -_2558;
    float _2598 = _2596 + 1.0;
    float _2600 = in.m_63.x;
    float _2602 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2604 = _2592 + _2367;
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2608 = _2572 * 0.5;
    out.m_97.x = _2588;
    out.m_97.y = _2590;
    out.m_97.z = _2594;
    float _2610 = _2604 * 0.5;
    if (!_2582)
    {
        _1831 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2612 = _1831;
    out.gl_Position.x = _2401;
    out.gl_Position.y = _2405;
    out.gl_Position.z = _2592;
    out.gl_Position.w = _2367;
    out.m_99.x = _2608;
    out.m_99.y = _2564;
    out.m_99.z = _2610;
    out.m_99.w = _2367;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2582)
    {
        _2520 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2618 = _2520;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2582)
    {
        _2522 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2624 = _2522;
    float _2626 = -_2427;
    float _2628 = _2626 + 1.0;
    float _2630 = _2606 * _2429;
    float _2632 = -_2606;
    float _2634 = _2632 + 1.0;
    float _2636 = _2628 * _2602;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2444 * _2630;
    float _2642 = _2444 * _2634;
    float _2644 = -_2638;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2648 = _2454 * _2630;
    float _2650 = fma(_2450, _2640, _2438);
    float _2652 = fma(_2452, _2640, _2440);
    out.m_101.x = _2458;
    out.m_101.y = _2460;
    out.m_101.z = _2462;
    float _2654 = fma(_2444, _2648, _2442);
    float _2656 = _2646 * _2600;
    float _2658 = _2041 * _2095;
    out.m_103.x = _2650;
    out.m_103.y = _2652;
    out.m_103.z = _2654;
    out.m_103.w = _2642;
    float _2660 = _2656 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2662 = _2658 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2664 = _2656;
    float _2666 = _2658;
    float _2668 = _2660;
    float _2670 = _2624;
    float _2672 = _2624;
    if (!_2582)
    {
        _2664 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2664;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2582)
    {
        _2666 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2680 = _2666;
    out.m_105.x = _2660;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2582)
    {
        _2668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2686 = _2668;
    bool _2688 = !_2582;
    float _2690 = _2686;
    float _2692 = _2686;
    if (!_2688)
    {
        bool _2694 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2696 = isnan(_2117);
        bool _2698 = _2694 || _2696;
        bool _2700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2702 = _2698 || _2700;
        if (!_2702)
        {
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2706 = _2117 + _2704;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2710 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2708;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2716 = 1.0 / _2710;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2734 = _2706 * _2716;
            float _2736 = precise::clamp(_2734, 0.0, 1.0);
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2742 = fma(_2736, _2714, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2744 = fma(_2736, _2740, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2746 = fma(_2736, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2748 = fma(_2736, _2724, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2750 = fma(_2736, _2728, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2752 = fma(_2736, _2732, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2672 = _2746;
            _2692 = _2750;
            _2622 = _2742;
            _2616 = _2748;
            _2678 = _2744;
            _2684 = _2752;
            _2754 = true;
        }
        else
        {
            bool _2756 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2758 = isnan(_2117);
            bool _2760 = _2756 || _2758;
            bool _2762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2764 = _2760 || _2762;
            if (!_2764)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2766 = _2620;
            _2622 = _2766;
            if (!_2764)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2768 = _2670;
            _2672 = _2768;
            if (!_2764)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2770 = _2676;
            _2678 = _2770;
            if (!_2764)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2772 = _2614;
            _2616 = _2772;
            if (!_2764)
            {
                _2690 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2774 = _2690;
            _2692 = _2774;
            if (!_2764)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2776 = _2682;
            bool _2778 = !_2764;
            _2684 = _2776;
            if (!_2778)
            {
                bool _2780 = _2117 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2782 = isnan(_2117);
                bool _2784 = _2780 || _2782;
                bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2788 = _2784 || _2786;
                if (!_2788)
                {
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2792 = _2117 + _2790;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2796 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2794;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2802 = 1.0 / _2796;
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2820 = _2792 * _2802;
                    float _2822 = precise::clamp(_2820, 0.0, 1.0);
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2828 = fma(_2822, _2800, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2830 = fma(_2822, _2826, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2832 = fma(_2822, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2834 = fma(_2822, _2810, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2836 = fma(_2822, _2814, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2838 = fma(_2822, _2818, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2672 = _2832;
                    _2692 = _2836;
                    _2622 = _2828;
                    _2616 = _2834;
                    _2678 = _2830;
                    _2684 = _2838;
                    _2754 = true;
                }
                else
                {
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2692 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2754 = false;
    float _2840 = _2672;
    float _2842 = _2692;
    float _2844 = _2622;
    float _2846 = _2616;
    float _2848 = _2678;
    float _2850 = _2684;
    float _2852 = _2662 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2854 = fma(_2590, -0.5, 0.5);
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = -_2840;
    float _2860 = _2858 + _2842;
    float _2862 = -_2844;
    float _2864 = _2862 + _2846;
    out.m_107.x = 0.0;
    float _2866 = fma(_2856, _2860, _2840);
    float _2868 = -_2848;
    float _2870 = _2868 + _2850;
    float _2872 = fma(_2856, _2864, _2844);
    float _2874 = _2866 * 0.586610972881317138671875;
    bool _2876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2878 = fma(_2856, _2870, _2848);
    out.m_55.x = _2852;
    float _2880 = fma(_2872, 0.298911988735198974609375, _2874);
    bool _2882 = _2041 > 0.0;
    bool _2884 = isnan(_2041);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan(0.0);
    bool _2890 = _2886 || _2888;
    float _2892 = fma(_2878, 0.114477999508380889892578125, _2880);
    bool _2894 = _2095 <= 0.0;
    bool _2896 = !_2890;
    bool _2898 = _2894 || _2896;
    float _2900 = -_2892;
    float _2902 = _2872 + _2900;
    float _2904 = -_2892;
    float _2906 = _2866 + _2904;
    float _2908 = -_2892;
    float _2910 = _2878 + _2908;
    float _2912 = fma(_2902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    float _2914 = fma(_2906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    float _2916 = fma(_2910, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2892);
    bool _2918 = !_2876;
    if (!_2918)
    {
        float _2920 = -_1973;
        float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2924 = -_1975;
        float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2928 = -_1977;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2932 = _2922 * _2922;
        float _2934 = fma(_2926, _2926, _2932);
        float _2936 = fma(_2930, _2930, _2934);
        float _2938 = sqrt(_2936);
        float _2940 = rsqrt(_2936);
        float _2942 = -_2938;
        float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2948 = precise::clamp(_2946, 0.0, 1.0);
        float _2950 = _2926 * _2940;
        float _2952 = _2922 * _2940;
        float _2954 = abs(_2948);
        float _2956 = log2(_2954);
        float _2958 = _2930 * _2940;
        float _2960 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2962 = _2590 * _2952;
        float _2964 = -_2952;
        float _2966 = -_2960;
        float _2968 = fma(_2964, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2966);
        float _2970 = fma(_2588, _2950, _2962);
        float _2972 = -_2958;
        float _2974 = fma(_2972, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2968);
        float _2976 = fma(_2594, _2958, _2970);
        float _2978 = precise::clamp(_2976, 0.0, 1.0);
        float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2982 = _2974 + _2980;
        float _2984 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2988 = precise::clamp(_2986, 0.0, 1.0);
        float _2990 = exp2(_2984);
        float _2992 = _2990 * _2988;
        float _2994 = _2978 * _2992;
        float _2996 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2998 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3000 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2996;
        out.m_107.y = _2998;
        out.m_107.z = _3000;
    }
    out.m_77.x = _2912;
    out.m_77.y = _2914;
    out.m_77.z = _2916;
    if (!_2898)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3002 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3002;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

