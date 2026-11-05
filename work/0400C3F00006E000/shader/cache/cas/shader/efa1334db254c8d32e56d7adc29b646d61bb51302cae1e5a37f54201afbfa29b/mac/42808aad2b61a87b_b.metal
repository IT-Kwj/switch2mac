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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_22 [[id(7)]];
    sampler vp_t_tcb_22Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_22Smplr_w [[id(17)]];
    sampler vp_t_tcb_14Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_87 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_83 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_69 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1125 = false;
    bool _1121 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_53.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_56.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2609 = as_type<float>(_124);
        out.gl_Position.z = _2609;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_58.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2678 = as_type<float>(_160);
        out.gl_Position.z = _2678;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = as_type<float>(int(gl_VertexIndex));
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _166 = as_type<int>(_162) & 1;
    bool _168 = _166 != 0;
    int _170 = as_type<int>(_162) & 2;
    bool _172 = _170 != 0;
    bool _174 = !_168;
    float _176 = _174 ? (-0.5) : 0.5;
    bool _178 = !_172;
    float _180 = _178 ? (-0.5) : 0.5;
    bool _182 = !_164;
    float _202;
    float _204;
    if (!_182)
    {
        float _184 = in.m_63.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = float(_108);
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _194 = _192 * _186;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _188;
        _204 = _200;
        _206 = true;
    }
    else
    {
        float _208 = float(_108);
        float _210 = 1.0 / _208;
        float _212 = _142 * _210;
        _202 = _208;
        _204 = _212;
    }
    _206 = false;
    float _214 = _202;
    float _216 = _204;
    float _218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _220 = int(_218);
    float _222 = in.m_63.x;
    float _224 = in.m_63.y;
    float _226 = in.m_65.x;
    float _228 = in.m_65.y;
    float _230 = in.m_65.z;
    float _232 = in.m_65.w;
    float _234 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _236 = int(_234);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _242 = float(_220);
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _248 = 1.0 / _242;
    float _250 = float(uint(_236));
    float _252 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[78].z, _246);
    int _254 = ~_236;
    int _256 = _254 + 1;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _260 = ~_236;
    int _262 = _260 + 1;
    float _264 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _252);
    int _266 = ~_236;
    int _268 = _266 + 1;
    float _270 = 1.0 / _250;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = _258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _280 = _272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _282 = _142 * _248;
    float _284 = trunc(_282);
    int _286 = int(_284);
    int _288 = as_type<int>(_270) + (-2);
    float _290 = float(uint(_286));
    float _292 = as_type<float>(_288) * _290;
    float _294 = trunc(_292);
    float _296 = precise::max(_294, 0.0);
    uint _299 = uint(_296);
    float _301 = float(_286);
    int _303 = _256 * int(_299);
    int _305 = _303 + _286;
    float _307 = float(_236);
    float _309 = float(uint(_305));
    bool _311 = _301 >= _307;
    bool _313 = isnan(_301);
    bool _315 = _311 || _313;
    bool _317 = isnan(_307);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = as_type<float>(_288) * _309;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _327 = _325 != 0;
    float _329 = trunc(_321);
    int _331 = int(_329);
    bool _333 = !_327;
    float _335 = _333 ? 7.345489978790283203125 : 1.0;
    float _337 = _335 * _222;
    float _339 = trunc(_323);
    float _341 = precise::max(_339, 0.0);
    uint _343 = uint(_341);
    float _345 = floor(_337);
    int _347 = int(_299) + int(_343);
    int _349 = _262 * _347;
    int _351 = _349 + _286;
    float _353 = 1.0 / _214;
    float _355 = -_345;
    float _357 = _337 + _355;
    int _359 = ~_331;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    bool _365 = uint(_351) >= uint(_236);
    bool _367 = !_365;
    int _369 = _367 ? 0 : (-1);
    bool _371 = _236 == 0;
    int _373 = ~_347;
    int _375 = _373 + _369;
    int _377 = _375 + 1;
    float _379 = _357 * _307;
    float _381 = _142 * _307;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _393 = _391 != 0;
    int _395 = _236 * _377;
    int _397 = _395 + _286;
    float _399 = _381 * _353;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _403 = _401 != 0;
    float _405 = trunc(_379);
    int _407 = int(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _411 = _409 != 0;
    bool _413 = !_371;
    int _415 = _413 ? _397 : (-1);
    int _417 = _236 + (-1);
    bool _419 = !_403;
    int _421 = _419 ? 0 : 1;
    int _423 = _415 * _363;
    bool _425 = !_389;
    int _427 = _425 ? 0 : 1;
    float _429 = trunc(_399);
    int _431 = int(_429);
    bool _433 = _224 > 0.5;
    int _435 = _331 * _417;
    int _437 = _435 + _423;
    bool _439 = !_385;
    int _441 = _439 ? 0 : 1;
    int _443 = abs(_427);
    int _445 = abs(_421);
    bool _447 = !_393;
    int _449 = _447 ? 0 : 1;
    int _451 = abs(_441);
    int _453 = _407 * _445;
    int _455 = _453 + _286;
    int _457 = abs(_449);
    int _459 = _437 * _443;
    bool _461 = !_411;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _467 = _465 != 0;
    int _469 = _431 * _451;
    int _471 = _469 + _459;
    int _473 = abs(_463);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    int _479 = _455 * _457;
    int _481 = _479 + _471;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = in.m_67.x;
    float _489 = in.m_67.y;
    float _491 = in.m_67.z;
    float _493 = in.m_67.w;
    int _495 = _407 * _473;
    int _497 = _495 + _481;
    bool _499 = _222 > 0.5;
    float _501 = in.m_69.x;
    float _503 = in.m_69.y;
    float _505 = in.m_69.z;
    float _507 = in.m_69.w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = float(uint(_497));
    float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = as_type<float>(_288) * _511;
    float _517 = in.m_53.x;
    float _519 = in.m_53.y;
    float _521 = in.m_53.z;
    float _523 = trunc(_515);
    float _525 = precise::max(_523, 0.0);
    uint _527 = uint(_525);
    int _529 = _268 * int(_527);
    int _531 = _529 + _497;
    float _533 = _519 * _489;
    float _535 = float(uint(_531));
    float _537 = _519 * _503;
    float _539 = _519 * _228;
    float _541 = fma(_517, _487, _533);
    float _543 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _545 = as_type<float>(_288) * _535;
    float _547 = fma(_517, _501, _537);
    float _549 = fma(_517, _226, _539);
    float _551 = _222 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _553 = fma(_543, -2.0, _240);
    float _555 = trunc(_545);
    float _557 = precise::max(_555, 0.0);
    uint _559 = uint(_557);
    float _561 = -_238;
    float _563 = fma(_551, 2.0, _561);
    float _565 = fma(_521, _491, _541);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _569 = ~_236;
    int _571 = _569 + 1;
    float _573 = fma(_521, _505, _547);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _575;
    float _579 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _567);
    float _581 = -_142;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _563);
    float _585 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _553);
    float _587 = 1.0 / _577;
    float _589 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _579);
    int _591 = int(_527) + int(_559);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _597 = _216 + _595;
    int _599 = _571 * _591;
    int _601 = _599 + _497;
    float _603 = fma(_521, _230, _549);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = _565 + _493;
    bool _609 = uint(_601) >= uint(_236);
    float _611 = _597 * _587;
    float _613 = float(uint(_455));
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _617 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _619 = !_609;
    int _621 = _619 ? 0 : (-1);
    float _623 = as_type<float>(_288) * _613;
    float _625 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _627;
    int _631 = ~_591;
    int _633 = _631 + _621;
    int _635 = _633 + 1;
    float _637 = _603 + _232;
    float _639 = -_176;
    int _641 = _499 ? as_type<int>(_639) : as_type<int>(_176);
    float _643 = fma(_629, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _645 = trunc(_623);
    float _647 = precise::max(_645, 0.0);
    uint _649 = uint(_647);
    bool _651 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _653 = isnan(_216);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    int _663 = _236 * _635;
    int _665 = _663 + _497;
    bool _667 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _669 = isnan(_216);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    out.m_71.x = _513;
    out.m_71.y = _617;
    out.m_71.z = _625;
    out.m_71.w = _244;
    bool _679 = !_477;
    float _681 = _679 ? _176 : as_type<float>(_641);
    float _683 = -_661;
    float _685 = _683 + 1.0;
    float _687 = _607 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _689 = -_180;
    int _691 = _433 ? as_type<int>(_689) : as_type<int>(_180);
    float _693 = _677 * _685;
    bool _695 = !_371;
    int _697 = _695 ? _665 : (-1);
    float _699 = _681 + 0.5;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _701;
    float _705 = _643 * _693;
    int _707 = _697 >> 31;
    float _709 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = fma(_703, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = _573 + _507;
    int _715 = ~_236;
    int _717 = _715 + 1;
    float _719 = -_589;
    float _721 = _719 + 1.0;
    int _723 = _707 & 3;
    float _725 = _711 * _693;
    bool _727 = !_485;
    float _729 = _727 ? _180 : as_type<float>(_691);
    int _731 = _717 * int(_649);
    int _733 = _731 + _455;
    float _735 = _713 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _737 = _697 & 3;
    bool _739 = _737 != 0;
    out.m_73.x = _278;
    out.m_73.y = _280;
    out.m_73.z = _709;
    float _741 = _729 + (-0.5);
    float _743 = float(uint(_733));
    float _745 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[80].x, _583);
    int _747 = _697 + _723;
    float _749 = -_677;
    float _751 = _749 + 1.0;
    float _753 = -_741;
    float _755 = -_585;
    float _757 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[80].y, _755);
    float _759 = as_type<float>(_288) * _743;
    int _761 = _747 >> 2;
    float _763 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[143].x, _705);
    float _765 = -_276;
    float _767 = fma(_681, _765, _745);
    float _769 = fma(_729, _721, _757);
    int _771 = _761 << 4;
    int _773 = _771 + 368;
    float _775 = trunc(_759);
    float _777 = precise::max(_775, 0.0);
    uint _779 = uint(_777);
    float _781 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    uint _785 = uint(int(uint(_773) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[int(_795)][_797];
    int _801 = _697 & 3;
    bool _803 = _801 != 0;
    float _805 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].x, _781);
    float _807 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _809 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _811 = uint(_801) > 1u;
    float _813 = _637 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _815 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].y, _807);
    int _817 = _773 + 8;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    float _835 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].z, _809);
    int _837 = ~_236;
    int _839 = _837 + 1;
    out.m_75.x = _767;
    out.m_75.y = _769;
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].y, _815);
    int _843 = int(_649) + int(_779);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _847 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].z, _835);
    float _849 = _841 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _851 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].x, _805);
    int _853 = _839 * _843;
    int _855 = _853 + _455;
    bool _857 = !_803;
    int _859 = _857 ? 0 : 1;
    float _861 = _847 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _863 = _739 ? 0 : 1;
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _867 = uint(_855) >= uint(_236);
    float _869 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    int _871 = ~_863;
    int _873 = _871 + 1;
    int _875 = _873 + 1;
    float _877 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[144].x, _763);
    int _879 = _875;
    if (!_811)
    {
        int _881 = ~_863;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[144].y, _783);
    bool _889 = _801 != 3;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _893 = !_867;
    int _895 = _893 ? 0 : (-1);
    float _897 = _861 * _845;
    bool _899 = uint(_801) >= 2u;
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    int _903 = ~_843;
    int _905 = _903 + _895;
    int _907 = _905 + 1;
    float _909 = fma(_897, 0.5, 0.5);
    int _911 = abs(_859);
    float _913 = _849 * _865;
    int _915 = abs(_885);
    int _917 = _236 * _907;
    int _919 = _917 + _455;
    int _921 = _899 ? 0 : 1;
    float _923 = fma(_913, 0.5, 0.5);
    int _925 = ~_915;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    bool _931 = _801 != 3;
    float _933 = _869 * _891;
    int _935 = ~_921;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    int _941 = _929 * as_type<int>(_799);
    float _943 = floor(_923);
    int _945 = _939;
    float _947 = as_type<float>(_919);
    float _949 = _891;
    if (_889)
    {
        int _951 = ~_921;
        int _953 = _951 + 1;
        _945 = _953;
    }
    int _955 = _945;
    float _957 = fma(_933, 0.5, 0.5);
    bool _959 = !_931;
    int _961 = _959 ? 0 : (-1);
    float _963 = in.m_77.x;
    float _965 = in.m_77.y;
    int _967 = ~_911;
    int _969 = _967 + 1;
    int _971 = _969 + 1;
    int _973 = abs(_955);
    float _975 = floor(_957);
    bool _977 = !_467;
    int _979 = _977 ? 0 : 1;
    int _981 = _971 * as_type<int>(_791);
    int _983 = _981 + _941;
    int _985 = abs(_961);
    int _987 = ~_973;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    int _993 = abs(_979);
    float _995 = -_943;
    float _997 = _923 + _995;
    int _999 = _991 * as_type<int>(_825);
    int _1001 = _999 + _983;
    float _1003 = floor(_909);
    int _1005 = ~_985;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    int _1011 = ~_993;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = -_975;
    float _1019 = _957 + _1017;
    int _1021 = _1009 * as_type<int>(_833);
    int _1023 = _1021 + _1001;
    bool _1025 = !_371;
    int _1027 = _1025 ? _919 : (-1);
    float _1029 = _887 * _965;
    bool _1031 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan(1.0);
    bool _1039 = _1035 || _1037;
    int _1041 = _1023 * _1015;
    float _1043 = _877 * _963;
    float _1045 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1047 = _1027 * _993;
    int _1049 = _1047 + _1041;
    float _1051 = fma(_997, 2.0, -1.0);
    float _1053 = -_1003;
    float _1055 = _909 + _1053;
    float _1057 = fma(_1019, 2.0, -1.0);
    float _1059 = float(_1049);
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1063 = fma(_1055, 2.0, -1.0);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1067 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1073 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_79.x = _1059;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1069);
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1071);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1073);
    float _1081 = _1063 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _180);
    float _1085 = _1067 * _901;
    float _1087 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1075);
    float _1089 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1077);
    float _1091 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1079);
    float _1093 = _1045 * _1083;
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1101 = _1045;
    float _1103 = _1045;
    float _1105 = _1057;
    float _1107 = _1051;
    float _1109 = _1089;
    float _1111 = _1063;
    float _1113 = _1083;
    int _1115 = _955;
    float _1123;
    if (!_1039)
    {
        bool _1117 = _1097 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1119 = !_1117;
        _1121 = _1119;
        if (!_1121)
        {
            _1123 = 0.0;
            _1125 = true;
        }
    }
    if ((!_1125) || _1121)
    {
        bool _1149;
        if (!_1121)
        {
            bool _1127 = _1097 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1129 = isnan(_1097);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1135 = _1131 || _1133;
            bool _1137 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1139 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1141 = !_1135;
            bool _1143 = _1139 && _1141;
            if (_1143)
            {
                _1101 = 0.0;
            }
            float _1145 = _1101;
            bool _1147 = !_1135;
            _1149 = _1147 && _1137;
            _1103 = _1145;
            _1123 = _1145;
        }
        if ((!_1149) || _1121)
        {
            _1121 = false;
            float _1151 = _1103;
            bool _1153 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1155 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1157 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1159 = _1151;
            if (_1153)
            {
                float _1161 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1159 = _1161;
            }
            float _1163 = _1159;
            if (_1153)
            {
                float _1165 = abs(_1057);
                float _1167 = -_1165;
                float _1169 = _1167 + 1.0;
                _1105 = _1169;
            }
            float _1171 = _1105;
            if (_1155)
            {
                float _1173 = abs(_1051);
                float _1175 = -_1173;
                float _1177 = _1175 + 1.0;
                _1107 = _1177;
            }
            float _1179 = _1107;
            if (!_1153)
            {
                _1109 = 1.0;
            }
            float _1181 = _1109;
            float _1183 = _1181;
            if (_1157)
            {
                float _1185 = abs(_1063);
                float _1187 = -_1185;
                float _1189 = _1187 + 1.0;
                _1111 = _1189;
            }
            float _1191 = _1111;
            if (!_1155)
            {
                _1113 = 1.0;
            }
            float _1193 = _1113;
            float _1195 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1197 = _1193;
            if (_1155)
            {
                float _1199 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1195 = _1199;
            }
            float _1201 = _1195;
            float _1203 = _963;
            if (_1157)
            {
                float _1205 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1203 = _1205;
            }
            float _1207 = _1203;
            float _1209 = _1163;
            if (_1153)
            {
                float _1211 = _1171 * _1163;
                float _1213 = precise::clamp(_1211, 0.0, 1.0);
                _1183 = _1213;
            }
            float _1215 = _1183;
            if (!_1157)
            {
                _1209 = 1.0;
            }
            float _1217 = _1209;
            float _1219 = _1217;
            if (_1155)
            {
                float _1221 = _1179 * _1201;
                float _1223 = precise::clamp(_1221, 0.0, 1.0);
                _1197 = _1223;
            }
            float _1225 = _1197;
            float _1227 = _1215 * _1225;
            if (_1157)
            {
                float _1229 = _1191 * _1207;
                float _1231 = precise::clamp(_1229, 0.0, 1.0);
                _1219 = _1231;
            }
            float _1233 = _1219;
            float _1235 = _1227 * _1233;
            _1123 = _1235;
        }
    }
    _1125 = false;
    float _1237 = _1123;
    float _1239 = _1097 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1241 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1243 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1245 = fma(_1095, 6.2500002968590706586837768554688e-05, 0.5);
    float _1247 = fma(_1099, 6.2500002968590706586837768554688e-05, 0.5);
    float _1249 = fma(_1095, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1241);
    float _1251 = fma(_1095, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1243);
    float _1253 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1249);
    float _1255 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1251);
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1259 = _1255 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1261 = trunc(_1257);
    int _1263 = int(_1261);
    float _1265 = trunc(_1259);
    int _1267 = int(_1265);
    int _1269 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1271 = _1263 + _1269;
    int _1273 = _1271 + 1;
    bool _1275 = _1273 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1277 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1279 = _1267 + _1277;
    int _1281 = _1279 + 1;
    int _1283 = _1273 | _1281;
    bool _1285 = _1283 < 0;
    bool _1287 = _1285 || _1275;
    bool _1289 = _1281 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1291 = _1289 || _1287;
    int _1293 = _1281;
    int _1295 = _1273;
    if (!_1291)
    {
        int _1297 = _1281 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1299 = _1297 + _1273;
        _1293 = _1299;
    }
    int _1301 = _1293;
    float _1303 = as_type<float>(_1283);
    if (!_1291)
    {
        float _1305 = floor(_1259);
        _1303 = _1305;
    }
    float _1307 = _1303;
    if (!_1291)
    {
        int _1309 = _1301 << 2;
        _1115 = _1309;
    }
    int _1311 = _1115;
    int _1313 = _1311;
    if (!_1291)
    {
        uint _1315 = uint(int(uint(_1301) >> uint(2)));
        _1295 = int(_1315);
    }
    int _1317 = _1295;
    if (!_1291)
    {
        int _1319 = 12 & _1311;
        _1313 = _1319;
    }
    int _1321 = _1313;
    float _1323 = as_type<float>(_1321);
    if (!_1291)
    {
        int _1325 = _1317 << 4;
        int _1327 = _1325 + _1321;
        _947 = as_type<float>(_1327);
    }
    float _1329 = _947;
    float _1331 = as_type<float>(_1317);
    if (!_1291)
    {
        float _1333 = floor(_1257);
        _1331 = _1333;
    }
    float _1335 = _1331;
    if (!_1291)
    {
        float _1337 = -_1307;
        float _1339 = _1259 + _1337;
        _1323 = _1339;
    }
    float _1341 = _1323;
    float _1343 = _1329;
    if (!_1291)
    {
        int _1345 = as_type<int>(_1329) + 400;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
        int _1351 = int(_1347) & 3;
        float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
        _1343 = _1353;
    }
    float _1355 = _1343;
    float2 _4513 = float2(_1245, _1247);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4513, float2(0.0), isnan(_4513)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4513, float2(0.0), isnan(_4513)), level(0.0)).x;
    if (!_1291)
    {
        float _1359 = -_1335;
        float _1361 = _1257 + _1359;
        _949 = _1361;
    }
    float _1363 = _949;
    float _1365 = _909;
    if (!_1291)
    {
        float _1367 = rint(_1355);
        float _1369 = precise::max(_1367, 0.0);
        uint _1371 = uint(_1369);
        uint _1373 = clamp(_1371, 0u, 65535u);
        _1365 = as_type<float>(_1373);
    }
    float _1375 = _1365;
    float _1377 = _1341;
    if (!_1291)
    {
        float3 _4559 = float3(_1363, _1341, float(as_type<int>(_1375)));
        float3 _4563 = select(_4559, float3(0.0), isnan(_4559));
        float _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4563.xy, uint(rint(_4563.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4563.xy, uint(rint(_4563.z)), level(0.0)).x;
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = -_1097;
    float _1385 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1387 = -_1095;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1391 = -_1099;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1395 = _1385 * _1385;
    float _1397 = fma(_1389, _1389, _1395);
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1401 = fma(_1393, _1393, _1397);
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1405 = rsqrt(_1401);
    float _1407 = -_1399;
    float _1409 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1407);
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1413 = -_1411;
    float _1415 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1413);
    float _1417 = _1389 * _1405;
    float _1419 = _1393 * _1405;
    float _1421 = _1385 * _1405;
    float _1423 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1425 = _1417 * _1417;
    float _1427 = fma(_1419, _1419, _1425);
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1431 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1435 = rsqrt(_1427);
    float _1437 = -_1429;
    float _1439 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1437);
    float _1441 = -_1403;
    float _1443 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1441);
    float _1445 = -_1431;
    float _1447 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1445);
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1451 = -_1433;
    float _1453 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1451);
    float _1455 = -_1449;
    float _1457 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1455);
    float _1459 = -_1423;
    float _1461 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1459);
    float _1463 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1457);
    float _1465 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1461);
    float _1467 = _1419 * _1435;
    float _1469 = _1417 * _1435;
    float _1471 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1475 = -_1467;
    float _1477 = _1419 * _1475;
    float _1479 = -_1467;
    float _1481 = _1421 * _1479;
    float _1483 = -_1471;
    float _1485 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1483);
    float _1487 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1489 = -_1477;
    float _1491 = fma(_1417, _1469, _1489);
    float _1493 = _1421 * _1469;
    float _1495 = -_1473;
    float _1497 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1499 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1485);
    float _1501 = _1491 * _1491;
    float _1503 = -_1487;
    float _1505 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1503);
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1497);
    float _1509 = fma(_1493, _1493, _1501);
    float _1511 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1505);
    float _1513 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1515 = fma(_1481, _1481, _1509);
    float _1517 = -_1511;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1507);
    float _1521 = -_1513;
    float _1523 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1525 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1527 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = 1.0 / _1519;
    float _1531 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1523);
    float _1533 = -_1525;
    float _1535 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1533);
    float _1537 = -_1527;
    float _1539 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1537);
    float _1541 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    float _1543 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1539);
    float _1545 = rsqrt(_1515);
    float _1547 = fma(_1531, _1529, -1.0);
    float _1549 = _1491 * _1545;
    float _1551 = precise::clamp(_1549, 0.0, 1.0);
    float _1553 = -_1551;
    float _1555 = _1553 + 1.0;
    float _1557 = _1555 * _1529;
    float _1559 = fma(_1555, _1547, 1.0);
    float _1561 = _1541 * _1557;
    float _1563 = _1559 * _1559;
    float _1565 = _1543 * _1557;
    float _1567 = fma(_1561, _1561, _1563);
    float _1569 = fma(_1565, _1565, _1567);
    float _1571 = rsqrt(_1569);
    float _1573 = _1565 * _1571;
    float _1575 = _1559 * _1571;
    float _1577 = _1561 * _1571;
    float _1579 = -_1573;
    float _1581 = _1417 * _1579;
    float _1583 = _1419 * _1575;
    float _1585 = -_1577;
    float _1587 = -_1581;
    float _1589 = fma(_1419, _1585, _1587);
    float _1591 = -_1573;
    float _1593 = -_1583;
    float _1595 = fma(_1421, _1591, _1593);
    float _1597 = -_1577;
    float _1599 = _1421 * _1597;
    float _1601 = _1589 * _1589;
    float _1603 = -_1599;
    float _1605 = fma(_1417, _1575, _1603);
    float _1607 = fma(_1595, _1595, _1601);
    float _1609 = fma(_1605, _1605, _1607);
    float _1611 = rsqrt(_1609);
    float _1613 = _1595 * _1611;
    float _1615 = _1605 * _1611;
    float _1617 = _1589 * _1611;
    float _1619 = _1419 * _1613;
    float _1621 = _1421 * _1615;
    float _1623 = -_1619;
    float _1625 = fma(_1417, _1615, _1623);
    float _1627 = -_1621;
    float _1629 = fma(_1419, _1617, _1627);
    float _1631 = _1417 * _1617;
    float _1633 = _1625 * _1625;
    float _1635 = -_1631;
    float _1637 = fma(_1421, _1613, _1635);
    float _1639 = fma(_1629, _1629, _1633);
    float _1641 = fma(_1637, _1637, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = _1637 * _1643;
    float _1647 = _1625 * _1643;
    float _1649 = _1629 * _1643;
    float _1651 = _1417 * _1645;
    float _1653 = _1419 * _1647;
    float _1655 = -_1651;
    float _1657 = fma(_1419, _1649, _1655);
    float _1659 = -_1653;
    float _1661 = fma(_1421, _1645, _1659);
    float _1663 = _1421 * _1649;
    float _1665 = _1093 * _1649;
    float _1667 = _1657 * _1657;
    float _1669 = -_1663;
    float _1671 = fma(_1417, _1647, _1669);
    float _1673 = fma(_1661, _1661, _1667);
    float _1675 = fma(_1671, _1671, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = _1085 * _1677;
    float _1681 = _1093 * _1645;
    float _1683 = _1093 * _1647;
    float _1685 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1687 = fma(_1661, _1679, _1665);
    float _1689 = fma(_1671, _1679, _1681);
    float _1691 = fma(_1657, _1679, _1683);
    float _1693 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1685);
    float _1695 = _1095 + _1687;
    float _1697 = _1099 + _1689;
    float _1699 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1701 = _1097 + _1691;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1705 = _1695 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1709 = _1697 + _1707;
    float _1711 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1699);
    float _1713 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1693);
    float _1715 = _1709 * _1709;
    float _1717 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1711);
    float _1719 = fma(_1705, _1705, _1715);
    float _1721 = sqrt(_1719);
    bool _1723 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(0.5);
    bool _1731 = _1727 || _1729;
    bool _1733 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.5);
    bool _1741 = _1737 || _1739;
    bool _1743 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = _1693;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1749 = _1697;
    int _1751 = as_type<int>(_1719);
    if (!_1743)
    {
        _1745 = _1695;
    }
    float _1753 = _1745;
    float _1755 = _1753;
    if (!_1743)
    {
        _1747 = _1701;
    }
    float _1757 = _1747;
    bool _1759 = !_1743;
    float _1761 = _1757;
    float _1763 = _1357;
    if (!_1759)
    {
        float _1765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1769 = _1721 + _1767;
        float _1771 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1773 = rsqrt(_1719);
        float _1775 = _1769 * _1765;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = _1777 * 6.283185482025146484375;
        float _1781 = cos(_1779);
        float _1783 = _1777 * 6.283185482025146484375;
        float _1785 = sin(_1783);
        float _1787 = _1781 + (-1.0);
        float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1791 = fma(_1785, _1771, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1793 = fma(_1701, _1781, _1789);
        float _1795 = _1773 * _1791;
        float _1797 = fma(_1705, _1795, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1799 = fma(_1709, _1795, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1761 = _1793;
        _1755 = _1797;
        _1749 = _1799;
    }
    float _1801 = _1761;
    float _1803 = _1755;
    float _1805 = _1749;
    float _1807 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1809 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1811 = _1801;
    float _1813 = _1803;
    float _1815 = _1805;
    if (!_1731)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1819 = _1097 + _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1823 = _1095 + _1821;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = -_1097;
        float _1829 = _1827 + _1801;
        float _1831 = _1819 * _1819;
        float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1835 = _1099 + _1833;
        float _1837 = -_1095;
        float _1839 = _1837 + _1803;
        float _1841 = fma(_1823, _1823, _1831);
        float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1845 = fma(_1835, _1835, _1841);
        float _1847 = sqrt(_1845);
        float _1849 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1851 = precise::min(_1847, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1853 = _1851 * _1843;
        float _1855 = _1849 * _1853;
        float _1857 = -_1099;
        float _1859 = _1857 + _1805;
        float _1861 = fma(_1829, _1855, _1097);
        float _1863 = fma(_1839, _1855, _1095);
        float _1865 = fma(_1859, _1855, _1099);
        _1811 = _1861;
        _1813 = _1863;
        _1815 = _1865;
    }
    float _1867 = _1811;
    float _1869 = _1813;
    float _1871 = _1815;
    float _1873 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1877 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1879 = 1.0 / _1809;
    float _1881 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1873);
    float _1883 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1875);
    float _1885 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1887 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1877);
    float _1889 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1881);
    float _1891 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1883);
    float _1893 = _1807 + _1809;
    float _1895 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1885);
    float _1897 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1899 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1887);
    float _1901 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1903 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1905 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1909 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1911 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1913 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1915 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1905);
    float _1917 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1907);
    float _1919 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1921 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1911);
    float _1923 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1915);
    float _1927 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1917);
    float _1929 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1931 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1921);
    float _1933 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1935 = _1893 * _1879;
    float _1937 = _1935 * 0.5;
    float _1939 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1927);
    float _1941 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1929);
    float _1943 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1931);
    float _1945 = _1917;
    float _1947 = _1923;
    float _1949 = _1933;
    float _1951 = _1939;
    if (_1741)
    {
        _1945 = 1.0;
    }
    float _1953 = _1945;
    float _1955 = _1953;
    if (!_1741)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1961 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
        float _1963 = _1957 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1967;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1961;
        float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1987;
        float _1991 = _1981 * _1983;
        float _1993 = _1971 * 6.283185482025146484375;
        float _1995 = sin(_1993);
        float _1997 = 1.0 / _1991;
        float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2001 = _1985 * _1999;
        float _2003 = 1.0 / _1989;
        float _2005 = _1995 * _1997;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = fma(_2005, _2001, _2007);
        float _2011 = _2009 * _2003;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        _1947 = _2005;
        _1955 = _2013;
        _1751 = as_type<int>(_1971);
    }
    float _2015 = _1947;
    float _2017 = _1955;
    int _2019 = _1751;
    out.gl_Position.x = _1933;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _1941;
    out.gl_Position.w = _1943;
    float _2021 = abs(_1357);
    bool _2023 = _2021 != 0.0;
    bool _2025 = isnan(_2021);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan(0.0);
    bool _2031 = _2027 || _2029;
    float _2033 = _2015;
    int _2035 = _2019;
    if (_1741)
    {
        _1763 = 1.0;
    }
    float _2037 = _1763;
    float _2039 = _2037;
    if (_2031)
    {
        _2033 = _1943;
    }
    float _2041 = _2033;
    float _2043 = _2041;
    if (!_2031)
    {
        _2043 = 0.0;
    }
    float _2045 = _2043;
    float _2047 = _2045;
    if (!_1741)
    {
        float _2049 = as_type<float>(in.m_83.w);
        int _2051 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _2053 = _2051 == 4;
        bool _2055 = _2051 == 8;
        bool _2057 = _2051 == 12;
        int _2059 = as_type<int>(_2049) << 16;
        int _2061 = as_type<int>(_2049) << 8;
        int _2063 = as_type<int>(_2049) << 24;
        int _2065 = _2059 >> 24;
        int _2067 = _2061 >> 24;
        int _2069 = as_type<int>(_2049) >> 24;
        int _2071 = _2063 >> 24;
        float _2073 = float(_2065);
        float _2075 = float(_2067);
        float _2077 = float(_2069);
        float _2079 = _2073 * 0.0078740157186985015869140625;
        float _2081 = float(_2071);
        float _2083 = _2075 * 0.0078740157186985015869140625;
        float _2085 = _2077 * 0.0078740157186985015869140625;
        float _2087 = precise::min(_2079, 1.0);
        float _2089 = _2081 * 0.0078740157186985015869140625;
        float _2091 = precise::min(_2083, 1.0);
        float _2093 = precise::min(_2085, 1.0);
        float _2095 = precise::min(_2089, 1.0);
        float _2097 = precise::max(_2087, -1.0);
        float _2099 = precise::max(_2091, -1.0);
        float _2101 = precise::max(_2093, -1.0);
        float _2103 = precise::max(_2095, -1.0);
        float _2105 = _2103;
        if (_2053)
        {
            _2105 = _2097;
        }
        float _2107 = _2105;
        float _2109 = _2107;
        if (_2055)
        {
            _2109 = _2099;
        }
        float _2111 = _2109;
        float _2113 = _2111;
        if (_2057)
        {
            _2113 = _2101;
        }
        float _2115 = _2113;
        float _2117 = abs(_2115);
        float _2119 = (-0.0) + _2117;
        _2039 = _2119;
    }
    float _2121 = _2039;
    if (!_2031)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1291)
    {
        int _2123 = _1301 << 4;
        int _2125 = _2123 + 2048;
        uint _2127 = uint(int(uint(_2125) >> uint(2)));
        uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
        int _2131 = int(_2127) & 3;
        float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
        int _2135 = int(_2127) + 1;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        int _2139 = _2135 & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = _2125 + 8;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        uint _2147 = uint(int(uint(int(_2145)) >> uint(2)));
        int _2149 = int(_2145) & 3;
        float _2151 = (*spvDescriptorSet0.vp_c15)._m0[int(_2147)][_2149];
        int _2153 = int(_2145) + 1;
        uint _2155 = uint(int(uint(_2153) >> uint(2)));
        int _2157 = _2153 & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        float _2161 = _1239 * _2141;
        float _2163 = fma(_1095, _2133, _2161);
        float _2165 = fma(_1099, _2151, _2163);
        float _2167 = _2165 + _2159;
        float _2169 = precise::clamp(_2167, 0.0, 1.0);
        float _2171 = -_2169;
        float _2173 = _2171 + _1381;
        float _2175 = fma(_2173, 500.0, 1.5);
        float _2177 = exp2(_2175);
        float _2179 = 0.0 + _2177;
        float _2181 = precise::clamp(_2179, 0.0, 1.0);
        bool _2183 = _2181 >= 1.0;
        bool _2185 = isnan(_2181);
        bool _2187 = _2183 || _2185;
        bool _2189 = isnan(1.0);
        bool _2191 = _2187 || _2189;
        if (!_2191)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2191)
        {
            _2047 = 0.0;
        }
    }
    float _2193 = _2047;
    float _2195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2197 = _1867 + _2195;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2201 = _1869 + _2199;
    float _2203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2205 = _1871 + _2203;
    float _2207 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2209 = _2197 * _2197;
    float _2211 = 1.0 / _2193;
    float _2213 = fma(_2201, _2201, _2209);
    float _2215 = fma(_2205, _2205, _2213);
    float _2217 = rsqrt(_2215);
    float _2219 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2221 = _2201 * _2219;
    float _2223 = _2205 * _2219;
    float _2225 = _2221 * _2221;
    float _2227 = _2223 * _2223;
    float _2229 = _2225 + _2227;
    float _2231 = sqrt(_2229);
    bool _2233 = _2231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2237 = _2231 + _2235;
    float _2239 = _2209;
    float _2241 = _2229;
    float _2243 = _2237;
    float _2245 = _2201;
    float _2247 = _2205;
    float _2249 = _2197;
    float _2251 = _2221;
    if (_2233)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    if (_2233)
    {
        float _2257 = rsqrt(_2229);
        _2241 = _2257;
    }
    float _2259 = _2241;
    float _2261 = _2259;
    if (_2233)
    {
        float _2263 = _2237 * _2255;
        _2243 = _2263;
    }
    float _2265 = _2243;
    if (_2233)
    {
        float _2267 = _2265 * 0.15915493667125701904296875;
        _2245 = _2267;
    }
    float _2269 = _2245;
    float _2271 = _2255;
    if (_2233)
    {
        float _2273 = _2269 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        _2271 = _2275;
    }
    float _2277 = _2271;
    float _2279 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2281 = precise::max(0.0, _2279);
    float _2283 = _1099;
    float _2285 = _2281;
    if (_2233)
    {
        float _2287 = _2269 * 6.283185482025146484375;
        float _2289 = cos(_2287);
        _2283 = _2289;
    }
    float _2291 = _2283;
    float _2293 = -_2219;
    float _2295 = -_2281;
    float _2297 = fma(_2197, _2293, _2295);
    if (_2233)
    {
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2299;
    }
    float _2301 = _2285;
    float _2303 = _2277;
    float _2305 = _2301;
    if (_2233)
    {
        float _2307 = fma(_2277, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2247 = _2307;
    }
    float _2309 = _2247;
    float _2311 = _2309;
    if (!_2233)
    {
        _2303 = _2297;
    }
    float _2313 = _2303;
    float _2315 = _2313;
    if (_2233)
    {
        float _2317 = _2291 + (-1.0);
        _2249 = _2317;
    }
    float _2319 = _2249;
    float _2321 = _2319;
    if (_2233)
    {
        float _2323 = _2259 * _2309;
        _2311 = _2323;
    }
    float _2325 = _2311;
    if (!_2233)
    {
        _2261 = _2225;
    }
    float _2327 = _2261;
    float _2329 = _2327;
    if (_2233)
    {
        float _2331 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2305 = _2331;
    }
    float _2333 = _2305;
    float _2335 = _2333;
    if (_2233)
    {
        float _2337 = _2221 * _2325;
        _2251 = _2337;
    }
    float _2339 = _2251;
    if (!_2233)
    {
        _2321 = _2227;
    }
    float _2341 = _2321;
    float _2343 = _2341;
    if (_2233)
    {
        float _2345 = fma(_2297, _2291, _2333);
        _2315 = _2345;
    }
    float _2347 = _2315;
    if (!_2233)
    {
        _2335 = _2223;
    }
    float _2349 = _2335;
    float _2351 = _2349;
    if (_2233)
    {
        float _2353 = _2223 * _2325;
        _2351 = _2353;
    }
    float _2355 = _2351;
    if (_2233)
    {
        float _2357 = _2339 * _2339;
        _2329 = _2357;
    }
    float _2359 = _2329;
    float _2361 = sqrt(_2215);
    if (_2233)
    {
        float _2363 = _2355 * _2355;
        _2343 = _2363;
    }
    float _2365 = _2343;
    float _2367 = fma(_2347, _2347, _2359);
    bool _2369 = _2121 != 0.0;
    bool _2371 = isnan(_2121);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = _2367 + _2365;
    float _2381 = rsqrt(_2379);
    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2385 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2383);
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (!_2377)
    {
        _1949 = 0.0;
        _1951 = 0.0;
    }
    float _2391 = _1949;
    float _2393 = _1951;
    float _2395 = -_2387;
    float _2397 = _2395 + 1.0;
    float _2399 = -_2207;
    float _2401 = fma(_2399, _2389, 1.0);
    float _2403 = _2211 * _2391;
    float _2405 = abs(_2397);
    float _2407 = log2(_2405);
    float _2409 = _2381 * _2339;
    float _2411 = _2381 * _2347;
    float _2413 = _2381 * _2355;
    float _2415 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2417 = log2(_2401);
    float _2419 = -_2415;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2419);
    float _2423 = -_2413;
    float _2425 = fma(_2423, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2421);
    float _2427 = _2411 + 1.0;
    float _2429 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2431 = fma(_2425, -0.5, 0.5);
    float _2433 = fma(_2425, 0.5, 0.5);
    float _2435 = exp2(_2429);
    float _2437 = fma(_2433, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2439 = _2417 * 0.693147182464599609375;
    float _2441 = _2211 * _2393;
    float _2443 = fma(_2433, _2437, -0.212114393711090087890625);
    float _2445 = sqrt(_2431);
    float _2447 = fma(_2433, _2443, 1.570728778839111328125);
    float _2449 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2451 = fma(_2403, 0.5, 0.5);
    float _2453 = -_2411;
    float _2455 = fma(_2435, _2427, _2453);
    float _2457 = fma(_2441, -0.5, 0.5);
    float _2459 = fma(_2455, 0.5, 0.5);
    float _2461 = _2445 * 0.636619746685028076171875;
    float3 _6286 = float3(_2451, _2457, _2449);
    float _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6286, float3(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6286, float3(0.0), isnan(_6286)), level(0.0)).x;
    float3 _6295 = float3(_2451, _2457, _2449);
    float4 _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6295, float3(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6295, float3(0.0), isnan(_6295)), level(0.0)).xyzw;
    float _2468 = _2466.x;
    float _2470 = _2466.y;
    float _2472 = _2466.z;
    float _2474 = _2466.w;
    float _2476 = -_2447;
    float _2478 = fma(_2461, _2476, 1.0);
    float2 _6316 = float2(_2478, _2459);
    float3 _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6316, float2(0.0), isnan(_6316)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6316, float2(0.0), isnan(_6316)), level(0.0)).xyz;
    float _2484 = _2482.x;
    float _2486 = _2482.y;
    float _2488 = _2482.z;
    float _2490 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2492 = _2403;
    if (!_2377)
    {
        _2492 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2494 = _2492;
    float _2496 = _1237 * _2017;
    float _2498 = _1941 + _1943;
    float _2500 = exp2(_2490);
    if (!_2377)
    {
        float _2502 = _2494 * 5.0;
        _2035 = as_type<int>(_2502);
    }
    int _2504 = _2035;
    float _2506 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2508 = _2498 * 0.5;
    float _2510 = _2506 * _2121;
    float _2512 = _2510;
    if (!_2377)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6373 = as_type<float>(_2504);
        out.gl_Position.z = _6373;
    }
    if (!_2377)
    {
        _2512 = 0.0;
    }
    float _2514 = _2512;
    bool _2516 = _2017 > 0.0;
    bool _2518 = isnan(_2017);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(0.0);
    bool _2524 = _2520 || _2522;
    out.m_85.z = _2508;
    out.m_85.w = _1943;
    float _2526 = _2514 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2528 = -_2500;
    float _2530 = _2528 + 1.0;
    out.m_87.w = _2526;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2534 = _2532 * _2463;
    float _2536 = -_2532;
    float _2538 = _2536 + 1.0;
    float _2540 = _2474 * _2534;
    out.m_56.x = 1.0;
    float _2542 = _2488 * _2534;
    float _2544 = fma(_2484, _2540, _2468);
    float _2546 = fma(_2486, _2540, _2470);
    float _2548 = _2474 * _2538;
    float _2550 = fma(_2474, _2542, _2472);
    out.m_89.x = _2544;
    out.m_89.y = _2546;
    out.m_89.z = _2550;
    out.m_89.w = _2548;
    if (_2524)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_56.x = 0.0;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2552;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1125 = false;
    bool _1121 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_53.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_56.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2609 = as_type<float>(_124);
        out.gl_Position.z = _2609;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_58.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2678 = as_type<float>(_160);
        out.gl_Position.z = _2678;
    }
    if (_152)
    {
        return out;
    }
    float _162 = as_type<float>(int(gl_VertexIndex));
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _166 = as_type<int>(_162) & 1;
    bool _168 = _166 != 0;
    int _170 = as_type<int>(_162) & 2;
    bool _172 = _170 != 0;
    bool _174 = !_168;
    float _176 = _174 ? (-0.5) : 0.5;
    bool _178 = !_172;
    float _180 = _178 ? (-0.5) : 0.5;
    bool _182 = !_164;
    float _202;
    float _204;
    if (!_182)
    {
        float _184 = in.m_63.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = float(_108);
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _194 = _192 * _186;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _188;
        _204 = _200;
        _206 = true;
    }
    else
    {
        float _208 = float(_108);
        float _210 = 1.0 / _208;
        float _212 = _142 * _210;
        _202 = _208;
        _204 = _212;
    }
    _206 = false;
    float _214 = _202;
    float _216 = _204;
    float _218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _220 = int(_218);
    float _222 = in.m_63.x;
    float _224 = in.m_63.y;
    float _226 = in.m_65.x;
    float _228 = in.m_65.y;
    float _230 = in.m_65.z;
    float _232 = in.m_65.w;
    float _234 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _236 = int(_234);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _242 = float(_220);
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _248 = 1.0 / _242;
    float _250 = float(uint(_236));
    float _252 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[78].z, _246);
    int _254 = ~_236;
    int _256 = _254 + 1;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _260 = ~_236;
    int _262 = _260 + 1;
    float _264 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _252);
    int _266 = ~_236;
    int _268 = _266 + 1;
    float _270 = 1.0 / _250;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = _258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _280 = _272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _282 = _142 * _248;
    float _284 = trunc(_282);
    int _286 = int(_284);
    int _288 = as_type<int>(_270) + (-2);
    float _290 = float(uint(_286));
    float _292 = as_type<float>(_288) * _290;
    float _294 = trunc(_292);
    float _296 = precise::max(_294, 0.0);
    uint _299 = uint(_296);
    float _301 = float(_286);
    int _303 = _256 * int(_299);
    int _305 = _303 + _286;
    float _307 = float(_236);
    float _309 = float(uint(_305));
    bool _311 = _301 >= _307;
    bool _313 = isnan(_301);
    bool _315 = _311 || _313;
    bool _317 = isnan(_307);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = as_type<float>(_288) * _309;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _327 = _325 != 0;
    float _329 = trunc(_321);
    int _331 = int(_329);
    bool _333 = !_327;
    float _335 = _333 ? 7.345489978790283203125 : 1.0;
    float _337 = _335 * _222;
    float _339 = trunc(_323);
    float _341 = precise::max(_339, 0.0);
    uint _343 = uint(_341);
    float _345 = floor(_337);
    int _347 = int(_299) + int(_343);
    int _349 = _262 * _347;
    int _351 = _349 + _286;
    float _353 = 1.0 / _214;
    float _355 = -_345;
    float _357 = _337 + _355;
    int _359 = ~_331;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    bool _365 = uint(_351) >= uint(_236);
    bool _367 = !_365;
    int _369 = _367 ? 0 : (-1);
    bool _371 = _236 == 0;
    int _373 = ~_347;
    int _375 = _373 + _369;
    int _377 = _375 + 1;
    float _379 = _357 * _307;
    float _381 = _142 * _307;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _393 = _391 != 0;
    int _395 = _236 * _377;
    int _397 = _395 + _286;
    float _399 = _381 * _353;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _403 = _401 != 0;
    float _405 = trunc(_379);
    int _407 = int(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _411 = _409 != 0;
    bool _413 = !_371;
    int _415 = _413 ? _397 : (-1);
    int _417 = _236 + (-1);
    bool _419 = !_403;
    int _421 = _419 ? 0 : 1;
    int _423 = _415 * _363;
    bool _425 = !_389;
    int _427 = _425 ? 0 : 1;
    float _429 = trunc(_399);
    int _431 = int(_429);
    bool _433 = _224 > 0.5;
    int _435 = _331 * _417;
    int _437 = _435 + _423;
    bool _439 = !_385;
    int _441 = _439 ? 0 : 1;
    int _443 = abs(_427);
    int _445 = abs(_421);
    bool _447 = !_393;
    int _449 = _447 ? 0 : 1;
    int _451 = abs(_441);
    int _453 = _407 * _445;
    int _455 = _453 + _286;
    int _457 = abs(_449);
    int _459 = _437 * _443;
    bool _461 = !_411;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _467 = _465 != 0;
    int _469 = _431 * _451;
    int _471 = _469 + _459;
    int _473 = abs(_463);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    int _479 = _455 * _457;
    int _481 = _479 + _471;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = in.m_67.x;
    float _489 = in.m_67.y;
    float _491 = in.m_67.z;
    float _493 = in.m_67.w;
    int _495 = _407 * _473;
    int _497 = _495 + _481;
    bool _499 = _222 > 0.5;
    float _501 = in.m_69.x;
    float _503 = in.m_69.y;
    float _505 = in.m_69.z;
    float _507 = in.m_69.w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = float(uint(_497));
    float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = as_type<float>(_288) * _511;
    float _517 = in.m_53.x;
    float _519 = in.m_53.y;
    float _521 = in.m_53.z;
    float _523 = trunc(_515);
    float _525 = precise::max(_523, 0.0);
    uint _527 = uint(_525);
    int _529 = _268 * int(_527);
    int _531 = _529 + _497;
    float _533 = _519 * _489;
    float _535 = float(uint(_531));
    float _537 = _519 * _503;
    float _539 = _519 * _228;
    float _541 = fma(_517, _487, _533);
    float _543 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _545 = as_type<float>(_288) * _535;
    float _547 = fma(_517, _501, _537);
    float _549 = fma(_517, _226, _539);
    float _551 = _222 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _553 = fma(_543, -2.0, _240);
    float _555 = trunc(_545);
    float _557 = precise::max(_555, 0.0);
    uint _559 = uint(_557);
    float _561 = -_238;
    float _563 = fma(_551, 2.0, _561);
    float _565 = fma(_521, _491, _541);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _569 = ~_236;
    int _571 = _569 + 1;
    float _573 = fma(_521, _505, _547);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _575;
    float _579 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _567);
    float _581 = -_142;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _563);
    float _585 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _553);
    float _587 = 1.0 / _577;
    float _589 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _579);
    int _591 = int(_527) + int(_559);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _597 = _216 + _595;
    int _599 = _571 * _591;
    int _601 = _599 + _497;
    float _603 = fma(_521, _230, _549);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = _565 + _493;
    bool _609 = uint(_601) >= uint(_236);
    float _611 = _597 * _587;
    float _613 = float(uint(_455));
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _617 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _619 = !_609;
    int _621 = _619 ? 0 : (-1);
    float _623 = as_type<float>(_288) * _613;
    float _625 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _627;
    int _631 = ~_591;
    int _633 = _631 + _621;
    int _635 = _633 + 1;
    float _637 = _603 + _232;
    float _639 = -_176;
    int _641 = _499 ? as_type<int>(_639) : as_type<int>(_176);
    float _643 = fma(_629, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _645 = trunc(_623);
    float _647 = precise::max(_645, 0.0);
    uint _649 = uint(_647);
    bool _651 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _653 = isnan(_216);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    int _663 = _236 * _635;
    int _665 = _663 + _497;
    bool _667 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _669 = isnan(_216);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    out.m_71.x = _513;
    out.m_71.y = _617;
    out.m_71.z = _625;
    out.m_71.w = _244;
    bool _679 = !_477;
    float _681 = _679 ? _176 : as_type<float>(_641);
    float _683 = -_661;
    float _685 = _683 + 1.0;
    float _687 = _607 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _689 = -_180;
    int _691 = _433 ? as_type<int>(_689) : as_type<int>(_180);
    float _693 = _677 * _685;
    bool _695 = !_371;
    int _697 = _695 ? _665 : (-1);
    float _699 = _681 + 0.5;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _701;
    float _705 = _643 * _693;
    int _707 = _697 >> 31;
    float _709 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = fma(_703, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = _573 + _507;
    int _715 = ~_236;
    int _717 = _715 + 1;
    float _719 = -_589;
    float _721 = _719 + 1.0;
    int _723 = _707 & 3;
    float _725 = _711 * _693;
    bool _727 = !_485;
    float _729 = _727 ? _180 : as_type<float>(_691);
    int _731 = _717 * int(_649);
    int _733 = _731 + _455;
    float _735 = _713 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _737 = _697 & 3;
    bool _739 = _737 != 0;
    out.m_73.x = _278;
    out.m_73.y = _280;
    out.m_73.z = _709;
    float _741 = _729 + (-0.5);
    float _743 = float(uint(_733));
    float _745 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[80].x, _583);
    int _747 = _697 + _723;
    float _749 = -_677;
    float _751 = _749 + 1.0;
    float _753 = -_741;
    float _755 = -_585;
    float _757 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[80].y, _755);
    float _759 = as_type<float>(_288) * _743;
    int _761 = _747 >> 2;
    float _763 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[143].x, _705);
    float _765 = -_276;
    float _767 = fma(_681, _765, _745);
    float _769 = fma(_729, _721, _757);
    int _771 = _761 << 4;
    int _773 = _771 + 368;
    float _775 = trunc(_759);
    float _777 = precise::max(_775, 0.0);
    uint _779 = uint(_777);
    float _781 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    uint _785 = uint(int(uint(_773) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[int(_795)][_797];
    int _801 = _697 & 3;
    bool _803 = _801 != 0;
    float _805 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].x, _781);
    float _807 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _809 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _811 = uint(_801) > 1u;
    float _813 = _637 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _815 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].y, _807);
    int _817 = _773 + 8;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    float _835 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].z, _809);
    int _837 = ~_236;
    int _839 = _837 + 1;
    out.m_75.x = _767;
    out.m_75.y = _769;
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].y, _815);
    int _843 = int(_649) + int(_779);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _847 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].z, _835);
    float _849 = _841 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _851 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].x, _805);
    int _853 = _839 * _843;
    int _855 = _853 + _455;
    bool _857 = !_803;
    int _859 = _857 ? 0 : 1;
    float _861 = _847 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _863 = _739 ? 0 : 1;
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _867 = uint(_855) >= uint(_236);
    float _869 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    int _871 = ~_863;
    int _873 = _871 + 1;
    int _875 = _873 + 1;
    float _877 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[144].x, _763);
    int _879 = _875;
    if (!_811)
    {
        int _881 = ~_863;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[144].y, _783);
    bool _889 = _801 != 3;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _893 = !_867;
    int _895 = _893 ? 0 : (-1);
    float _897 = _861 * _845;
    bool _899 = uint(_801) >= 2u;
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    int _903 = ~_843;
    int _905 = _903 + _895;
    int _907 = _905 + 1;
    float _909 = fma(_897, 0.5, 0.5);
    int _911 = abs(_859);
    float _913 = _849 * _865;
    int _915 = abs(_885);
    int _917 = _236 * _907;
    int _919 = _917 + _455;
    int _921 = _899 ? 0 : 1;
    float _923 = fma(_913, 0.5, 0.5);
    int _925 = ~_915;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    bool _931 = _801 != 3;
    float _933 = _869 * _891;
    int _935 = ~_921;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    int _941 = _929 * as_type<int>(_799);
    float _943 = floor(_923);
    int _945 = _939;
    float _947 = as_type<float>(_919);
    float _949 = _891;
    if (_889)
    {
        int _951 = ~_921;
        int _953 = _951 + 1;
        _945 = _953;
    }
    int _955 = _945;
    float _957 = fma(_933, 0.5, 0.5);
    bool _959 = !_931;
    int _961 = _959 ? 0 : (-1);
    float _963 = in.m_77.x;
    float _965 = in.m_77.y;
    int _967 = ~_911;
    int _969 = _967 + 1;
    int _971 = _969 + 1;
    int _973 = abs(_955);
    float _975 = floor(_957);
    bool _977 = !_467;
    int _979 = _977 ? 0 : 1;
    int _981 = _971 * as_type<int>(_791);
    int _983 = _981 + _941;
    int _985 = abs(_961);
    int _987 = ~_973;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    int _993 = abs(_979);
    float _995 = -_943;
    float _997 = _923 + _995;
    int _999 = _991 * as_type<int>(_825);
    int _1001 = _999 + _983;
    float _1003 = floor(_909);
    int _1005 = ~_985;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    int _1011 = ~_993;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = -_975;
    float _1019 = _957 + _1017;
    int _1021 = _1009 * as_type<int>(_833);
    int _1023 = _1021 + _1001;
    bool _1025 = !_371;
    int _1027 = _1025 ? _919 : (-1);
    float _1029 = _887 * _965;
    bool _1031 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan(1.0);
    bool _1039 = _1035 || _1037;
    int _1041 = _1023 * _1015;
    float _1043 = _877 * _963;
    float _1045 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1047 = _1027 * _993;
    int _1049 = _1047 + _1041;
    float _1051 = fma(_997, 2.0, -1.0);
    float _1053 = -_1003;
    float _1055 = _909 + _1053;
    float _1057 = fma(_1019, 2.0, -1.0);
    float _1059 = float(_1049);
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1063 = fma(_1055, 2.0, -1.0);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1067 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1073 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_79.x = _1059;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1069);
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1071);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1073);
    float _1081 = _1063 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _180);
    float _1085 = _1067 * _901;
    float _1087 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1075);
    float _1089 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1077);
    float _1091 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1079);
    float _1093 = _1045 * _1083;
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1101 = _1045;
    float _1103 = _1045;
    float _1105 = _1057;
    float _1107 = _1051;
    float _1109 = _1089;
    float _1111 = _1063;
    float _1113 = _1083;
    int _1115 = _955;
    float _1123;
    if (!_1039)
    {
        bool _1117 = _1097 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1119 = !_1117;
        _1121 = _1119;
        if (!_1121)
        {
            _1123 = 0.0;
            _1125 = true;
        }
    }
    if ((!_1125) || _1121)
    {
        bool _1149;
        if (!_1121)
        {
            bool _1127 = _1097 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1129 = isnan(_1097);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1135 = _1131 || _1133;
            bool _1137 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1139 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1141 = !_1135;
            bool _1143 = _1139 && _1141;
            if (_1143)
            {
                _1101 = 0.0;
            }
            float _1145 = _1101;
            bool _1147 = !_1135;
            _1149 = _1147 && _1137;
            _1103 = _1145;
            _1123 = _1145;
        }
        if ((!_1149) || _1121)
        {
            _1121 = false;
            float _1151 = _1103;
            bool _1153 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1155 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1157 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1159 = _1151;
            if (_1153)
            {
                float _1161 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1159 = _1161;
            }
            float _1163 = _1159;
            if (_1153)
            {
                float _1165 = abs(_1057);
                float _1167 = -_1165;
                float _1169 = _1167 + 1.0;
                _1105 = _1169;
            }
            float _1171 = _1105;
            if (_1155)
            {
                float _1173 = abs(_1051);
                float _1175 = -_1173;
                float _1177 = _1175 + 1.0;
                _1107 = _1177;
            }
            float _1179 = _1107;
            if (!_1153)
            {
                _1109 = 1.0;
            }
            float _1181 = _1109;
            float _1183 = _1181;
            if (_1157)
            {
                float _1185 = abs(_1063);
                float _1187 = -_1185;
                float _1189 = _1187 + 1.0;
                _1111 = _1189;
            }
            float _1191 = _1111;
            if (!_1155)
            {
                _1113 = 1.0;
            }
            float _1193 = _1113;
            float _1195 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1197 = _1193;
            if (_1155)
            {
                float _1199 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1195 = _1199;
            }
            float _1201 = _1195;
            float _1203 = _963;
            if (_1157)
            {
                float _1205 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1203 = _1205;
            }
            float _1207 = _1203;
            float _1209 = _1163;
            if (_1153)
            {
                float _1211 = _1171 * _1163;
                float _1213 = precise::clamp(_1211, 0.0, 1.0);
                _1183 = _1213;
            }
            float _1215 = _1183;
            if (!_1157)
            {
                _1209 = 1.0;
            }
            float _1217 = _1209;
            float _1219 = _1217;
            if (_1155)
            {
                float _1221 = _1179 * _1201;
                float _1223 = precise::clamp(_1221, 0.0, 1.0);
                _1197 = _1223;
            }
            float _1225 = _1197;
            float _1227 = _1215 * _1225;
            if (_1157)
            {
                float _1229 = _1191 * _1207;
                float _1231 = precise::clamp(_1229, 0.0, 1.0);
                _1219 = _1231;
            }
            float _1233 = _1219;
            float _1235 = _1227 * _1233;
            _1123 = _1235;
        }
    }
    _1125 = false;
    float _1237 = _1123;
    float _1239 = _1097 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1241 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1243 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1245 = fma(_1095, 6.2500002968590706586837768554688e-05, 0.5);
    float _1247 = fma(_1099, 6.2500002968590706586837768554688e-05, 0.5);
    float _1249 = fma(_1095, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1241);
    float _1251 = fma(_1095, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1243);
    float _1253 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1249);
    float _1255 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1251);
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1259 = _1255 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1261 = trunc(_1257);
    int _1263 = int(_1261);
    float _1265 = trunc(_1259);
    int _1267 = int(_1265);
    int _1269 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1271 = _1263 + _1269;
    int _1273 = _1271 + 1;
    bool _1275 = _1273 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1277 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1279 = _1267 + _1277;
    int _1281 = _1279 + 1;
    int _1283 = _1273 | _1281;
    bool _1285 = _1283 < 0;
    bool _1287 = _1285 || _1275;
    bool _1289 = _1281 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1291 = _1289 || _1287;
    int _1293 = _1281;
    int _1295 = _1273;
    if (!_1291)
    {
        int _1297 = _1281 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1299 = _1297 + _1273;
        _1293 = _1299;
    }
    int _1301 = _1293;
    float _1303 = as_type<float>(_1283);
    if (!_1291)
    {
        float _1305 = floor(_1259);
        _1303 = _1305;
    }
    float _1307 = _1303;
    if (!_1291)
    {
        int _1309 = _1301 << 2;
        _1115 = _1309;
    }
    int _1311 = _1115;
    int _1313 = _1311;
    if (!_1291)
    {
        uint _1315 = uint(int(uint(_1301) >> uint(2)));
        _1295 = int(_1315);
    }
    int _1317 = _1295;
    if (!_1291)
    {
        int _1319 = 12 & _1311;
        _1313 = _1319;
    }
    int _1321 = _1313;
    float _1323 = as_type<float>(_1321);
    if (!_1291)
    {
        int _1325 = _1317 << 4;
        int _1327 = _1325 + _1321;
        _947 = as_type<float>(_1327);
    }
    float _1329 = _947;
    float _1331 = as_type<float>(_1317);
    if (!_1291)
    {
        float _1333 = floor(_1257);
        _1331 = _1333;
    }
    float _1335 = _1331;
    if (!_1291)
    {
        float _1337 = -_1307;
        float _1339 = _1259 + _1337;
        _1323 = _1339;
    }
    float _1341 = _1323;
    float _1343 = _1329;
    if (!_1291)
    {
        int _1345 = as_type<int>(_1329) + 400;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
        int _1351 = int(_1347) & 3;
        float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
        _1343 = _1353;
    }
    float _1355 = _1343;
    float2 _4513 = float2(_1245, _1247);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4513, float2(0.0), isnan(_4513)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4513, float2(0.0), isnan(_4513)), level(0.0)).x;
    if (!_1291)
    {
        float _1359 = -_1335;
        float _1361 = _1257 + _1359;
        _949 = _1361;
    }
    float _1363 = _949;
    float _1365 = _909;
    if (!_1291)
    {
        float _1367 = rint(_1355);
        float _1369 = precise::max(_1367, 0.0);
        uint _1371 = uint(_1369);
        uint _1373 = clamp(_1371, 0u, 65535u);
        _1365 = as_type<float>(_1373);
    }
    float _1375 = _1365;
    float _1377 = _1341;
    if (!_1291)
    {
        float3 _4559 = float3(_1363, _1341, float(as_type<int>(_1375)));
        float3 _4563 = select(_4559, float3(0.0), isnan(_4559));
        float _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4563.xy, uint(rint(_4563.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4563.xy, uint(rint(_4563.z)), level(0.0)).x;
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = -_1097;
    float _1385 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1387 = -_1095;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1391 = -_1099;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1395 = _1385 * _1385;
    float _1397 = fma(_1389, _1389, _1395);
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1401 = fma(_1393, _1393, _1397);
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1405 = rsqrt(_1401);
    float _1407 = -_1399;
    float _1409 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1407);
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1413 = -_1411;
    float _1415 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1413);
    float _1417 = _1389 * _1405;
    float _1419 = _1393 * _1405;
    float _1421 = _1385 * _1405;
    float _1423 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1425 = _1417 * _1417;
    float _1427 = fma(_1419, _1419, _1425);
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1431 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1435 = rsqrt(_1427);
    float _1437 = -_1429;
    float _1439 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1437);
    float _1441 = -_1403;
    float _1443 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1441);
    float _1445 = -_1431;
    float _1447 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1445);
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1451 = -_1433;
    float _1453 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1451);
    float _1455 = -_1449;
    float _1457 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1455);
    float _1459 = -_1423;
    float _1461 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1459);
    float _1463 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1457);
    float _1465 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1461);
    float _1467 = _1419 * _1435;
    float _1469 = _1417 * _1435;
    float _1471 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1475 = -_1467;
    float _1477 = _1419 * _1475;
    float _1479 = -_1467;
    float _1481 = _1421 * _1479;
    float _1483 = -_1471;
    float _1485 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1483);
    float _1487 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1489 = -_1477;
    float _1491 = fma(_1417, _1469, _1489);
    float _1493 = _1421 * _1469;
    float _1495 = -_1473;
    float _1497 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1499 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1485);
    float _1501 = _1491 * _1491;
    float _1503 = -_1487;
    float _1505 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1503);
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1497);
    float _1509 = fma(_1493, _1493, _1501);
    float _1511 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1505);
    float _1513 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1515 = fma(_1481, _1481, _1509);
    float _1517 = -_1511;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1507);
    float _1521 = -_1513;
    float _1523 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1525 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1527 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = 1.0 / _1519;
    float _1531 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1523);
    float _1533 = -_1525;
    float _1535 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1533);
    float _1537 = -_1527;
    float _1539 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1537);
    float _1541 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    float _1543 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1539);
    float _1545 = rsqrt(_1515);
    float _1547 = fma(_1531, _1529, -1.0);
    float _1549 = _1491 * _1545;
    float _1551 = precise::clamp(_1549, 0.0, 1.0);
    float _1553 = -_1551;
    float _1555 = _1553 + 1.0;
    float _1557 = _1555 * _1529;
    float _1559 = fma(_1555, _1547, 1.0);
    float _1561 = _1541 * _1557;
    float _1563 = _1559 * _1559;
    float _1565 = _1543 * _1557;
    float _1567 = fma(_1561, _1561, _1563);
    float _1569 = fma(_1565, _1565, _1567);
    float _1571 = rsqrt(_1569);
    float _1573 = _1565 * _1571;
    float _1575 = _1559 * _1571;
    float _1577 = _1561 * _1571;
    float _1579 = -_1573;
    float _1581 = _1417 * _1579;
    float _1583 = _1419 * _1575;
    float _1585 = -_1577;
    float _1587 = -_1581;
    float _1589 = fma(_1419, _1585, _1587);
    float _1591 = -_1573;
    float _1593 = -_1583;
    float _1595 = fma(_1421, _1591, _1593);
    float _1597 = -_1577;
    float _1599 = _1421 * _1597;
    float _1601 = _1589 * _1589;
    float _1603 = -_1599;
    float _1605 = fma(_1417, _1575, _1603);
    float _1607 = fma(_1595, _1595, _1601);
    float _1609 = fma(_1605, _1605, _1607);
    float _1611 = rsqrt(_1609);
    float _1613 = _1595 * _1611;
    float _1615 = _1605 * _1611;
    float _1617 = _1589 * _1611;
    float _1619 = _1419 * _1613;
    float _1621 = _1421 * _1615;
    float _1623 = -_1619;
    float _1625 = fma(_1417, _1615, _1623);
    float _1627 = -_1621;
    float _1629 = fma(_1419, _1617, _1627);
    float _1631 = _1417 * _1617;
    float _1633 = _1625 * _1625;
    float _1635 = -_1631;
    float _1637 = fma(_1421, _1613, _1635);
    float _1639 = fma(_1629, _1629, _1633);
    float _1641 = fma(_1637, _1637, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = _1637 * _1643;
    float _1647 = _1625 * _1643;
    float _1649 = _1629 * _1643;
    float _1651 = _1417 * _1645;
    float _1653 = _1419 * _1647;
    float _1655 = -_1651;
    float _1657 = fma(_1419, _1649, _1655);
    float _1659 = -_1653;
    float _1661 = fma(_1421, _1645, _1659);
    float _1663 = _1421 * _1649;
    float _1665 = _1093 * _1649;
    float _1667 = _1657 * _1657;
    float _1669 = -_1663;
    float _1671 = fma(_1417, _1647, _1669);
    float _1673 = fma(_1661, _1661, _1667);
    float _1675 = fma(_1671, _1671, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = _1085 * _1677;
    float _1681 = _1093 * _1645;
    float _1683 = _1093 * _1647;
    float _1685 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1687 = fma(_1661, _1679, _1665);
    float _1689 = fma(_1671, _1679, _1681);
    float _1691 = fma(_1657, _1679, _1683);
    float _1693 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1685);
    float _1695 = _1095 + _1687;
    float _1697 = _1099 + _1689;
    float _1699 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1701 = _1097 + _1691;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1705 = _1695 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1709 = _1697 + _1707;
    float _1711 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1699);
    float _1713 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1693);
    float _1715 = _1709 * _1709;
    float _1717 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1711);
    float _1719 = fma(_1705, _1705, _1715);
    float _1721 = sqrt(_1719);
    bool _1723 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(0.5);
    bool _1731 = _1727 || _1729;
    bool _1733 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.5);
    bool _1741 = _1737 || _1739;
    bool _1743 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = _1693;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1749 = _1697;
    int _1751 = as_type<int>(_1719);
    if (!_1743)
    {
        _1745 = _1695;
    }
    float _1753 = _1745;
    float _1755 = _1753;
    if (!_1743)
    {
        _1747 = _1701;
    }
    float _1757 = _1747;
    bool _1759 = !_1743;
    float _1761 = _1757;
    float _1763 = _1357;
    if (!_1759)
    {
        float _1765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1769 = _1721 + _1767;
        float _1771 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1773 = rsqrt(_1719);
        float _1775 = _1769 * _1765;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = _1777 * 6.283185482025146484375;
        float _1781 = cos(_1779);
        float _1783 = _1777 * 6.283185482025146484375;
        float _1785 = sin(_1783);
        float _1787 = _1781 + (-1.0);
        float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1791 = fma(_1785, _1771, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1793 = fma(_1701, _1781, _1789);
        float _1795 = _1773 * _1791;
        float _1797 = fma(_1705, _1795, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1799 = fma(_1709, _1795, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1761 = _1793;
        _1755 = _1797;
        _1749 = _1799;
    }
    float _1801 = _1761;
    float _1803 = _1755;
    float _1805 = _1749;
    float _1807 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1809 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1811 = _1801;
    float _1813 = _1803;
    float _1815 = _1805;
    if (!_1731)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1819 = _1097 + _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1823 = _1095 + _1821;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = -_1097;
        float _1829 = _1827 + _1801;
        float _1831 = _1819 * _1819;
        float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1835 = _1099 + _1833;
        float _1837 = -_1095;
        float _1839 = _1837 + _1803;
        float _1841 = fma(_1823, _1823, _1831);
        float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1845 = fma(_1835, _1835, _1841);
        float _1847 = sqrt(_1845);
        float _1849 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1851 = precise::min(_1847, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1853 = _1851 * _1843;
        float _1855 = _1849 * _1853;
        float _1857 = -_1099;
        float _1859 = _1857 + _1805;
        float _1861 = fma(_1829, _1855, _1097);
        float _1863 = fma(_1839, _1855, _1095);
        float _1865 = fma(_1859, _1855, _1099);
        _1811 = _1861;
        _1813 = _1863;
        _1815 = _1865;
    }
    float _1867 = _1811;
    float _1869 = _1813;
    float _1871 = _1815;
    float _1873 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1877 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1879 = 1.0 / _1809;
    float _1881 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1873);
    float _1883 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1875);
    float _1885 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1887 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1877);
    float _1889 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1881);
    float _1891 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1883);
    float _1893 = _1807 + _1809;
    float _1895 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1885);
    float _1897 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1899 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1887);
    float _1901 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1903 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1905 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1909 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1911 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1913 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1915 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1905);
    float _1917 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1907);
    float _1919 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1921 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1911);
    float _1923 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1915);
    float _1927 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1917);
    float _1929 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1931 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1921);
    float _1933 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1935 = _1893 * _1879;
    float _1937 = _1935 * 0.5;
    float _1939 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1927);
    float _1941 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1929);
    float _1943 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1931);
    float _1945 = _1917;
    float _1947 = _1923;
    float _1949 = _1933;
    float _1951 = _1939;
    if (_1741)
    {
        _1945 = 1.0;
    }
    float _1953 = _1945;
    float _1955 = _1953;
    if (!_1741)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1961 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
        float _1963 = _1957 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1967;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1961;
        float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1987;
        float _1991 = _1981 * _1983;
        float _1993 = _1971 * 6.283185482025146484375;
        float _1995 = sin(_1993);
        float _1997 = 1.0 / _1991;
        float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2001 = _1985 * _1999;
        float _2003 = 1.0 / _1989;
        float _2005 = _1995 * _1997;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = fma(_2005, _2001, _2007);
        float _2011 = _2009 * _2003;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        _1947 = _2005;
        _1955 = _2013;
        _1751 = as_type<int>(_1971);
    }
    float _2015 = _1947;
    float _2017 = _1955;
    int _2019 = _1751;
    out.gl_Position.x = _1933;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _1941;
    out.gl_Position.w = _1943;
    float _2021 = abs(_1357);
    bool _2023 = _2021 != 0.0;
    bool _2025 = isnan(_2021);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan(0.0);
    bool _2031 = _2027 || _2029;
    float _2033 = _2015;
    int _2035 = _2019;
    if (_1741)
    {
        _1763 = 1.0;
    }
    float _2037 = _1763;
    float _2039 = _2037;
    if (_2031)
    {
        _2033 = _1943;
    }
    float _2041 = _2033;
    float _2043 = _2041;
    if (!_2031)
    {
        _2043 = 0.0;
    }
    float _2045 = _2043;
    float _2047 = _2045;
    if (!_1741)
    {
        float _2049 = as_type<float>(in.m_83.w);
        int _2051 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _2053 = _2051 == 4;
        bool _2055 = _2051 == 8;
        bool _2057 = _2051 == 12;
        int _2059 = as_type<int>(_2049) << 16;
        int _2061 = as_type<int>(_2049) << 8;
        int _2063 = as_type<int>(_2049) << 24;
        int _2065 = _2059 >> 24;
        int _2067 = _2061 >> 24;
        int _2069 = as_type<int>(_2049) >> 24;
        int _2071 = _2063 >> 24;
        float _2073 = float(_2065);
        float _2075 = float(_2067);
        float _2077 = float(_2069);
        float _2079 = _2073 * 0.0078740157186985015869140625;
        float _2081 = float(_2071);
        float _2083 = _2075 * 0.0078740157186985015869140625;
        float _2085 = _2077 * 0.0078740157186985015869140625;
        float _2087 = precise::min(_2079, 1.0);
        float _2089 = _2081 * 0.0078740157186985015869140625;
        float _2091 = precise::min(_2083, 1.0);
        float _2093 = precise::min(_2085, 1.0);
        float _2095 = precise::min(_2089, 1.0);
        float _2097 = precise::max(_2087, -1.0);
        float _2099 = precise::max(_2091, -1.0);
        float _2101 = precise::max(_2093, -1.0);
        float _2103 = precise::max(_2095, -1.0);
        float _2105 = _2103;
        if (_2053)
        {
            _2105 = _2097;
        }
        float _2107 = _2105;
        float _2109 = _2107;
        if (_2055)
        {
            _2109 = _2099;
        }
        float _2111 = _2109;
        float _2113 = _2111;
        if (_2057)
        {
            _2113 = _2101;
        }
        float _2115 = _2113;
        float _2117 = abs(_2115);
        float _2119 = (-0.0) + _2117;
        _2039 = _2119;
    }
    float _2121 = _2039;
    if (!_2031)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1291)
    {
        int _2123 = _1301 << 4;
        int _2125 = _2123 + 2048;
        uint _2127 = uint(int(uint(_2125) >> uint(2)));
        uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
        int _2131 = int(_2127) & 3;
        float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
        int _2135 = int(_2127) + 1;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        int _2139 = _2135 & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = _2125 + 8;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        uint _2147 = uint(int(uint(int(_2145)) >> uint(2)));
        int _2149 = int(_2145) & 3;
        float _2151 = (*spvDescriptorSet0.vp_c15)._m0[int(_2147)][_2149];
        int _2153 = int(_2145) + 1;
        uint _2155 = uint(int(uint(_2153) >> uint(2)));
        int _2157 = _2153 & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        float _2161 = _1239 * _2141;
        float _2163 = fma(_1095, _2133, _2161);
        float _2165 = fma(_1099, _2151, _2163);
        float _2167 = _2165 + _2159;
        float _2169 = precise::clamp(_2167, 0.0, 1.0);
        float _2171 = -_2169;
        float _2173 = _2171 + _1381;
        float _2175 = fma(_2173, 500.0, 1.5);
        float _2177 = exp2(_2175);
        float _2179 = 0.0 + _2177;
        float _2181 = precise::clamp(_2179, 0.0, 1.0);
        bool _2183 = _2181 >= 1.0;
        bool _2185 = isnan(_2181);
        bool _2187 = _2183 || _2185;
        bool _2189 = isnan(1.0);
        bool _2191 = _2187 || _2189;
        if (!_2191)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2191)
        {
            _2047 = 0.0;
        }
    }
    float _2193 = _2047;
    float _2195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2197 = _1867 + _2195;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2201 = _1869 + _2199;
    float _2203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2205 = _1871 + _2203;
    float _2207 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2209 = _2197 * _2197;
    float _2211 = 1.0 / _2193;
    float _2213 = fma(_2201, _2201, _2209);
    float _2215 = fma(_2205, _2205, _2213);
    float _2217 = rsqrt(_2215);
    float _2219 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2221 = _2201 * _2219;
    float _2223 = _2205 * _2219;
    float _2225 = _2221 * _2221;
    float _2227 = _2223 * _2223;
    float _2229 = _2225 + _2227;
    float _2231 = sqrt(_2229);
    bool _2233 = _2231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2237 = _2231 + _2235;
    float _2239 = _2209;
    float _2241 = _2229;
    float _2243 = _2237;
    float _2245 = _2201;
    float _2247 = _2205;
    float _2249 = _2197;
    float _2251 = _2221;
    if (_2233)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    if (_2233)
    {
        float _2257 = rsqrt(_2229);
        _2241 = _2257;
    }
    float _2259 = _2241;
    float _2261 = _2259;
    if (_2233)
    {
        float _2263 = _2237 * _2255;
        _2243 = _2263;
    }
    float _2265 = _2243;
    if (_2233)
    {
        float _2267 = _2265 * 0.15915493667125701904296875;
        _2245 = _2267;
    }
    float _2269 = _2245;
    float _2271 = _2255;
    if (_2233)
    {
        float _2273 = _2269 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        _2271 = _2275;
    }
    float _2277 = _2271;
    float _2279 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2281 = precise::max(0.0, _2279);
    float _2283 = _1099;
    float _2285 = _2281;
    if (_2233)
    {
        float _2287 = _2269 * 6.283185482025146484375;
        float _2289 = cos(_2287);
        _2283 = _2289;
    }
    float _2291 = _2283;
    float _2293 = -_2219;
    float _2295 = -_2281;
    float _2297 = fma(_2197, _2293, _2295);
    if (_2233)
    {
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2299;
    }
    float _2301 = _2285;
    float _2303 = _2277;
    float _2305 = _2301;
    if (_2233)
    {
        float _2307 = fma(_2277, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2247 = _2307;
    }
    float _2309 = _2247;
    float _2311 = _2309;
    if (!_2233)
    {
        _2303 = _2297;
    }
    float _2313 = _2303;
    float _2315 = _2313;
    if (_2233)
    {
        float _2317 = _2291 + (-1.0);
        _2249 = _2317;
    }
    float _2319 = _2249;
    float _2321 = _2319;
    if (_2233)
    {
        float _2323 = _2259 * _2309;
        _2311 = _2323;
    }
    float _2325 = _2311;
    if (!_2233)
    {
        _2261 = _2225;
    }
    float _2327 = _2261;
    float _2329 = _2327;
    if (_2233)
    {
        float _2331 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2305 = _2331;
    }
    float _2333 = _2305;
    float _2335 = _2333;
    if (_2233)
    {
        float _2337 = _2221 * _2325;
        _2251 = _2337;
    }
    float _2339 = _2251;
    if (!_2233)
    {
        _2321 = _2227;
    }
    float _2341 = _2321;
    float _2343 = _2341;
    if (_2233)
    {
        float _2345 = fma(_2297, _2291, _2333);
        _2315 = _2345;
    }
    float _2347 = _2315;
    if (!_2233)
    {
        _2335 = _2223;
    }
    float _2349 = _2335;
    float _2351 = _2349;
    if (_2233)
    {
        float _2353 = _2223 * _2325;
        _2351 = _2353;
    }
    float _2355 = _2351;
    if (_2233)
    {
        float _2357 = _2339 * _2339;
        _2329 = _2357;
    }
    float _2359 = _2329;
    float _2361 = sqrt(_2215);
    if (_2233)
    {
        float _2363 = _2355 * _2355;
        _2343 = _2363;
    }
    float _2365 = _2343;
    float _2367 = fma(_2347, _2347, _2359);
    bool _2369 = _2121 != 0.0;
    bool _2371 = isnan(_2121);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = _2367 + _2365;
    float _2381 = rsqrt(_2379);
    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2385 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2383);
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (!_2377)
    {
        _1949 = 0.0;
        _1951 = 0.0;
    }
    float _2391 = _1949;
    float _2393 = _1951;
    float _2395 = -_2387;
    float _2397 = _2395 + 1.0;
    float _2399 = -_2207;
    float _2401 = fma(_2399, _2389, 1.0);
    float _2403 = _2211 * _2391;
    float _2405 = abs(_2397);
    float _2407 = log2(_2405);
    float _2409 = _2381 * _2339;
    float _2411 = _2381 * _2347;
    float _2413 = _2381 * _2355;
    float _2415 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2417 = log2(_2401);
    float _2419 = -_2415;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2419);
    float _2423 = -_2413;
    float _2425 = fma(_2423, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2421);
    float _2427 = _2411 + 1.0;
    float _2429 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2431 = fma(_2425, -0.5, 0.5);
    float _2433 = fma(_2425, 0.5, 0.5);
    float _2435 = exp2(_2429);
    float _2437 = fma(_2433, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2439 = _2417 * 0.693147182464599609375;
    float _2441 = _2211 * _2393;
    float _2443 = fma(_2433, _2437, -0.212114393711090087890625);
    float _2445 = sqrt(_2431);
    float _2447 = fma(_2433, _2443, 1.570728778839111328125);
    float _2449 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2451 = fma(_2403, 0.5, 0.5);
    float _2453 = -_2411;
    float _2455 = fma(_2435, _2427, _2453);
    float _2457 = fma(_2441, -0.5, 0.5);
    float _2459 = fma(_2455, 0.5, 0.5);
    float _2461 = _2445 * 0.636619746685028076171875;
    float3 _6286 = float3(_2451, _2457, _2449);
    float _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6286, float3(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6286, float3(0.0), isnan(_6286)), level(0.0)).x;
    float3 _6295 = float3(_2451, _2457, _2449);
    float4 _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6295, float3(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6295, float3(0.0), isnan(_6295)), level(0.0)).xyzw;
    float _2468 = _2466.x;
    float _2470 = _2466.y;
    float _2472 = _2466.z;
    float _2474 = _2466.w;
    float _2476 = -_2447;
    float _2478 = fma(_2461, _2476, 1.0);
    float2 _6316 = float2(_2478, _2459);
    float3 _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6316, float2(0.0), isnan(_6316)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6316, float2(0.0), isnan(_6316)), level(0.0)).xyz;
    float _2484 = _2482.x;
    float _2486 = _2482.y;
    float _2488 = _2482.z;
    float _2490 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2492 = _2403;
    if (!_2377)
    {
        _2492 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2494 = _2492;
    float _2496 = _1237 * _2017;
    float _2498 = _1941 + _1943;
    float _2500 = exp2(_2490);
    if (!_2377)
    {
        float _2502 = _2494 * 5.0;
        _2035 = as_type<int>(_2502);
    }
    int _2504 = _2035;
    float _2506 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2508 = _2498 * 0.5;
    float _2510 = _2506 * _2121;
    float _2512 = _2510;
    if (!_2377)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6373 = as_type<float>(_2504);
        out.gl_Position.z = _6373;
    }
    if (!_2377)
    {
        _2512 = 0.0;
    }
    float _2514 = _2512;
    bool _2516 = _2017 > 0.0;
    bool _2518 = isnan(_2017);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(0.0);
    bool _2524 = _2520 || _2522;
    out.m_85.z = _2508;
    out.m_85.w = _1943;
    float _2526 = _2514 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2528 = -_2500;
    float _2530 = _2528 + 1.0;
    out.m_87.w = _2526;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2534 = _2532 * _2463;
    float _2536 = -_2532;
    float _2538 = _2536 + 1.0;
    float _2540 = _2474 * _2534;
    out.m_56.x = 1.0;
    float _2542 = _2488 * _2534;
    float _2544 = fma(_2484, _2540, _2468);
    float _2546 = fma(_2486, _2540, _2470);
    float _2548 = _2474 * _2538;
    float _2550 = fma(_2474, _2542, _2472);
    out.m_89.x = _2544;
    out.m_89.y = _2546;
    out.m_89.z = _2550;
    out.m_89.w = _2548;
    if (_2524)
    {
        return out;
    }
    out.m_56.x = 0.0;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2552;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1125 = false;
    bool _1121 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_53.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_56.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2609 = as_type<float>(_124);
        out.gl_Position.z = _2609;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_58.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2678 = as_type<float>(_160);
        out.gl_Position.z = _2678;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = as_type<float>(int(gl_VertexIndex));
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _166 = as_type<int>(_162) & 1;
    bool _168 = _166 != 0;
    int _170 = as_type<int>(_162) & 2;
    bool _172 = _170 != 0;
    bool _174 = !_168;
    float _176 = _174 ? (-0.5) : 0.5;
    bool _178 = !_172;
    float _180 = _178 ? (-0.5) : 0.5;
    bool _182 = !_164;
    float _202;
    float _204;
    if (!_182)
    {
        float _184 = in.m_63.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = float(_108);
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _194 = _192 * _186;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _188;
        _204 = _200;
        _206 = true;
    }
    else
    {
        float _208 = float(_108);
        float _210 = 1.0 / _208;
        float _212 = _142 * _210;
        _202 = _208;
        _204 = _212;
    }
    _206 = false;
    float _214 = _202;
    float _216 = _204;
    float _218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _220 = int(_218);
    float _222 = in.m_63.x;
    float _224 = in.m_63.y;
    float _226 = in.m_65.x;
    float _228 = in.m_65.y;
    float _230 = in.m_65.z;
    float _232 = in.m_65.w;
    float _234 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _236 = int(_234);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _242 = float(_220);
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _248 = 1.0 / _242;
    float _250 = float(uint(_236));
    float _252 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[78].z, _246);
    int _254 = ~_236;
    int _256 = _254 + 1;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _260 = ~_236;
    int _262 = _260 + 1;
    float _264 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _252);
    int _266 = ~_236;
    int _268 = _266 + 1;
    float _270 = 1.0 / _250;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = _258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _280 = _272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _282 = _142 * _248;
    float _284 = trunc(_282);
    int _286 = int(_284);
    int _288 = as_type<int>(_270) + (-2);
    float _290 = float(uint(_286));
    float _292 = as_type<float>(_288) * _290;
    float _294 = trunc(_292);
    float _296 = precise::max(_294, 0.0);
    uint _299 = uint(_296);
    float _301 = float(_286);
    int _303 = _256 * int(_299);
    int _305 = _303 + _286;
    float _307 = float(_236);
    float _309 = float(uint(_305));
    bool _311 = _301 >= _307;
    bool _313 = isnan(_301);
    bool _315 = _311 || _313;
    bool _317 = isnan(_307);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = as_type<float>(_288) * _309;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _327 = _325 != 0;
    float _329 = trunc(_321);
    int _331 = int(_329);
    bool _333 = !_327;
    float _335 = _333 ? 7.345489978790283203125 : 1.0;
    float _337 = _335 * _222;
    float _339 = trunc(_323);
    float _341 = precise::max(_339, 0.0);
    uint _343 = uint(_341);
    float _345 = floor(_337);
    int _347 = int(_299) + int(_343);
    int _349 = _262 * _347;
    int _351 = _349 + _286;
    float _353 = 1.0 / _214;
    float _355 = -_345;
    float _357 = _337 + _355;
    int _359 = ~_331;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    bool _365 = uint(_351) >= uint(_236);
    bool _367 = !_365;
    int _369 = _367 ? 0 : (-1);
    bool _371 = _236 == 0;
    int _373 = ~_347;
    int _375 = _373 + _369;
    int _377 = _375 + 1;
    float _379 = _357 * _307;
    float _381 = _142 * _307;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _393 = _391 != 0;
    int _395 = _236 * _377;
    int _397 = _395 + _286;
    float _399 = _381 * _353;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _403 = _401 != 0;
    float _405 = trunc(_379);
    int _407 = int(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _411 = _409 != 0;
    bool _413 = !_371;
    int _415 = _413 ? _397 : (-1);
    int _417 = _236 + (-1);
    bool _419 = !_403;
    int _421 = _419 ? 0 : 1;
    int _423 = _415 * _363;
    bool _425 = !_389;
    int _427 = _425 ? 0 : 1;
    float _429 = trunc(_399);
    int _431 = int(_429);
    bool _433 = _224 > 0.5;
    int _435 = _331 * _417;
    int _437 = _435 + _423;
    bool _439 = !_385;
    int _441 = _439 ? 0 : 1;
    int _443 = abs(_427);
    int _445 = abs(_421);
    bool _447 = !_393;
    int _449 = _447 ? 0 : 1;
    int _451 = abs(_441);
    int _453 = _407 * _445;
    int _455 = _453 + _286;
    int _457 = abs(_449);
    int _459 = _437 * _443;
    bool _461 = !_411;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _467 = _465 != 0;
    int _469 = _431 * _451;
    int _471 = _469 + _459;
    int _473 = abs(_463);
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _477 = _475 != 0;
    int _479 = _455 * _457;
    int _481 = _479 + _471;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = in.m_67.x;
    float _489 = in.m_67.y;
    float _491 = in.m_67.z;
    float _493 = in.m_67.w;
    int _495 = _407 * _473;
    int _497 = _495 + _481;
    bool _499 = _222 > 0.5;
    float _501 = in.m_69.x;
    float _503 = in.m_69.y;
    float _505 = in.m_69.z;
    float _507 = in.m_69.w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _511 = float(uint(_497));
    float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _515 = as_type<float>(_288) * _511;
    float _517 = in.m_53.x;
    float _519 = in.m_53.y;
    float _521 = in.m_53.z;
    float _523 = trunc(_515);
    float _525 = precise::max(_523, 0.0);
    uint _527 = uint(_525);
    int _529 = _268 * int(_527);
    int _531 = _529 + _497;
    float _533 = _519 * _489;
    float _535 = float(uint(_531));
    float _537 = _519 * _503;
    float _539 = _519 * _228;
    float _541 = fma(_517, _487, _533);
    float _543 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _545 = as_type<float>(_288) * _535;
    float _547 = fma(_517, _501, _537);
    float _549 = fma(_517, _226, _539);
    float _551 = _222 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _553 = fma(_543, -2.0, _240);
    float _555 = trunc(_545);
    float _557 = precise::max(_555, 0.0);
    uint _559 = uint(_557);
    float _561 = -_238;
    float _563 = fma(_551, 2.0, _561);
    float _565 = fma(_521, _491, _541);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _569 = ~_236;
    int _571 = _569 + 1;
    float _573 = fma(_521, _505, _547);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _575;
    float _579 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _567);
    float _581 = -_142;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _563);
    float _585 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _553);
    float _587 = 1.0 / _577;
    float _589 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _579);
    int _591 = int(_527) + int(_559);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _597 = _216 + _595;
    int _599 = _571 * _591;
    int _601 = _599 + _497;
    float _603 = fma(_521, _230, _549);
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = _565 + _493;
    bool _609 = uint(_601) >= uint(_236);
    float _611 = _597 * _587;
    float _613 = float(uint(_455));
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _617 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _619 = !_609;
    int _621 = _619 ? 0 : (-1);
    float _623 = as_type<float>(_288) * _613;
    float _625 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _627;
    int _631 = ~_591;
    int _633 = _631 + _621;
    int _635 = _633 + 1;
    float _637 = _603 + _232;
    float _639 = -_176;
    int _641 = _499 ? as_type<int>(_639) : as_type<int>(_176);
    float _643 = fma(_629, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _645 = trunc(_623);
    float _647 = precise::max(_645, 0.0);
    uint _649 = uint(_647);
    bool _651 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _653 = isnan(_216);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    int _663 = _236 * _635;
    int _665 = _663 + _497;
    bool _667 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _669 = isnan(_216);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    out.m_71.x = _513;
    out.m_71.y = _617;
    out.m_71.z = _625;
    out.m_71.w = _244;
    bool _679 = !_477;
    float _681 = _679 ? _176 : as_type<float>(_641);
    float _683 = -_661;
    float _685 = _683 + 1.0;
    float _687 = _607 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _689 = -_180;
    int _691 = _433 ? as_type<int>(_689) : as_type<int>(_180);
    float _693 = _677 * _685;
    bool _695 = !_371;
    int _697 = _695 ? _665 : (-1);
    float _699 = _681 + 0.5;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _701;
    float _705 = _643 * _693;
    int _707 = _697 >> 31;
    float _709 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = fma(_703, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = _573 + _507;
    int _715 = ~_236;
    int _717 = _715 + 1;
    float _719 = -_589;
    float _721 = _719 + 1.0;
    int _723 = _707 & 3;
    float _725 = _711 * _693;
    bool _727 = !_485;
    float _729 = _727 ? _180 : as_type<float>(_691);
    int _731 = _717 * int(_649);
    int _733 = _731 + _455;
    float _735 = _713 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _737 = _697 & 3;
    bool _739 = _737 != 0;
    out.m_73.x = _278;
    out.m_73.y = _280;
    out.m_73.z = _709;
    float _741 = _729 + (-0.5);
    float _743 = float(uint(_733));
    float _745 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[80].x, _583);
    int _747 = _697 + _723;
    float _749 = -_677;
    float _751 = _749 + 1.0;
    float _753 = -_741;
    float _755 = -_585;
    float _757 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[80].y, _755);
    float _759 = as_type<float>(_288) * _743;
    int _761 = _747 >> 2;
    float _763 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[143].x, _705);
    float _765 = -_276;
    float _767 = fma(_681, _765, _745);
    float _769 = fma(_729, _721, _757);
    int _771 = _761 << 4;
    int _773 = _771 + 368;
    float _775 = trunc(_759);
    float _777 = precise::max(_775, 0.0);
    uint _779 = uint(_777);
    float _781 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _783 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    uint _785 = uint(int(uint(_773) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[int(_795)][_797];
    int _801 = _697 & 3;
    bool _803 = _801 != 0;
    float _805 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].x, _781);
    float _807 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _809 = _735 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _811 = uint(_801) > 1u;
    float _813 = _637 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _815 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].y, _807);
    int _817 = _773 + 8;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    float _835 = fma(_687, (*spvDescriptorSet0.vp_c12)._m0[6].z, _809);
    int _837 = ~_236;
    int _839 = _837 + 1;
    out.m_75.x = _767;
    out.m_75.y = _769;
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].y, _815);
    int _843 = int(_649) + int(_779);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _847 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].z, _835);
    float _849 = _841 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _851 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[8].x, _805);
    int _853 = _839 * _843;
    int _855 = _853 + _455;
    bool _857 = !_803;
    int _859 = _857 ? 0 : 1;
    float _861 = _847 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _863 = _739 ? 0 : 1;
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _867 = uint(_855) >= uint(_236);
    float _869 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    int _871 = ~_863;
    int _873 = _871 + 1;
    int _875 = _873 + 1;
    float _877 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[144].x, _763);
    int _879 = _875;
    if (!_811)
    {
        int _881 = ~_863;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[144].y, _783);
    bool _889 = _801 != 3;
    float _891 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _893 = !_867;
    int _895 = _893 ? 0 : (-1);
    float _897 = _861 * _845;
    bool _899 = uint(_801) >= 2u;
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    int _903 = ~_843;
    int _905 = _903 + _895;
    int _907 = _905 + 1;
    float _909 = fma(_897, 0.5, 0.5);
    int _911 = abs(_859);
    float _913 = _849 * _865;
    int _915 = abs(_885);
    int _917 = _236 * _907;
    int _919 = _917 + _455;
    int _921 = _899 ? 0 : 1;
    float _923 = fma(_913, 0.5, 0.5);
    int _925 = ~_915;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    bool _931 = _801 != 3;
    float _933 = _869 * _891;
    int _935 = ~_921;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    int _941 = _929 * as_type<int>(_799);
    float _943 = floor(_923);
    int _945 = _939;
    float _947 = as_type<float>(_919);
    float _949 = _891;
    if (_889)
    {
        int _951 = ~_921;
        int _953 = _951 + 1;
        _945 = _953;
    }
    int _955 = _945;
    float _957 = fma(_933, 0.5, 0.5);
    bool _959 = !_931;
    int _961 = _959 ? 0 : (-1);
    float _963 = in.m_77.x;
    float _965 = in.m_77.y;
    int _967 = ~_911;
    int _969 = _967 + 1;
    int _971 = _969 + 1;
    int _973 = abs(_955);
    float _975 = floor(_957);
    bool _977 = !_467;
    int _979 = _977 ? 0 : 1;
    int _981 = _971 * as_type<int>(_791);
    int _983 = _981 + _941;
    int _985 = abs(_961);
    int _987 = ~_973;
    int _989 = _987 + 1;
    int _991 = _989 + 1;
    int _993 = abs(_979);
    float _995 = -_943;
    float _997 = _923 + _995;
    int _999 = _991 * as_type<int>(_825);
    int _1001 = _999 + _983;
    float _1003 = floor(_909);
    int _1005 = ~_985;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    int _1011 = ~_993;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = -_975;
    float _1019 = _957 + _1017;
    int _1021 = _1009 * as_type<int>(_833);
    int _1023 = _1021 + _1001;
    bool _1025 = !_371;
    int _1027 = _1025 ? _919 : (-1);
    float _1029 = _887 * _965;
    bool _1031 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan(1.0);
    bool _1039 = _1035 || _1037;
    int _1041 = _1023 * _1015;
    float _1043 = _877 * _963;
    float _1045 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1047 = _1027 * _993;
    int _1049 = _1047 + _1041;
    float _1051 = fma(_997, 2.0, -1.0);
    float _1053 = -_1003;
    float _1055 = _909 + _1053;
    float _1057 = fma(_1019, 2.0, -1.0);
    float _1059 = float(_1049);
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1063 = fma(_1055, 2.0, -1.0);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1067 = _1043 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1071 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1073 = _1061 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_79.x = _1059;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1069);
    float _1077 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1071);
    float _1079 = fma(_1065, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1073);
    float _1081 = _1063 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _180);
    float _1085 = _1067 * _901;
    float _1087 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1075);
    float _1089 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1077);
    float _1091 = fma(_1081, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1079);
    float _1093 = _1045 * _1083;
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1101 = _1045;
    float _1103 = _1045;
    float _1105 = _1057;
    float _1107 = _1051;
    float _1109 = _1089;
    float _1111 = _1063;
    float _1113 = _1083;
    int _1115 = _955;
    float _1123;
    if (!_1039)
    {
        bool _1117 = _1097 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1119 = !_1117;
        _1121 = _1119;
        if (!_1121)
        {
            _1123 = 0.0;
            _1125 = true;
        }
    }
    if ((!_1125) || _1121)
    {
        bool _1149;
        if (!_1121)
        {
            bool _1127 = _1097 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1129 = isnan(_1097);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1135 = _1131 || _1133;
            bool _1137 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1139 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1141 = !_1135;
            bool _1143 = _1139 && _1141;
            if (_1143)
            {
                _1101 = 0.0;
            }
            float _1145 = _1101;
            bool _1147 = !_1135;
            _1149 = _1147 && _1137;
            _1103 = _1145;
            _1123 = _1145;
        }
        if ((!_1149) || _1121)
        {
            _1121 = false;
            float _1151 = _1103;
            bool _1153 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1155 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1157 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1159 = _1151;
            if (_1153)
            {
                float _1161 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1159 = _1161;
            }
            float _1163 = _1159;
            if (_1153)
            {
                float _1165 = abs(_1057);
                float _1167 = -_1165;
                float _1169 = _1167 + 1.0;
                _1105 = _1169;
            }
            float _1171 = _1105;
            if (_1155)
            {
                float _1173 = abs(_1051);
                float _1175 = -_1173;
                float _1177 = _1175 + 1.0;
                _1107 = _1177;
            }
            float _1179 = _1107;
            if (!_1153)
            {
                _1109 = 1.0;
            }
            float _1181 = _1109;
            float _1183 = _1181;
            if (_1157)
            {
                float _1185 = abs(_1063);
                float _1187 = -_1185;
                float _1189 = _1187 + 1.0;
                _1111 = _1189;
            }
            float _1191 = _1111;
            if (!_1155)
            {
                _1113 = 1.0;
            }
            float _1193 = _1113;
            float _1195 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1197 = _1193;
            if (_1155)
            {
                float _1199 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1195 = _1199;
            }
            float _1201 = _1195;
            float _1203 = _963;
            if (_1157)
            {
                float _1205 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1203 = _1205;
            }
            float _1207 = _1203;
            float _1209 = _1163;
            if (_1153)
            {
                float _1211 = _1171 * _1163;
                float _1213 = precise::clamp(_1211, 0.0, 1.0);
                _1183 = _1213;
            }
            float _1215 = _1183;
            if (!_1157)
            {
                _1209 = 1.0;
            }
            float _1217 = _1209;
            float _1219 = _1217;
            if (_1155)
            {
                float _1221 = _1179 * _1201;
                float _1223 = precise::clamp(_1221, 0.0, 1.0);
                _1197 = _1223;
            }
            float _1225 = _1197;
            float _1227 = _1215 * _1225;
            if (_1157)
            {
                float _1229 = _1191 * _1207;
                float _1231 = precise::clamp(_1229, 0.0, 1.0);
                _1219 = _1231;
            }
            float _1233 = _1219;
            float _1235 = _1227 * _1233;
            _1123 = _1235;
        }
    }
    _1125 = false;
    float _1237 = _1123;
    float _1239 = _1097 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1241 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1243 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1245 = fma(_1095, 6.2500002968590706586837768554688e-05, 0.5);
    float _1247 = fma(_1099, 6.2500002968590706586837768554688e-05, 0.5);
    float _1249 = fma(_1095, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1241);
    float _1251 = fma(_1095, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1243);
    float _1253 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1249);
    float _1255 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1251);
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1259 = _1255 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1261 = trunc(_1257);
    int _1263 = int(_1261);
    float _1265 = trunc(_1259);
    int _1267 = int(_1265);
    int _1269 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1271 = _1263 + _1269;
    int _1273 = _1271 + 1;
    bool _1275 = _1273 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1277 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1279 = _1267 + _1277;
    int _1281 = _1279 + 1;
    int _1283 = _1273 | _1281;
    bool _1285 = _1283 < 0;
    bool _1287 = _1285 || _1275;
    bool _1289 = _1281 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1291 = _1289 || _1287;
    int _1293 = _1281;
    int _1295 = _1273;
    if (!_1291)
    {
        int _1297 = _1281 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1299 = _1297 + _1273;
        _1293 = _1299;
    }
    int _1301 = _1293;
    float _1303 = as_type<float>(_1283);
    if (!_1291)
    {
        float _1305 = floor(_1259);
        _1303 = _1305;
    }
    float _1307 = _1303;
    if (!_1291)
    {
        int _1309 = _1301 << 2;
        _1115 = _1309;
    }
    int _1311 = _1115;
    int _1313 = _1311;
    if (!_1291)
    {
        uint _1315 = uint(int(uint(_1301) >> uint(2)));
        _1295 = int(_1315);
    }
    int _1317 = _1295;
    if (!_1291)
    {
        int _1319 = 12 & _1311;
        _1313 = _1319;
    }
    int _1321 = _1313;
    float _1323 = as_type<float>(_1321);
    if (!_1291)
    {
        int _1325 = _1317 << 4;
        int _1327 = _1325 + _1321;
        _947 = as_type<float>(_1327);
    }
    float _1329 = _947;
    float _1331 = as_type<float>(_1317);
    if (!_1291)
    {
        float _1333 = floor(_1257);
        _1331 = _1333;
    }
    float _1335 = _1331;
    if (!_1291)
    {
        float _1337 = -_1307;
        float _1339 = _1259 + _1337;
        _1323 = _1339;
    }
    float _1341 = _1323;
    float _1343 = _1329;
    if (!_1291)
    {
        int _1345 = as_type<int>(_1329) + 400;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
        int _1351 = int(_1347) & 3;
        float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
        _1343 = _1353;
    }
    float _1355 = _1343;
    float2 _4513 = float2(_1245, _1247);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4513, float2(0.0), isnan(_4513)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4513, float2(0.0), isnan(_4513)), level(0.0)).x;
    if (!_1291)
    {
        float _1359 = -_1335;
        float _1361 = _1257 + _1359;
        _949 = _1361;
    }
    float _1363 = _949;
    float _1365 = _909;
    if (!_1291)
    {
        float _1367 = rint(_1355);
        float _1369 = precise::max(_1367, 0.0);
        uint _1371 = uint(_1369);
        uint _1373 = clamp(_1371, 0u, 65535u);
        _1365 = as_type<float>(_1373);
    }
    float _1375 = _1365;
    float _1377 = _1341;
    if (!_1291)
    {
        float3 _4559 = float3(_1363, _1341, float(as_type<int>(_1375)));
        float3 _4563 = select(_4559, float3(0.0), isnan(_4559));
        float _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4563.xy, uint(rint(_4563.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4563.xy, uint(rint(_4563.z)), level(0.0)).x;
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = -_1097;
    float _1385 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1387 = -_1095;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1391 = -_1099;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1395 = _1385 * _1385;
    float _1397 = fma(_1389, _1389, _1395);
    float _1399 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1401 = fma(_1393, _1393, _1397);
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1405 = rsqrt(_1401);
    float _1407 = -_1399;
    float _1409 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1407);
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1413 = -_1411;
    float _1415 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1413);
    float _1417 = _1389 * _1405;
    float _1419 = _1393 * _1405;
    float _1421 = _1385 * _1405;
    float _1423 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1425 = _1417 * _1417;
    float _1427 = fma(_1419, _1419, _1425);
    float _1429 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1431 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1435 = rsqrt(_1427);
    float _1437 = -_1429;
    float _1439 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1437);
    float _1441 = -_1403;
    float _1443 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1441);
    float _1445 = -_1431;
    float _1447 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1445);
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1451 = -_1433;
    float _1453 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1451);
    float _1455 = -_1449;
    float _1457 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1455);
    float _1459 = -_1423;
    float _1461 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1459);
    float _1463 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1457);
    float _1465 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1461);
    float _1467 = _1419 * _1435;
    float _1469 = _1417 * _1435;
    float _1471 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1475 = -_1467;
    float _1477 = _1419 * _1475;
    float _1479 = -_1467;
    float _1481 = _1421 * _1479;
    float _1483 = -_1471;
    float _1485 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1483);
    float _1487 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1489 = -_1477;
    float _1491 = fma(_1417, _1469, _1489);
    float _1493 = _1421 * _1469;
    float _1495 = -_1473;
    float _1497 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1499 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1485);
    float _1501 = _1491 * _1491;
    float _1503 = -_1487;
    float _1505 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1503);
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1497);
    float _1509 = fma(_1493, _1493, _1501);
    float _1511 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1505);
    float _1513 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1515 = fma(_1481, _1481, _1509);
    float _1517 = -_1511;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1507);
    float _1521 = -_1513;
    float _1523 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1525 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1527 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = 1.0 / _1519;
    float _1531 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1523);
    float _1533 = -_1525;
    float _1535 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1533);
    float _1537 = -_1527;
    float _1539 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1537);
    float _1541 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    float _1543 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1539);
    float _1545 = rsqrt(_1515);
    float _1547 = fma(_1531, _1529, -1.0);
    float _1549 = _1491 * _1545;
    float _1551 = precise::clamp(_1549, 0.0, 1.0);
    float _1553 = -_1551;
    float _1555 = _1553 + 1.0;
    float _1557 = _1555 * _1529;
    float _1559 = fma(_1555, _1547, 1.0);
    float _1561 = _1541 * _1557;
    float _1563 = _1559 * _1559;
    float _1565 = _1543 * _1557;
    float _1567 = fma(_1561, _1561, _1563);
    float _1569 = fma(_1565, _1565, _1567);
    float _1571 = rsqrt(_1569);
    float _1573 = _1565 * _1571;
    float _1575 = _1559 * _1571;
    float _1577 = _1561 * _1571;
    float _1579 = -_1573;
    float _1581 = _1417 * _1579;
    float _1583 = _1419 * _1575;
    float _1585 = -_1577;
    float _1587 = -_1581;
    float _1589 = fma(_1419, _1585, _1587);
    float _1591 = -_1573;
    float _1593 = -_1583;
    float _1595 = fma(_1421, _1591, _1593);
    float _1597 = -_1577;
    float _1599 = _1421 * _1597;
    float _1601 = _1589 * _1589;
    float _1603 = -_1599;
    float _1605 = fma(_1417, _1575, _1603);
    float _1607 = fma(_1595, _1595, _1601);
    float _1609 = fma(_1605, _1605, _1607);
    float _1611 = rsqrt(_1609);
    float _1613 = _1595 * _1611;
    float _1615 = _1605 * _1611;
    float _1617 = _1589 * _1611;
    float _1619 = _1419 * _1613;
    float _1621 = _1421 * _1615;
    float _1623 = -_1619;
    float _1625 = fma(_1417, _1615, _1623);
    float _1627 = -_1621;
    float _1629 = fma(_1419, _1617, _1627);
    float _1631 = _1417 * _1617;
    float _1633 = _1625 * _1625;
    float _1635 = -_1631;
    float _1637 = fma(_1421, _1613, _1635);
    float _1639 = fma(_1629, _1629, _1633);
    float _1641 = fma(_1637, _1637, _1639);
    float _1643 = rsqrt(_1641);
    float _1645 = _1637 * _1643;
    float _1647 = _1625 * _1643;
    float _1649 = _1629 * _1643;
    float _1651 = _1417 * _1645;
    float _1653 = _1419 * _1647;
    float _1655 = -_1651;
    float _1657 = fma(_1419, _1649, _1655);
    float _1659 = -_1653;
    float _1661 = fma(_1421, _1645, _1659);
    float _1663 = _1421 * _1649;
    float _1665 = _1093 * _1649;
    float _1667 = _1657 * _1657;
    float _1669 = -_1663;
    float _1671 = fma(_1417, _1647, _1669);
    float _1673 = fma(_1661, _1661, _1667);
    float _1675 = fma(_1671, _1671, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = _1085 * _1677;
    float _1681 = _1093 * _1645;
    float _1683 = _1093 * _1647;
    float _1685 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1687 = fma(_1661, _1679, _1665);
    float _1689 = fma(_1671, _1679, _1681);
    float _1691 = fma(_1657, _1679, _1683);
    float _1693 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1685);
    float _1695 = _1095 + _1687;
    float _1697 = _1099 + _1689;
    float _1699 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1701 = _1097 + _1691;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1705 = _1695 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1709 = _1697 + _1707;
    float _1711 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1699);
    float _1713 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1693);
    float _1715 = _1709 * _1709;
    float _1717 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1711);
    float _1719 = fma(_1705, _1705, _1715);
    float _1721 = sqrt(_1719);
    bool _1723 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(0.5);
    bool _1731 = _1727 || _1729;
    bool _1733 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.5);
    bool _1741 = _1737 || _1739;
    bool _1743 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = _1693;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1749 = _1697;
    int _1751 = as_type<int>(_1719);
    if (!_1743)
    {
        _1745 = _1695;
    }
    float _1753 = _1745;
    float _1755 = _1753;
    if (!_1743)
    {
        _1747 = _1701;
    }
    float _1757 = _1747;
    bool _1759 = !_1743;
    float _1761 = _1757;
    float _1763 = _1357;
    if (!_1759)
    {
        float _1765 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1769 = _1721 + _1767;
        float _1771 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1773 = rsqrt(_1719);
        float _1775 = _1769 * _1765;
        float _1777 = _1775 * 0.15915493667125701904296875;
        float _1779 = _1777 * 6.283185482025146484375;
        float _1781 = cos(_1779);
        float _1783 = _1777 * 6.283185482025146484375;
        float _1785 = sin(_1783);
        float _1787 = _1781 + (-1.0);
        float _1789 = _1787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1791 = fma(_1785, _1771, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1793 = fma(_1701, _1781, _1789);
        float _1795 = _1773 * _1791;
        float _1797 = fma(_1705, _1795, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1799 = fma(_1709, _1795, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1761 = _1793;
        _1755 = _1797;
        _1749 = _1799;
    }
    float _1801 = _1761;
    float _1803 = _1755;
    float _1805 = _1749;
    float _1807 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1809 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1811 = _1801;
    float _1813 = _1803;
    float _1815 = _1805;
    if (!_1731)
    {
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1819 = _1097 + _1817;
        float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1823 = _1095 + _1821;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = -_1097;
        float _1829 = _1827 + _1801;
        float _1831 = _1819 * _1819;
        float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1835 = _1099 + _1833;
        float _1837 = -_1095;
        float _1839 = _1837 + _1803;
        float _1841 = fma(_1823, _1823, _1831);
        float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1845 = fma(_1835, _1835, _1841);
        float _1847 = sqrt(_1845);
        float _1849 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1851 = precise::min(_1847, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1853 = _1851 * _1843;
        float _1855 = _1849 * _1853;
        float _1857 = -_1099;
        float _1859 = _1857 + _1805;
        float _1861 = fma(_1829, _1855, _1097);
        float _1863 = fma(_1839, _1855, _1095);
        float _1865 = fma(_1859, _1855, _1099);
        _1811 = _1861;
        _1813 = _1863;
        _1815 = _1865;
    }
    float _1867 = _1811;
    float _1869 = _1813;
    float _1871 = _1815;
    float _1873 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1877 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1879 = 1.0 / _1809;
    float _1881 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1873);
    float _1883 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1875);
    float _1885 = _1867 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1887 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1877);
    float _1889 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1881);
    float _1891 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1883);
    float _1893 = _1807 + _1809;
    float _1895 = fma(_1869, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1885);
    float _1897 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1899 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1887);
    float _1901 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1903 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1905 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1909 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1911 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1913 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1915 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1905);
    float _1917 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1907);
    float _1919 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1921 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1911);
    float _1923 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1915);
    float _1927 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1917);
    float _1929 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1931 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1921);
    float _1933 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1935 = _1893 * _1879;
    float _1937 = _1935 * 0.5;
    float _1939 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1927);
    float _1941 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1929);
    float _1943 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1931);
    float _1945 = _1917;
    float _1947 = _1923;
    float _1949 = _1933;
    float _1951 = _1939;
    if (_1741)
    {
        _1945 = 1.0;
    }
    float _1953 = _1945;
    float _1955 = _1953;
    if (!_1741)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1961 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1959);
        float _1963 = _1957 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = cos(_1965);
        float _1969 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1967;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1961;
        float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1987;
        float _1991 = _1981 * _1983;
        float _1993 = _1971 * 6.283185482025146484375;
        float _1995 = sin(_1993);
        float _1997 = 1.0 / _1991;
        float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2001 = _1985 * _1999;
        float _2003 = 1.0 / _1989;
        float _2005 = _1995 * _1997;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = fma(_2005, _2001, _2007);
        float _2011 = _2009 * _2003;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        _1947 = _2005;
        _1955 = _2013;
        _1751 = as_type<int>(_1971);
    }
    float _2015 = _1947;
    float _2017 = _1955;
    int _2019 = _1751;
    out.gl_Position.x = _1933;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _1941;
    out.gl_Position.w = _1943;
    float _2021 = abs(_1357);
    bool _2023 = _2021 != 0.0;
    bool _2025 = isnan(_2021);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan(0.0);
    bool _2031 = _2027 || _2029;
    float _2033 = _2015;
    int _2035 = _2019;
    if (_1741)
    {
        _1763 = 1.0;
    }
    float _2037 = _1763;
    float _2039 = _2037;
    if (_2031)
    {
        _2033 = _1943;
    }
    float _2041 = _2033;
    float _2043 = _2041;
    if (!_2031)
    {
        _2043 = 0.0;
    }
    float _2045 = _2043;
    float _2047 = _2045;
    if (!_1741)
    {
        float _2049 = as_type<float>(in.m_83.w);
        int _2051 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _2053 = _2051 == 4;
        bool _2055 = _2051 == 8;
        bool _2057 = _2051 == 12;
        int _2059 = as_type<int>(_2049) << 16;
        int _2061 = as_type<int>(_2049) << 8;
        int _2063 = as_type<int>(_2049) << 24;
        int _2065 = _2059 >> 24;
        int _2067 = _2061 >> 24;
        int _2069 = as_type<int>(_2049) >> 24;
        int _2071 = _2063 >> 24;
        float _2073 = float(_2065);
        float _2075 = float(_2067);
        float _2077 = float(_2069);
        float _2079 = _2073 * 0.0078740157186985015869140625;
        float _2081 = float(_2071);
        float _2083 = _2075 * 0.0078740157186985015869140625;
        float _2085 = _2077 * 0.0078740157186985015869140625;
        float _2087 = precise::min(_2079, 1.0);
        float _2089 = _2081 * 0.0078740157186985015869140625;
        float _2091 = precise::min(_2083, 1.0);
        float _2093 = precise::min(_2085, 1.0);
        float _2095 = precise::min(_2089, 1.0);
        float _2097 = precise::max(_2087, -1.0);
        float _2099 = precise::max(_2091, -1.0);
        float _2101 = precise::max(_2093, -1.0);
        float _2103 = precise::max(_2095, -1.0);
        float _2105 = _2103;
        if (_2053)
        {
            _2105 = _2097;
        }
        float _2107 = _2105;
        float _2109 = _2107;
        if (_2055)
        {
            _2109 = _2099;
        }
        float _2111 = _2109;
        float _2113 = _2111;
        if (_2057)
        {
            _2113 = _2101;
        }
        float _2115 = _2113;
        float _2117 = abs(_2115);
        float _2119 = (-0.0) + _2117;
        _2039 = _2119;
    }
    float _2121 = _2039;
    if (!_2031)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1291)
    {
        int _2123 = _1301 << 4;
        int _2125 = _2123 + 2048;
        uint _2127 = uint(int(uint(_2125) >> uint(2)));
        uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
        int _2131 = int(_2127) & 3;
        float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
        int _2135 = int(_2127) + 1;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        int _2139 = _2135 & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        int _2143 = _2125 + 8;
        uint _2145 = uint(int(uint(_2143) >> uint(2)));
        uint _2147 = uint(int(uint(int(_2145)) >> uint(2)));
        int _2149 = int(_2145) & 3;
        float _2151 = (*spvDescriptorSet0.vp_c15)._m0[int(_2147)][_2149];
        int _2153 = int(_2145) + 1;
        uint _2155 = uint(int(uint(_2153) >> uint(2)));
        int _2157 = _2153 & 3;
        float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
        float _2161 = _1239 * _2141;
        float _2163 = fma(_1095, _2133, _2161);
        float _2165 = fma(_1099, _2151, _2163);
        float _2167 = _2165 + _2159;
        float _2169 = precise::clamp(_2167, 0.0, 1.0);
        float _2171 = -_2169;
        float _2173 = _2171 + _1381;
        float _2175 = fma(_2173, 500.0, 1.5);
        float _2177 = exp2(_2175);
        float _2179 = 0.0 + _2177;
        float _2181 = precise::clamp(_2179, 0.0, 1.0);
        bool _2183 = _2181 >= 1.0;
        bool _2185 = isnan(_2181);
        bool _2187 = _2183 || _2185;
        bool _2189 = isnan(1.0);
        bool _2191 = _2187 || _2189;
        if (!_2191)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2191)
        {
            _2047 = 0.0;
        }
    }
    float _2193 = _2047;
    float _2195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2197 = _1867 + _2195;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2201 = _1869 + _2199;
    float _2203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2205 = _1871 + _2203;
    float _2207 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2209 = _2197 * _2197;
    float _2211 = 1.0 / _2193;
    float _2213 = fma(_2201, _2201, _2209);
    float _2215 = fma(_2205, _2205, _2213);
    float _2217 = rsqrt(_2215);
    float _2219 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2221 = _2201 * _2219;
    float _2223 = _2205 * _2219;
    float _2225 = _2221 * _2221;
    float _2227 = _2223 * _2223;
    float _2229 = _2225 + _2227;
    float _2231 = sqrt(_2229);
    bool _2233 = _2231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2237 = _2231 + _2235;
    float _2239 = _2209;
    float _2241 = _2229;
    float _2243 = _2237;
    float _2245 = _2201;
    float _2247 = _2205;
    float _2249 = _2197;
    float _2251 = _2221;
    if (_2233)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    if (_2233)
    {
        float _2257 = rsqrt(_2229);
        _2241 = _2257;
    }
    float _2259 = _2241;
    float _2261 = _2259;
    if (_2233)
    {
        float _2263 = _2237 * _2255;
        _2243 = _2263;
    }
    float _2265 = _2243;
    if (_2233)
    {
        float _2267 = _2265 * 0.15915493667125701904296875;
        _2245 = _2267;
    }
    float _2269 = _2245;
    float _2271 = _2255;
    if (_2233)
    {
        float _2273 = _2269 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        _2271 = _2275;
    }
    float _2277 = _2271;
    float _2279 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2281 = precise::max(0.0, _2279);
    float _2283 = _1099;
    float _2285 = _2281;
    if (_2233)
    {
        float _2287 = _2269 * 6.283185482025146484375;
        float _2289 = cos(_2287);
        _2283 = _2289;
    }
    float _2291 = _2283;
    float _2293 = -_2219;
    float _2295 = -_2281;
    float _2297 = fma(_2197, _2293, _2295);
    if (_2233)
    {
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2299;
    }
    float _2301 = _2285;
    float _2303 = _2277;
    float _2305 = _2301;
    if (_2233)
    {
        float _2307 = fma(_2277, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2247 = _2307;
    }
    float _2309 = _2247;
    float _2311 = _2309;
    if (!_2233)
    {
        _2303 = _2297;
    }
    float _2313 = _2303;
    float _2315 = _2313;
    if (_2233)
    {
        float _2317 = _2291 + (-1.0);
        _2249 = _2317;
    }
    float _2319 = _2249;
    float _2321 = _2319;
    if (_2233)
    {
        float _2323 = _2259 * _2309;
        _2311 = _2323;
    }
    float _2325 = _2311;
    if (!_2233)
    {
        _2261 = _2225;
    }
    float _2327 = _2261;
    float _2329 = _2327;
    if (_2233)
    {
        float _2331 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2305 = _2331;
    }
    float _2333 = _2305;
    float _2335 = _2333;
    if (_2233)
    {
        float _2337 = _2221 * _2325;
        _2251 = _2337;
    }
    float _2339 = _2251;
    if (!_2233)
    {
        _2321 = _2227;
    }
    float _2341 = _2321;
    float _2343 = _2341;
    if (_2233)
    {
        float _2345 = fma(_2297, _2291, _2333);
        _2315 = _2345;
    }
    float _2347 = _2315;
    if (!_2233)
    {
        _2335 = _2223;
    }
    float _2349 = _2335;
    float _2351 = _2349;
    if (_2233)
    {
        float _2353 = _2223 * _2325;
        _2351 = _2353;
    }
    float _2355 = _2351;
    if (_2233)
    {
        float _2357 = _2339 * _2339;
        _2329 = _2357;
    }
    float _2359 = _2329;
    float _2361 = sqrt(_2215);
    if (_2233)
    {
        float _2363 = _2355 * _2355;
        _2343 = _2363;
    }
    float _2365 = _2343;
    float _2367 = fma(_2347, _2347, _2359);
    bool _2369 = _2121 != 0.0;
    bool _2371 = isnan(_2121);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = _2367 + _2365;
    float _2381 = rsqrt(_2379);
    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2385 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2383);
    float _2387 = precise::clamp(_2385, 0.0, 1.0);
    float _2389 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (!_2377)
    {
        _1949 = 0.0;
        _1951 = 0.0;
    }
    float _2391 = _1949;
    float _2393 = _1951;
    float _2395 = -_2387;
    float _2397 = _2395 + 1.0;
    float _2399 = -_2207;
    float _2401 = fma(_2399, _2389, 1.0);
    float _2403 = _2211 * _2391;
    float _2405 = abs(_2397);
    float _2407 = log2(_2405);
    float _2409 = _2381 * _2339;
    float _2411 = _2381 * _2347;
    float _2413 = _2381 * _2355;
    float _2415 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2417 = log2(_2401);
    float _2419 = -_2415;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2419);
    float _2423 = -_2413;
    float _2425 = fma(_2423, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2421);
    float _2427 = _2411 + 1.0;
    float _2429 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2431 = fma(_2425, -0.5, 0.5);
    float _2433 = fma(_2425, 0.5, 0.5);
    float _2435 = exp2(_2429);
    float _2437 = fma(_2433, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2439 = _2417 * 0.693147182464599609375;
    float _2441 = _2211 * _2393;
    float _2443 = fma(_2433, _2437, -0.212114393711090087890625);
    float _2445 = sqrt(_2431);
    float _2447 = fma(_2433, _2443, 1.570728778839111328125);
    float _2449 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2451 = fma(_2403, 0.5, 0.5);
    float _2453 = -_2411;
    float _2455 = fma(_2435, _2427, _2453);
    float _2457 = fma(_2441, -0.5, 0.5);
    float _2459 = fma(_2455, 0.5, 0.5);
    float _2461 = _2445 * 0.636619746685028076171875;
    float3 _6286 = float3(_2451, _2457, _2449);
    float _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6286, float3(0.0), isnan(_6286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6286, float3(0.0), isnan(_6286)), level(0.0)).x;
    float3 _6295 = float3(_2451, _2457, _2449);
    float4 _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6295, float3(0.0), isnan(_6295)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6295, float3(0.0), isnan(_6295)), level(0.0)).xyzw;
    float _2468 = _2466.x;
    float _2470 = _2466.y;
    float _2472 = _2466.z;
    float _2474 = _2466.w;
    float _2476 = -_2447;
    float _2478 = fma(_2461, _2476, 1.0);
    float2 _6316 = float2(_2478, _2459);
    float3 _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6316, float2(0.0), isnan(_6316)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6316, float2(0.0), isnan(_6316)), level(0.0)).xyz;
    float _2484 = _2482.x;
    float _2486 = _2482.y;
    float _2488 = _2482.z;
    float _2490 = _2407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2492 = _2403;
    if (!_2377)
    {
        _2492 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2494 = _2492;
    float _2496 = _1237 * _2017;
    float _2498 = _1941 + _1943;
    float _2500 = exp2(_2490);
    if (!_2377)
    {
        float _2502 = _2494 * 5.0;
        _2035 = as_type<int>(_2502);
    }
    int _2504 = _2035;
    float _2506 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2508 = _2498 * 0.5;
    float _2510 = _2506 * _2121;
    float _2512 = _2510;
    if (!_2377)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6373 = as_type<float>(_2504);
        out.gl_Position.z = _6373;
    }
    if (!_2377)
    {
        _2512 = 0.0;
    }
    float _2514 = _2512;
    bool _2516 = _2017 > 0.0;
    bool _2518 = isnan(_2017);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(0.0);
    bool _2524 = _2520 || _2522;
    out.m_85.z = _2508;
    out.m_85.w = _1943;
    float _2526 = _2514 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2528 = -_2500;
    float _2530 = _2528 + 1.0;
    out.m_87.w = _2526;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2534 = _2532 * _2463;
    float _2536 = -_2532;
    float _2538 = _2536 + 1.0;
    float _2540 = _2474 * _2534;
    out.m_56.x = 1.0;
    float _2542 = _2488 * _2534;
    float _2544 = fma(_2484, _2540, _2468);
    float _2546 = fma(_2486, _2540, _2470);
    float _2548 = _2474 * _2538;
    float _2550 = fma(_2474, _2542, _2472);
    out.m_89.x = _2544;
    out.m_89.y = _2546;
    out.m_89.z = _2550;
    out.m_89.w = _2548;
    if (_2524)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_56.x = 0.0;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2552;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

