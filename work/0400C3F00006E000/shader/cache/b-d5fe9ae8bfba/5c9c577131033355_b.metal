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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_79 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_87 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2818 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3128 = as_type<float>(_132);
        out.gl_Position.z = _3128;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_112);
    bool _148 = _116 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _124;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3183 = as_type<float>(_158);
        out.gl_Position.z = _3183;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _164 = _116 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _192 = int(_190);
    float _194 = in.m_55.y;
    float _196 = in.m_53.y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _200 = _198 != 0;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _204 = int(_202);
    float _206 = in.m_53.x;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _210 = _208 != 0;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _214 = _212 != 0;
    float _216 = in.m_55.x;
    float _218 = float(_192);
    float _220 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _222 = int(_220);
    float _224 = in.m_53.z;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _230 = 1.0 / _218;
    float _232 = float(_204);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _242 = _196 > 0.5;
    float _244 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _246 = int(_244);
    float _248 = float(uint(_222));
    float _250 = 0.0;
    bool _252 = _242;
    float _254 = _194;
    if (!_200)
    {
        _250 = _216;
    }
    float _256 = _250;
    float _258 = 1.0 / _232;
    float _260 = _116 * _230;
    bool _262 = _224 > 0.5;
    float _264 = 1.0 / _248;
    float _266 = float(uint(_246));
    float _268 = float(_246);
    float _270 = trunc(_260);
    int _272 = int(_270);
    float _274 = _116 * _258;
    int _276 = ~_222;
    int _278 = _276 + 1;
    float _280 = 1.0 / _266;
    int _282 = as_type<int>(_264) + (-2);
    float _284 = trunc(_274);
    int _286 = int(_284);
    float _288 = float(uint(_272));
    float _290 = as_type<float>(_282) * _288;
    int _292 = as_type<int>(_280) + (-2);
    float _294 = 1.0 / _236;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _298 = _296 != 0;
    float _300 = float(uint(_286));
    float _302 = trunc(_290);
    float _304 = precise::max(_302, 0.0);
    uint _307 = uint(_304);
    float _309 = as_type<float>(_292) * _300;
    float _311 = trunc(_309);
    float _313 = precise::max(_311, 0.0);
    uint _315 = uint(_313);
    float _317 = 0.0;
    float _319 = _256;
    if (_298)
    {
        _317 = 1.0;
    }
    float _321 = _317;
    int _323 = 0;
    float _325 = _321;
    if (_298)
    {
        _323 = 0;
    }
    int _327 = _323;
    float _329 = 0.0;
    int _331 = _327;
    if (_298)
    {
        _329 = _206;
    }
    float _333 = _329;
    int _335 = _278 * int(_307);
    int _337 = _335 + _272;
    float _339 = -_194;
    float _341 = _339 + 1.0;
    float _343 = 0.0;
    float _345 = _333;
    if (_298)
    {
        _343 = 1.0;
    }
    float _347 = _343;
    float _349 = 1.0 / _240;
    float _351 = _347;
    if (!_298)
    {
        _325 = 7.345489978790283203125;
    }
    float _353 = _325;
    float _355 = float(uint(_337));
    int _357 = ~_246;
    int _359 = _357 + 1;
    int _361 = _242 ? as_type<int>(_341) : as_type<int>(_194);
    float _363 = as_type<float>(_282) * _355;
    if (_200)
    {
        bool _365 = _206 > 0.5;
        _252 = _365;
    }
    bool _367 = _252;
    int _369 = _359 * int(_315);
    int _371 = _369 + _286;
    float _373 = _214 ? as_type<float>(_361) : _194;
    float _375 = trunc(_363);
    float _377 = precise::max(_375, 0.0);
    uint _379 = uint(_377);
    int _381 = _371;
    if (_210)
    {
        float _383 = _262 ? _341 : _194;
        _254 = _383;
    }
    float _385 = _254;
    float _387 = float(uint(_371));
    if (_200)
    {
        float _389 = -_216;
        float _391 = _389 + 1.0;
        _381 = as_type<int>(_391);
    }
    int _393 = _381;
    if (!_298)
    {
        _331 = 2;
    }
    int _395 = _331;
    if (!_298)
    {
        _345 = _196;
    }
    float _397 = _345;
    float _399 = as_type<float>(_292) * _387;
    if (_200)
    {
        float _401 = _367 ? as_type<float>(_393) : _216;
        _319 = _401;
    }
    float _403 = _319;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _407 = _405 != 0;
    float _409 = trunc(_399);
    float _411 = precise::max(_409, 0.0);
    uint _413 = uint(_411);
    int _415 = ~_222;
    int _417 = _415 + 1;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _425 = _423 != 0;
    int _427 = int(_307) + int(_379);
    float _429 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _433 = _431 != 0;
    float _435 = in.m_57.w;
    int _437 = ~_246;
    int _439 = _437 + 1;
    int _441 = _417 * _427;
    int _443 = _441 + _272;
    bool _445 = !_433;
    int _447 = _445 ? 0 : 1;
    float _449 = -_228;
    float _451 = fma(_429, 2.0, _449);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _455 = _453 != 0;
    bool _457 = uint(_443) >= uint(_222);
    float _459 = -_116;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[76].x, _451);
    int _463 = int(_315) + int(_413);
    float _465 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _467 = !_425;
    int _469 = _467 ? 0 : 1;
    float _471 = fma(_465, -2.0, _226);
    bool _473 = !_421;
    int _475 = _473 ? 0 : 1;
    int _477 = _439 * _463;
    int _479 = _477 + _286;
    bool _481 = !_455;
    int _483 = _481 ? 0 : 1;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _495 = _493 != 0;
    out.m_59.w = _435;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _499 = _497 != 0;
    if (!_298)
    {
        _351 = 1.2345600128173828125;
    }
    float _501 = _351;
    bool _503 = !_457;
    int _505 = _503 ? 0 : (-1);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _513 = _511 != 0;
    bool _515 = !_499;
    int _517 = _515 ? 0 : 1;
    bool _519 = uint(_479) >= uint(_246);
    float _521 = in.m_44.x;
    float _523 = in.m_44.y;
    float _525 = in.m_44.z;
    bool _527 = !_407;
    int _529 = _527 ? 0 : 1;
    bool _531 = !_519;
    int _533 = _531 ? 0 : (-1);
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _541 = _539 != 0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _549 = !_513;
    int _551 = _549 ? 0 : 1;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _555 = _222 == 0;
    float _557 = 1.0 / _545;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _563 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _571 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _573 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _575 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
    float _577 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[5].x, _571);
    float _579 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[6].x, _573);
    float _581 = _353 * _206;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    out.m_61.x = _563;
    out.m_61.y = _565;
    out.m_61.z = _567;
    out.m_61.w = _561;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _587;
    float _591 = floor(_581);
    float _593 = _585 * _557;
    float _595 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[4].z, _575);
    float _597 = float(_272);
    float _599 = _397 * _501;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = _589 * _349;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _609 = _188 + _607;
    int _611 = abs(_529);
    float _613 = _603 * _294;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _617 = _188 + _615;
    int _619 = abs(_469);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _188 + _621;
    float _625 = float(_222);
    float _627 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[5].z, _577);
    float _629 = fma(_605, _617, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _631 = fma(_593, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _633 = _597 >= _625;
    bool _635 = isnan(_597);
    bool _637 = _633 || _635;
    bool _639 = isnan(_625);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = floor(_599);
    float _647 = -_591;
    float _649 = _581 + _647;
    int _651 = ~_427;
    int _653 = _651 + _505;
    int _655 = _653 + 1;
    float _657 = fma(_613, _609, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _659 = float(_286);
    float _661 = _625 * _649;
    float _663 = _164 * _625;
    int _665 = _222 * _655;
    int _667 = _665 + _272;
    float _669 = trunc(_643);
    int _671 = int(_669);
    bool _673 = _659 >= _268;
    bool _675 = isnan(_659);
    bool _677 = _673 || _675;
    bool _679 = isnan(_268);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _164 * _268;
    float _687 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[6].z, _579);
    bool _689 = !_555;
    int _691 = _689 ? _667 : (-1);
    float _693 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _695 = ~_463;
    int _697 = _695 + _533;
    int _699 = _697 + 1;
    float _701 = trunc(_683);
    int _703 = int(_701);
    float _705 = -_645;
    float _707 = _599 + _705;
    bool _709 = !_537;
    int _711 = _709 ? 0 : 1;
    int _713 = _246 * _699;
    int _715 = _713 + _286;
    bool _717 = _246 == 0;
    float _719 = _268 * _707;
    bool _721 = !_509;
    int _723 = _721 ? 0 : 1;
    float _725 = trunc(_661);
    int _727 = int(_725);
    int _729 = ~_671;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    bool _735 = _395 != 2;
    int _737 = _222 + (-1);
    int _739 = _691 * _733;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = trunc(_685);
    int _745 = int(_743);
    int _747 = ~_703;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _755 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _471);
    bool _757 = !_717;
    int _759 = _757 ? _715 : (-1);
    float _761 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _763 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _753);
    int _765 = _246 + (-1);
    float _767 = trunc(_719);
    int _769 = int(_767);
    int _771 = abs(_551);
    float _773 = -_755;
    float _775 = fma(_763, _761, _773);
    int _777 = _727 * _611;
    int _779 = _777 + _272;
    int _781 = abs(_517);
    int _783 = _759 * _751;
    int _785 = abs(_475);
    int _787 = _671 * _737;
    int _789 = _787 + _739;
    float _791 = trunc(_663);
    int _793 = int(_791);
    int _795 = _703 * _765;
    int _797 = _795 + _783;
    int _799 = abs(_723);
    int _801 = _769 * _781;
    int _803 = _801 + _286;
    int _805 = _789 * _619;
    int _807 = _797 * _771;
    int _809 = abs(_483);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _813 = abs(_711);
    int _815 = _745 * _799;
    int _817 = _815 + _807;
    int _819 = _793 * _785;
    int _821 = _819 + _805;
    int _823 = abs(_447);
    int _825 = _803 * _813;
    int _827 = _825 + _817;
    bool _829 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _831 = isnan(_188);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    int _841 = _779 * _809;
    int _843 = _841 + _821;
    bool _845 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _847 = isnan(_188);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    int _857 = _711;
    float _859 = _719;
    float _861 = _579;
    float _863 = as_type<float>(_739);
    float _865 = _763;
    if (_487)
    {
        float _867 = -_216;
        float _869 = _867 + 1.0;
        _857 = as_type<int>(_869);
    }
    int _871 = _857;
    bool _873 = !_541;
    int _875 = _873 ? 0 : 1;
    float _877 = -_839;
    float _879 = _877 + 1.0;
    int _881 = _727 * _823;
    int _883 = _881 + _843;
    bool _885 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _887 = isnan(_188);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -_855;
    float _899 = _897 + 1.0;
    int _901 = abs(_875);
    float _903 = _855 * _879;
    bool _905 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _907 = isnan(_188);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _895 * _899;
    float _919 = -_895;
    float _921 = _919 + 1.0;
    int _923 = _769 * _901;
    int _925 = _923 + _827;
    float _927 = float(uint(_883));
    float _929 = _811 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _931 = _915 * _921;
    bool _933 = _196 > 0.5;
    float _935 = float(uint(_925));
    float _937 = as_type<float>(_282) * _927;
    float _939 = fma(_929, _385, -0.5);
    float _941 = _899;
    float _943 = _915;
    if (!_487)
    {
        _941 = _216;
    }
    float _945 = _941;
    float _947 = _631 * _931;
    float _949 = as_type<float>(_292) * _935;
    float _951 = trunc(_937);
    float _953 = precise::max(_951, 0.0);
    uint _955 = uint(_953);
    float _957 = _945;
    if (_487)
    {
        float _959 = _933 ? as_type<float>(_871) : _216;
        _957 = _959;
    }
    float _961 = _957;
    float _963 = -_915;
    float _965 = _963 + 1.0;
    int _967 = ~_222;
    int _969 = _967 + 1;
    if (_735)
    {
        _943 = _206;
    }
    float _971 = _943;
    float _973 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[115].x, _947);
    float _975 = _971;
    if (!_735)
    {
        _975 = _224;
    }
    float _977 = _975;
    float _979 = trunc(_949);
    float _981 = precise::max(_979, 0.0);
    uint _983 = uint(_981);
    float _985 = fma(_657, _917, _973);
    float _987 = float(uint(_779));
    float _989 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _991 = ~_246;
    int _993 = _991 + 1;
    float _995 = fma(_629, _903, _985);
    int _997 = _969 * int(_955);
    int _999 = _997 + _883;
    float _1001 = as_type<float>(_282) * _987;
    float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1005 = _977 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1007 = float(uint(_999));
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1011 = _993 * int(_983);
    int _1013 = _1011 + _925;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1017 = trunc(_1001);
    float _1019 = precise::max(_1017, 0.0);
    uint _1021 = uint(_1019);
    float _1023 = as_type<float>(_282) * _1007;
    float _1025 = float(uint(_803));
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1029 = float(uint(_1013));
    float _1031 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1015);
    int _1033 = ~_222;
    int _1035 = _1033 + 1;
    float _1037 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1009);
    float _1039 = trunc(_1023);
    float _1041 = precise::max(_1039, 0.0);
    uint _1043 = uint(_1041);
    float _1045 = as_type<float>(_292) * _1029;
    float _1047 = _1009;
    if (_735)
    {
        _1047 = _196;
    }
    float _1049 = _1047;
    float _1051 = as_type<float>(_292) * _1025;
    float _1053 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1027);
    float _1055 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1057 = _1049;
    if (!_735)
    {
        _1057 = _206;
    }
    float _1059 = _1057;
    float _1061 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1031);
    float _1063 = trunc(_1045);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    int _1069 = _1035 * int(_1021);
    int _1071 = _1069 + _779;
    float _1073 = fma(_1055, _961, -0.5);
    float _1075 = fma(_1061, _989, _461);
    int _1077 = ~_222;
    int _1079 = _1077 + 1;
    float _1081 = float(uint(_1071));
    float _1083 = trunc(_1051);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    int _1089 = int(_955) + int(_1043);
    float _1091 = as_type<float>(_282) * _1081;
    int _1093 = ~_246;
    int _1095 = _1093 + 1;
    int _1097 = _1079 * _1089;
    int _1099 = _1097 + _883;
    int _1101 = int(_983) + int(_1067);
    float _1103 = trunc(_1091);
    float _1105 = precise::max(_1103, 0.0);
    uint _1107 = uint(_1105);
    int _1109 = ~_246;
    int _1111 = _1109 + 1;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1115 = uint(_1099) >= uint(_222);
    int _1117 = _1095 * _1101;
    int _1119 = _1117 + _925;
    float _1121 = -_1113;
    float _1123 = fma(_1005, 2.0, _1121);
    int _1125 = _1111 * int(_1087);
    int _1127 = _1125 + _803;
    float _1129 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1131 = uint(_1119) >= uint(_246);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1135 = !_1115;
    int _1137 = _1135 ? 0 : (-1);
    float _1139 = -_116;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1123);
    float _1143 = float(uint(_1127));
    float _1145 = fma(_1129, -2.0, _1133);
    bool _1147 = !_1131;
    int _1149 = _1147 ? 0 : (-1);
    float _1151 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[118].x, _995);
    int _1153 = ~_1089;
    int _1155 = _1153 + _1137;
    int _1157 = _1155 + 1;
    float _1159 = as_type<float>(_292) * _1143;
    int _1161 = ~_1101;
    int _1163 = _1161 + _1149;
    int _1165 = _1163 + 1;
    float _1167 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1053);
    int _1169 = int(_1021) + int(_1107);
    int _1171 = _222 * _1157;
    int _1173 = _1171 + _883;
    float _1175 = trunc(_1159);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = _246 * _1165;
    int _1183 = _1181 + _925;
    int _1185 = ~_222;
    int _1187 = _1185 + 1;
    float _1189 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1037);
    bool _1191 = !_555;
    int _1193 = _1191 ? _1173 : (-1);
    float _1195 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1145);
    bool _1197 = !_717;
    int _1199 = _1197 ? _1183 : (-1);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _693 + _1201;
    float _1205 = fma(_1167, _1073, _1141);
    int _1207 = _1193 >> 31;
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1211 = _1199 >> 31;
    int _1213 = _1187 * _1169;
    int _1215 = _1213 + _779;
    int _1217 = _1193 & 3;
    int _1219 = _1207 & 3;
    int _1221 = _1211 & 3;
    int _1223 = int(_1087) + int(_1179);
    bool _1225 = uint(_1217) > 1u;
    int _1227 = _1193 & 3;
    bool _1229 = _1227 != 0;
    int _1231 = _1193 + _1219;
    int _1233 = _1199 + _1221;
    int _1235 = _1231 >> 2;
    int _1237 = _1233 >> 2;
    int _1239 = _1229 ? 0 : 1;
    int _1241 = _1237 << 4;
    int _1243 = _1241 + 512;
    float _1245 = _687 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1247 = _1235 << 4;
    int _1249 = _1247 + 368;
    float _1251 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1253 = ~_1239;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    uint _1259 = uint(int(uint(_1243) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    bool _1275 = uint(_1215) >= uint(_222);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1279 = _1251 + _1277;
    int _1281 = _1257;
    if (!_1225)
    {
        int _1283 = ~_1239;
        int _1285 = _1283 + 1;
        _1281 = _1285;
    }
    int _1287 = _1281;
    int _1289 = _1199 & 3;
    float _1291 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1209);
    bool _1293 = !_1275;
    int _1295 = _1293 ? 0 : (-1);
    uint _1297 = uint(int(uint(_1249) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[int(_1307)][_1309];
    bool _1313 = uint(_1217) >= 2u;
    bool _1315 = uint(_1289) > 1u;
    int _1317 = ~_1169;
    int _1319 = _1317 + _1295;
    int _1321 = _1319 + 1;
    int _1323 = _1313 ? 0 : 1;
    int _1325 = _1249 + 8;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    uint _1329 = uint(int(uint(int(_1327)) >> uint(2)));
    int _1331 = int(_1327) & 3;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[int(_1329)][_1331];
    int _1335 = int(_1327) + 1;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    int _1339 = _1335 & 3;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[int(_1337)][_1339];
    int _1343 = _1199 & 3;
    bool _1345 = _1343 != 0;
    int _1347 = _222 * _1321;
    int _1349 = _1347 + _779;
    bool _1351 = !_1229;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1245 + _1355;
    int _1359 = _1345 ? 0 : 1;
    bool _1361 = _1217 != 3;
    int _1363 = _1243 + 8;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    int _1381 = ~_1359;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1291);
    int _1389 = _1385;
    if (!_1315)
    {
        int _1391 = ~_1359;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    bool _1397 = uint(_1289) >= 2u;
    int _1399 = abs(_1395);
    bool _1401 = !_1345;
    int _1403 = _1401 ? 0 : 1;
    int _1405 = abs(_1353);
    bool _1407 = _1217 != 3;
    int _1409 = ~_1323;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    int _1415 = abs(_1287);
    int _1417 = _1413;
    if (_1361)
    {
        int _1419 = ~_1323;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    int _1425 = _1397 ? 0 : 1;
    bool _1427 = _1289 != 3;
    int _1429 = ~_1399;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    int _1435 = abs(_1403);
    int _1437 = ~_1415;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    int _1443 = _1433 * as_type<int>(_1273);
    int _1445 = abs(_1423);
    int _1447 = ~_1405;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    int _1453 = _1441 * as_type<int>(_1311);
    int _1455 = ~_246;
    int _1457 = _1455 + 1;
    int _1459 = _1451 * as_type<int>(_1303);
    int _1461 = _1459 + _1453;
    int _1463 = _1457 * _1223;
    int _1465 = _1463 + _803;
    int _1467 = ~_1435;
    int _1469 = _1467 + 1;
    int _1471 = _1469 + 1;
    int _1473 = ~_1445;
    int _1475 = _1473 + 1;
    int _1477 = _1475 + 1;
    int _1479 = ~_1425;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    int _1485 = _1471 * as_type<int>(_1265);
    int _1487 = _1485 + _1443;
    bool _1489 = !_491;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1477 * as_type<int>(_1333);
    int _1495 = _1493 + _1461;
    bool _1497 = _1289 != 3;
    int _1499 = _1483;
    if (_1427)
    {
        int _1501 = ~_1425;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    bool _1507 = uint(_1465) >= uint(_246);
    bool _1509 = !_1407;
    int _1511 = _1509 ? 0 : (-1);
    int _1513 = abs(_1505);
    bool _1515 = !_495;
    int _1517 = _1515 ? 0 : 1;
    bool _1519 = !_1497;
    int _1521 = _1519 ? 0 : (-1);
    bool _1523 = !_1507;
    int _1525 = _1523 ? 0 : (-1);
    int _1527 = abs(_1511);
    int _1529 = abs(_1491);
    int _1531 = abs(_1521);
    int _1533 = ~_1513;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    int _1539 = abs(_1517);
    int _1541 = ~_1223;
    int _1543 = _1541 + _1525;
    int _1545 = _1543 + 1;
    int _1547 = _1537 * as_type<int>(_1371);
    int _1549 = _1547 + _1487;
    int _1551 = ~_1527;
    int _1553 = _1551 + 1;
    int _1555 = _1553 + 1;
    int _1557 = _246 * _1545;
    int _1559 = _1557 + _803;
    int _1561 = ~_1531;
    int _1563 = _1561 + 1;
    int _1565 = _1563 + 1;
    int _1567 = _1555 * as_type<int>(_1341);
    int _1569 = _1567 + _1495;
    int _1571 = ~_1529;
    int _1573 = _1571 + 1;
    int _1575 = _1573 + 1;
    float _1577 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1579 = ~_1539;
    int _1581 = _1579 + 1;
    int _1583 = _1581 + 1;
    int _1585 = _1565 * as_type<int>(_1379);
    int _1587 = _1585 + _1549;
    bool _1589 = _1387 >= 0.0;
    int _1591 = _1569 * _1575;
    bool _1593 = !_717;
    int _1595 = _1593 ? _1559 : (-1);
    int _1597 = _1587 * _1583;
    bool _1599 = !_555;
    int _1601 = _1599 ? _1349 : (-1);
    float _1603 = -_1195;
    float _1605 = fma(_1189, _939, _1603);
    int _1607 = _1595 * _1539;
    int _1609 = _1607 + _1597;
    float _1611 = _1203 * _1203;
    int _1613 = _1601 * _1529;
    int _1615 = _1613 + _1591;
    float _1617 = fma(_1279, _1279, _1611);
    float _1619 = as_type<float>(_1587);
    float _1621 = as_type<float>(_1609);
    if (_1589)
    {
        _1619 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1623 = _1619;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1629 = fma(_1357, _1357, _1617);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1633 = _775 + 0.5;
    float _1635 = _1075 + 0.5;
    float _1637 = rsqrt(_1629);
    float _1639 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1205 + 0.5;
    float _1647 = _1605 + 0.5;
    int _1649 = as_type<int>(_1623);
    if (_1589)
    {
        float _1651 = _1623 * 5.0;
        _1649 = as_type<int>(_1651);
    }
    int _1653 = _1649;
    float _1655 = float(_1615);
    out.m_63.x = _1635;
    out.m_63.y = _1633;
    float _1657 = float(_1609);
    out.m_65.x = _1639;
    out.m_65.y = _1641;
    out.m_65.z = _1643;
    out.m_65.w = _1577;
    float _1659 = _1203 * _1637;
    if (_1589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5385 = as_type<float>(_1653);
        out.gl_Position.z = _5385;
    }
    float _1661 = _1279 * _1637;
    out.m_67.x = _1645;
    out.m_67.y = _1647;
    out.m_69.x = _1655;
    out.m_69.y = _1657;
    if (_1589)
    {
        out.m_51.x = 0.0;
    }
    if (_1589)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1663 = -_1659;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1667 = _1357 * _1637;
    float _1669 = -_1661;
    float _1671 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1675 = _1665 + _1673;
    float _1677 = -_1667;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1683 = _1671 + _1681;
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1679 + _1687;
    float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1685);
    float _1693 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1691);
    bool _1695 = _1693 >= 0.0;
    if (_1695)
    {
        _1621 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1697 = _1621;
    int _1699 = as_type<int>(_1697);
    if (_1695)
    {
        out.m_51.x = 0.0;
    }
    if (_1695)
    {
        float _1701 = _1697 * 5.0;
        _1699 = as_type<int>(_1701);
    }
    int _1703 = _1699;
    if (_1695)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5490 = as_type<float>(_1703);
        out.gl_Position.z = _5490;
    }
    if (_1695)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1705 = -_693;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1709 = -_1251;
    float _1711 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1713 = -_1245;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1717 = -_1659;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1721 = _1707 * _1707;
    float _1723 = -_1661;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1727 = in.m_71.x;
    float _1729 = in.m_71.y;
    float _1731 = in.m_71.z;
    float _1733 = _1719 * _1719;
    float _1735 = fma(_1711, _1711, _1721);
    float _1737 = -_1667;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1741 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1743 = fma(_1725, _1725, _1733);
    float _1745 = fma(_1715, _1715, _1735);
    float _1747 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1741);
    float _1749 = fma(_1739, _1739, _1743);
    bool _1751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    float _1761 = rsqrt(_1745);
    float _1763 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    bool _1765 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1767 = isnan(0.5);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1773 = _1769 || _1771;
    float _1775 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1777 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1779 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1781 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1783 = _1711 * _1761;
    float _1785 = _1715 * _1761;
    float _1787 = _1707 * _1761;
    float _1789 = _1781 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1793 = _1783 * _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = _1785 * _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1801 = _1787 * _1799;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1805 = -_1793;
    float _1807 = fma(_1785, _1803, _1805);
    float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1811 = -_1797;
    float _1813 = fma(_1787, _1809, _1811);
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1817 = -_1801;
    float _1819 = fma(_1783, _1815, _1817);
    float _1821 = in.m_73.x;
    float _1823 = in.m_73.y;
    float _1825 = in.m_73.z;
    float _1827 = _1807 * _1807;
    float _1829 = sqrt(_1749);
    float _1831 = _1777 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1833 = fma(_1813, _1813, _1827);
    float _1835 = fma(_1819, _1819, _1833);
    float _1837 = rsqrt(_1835);
    float _1839 = _1637 * _1829;
    float _1841 = _1779 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1843 = _1839 * _1831;
    float _1845 = _1839 * _1841;
    float _1847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1823);
    float _1849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1821);
    float _1851 = _1847 * _1843;
    float _1853 = _1813 * _1837;
    float _1855 = _1807 * _1837;
    float _1857 = _1819 * _1837;
    float _1859 = _1849 * _1845;
    float _1861 = _1787 * _1853;
    float _1863 = _1785 * _1855;
    float _1865 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1825);
    float _1867 = _1839 * _1789;
    float _1869 = -_1861;
    float _1871 = fma(_1783, _1855, _1869);
    float _1873 = -_1863;
    float _1875 = fma(_1787, _1857, _1873);
    float _1877 = _1783 * _1857;
    float _1879 = _1865 * _1867;
    float _1881 = _1851 * _1871;
    float _1883 = _1851 * _1875;
    float _1885 = -_1877;
    float _1887 = fma(_1785, _1853, _1885);
    float _1889 = fma(_1859, _1857, _1881);
    float _1891 = fma(_1859, _1853, _1883);
    float _1893 = fma(_1879, _1785, _1889);
    float _1895 = fma(_1879, _1783, _1891);
    float _1897 = _1245 + _1893;
    float _1899 = _1251 + _1895;
    float _1901 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1905 = _1897 + _1903;
    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1909 = _1899 + _1907;
    float _1911 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1901);
    float _1913 = _1851 * _1887;
    float _1915 = _1905 * _1905;
    float _1917 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1919 = fma(_1859, _1855, _1913);
    float _1921 = fma(_1909, _1909, _1915);
    float _1923 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1925 = fma(_1879, _1787, _1919);
    float _1927 = sqrt(_1921);
    float _1929 = _1775 + _1923;
    float _1931 = _693 + _1925;
    float _1933 = 1.0 / _1923;
    bool _1935 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1937 = _1925;
    float _1939 = _1919;
    float _1941 = _1931;
    float _1943 = _1899;
    float _1945 = _1929;
    float _1947 = _1905;
    float _1949 = _1909;
    if (!_1935)
    {
        _1937 = _1899;
    }
    float _1951 = _1937;
    float _1953 = _1951;
    if (!_1935)
    {
        _1939 = _1897;
    }
    float _1955 = _1939;
    bool _1957 = !_1935;
    float _1959 = _1955;
    if (!_1957)
    {
        float _1961 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1965 = _1927 + _1963;
        float _1967 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1969 = rsqrt(_1921);
        float _1971 = _1965 * _1961;
        float _1973 = _1971 * 0.15915493667125701904296875;
        float _1975 = _1973 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        float _1979 = _1973 * 6.283185482025146484375;
        float _1981 = sin(_1979);
        float _1983 = _1977 + (-1.0);
        float _1985 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1987 = fma(_1981, _1967, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1989 = fma(_1931, _1977, _1985);
        float _1991 = _1969 * _1987;
        float _1993 = fma(_1909, _1991, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1995 = fma(_1905, _1991, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1959 = _1995;
        _1941 = _1989;
        _1953 = _1993;
        _1943 = _1985;
    }
    float _1997 = _1959;
    float _1999 = _1941;
    float _2001 = _1953;
    float _2003 = _1943;
    float _2005 = -_1667;
    float _2007 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1997);
    float _2009 = -_1659;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1999);
    float _2013 = _1929 * _1933;
    float _2015 = _2013 * 0.5;
    float _2017 = -_1661;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2001);
    float _2021 = _2003;
    float _2023 = _2011;
    float _2025 = _2019;
    float _2027 = _2015;
    float _2029 = _2001;
    if (_1773)
    {
        _2021 = 1.0;
    }
    float _2031 = _2021;
    float _2033 = _2031;
    if (_1759)
    {
        _1945 = _2007;
    }
    float _2035 = _1945;
    float _2037 = _2035;
    if (!_1759)
    {
        float _2039 = _1675 * _1675;
        float _2041 = 1.0 / _1839;
        float _2043 = -_1251;
        float _2045 = _2043 + _2001;
        float _2047 = -_693;
        float _2049 = _2047 + _1999;
        float _2051 = fma(_1683, _1683, _2039);
        float _2053 = -_1245;
        float _2055 = _2053 + _1997;
        float _2057 = fma(_1689, _1689, _2051);
        float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2061 = sqrt(_2057);
        float _2063 = precise::min(_2061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2059;
        float _2067 = _2065 * _2041;
        float _2069 = fma(_2045, _2067, _1671);
        float _2071 = fma(_2049, _2067, _1665);
        float _2073 = fma(_2055, _2067, _1679);
        _2023 = _2071;
        _2025 = _2069;
        _2037 = _2073;
        _1947 = _2059;
        _1949 = _2067;
    }
    float _2075 = _2023;
    float _2077 = _2025;
    float _2079 = _2037;
    float _2081 = _1947;
    float _2083 = _1949;
    float _2085 = _2081;
    float _2087 = _2083;
    if (!_1773)
    {
        float _2089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2091 = _2089 * 0.15915493667125701904296875;
        float _2093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2097 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2095);
        float _2099 = _2091 * 6.283185482025146484375;
        float _2101 = cos(_2099);
        float _2103 = _2093 * 0.15915493667125701904296875;
        float _2105 = _2091 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        float _2109 = 1.0 / _2101;
        float _2111 = _2103 * 6.283185482025146484375;
        float _2113 = cos(_2111);
        float _2115 = _2107 * _2109;
        float _2117 = _2103 * 6.283185482025146484375;
        float _2119 = sin(_2117);
        float _2121 = _2113 * _2115;
        float _2123 = 1.0 / _2097;
        float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2127 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2125;
        float _2129 = 1.0 / _2121;
        float _2131 = 1.0 / _2127;
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2135 = _2123 * _2133;
        float _2137 = _2119 * _2129;
        float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2141 = fma(_2137, _2135, _2139);
        float _2143 = _2141 * _2131;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2085 = _2131;
        _2087 = _2103;
        _2027 = _2123;
        _2033 = _2145;
    }
    float _2147 = _2085;
    float _2149 = _2087;
    float _2151 = _2027;
    float _2153 = _2033;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2157 = _2075 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2161 = _2077 + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2165 = _2079 + _2163;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = sqrt(_2171);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2161 * _2177;
    float _2181 = _2165 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2147;
    float _2199 = _2195;
    float _2201 = _2157;
    float _2203 = _2151;
    float _2205 = _2179;
    if (_2191)
    {
        float _2207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2207;
    }
    float _2209 = _2197;
    float _2211 = _2209;
    if (_2191)
    {
        float _2213 = _2195 * _2209;
        _2199 = _2213;
    }
    float _2215 = _2199;
    if (_2191)
    {
        float _2217 = rsqrt(_2187);
        _2211 = _2217;
    }
    float _2219 = _2211;
    float _2221 = _2219;
    if (_2191)
    {
        float _2223 = _2215 * 0.15915493667125701904296875;
        _2029 = _2223;
    }
    float _2225 = _2029;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = _2165;
    if (_2191)
    {
        float _2231 = _2225 * 6.283185482025146484375;
        float _2233 = sin(_2231);
        _2229 = _2233;
    }
    float _2235 = _2229;
    float _2237 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2239 = precise::max(0.0, _2227);
    float _2241 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2237);
    float _2243 = _2149;
    float _2245 = _2239;
    if (_2191)
    {
        float _2247 = _2225 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = -_2177;
    float _2255 = -_2239;
    float _2257 = fma(_2157, _2253, _2255);
    if (_2191)
    {
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2259;
    }
    float _2261 = _2201;
    float _2263 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2265 = _2235;
    float _2267 = _2261;
    if (_2191)
    {
        float _2269 = fma(_2235, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = _2271;
    if (!_2191)
    {
        _2267 = _2257;
    }
    float _2275 = _2267;
    float _2277 = _2275;
    if (_2191)
    {
        float _2279 = _2219 * _2271;
        _2203 = _2279;
    }
    float _2281 = _2203;
    if (!_2191)
    {
        _2273 = _2183;
    }
    float _2283 = _2273;
    float _2285 = _2283;
    float _2287 = _2251;
    if (_2191)
    {
        float _2289 = _2251 + (-1.0);
        _2245 = _2289;
    }
    float _2291 = _2245;
    float _2293 = _2291;
    if (_2191)
    {
        float _2295 = _2179 * _2281;
        _2205 = _2295;
    }
    float _2297 = _2205;
    if (_2191)
    {
        float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2299;
    }
    float _2301 = _2221;
    if (!_2191)
    {
        _2293 = _2181;
    }
    float _2303 = _2293;
    float _2305 = _2303;
    if (_2191)
    {
        float _2307 = _2181 * _2281;
        _2305 = _2307;
    }
    float _2309 = _2305;
    if (_2191)
    {
        float _2311 = _2297 * _2297;
        _2285 = _2311;
    }
    float _2313 = _2285;
    if (_2191)
    {
        float _2315 = fma(_2257, _2251, _2301);
        _2277 = _2315;
    }
    float _2317 = _2277;
    if (!_2191)
    {
        _2287 = _2185;
    }
    float _2319 = _2287;
    float _2321 = _2319;
    if (_2191)
    {
        float _2323 = _2309 * _2309;
        _2321 = _2323;
    }
    float _2325 = _2321;
    float _2327 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2329 = fma(_2317, _2317, _2313);
    float _2331 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2327);
    float _2333 = _2329 + _2325;
    float _2335 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2339 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2337);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2331);
    float _2345 = rsqrt(_2333);
    float _2347 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2349 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2335);
    float _2351 = -_2341;
    float _2353 = _2351 + 1.0;
    float _2355 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2357 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2347);
    float _2359 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2349);
    float _2361 = abs(_2353);
    float _2363 = log2(_2361);
    float _2365 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2357);
    float _2367 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2369 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2371 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2373 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2375 = -_2369;
    float _2377 = fma(_2375, _2263, 1.0);
    float _2379 = _2345 * _2297;
    float _2381 = _2345 * _2317;
    float _2383 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2241);
    float _2385 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2373);
    float _2387 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2389 = _2345 * _2309;
    float _2391 = _2383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2393 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2385);
    float _2395 = -_2387;
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2395);
    float _2399 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2401 = log2(_2377);
    float _2403 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2393);
    float _2405 = -_2389;
    float _2407 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2397);
    float _2409 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2411 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2413 = fma(_2407, -0.5, 0.5);
    float _2415 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2409);
    float _2417 = 1.0 / _2403;
    float _2419 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2411);
    float _2421 = fma(_2407, 0.5, 0.5);
    float _2423 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2415);
    float _2425 = _2381 + 1.0;
    float _2427 = fma(_2421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2429 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2431 = exp2(_2399);
    float _2433 = _2401 * 0.693147182464599609375;
    float _2435 = fma(_2421, _2427, -0.212114393711090087890625);
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2439 = fma(_2421, _2435, 1.570728778839111328125);
    float _2441 = sqrt(_2413);
    float _2443 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2419);
    float _2445 = _2429 * _2417;
    float _2447 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2443);
    float _2449 = fma(_2445, 0.5, 0.5);
    float _2451 = -_2381;
    float _2453 = fma(_2431, _2425, _2451);
    float _2455 = _2447 * _2417;
    float _2457 = fma(_2453, 0.5, 0.5);
    float _2459 = fma(_2455, -0.5, 0.5);
    float _2461 = _2441 * 0.636619746685028076171875;
    float3 _6682 = float3(_2449, _2459, _2437);
    float _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6682, float3(0.0), isnan(_6682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6682, float3(0.0), isnan(_6682)), level(0.0)).x;
    float3 _6693 = float3(_2449, _2459, _2437);
    float4 _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6693, float3(0.0), isnan(_6693)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6693, float3(0.0), isnan(_6693)), level(0.0)).xyzw;
    float _2468 = _2466.x;
    float _2470 = _2466.y;
    float _2472 = _2466.z;
    float _2474 = _2466.w;
    float _2476 = -_2439;
    float _2478 = fma(_2461, _2476, 1.0);
    float2 _6715 = float2(_2478, _2457);
    float3 _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).xyz;
    float _2484 = _2482.x;
    float _2486 = _2482.y;
    float _2488 = _2482.z;
    float _2490 = in.m_75.x;
    float _2492 = in.m_75.y;
    float _2494 = in.m_75.z;
    bool _2496 = _1823 != 0.0;
    bool _2498 = isnan(_1823);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(0.0);
    bool _2504 = _2500 || _2502;
    float _2506 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2508 = in.m_77.x;
    float _2510 = in.m_77.y;
    float _2512 = in.m_77.z;
    float _2514 = in.m_77.w;
    bool _2516 = _1821 == 0.0;
    bool _2518 = !_2504;
    bool _2520 = _2516 && _2518;
    float _2522 = exp2(_2506);
    bool _2524 = _1825 == 0.0;
    bool _2526 = _2524 && _2520;
    float _2528 = _2449;
    float _2530 = _2459;
    float _2532 = _2403;
    float _2534 = _2429;
    float _2536 = _2447;
    if (_2526)
    {
        _859 = _2490;
    }
    float _2538 = _859;
    float _2540 = -_2522;
    float _2542 = _2540 + 1.0;
    float _2544 = _2538;
    if (_2526)
    {
        _861 = _2494;
    }
    float _2546 = _861;
    float _2548 = _2546;
    if (_2526)
    {
        _863 = _2492;
    }
    float _2550 = _863;
    float _2552 = _2550;
    if (_2526)
    {
        _865 = _2538;
    }
    float _2554 = _865;
    float _2556 = _2554;
    if (!_2526)
    {
        _2544 = _2490;
    }
    float _2558 = _2544;
    if (_2526)
    {
        _2528 = _2546;
    }
    float _2560 = _2528;
    float _2562 = _2560;
    if (_2526)
    {
        _2530 = _2550;
    }
    float _2564 = _2530;
    float _2566 = _2512 * _2558;
    float _2568 = _2564;
    if (!_2526)
    {
        _2548 = _2494;
    }
    float _2570 = _2548;
    if (!_2526)
    {
        float _2572 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2558);
        _2556 = _2572;
    }
    float _2574 = _2556;
    if (!_2526)
    {
        _2552 = _2492;
    }
    float _2576 = _2552;
    float _2578 = _2510 * _2570;
    float _2580 = -_2566;
    float _2582 = fma(_2508, _2570, _2580);
    float _2584 = _2508 * _2576;
    if (!_2526)
    {
        float _2586 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2576);
        _2568 = _2586;
    }
    float _2588 = _2568;
    float _2590 = -_2578;
    float _2592 = fma(_2512, _2576, _2590);
    float _2594 = _2582 * _2514;
    float _2596 = -_2584;
    float _2598 = fma(_2510, _2558, _2596);
    if (!_2526)
    {
        float _2600 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2570);
        _2562 = _2600;
    }
    float _2602 = _2562;
    float _2604 = _2592 * _2514;
    float _2606 = _1887 * _2510;
    float _2608 = _2598 * _2514;
    float _2610 = _1875 * _2510;
    float _2612 = _1871 * _2510;
    float _2614 = _2594 * _1887;
    float _2616 = _2594 * _1875;
    float _2618 = _2594 * _1871;
    float _2620 = _1875 * _2588;
    float _2622 = _1887 * _2588;
    float _2624 = fma(_1853, _2508, _2610);
    float _2626 = fma(_1855, _2508, _2606);
    float _2628 = fma(_1857, _2508, _2612);
    float _2630 = fma(_2604, _1855, _2614);
    float _2632 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2634 = fma(_2604, _1853, _2616);
    float _2636 = fma(_2604, _1857, _2618);
    float _2638 = fma(_1855, _2574, _2622);
    float _2640 = fma(_2608, _1787, _2630);
    float _2642 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2632);
    float _2644 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2646 = _1871 * _2588;
    float _2648 = fma(_1787, _2602, _2638);
    float _2650 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2642);
    float _2652 = fma(_1783, _2512, _2624);
    float _2654 = fma(_1787, _2512, _2626);
    float _2656 = fma(_1785, _2512, _2628);
    float _2658 = fma(_1857, _2574, _2646);
    float _2660 = fma(_2608, _1783, _2634);
    float _2662 = _2403 * 0.5;
    float _2664 = fma(_1853, _2574, _2620);
    out.m_79.x = _2652;
    out.m_79.y = _2654;
    out.m_79.z = _2656;
    float _2666 = fma(_1785, _2602, _2658);
    float _2668 = fma(_2447, -0.5, _2662);
    float _2670 = fma(_1783, _2602, _2664);
    bool _2672 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2674 = isnan(_2175);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2680 = _2676 || _2678;
    float _2682 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2650);
    float _2684 = _2429 + _2403;
    float _2686 = fma(_2608, _1785, _2636);
    out.m_81.x = _2670;
    out.m_81.y = _2648;
    out.m_81.z = _2666;
    float _2688 = _2682 + _2403;
    float _2690 = _2684 * 0.5;
    out.m_83.x = _2660;
    out.m_83.y = _2640;
    out.m_83.z = _2686;
    float _2692 = _2688 * 0.5;
    out.gl_Position.x = _2429;
    out.gl_Position.y = _2447;
    out.gl_Position.z = _2682;
    out.gl_Position.w = _2403;
    out.m_85.x = _2690;
    out.m_85.y = _2668;
    out.m_85.z = _2692;
    out.m_85.w = _2403;
    float _2694 = _2686;
    float _2696 = _2640;
    float _2698 = _2660;
    if (!_2680)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2700 = _2694;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2680)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2706 = _2696;
    float _2708 = _2706;
    float _2710 = _2706;
    if (!_2680)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2712 = _2698;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2680)
    {
        _2532 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2532;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2680)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2534;
    float _2726 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2680)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2732 = _2536;
    float _2734 = _2644 * _2463;
    float _2736 = -_2644;
    float _2738 = _2736 + 1.0;
    float _2740 = _2474 * _2734;
    float _2742 = _2488 * _2734;
    float _2744 = fma(_2484, _2740, _2468);
    float _2746 = fma(_2486, _2740, _2470);
    float _2748 = _2474 * _2738;
    float _2750 = fma(_2474, _2742, _2472);
    out.m_87.x = _2744;
    out.m_87.y = _2746;
    out.m_87.z = _2750;
    out.m_87.w = _2748;
    bool _2752 = !_2680;
    float _2754 = _2732;
    float _2756 = _2732;
    if (!_2752)
    {
        bool _2758 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2760 = isnan(_2175);
        bool _2762 = _2758 || _2760;
        bool _2764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2766 = _2762 || _2764;
        if (!_2766)
        {
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2770 = _2175 + _2768;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2774 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2772;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2784 = 1.0 / _2774;
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2798 = _2770 * _2784;
            float _2800 = precise::clamp(_2798, 0.0, 1.0);
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2806 = fma(_2800, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2808 = fma(_2800, _2782, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2810 = fma(_2800, _2804, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2812 = fma(_2800, _2788, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2814 = fma(_2800, _2792, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2816 = fma(_2800, _2796, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2710 = _2806;
            _2730 = _2814;
            _2704 = _2808;
            _2722 = _2812;
            _2716 = _2810;
            _2756 = _2816;
            _2818 = true;
        }
        else
        {
            bool _2820 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2822 = isnan(_2175);
            bool _2824 = _2820 || _2822;
            bool _2826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2828 = _2824 || _2826;
            if (!_2828)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2830 = _2720;
            _2722 = _2830;
            if (!_2828)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2832 = _2728;
            _2730 = _2832;
            if (!_2828)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2834 = _2754;
            _2756 = _2834;
            if (!_2828)
            {
                _2702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2836 = _2702;
            _2704 = _2836;
            if (!_2828)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2838 = _2708;
            _2710 = _2838;
            if (!_2828)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2840 = _2714;
            bool _2842 = !_2828;
            _2716 = _2840;
            if (!_2842)
            {
                bool _2844 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2846 = isnan(_2175);
                bool _2848 = _2844 || _2846;
                bool _2850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2852 = _2848 || _2850;
                if (!_2852)
                {
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2856 = _2175 + _2854;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2860 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2858;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2870 = 1.0 / _2860;
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2884 = _2856 * _2870;
                    float _2886 = precise::clamp(_2884, 0.0, 1.0);
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2892 = fma(_2886, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2894 = fma(_2886, _2868, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2896 = fma(_2886, _2890, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2898 = fma(_2886, _2874, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2900 = fma(_2886, _2878, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2902 = fma(_2886, _2882, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2710 = _2892;
                    _2730 = _2900;
                    _2704 = _2894;
                    _2722 = _2898;
                    _2716 = _2896;
                    _2756 = _2902;
                    _2818 = true;
                }
                else
                {
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2818 = false;
    float _2904 = _2710;
    float _2906 = _2730;
    float _2908 = _2704;
    float _2910 = _2722;
    float _2912 = _2716;
    float _2914 = _2756;
    float _2916 = fma(_2648, -0.5, 0.5);
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = -_2904;
    float _2922 = _2906 + _2920;
    float _2924 = _2726 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2926 = -_2908;
    float _2928 = _2910 + _2926;
    float _2930 = fma(_2918, _2922, _2904);
    out.m_89.x = 0.0;
    float _2932 = -_2912;
    float _2934 = _2914 + _2932;
    float _2936 = fma(_2918, _2928, _2908);
    float _2938 = _2930 * 0.586610972881317138671875;
    out.m_51.x = _2924;
    bool _2940 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2942 = fma(_2918, _2934, _2912);
    float _2944 = fma(_2936, 0.298911988735198974609375, _2938);
    bool _2946 = _2153 > 0.0;
    bool _2948 = isnan(_2153);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan(0.0);
    bool _2954 = _2950 || _2952;
    float _2956 = fma(_2942, 0.114477999508380889892578125, _2944);
    float _2958 = -_2956;
    float _2960 = _2936 + _2958;
    float _2962 = -_2956;
    float _2964 = _2930 + _2962;
    float _2966 = -_2956;
    float _2968 = _2942 + _2966;
    float _2970 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2972 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2974 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    bool _2976 = !_2940;
    if (!_2976)
    {
        float _2978 = -_2075;
        float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2982 = -_2077;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2986 = -_2079;
        float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2990 = _2980 * _2980;
        float _2992 = fma(_2984, _2984, _2990);
        float _2994 = fma(_2988, _2988, _2992);
        float _2996 = sqrt(_2994);
        float _2998 = rsqrt(_2994);
        float _3000 = -_2996;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3004 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3006 = precise::clamp(_3004, 0.0, 1.0);
        float _3008 = _2984 * _2998;
        float _3010 = _2980 * _2998;
        float _3012 = abs(_3006);
        float _3014 = log2(_3012);
        float _3016 = _2988 * _2998;
        float _3018 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3020 = _2648 * _3010;
        float _3022 = -_3010;
        float _3024 = -_3018;
        float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3024);
        float _3028 = fma(_2670, _3008, _3020);
        float _3030 = -_3016;
        float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3026);
        float _3034 = fma(_2666, _3016, _3028);
        float _3036 = precise::clamp(_3034, 0.0, 1.0);
        float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3040 = _3032 + _3038;
        float _3042 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3044 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3046 = precise::clamp(_3044, 0.0, 1.0);
        float _3048 = exp2(_3042);
        float _3050 = _3048 * _3046;
        float _3052 = _3036 * _3050;
        float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3056 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3058 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3054;
        out.m_89.y = _3056;
        out.m_89.z = _3058;
    }
    out.m_91.x = _2970;
    out.m_91.y = _2972;
    out.m_91.z = _2974;
    if (_2954)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3060;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2818 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3128 = as_type<float>(_132);
        out.gl_Position.z = _3128;
    }
    if (!_120)
    {
        return out;
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_112);
    bool _148 = _116 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _124;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3183 = as_type<float>(_158);
        out.gl_Position.z = _3183;
    }
    if (_152)
    {
        return out;
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _164 = _116 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _192 = int(_190);
    float _194 = in.m_55.y;
    float _196 = in.m_53.y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _200 = _198 != 0;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _204 = int(_202);
    float _206 = in.m_53.x;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _210 = _208 != 0;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _214 = _212 != 0;
    float _216 = in.m_55.x;
    float _218 = float(_192);
    float _220 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _222 = int(_220);
    float _224 = in.m_53.z;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _230 = 1.0 / _218;
    float _232 = float(_204);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _242 = _196 > 0.5;
    float _244 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _246 = int(_244);
    float _248 = float(uint(_222));
    float _250 = 0.0;
    bool _252 = _242;
    float _254 = _194;
    if (!_200)
    {
        _250 = _216;
    }
    float _256 = _250;
    float _258 = 1.0 / _232;
    float _260 = _116 * _230;
    bool _262 = _224 > 0.5;
    float _264 = 1.0 / _248;
    float _266 = float(uint(_246));
    float _268 = float(_246);
    float _270 = trunc(_260);
    int _272 = int(_270);
    float _274 = _116 * _258;
    int _276 = ~_222;
    int _278 = _276 + 1;
    float _280 = 1.0 / _266;
    int _282 = as_type<int>(_264) + (-2);
    float _284 = trunc(_274);
    int _286 = int(_284);
    float _288 = float(uint(_272));
    float _290 = as_type<float>(_282) * _288;
    int _292 = as_type<int>(_280) + (-2);
    float _294 = 1.0 / _236;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _298 = _296 != 0;
    float _300 = float(uint(_286));
    float _302 = trunc(_290);
    float _304 = precise::max(_302, 0.0);
    uint _307 = uint(_304);
    float _309 = as_type<float>(_292) * _300;
    float _311 = trunc(_309);
    float _313 = precise::max(_311, 0.0);
    uint _315 = uint(_313);
    float _317 = 0.0;
    float _319 = _256;
    if (_298)
    {
        _317 = 1.0;
    }
    float _321 = _317;
    int _323 = 0;
    float _325 = _321;
    if (_298)
    {
        _323 = 0;
    }
    int _327 = _323;
    float _329 = 0.0;
    int _331 = _327;
    if (_298)
    {
        _329 = _206;
    }
    float _333 = _329;
    int _335 = _278 * int(_307);
    int _337 = _335 + _272;
    float _339 = -_194;
    float _341 = _339 + 1.0;
    float _343 = 0.0;
    float _345 = _333;
    if (_298)
    {
        _343 = 1.0;
    }
    float _347 = _343;
    float _349 = 1.0 / _240;
    float _351 = _347;
    if (!_298)
    {
        _325 = 7.345489978790283203125;
    }
    float _353 = _325;
    float _355 = float(uint(_337));
    int _357 = ~_246;
    int _359 = _357 + 1;
    int _361 = _242 ? as_type<int>(_341) : as_type<int>(_194);
    float _363 = as_type<float>(_282) * _355;
    if (_200)
    {
        bool _365 = _206 > 0.5;
        _252 = _365;
    }
    bool _367 = _252;
    int _369 = _359 * int(_315);
    int _371 = _369 + _286;
    float _373 = _214 ? as_type<float>(_361) : _194;
    float _375 = trunc(_363);
    float _377 = precise::max(_375, 0.0);
    uint _379 = uint(_377);
    int _381 = _371;
    if (_210)
    {
        float _383 = _262 ? _341 : _194;
        _254 = _383;
    }
    float _385 = _254;
    float _387 = float(uint(_371));
    if (_200)
    {
        float _389 = -_216;
        float _391 = _389 + 1.0;
        _381 = as_type<int>(_391);
    }
    int _393 = _381;
    if (!_298)
    {
        _331 = 2;
    }
    int _395 = _331;
    if (!_298)
    {
        _345 = _196;
    }
    float _397 = _345;
    float _399 = as_type<float>(_292) * _387;
    if (_200)
    {
        float _401 = _367 ? as_type<float>(_393) : _216;
        _319 = _401;
    }
    float _403 = _319;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _407 = _405 != 0;
    float _409 = trunc(_399);
    float _411 = precise::max(_409, 0.0);
    uint _413 = uint(_411);
    int _415 = ~_222;
    int _417 = _415 + 1;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _425 = _423 != 0;
    int _427 = int(_307) + int(_379);
    float _429 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _433 = _431 != 0;
    float _435 = in.m_57.w;
    int _437 = ~_246;
    int _439 = _437 + 1;
    int _441 = _417 * _427;
    int _443 = _441 + _272;
    bool _445 = !_433;
    int _447 = _445 ? 0 : 1;
    float _449 = -_228;
    float _451 = fma(_429, 2.0, _449);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _455 = _453 != 0;
    bool _457 = uint(_443) >= uint(_222);
    float _459 = -_116;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[76].x, _451);
    int _463 = int(_315) + int(_413);
    float _465 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _467 = !_425;
    int _469 = _467 ? 0 : 1;
    float _471 = fma(_465, -2.0, _226);
    bool _473 = !_421;
    int _475 = _473 ? 0 : 1;
    int _477 = _439 * _463;
    int _479 = _477 + _286;
    bool _481 = !_455;
    int _483 = _481 ? 0 : 1;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _495 = _493 != 0;
    out.m_59.w = _435;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _499 = _497 != 0;
    if (!_298)
    {
        _351 = 1.2345600128173828125;
    }
    float _501 = _351;
    bool _503 = !_457;
    int _505 = _503 ? 0 : (-1);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _513 = _511 != 0;
    bool _515 = !_499;
    int _517 = _515 ? 0 : 1;
    bool _519 = uint(_479) >= uint(_246);
    float _521 = in.m_44.x;
    float _523 = in.m_44.y;
    float _525 = in.m_44.z;
    bool _527 = !_407;
    int _529 = _527 ? 0 : 1;
    bool _531 = !_519;
    int _533 = _531 ? 0 : (-1);
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _541 = _539 != 0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _549 = !_513;
    int _551 = _549 ? 0 : 1;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _555 = _222 == 0;
    float _557 = 1.0 / _545;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _563 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _571 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _573 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _575 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
    float _577 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[5].x, _571);
    float _579 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[6].x, _573);
    float _581 = _353 * _206;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    out.m_61.x = _563;
    out.m_61.y = _565;
    out.m_61.z = _567;
    out.m_61.w = _561;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _587;
    float _591 = floor(_581);
    float _593 = _585 * _557;
    float _595 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[4].z, _575);
    float _597 = float(_272);
    float _599 = _397 * _501;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = _589 * _349;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _609 = _188 + _607;
    int _611 = abs(_529);
    float _613 = _603 * _294;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _617 = _188 + _615;
    int _619 = abs(_469);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _188 + _621;
    float _625 = float(_222);
    float _627 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[5].z, _577);
    float _629 = fma(_605, _617, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _631 = fma(_593, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _633 = _597 >= _625;
    bool _635 = isnan(_597);
    bool _637 = _633 || _635;
    bool _639 = isnan(_625);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = floor(_599);
    float _647 = -_591;
    float _649 = _581 + _647;
    int _651 = ~_427;
    int _653 = _651 + _505;
    int _655 = _653 + 1;
    float _657 = fma(_613, _609, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _659 = float(_286);
    float _661 = _625 * _649;
    float _663 = _164 * _625;
    int _665 = _222 * _655;
    int _667 = _665 + _272;
    float _669 = trunc(_643);
    int _671 = int(_669);
    bool _673 = _659 >= _268;
    bool _675 = isnan(_659);
    bool _677 = _673 || _675;
    bool _679 = isnan(_268);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _164 * _268;
    float _687 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[6].z, _579);
    bool _689 = !_555;
    int _691 = _689 ? _667 : (-1);
    float _693 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _695 = ~_463;
    int _697 = _695 + _533;
    int _699 = _697 + 1;
    float _701 = trunc(_683);
    int _703 = int(_701);
    float _705 = -_645;
    float _707 = _599 + _705;
    bool _709 = !_537;
    int _711 = _709 ? 0 : 1;
    int _713 = _246 * _699;
    int _715 = _713 + _286;
    bool _717 = _246 == 0;
    float _719 = _268 * _707;
    bool _721 = !_509;
    int _723 = _721 ? 0 : 1;
    float _725 = trunc(_661);
    int _727 = int(_725);
    int _729 = ~_671;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    bool _735 = _395 != 2;
    int _737 = _222 + (-1);
    int _739 = _691 * _733;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = trunc(_685);
    int _745 = int(_743);
    int _747 = ~_703;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _755 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _471);
    bool _757 = !_717;
    int _759 = _757 ? _715 : (-1);
    float _761 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _763 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _753);
    int _765 = _246 + (-1);
    float _767 = trunc(_719);
    int _769 = int(_767);
    int _771 = abs(_551);
    float _773 = -_755;
    float _775 = fma(_763, _761, _773);
    int _777 = _727 * _611;
    int _779 = _777 + _272;
    int _781 = abs(_517);
    int _783 = _759 * _751;
    int _785 = abs(_475);
    int _787 = _671 * _737;
    int _789 = _787 + _739;
    float _791 = trunc(_663);
    int _793 = int(_791);
    int _795 = _703 * _765;
    int _797 = _795 + _783;
    int _799 = abs(_723);
    int _801 = _769 * _781;
    int _803 = _801 + _286;
    int _805 = _789 * _619;
    int _807 = _797 * _771;
    int _809 = abs(_483);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _813 = abs(_711);
    int _815 = _745 * _799;
    int _817 = _815 + _807;
    int _819 = _793 * _785;
    int _821 = _819 + _805;
    int _823 = abs(_447);
    int _825 = _803 * _813;
    int _827 = _825 + _817;
    bool _829 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _831 = isnan(_188);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    int _841 = _779 * _809;
    int _843 = _841 + _821;
    bool _845 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _847 = isnan(_188);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    int _857 = _711;
    float _859 = _719;
    float _861 = _579;
    float _863 = as_type<float>(_739);
    float _865 = _763;
    if (_487)
    {
        float _867 = -_216;
        float _869 = _867 + 1.0;
        _857 = as_type<int>(_869);
    }
    int _871 = _857;
    bool _873 = !_541;
    int _875 = _873 ? 0 : 1;
    float _877 = -_839;
    float _879 = _877 + 1.0;
    int _881 = _727 * _823;
    int _883 = _881 + _843;
    bool _885 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _887 = isnan(_188);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -_855;
    float _899 = _897 + 1.0;
    int _901 = abs(_875);
    float _903 = _855 * _879;
    bool _905 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _907 = isnan(_188);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _895 * _899;
    float _919 = -_895;
    float _921 = _919 + 1.0;
    int _923 = _769 * _901;
    int _925 = _923 + _827;
    float _927 = float(uint(_883));
    float _929 = _811 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _931 = _915 * _921;
    bool _933 = _196 > 0.5;
    float _935 = float(uint(_925));
    float _937 = as_type<float>(_282) * _927;
    float _939 = fma(_929, _385, -0.5);
    float _941 = _899;
    float _943 = _915;
    if (!_487)
    {
        _941 = _216;
    }
    float _945 = _941;
    float _947 = _631 * _931;
    float _949 = as_type<float>(_292) * _935;
    float _951 = trunc(_937);
    float _953 = precise::max(_951, 0.0);
    uint _955 = uint(_953);
    float _957 = _945;
    if (_487)
    {
        float _959 = _933 ? as_type<float>(_871) : _216;
        _957 = _959;
    }
    float _961 = _957;
    float _963 = -_915;
    float _965 = _963 + 1.0;
    int _967 = ~_222;
    int _969 = _967 + 1;
    if (_735)
    {
        _943 = _206;
    }
    float _971 = _943;
    float _973 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[115].x, _947);
    float _975 = _971;
    if (!_735)
    {
        _975 = _224;
    }
    float _977 = _975;
    float _979 = trunc(_949);
    float _981 = precise::max(_979, 0.0);
    uint _983 = uint(_981);
    float _985 = fma(_657, _917, _973);
    float _987 = float(uint(_779));
    float _989 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _991 = ~_246;
    int _993 = _991 + 1;
    float _995 = fma(_629, _903, _985);
    int _997 = _969 * int(_955);
    int _999 = _997 + _883;
    float _1001 = as_type<float>(_282) * _987;
    float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1005 = _977 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1007 = float(uint(_999));
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1011 = _993 * int(_983);
    int _1013 = _1011 + _925;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1017 = trunc(_1001);
    float _1019 = precise::max(_1017, 0.0);
    uint _1021 = uint(_1019);
    float _1023 = as_type<float>(_282) * _1007;
    float _1025 = float(uint(_803));
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1029 = float(uint(_1013));
    float _1031 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1015);
    int _1033 = ~_222;
    int _1035 = _1033 + 1;
    float _1037 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1009);
    float _1039 = trunc(_1023);
    float _1041 = precise::max(_1039, 0.0);
    uint _1043 = uint(_1041);
    float _1045 = as_type<float>(_292) * _1029;
    float _1047 = _1009;
    if (_735)
    {
        _1047 = _196;
    }
    float _1049 = _1047;
    float _1051 = as_type<float>(_292) * _1025;
    float _1053 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1027);
    float _1055 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1057 = _1049;
    if (!_735)
    {
        _1057 = _206;
    }
    float _1059 = _1057;
    float _1061 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1031);
    float _1063 = trunc(_1045);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    int _1069 = _1035 * int(_1021);
    int _1071 = _1069 + _779;
    float _1073 = fma(_1055, _961, -0.5);
    float _1075 = fma(_1061, _989, _461);
    int _1077 = ~_222;
    int _1079 = _1077 + 1;
    float _1081 = float(uint(_1071));
    float _1083 = trunc(_1051);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    int _1089 = int(_955) + int(_1043);
    float _1091 = as_type<float>(_282) * _1081;
    int _1093 = ~_246;
    int _1095 = _1093 + 1;
    int _1097 = _1079 * _1089;
    int _1099 = _1097 + _883;
    int _1101 = int(_983) + int(_1067);
    float _1103 = trunc(_1091);
    float _1105 = precise::max(_1103, 0.0);
    uint _1107 = uint(_1105);
    int _1109 = ~_246;
    int _1111 = _1109 + 1;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1115 = uint(_1099) >= uint(_222);
    int _1117 = _1095 * _1101;
    int _1119 = _1117 + _925;
    float _1121 = -_1113;
    float _1123 = fma(_1005, 2.0, _1121);
    int _1125 = _1111 * int(_1087);
    int _1127 = _1125 + _803;
    float _1129 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1131 = uint(_1119) >= uint(_246);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1135 = !_1115;
    int _1137 = _1135 ? 0 : (-1);
    float _1139 = -_116;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1123);
    float _1143 = float(uint(_1127));
    float _1145 = fma(_1129, -2.0, _1133);
    bool _1147 = !_1131;
    int _1149 = _1147 ? 0 : (-1);
    float _1151 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[118].x, _995);
    int _1153 = ~_1089;
    int _1155 = _1153 + _1137;
    int _1157 = _1155 + 1;
    float _1159 = as_type<float>(_292) * _1143;
    int _1161 = ~_1101;
    int _1163 = _1161 + _1149;
    int _1165 = _1163 + 1;
    float _1167 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1053);
    int _1169 = int(_1021) + int(_1107);
    int _1171 = _222 * _1157;
    int _1173 = _1171 + _883;
    float _1175 = trunc(_1159);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = _246 * _1165;
    int _1183 = _1181 + _925;
    int _1185 = ~_222;
    int _1187 = _1185 + 1;
    float _1189 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1037);
    bool _1191 = !_555;
    int _1193 = _1191 ? _1173 : (-1);
    float _1195 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1145);
    bool _1197 = !_717;
    int _1199 = _1197 ? _1183 : (-1);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _693 + _1201;
    float _1205 = fma(_1167, _1073, _1141);
    int _1207 = _1193 >> 31;
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1211 = _1199 >> 31;
    int _1213 = _1187 * _1169;
    int _1215 = _1213 + _779;
    int _1217 = _1193 & 3;
    int _1219 = _1207 & 3;
    int _1221 = _1211 & 3;
    int _1223 = int(_1087) + int(_1179);
    bool _1225 = uint(_1217) > 1u;
    int _1227 = _1193 & 3;
    bool _1229 = _1227 != 0;
    int _1231 = _1193 + _1219;
    int _1233 = _1199 + _1221;
    int _1235 = _1231 >> 2;
    int _1237 = _1233 >> 2;
    int _1239 = _1229 ? 0 : 1;
    int _1241 = _1237 << 4;
    int _1243 = _1241 + 512;
    float _1245 = _687 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1247 = _1235 << 4;
    int _1249 = _1247 + 368;
    float _1251 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1253 = ~_1239;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    uint _1259 = uint(int(uint(_1243) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    bool _1275 = uint(_1215) >= uint(_222);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1279 = _1251 + _1277;
    int _1281 = _1257;
    if (!_1225)
    {
        int _1283 = ~_1239;
        int _1285 = _1283 + 1;
        _1281 = _1285;
    }
    int _1287 = _1281;
    int _1289 = _1199 & 3;
    float _1291 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1209);
    bool _1293 = !_1275;
    int _1295 = _1293 ? 0 : (-1);
    uint _1297 = uint(int(uint(_1249) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[int(_1307)][_1309];
    bool _1313 = uint(_1217) >= 2u;
    bool _1315 = uint(_1289) > 1u;
    int _1317 = ~_1169;
    int _1319 = _1317 + _1295;
    int _1321 = _1319 + 1;
    int _1323 = _1313 ? 0 : 1;
    int _1325 = _1249 + 8;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    uint _1329 = uint(int(uint(int(_1327)) >> uint(2)));
    int _1331 = int(_1327) & 3;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[int(_1329)][_1331];
    int _1335 = int(_1327) + 1;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    int _1339 = _1335 & 3;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[int(_1337)][_1339];
    int _1343 = _1199 & 3;
    bool _1345 = _1343 != 0;
    int _1347 = _222 * _1321;
    int _1349 = _1347 + _779;
    bool _1351 = !_1229;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1245 + _1355;
    int _1359 = _1345 ? 0 : 1;
    bool _1361 = _1217 != 3;
    int _1363 = _1243 + 8;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    int _1381 = ~_1359;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1291);
    int _1389 = _1385;
    if (!_1315)
    {
        int _1391 = ~_1359;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    bool _1397 = uint(_1289) >= 2u;
    int _1399 = abs(_1395);
    bool _1401 = !_1345;
    int _1403 = _1401 ? 0 : 1;
    int _1405 = abs(_1353);
    bool _1407 = _1217 != 3;
    int _1409 = ~_1323;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    int _1415 = abs(_1287);
    int _1417 = _1413;
    if (_1361)
    {
        int _1419 = ~_1323;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    int _1425 = _1397 ? 0 : 1;
    bool _1427 = _1289 != 3;
    int _1429 = ~_1399;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    int _1435 = abs(_1403);
    int _1437 = ~_1415;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    int _1443 = _1433 * as_type<int>(_1273);
    int _1445 = abs(_1423);
    int _1447 = ~_1405;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    int _1453 = _1441 * as_type<int>(_1311);
    int _1455 = ~_246;
    int _1457 = _1455 + 1;
    int _1459 = _1451 * as_type<int>(_1303);
    int _1461 = _1459 + _1453;
    int _1463 = _1457 * _1223;
    int _1465 = _1463 + _803;
    int _1467 = ~_1435;
    int _1469 = _1467 + 1;
    int _1471 = _1469 + 1;
    int _1473 = ~_1445;
    int _1475 = _1473 + 1;
    int _1477 = _1475 + 1;
    int _1479 = ~_1425;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    int _1485 = _1471 * as_type<int>(_1265);
    int _1487 = _1485 + _1443;
    bool _1489 = !_491;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1477 * as_type<int>(_1333);
    int _1495 = _1493 + _1461;
    bool _1497 = _1289 != 3;
    int _1499 = _1483;
    if (_1427)
    {
        int _1501 = ~_1425;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    bool _1507 = uint(_1465) >= uint(_246);
    bool _1509 = !_1407;
    int _1511 = _1509 ? 0 : (-1);
    int _1513 = abs(_1505);
    bool _1515 = !_495;
    int _1517 = _1515 ? 0 : 1;
    bool _1519 = !_1497;
    int _1521 = _1519 ? 0 : (-1);
    bool _1523 = !_1507;
    int _1525 = _1523 ? 0 : (-1);
    int _1527 = abs(_1511);
    int _1529 = abs(_1491);
    int _1531 = abs(_1521);
    int _1533 = ~_1513;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    int _1539 = abs(_1517);
    int _1541 = ~_1223;
    int _1543 = _1541 + _1525;
    int _1545 = _1543 + 1;
    int _1547 = _1537 * as_type<int>(_1371);
    int _1549 = _1547 + _1487;
    int _1551 = ~_1527;
    int _1553 = _1551 + 1;
    int _1555 = _1553 + 1;
    int _1557 = _246 * _1545;
    int _1559 = _1557 + _803;
    int _1561 = ~_1531;
    int _1563 = _1561 + 1;
    int _1565 = _1563 + 1;
    int _1567 = _1555 * as_type<int>(_1341);
    int _1569 = _1567 + _1495;
    int _1571 = ~_1529;
    int _1573 = _1571 + 1;
    int _1575 = _1573 + 1;
    float _1577 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1579 = ~_1539;
    int _1581 = _1579 + 1;
    int _1583 = _1581 + 1;
    int _1585 = _1565 * as_type<int>(_1379);
    int _1587 = _1585 + _1549;
    bool _1589 = _1387 >= 0.0;
    int _1591 = _1569 * _1575;
    bool _1593 = !_717;
    int _1595 = _1593 ? _1559 : (-1);
    int _1597 = _1587 * _1583;
    bool _1599 = !_555;
    int _1601 = _1599 ? _1349 : (-1);
    float _1603 = -_1195;
    float _1605 = fma(_1189, _939, _1603);
    int _1607 = _1595 * _1539;
    int _1609 = _1607 + _1597;
    float _1611 = _1203 * _1203;
    int _1613 = _1601 * _1529;
    int _1615 = _1613 + _1591;
    float _1617 = fma(_1279, _1279, _1611);
    float _1619 = as_type<float>(_1587);
    float _1621 = as_type<float>(_1609);
    if (_1589)
    {
        _1619 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1623 = _1619;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1629 = fma(_1357, _1357, _1617);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1633 = _775 + 0.5;
    float _1635 = _1075 + 0.5;
    float _1637 = rsqrt(_1629);
    float _1639 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1205 + 0.5;
    float _1647 = _1605 + 0.5;
    int _1649 = as_type<int>(_1623);
    if (_1589)
    {
        float _1651 = _1623 * 5.0;
        _1649 = as_type<int>(_1651);
    }
    int _1653 = _1649;
    float _1655 = float(_1615);
    out.m_63.x = _1635;
    out.m_63.y = _1633;
    float _1657 = float(_1609);
    out.m_65.x = _1639;
    out.m_65.y = _1641;
    out.m_65.z = _1643;
    out.m_65.w = _1577;
    float _1659 = _1203 * _1637;
    if (_1589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5385 = as_type<float>(_1653);
        out.gl_Position.z = _5385;
    }
    float _1661 = _1279 * _1637;
    out.m_67.x = _1645;
    out.m_67.y = _1647;
    out.m_69.x = _1655;
    out.m_69.y = _1657;
    if (_1589)
    {
        out.m_51.x = 0.0;
    }
    if (_1589)
    {
        return out;
    }
    float _1663 = -_1659;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1667 = _1357 * _1637;
    float _1669 = -_1661;
    float _1671 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1675 = _1665 + _1673;
    float _1677 = -_1667;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1683 = _1671 + _1681;
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1679 + _1687;
    float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1685);
    float _1693 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1691);
    bool _1695 = _1693 >= 0.0;
    if (_1695)
    {
        _1621 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1697 = _1621;
    int _1699 = as_type<int>(_1697);
    if (_1695)
    {
        out.m_51.x = 0.0;
    }
    if (_1695)
    {
        float _1701 = _1697 * 5.0;
        _1699 = as_type<int>(_1701);
    }
    int _1703 = _1699;
    if (_1695)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5490 = as_type<float>(_1703);
        out.gl_Position.z = _5490;
    }
    if (_1695)
    {
        return out;
    }
    float _1705 = -_693;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1709 = -_1251;
    float _1711 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1713 = -_1245;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1717 = -_1659;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1721 = _1707 * _1707;
    float _1723 = -_1661;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1727 = in.m_71.x;
    float _1729 = in.m_71.y;
    float _1731 = in.m_71.z;
    float _1733 = _1719 * _1719;
    float _1735 = fma(_1711, _1711, _1721);
    float _1737 = -_1667;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1741 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1743 = fma(_1725, _1725, _1733);
    float _1745 = fma(_1715, _1715, _1735);
    float _1747 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1741);
    float _1749 = fma(_1739, _1739, _1743);
    bool _1751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    float _1761 = rsqrt(_1745);
    float _1763 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    bool _1765 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1767 = isnan(0.5);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1773 = _1769 || _1771;
    float _1775 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1777 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1779 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1781 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1783 = _1711 * _1761;
    float _1785 = _1715 * _1761;
    float _1787 = _1707 * _1761;
    float _1789 = _1781 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1793 = _1783 * _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = _1785 * _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1801 = _1787 * _1799;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1805 = -_1793;
    float _1807 = fma(_1785, _1803, _1805);
    float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1811 = -_1797;
    float _1813 = fma(_1787, _1809, _1811);
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1817 = -_1801;
    float _1819 = fma(_1783, _1815, _1817);
    float _1821 = in.m_73.x;
    float _1823 = in.m_73.y;
    float _1825 = in.m_73.z;
    float _1827 = _1807 * _1807;
    float _1829 = sqrt(_1749);
    float _1831 = _1777 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1833 = fma(_1813, _1813, _1827);
    float _1835 = fma(_1819, _1819, _1833);
    float _1837 = rsqrt(_1835);
    float _1839 = _1637 * _1829;
    float _1841 = _1779 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1843 = _1839 * _1831;
    float _1845 = _1839 * _1841;
    float _1847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1823);
    float _1849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1821);
    float _1851 = _1847 * _1843;
    float _1853 = _1813 * _1837;
    float _1855 = _1807 * _1837;
    float _1857 = _1819 * _1837;
    float _1859 = _1849 * _1845;
    float _1861 = _1787 * _1853;
    float _1863 = _1785 * _1855;
    float _1865 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1825);
    float _1867 = _1839 * _1789;
    float _1869 = -_1861;
    float _1871 = fma(_1783, _1855, _1869);
    float _1873 = -_1863;
    float _1875 = fma(_1787, _1857, _1873);
    float _1877 = _1783 * _1857;
    float _1879 = _1865 * _1867;
    float _1881 = _1851 * _1871;
    float _1883 = _1851 * _1875;
    float _1885 = -_1877;
    float _1887 = fma(_1785, _1853, _1885);
    float _1889 = fma(_1859, _1857, _1881);
    float _1891 = fma(_1859, _1853, _1883);
    float _1893 = fma(_1879, _1785, _1889);
    float _1895 = fma(_1879, _1783, _1891);
    float _1897 = _1245 + _1893;
    float _1899 = _1251 + _1895;
    float _1901 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1905 = _1897 + _1903;
    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1909 = _1899 + _1907;
    float _1911 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1901);
    float _1913 = _1851 * _1887;
    float _1915 = _1905 * _1905;
    float _1917 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1919 = fma(_1859, _1855, _1913);
    float _1921 = fma(_1909, _1909, _1915);
    float _1923 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1925 = fma(_1879, _1787, _1919);
    float _1927 = sqrt(_1921);
    float _1929 = _1775 + _1923;
    float _1931 = _693 + _1925;
    float _1933 = 1.0 / _1923;
    bool _1935 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1937 = _1925;
    float _1939 = _1919;
    float _1941 = _1931;
    float _1943 = _1899;
    float _1945 = _1929;
    float _1947 = _1905;
    float _1949 = _1909;
    if (!_1935)
    {
        _1937 = _1899;
    }
    float _1951 = _1937;
    float _1953 = _1951;
    if (!_1935)
    {
        _1939 = _1897;
    }
    float _1955 = _1939;
    bool _1957 = !_1935;
    float _1959 = _1955;
    if (!_1957)
    {
        float _1961 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1965 = _1927 + _1963;
        float _1967 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1969 = rsqrt(_1921);
        float _1971 = _1965 * _1961;
        float _1973 = _1971 * 0.15915493667125701904296875;
        float _1975 = _1973 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        float _1979 = _1973 * 6.283185482025146484375;
        float _1981 = sin(_1979);
        float _1983 = _1977 + (-1.0);
        float _1985 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1987 = fma(_1981, _1967, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1989 = fma(_1931, _1977, _1985);
        float _1991 = _1969 * _1987;
        float _1993 = fma(_1909, _1991, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1995 = fma(_1905, _1991, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1959 = _1995;
        _1941 = _1989;
        _1953 = _1993;
        _1943 = _1985;
    }
    float _1997 = _1959;
    float _1999 = _1941;
    float _2001 = _1953;
    float _2003 = _1943;
    float _2005 = -_1667;
    float _2007 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1997);
    float _2009 = -_1659;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1999);
    float _2013 = _1929 * _1933;
    float _2015 = _2013 * 0.5;
    float _2017 = -_1661;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2001);
    float _2021 = _2003;
    float _2023 = _2011;
    float _2025 = _2019;
    float _2027 = _2015;
    float _2029 = _2001;
    if (_1773)
    {
        _2021 = 1.0;
    }
    float _2031 = _2021;
    float _2033 = _2031;
    if (_1759)
    {
        _1945 = _2007;
    }
    float _2035 = _1945;
    float _2037 = _2035;
    if (!_1759)
    {
        float _2039 = _1675 * _1675;
        float _2041 = 1.0 / _1839;
        float _2043 = -_1251;
        float _2045 = _2043 + _2001;
        float _2047 = -_693;
        float _2049 = _2047 + _1999;
        float _2051 = fma(_1683, _1683, _2039);
        float _2053 = -_1245;
        float _2055 = _2053 + _1997;
        float _2057 = fma(_1689, _1689, _2051);
        float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2061 = sqrt(_2057);
        float _2063 = precise::min(_2061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2059;
        float _2067 = _2065 * _2041;
        float _2069 = fma(_2045, _2067, _1671);
        float _2071 = fma(_2049, _2067, _1665);
        float _2073 = fma(_2055, _2067, _1679);
        _2023 = _2071;
        _2025 = _2069;
        _2037 = _2073;
        _1947 = _2059;
        _1949 = _2067;
    }
    float _2075 = _2023;
    float _2077 = _2025;
    float _2079 = _2037;
    float _2081 = _1947;
    float _2083 = _1949;
    float _2085 = _2081;
    float _2087 = _2083;
    if (!_1773)
    {
        float _2089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2091 = _2089 * 0.15915493667125701904296875;
        float _2093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2097 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2095);
        float _2099 = _2091 * 6.283185482025146484375;
        float _2101 = cos(_2099);
        float _2103 = _2093 * 0.15915493667125701904296875;
        float _2105 = _2091 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        float _2109 = 1.0 / _2101;
        float _2111 = _2103 * 6.283185482025146484375;
        float _2113 = cos(_2111);
        float _2115 = _2107 * _2109;
        float _2117 = _2103 * 6.283185482025146484375;
        float _2119 = sin(_2117);
        float _2121 = _2113 * _2115;
        float _2123 = 1.0 / _2097;
        float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2127 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2125;
        float _2129 = 1.0 / _2121;
        float _2131 = 1.0 / _2127;
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2135 = _2123 * _2133;
        float _2137 = _2119 * _2129;
        float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2141 = fma(_2137, _2135, _2139);
        float _2143 = _2141 * _2131;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2085 = _2131;
        _2087 = _2103;
        _2027 = _2123;
        _2033 = _2145;
    }
    float _2147 = _2085;
    float _2149 = _2087;
    float _2151 = _2027;
    float _2153 = _2033;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2157 = _2075 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2161 = _2077 + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2165 = _2079 + _2163;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = sqrt(_2171);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2161 * _2177;
    float _2181 = _2165 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2147;
    float _2199 = _2195;
    float _2201 = _2157;
    float _2203 = _2151;
    float _2205 = _2179;
    if (_2191)
    {
        float _2207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2207;
    }
    float _2209 = _2197;
    float _2211 = _2209;
    if (_2191)
    {
        float _2213 = _2195 * _2209;
        _2199 = _2213;
    }
    float _2215 = _2199;
    if (_2191)
    {
        float _2217 = rsqrt(_2187);
        _2211 = _2217;
    }
    float _2219 = _2211;
    float _2221 = _2219;
    if (_2191)
    {
        float _2223 = _2215 * 0.15915493667125701904296875;
        _2029 = _2223;
    }
    float _2225 = _2029;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = _2165;
    if (_2191)
    {
        float _2231 = _2225 * 6.283185482025146484375;
        float _2233 = sin(_2231);
        _2229 = _2233;
    }
    float _2235 = _2229;
    float _2237 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2239 = precise::max(0.0, _2227);
    float _2241 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2237);
    float _2243 = _2149;
    float _2245 = _2239;
    if (_2191)
    {
        float _2247 = _2225 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = -_2177;
    float _2255 = -_2239;
    float _2257 = fma(_2157, _2253, _2255);
    if (_2191)
    {
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2259;
    }
    float _2261 = _2201;
    float _2263 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2265 = _2235;
    float _2267 = _2261;
    if (_2191)
    {
        float _2269 = fma(_2235, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = _2271;
    if (!_2191)
    {
        _2267 = _2257;
    }
    float _2275 = _2267;
    float _2277 = _2275;
    if (_2191)
    {
        float _2279 = _2219 * _2271;
        _2203 = _2279;
    }
    float _2281 = _2203;
    if (!_2191)
    {
        _2273 = _2183;
    }
    float _2283 = _2273;
    float _2285 = _2283;
    float _2287 = _2251;
    if (_2191)
    {
        float _2289 = _2251 + (-1.0);
        _2245 = _2289;
    }
    float _2291 = _2245;
    float _2293 = _2291;
    if (_2191)
    {
        float _2295 = _2179 * _2281;
        _2205 = _2295;
    }
    float _2297 = _2205;
    if (_2191)
    {
        float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2299;
    }
    float _2301 = _2221;
    if (!_2191)
    {
        _2293 = _2181;
    }
    float _2303 = _2293;
    float _2305 = _2303;
    if (_2191)
    {
        float _2307 = _2181 * _2281;
        _2305 = _2307;
    }
    float _2309 = _2305;
    if (_2191)
    {
        float _2311 = _2297 * _2297;
        _2285 = _2311;
    }
    float _2313 = _2285;
    if (_2191)
    {
        float _2315 = fma(_2257, _2251, _2301);
        _2277 = _2315;
    }
    float _2317 = _2277;
    if (!_2191)
    {
        _2287 = _2185;
    }
    float _2319 = _2287;
    float _2321 = _2319;
    if (_2191)
    {
        float _2323 = _2309 * _2309;
        _2321 = _2323;
    }
    float _2325 = _2321;
    float _2327 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2329 = fma(_2317, _2317, _2313);
    float _2331 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2327);
    float _2333 = _2329 + _2325;
    float _2335 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2339 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2337);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2331);
    float _2345 = rsqrt(_2333);
    float _2347 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2349 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2335);
    float _2351 = -_2341;
    float _2353 = _2351 + 1.0;
    float _2355 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2357 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2347);
    float _2359 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2349);
    float _2361 = abs(_2353);
    float _2363 = log2(_2361);
    float _2365 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2357);
    float _2367 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2369 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2371 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2373 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2375 = -_2369;
    float _2377 = fma(_2375, _2263, 1.0);
    float _2379 = _2345 * _2297;
    float _2381 = _2345 * _2317;
    float _2383 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2241);
    float _2385 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2373);
    float _2387 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2389 = _2345 * _2309;
    float _2391 = _2383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2393 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2385);
    float _2395 = -_2387;
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2395);
    float _2399 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2401 = log2(_2377);
    float _2403 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2393);
    float _2405 = -_2389;
    float _2407 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2397);
    float _2409 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2411 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2413 = fma(_2407, -0.5, 0.5);
    float _2415 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2409);
    float _2417 = 1.0 / _2403;
    float _2419 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2411);
    float _2421 = fma(_2407, 0.5, 0.5);
    float _2423 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2415);
    float _2425 = _2381 + 1.0;
    float _2427 = fma(_2421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2429 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2431 = exp2(_2399);
    float _2433 = _2401 * 0.693147182464599609375;
    float _2435 = fma(_2421, _2427, -0.212114393711090087890625);
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2439 = fma(_2421, _2435, 1.570728778839111328125);
    float _2441 = sqrt(_2413);
    float _2443 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2419);
    float _2445 = _2429 * _2417;
    float _2447 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2443);
    float _2449 = fma(_2445, 0.5, 0.5);
    float _2451 = -_2381;
    float _2453 = fma(_2431, _2425, _2451);
    float _2455 = _2447 * _2417;
    float _2457 = fma(_2453, 0.5, 0.5);
    float _2459 = fma(_2455, -0.5, 0.5);
    float _2461 = _2441 * 0.636619746685028076171875;
    float3 _6682 = float3(_2449, _2459, _2437);
    float _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6682, float3(0.0), isnan(_6682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6682, float3(0.0), isnan(_6682)), level(0.0)).x;
    float3 _6693 = float3(_2449, _2459, _2437);
    float4 _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6693, float3(0.0), isnan(_6693)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6693, float3(0.0), isnan(_6693)), level(0.0)).xyzw;
    float _2468 = _2466.x;
    float _2470 = _2466.y;
    float _2472 = _2466.z;
    float _2474 = _2466.w;
    float _2476 = -_2439;
    float _2478 = fma(_2461, _2476, 1.0);
    float2 _6715 = float2(_2478, _2457);
    float3 _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).xyz;
    float _2484 = _2482.x;
    float _2486 = _2482.y;
    float _2488 = _2482.z;
    float _2490 = in.m_75.x;
    float _2492 = in.m_75.y;
    float _2494 = in.m_75.z;
    bool _2496 = _1823 != 0.0;
    bool _2498 = isnan(_1823);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(0.0);
    bool _2504 = _2500 || _2502;
    float _2506 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2508 = in.m_77.x;
    float _2510 = in.m_77.y;
    float _2512 = in.m_77.z;
    float _2514 = in.m_77.w;
    bool _2516 = _1821 == 0.0;
    bool _2518 = !_2504;
    bool _2520 = _2516 && _2518;
    float _2522 = exp2(_2506);
    bool _2524 = _1825 == 0.0;
    bool _2526 = _2524 && _2520;
    float _2528 = _2449;
    float _2530 = _2459;
    float _2532 = _2403;
    float _2534 = _2429;
    float _2536 = _2447;
    if (_2526)
    {
        _859 = _2490;
    }
    float _2538 = _859;
    float _2540 = -_2522;
    float _2542 = _2540 + 1.0;
    float _2544 = _2538;
    if (_2526)
    {
        _861 = _2494;
    }
    float _2546 = _861;
    float _2548 = _2546;
    if (_2526)
    {
        _863 = _2492;
    }
    float _2550 = _863;
    float _2552 = _2550;
    if (_2526)
    {
        _865 = _2538;
    }
    float _2554 = _865;
    float _2556 = _2554;
    if (!_2526)
    {
        _2544 = _2490;
    }
    float _2558 = _2544;
    if (_2526)
    {
        _2528 = _2546;
    }
    float _2560 = _2528;
    float _2562 = _2560;
    if (_2526)
    {
        _2530 = _2550;
    }
    float _2564 = _2530;
    float _2566 = _2512 * _2558;
    float _2568 = _2564;
    if (!_2526)
    {
        _2548 = _2494;
    }
    float _2570 = _2548;
    if (!_2526)
    {
        float _2572 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2558);
        _2556 = _2572;
    }
    float _2574 = _2556;
    if (!_2526)
    {
        _2552 = _2492;
    }
    float _2576 = _2552;
    float _2578 = _2510 * _2570;
    float _2580 = -_2566;
    float _2582 = fma(_2508, _2570, _2580);
    float _2584 = _2508 * _2576;
    if (!_2526)
    {
        float _2586 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2576);
        _2568 = _2586;
    }
    float _2588 = _2568;
    float _2590 = -_2578;
    float _2592 = fma(_2512, _2576, _2590);
    float _2594 = _2582 * _2514;
    float _2596 = -_2584;
    float _2598 = fma(_2510, _2558, _2596);
    if (!_2526)
    {
        float _2600 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2570);
        _2562 = _2600;
    }
    float _2602 = _2562;
    float _2604 = _2592 * _2514;
    float _2606 = _1887 * _2510;
    float _2608 = _2598 * _2514;
    float _2610 = _1875 * _2510;
    float _2612 = _1871 * _2510;
    float _2614 = _2594 * _1887;
    float _2616 = _2594 * _1875;
    float _2618 = _2594 * _1871;
    float _2620 = _1875 * _2588;
    float _2622 = _1887 * _2588;
    float _2624 = fma(_1853, _2508, _2610);
    float _2626 = fma(_1855, _2508, _2606);
    float _2628 = fma(_1857, _2508, _2612);
    float _2630 = fma(_2604, _1855, _2614);
    float _2632 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2634 = fma(_2604, _1853, _2616);
    float _2636 = fma(_2604, _1857, _2618);
    float _2638 = fma(_1855, _2574, _2622);
    float _2640 = fma(_2608, _1787, _2630);
    float _2642 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2632);
    float _2644 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2646 = _1871 * _2588;
    float _2648 = fma(_1787, _2602, _2638);
    float _2650 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2642);
    float _2652 = fma(_1783, _2512, _2624);
    float _2654 = fma(_1787, _2512, _2626);
    float _2656 = fma(_1785, _2512, _2628);
    float _2658 = fma(_1857, _2574, _2646);
    float _2660 = fma(_2608, _1783, _2634);
    float _2662 = _2403 * 0.5;
    float _2664 = fma(_1853, _2574, _2620);
    out.m_79.x = _2652;
    out.m_79.y = _2654;
    out.m_79.z = _2656;
    float _2666 = fma(_1785, _2602, _2658);
    float _2668 = fma(_2447, -0.5, _2662);
    float _2670 = fma(_1783, _2602, _2664);
    bool _2672 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2674 = isnan(_2175);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2680 = _2676 || _2678;
    float _2682 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2650);
    float _2684 = _2429 + _2403;
    float _2686 = fma(_2608, _1785, _2636);
    out.m_81.x = _2670;
    out.m_81.y = _2648;
    out.m_81.z = _2666;
    float _2688 = _2682 + _2403;
    float _2690 = _2684 * 0.5;
    out.m_83.x = _2660;
    out.m_83.y = _2640;
    out.m_83.z = _2686;
    float _2692 = _2688 * 0.5;
    out.gl_Position.x = _2429;
    out.gl_Position.y = _2447;
    out.gl_Position.z = _2682;
    out.gl_Position.w = _2403;
    out.m_85.x = _2690;
    out.m_85.y = _2668;
    out.m_85.z = _2692;
    out.m_85.w = _2403;
    float _2694 = _2686;
    float _2696 = _2640;
    float _2698 = _2660;
    if (!_2680)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2700 = _2694;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2680)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2706 = _2696;
    float _2708 = _2706;
    float _2710 = _2706;
    if (!_2680)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2712 = _2698;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2680)
    {
        _2532 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2532;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2680)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2534;
    float _2726 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2680)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2732 = _2536;
    float _2734 = _2644 * _2463;
    float _2736 = -_2644;
    float _2738 = _2736 + 1.0;
    float _2740 = _2474 * _2734;
    float _2742 = _2488 * _2734;
    float _2744 = fma(_2484, _2740, _2468);
    float _2746 = fma(_2486, _2740, _2470);
    float _2748 = _2474 * _2738;
    float _2750 = fma(_2474, _2742, _2472);
    out.m_87.x = _2744;
    out.m_87.y = _2746;
    out.m_87.z = _2750;
    out.m_87.w = _2748;
    bool _2752 = !_2680;
    float _2754 = _2732;
    float _2756 = _2732;
    if (!_2752)
    {
        bool _2758 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2760 = isnan(_2175);
        bool _2762 = _2758 || _2760;
        bool _2764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2766 = _2762 || _2764;
        if (!_2766)
        {
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2770 = _2175 + _2768;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2774 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2772;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2784 = 1.0 / _2774;
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2798 = _2770 * _2784;
            float _2800 = precise::clamp(_2798, 0.0, 1.0);
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2806 = fma(_2800, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2808 = fma(_2800, _2782, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2810 = fma(_2800, _2804, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2812 = fma(_2800, _2788, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2814 = fma(_2800, _2792, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2816 = fma(_2800, _2796, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2710 = _2806;
            _2730 = _2814;
            _2704 = _2808;
            _2722 = _2812;
            _2716 = _2810;
            _2756 = _2816;
            _2818 = true;
        }
        else
        {
            bool _2820 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2822 = isnan(_2175);
            bool _2824 = _2820 || _2822;
            bool _2826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2828 = _2824 || _2826;
            if (!_2828)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2830 = _2720;
            _2722 = _2830;
            if (!_2828)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2832 = _2728;
            _2730 = _2832;
            if (!_2828)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2834 = _2754;
            _2756 = _2834;
            if (!_2828)
            {
                _2702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2836 = _2702;
            _2704 = _2836;
            if (!_2828)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2838 = _2708;
            _2710 = _2838;
            if (!_2828)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2840 = _2714;
            bool _2842 = !_2828;
            _2716 = _2840;
            if (!_2842)
            {
                bool _2844 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2846 = isnan(_2175);
                bool _2848 = _2844 || _2846;
                bool _2850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2852 = _2848 || _2850;
                if (!_2852)
                {
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2856 = _2175 + _2854;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2860 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2858;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2870 = 1.0 / _2860;
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2884 = _2856 * _2870;
                    float _2886 = precise::clamp(_2884, 0.0, 1.0);
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2892 = fma(_2886, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2894 = fma(_2886, _2868, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2896 = fma(_2886, _2890, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2898 = fma(_2886, _2874, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2900 = fma(_2886, _2878, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2902 = fma(_2886, _2882, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2710 = _2892;
                    _2730 = _2900;
                    _2704 = _2894;
                    _2722 = _2898;
                    _2716 = _2896;
                    _2756 = _2902;
                    _2818 = true;
                }
                else
                {
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2818 = false;
    float _2904 = _2710;
    float _2906 = _2730;
    float _2908 = _2704;
    float _2910 = _2722;
    float _2912 = _2716;
    float _2914 = _2756;
    float _2916 = fma(_2648, -0.5, 0.5);
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = -_2904;
    float _2922 = _2906 + _2920;
    float _2924 = _2726 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2926 = -_2908;
    float _2928 = _2910 + _2926;
    float _2930 = fma(_2918, _2922, _2904);
    out.m_89.x = 0.0;
    float _2932 = -_2912;
    float _2934 = _2914 + _2932;
    float _2936 = fma(_2918, _2928, _2908);
    float _2938 = _2930 * 0.586610972881317138671875;
    out.m_51.x = _2924;
    bool _2940 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2942 = fma(_2918, _2934, _2912);
    float _2944 = fma(_2936, 0.298911988735198974609375, _2938);
    bool _2946 = _2153 > 0.0;
    bool _2948 = isnan(_2153);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan(0.0);
    bool _2954 = _2950 || _2952;
    float _2956 = fma(_2942, 0.114477999508380889892578125, _2944);
    float _2958 = -_2956;
    float _2960 = _2936 + _2958;
    float _2962 = -_2956;
    float _2964 = _2930 + _2962;
    float _2966 = -_2956;
    float _2968 = _2942 + _2966;
    float _2970 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2972 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2974 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    bool _2976 = !_2940;
    if (!_2976)
    {
        float _2978 = -_2075;
        float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2982 = -_2077;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2986 = -_2079;
        float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2990 = _2980 * _2980;
        float _2992 = fma(_2984, _2984, _2990);
        float _2994 = fma(_2988, _2988, _2992);
        float _2996 = sqrt(_2994);
        float _2998 = rsqrt(_2994);
        float _3000 = -_2996;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3004 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3006 = precise::clamp(_3004, 0.0, 1.0);
        float _3008 = _2984 * _2998;
        float _3010 = _2980 * _2998;
        float _3012 = abs(_3006);
        float _3014 = log2(_3012);
        float _3016 = _2988 * _2998;
        float _3018 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3020 = _2648 * _3010;
        float _3022 = -_3010;
        float _3024 = -_3018;
        float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3024);
        float _3028 = fma(_2670, _3008, _3020);
        float _3030 = -_3016;
        float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3026);
        float _3034 = fma(_2666, _3016, _3028);
        float _3036 = precise::clamp(_3034, 0.0, 1.0);
        float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3040 = _3032 + _3038;
        float _3042 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3044 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3046 = precise::clamp(_3044, 0.0, 1.0);
        float _3048 = exp2(_3042);
        float _3050 = _3048 * _3046;
        float _3052 = _3036 * _3050;
        float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3056 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3058 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3054;
        out.m_89.y = _3056;
        out.m_89.z = _3058;
    }
    out.m_91.x = _2970;
    out.m_91.y = _2972;
    out.m_91.z = _2974;
    if (_2954)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3060;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2818 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3128 = as_type<float>(_132);
        out.gl_Position.z = _3128;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_112);
    bool _148 = _116 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _124;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3183 = as_type<float>(_158);
        out.gl_Position.z = _3183;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _164 = _116 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _192 = int(_190);
    float _194 = in.m_55.y;
    float _196 = in.m_53.y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _200 = _198 != 0;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _204 = int(_202);
    float _206 = in.m_53.x;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _210 = _208 != 0;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _214 = _212 != 0;
    float _216 = in.m_55.x;
    float _218 = float(_192);
    float _220 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _222 = int(_220);
    float _224 = in.m_53.z;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _230 = 1.0 / _218;
    float _232 = float(_204);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _242 = _196 > 0.5;
    float _244 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _246 = int(_244);
    float _248 = float(uint(_222));
    float _250 = 0.0;
    bool _252 = _242;
    float _254 = _194;
    if (!_200)
    {
        _250 = _216;
    }
    float _256 = _250;
    float _258 = 1.0 / _232;
    float _260 = _116 * _230;
    bool _262 = _224 > 0.5;
    float _264 = 1.0 / _248;
    float _266 = float(uint(_246));
    float _268 = float(_246);
    float _270 = trunc(_260);
    int _272 = int(_270);
    float _274 = _116 * _258;
    int _276 = ~_222;
    int _278 = _276 + 1;
    float _280 = 1.0 / _266;
    int _282 = as_type<int>(_264) + (-2);
    float _284 = trunc(_274);
    int _286 = int(_284);
    float _288 = float(uint(_272));
    float _290 = as_type<float>(_282) * _288;
    int _292 = as_type<int>(_280) + (-2);
    float _294 = 1.0 / _236;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _298 = _296 != 0;
    float _300 = float(uint(_286));
    float _302 = trunc(_290);
    float _304 = precise::max(_302, 0.0);
    uint _307 = uint(_304);
    float _309 = as_type<float>(_292) * _300;
    float _311 = trunc(_309);
    float _313 = precise::max(_311, 0.0);
    uint _315 = uint(_313);
    float _317 = 0.0;
    float _319 = _256;
    if (_298)
    {
        _317 = 1.0;
    }
    float _321 = _317;
    int _323 = 0;
    float _325 = _321;
    if (_298)
    {
        _323 = 0;
    }
    int _327 = _323;
    float _329 = 0.0;
    int _331 = _327;
    if (_298)
    {
        _329 = _206;
    }
    float _333 = _329;
    int _335 = _278 * int(_307);
    int _337 = _335 + _272;
    float _339 = -_194;
    float _341 = _339 + 1.0;
    float _343 = 0.0;
    float _345 = _333;
    if (_298)
    {
        _343 = 1.0;
    }
    float _347 = _343;
    float _349 = 1.0 / _240;
    float _351 = _347;
    if (!_298)
    {
        _325 = 7.345489978790283203125;
    }
    float _353 = _325;
    float _355 = float(uint(_337));
    int _357 = ~_246;
    int _359 = _357 + 1;
    int _361 = _242 ? as_type<int>(_341) : as_type<int>(_194);
    float _363 = as_type<float>(_282) * _355;
    if (_200)
    {
        bool _365 = _206 > 0.5;
        _252 = _365;
    }
    bool _367 = _252;
    int _369 = _359 * int(_315);
    int _371 = _369 + _286;
    float _373 = _214 ? as_type<float>(_361) : _194;
    float _375 = trunc(_363);
    float _377 = precise::max(_375, 0.0);
    uint _379 = uint(_377);
    int _381 = _371;
    if (_210)
    {
        float _383 = _262 ? _341 : _194;
        _254 = _383;
    }
    float _385 = _254;
    float _387 = float(uint(_371));
    if (_200)
    {
        float _389 = -_216;
        float _391 = _389 + 1.0;
        _381 = as_type<int>(_391);
    }
    int _393 = _381;
    if (!_298)
    {
        _331 = 2;
    }
    int _395 = _331;
    if (!_298)
    {
        _345 = _196;
    }
    float _397 = _345;
    float _399 = as_type<float>(_292) * _387;
    if (_200)
    {
        float _401 = _367 ? as_type<float>(_393) : _216;
        _319 = _401;
    }
    float _403 = _319;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _407 = _405 != 0;
    float _409 = trunc(_399);
    float _411 = precise::max(_409, 0.0);
    uint _413 = uint(_411);
    int _415 = ~_222;
    int _417 = _415 + 1;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _425 = _423 != 0;
    int _427 = int(_307) + int(_379);
    float _429 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _433 = _431 != 0;
    float _435 = in.m_57.w;
    int _437 = ~_246;
    int _439 = _437 + 1;
    int _441 = _417 * _427;
    int _443 = _441 + _272;
    bool _445 = !_433;
    int _447 = _445 ? 0 : 1;
    float _449 = -_228;
    float _451 = fma(_429, 2.0, _449);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _455 = _453 != 0;
    bool _457 = uint(_443) >= uint(_222);
    float _459 = -_116;
    float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[76].x, _451);
    int _463 = int(_315) + int(_413);
    float _465 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _467 = !_425;
    int _469 = _467 ? 0 : 1;
    float _471 = fma(_465, -2.0, _226);
    bool _473 = !_421;
    int _475 = _473 ? 0 : 1;
    int _477 = _439 * _463;
    int _479 = _477 + _286;
    bool _481 = !_455;
    int _483 = _481 ? 0 : 1;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _495 = _493 != 0;
    out.m_59.w = _435;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _499 = _497 != 0;
    if (!_298)
    {
        _351 = 1.2345600128173828125;
    }
    float _501 = _351;
    bool _503 = !_457;
    int _505 = _503 ? 0 : (-1);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _513 = _511 != 0;
    bool _515 = !_499;
    int _517 = _515 ? 0 : 1;
    bool _519 = uint(_479) >= uint(_246);
    float _521 = in.m_44.x;
    float _523 = in.m_44.y;
    float _525 = in.m_44.z;
    bool _527 = !_407;
    int _529 = _527 ? 0 : 1;
    bool _531 = !_519;
    int _533 = _531 ? 0 : (-1);
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _541 = _539 != 0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _549 = !_513;
    int _551 = _549 ? 0 : 1;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _555 = _222 == 0;
    float _557 = 1.0 / _545;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _563 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _565 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _571 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _573 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _575 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
    float _577 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[5].x, _571);
    float _579 = fma(_521, (*spvDescriptorSet0.vp_c10)._m0[6].x, _573);
    float _581 = _353 * _206;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _583;
    out.m_61.x = _563;
    out.m_61.y = _565;
    out.m_61.z = _567;
    out.m_61.w = _561;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _587;
    float _591 = floor(_581);
    float _593 = _585 * _557;
    float _595 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[4].z, _575);
    float _597 = float(_272);
    float _599 = _397 * _501;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _605 = _589 * _349;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _609 = _188 + _607;
    int _611 = abs(_529);
    float _613 = _603 * _294;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _617 = _188 + _615;
    int _619 = abs(_469);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _188 + _621;
    float _625 = float(_222);
    float _627 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[5].z, _577);
    float _629 = fma(_605, _617, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _631 = fma(_593, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _633 = _597 >= _625;
    bool _635 = isnan(_597);
    bool _637 = _633 || _635;
    bool _639 = isnan(_625);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = floor(_599);
    float _647 = -_591;
    float _649 = _581 + _647;
    int _651 = ~_427;
    int _653 = _651 + _505;
    int _655 = _653 + 1;
    float _657 = fma(_613, _609, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _659 = float(_286);
    float _661 = _625 * _649;
    float _663 = _164 * _625;
    int _665 = _222 * _655;
    int _667 = _665 + _272;
    float _669 = trunc(_643);
    int _671 = int(_669);
    bool _673 = _659 >= _268;
    bool _675 = isnan(_659);
    bool _677 = _673 || _675;
    bool _679 = isnan(_268);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _164 * _268;
    float _687 = fma(_525, (*spvDescriptorSet0.vp_c10)._m0[6].z, _579);
    bool _689 = !_555;
    int _691 = _689 ? _667 : (-1);
    float _693 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _695 = ~_463;
    int _697 = _695 + _533;
    int _699 = _697 + 1;
    float _701 = trunc(_683);
    int _703 = int(_701);
    float _705 = -_645;
    float _707 = _599 + _705;
    bool _709 = !_537;
    int _711 = _709 ? 0 : 1;
    int _713 = _246 * _699;
    int _715 = _713 + _286;
    bool _717 = _246 == 0;
    float _719 = _268 * _707;
    bool _721 = !_509;
    int _723 = _721 ? 0 : 1;
    float _725 = trunc(_661);
    int _727 = int(_725);
    int _729 = ~_671;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    bool _735 = _395 != 2;
    int _737 = _222 + (-1);
    int _739 = _691 * _733;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _743 = trunc(_685);
    int _745 = int(_743);
    int _747 = ~_703;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _755 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _471);
    bool _757 = !_717;
    int _759 = _757 ? _715 : (-1);
    float _761 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _763 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _753);
    int _765 = _246 + (-1);
    float _767 = trunc(_719);
    int _769 = int(_767);
    int _771 = abs(_551);
    float _773 = -_755;
    float _775 = fma(_763, _761, _773);
    int _777 = _727 * _611;
    int _779 = _777 + _272;
    int _781 = abs(_517);
    int _783 = _759 * _751;
    int _785 = abs(_475);
    int _787 = _671 * _737;
    int _789 = _787 + _739;
    float _791 = trunc(_663);
    int _793 = int(_791);
    int _795 = _703 * _765;
    int _797 = _795 + _783;
    int _799 = abs(_723);
    int _801 = _769 * _781;
    int _803 = _801 + _286;
    int _805 = _789 * _619;
    int _807 = _797 * _771;
    int _809 = abs(_483);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _813 = abs(_711);
    int _815 = _745 * _799;
    int _817 = _815 + _807;
    int _819 = _793 * _785;
    int _821 = _819 + _805;
    int _823 = abs(_447);
    int _825 = _803 * _813;
    int _827 = _825 + _817;
    bool _829 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _831 = isnan(_188);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    int _841 = _779 * _809;
    int _843 = _841 + _821;
    bool _845 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _847 = isnan(_188);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    int _857 = _711;
    float _859 = _719;
    float _861 = _579;
    float _863 = as_type<float>(_739);
    float _865 = _763;
    if (_487)
    {
        float _867 = -_216;
        float _869 = _867 + 1.0;
        _857 = as_type<int>(_869);
    }
    int _871 = _857;
    bool _873 = !_541;
    int _875 = _873 ? 0 : 1;
    float _877 = -_839;
    float _879 = _877 + 1.0;
    int _881 = _727 * _823;
    int _883 = _881 + _843;
    bool _885 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _887 = isnan(_188);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -_855;
    float _899 = _897 + 1.0;
    int _901 = abs(_875);
    float _903 = _855 * _879;
    bool _905 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _907 = isnan(_188);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _895 * _899;
    float _919 = -_895;
    float _921 = _919 + 1.0;
    int _923 = _769 * _901;
    int _925 = _923 + _827;
    float _927 = float(uint(_883));
    float _929 = _811 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _931 = _915 * _921;
    bool _933 = _196 > 0.5;
    float _935 = float(uint(_925));
    float _937 = as_type<float>(_282) * _927;
    float _939 = fma(_929, _385, -0.5);
    float _941 = _899;
    float _943 = _915;
    if (!_487)
    {
        _941 = _216;
    }
    float _945 = _941;
    float _947 = _631 * _931;
    float _949 = as_type<float>(_292) * _935;
    float _951 = trunc(_937);
    float _953 = precise::max(_951, 0.0);
    uint _955 = uint(_953);
    float _957 = _945;
    if (_487)
    {
        float _959 = _933 ? as_type<float>(_871) : _216;
        _957 = _959;
    }
    float _961 = _957;
    float _963 = -_915;
    float _965 = _963 + 1.0;
    int _967 = ~_222;
    int _969 = _967 + 1;
    if (_735)
    {
        _943 = _206;
    }
    float _971 = _943;
    float _973 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[115].x, _947);
    float _975 = _971;
    if (!_735)
    {
        _975 = _224;
    }
    float _977 = _975;
    float _979 = trunc(_949);
    float _981 = precise::max(_979, 0.0);
    uint _983 = uint(_981);
    float _985 = fma(_657, _917, _973);
    float _987 = float(uint(_779));
    float _989 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _991 = ~_246;
    int _993 = _991 + 1;
    float _995 = fma(_629, _903, _985);
    int _997 = _969 * int(_955);
    int _999 = _997 + _883;
    float _1001 = as_type<float>(_282) * _987;
    float _1003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1005 = _977 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1007 = float(uint(_999));
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1011 = _993 * int(_983);
    int _1013 = _1011 + _925;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1017 = trunc(_1001);
    float _1019 = precise::max(_1017, 0.0);
    uint _1021 = uint(_1019);
    float _1023 = as_type<float>(_282) * _1007;
    float _1025 = float(uint(_803));
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1029 = float(uint(_1013));
    float _1031 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1015);
    int _1033 = ~_222;
    int _1035 = _1033 + 1;
    float _1037 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1009);
    float _1039 = trunc(_1023);
    float _1041 = precise::max(_1039, 0.0);
    uint _1043 = uint(_1041);
    float _1045 = as_type<float>(_292) * _1029;
    float _1047 = _1009;
    if (_735)
    {
        _1047 = _196;
    }
    float _1049 = _1047;
    float _1051 = as_type<float>(_292) * _1025;
    float _1053 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1027);
    float _1055 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1057 = _1049;
    if (!_735)
    {
        _1057 = _206;
    }
    float _1059 = _1057;
    float _1061 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1031);
    float _1063 = trunc(_1045);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    int _1069 = _1035 * int(_1021);
    int _1071 = _1069 + _779;
    float _1073 = fma(_1055, _961, -0.5);
    float _1075 = fma(_1061, _989, _461);
    int _1077 = ~_222;
    int _1079 = _1077 + 1;
    float _1081 = float(uint(_1071));
    float _1083 = trunc(_1051);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    int _1089 = int(_955) + int(_1043);
    float _1091 = as_type<float>(_282) * _1081;
    int _1093 = ~_246;
    int _1095 = _1093 + 1;
    int _1097 = _1079 * _1089;
    int _1099 = _1097 + _883;
    int _1101 = int(_983) + int(_1067);
    float _1103 = trunc(_1091);
    float _1105 = precise::max(_1103, 0.0);
    uint _1107 = uint(_1105);
    int _1109 = ~_246;
    int _1111 = _1109 + 1;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1115 = uint(_1099) >= uint(_222);
    int _1117 = _1095 * _1101;
    int _1119 = _1117 + _925;
    float _1121 = -_1113;
    float _1123 = fma(_1005, 2.0, _1121);
    int _1125 = _1111 * int(_1087);
    int _1127 = _1125 + _803;
    float _1129 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1131 = uint(_1119) >= uint(_246);
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1135 = !_1115;
    int _1137 = _1135 ? 0 : (-1);
    float _1139 = -_116;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1123);
    float _1143 = float(uint(_1127));
    float _1145 = fma(_1129, -2.0, _1133);
    bool _1147 = !_1131;
    int _1149 = _1147 ? 0 : (-1);
    float _1151 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[118].x, _995);
    int _1153 = ~_1089;
    int _1155 = _1153 + _1137;
    int _1157 = _1155 + 1;
    float _1159 = as_type<float>(_292) * _1143;
    int _1161 = ~_1101;
    int _1163 = _1161 + _1149;
    int _1165 = _1163 + 1;
    float _1167 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1053);
    int _1169 = int(_1021) + int(_1107);
    int _1171 = _222 * _1157;
    int _1173 = _1171 + _883;
    float _1175 = trunc(_1159);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = _246 * _1165;
    int _1183 = _1181 + _925;
    int _1185 = ~_222;
    int _1187 = _1185 + 1;
    float _1189 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1037);
    bool _1191 = !_555;
    int _1193 = _1191 ? _1173 : (-1);
    float _1195 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1145);
    bool _1197 = !_717;
    int _1199 = _1197 ? _1183 : (-1);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _693 + _1201;
    float _1205 = fma(_1167, _1073, _1141);
    int _1207 = _1193 >> 31;
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1211 = _1199 >> 31;
    int _1213 = _1187 * _1169;
    int _1215 = _1213 + _779;
    int _1217 = _1193 & 3;
    int _1219 = _1207 & 3;
    int _1221 = _1211 & 3;
    int _1223 = int(_1087) + int(_1179);
    bool _1225 = uint(_1217) > 1u;
    int _1227 = _1193 & 3;
    bool _1229 = _1227 != 0;
    int _1231 = _1193 + _1219;
    int _1233 = _1199 + _1221;
    int _1235 = _1231 >> 2;
    int _1237 = _1233 >> 2;
    int _1239 = _1229 ? 0 : 1;
    int _1241 = _1237 << 4;
    int _1243 = _1241 + 512;
    float _1245 = _687 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1247 = _1235 << 4;
    int _1249 = _1247 + 368;
    float _1251 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1253 = ~_1239;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    uint _1259 = uint(int(uint(_1243) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    bool _1275 = uint(_1215) >= uint(_222);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1279 = _1251 + _1277;
    int _1281 = _1257;
    if (!_1225)
    {
        int _1283 = ~_1239;
        int _1285 = _1283 + 1;
        _1281 = _1285;
    }
    int _1287 = _1281;
    int _1289 = _1199 & 3;
    float _1291 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1209);
    bool _1293 = !_1275;
    int _1295 = _1293 ? 0 : (-1);
    uint _1297 = uint(int(uint(_1249) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[int(_1307)][_1309];
    bool _1313 = uint(_1217) >= 2u;
    bool _1315 = uint(_1289) > 1u;
    int _1317 = ~_1169;
    int _1319 = _1317 + _1295;
    int _1321 = _1319 + 1;
    int _1323 = _1313 ? 0 : 1;
    int _1325 = _1249 + 8;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    uint _1329 = uint(int(uint(int(_1327)) >> uint(2)));
    int _1331 = int(_1327) & 3;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[int(_1329)][_1331];
    int _1335 = int(_1327) + 1;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    int _1339 = _1335 & 3;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[int(_1337)][_1339];
    int _1343 = _1199 & 3;
    bool _1345 = _1343 != 0;
    int _1347 = _222 * _1321;
    int _1349 = _1347 + _779;
    bool _1351 = !_1229;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1245 + _1355;
    int _1359 = _1345 ? 0 : 1;
    bool _1361 = _1217 != 3;
    int _1363 = _1243 + 8;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    int _1381 = ~_1359;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1291);
    int _1389 = _1385;
    if (!_1315)
    {
        int _1391 = ~_1359;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    bool _1397 = uint(_1289) >= 2u;
    int _1399 = abs(_1395);
    bool _1401 = !_1345;
    int _1403 = _1401 ? 0 : 1;
    int _1405 = abs(_1353);
    bool _1407 = _1217 != 3;
    int _1409 = ~_1323;
    int _1411 = _1409 + 1;
    int _1413 = _1411 + 1;
    int _1415 = abs(_1287);
    int _1417 = _1413;
    if (_1361)
    {
        int _1419 = ~_1323;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    int _1425 = _1397 ? 0 : 1;
    bool _1427 = _1289 != 3;
    int _1429 = ~_1399;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    int _1435 = abs(_1403);
    int _1437 = ~_1415;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    int _1443 = _1433 * as_type<int>(_1273);
    int _1445 = abs(_1423);
    int _1447 = ~_1405;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    int _1453 = _1441 * as_type<int>(_1311);
    int _1455 = ~_246;
    int _1457 = _1455 + 1;
    int _1459 = _1451 * as_type<int>(_1303);
    int _1461 = _1459 + _1453;
    int _1463 = _1457 * _1223;
    int _1465 = _1463 + _803;
    int _1467 = ~_1435;
    int _1469 = _1467 + 1;
    int _1471 = _1469 + 1;
    int _1473 = ~_1445;
    int _1475 = _1473 + 1;
    int _1477 = _1475 + 1;
    int _1479 = ~_1425;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    int _1485 = _1471 * as_type<int>(_1265);
    int _1487 = _1485 + _1443;
    bool _1489 = !_491;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1477 * as_type<int>(_1333);
    int _1495 = _1493 + _1461;
    bool _1497 = _1289 != 3;
    int _1499 = _1483;
    if (_1427)
    {
        int _1501 = ~_1425;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    bool _1507 = uint(_1465) >= uint(_246);
    bool _1509 = !_1407;
    int _1511 = _1509 ? 0 : (-1);
    int _1513 = abs(_1505);
    bool _1515 = !_495;
    int _1517 = _1515 ? 0 : 1;
    bool _1519 = !_1497;
    int _1521 = _1519 ? 0 : (-1);
    bool _1523 = !_1507;
    int _1525 = _1523 ? 0 : (-1);
    int _1527 = abs(_1511);
    int _1529 = abs(_1491);
    int _1531 = abs(_1521);
    int _1533 = ~_1513;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    int _1539 = abs(_1517);
    int _1541 = ~_1223;
    int _1543 = _1541 + _1525;
    int _1545 = _1543 + 1;
    int _1547 = _1537 * as_type<int>(_1371);
    int _1549 = _1547 + _1487;
    int _1551 = ~_1527;
    int _1553 = _1551 + 1;
    int _1555 = _1553 + 1;
    int _1557 = _246 * _1545;
    int _1559 = _1557 + _803;
    int _1561 = ~_1531;
    int _1563 = _1561 + 1;
    int _1565 = _1563 + 1;
    int _1567 = _1555 * as_type<int>(_1341);
    int _1569 = _1567 + _1495;
    int _1571 = ~_1529;
    int _1573 = _1571 + 1;
    int _1575 = _1573 + 1;
    float _1577 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1579 = ~_1539;
    int _1581 = _1579 + 1;
    int _1583 = _1581 + 1;
    int _1585 = _1565 * as_type<int>(_1379);
    int _1587 = _1585 + _1549;
    bool _1589 = _1387 >= 0.0;
    int _1591 = _1569 * _1575;
    bool _1593 = !_717;
    int _1595 = _1593 ? _1559 : (-1);
    int _1597 = _1587 * _1583;
    bool _1599 = !_555;
    int _1601 = _1599 ? _1349 : (-1);
    float _1603 = -_1195;
    float _1605 = fma(_1189, _939, _1603);
    int _1607 = _1595 * _1539;
    int _1609 = _1607 + _1597;
    float _1611 = _1203 * _1203;
    int _1613 = _1601 * _1529;
    int _1615 = _1613 + _1591;
    float _1617 = fma(_1279, _1279, _1611);
    float _1619 = as_type<float>(_1587);
    float _1621 = as_type<float>(_1609);
    if (_1589)
    {
        _1619 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1623 = _1619;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1629 = fma(_1357, _1357, _1617);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1633 = _775 + 0.5;
    float _1635 = _1075 + 0.5;
    float _1637 = rsqrt(_1629);
    float _1639 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1205 + 0.5;
    float _1647 = _1605 + 0.5;
    int _1649 = as_type<int>(_1623);
    if (_1589)
    {
        float _1651 = _1623 * 5.0;
        _1649 = as_type<int>(_1651);
    }
    int _1653 = _1649;
    float _1655 = float(_1615);
    out.m_63.x = _1635;
    out.m_63.y = _1633;
    float _1657 = float(_1609);
    out.m_65.x = _1639;
    out.m_65.y = _1641;
    out.m_65.z = _1643;
    out.m_65.w = _1577;
    float _1659 = _1203 * _1637;
    if (_1589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5385 = as_type<float>(_1653);
        out.gl_Position.z = _5385;
    }
    float _1661 = _1279 * _1637;
    out.m_67.x = _1645;
    out.m_67.y = _1647;
    out.m_69.x = _1655;
    out.m_69.y = _1657;
    if (_1589)
    {
        out.m_51.x = 0.0;
    }
    if (_1589)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1663 = -_1659;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1667 = _1357 * _1637;
    float _1669 = -_1661;
    float _1671 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1675 = _1665 + _1673;
    float _1677 = -_1667;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1683 = _1671 + _1681;
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1679 + _1687;
    float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1685);
    float _1693 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1691);
    bool _1695 = _1693 >= 0.0;
    if (_1695)
    {
        _1621 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1697 = _1621;
    int _1699 = as_type<int>(_1697);
    if (_1695)
    {
        out.m_51.x = 0.0;
    }
    if (_1695)
    {
        float _1701 = _1697 * 5.0;
        _1699 = as_type<int>(_1701);
    }
    int _1703 = _1699;
    if (_1695)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5490 = as_type<float>(_1703);
        out.gl_Position.z = _5490;
    }
    if (_1695)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1705 = -_693;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1709 = -_1251;
    float _1711 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1713 = -_1245;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1717 = -_1659;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1203);
    float _1721 = _1707 * _1707;
    float _1723 = -_1661;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1727 = in.m_71.x;
    float _1729 = in.m_71.y;
    float _1731 = in.m_71.z;
    float _1733 = _1719 * _1719;
    float _1735 = fma(_1711, _1711, _1721);
    float _1737 = -_1667;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1741 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1743 = fma(_1725, _1725, _1733);
    float _1745 = fma(_1715, _1715, _1735);
    float _1747 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1741);
    float _1749 = fma(_1739, _1739, _1743);
    bool _1751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    float _1761 = rsqrt(_1745);
    float _1763 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    bool _1765 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1767 = isnan(0.5);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1773 = _1769 || _1771;
    float _1775 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1777 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1779 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1781 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1783 = _1711 * _1761;
    float _1785 = _1715 * _1761;
    float _1787 = _1707 * _1761;
    float _1789 = _1781 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1793 = _1783 * _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = _1785 * _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1801 = _1787 * _1799;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1805 = -_1793;
    float _1807 = fma(_1785, _1803, _1805);
    float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1811 = -_1797;
    float _1813 = fma(_1787, _1809, _1811);
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1817 = -_1801;
    float _1819 = fma(_1783, _1815, _1817);
    float _1821 = in.m_73.x;
    float _1823 = in.m_73.y;
    float _1825 = in.m_73.z;
    float _1827 = _1807 * _1807;
    float _1829 = sqrt(_1749);
    float _1831 = _1777 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1833 = fma(_1813, _1813, _1827);
    float _1835 = fma(_1819, _1819, _1833);
    float _1837 = rsqrt(_1835);
    float _1839 = _1637 * _1829;
    float _1841 = _1779 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1843 = _1839 * _1831;
    float _1845 = _1839 * _1841;
    float _1847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1823);
    float _1849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1821);
    float _1851 = _1847 * _1843;
    float _1853 = _1813 * _1837;
    float _1855 = _1807 * _1837;
    float _1857 = _1819 * _1837;
    float _1859 = _1849 * _1845;
    float _1861 = _1787 * _1853;
    float _1863 = _1785 * _1855;
    float _1865 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1825);
    float _1867 = _1839 * _1789;
    float _1869 = -_1861;
    float _1871 = fma(_1783, _1855, _1869);
    float _1873 = -_1863;
    float _1875 = fma(_1787, _1857, _1873);
    float _1877 = _1783 * _1857;
    float _1879 = _1865 * _1867;
    float _1881 = _1851 * _1871;
    float _1883 = _1851 * _1875;
    float _1885 = -_1877;
    float _1887 = fma(_1785, _1853, _1885);
    float _1889 = fma(_1859, _1857, _1881);
    float _1891 = fma(_1859, _1853, _1883);
    float _1893 = fma(_1879, _1785, _1889);
    float _1895 = fma(_1879, _1783, _1891);
    float _1897 = _1245 + _1893;
    float _1899 = _1251 + _1895;
    float _1901 = _1665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1905 = _1897 + _1903;
    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1909 = _1899 + _1907;
    float _1911 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1901);
    float _1913 = _1851 * _1887;
    float _1915 = _1905 * _1905;
    float _1917 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1919 = fma(_1859, _1855, _1913);
    float _1921 = fma(_1909, _1909, _1915);
    float _1923 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1925 = fma(_1879, _1787, _1919);
    float _1927 = sqrt(_1921);
    float _1929 = _1775 + _1923;
    float _1931 = _693 + _1925;
    float _1933 = 1.0 / _1923;
    bool _1935 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1937 = _1925;
    float _1939 = _1919;
    float _1941 = _1931;
    float _1943 = _1899;
    float _1945 = _1929;
    float _1947 = _1905;
    float _1949 = _1909;
    if (!_1935)
    {
        _1937 = _1899;
    }
    float _1951 = _1937;
    float _1953 = _1951;
    if (!_1935)
    {
        _1939 = _1897;
    }
    float _1955 = _1939;
    bool _1957 = !_1935;
    float _1959 = _1955;
    if (!_1957)
    {
        float _1961 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1965 = _1927 + _1963;
        float _1967 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1969 = rsqrt(_1921);
        float _1971 = _1965 * _1961;
        float _1973 = _1971 * 0.15915493667125701904296875;
        float _1975 = _1973 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        float _1979 = _1973 * 6.283185482025146484375;
        float _1981 = sin(_1979);
        float _1983 = _1977 + (-1.0);
        float _1985 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1987 = fma(_1981, _1967, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1989 = fma(_1931, _1977, _1985);
        float _1991 = _1969 * _1987;
        float _1993 = fma(_1909, _1991, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1995 = fma(_1905, _1991, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1959 = _1995;
        _1941 = _1989;
        _1953 = _1993;
        _1943 = _1985;
    }
    float _1997 = _1959;
    float _1999 = _1941;
    float _2001 = _1953;
    float _2003 = _1943;
    float _2005 = -_1667;
    float _2007 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1997);
    float _2009 = -_1659;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1999);
    float _2013 = _1929 * _1933;
    float _2015 = _2013 * 0.5;
    float _2017 = -_1661;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2001);
    float _2021 = _2003;
    float _2023 = _2011;
    float _2025 = _2019;
    float _2027 = _2015;
    float _2029 = _2001;
    if (_1773)
    {
        _2021 = 1.0;
    }
    float _2031 = _2021;
    float _2033 = _2031;
    if (_1759)
    {
        _1945 = _2007;
    }
    float _2035 = _1945;
    float _2037 = _2035;
    if (!_1759)
    {
        float _2039 = _1675 * _1675;
        float _2041 = 1.0 / _1839;
        float _2043 = -_1251;
        float _2045 = _2043 + _2001;
        float _2047 = -_693;
        float _2049 = _2047 + _1999;
        float _2051 = fma(_1683, _1683, _2039);
        float _2053 = -_1245;
        float _2055 = _2053 + _1997;
        float _2057 = fma(_1689, _1689, _2051);
        float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2061 = sqrt(_2057);
        float _2063 = precise::min(_2061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2059;
        float _2067 = _2065 * _2041;
        float _2069 = fma(_2045, _2067, _1671);
        float _2071 = fma(_2049, _2067, _1665);
        float _2073 = fma(_2055, _2067, _1679);
        _2023 = _2071;
        _2025 = _2069;
        _2037 = _2073;
        _1947 = _2059;
        _1949 = _2067;
    }
    float _2075 = _2023;
    float _2077 = _2025;
    float _2079 = _2037;
    float _2081 = _1947;
    float _2083 = _1949;
    float _2085 = _2081;
    float _2087 = _2083;
    if (!_1773)
    {
        float _2089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2091 = _2089 * 0.15915493667125701904296875;
        float _2093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2097 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2095);
        float _2099 = _2091 * 6.283185482025146484375;
        float _2101 = cos(_2099);
        float _2103 = _2093 * 0.15915493667125701904296875;
        float _2105 = _2091 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        float _2109 = 1.0 / _2101;
        float _2111 = _2103 * 6.283185482025146484375;
        float _2113 = cos(_2111);
        float _2115 = _2107 * _2109;
        float _2117 = _2103 * 6.283185482025146484375;
        float _2119 = sin(_2117);
        float _2121 = _2113 * _2115;
        float _2123 = 1.0 / _2097;
        float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2127 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2125;
        float _2129 = 1.0 / _2121;
        float _2131 = 1.0 / _2127;
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2135 = _2123 * _2133;
        float _2137 = _2119 * _2129;
        float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2141 = fma(_2137, _2135, _2139);
        float _2143 = _2141 * _2131;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2085 = _2131;
        _2087 = _2103;
        _2027 = _2123;
        _2033 = _2145;
    }
    float _2147 = _2085;
    float _2149 = _2087;
    float _2151 = _2027;
    float _2153 = _2033;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2157 = _2075 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2161 = _2077 + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2165 = _2079 + _2163;
    float _2167 = _2157 * _2157;
    float _2169 = fma(_2161, _2161, _2167);
    float _2171 = fma(_2165, _2165, _2169);
    float _2173 = rsqrt(_2171);
    float _2175 = sqrt(_2171);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2179 = _2161 * _2177;
    float _2181 = _2165 * _2177;
    float _2183 = _2179 * _2179;
    float _2185 = _2181 * _2181;
    float _2187 = _2183 + _2185;
    float _2189 = sqrt(_2187);
    bool _2191 = _2189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2195 = _2189 + _2193;
    float _2197 = _2147;
    float _2199 = _2195;
    float _2201 = _2157;
    float _2203 = _2151;
    float _2205 = _2179;
    if (_2191)
    {
        float _2207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2197 = _2207;
    }
    float _2209 = _2197;
    float _2211 = _2209;
    if (_2191)
    {
        float _2213 = _2195 * _2209;
        _2199 = _2213;
    }
    float _2215 = _2199;
    if (_2191)
    {
        float _2217 = rsqrt(_2187);
        _2211 = _2217;
    }
    float _2219 = _2211;
    float _2221 = _2219;
    if (_2191)
    {
        float _2223 = _2215 * 0.15915493667125701904296875;
        _2029 = _2223;
    }
    float _2225 = _2029;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = _2165;
    if (_2191)
    {
        float _2231 = _2225 * 6.283185482025146484375;
        float _2233 = sin(_2231);
        _2229 = _2233;
    }
    float _2235 = _2229;
    float _2237 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2239 = precise::max(0.0, _2227);
    float _2241 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2237);
    float _2243 = _2149;
    float _2245 = _2239;
    if (_2191)
    {
        float _2247 = _2225 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = -_2177;
    float _2255 = -_2239;
    float _2257 = fma(_2157, _2253, _2255);
    if (_2191)
    {
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2259;
    }
    float _2261 = _2201;
    float _2263 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2265 = _2235;
    float _2267 = _2261;
    if (_2191)
    {
        float _2269 = fma(_2235, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = _2271;
    if (!_2191)
    {
        _2267 = _2257;
    }
    float _2275 = _2267;
    float _2277 = _2275;
    if (_2191)
    {
        float _2279 = _2219 * _2271;
        _2203 = _2279;
    }
    float _2281 = _2203;
    if (!_2191)
    {
        _2273 = _2183;
    }
    float _2283 = _2273;
    float _2285 = _2283;
    float _2287 = _2251;
    if (_2191)
    {
        float _2289 = _2251 + (-1.0);
        _2245 = _2289;
    }
    float _2291 = _2245;
    float _2293 = _2291;
    if (_2191)
    {
        float _2295 = _2179 * _2281;
        _2205 = _2295;
    }
    float _2297 = _2205;
    if (_2191)
    {
        float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2299;
    }
    float _2301 = _2221;
    if (!_2191)
    {
        _2293 = _2181;
    }
    float _2303 = _2293;
    float _2305 = _2303;
    if (_2191)
    {
        float _2307 = _2181 * _2281;
        _2305 = _2307;
    }
    float _2309 = _2305;
    if (_2191)
    {
        float _2311 = _2297 * _2297;
        _2285 = _2311;
    }
    float _2313 = _2285;
    if (_2191)
    {
        float _2315 = fma(_2257, _2251, _2301);
        _2277 = _2315;
    }
    float _2317 = _2277;
    if (!_2191)
    {
        _2287 = _2185;
    }
    float _2319 = _2287;
    float _2321 = _2319;
    if (_2191)
    {
        float _2323 = _2309 * _2309;
        _2321 = _2323;
    }
    float _2325 = _2321;
    float _2327 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2329 = fma(_2317, _2317, _2313);
    float _2331 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2327);
    float _2333 = _2329 + _2325;
    float _2335 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2339 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2337);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2331);
    float _2345 = rsqrt(_2333);
    float _2347 = _2075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2349 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2335);
    float _2351 = -_2341;
    float _2353 = _2351 + 1.0;
    float _2355 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2357 = fma(_2077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2347);
    float _2359 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2349);
    float _2361 = abs(_2353);
    float _2363 = log2(_2361);
    float _2365 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2357);
    float _2367 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2369 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2371 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2373 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2375 = -_2369;
    float _2377 = fma(_2375, _2263, 1.0);
    float _2379 = _2345 * _2297;
    float _2381 = _2345 * _2317;
    float _2383 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2241);
    float _2385 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2373);
    float _2387 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2389 = _2345 * _2309;
    float _2391 = _2383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2393 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2385);
    float _2395 = -_2387;
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2395);
    float _2399 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2401 = log2(_2377);
    float _2403 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2393);
    float _2405 = -_2389;
    float _2407 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2397);
    float _2409 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2411 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2413 = fma(_2407, -0.5, 0.5);
    float _2415 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2409);
    float _2417 = 1.0 / _2403;
    float _2419 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2411);
    float _2421 = fma(_2407, 0.5, 0.5);
    float _2423 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2415);
    float _2425 = _2381 + 1.0;
    float _2427 = fma(_2421, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2429 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2423);
    float _2431 = exp2(_2399);
    float _2433 = _2401 * 0.693147182464599609375;
    float _2435 = fma(_2421, _2427, -0.212114393711090087890625);
    float _2437 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2439 = fma(_2421, _2435, 1.570728778839111328125);
    float _2441 = sqrt(_2413);
    float _2443 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2419);
    float _2445 = _2429 * _2417;
    float _2447 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2443);
    float _2449 = fma(_2445, 0.5, 0.5);
    float _2451 = -_2381;
    float _2453 = fma(_2431, _2425, _2451);
    float _2455 = _2447 * _2417;
    float _2457 = fma(_2453, 0.5, 0.5);
    float _2459 = fma(_2455, -0.5, 0.5);
    float _2461 = _2441 * 0.636619746685028076171875;
    float3 _6682 = float3(_2449, _2459, _2437);
    float _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6682, float3(0.0), isnan(_6682)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6682, float3(0.0), isnan(_6682)), level(0.0)).x;
    float3 _6693 = float3(_2449, _2459, _2437);
    float4 _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6693, float3(0.0), isnan(_6693)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6693, float3(0.0), isnan(_6693)), level(0.0)).xyzw;
    float _2468 = _2466.x;
    float _2470 = _2466.y;
    float _2472 = _2466.z;
    float _2474 = _2466.w;
    float _2476 = -_2439;
    float _2478 = fma(_2461, _2476, 1.0);
    float2 _6715 = float2(_2478, _2457);
    float3 _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).xyz;
    float _2484 = _2482.x;
    float _2486 = _2482.y;
    float _2488 = _2482.z;
    float _2490 = in.m_75.x;
    float _2492 = in.m_75.y;
    float _2494 = in.m_75.z;
    bool _2496 = _1823 != 0.0;
    bool _2498 = isnan(_1823);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(0.0);
    bool _2504 = _2500 || _2502;
    float _2506 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2508 = in.m_77.x;
    float _2510 = in.m_77.y;
    float _2512 = in.m_77.z;
    float _2514 = in.m_77.w;
    bool _2516 = _1821 == 0.0;
    bool _2518 = !_2504;
    bool _2520 = _2516 && _2518;
    float _2522 = exp2(_2506);
    bool _2524 = _1825 == 0.0;
    bool _2526 = _2524 && _2520;
    float _2528 = _2449;
    float _2530 = _2459;
    float _2532 = _2403;
    float _2534 = _2429;
    float _2536 = _2447;
    if (_2526)
    {
        _859 = _2490;
    }
    float _2538 = _859;
    float _2540 = -_2522;
    float _2542 = _2540 + 1.0;
    float _2544 = _2538;
    if (_2526)
    {
        _861 = _2494;
    }
    float _2546 = _861;
    float _2548 = _2546;
    if (_2526)
    {
        _863 = _2492;
    }
    float _2550 = _863;
    float _2552 = _2550;
    if (_2526)
    {
        _865 = _2538;
    }
    float _2554 = _865;
    float _2556 = _2554;
    if (!_2526)
    {
        _2544 = _2490;
    }
    float _2558 = _2544;
    if (_2526)
    {
        _2528 = _2546;
    }
    float _2560 = _2528;
    float _2562 = _2560;
    if (_2526)
    {
        _2530 = _2550;
    }
    float _2564 = _2530;
    float _2566 = _2512 * _2558;
    float _2568 = _2564;
    if (!_2526)
    {
        _2548 = _2494;
    }
    float _2570 = _2548;
    if (!_2526)
    {
        float _2572 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2558);
        _2556 = _2572;
    }
    float _2574 = _2556;
    if (!_2526)
    {
        _2552 = _2492;
    }
    float _2576 = _2552;
    float _2578 = _2510 * _2570;
    float _2580 = -_2566;
    float _2582 = fma(_2508, _2570, _2580);
    float _2584 = _2508 * _2576;
    if (!_2526)
    {
        float _2586 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2576);
        _2568 = _2586;
    }
    float _2588 = _2568;
    float _2590 = -_2578;
    float _2592 = fma(_2512, _2576, _2590);
    float _2594 = _2582 * _2514;
    float _2596 = -_2584;
    float _2598 = fma(_2510, _2558, _2596);
    if (!_2526)
    {
        float _2600 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2570);
        _2562 = _2600;
    }
    float _2602 = _2562;
    float _2604 = _2592 * _2514;
    float _2606 = _1887 * _2510;
    float _2608 = _2598 * _2514;
    float _2610 = _1875 * _2510;
    float _2612 = _1871 * _2510;
    float _2614 = _2594 * _1887;
    float _2616 = _2594 * _1875;
    float _2618 = _2594 * _1871;
    float _2620 = _1875 * _2588;
    float _2622 = _1887 * _2588;
    float _2624 = fma(_1853, _2508, _2610);
    float _2626 = fma(_1855, _2508, _2606);
    float _2628 = fma(_1857, _2508, _2612);
    float _2630 = fma(_2604, _1855, _2614);
    float _2632 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2634 = fma(_2604, _1853, _2616);
    float _2636 = fma(_2604, _1857, _2618);
    float _2638 = fma(_1855, _2574, _2622);
    float _2640 = fma(_2608, _1787, _2630);
    float _2642 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2632);
    float _2644 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2646 = _1871 * _2588;
    float _2648 = fma(_1787, _2602, _2638);
    float _2650 = fma(_2355, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2642);
    float _2652 = fma(_1783, _2512, _2624);
    float _2654 = fma(_1787, _2512, _2626);
    float _2656 = fma(_1785, _2512, _2628);
    float _2658 = fma(_1857, _2574, _2646);
    float _2660 = fma(_2608, _1783, _2634);
    float _2662 = _2403 * 0.5;
    float _2664 = fma(_1853, _2574, _2620);
    out.m_79.x = _2652;
    out.m_79.y = _2654;
    out.m_79.z = _2656;
    float _2666 = fma(_1785, _2602, _2658);
    float _2668 = fma(_2447, -0.5, _2662);
    float _2670 = fma(_1783, _2602, _2664);
    bool _2672 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2674 = isnan(_2175);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2680 = _2676 || _2678;
    float _2682 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2650);
    float _2684 = _2429 + _2403;
    float _2686 = fma(_2608, _1785, _2636);
    out.m_81.x = _2670;
    out.m_81.y = _2648;
    out.m_81.z = _2666;
    float _2688 = _2682 + _2403;
    float _2690 = _2684 * 0.5;
    out.m_83.x = _2660;
    out.m_83.y = _2640;
    out.m_83.z = _2686;
    float _2692 = _2688 * 0.5;
    out.gl_Position.x = _2429;
    out.gl_Position.y = _2447;
    out.gl_Position.z = _2682;
    out.gl_Position.w = _2403;
    out.m_85.x = _2690;
    out.m_85.y = _2668;
    out.m_85.z = _2692;
    out.m_85.w = _2403;
    float _2694 = _2686;
    float _2696 = _2640;
    float _2698 = _2660;
    if (!_2680)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2700 = _2694;
    float _2702 = _2700;
    float _2704 = _2700;
    if (!_2680)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2706 = _2696;
    float _2708 = _2706;
    float _2710 = _2706;
    if (!_2680)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2712 = _2698;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2680)
    {
        _2532 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2532;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2680)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2534;
    float _2726 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2680)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2732 = _2536;
    float _2734 = _2644 * _2463;
    float _2736 = -_2644;
    float _2738 = _2736 + 1.0;
    float _2740 = _2474 * _2734;
    float _2742 = _2488 * _2734;
    float _2744 = fma(_2484, _2740, _2468);
    float _2746 = fma(_2486, _2740, _2470);
    float _2748 = _2474 * _2738;
    float _2750 = fma(_2474, _2742, _2472);
    out.m_87.x = _2744;
    out.m_87.y = _2746;
    out.m_87.z = _2750;
    out.m_87.w = _2748;
    bool _2752 = !_2680;
    float _2754 = _2732;
    float _2756 = _2732;
    if (!_2752)
    {
        bool _2758 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2760 = isnan(_2175);
        bool _2762 = _2758 || _2760;
        bool _2764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2766 = _2762 || _2764;
        if (!_2766)
        {
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2770 = _2175 + _2768;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2774 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2772;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2784 = 1.0 / _2774;
            float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2798 = _2770 * _2784;
            float _2800 = precise::clamp(_2798, 0.0, 1.0);
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2806 = fma(_2800, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2808 = fma(_2800, _2782, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2810 = fma(_2800, _2804, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2812 = fma(_2800, _2788, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2814 = fma(_2800, _2792, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2816 = fma(_2800, _2796, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2710 = _2806;
            _2730 = _2814;
            _2704 = _2808;
            _2722 = _2812;
            _2716 = _2810;
            _2756 = _2816;
            _2818 = true;
        }
        else
        {
            bool _2820 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2822 = isnan(_2175);
            bool _2824 = _2820 || _2822;
            bool _2826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2828 = _2824 || _2826;
            if (!_2828)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2830 = _2720;
            _2722 = _2830;
            if (!_2828)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2832 = _2728;
            _2730 = _2832;
            if (!_2828)
            {
                _2754 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2834 = _2754;
            _2756 = _2834;
            if (!_2828)
            {
                _2702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2836 = _2702;
            _2704 = _2836;
            if (!_2828)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2838 = _2708;
            _2710 = _2838;
            if (!_2828)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2840 = _2714;
            bool _2842 = !_2828;
            _2716 = _2840;
            if (!_2842)
            {
                bool _2844 = _2175 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2846 = isnan(_2175);
                bool _2848 = _2844 || _2846;
                bool _2850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2852 = _2848 || _2850;
                if (!_2852)
                {
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2856 = _2175 + _2854;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2860 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2858;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2870 = 1.0 / _2860;
                    float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2884 = _2856 * _2870;
                    float _2886 = precise::clamp(_2884, 0.0, 1.0);
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2892 = fma(_2886, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2894 = fma(_2886, _2868, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2896 = fma(_2886, _2890, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2898 = fma(_2886, _2874, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2900 = fma(_2886, _2878, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2902 = fma(_2886, _2882, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2710 = _2892;
                    _2730 = _2900;
                    _2704 = _2894;
                    _2722 = _2898;
                    _2716 = _2896;
                    _2756 = _2902;
                    _2818 = true;
                }
                else
                {
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2756 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2818 = false;
    float _2904 = _2710;
    float _2906 = _2730;
    float _2908 = _2704;
    float _2910 = _2722;
    float _2912 = _2716;
    float _2914 = _2756;
    float _2916 = fma(_2648, -0.5, 0.5);
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = -_2904;
    float _2922 = _2906 + _2920;
    float _2924 = _2726 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2926 = -_2908;
    float _2928 = _2910 + _2926;
    float _2930 = fma(_2918, _2922, _2904);
    out.m_89.x = 0.0;
    float _2932 = -_2912;
    float _2934 = _2914 + _2932;
    float _2936 = fma(_2918, _2928, _2908);
    float _2938 = _2930 * 0.586610972881317138671875;
    out.m_51.x = _2924;
    bool _2940 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2942 = fma(_2918, _2934, _2912);
    float _2944 = fma(_2936, 0.298911988735198974609375, _2938);
    bool _2946 = _2153 > 0.0;
    bool _2948 = isnan(_2153);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan(0.0);
    bool _2954 = _2950 || _2952;
    float _2956 = fma(_2942, 0.114477999508380889892578125, _2944);
    float _2958 = -_2956;
    float _2960 = _2936 + _2958;
    float _2962 = -_2956;
    float _2964 = _2930 + _2962;
    float _2966 = -_2956;
    float _2968 = _2942 + _2966;
    float _2970 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2972 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2974 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    bool _2976 = !_2940;
    if (!_2976)
    {
        float _2978 = -_2075;
        float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2982 = -_2077;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2986 = -_2079;
        float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2990 = _2980 * _2980;
        float _2992 = fma(_2984, _2984, _2990);
        float _2994 = fma(_2988, _2988, _2992);
        float _2996 = sqrt(_2994);
        float _2998 = rsqrt(_2994);
        float _3000 = -_2996;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3004 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3006 = precise::clamp(_3004, 0.0, 1.0);
        float _3008 = _2984 * _2998;
        float _3010 = _2980 * _2998;
        float _3012 = abs(_3006);
        float _3014 = log2(_3012);
        float _3016 = _2988 * _2998;
        float _3018 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3020 = _2648 * _3010;
        float _3022 = -_3010;
        float _3024 = -_3018;
        float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3024);
        float _3028 = fma(_2670, _3008, _3020);
        float _3030 = -_3016;
        float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3026);
        float _3034 = fma(_2666, _3016, _3028);
        float _3036 = precise::clamp(_3034, 0.0, 1.0);
        float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3040 = _3032 + _3038;
        float _3042 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3044 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3046 = precise::clamp(_3044, 0.0, 1.0);
        float _3048 = exp2(_3042);
        float _3050 = _3048 * _3046;
        float _3052 = _3036 * _3050;
        float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3056 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3058 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3054;
        out.m_89.y = _3056;
        out.m_89.z = _3058;
    }
    out.m_91.x = _2970;
    out.m_91.y = _2972;
    out.m_91.z = _2974;
    if (_2954)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3060;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

