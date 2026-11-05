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
    float4 m_66 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_74 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2132 = as_type<float>(_111);
        out.gl_Position.z = _2132;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2201 = as_type<float>(_149);
        out.gl_Position.z = _2201;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_49.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = _155 * _153;
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_157) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_157) & 2;
    bool _169 = _167 != 0;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = floor(_161);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_169;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _175 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_165;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    bool _205 = !_191;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_203);
    float _211 = -_173;
    float _213 = _161 + _211;
    int _215 = abs(_207);
    float _217 = -_213;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_209);
    float _223 = fma(_195, 0.5, 0.5);
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    float _231 = abs(_219);
    float _233 = _221 * _231;
    bool _235 = _213 < 0.5;
    float _237 = float(_235);
    int _239 = abs(_229);
    float _241 = -_223;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = -_237;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_239);
    float _253 = fma(_245, _243, _233);
    float _255 = abs(_249);
    float _257 = fma(_251, _255, _253);
    bool _259 = !_225;
    float _277;
    float _279;
    if (!_259)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = float(_95);
        float _267 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _269 = _267 * _261;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = _265;
        _281 = true;
    }
    else
    {
        float _283 = float(_95);
        float _285 = 1.0 / _283;
        float _287 = _129 * _285;
        _277 = _287;
        _279 = _283;
    }
    _281 = false;
    float _289 = _277;
    float _291 = _279;
    float _293 = in.m_49.y;
    float _295 = _151 * 2.0;
    float _297 = in.m_49.z;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = floor(_295);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _311 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = _289 + _315;
    float _319 = -_313;
    float _321 = fma(_311, 2.0, _319);
    float _323 = 1.0 / _301;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _289 + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -_129;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _337 = 1.0 / _305;
    float _339 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _289 + _341;
    bool _345 = _307 > 0.0;
    float _347 = fma(_339, -2.0, _309);
    float _349 = _293 * 2.0;
    bool _351 = _307 >= 0.0;
    bool _353 = isnan(_307);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    float _361 = _343 * _323;
    float _363 = _151 + _293;
    float _365 = floor(_349);
    float _367 = _297 * 2.0;
    float _369 = _363 + (-1.0);
    float _371 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _347);
    float _373 = _327 * _337;
    float _375 = _293 + _297;
    float _377 = floor(_367);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = _151 + _297;
    float _383 = _375 + (-1.0);
    float _385 = _381 + (-1.0);
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _389 = _359 ? 0 : 1;
    float _391 = 1.0 / _331;
    bool _393 = _365 > 0.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _395;
    int _399 = ~_389;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _409 = _365 >= 0.0;
    bool _411 = isnan(_365);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    int _423 = _403;
    if (!_345)
    {
        int _425 = ~_389;
        int _427 = _425 + 1;
        _423 = _427;
    }
    int _429 = _423;
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _433 = int(_431);
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _445 = _443 != 0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = fma(_421, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _453 = fma(_397, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _455 = fma(_407, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _457 = !_441;
    int _459 = _457 ? 0 : 1;
    float _461 = fma(_449, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _465 = log2(_463);
    bool _467 = !_437;
    int _469 = _467 ? 0 : 1;
    float _471 = _317 * _391;
    bool _473 = !_445;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    bool _491 = _377 > 0.0;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _495 = int(_493);
    bool _497 = _377 >= 0.0;
    bool _499 = isnan(_377);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    float _511 = float(_433);
    int _513 = abs(_509);
    float _515 = _465 * _129;
    int _517 = _417 ? 0 : 1;
    float _519 = 1.0 / _511;
    int _521 = _505 ? 0 : 1;
    int _523 = ~_517;
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    int _529 = ~_521;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    float _535 = exp2(_515);
    int _537 = _527;
    int _539 = _533;
    if (!_393)
    {
        int _541 = ~_517;
        int _543 = _541 + 1;
        _537 = _543;
    }
    int _545 = _537;
    if (!_491)
    {
        int _547 = ~_521;
        int _549 = _547 + 1;
        _539 = _549;
    }
    int _551 = _539;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _555 = 1.0 + _553;
    float _557 = in.m_54.x;
    float _559 = in.m_54.y;
    float _561 = in.m_54.z;
    float _563 = float(_429);
    float _565 = 1.0 / _555;
    float _567 = float(_513);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _571 = !_489;
    int _573 = _571 ? 0 : 1;
    bool _575 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _577 = isnan(1.0);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _583 = _579 || _581;
    float _585 = _567 * _563;
    float _587 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _569);
    float _589 = _519 * _129;
    bool _591 = !_481;
    int _593 = _591 ? 0 : 1;
    float _595 = -_535;
    float _597 = _595 + 1.0;
    int _599 = abs(_573);
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _603 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _611 = _607 || _609;
    float _613 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _587);
    int _615 = abs(_593);
    float _617 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].w, _601);
    float _619 = _585 * (-2.0);
    float _621 = float(_495);
    float _623 = _611 ? _597 : 0.0;
    float _625 = fma(_619, _559, _559);
    float _627 = float(_599);
    float _629 = _621 * _129;
    float _631 = float(_545);
    float _633 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _617);
    float _635 = float(_615);
    if (_583)
    {
        float _637 = _623 * _565;
        _133 = _637;
    }
    float _639 = _133;
    float _641 = float(_551);
    float _643 = _293 + (-0.5);
    bool _645 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _647 = isnan(_289);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_387, _619, _387);
    bool _659 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _661 = isnan(_289);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = _635 * _641;
    float _673 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[196].y, _625);
    float _675 = -_655;
    float _677 = _675 + 1.0;
    bool _679 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _681 = isnan(_289);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _627 * _631;
    float _693 = fma(_657, _639, _673);
    float _695 = _669 * _677;
    float _697 = -_669;
    float _699 = _697 + 1.0;
    float _701 = _671 * (-2.0);
    bool _703 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _705 = isnan(_289);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -_689;
    float _717 = _715 + 1.0;
    float _719 = _689 * _699;
    float _721 = _151 + (-0.5);
    float _723 = fma(_701, _557, _557);
    float _725 = fma(_379, _701, _379);
    float _727 = _713 * _717;
    float _729 = _297 + (-0.5);
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].x, _723);
    float _733 = _691 * (-2.0);
    float _735 = _451 * _727;
    float _737 = _453 * _727;
    float _739 = fma(_725, _639, _731);
    float _741 = fma(_733, _561, _561);
    float _743 = in.m_56.x;
    float _745 = in.m_56.y;
    float _747 = -_713;
    float _749 = _747 + 1.0;
    float _751 = _739 * 0.15915493667125701904296875;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _753;
    float _757 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _741);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _759;
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[143].y, _737);
    float _765 = fma(_477, _733, _477);
    float _767 = fma(_755, _471, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _769 = in.m_42.x;
    float _771 = in.m_42.y;
    float _773 = in.m_42.z;
    float _775 = fma(_761, _471, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _777 = fma(_455, _719, _763);
    float _779 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[143].x, _735);
    float _781 = in.m_58.x;
    float _783 = in.m_58.y;
    float _785 = in.m_58.z;
    float _787 = in.m_58.w;
    float _789 = fma(_765, _639, _757);
    float _791 = fma(_775, _695, _777);
    float _793 = fma(_461, _719, _779);
    float _795 = _693 * 0.15915493667125701904296875;
    float _797 = _789 * 0.15915493667125701904296875;
    float _799 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[146].y, _791);
    float _801 = fma(_767, _695, _793);
    float _803 = _795 * 6.283185482025146484375;
    float _805 = sin(_803);
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _809 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _811 = _799 * _745;
    float _813 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    bool _815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _823 = _819 || _821;
    float _825 = _257 * _811;
    float _827 = _795 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _813 * _743;
    float _833 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _835 = _257 * _831;
    float _837 = _833 * _807;
    float _839 = _751 * 6.283185482025146484375;
    float _841 = sin(_839);
    float _843 = _771 * _783;
    float _845 = in.m_60.x;
    float _847 = in.m_60.y;
    float _849 = in.m_60.z;
    float _851 = in.m_60.w;
    float _853 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _855 = fma(_769, _781, _843);
    float _857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _859 = _751 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_773, _785, _855);
    float _865 = _853 * _857;
    float _867 = _797 * 6.283185482025146484375;
    float _869 = cos(_867);
    float _871 = _841 * _805;
    float _873 = _797 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _861 * _829;
    float _879 = _861 * _805;
    float _881 = _771 * _847;
    float _883 = fma(_769, _845, _881);
    float _885 = _869 * _837;
    float _887 = _805 * _869;
    float _889 = _829 * _869;
    float _891 = _841 * _829;
    float _893 = _861 * _885;
    float _895 = _841 * _885;
    float _897 = fma(_773, _849, _883);
    float _899 = _863 + _787;
    float _901 = fma(_875, _877, _871);
    float _903 = -_837;
    float _905 = _875 * _903;
    float _907 = fma(_875, _871, _877);
    float _909 = _897 + _851;
    float _911 = fma(_901, _865, _893);
    float _913 = -_891;
    float _915 = fma(_875, _879, _913);
    float _917 = -_879;
    float _919 = fma(_875, _891, _917);
    float _921 = fma(_889, _865, _905);
    float _923 = fma(_915, _809, _911);
    float _925 = fma(_919, _865, _895);
    float _927 = fma(_887, _809, _921);
    float _929 = _923 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _931 = fma(_907, _809, _925);
    float _933 = _923 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = _923 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _937 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _929);
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _935);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[26].z, _937);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[24].z, _939);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _949 = _943 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _951 = _945 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _953 = _899 + _949;
    float _955 = in.m_62.x;
    float _957 = in.m_62.y;
    float _959 = in.m_62.z;
    float _961 = in.m_62.w;
    float _963 = _909 + _951;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _953 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _971 = _963 + _969;
    float _973 = _967 * _967;
    float _975 = fma(_971, _971, _973);
    float _977 = sqrt(_975);
    float _979 = _771 * _957;
    float _981 = _947 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _983 = fma(_769, _955, _979);
    bool _985 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _987 = fma(_773, _959, _983);
    float _989 = _987 + _961;
    float _991 = _989 + _981;
    float _993 = _773;
    float _995 = _981;
    float _997 = _935;
    float _999 = _977;
    float _1001 = _899;
    float _1003 = _975;
    if (!_985)
    {
        _993 = _963;
    }
    float _1005 = _993;
    float _1007 = _1005;
    if (!_985)
    {
        _995 = _953;
    }
    float _1009 = _995;
    float _1011 = _1009;
    if (!_985)
    {
        _997 = _991;
    }
    float _1013 = _997;
    bool _1015 = !_985;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _977 + _1021;
        float _1025 = _991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1027 = rsqrt(_975);
        float _1029 = _1023 * _1019;
        float _1031 = _1029 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = cos(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = _1035 + (-1.0);
        float _1043 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = fma(_1039, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = fma(_991, _1035, _1043);
        float _1049 = _1027 * _1045;
        float _1051 = fma(_971, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1053 = fma(_967, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1007 = _1051;
        _1017 = _1047;
        _1011 = _1053;
        _999 = _1023;
    }
    float _1055 = _1007;
    float _1057 = _1017;
    float _1059 = _1011;
    float _1061 = _999;
    float _1063 = _1057;
    float _1065 = _1055;
    float _1067 = _1059;
    float _1069 = _1061;
    if (!_823)
    {
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1073 = _989 + _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1077 = _909 + _1075;
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1081 = -_909;
        float _1083 = _1081 + _1055;
        float _1085 = _1073 * _1073;
        float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1089 = _899 + _1087;
        float _1091 = -_989;
        float _1093 = _1091 + _1057;
        float _1095 = -_899;
        float _1097 = _1095 + _1059;
        float _1099 = fma(_1077, _1077, _1085);
        float _1101 = fma(_1089, _1089, _1099);
        float _1103 = sqrt(_1101);
        float _1105 = precise::min(_1103, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1107 = _1105 * _1079;
        float _1109 = fma(_1083, _1107, _909);
        float _1111 = fma(_1093, _1107, _989);
        float _1113 = fma(_1097, _1107, _899);
        _1063 = _1111;
        _1065 = _1109;
        _1067 = _1113;
    }
    float _1115 = _1063;
    float _1117 = _1065;
    float _1119 = _1067;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1123 = _1115 + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1127 = _1117 + _1125;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1131 = _1119 + _1129;
    float _1133 = _1123 * _1123;
    float _1135 = fma(_1127, _1127, _1133);
    float _1137 = fma(_1131, _1131, _1135);
    float _1139 = rsqrt(_1137);
    float _1141 = sqrt(_1137);
    float _1143 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1145 = _1127 * _1143;
    float _1147 = _1131 * _1143;
    float _1149 = _1145 * _1145;
    float _1151 = _1147 * _1147;
    float _1153 = _1149 + _1151;
    float _1155 = sqrt(_1153);
    bool _1157 = _1155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1161 = _1155 + _1159;
    float _1163 = _1131;
    float _1165 = _1161;
    float _1167 = _1123;
    if (_1157)
    {
        float _1169 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1163 = _1169;
    }
    float _1171 = _1163;
    if (_1157)
    {
        float _1173 = rsqrt(_1153);
        _1001 = _1173;
    }
    float _1175 = _1001;
    float _1177 = _1175;
    if (_1157)
    {
        float _1179 = _1161 * _1171;
        _1165 = _1179;
    }
    float _1181 = _1165;
    if (_1157)
    {
        float _1183 = _1181 * 0.15915493667125701904296875;
        _1069 = _1183;
    }
    float _1185 = _1069;
    float _1187 = _1139;
    if (_1157)
    {
        float _1189 = _1185 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1197 = precise::max(0.0, _1195);
    float _1199 = _1133;
    float _1201 = _1197;
    float _1203 = _1195;
    if (_1157)
    {
        float _1205 = _1185 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        _1199 = _1207;
    }
    float _1209 = _1199;
    float _1211 = -_1143;
    float _1213 = -_1197;
    float _1215 = fma(_1123, _1211, _1213);
    if (!_1157)
    {
        _1167 = _1147;
    }
    float _1217 = _1167;
    float _1219 = _1217;
    if (_1157)
    {
        float _1221 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1201 = _1221;
    }
    float _1223 = _1201;
    float _1225 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1227 = _1223;
    float _1229 = _1193;
    if (_1157)
    {
        float _1231 = fma(_1193, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1227 = _1231;
    }
    float _1233 = _1227;
    float _1235 = _1233;
    if (!_1157)
    {
        _1229 = _1145;
    }
    float _1237 = _1229;
    float _1239 = _1237;
    float _1241 = _1209;
    if (_1157)
    {
        float _1243 = _1209 + (-1.0);
        _1203 = _1243;
    }
    float _1245 = _1203;
    float _1247 = _1245;
    if (_1157)
    {
        float _1249 = _1175 * _1233;
        _1003 = _1249;
    }
    float _1251 = _1003;
    if (!_1157)
    {
        _1235 = _1215;
    }
    float _1253 = _1235;
    float _1255 = _1253;
    if (_1157)
    {
        float _1257 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1257;
    }
    float _1259 = _1177;
    if (_1157)
    {
        float _1261 = _1145 * _1251;
        _1239 = _1261;
    }
    float _1263 = _1239;
    if (!_1157)
    {
        _1247 = _1149;
    }
    float _1265 = _1247;
    float _1267 = _1265;
    if (_1157)
    {
        float _1269 = _1147 * _1251;
        _1219 = _1269;
    }
    float _1271 = _1219;
    if (_1157)
    {
        float _1273 = fma(_1215, _1209, _1259);
        _1255 = _1273;
    }
    float _1275 = _1255;
    if (_1157)
    {
        float _1277 = _1263 * _1263;
        _1267 = _1277;
    }
    float _1279 = _1267;
    if (!_1157)
    {
        _1241 = _1151;
    }
    float _1281 = _1241;
    float _1283 = _1281;
    if (_1157)
    {
        float _1285 = _1271 * _1271;
        _1283 = _1285;
    }
    float _1287 = _1283;
    float _1289 = fma(_1275, _1275, _1279);
    float _1291 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1293 = _1289 + _1287;
    float _1295 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1225);
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1299 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1297);
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1305 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1295);
    float _1309 = rsqrt(_1293);
    float _1311 = -_1301;
    float _1313 = _1311 + 1.0;
    float _1315 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1303);
    float _1317 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1319 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1321 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1323 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1315);
    float _1325 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1317);
    float _1327 = abs(_1313);
    float _1329 = log2(_1327);
    float _1331 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1321);
    float _1333 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1335 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1337 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1339 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1331);
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1343 = _1309 * _1263;
    float _1345 = _1309 * _1271;
    float _1347 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1341);
    float _1349 = _1309 * _1275;
    float _1351 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1353 = -_1337;
    float _1355 = fma(_1353, _1291, 1.0);
    float _1357 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1359 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1347);
    float _1361 = -_1351;
    float _1363 = fma(_1349, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1361);
    float _1365 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1367 = log2(_1355);
    float _1369 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1359);
    float _1371 = -_1345;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1363);
    float _1375 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1377 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1379 = fma(_1373, -0.5, 0.5);
    float _1381 = fma(_1373, 0.5, 0.5);
    float _1383 = exp2(_1365);
    float _1385 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1375);
    float _1387 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1377);
    float _1389 = _1349 + 1.0;
    float _1391 = fma(_1381, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1393 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1385);
    float _1395 = 1.0 / _1369;
    float _1397 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1387);
    float _1399 = _1367 * 0.693147182464599609375;
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1403 = sqrt(_1379);
    float _1405 = -_1349;
    float _1407 = fma(_1383, _1389, _1405);
    float _1409 = fma(_1381, _1391, -0.212114393711090087890625);
    float _1411 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1393);
    float _1413 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1397);
    float _1415 = fma(_1407, 0.5, 0.5);
    float _1417 = fma(_1381, _1409, 1.570728778839111328125);
    float _1419 = _1411 * _1395;
    float _1421 = _1413 * _1395;
    float _1423 = fma(_1419, 0.5, 0.5);
    float _1425 = fma(_1421, -0.5, 0.5);
    float _1427 = _1403 * 0.636619746685028076171875;
    float _1429 = -_1417;
    float _1431 = fma(_1427, _1429, 1.0);
    float3 _4156 = float3(_1423, _1425, _1401);
    float _1433 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4156, float3(0.0), isnan(_4156)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4156, float3(0.0), isnan(_4156)), level(0.0)).x;
    float3 _4167 = float3(_1423, _1425, _1401);
    float4 _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4167, float3(0.0), isnan(_4167)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4167, float3(0.0), isnan(_4167)), level(0.0)).xyzw;
    float _1438 = _1436.x;
    float _1440 = _1436.y;
    float _1442 = _1436.z;
    float _1444 = _1436.w;
    float2 _4184 = float2(_1431, _1415);
    float3 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4184, float2(0.0), isnan(_4184)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4184, float2(0.0), isnan(_4184)), level(0.0)).xyz;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = float(uint(_495));
    float _1458 = trunc(_589);
    int _1460 = int(_1458);
    int _1462 = ~_495;
    int _1464 = _1462 + 1;
    out.m_45.x = 1.0;
    int _1466 = abs(_469);
    float _1468 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1470 = _151 > 0.5;
    int _1472 = ~_495;
    int _1474 = _1472 + 1;
    float _1476 = 1.0 / _1456;
    float _1478 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1468);
    float _1480 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1478);
    float _1482 = float(uint(_1460));
    float _1484 = 1.0 / _291;
    float _1486 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1480);
    int _1488 = as_type<int>(_1476) + (-2);
    float _1490 = as_type<float>(_1488) * _1482;
    float _1492 = _629 * _1484;
    float _1494 = trunc(_1490);
    float _1496 = precise::max(_1494, 0.0);
    uint _1499 = uint(_1496);
    float _1501 = trunc(_1492);
    int _1503 = int(_1501);
    int _1505 = _1464 * int(_1499);
    int _1507 = _1505 + _1460;
    float _1509 = float(uint(_1507));
    float _1511 = as_type<float>(_1488) * _1509;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1515 = _1513 != 0;
    float _1517 = trunc(_1511);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    bool _1523 = !_1515;
    float _1525 = _1523 ? 7.345489978790283203125 : 1.0;
    float _1527 = _1525 * _151;
    float _1529 = floor(_1527);
    int _1531 = int(_1499) + int(_1521);
    float _1533 = float(_1460);
    int _1535 = _1464 * _1531;
    int _1537 = _1535 + _1460;
    bool _1539 = _1533 >= _621;
    bool _1541 = isnan(_1533);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan(_621);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    bool _1551 = uint(_1537) >= uint(_495);
    float _1553 = trunc(_1549);
    int _1555 = int(_1553);
    float _1557 = -_1529;
    float _1559 = _1527 + _1557;
    bool _1561 = !_1551;
    int _1563 = _1561 ? 0 : (-1);
    bool _1565 = _495 == 0;
    int _1567 = ~_1531;
    int _1569 = _1567 + _1563;
    int _1571 = _1569 + 1;
    float _1573 = _1559 * _621;
    int _1575 = _495 + (-1);
    int _1577 = _495 * _1571;
    int _1579 = _1577 + _1460;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1583 = _1581 != 0;
    float _1585 = trunc(_1573);
    int _1587 = int(_1585);
    int _1589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1591 = _1589 != 0;
    int _1593 = ~_1555;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    bool _1599 = !_1565;
    int _1601 = _1599 ? _1579 : (-1);
    bool _1603 = !_1583;
    int _1605 = _1603 ? 0 : 1;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1609 = _1607 != 0;
    int _1611 = _1601 * _1597;
    int _1613 = abs(_459);
    int _1615 = abs(_1605);
    int _1617 = _1555 * _1575;
    int _1619 = _1617 + _1611;
    bool _1621 = !_1609;
    int _1623 = _1621 ? 0 : 1;
    int _1625 = abs(_475);
    int _1627 = _1619 * _1613;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1631 = _1629 != 0;
    int _1633 = _1587 * _1615;
    int _1635 = _1633 + _1460;
    int _1637 = abs(_1623);
    int _1639 = _1503 * _1466;
    int _1641 = _1639 + _1627;
    int _1643 = ~_495;
    int _1645 = _1643 + 1;
    int _1647 = ~_495;
    int _1649 = _1647 + 1;
    int _1651 = _1635 * _1625;
    int _1653 = _1651 + _1641;
    float _1655 = float(uint(_1635));
    float _1657 = -_199;
    int _1659 = _1470 ? as_type<int>(_1657) : as_type<int>(_199);
    int _1661 = _1587 * _1637;
    int _1663 = _1661 + _1653;
    bool _1665 = _293 > 0.5;
    bool _1667 = !_1591;
    float _1669 = _1667 ? _199 : as_type<float>(_1659);
    float _1671 = float(uint(_1663));
    float _1673 = as_type<float>(_1488) * _1671;
    float _1675 = trunc(_1673);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    int _1681 = _1645 * int(_1679);
    int _1683 = _1681 + _1663;
    float _1685 = float(uint(_1683));
    float _1687 = as_type<float>(_1488) * _1685;
    float _1689 = trunc(_1687);
    float _1691 = precise::max(_1689, 0.0);
    uint _1693 = uint(_1691);
    int _1695 = ~_495;
    int _1697 = _1695 + 1;
    int _1699 = int(_1679) + int(_1693);
    float _1701 = as_type<float>(_1488) * _1655;
    int _1703 = _1649 * _1699;
    int _1705 = _1703 + _1663;
    float _1707 = trunc(_1701);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    bool _1713 = uint(_1705) >= uint(_495);
    bool _1715 = !_1713;
    int _1717 = _1715 ? 0 : (-1);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1721 = _1719 != 0;
    int _1723 = ~_1699;
    int _1725 = _1723 + _1717;
    int _1727 = _1725 + 1;
    int _1729 = _1697 * int(_1711);
    int _1731 = _1729 + _1635;
    int _1733 = _495 * _1727;
    int _1735 = _1733 + _1663;
    float _1737 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1739 = float(uint(_1731));
    bool _1741 = !_1565;
    int _1743 = _1741 ? _1735 : (-1);
    float _1745 = _1737 * _151;
    float _1747 = as_type<float>(_1488) * _1739;
    int _1749 = _1743 >> 31;
    float _1751 = trunc(_1745);
    int _1753 = int(_1751);
    int _1755 = _1749 & 3;
    int _1757 = _1743 & 3;
    bool _1759 = _1757 != 0;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1763 = _1743 + _1755;
    float _1765 = trunc(_1747);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1773 = _1763 >> 2;
    float _1775 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1777 = uint(_1757) > 1u;
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1781 = _1773 << 4;
    int _1783 = _1781 + 368;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1787 = _1743 & 3;
    bool _1789 = _1787 != 0;
    uint _1791 = uint(int(uint(_1783) >> uint(2)));
    uint _1793 = uint(int(uint(int(_1791)) >> uint(2)));
    int _1795 = int(_1791) & 3;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[int(_1793)][_1795];
    int _1799 = int(_1791) + 1;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    int _1803 = _1799 & 3;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[int(_1801)][_1803];
    float _1807 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1809 = _1753 << 4;
    int _1811 = _1809 + 1712;
    int _1813 = _1789 ? 0 : 1;
    int _1815 = int(_1711) + int(_1769);
    out.m_64.x = _1807;
    out.m_64.y = _1775;
    out.m_64.z = _1779;
    int _1817 = _1783 + 8;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[int(_1829)][_1831];
    float _1835 = -_179;
    int _1837 = _1665 ? as_type<int>(_1835) : as_type<int>(_179);
    float _1839 = _1669 + 0.5;
    bool _1841 = _1757 != 3;
    int _1843 = _1474 * _1815;
    int _1845 = _1843 + _1635;
    bool _1847 = uint(_1757) >= 2u;
    uint _1849 = uint(int(uint(_1811) >> uint(2)));
    uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
    int _1853 = int(_1849) & 3;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[int(_1851)][_1853];
    int _1857 = int(_1849) + 1;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    int _1861 = _1857 & 3;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[int(_1859)][_1861];
    int _1865 = _1847 ? 0 : 1;
    bool _1867 = !_1631;
    float _1869 = _1867 ? _179 : as_type<float>(_1837);
    float _1871 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[80].x, _335);
    int _1873 = ~_1813;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1877;
    if (!_1777)
    {
        int _1881 = ~_1813;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    int _1887 = _1811 + 8;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    uint _1891 = uint(int(uint(int(_1889)) >> uint(2)));
    int _1893 = int(_1889) & 3;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[int(_1891)][_1893];
    bool _1897 = !_1759;
    int _1899 = _1897 ? 0 : 1;
    int _1901 = abs(_1885);
    bool _1903 = _1757 != 3;
    int _1905 = abs(_1899);
    int _1907 = ~_1865;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    int _1913 = _1911;
    if (_1841)
    {
        int _1915 = ~_1865;
        int _1917 = _1915 + 1;
        _1913 = _1917;
    }
    int _1919 = _1913;
    bool _1921 = !_1903;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = ~_1901;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = abs(_1919);
    int _1933 = abs(_1923);
    int _1935 = ~_1905;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    int _1941 = _1929 * as_type<int>(_1805);
    int _1943 = _1939 * as_type<int>(_1797);
    int _1945 = _1943 + _1941;
    bool _1947 = uint(_1845) >= uint(_495);
    float _1949 = _1869 + (-0.5);
    int _1951 = ~_1933;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    float _1957 = -_613;
    float _1959 = _1957 + 1.0;
    float _1961 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1963 = !_1947;
    int _1965 = _1963 ? 0 : (-1);
    float _1967 = -_1949;
    float _1969 = -_371;
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1969);
    int _1973 = ~_1931;
    int _1975 = _1973 + 1;
    int _1977 = _1975 + 1;
    float _1979 = -_1959;
    float _1981 = fma(_1669, _1979, _1871);
    int _1983 = ~_1815;
    int _1985 = _1983 + _1965;
    int _1987 = _1985 + 1;
    float _1989 = exp2(_1961);
    bool _1991 = !_1721;
    int _1993 = _1991 ? 0 : 1;
    int _1995 = _1977 * as_type<int>(_1825);
    int _1997 = _1995 + _1945;
    float _1999 = _1863 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2001 = _495 * _1987;
    int _2003 = _2001 + _1635;
    int _2005 = _1955 * as_type<int>(_1833);
    int _2007 = _2005 + _1997;
    int _2009 = abs(_1993);
    float _2011 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2013 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2017 = ~_2009;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _1999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2029 = !_1565;
    int _2031 = _2029 ? _2003 : (-1);
    float _2033 = -_1989;
    float _2035 = _2033 + 1.0;
    int _2037 = _2007 * _2021;
    float _2039 = -_633;
    float _2041 = _2039 + 1.0;
    out.m_66.x = _2023;
    out.m_66.y = _2025;
    out.m_66.z = _2027;
    out.m_66.w = _2015;
    float _2043 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2045 = _2031 * _2009;
    int _2047 = _2045 + _2037;
    float _2049 = fma(_1869, _2041, _1971);
    float _2051 = _1486 + _1369;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _1486;
    out.gl_Position.w = _1369;
    float _2053 = float(_2047);
    float _2055 = _2051 * 0.5;
    float _2057 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _1981;
    out.m_68.y = _2049;
    float _2059 = _2043 * _1433;
    float _2061 = -_2043;
    float _2063 = _2061 + 1.0;
    out.m_70.z = _2055;
    out.m_70.w = _1369;
    float _2065 = _1444 * _2059;
    float _2067 = _1454 * _2059;
    out.m_72.x = _2053;
    float _2069 = fma(_1450, _2065, _1438);
    float _2071 = fma(_1452, _2065, _1440);
    float _2073 = _1444 * _2063;
    float _2075 = fma(_1444, _2067, _1442);
    out.m_74.w = _2057;
    out.m_76.x = _2069;
    out.m_76.y = _2071;
    out.m_76.z = _2075;
    out.m_76.w = _2073;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2132 = as_type<float>(_111);
        out.gl_Position.z = _2132;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2201 = as_type<float>(_149);
        out.gl_Position.z = _2201;
    }
    if (_143)
    {
        return out;
    }
    float _151 = in.m_49.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = _155 * _153;
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_157) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_157) & 2;
    bool _169 = _167 != 0;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = floor(_161);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_169;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _175 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_165;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    bool _205 = !_191;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_203);
    float _211 = -_173;
    float _213 = _161 + _211;
    int _215 = abs(_207);
    float _217 = -_213;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_209);
    float _223 = fma(_195, 0.5, 0.5);
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    float _231 = abs(_219);
    float _233 = _221 * _231;
    bool _235 = _213 < 0.5;
    float _237 = float(_235);
    int _239 = abs(_229);
    float _241 = -_223;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = -_237;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_239);
    float _253 = fma(_245, _243, _233);
    float _255 = abs(_249);
    float _257 = fma(_251, _255, _253);
    bool _259 = !_225;
    float _277;
    float _279;
    if (!_259)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = float(_95);
        float _267 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _269 = _267 * _261;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = _265;
        _281 = true;
    }
    else
    {
        float _283 = float(_95);
        float _285 = 1.0 / _283;
        float _287 = _129 * _285;
        _277 = _287;
        _279 = _283;
    }
    _281 = false;
    float _289 = _277;
    float _291 = _279;
    float _293 = in.m_49.y;
    float _295 = _151 * 2.0;
    float _297 = in.m_49.z;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = floor(_295);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _311 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = _289 + _315;
    float _319 = -_313;
    float _321 = fma(_311, 2.0, _319);
    float _323 = 1.0 / _301;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _289 + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -_129;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _337 = 1.0 / _305;
    float _339 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _289 + _341;
    bool _345 = _307 > 0.0;
    float _347 = fma(_339, -2.0, _309);
    float _349 = _293 * 2.0;
    bool _351 = _307 >= 0.0;
    bool _353 = isnan(_307);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    float _361 = _343 * _323;
    float _363 = _151 + _293;
    float _365 = floor(_349);
    float _367 = _297 * 2.0;
    float _369 = _363 + (-1.0);
    float _371 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _347);
    float _373 = _327 * _337;
    float _375 = _293 + _297;
    float _377 = floor(_367);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = _151 + _297;
    float _383 = _375 + (-1.0);
    float _385 = _381 + (-1.0);
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _389 = _359 ? 0 : 1;
    float _391 = 1.0 / _331;
    bool _393 = _365 > 0.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _395;
    int _399 = ~_389;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _409 = _365 >= 0.0;
    bool _411 = isnan(_365);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    int _423 = _403;
    if (!_345)
    {
        int _425 = ~_389;
        int _427 = _425 + 1;
        _423 = _427;
    }
    int _429 = _423;
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _433 = int(_431);
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _445 = _443 != 0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = fma(_421, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _453 = fma(_397, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _455 = fma(_407, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _457 = !_441;
    int _459 = _457 ? 0 : 1;
    float _461 = fma(_449, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _465 = log2(_463);
    bool _467 = !_437;
    int _469 = _467 ? 0 : 1;
    float _471 = _317 * _391;
    bool _473 = !_445;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    bool _491 = _377 > 0.0;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _495 = int(_493);
    bool _497 = _377 >= 0.0;
    bool _499 = isnan(_377);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    float _511 = float(_433);
    int _513 = abs(_509);
    float _515 = _465 * _129;
    int _517 = _417 ? 0 : 1;
    float _519 = 1.0 / _511;
    int _521 = _505 ? 0 : 1;
    int _523 = ~_517;
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    int _529 = ~_521;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    float _535 = exp2(_515);
    int _537 = _527;
    int _539 = _533;
    if (!_393)
    {
        int _541 = ~_517;
        int _543 = _541 + 1;
        _537 = _543;
    }
    int _545 = _537;
    if (!_491)
    {
        int _547 = ~_521;
        int _549 = _547 + 1;
        _539 = _549;
    }
    int _551 = _539;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _555 = 1.0 + _553;
    float _557 = in.m_54.x;
    float _559 = in.m_54.y;
    float _561 = in.m_54.z;
    float _563 = float(_429);
    float _565 = 1.0 / _555;
    float _567 = float(_513);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _571 = !_489;
    int _573 = _571 ? 0 : 1;
    bool _575 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _577 = isnan(1.0);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _583 = _579 || _581;
    float _585 = _567 * _563;
    float _587 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _569);
    float _589 = _519 * _129;
    bool _591 = !_481;
    int _593 = _591 ? 0 : 1;
    float _595 = -_535;
    float _597 = _595 + 1.0;
    int _599 = abs(_573);
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _603 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _611 = _607 || _609;
    float _613 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _587);
    int _615 = abs(_593);
    float _617 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].w, _601);
    float _619 = _585 * (-2.0);
    float _621 = float(_495);
    float _623 = _611 ? _597 : 0.0;
    float _625 = fma(_619, _559, _559);
    float _627 = float(_599);
    float _629 = _621 * _129;
    float _631 = float(_545);
    float _633 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _617);
    float _635 = float(_615);
    if (_583)
    {
        float _637 = _623 * _565;
        _133 = _637;
    }
    float _639 = _133;
    float _641 = float(_551);
    float _643 = _293 + (-0.5);
    bool _645 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _647 = isnan(_289);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_387, _619, _387);
    bool _659 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _661 = isnan(_289);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = _635 * _641;
    float _673 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[196].y, _625);
    float _675 = -_655;
    float _677 = _675 + 1.0;
    bool _679 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _681 = isnan(_289);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _627 * _631;
    float _693 = fma(_657, _639, _673);
    float _695 = _669 * _677;
    float _697 = -_669;
    float _699 = _697 + 1.0;
    float _701 = _671 * (-2.0);
    bool _703 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _705 = isnan(_289);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -_689;
    float _717 = _715 + 1.0;
    float _719 = _689 * _699;
    float _721 = _151 + (-0.5);
    float _723 = fma(_701, _557, _557);
    float _725 = fma(_379, _701, _379);
    float _727 = _713 * _717;
    float _729 = _297 + (-0.5);
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].x, _723);
    float _733 = _691 * (-2.0);
    float _735 = _451 * _727;
    float _737 = _453 * _727;
    float _739 = fma(_725, _639, _731);
    float _741 = fma(_733, _561, _561);
    float _743 = in.m_56.x;
    float _745 = in.m_56.y;
    float _747 = -_713;
    float _749 = _747 + 1.0;
    float _751 = _739 * 0.15915493667125701904296875;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _753;
    float _757 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _741);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _759;
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[143].y, _737);
    float _765 = fma(_477, _733, _477);
    float _767 = fma(_755, _471, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _769 = in.m_42.x;
    float _771 = in.m_42.y;
    float _773 = in.m_42.z;
    float _775 = fma(_761, _471, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _777 = fma(_455, _719, _763);
    float _779 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[143].x, _735);
    float _781 = in.m_58.x;
    float _783 = in.m_58.y;
    float _785 = in.m_58.z;
    float _787 = in.m_58.w;
    float _789 = fma(_765, _639, _757);
    float _791 = fma(_775, _695, _777);
    float _793 = fma(_461, _719, _779);
    float _795 = _693 * 0.15915493667125701904296875;
    float _797 = _789 * 0.15915493667125701904296875;
    float _799 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[146].y, _791);
    float _801 = fma(_767, _695, _793);
    float _803 = _795 * 6.283185482025146484375;
    float _805 = sin(_803);
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _809 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _811 = _799 * _745;
    float _813 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    bool _815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _823 = _819 || _821;
    float _825 = _257 * _811;
    float _827 = _795 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _813 * _743;
    float _833 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _835 = _257 * _831;
    float _837 = _833 * _807;
    float _839 = _751 * 6.283185482025146484375;
    float _841 = sin(_839);
    float _843 = _771 * _783;
    float _845 = in.m_60.x;
    float _847 = in.m_60.y;
    float _849 = in.m_60.z;
    float _851 = in.m_60.w;
    float _853 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _855 = fma(_769, _781, _843);
    float _857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _859 = _751 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_773, _785, _855);
    float _865 = _853 * _857;
    float _867 = _797 * 6.283185482025146484375;
    float _869 = cos(_867);
    float _871 = _841 * _805;
    float _873 = _797 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _861 * _829;
    float _879 = _861 * _805;
    float _881 = _771 * _847;
    float _883 = fma(_769, _845, _881);
    float _885 = _869 * _837;
    float _887 = _805 * _869;
    float _889 = _829 * _869;
    float _891 = _841 * _829;
    float _893 = _861 * _885;
    float _895 = _841 * _885;
    float _897 = fma(_773, _849, _883);
    float _899 = _863 + _787;
    float _901 = fma(_875, _877, _871);
    float _903 = -_837;
    float _905 = _875 * _903;
    float _907 = fma(_875, _871, _877);
    float _909 = _897 + _851;
    float _911 = fma(_901, _865, _893);
    float _913 = -_891;
    float _915 = fma(_875, _879, _913);
    float _917 = -_879;
    float _919 = fma(_875, _891, _917);
    float _921 = fma(_889, _865, _905);
    float _923 = fma(_915, _809, _911);
    float _925 = fma(_919, _865, _895);
    float _927 = fma(_887, _809, _921);
    float _929 = _923 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _931 = fma(_907, _809, _925);
    float _933 = _923 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = _923 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _937 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _929);
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _935);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[26].z, _937);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[24].z, _939);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _949 = _943 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _951 = _945 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _953 = _899 + _949;
    float _955 = in.m_62.x;
    float _957 = in.m_62.y;
    float _959 = in.m_62.z;
    float _961 = in.m_62.w;
    float _963 = _909 + _951;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _953 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _971 = _963 + _969;
    float _973 = _967 * _967;
    float _975 = fma(_971, _971, _973);
    float _977 = sqrt(_975);
    float _979 = _771 * _957;
    float _981 = _947 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _983 = fma(_769, _955, _979);
    bool _985 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _987 = fma(_773, _959, _983);
    float _989 = _987 + _961;
    float _991 = _989 + _981;
    float _993 = _773;
    float _995 = _981;
    float _997 = _935;
    float _999 = _977;
    float _1001 = _899;
    float _1003 = _975;
    if (!_985)
    {
        _993 = _963;
    }
    float _1005 = _993;
    float _1007 = _1005;
    if (!_985)
    {
        _995 = _953;
    }
    float _1009 = _995;
    float _1011 = _1009;
    if (!_985)
    {
        _997 = _991;
    }
    float _1013 = _997;
    bool _1015 = !_985;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _977 + _1021;
        float _1025 = _991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1027 = rsqrt(_975);
        float _1029 = _1023 * _1019;
        float _1031 = _1029 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = cos(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = _1035 + (-1.0);
        float _1043 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = fma(_1039, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = fma(_991, _1035, _1043);
        float _1049 = _1027 * _1045;
        float _1051 = fma(_971, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1053 = fma(_967, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1007 = _1051;
        _1017 = _1047;
        _1011 = _1053;
        _999 = _1023;
    }
    float _1055 = _1007;
    float _1057 = _1017;
    float _1059 = _1011;
    float _1061 = _999;
    float _1063 = _1057;
    float _1065 = _1055;
    float _1067 = _1059;
    float _1069 = _1061;
    if (!_823)
    {
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1073 = _989 + _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1077 = _909 + _1075;
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1081 = -_909;
        float _1083 = _1081 + _1055;
        float _1085 = _1073 * _1073;
        float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1089 = _899 + _1087;
        float _1091 = -_989;
        float _1093 = _1091 + _1057;
        float _1095 = -_899;
        float _1097 = _1095 + _1059;
        float _1099 = fma(_1077, _1077, _1085);
        float _1101 = fma(_1089, _1089, _1099);
        float _1103 = sqrt(_1101);
        float _1105 = precise::min(_1103, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1107 = _1105 * _1079;
        float _1109 = fma(_1083, _1107, _909);
        float _1111 = fma(_1093, _1107, _989);
        float _1113 = fma(_1097, _1107, _899);
        _1063 = _1111;
        _1065 = _1109;
        _1067 = _1113;
    }
    float _1115 = _1063;
    float _1117 = _1065;
    float _1119 = _1067;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1123 = _1115 + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1127 = _1117 + _1125;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1131 = _1119 + _1129;
    float _1133 = _1123 * _1123;
    float _1135 = fma(_1127, _1127, _1133);
    float _1137 = fma(_1131, _1131, _1135);
    float _1139 = rsqrt(_1137);
    float _1141 = sqrt(_1137);
    float _1143 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1145 = _1127 * _1143;
    float _1147 = _1131 * _1143;
    float _1149 = _1145 * _1145;
    float _1151 = _1147 * _1147;
    float _1153 = _1149 + _1151;
    float _1155 = sqrt(_1153);
    bool _1157 = _1155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1161 = _1155 + _1159;
    float _1163 = _1131;
    float _1165 = _1161;
    float _1167 = _1123;
    if (_1157)
    {
        float _1169 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1163 = _1169;
    }
    float _1171 = _1163;
    if (_1157)
    {
        float _1173 = rsqrt(_1153);
        _1001 = _1173;
    }
    float _1175 = _1001;
    float _1177 = _1175;
    if (_1157)
    {
        float _1179 = _1161 * _1171;
        _1165 = _1179;
    }
    float _1181 = _1165;
    if (_1157)
    {
        float _1183 = _1181 * 0.15915493667125701904296875;
        _1069 = _1183;
    }
    float _1185 = _1069;
    float _1187 = _1139;
    if (_1157)
    {
        float _1189 = _1185 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1197 = precise::max(0.0, _1195);
    float _1199 = _1133;
    float _1201 = _1197;
    float _1203 = _1195;
    if (_1157)
    {
        float _1205 = _1185 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        _1199 = _1207;
    }
    float _1209 = _1199;
    float _1211 = -_1143;
    float _1213 = -_1197;
    float _1215 = fma(_1123, _1211, _1213);
    if (!_1157)
    {
        _1167 = _1147;
    }
    float _1217 = _1167;
    float _1219 = _1217;
    if (_1157)
    {
        float _1221 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1201 = _1221;
    }
    float _1223 = _1201;
    float _1225 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1227 = _1223;
    float _1229 = _1193;
    if (_1157)
    {
        float _1231 = fma(_1193, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1227 = _1231;
    }
    float _1233 = _1227;
    float _1235 = _1233;
    if (!_1157)
    {
        _1229 = _1145;
    }
    float _1237 = _1229;
    float _1239 = _1237;
    float _1241 = _1209;
    if (_1157)
    {
        float _1243 = _1209 + (-1.0);
        _1203 = _1243;
    }
    float _1245 = _1203;
    float _1247 = _1245;
    if (_1157)
    {
        float _1249 = _1175 * _1233;
        _1003 = _1249;
    }
    float _1251 = _1003;
    if (!_1157)
    {
        _1235 = _1215;
    }
    float _1253 = _1235;
    float _1255 = _1253;
    if (_1157)
    {
        float _1257 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1257;
    }
    float _1259 = _1177;
    if (_1157)
    {
        float _1261 = _1145 * _1251;
        _1239 = _1261;
    }
    float _1263 = _1239;
    if (!_1157)
    {
        _1247 = _1149;
    }
    float _1265 = _1247;
    float _1267 = _1265;
    if (_1157)
    {
        float _1269 = _1147 * _1251;
        _1219 = _1269;
    }
    float _1271 = _1219;
    if (_1157)
    {
        float _1273 = fma(_1215, _1209, _1259);
        _1255 = _1273;
    }
    float _1275 = _1255;
    if (_1157)
    {
        float _1277 = _1263 * _1263;
        _1267 = _1277;
    }
    float _1279 = _1267;
    if (!_1157)
    {
        _1241 = _1151;
    }
    float _1281 = _1241;
    float _1283 = _1281;
    if (_1157)
    {
        float _1285 = _1271 * _1271;
        _1283 = _1285;
    }
    float _1287 = _1283;
    float _1289 = fma(_1275, _1275, _1279);
    float _1291 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1293 = _1289 + _1287;
    float _1295 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1225);
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1299 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1297);
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1305 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1295);
    float _1309 = rsqrt(_1293);
    float _1311 = -_1301;
    float _1313 = _1311 + 1.0;
    float _1315 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1303);
    float _1317 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1319 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1321 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1323 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1315);
    float _1325 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1317);
    float _1327 = abs(_1313);
    float _1329 = log2(_1327);
    float _1331 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1321);
    float _1333 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1335 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1337 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1339 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1331);
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1343 = _1309 * _1263;
    float _1345 = _1309 * _1271;
    float _1347 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1341);
    float _1349 = _1309 * _1275;
    float _1351 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1353 = -_1337;
    float _1355 = fma(_1353, _1291, 1.0);
    float _1357 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1359 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1347);
    float _1361 = -_1351;
    float _1363 = fma(_1349, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1361);
    float _1365 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1367 = log2(_1355);
    float _1369 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1359);
    float _1371 = -_1345;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1363);
    float _1375 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1377 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1379 = fma(_1373, -0.5, 0.5);
    float _1381 = fma(_1373, 0.5, 0.5);
    float _1383 = exp2(_1365);
    float _1385 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1375);
    float _1387 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1377);
    float _1389 = _1349 + 1.0;
    float _1391 = fma(_1381, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1393 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1385);
    float _1395 = 1.0 / _1369;
    float _1397 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1387);
    float _1399 = _1367 * 0.693147182464599609375;
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1403 = sqrt(_1379);
    float _1405 = -_1349;
    float _1407 = fma(_1383, _1389, _1405);
    float _1409 = fma(_1381, _1391, -0.212114393711090087890625);
    float _1411 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1393);
    float _1413 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1397);
    float _1415 = fma(_1407, 0.5, 0.5);
    float _1417 = fma(_1381, _1409, 1.570728778839111328125);
    float _1419 = _1411 * _1395;
    float _1421 = _1413 * _1395;
    float _1423 = fma(_1419, 0.5, 0.5);
    float _1425 = fma(_1421, -0.5, 0.5);
    float _1427 = _1403 * 0.636619746685028076171875;
    float _1429 = -_1417;
    float _1431 = fma(_1427, _1429, 1.0);
    float3 _4156 = float3(_1423, _1425, _1401);
    float _1433 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4156, float3(0.0), isnan(_4156)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4156, float3(0.0), isnan(_4156)), level(0.0)).x;
    float3 _4167 = float3(_1423, _1425, _1401);
    float4 _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4167, float3(0.0), isnan(_4167)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4167, float3(0.0), isnan(_4167)), level(0.0)).xyzw;
    float _1438 = _1436.x;
    float _1440 = _1436.y;
    float _1442 = _1436.z;
    float _1444 = _1436.w;
    float2 _4184 = float2(_1431, _1415);
    float3 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4184, float2(0.0), isnan(_4184)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4184, float2(0.0), isnan(_4184)), level(0.0)).xyz;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = float(uint(_495));
    float _1458 = trunc(_589);
    int _1460 = int(_1458);
    int _1462 = ~_495;
    int _1464 = _1462 + 1;
    out.m_45.x = 1.0;
    int _1466 = abs(_469);
    float _1468 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1470 = _151 > 0.5;
    int _1472 = ~_495;
    int _1474 = _1472 + 1;
    float _1476 = 1.0 / _1456;
    float _1478 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1468);
    float _1480 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1478);
    float _1482 = float(uint(_1460));
    float _1484 = 1.0 / _291;
    float _1486 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1480);
    int _1488 = as_type<int>(_1476) + (-2);
    float _1490 = as_type<float>(_1488) * _1482;
    float _1492 = _629 * _1484;
    float _1494 = trunc(_1490);
    float _1496 = precise::max(_1494, 0.0);
    uint _1499 = uint(_1496);
    float _1501 = trunc(_1492);
    int _1503 = int(_1501);
    int _1505 = _1464 * int(_1499);
    int _1507 = _1505 + _1460;
    float _1509 = float(uint(_1507));
    float _1511 = as_type<float>(_1488) * _1509;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1515 = _1513 != 0;
    float _1517 = trunc(_1511);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    bool _1523 = !_1515;
    float _1525 = _1523 ? 7.345489978790283203125 : 1.0;
    float _1527 = _1525 * _151;
    float _1529 = floor(_1527);
    int _1531 = int(_1499) + int(_1521);
    float _1533 = float(_1460);
    int _1535 = _1464 * _1531;
    int _1537 = _1535 + _1460;
    bool _1539 = _1533 >= _621;
    bool _1541 = isnan(_1533);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan(_621);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    bool _1551 = uint(_1537) >= uint(_495);
    float _1553 = trunc(_1549);
    int _1555 = int(_1553);
    float _1557 = -_1529;
    float _1559 = _1527 + _1557;
    bool _1561 = !_1551;
    int _1563 = _1561 ? 0 : (-1);
    bool _1565 = _495 == 0;
    int _1567 = ~_1531;
    int _1569 = _1567 + _1563;
    int _1571 = _1569 + 1;
    float _1573 = _1559 * _621;
    int _1575 = _495 + (-1);
    int _1577 = _495 * _1571;
    int _1579 = _1577 + _1460;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1583 = _1581 != 0;
    float _1585 = trunc(_1573);
    int _1587 = int(_1585);
    int _1589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1591 = _1589 != 0;
    int _1593 = ~_1555;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    bool _1599 = !_1565;
    int _1601 = _1599 ? _1579 : (-1);
    bool _1603 = !_1583;
    int _1605 = _1603 ? 0 : 1;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1609 = _1607 != 0;
    int _1611 = _1601 * _1597;
    int _1613 = abs(_459);
    int _1615 = abs(_1605);
    int _1617 = _1555 * _1575;
    int _1619 = _1617 + _1611;
    bool _1621 = !_1609;
    int _1623 = _1621 ? 0 : 1;
    int _1625 = abs(_475);
    int _1627 = _1619 * _1613;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1631 = _1629 != 0;
    int _1633 = _1587 * _1615;
    int _1635 = _1633 + _1460;
    int _1637 = abs(_1623);
    int _1639 = _1503 * _1466;
    int _1641 = _1639 + _1627;
    int _1643 = ~_495;
    int _1645 = _1643 + 1;
    int _1647 = ~_495;
    int _1649 = _1647 + 1;
    int _1651 = _1635 * _1625;
    int _1653 = _1651 + _1641;
    float _1655 = float(uint(_1635));
    float _1657 = -_199;
    int _1659 = _1470 ? as_type<int>(_1657) : as_type<int>(_199);
    int _1661 = _1587 * _1637;
    int _1663 = _1661 + _1653;
    bool _1665 = _293 > 0.5;
    bool _1667 = !_1591;
    float _1669 = _1667 ? _199 : as_type<float>(_1659);
    float _1671 = float(uint(_1663));
    float _1673 = as_type<float>(_1488) * _1671;
    float _1675 = trunc(_1673);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    int _1681 = _1645 * int(_1679);
    int _1683 = _1681 + _1663;
    float _1685 = float(uint(_1683));
    float _1687 = as_type<float>(_1488) * _1685;
    float _1689 = trunc(_1687);
    float _1691 = precise::max(_1689, 0.0);
    uint _1693 = uint(_1691);
    int _1695 = ~_495;
    int _1697 = _1695 + 1;
    int _1699 = int(_1679) + int(_1693);
    float _1701 = as_type<float>(_1488) * _1655;
    int _1703 = _1649 * _1699;
    int _1705 = _1703 + _1663;
    float _1707 = trunc(_1701);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    bool _1713 = uint(_1705) >= uint(_495);
    bool _1715 = !_1713;
    int _1717 = _1715 ? 0 : (-1);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1721 = _1719 != 0;
    int _1723 = ~_1699;
    int _1725 = _1723 + _1717;
    int _1727 = _1725 + 1;
    int _1729 = _1697 * int(_1711);
    int _1731 = _1729 + _1635;
    int _1733 = _495 * _1727;
    int _1735 = _1733 + _1663;
    float _1737 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1739 = float(uint(_1731));
    bool _1741 = !_1565;
    int _1743 = _1741 ? _1735 : (-1);
    float _1745 = _1737 * _151;
    float _1747 = as_type<float>(_1488) * _1739;
    int _1749 = _1743 >> 31;
    float _1751 = trunc(_1745);
    int _1753 = int(_1751);
    int _1755 = _1749 & 3;
    int _1757 = _1743 & 3;
    bool _1759 = _1757 != 0;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1763 = _1743 + _1755;
    float _1765 = trunc(_1747);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1773 = _1763 >> 2;
    float _1775 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1777 = uint(_1757) > 1u;
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1781 = _1773 << 4;
    int _1783 = _1781 + 368;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1787 = _1743 & 3;
    bool _1789 = _1787 != 0;
    uint _1791 = uint(int(uint(_1783) >> uint(2)));
    uint _1793 = uint(int(uint(int(_1791)) >> uint(2)));
    int _1795 = int(_1791) & 3;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[int(_1793)][_1795];
    int _1799 = int(_1791) + 1;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    int _1803 = _1799 & 3;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[int(_1801)][_1803];
    float _1807 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1809 = _1753 << 4;
    int _1811 = _1809 + 1712;
    int _1813 = _1789 ? 0 : 1;
    int _1815 = int(_1711) + int(_1769);
    out.m_64.x = _1807;
    out.m_64.y = _1775;
    out.m_64.z = _1779;
    int _1817 = _1783 + 8;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[int(_1829)][_1831];
    float _1835 = -_179;
    int _1837 = _1665 ? as_type<int>(_1835) : as_type<int>(_179);
    float _1839 = _1669 + 0.5;
    bool _1841 = _1757 != 3;
    int _1843 = _1474 * _1815;
    int _1845 = _1843 + _1635;
    bool _1847 = uint(_1757) >= 2u;
    uint _1849 = uint(int(uint(_1811) >> uint(2)));
    uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
    int _1853 = int(_1849) & 3;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[int(_1851)][_1853];
    int _1857 = int(_1849) + 1;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    int _1861 = _1857 & 3;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[int(_1859)][_1861];
    int _1865 = _1847 ? 0 : 1;
    bool _1867 = !_1631;
    float _1869 = _1867 ? _179 : as_type<float>(_1837);
    float _1871 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[80].x, _335);
    int _1873 = ~_1813;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1877;
    if (!_1777)
    {
        int _1881 = ~_1813;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    int _1887 = _1811 + 8;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    uint _1891 = uint(int(uint(int(_1889)) >> uint(2)));
    int _1893 = int(_1889) & 3;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[int(_1891)][_1893];
    bool _1897 = !_1759;
    int _1899 = _1897 ? 0 : 1;
    int _1901 = abs(_1885);
    bool _1903 = _1757 != 3;
    int _1905 = abs(_1899);
    int _1907 = ~_1865;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    int _1913 = _1911;
    if (_1841)
    {
        int _1915 = ~_1865;
        int _1917 = _1915 + 1;
        _1913 = _1917;
    }
    int _1919 = _1913;
    bool _1921 = !_1903;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = ~_1901;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = abs(_1919);
    int _1933 = abs(_1923);
    int _1935 = ~_1905;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    int _1941 = _1929 * as_type<int>(_1805);
    int _1943 = _1939 * as_type<int>(_1797);
    int _1945 = _1943 + _1941;
    bool _1947 = uint(_1845) >= uint(_495);
    float _1949 = _1869 + (-0.5);
    int _1951 = ~_1933;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    float _1957 = -_613;
    float _1959 = _1957 + 1.0;
    float _1961 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1963 = !_1947;
    int _1965 = _1963 ? 0 : (-1);
    float _1967 = -_1949;
    float _1969 = -_371;
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1969);
    int _1973 = ~_1931;
    int _1975 = _1973 + 1;
    int _1977 = _1975 + 1;
    float _1979 = -_1959;
    float _1981 = fma(_1669, _1979, _1871);
    int _1983 = ~_1815;
    int _1985 = _1983 + _1965;
    int _1987 = _1985 + 1;
    float _1989 = exp2(_1961);
    bool _1991 = !_1721;
    int _1993 = _1991 ? 0 : 1;
    int _1995 = _1977 * as_type<int>(_1825);
    int _1997 = _1995 + _1945;
    float _1999 = _1863 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2001 = _495 * _1987;
    int _2003 = _2001 + _1635;
    int _2005 = _1955 * as_type<int>(_1833);
    int _2007 = _2005 + _1997;
    int _2009 = abs(_1993);
    float _2011 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2013 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2017 = ~_2009;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _1999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2029 = !_1565;
    int _2031 = _2029 ? _2003 : (-1);
    float _2033 = -_1989;
    float _2035 = _2033 + 1.0;
    int _2037 = _2007 * _2021;
    float _2039 = -_633;
    float _2041 = _2039 + 1.0;
    out.m_66.x = _2023;
    out.m_66.y = _2025;
    out.m_66.z = _2027;
    out.m_66.w = _2015;
    float _2043 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2045 = _2031 * _2009;
    int _2047 = _2045 + _2037;
    float _2049 = fma(_1869, _2041, _1971);
    float _2051 = _1486 + _1369;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _1486;
    out.gl_Position.w = _1369;
    float _2053 = float(_2047);
    float _2055 = _2051 * 0.5;
    float _2057 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _1981;
    out.m_68.y = _2049;
    float _2059 = _2043 * _1433;
    float _2061 = -_2043;
    float _2063 = _2061 + 1.0;
    out.m_70.z = _2055;
    out.m_70.w = _1369;
    float _2065 = _1444 * _2059;
    float _2067 = _1454 * _2059;
    out.m_72.x = _2053;
    float _2069 = fma(_1450, _2065, _1438);
    float _2071 = fma(_1452, _2065, _1440);
    float _2073 = _1444 * _2063;
    float _2075 = fma(_1444, _2067, _1442);
    out.m_74.w = _2057;
    out.m_76.x = _2069;
    out.m_76.y = _2071;
    out.m_76.z = _2075;
    out.m_76.w = _2073;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2132 = as_type<float>(_111);
        out.gl_Position.z = _2132;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2201 = as_type<float>(_149);
        out.gl_Position.z = _2201;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_49.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = _155 * _153;
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    int _163 = as_type<int>(_157) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_157) & 2;
    bool _169 = _167 != 0;
    float _171 = _161 * 6.283185482025146484375;
    float _173 = floor(_161);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_169;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _175 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_165;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    bool _205 = !_191;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_203);
    float _211 = -_173;
    float _213 = _161 + _211;
    int _215 = abs(_207);
    float _217 = -_213;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_209);
    float _223 = fma(_195, 0.5, 0.5);
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    float _231 = abs(_219);
    float _233 = _221 * _231;
    bool _235 = _213 < 0.5;
    float _237 = float(_235);
    int _239 = abs(_229);
    float _241 = -_223;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = -_237;
    float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _251 = float(_239);
    float _253 = fma(_245, _243, _233);
    float _255 = abs(_249);
    float _257 = fma(_251, _255, _253);
    bool _259 = !_225;
    float _277;
    float _279;
    if (!_259)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = float(_95);
        float _267 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _269 = _267 * _261;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = _265;
        _281 = true;
    }
    else
    {
        float _283 = float(_95);
        float _285 = 1.0 / _283;
        float _287 = _129 * _285;
        _277 = _287;
        _279 = _283;
    }
    _281 = false;
    float _289 = _277;
    float _291 = _279;
    float _293 = in.m_49.y;
    float _295 = _151 * 2.0;
    float _297 = in.m_49.z;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = floor(_295);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _311 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = _289 + _315;
    float _319 = -_313;
    float _321 = fma(_311, 2.0, _319);
    float _323 = 1.0 / _301;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _289 + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    float _333 = -_129;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[76].x, _321);
    float _337 = 1.0 / _305;
    float _339 = _293 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _289 + _341;
    bool _345 = _307 > 0.0;
    float _347 = fma(_339, -2.0, _309);
    float _349 = _293 * 2.0;
    bool _351 = _307 >= 0.0;
    bool _353 = isnan(_307);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    float _361 = _343 * _323;
    float _363 = _151 + _293;
    float _365 = floor(_349);
    float _367 = _297 * 2.0;
    float _369 = _363 + (-1.0);
    float _371 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _347);
    float _373 = _327 * _337;
    float _375 = _293 + _297;
    float _377 = floor(_367);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = _151 + _297;
    float _383 = _375 + (-1.0);
    float _385 = _381 + (-1.0);
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _389 = _359 ? 0 : 1;
    float _391 = 1.0 / _331;
    bool _393 = _365 > 0.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _395;
    int _399 = ~_389;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _409 = _365 >= 0.0;
    bool _411 = isnan(_365);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    int _423 = _403;
    if (!_345)
    {
        int _425 = ~_389;
        int _427 = _425 + 1;
        _423 = _427;
    }
    int _429 = _423;
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _433 = int(_431);
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _445 = _443 != 0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = fma(_421, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _453 = fma(_397, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _455 = fma(_407, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _457 = !_441;
    int _459 = _457 ? 0 : 1;
    float _461 = fma(_449, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _465 = log2(_463);
    bool _467 = !_437;
    int _469 = _467 ? 0 : 1;
    float _471 = _317 * _391;
    bool _473 = !_445;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    bool _491 = _377 > 0.0;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _495 = int(_493);
    bool _497 = _377 >= 0.0;
    bool _499 = isnan(_377);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_485;
    int _509 = _507 ? 0 : 1;
    float _511 = float(_433);
    int _513 = abs(_509);
    float _515 = _465 * _129;
    int _517 = _417 ? 0 : 1;
    float _519 = 1.0 / _511;
    int _521 = _505 ? 0 : 1;
    int _523 = ~_517;
    int _525 = _523 + 1;
    int _527 = _525 + 1;
    int _529 = ~_521;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    float _535 = exp2(_515);
    int _537 = _527;
    int _539 = _533;
    if (!_393)
    {
        int _541 = ~_517;
        int _543 = _541 + 1;
        _537 = _543;
    }
    int _545 = _537;
    if (!_491)
    {
        int _547 = ~_521;
        int _549 = _547 + 1;
        _539 = _549;
    }
    int _551 = _539;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _555 = 1.0 + _553;
    float _557 = in.m_54.x;
    float _559 = in.m_54.y;
    float _561 = in.m_54.z;
    float _563 = float(_429);
    float _565 = 1.0 / _555;
    float _567 = float(_513);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _571 = !_489;
    int _573 = _571 ? 0 : 1;
    bool _575 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _577 = isnan(1.0);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _583 = _579 || _581;
    float _585 = _567 * _563;
    float _587 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _569);
    float _589 = _519 * _129;
    bool _591 = !_481;
    int _593 = _591 ? 0 : 1;
    float _595 = -_535;
    float _597 = _595 + 1.0;
    int _599 = abs(_573);
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _603 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _611 = _607 || _609;
    float _613 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _587);
    int _615 = abs(_593);
    float _617 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[78].w, _601);
    float _619 = _585 * (-2.0);
    float _621 = float(_495);
    float _623 = _611 ? _597 : 0.0;
    float _625 = fma(_619, _559, _559);
    float _627 = float(_599);
    float _629 = _621 * _129;
    float _631 = float(_545);
    float _633 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _617);
    float _635 = float(_615);
    if (_583)
    {
        float _637 = _623 * _565;
        _133 = _637;
    }
    float _639 = _133;
    float _641 = float(_551);
    float _643 = _293 + (-0.5);
    bool _645 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _647 = isnan(_289);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_387, _619, _387);
    bool _659 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _661 = isnan(_289);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = _635 * _641;
    float _673 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[196].y, _625);
    float _675 = -_655;
    float _677 = _675 + 1.0;
    bool _679 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _681 = isnan(_289);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _627 * _631;
    float _693 = fma(_657, _639, _673);
    float _695 = _669 * _677;
    float _697 = -_669;
    float _699 = _697 + 1.0;
    float _701 = _671 * (-2.0);
    bool _703 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _705 = isnan(_289);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -_689;
    float _717 = _715 + 1.0;
    float _719 = _689 * _699;
    float _721 = _151 + (-0.5);
    float _723 = fma(_701, _557, _557);
    float _725 = fma(_379, _701, _379);
    float _727 = _713 * _717;
    float _729 = _297 + (-0.5);
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].x, _723);
    float _733 = _691 * (-2.0);
    float _735 = _451 * _727;
    float _737 = _453 * _727;
    float _739 = fma(_725, _639, _731);
    float _741 = fma(_733, _561, _561);
    float _743 = in.m_56.x;
    float _745 = in.m_56.y;
    float _747 = -_713;
    float _749 = _747 + 1.0;
    float _751 = _739 * 0.15915493667125701904296875;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _753;
    float _757 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _741);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _759;
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[143].y, _737);
    float _765 = fma(_477, _733, _477);
    float _767 = fma(_755, _471, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _769 = in.m_42.x;
    float _771 = in.m_42.y;
    float _773 = in.m_42.z;
    float _775 = fma(_761, _471, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _777 = fma(_455, _719, _763);
    float _779 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[143].x, _735);
    float _781 = in.m_58.x;
    float _783 = in.m_58.y;
    float _785 = in.m_58.z;
    float _787 = in.m_58.w;
    float _789 = fma(_765, _639, _757);
    float _791 = fma(_775, _695, _777);
    float _793 = fma(_461, _719, _779);
    float _795 = _693 * 0.15915493667125701904296875;
    float _797 = _789 * 0.15915493667125701904296875;
    float _799 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[146].y, _791);
    float _801 = fma(_767, _695, _793);
    float _803 = _795 * 6.283185482025146484375;
    float _805 = sin(_803);
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _809 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _811 = _799 * _745;
    float _813 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    bool _815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _823 = _819 || _821;
    float _825 = _257 * _811;
    float _827 = _795 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _813 * _743;
    float _833 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _835 = _257 * _831;
    float _837 = _833 * _807;
    float _839 = _751 * 6.283185482025146484375;
    float _841 = sin(_839);
    float _843 = _771 * _783;
    float _845 = in.m_60.x;
    float _847 = in.m_60.y;
    float _849 = in.m_60.z;
    float _851 = in.m_60.w;
    float _853 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _855 = fma(_769, _781, _843);
    float _857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _859 = _751 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_773, _785, _855);
    float _865 = _853 * _857;
    float _867 = _797 * 6.283185482025146484375;
    float _869 = cos(_867);
    float _871 = _841 * _805;
    float _873 = _797 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _861 * _829;
    float _879 = _861 * _805;
    float _881 = _771 * _847;
    float _883 = fma(_769, _845, _881);
    float _885 = _869 * _837;
    float _887 = _805 * _869;
    float _889 = _829 * _869;
    float _891 = _841 * _829;
    float _893 = _861 * _885;
    float _895 = _841 * _885;
    float _897 = fma(_773, _849, _883);
    float _899 = _863 + _787;
    float _901 = fma(_875, _877, _871);
    float _903 = -_837;
    float _905 = _875 * _903;
    float _907 = fma(_875, _871, _877);
    float _909 = _897 + _851;
    float _911 = fma(_901, _865, _893);
    float _913 = -_891;
    float _915 = fma(_875, _879, _913);
    float _917 = -_879;
    float _919 = fma(_875, _891, _917);
    float _921 = fma(_889, _865, _905);
    float _923 = fma(_915, _809, _911);
    float _925 = fma(_919, _865, _895);
    float _927 = fma(_887, _809, _921);
    float _929 = _923 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _931 = fma(_907, _809, _925);
    float _933 = _923 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = _923 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _937 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _929);
    float _939 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _935);
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[26].z, _937);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[24].z, _939);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _949 = _943 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _951 = _945 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _953 = _899 + _949;
    float _955 = in.m_62.x;
    float _957 = in.m_62.y;
    float _959 = in.m_62.z;
    float _961 = in.m_62.w;
    float _963 = _909 + _951;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _953 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _971 = _963 + _969;
    float _973 = _967 * _967;
    float _975 = fma(_971, _971, _973);
    float _977 = sqrt(_975);
    float _979 = _771 * _957;
    float _981 = _947 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _983 = fma(_769, _955, _979);
    bool _985 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _987 = fma(_773, _959, _983);
    float _989 = _987 + _961;
    float _991 = _989 + _981;
    float _993 = _773;
    float _995 = _981;
    float _997 = _935;
    float _999 = _977;
    float _1001 = _899;
    float _1003 = _975;
    if (!_985)
    {
        _993 = _963;
    }
    float _1005 = _993;
    float _1007 = _1005;
    if (!_985)
    {
        _995 = _953;
    }
    float _1009 = _995;
    float _1011 = _1009;
    if (!_985)
    {
        _997 = _991;
    }
    float _1013 = _997;
    bool _1015 = !_985;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _977 + _1021;
        float _1025 = _991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1027 = rsqrt(_975);
        float _1029 = _1023 * _1019;
        float _1031 = _1029 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = cos(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = _1035 + (-1.0);
        float _1043 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1045 = fma(_1039, _1025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = fma(_991, _1035, _1043);
        float _1049 = _1027 * _1045;
        float _1051 = fma(_971, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1053 = fma(_967, _1049, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1007 = _1051;
        _1017 = _1047;
        _1011 = _1053;
        _999 = _1023;
    }
    float _1055 = _1007;
    float _1057 = _1017;
    float _1059 = _1011;
    float _1061 = _999;
    float _1063 = _1057;
    float _1065 = _1055;
    float _1067 = _1059;
    float _1069 = _1061;
    if (!_823)
    {
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1073 = _989 + _1071;
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1077 = _909 + _1075;
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1081 = -_909;
        float _1083 = _1081 + _1055;
        float _1085 = _1073 * _1073;
        float _1087 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1089 = _899 + _1087;
        float _1091 = -_989;
        float _1093 = _1091 + _1057;
        float _1095 = -_899;
        float _1097 = _1095 + _1059;
        float _1099 = fma(_1077, _1077, _1085);
        float _1101 = fma(_1089, _1089, _1099);
        float _1103 = sqrt(_1101);
        float _1105 = precise::min(_1103, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1107 = _1105 * _1079;
        float _1109 = fma(_1083, _1107, _909);
        float _1111 = fma(_1093, _1107, _989);
        float _1113 = fma(_1097, _1107, _899);
        _1063 = _1111;
        _1065 = _1109;
        _1067 = _1113;
    }
    float _1115 = _1063;
    float _1117 = _1065;
    float _1119 = _1067;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1123 = _1115 + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1127 = _1117 + _1125;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1131 = _1119 + _1129;
    float _1133 = _1123 * _1123;
    float _1135 = fma(_1127, _1127, _1133);
    float _1137 = fma(_1131, _1131, _1135);
    float _1139 = rsqrt(_1137);
    float _1141 = sqrt(_1137);
    float _1143 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1145 = _1127 * _1143;
    float _1147 = _1131 * _1143;
    float _1149 = _1145 * _1145;
    float _1151 = _1147 * _1147;
    float _1153 = _1149 + _1151;
    float _1155 = sqrt(_1153);
    bool _1157 = _1155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1161 = _1155 + _1159;
    float _1163 = _1131;
    float _1165 = _1161;
    float _1167 = _1123;
    if (_1157)
    {
        float _1169 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1163 = _1169;
    }
    float _1171 = _1163;
    if (_1157)
    {
        float _1173 = rsqrt(_1153);
        _1001 = _1173;
    }
    float _1175 = _1001;
    float _1177 = _1175;
    if (_1157)
    {
        float _1179 = _1161 * _1171;
        _1165 = _1179;
    }
    float _1181 = _1165;
    if (_1157)
    {
        float _1183 = _1181 * 0.15915493667125701904296875;
        _1069 = _1183;
    }
    float _1185 = _1069;
    float _1187 = _1139;
    if (_1157)
    {
        float _1189 = _1185 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1197 = precise::max(0.0, _1195);
    float _1199 = _1133;
    float _1201 = _1197;
    float _1203 = _1195;
    if (_1157)
    {
        float _1205 = _1185 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        _1199 = _1207;
    }
    float _1209 = _1199;
    float _1211 = -_1143;
    float _1213 = -_1197;
    float _1215 = fma(_1123, _1211, _1213);
    if (!_1157)
    {
        _1167 = _1147;
    }
    float _1217 = _1167;
    float _1219 = _1217;
    if (_1157)
    {
        float _1221 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1201 = _1221;
    }
    float _1223 = _1201;
    float _1225 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1227 = _1223;
    float _1229 = _1193;
    if (_1157)
    {
        float _1231 = fma(_1193, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1227 = _1231;
    }
    float _1233 = _1227;
    float _1235 = _1233;
    if (!_1157)
    {
        _1229 = _1145;
    }
    float _1237 = _1229;
    float _1239 = _1237;
    float _1241 = _1209;
    if (_1157)
    {
        float _1243 = _1209 + (-1.0);
        _1203 = _1243;
    }
    float _1245 = _1203;
    float _1247 = _1245;
    if (_1157)
    {
        float _1249 = _1175 * _1233;
        _1003 = _1249;
    }
    float _1251 = _1003;
    if (!_1157)
    {
        _1235 = _1215;
    }
    float _1253 = _1235;
    float _1255 = _1253;
    if (_1157)
    {
        float _1257 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1257;
    }
    float _1259 = _1177;
    if (_1157)
    {
        float _1261 = _1145 * _1251;
        _1239 = _1261;
    }
    float _1263 = _1239;
    if (!_1157)
    {
        _1247 = _1149;
    }
    float _1265 = _1247;
    float _1267 = _1265;
    if (_1157)
    {
        float _1269 = _1147 * _1251;
        _1219 = _1269;
    }
    float _1271 = _1219;
    if (_1157)
    {
        float _1273 = fma(_1215, _1209, _1259);
        _1255 = _1273;
    }
    float _1275 = _1255;
    if (_1157)
    {
        float _1277 = _1263 * _1263;
        _1267 = _1277;
    }
    float _1279 = _1267;
    if (!_1157)
    {
        _1241 = _1151;
    }
    float _1281 = _1241;
    float _1283 = _1281;
    if (_1157)
    {
        float _1285 = _1271 * _1271;
        _1283 = _1285;
    }
    float _1287 = _1283;
    float _1289 = fma(_1275, _1275, _1279);
    float _1291 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1293 = _1289 + _1287;
    float _1295 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1225);
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1299 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1297);
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1305 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1295);
    float _1309 = rsqrt(_1293);
    float _1311 = -_1301;
    float _1313 = _1311 + 1.0;
    float _1315 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1303);
    float _1317 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1319 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1321 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1323 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1315);
    float _1325 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1317);
    float _1327 = abs(_1313);
    float _1329 = log2(_1327);
    float _1331 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1321);
    float _1333 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1335 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1337 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1339 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1331);
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1343 = _1309 * _1263;
    float _1345 = _1309 * _1271;
    float _1347 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1341);
    float _1349 = _1309 * _1275;
    float _1351 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1353 = -_1337;
    float _1355 = fma(_1353, _1291, 1.0);
    float _1357 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1359 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1347);
    float _1361 = -_1351;
    float _1363 = fma(_1349, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1361);
    float _1365 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1367 = log2(_1355);
    float _1369 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1359);
    float _1371 = -_1345;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1363);
    float _1375 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1377 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1379 = fma(_1373, -0.5, 0.5);
    float _1381 = fma(_1373, 0.5, 0.5);
    float _1383 = exp2(_1365);
    float _1385 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1375);
    float _1387 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1377);
    float _1389 = _1349 + 1.0;
    float _1391 = fma(_1381, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1393 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1385);
    float _1395 = 1.0 / _1369;
    float _1397 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1387);
    float _1399 = _1367 * 0.693147182464599609375;
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1403 = sqrt(_1379);
    float _1405 = -_1349;
    float _1407 = fma(_1383, _1389, _1405);
    float _1409 = fma(_1381, _1391, -0.212114393711090087890625);
    float _1411 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1393);
    float _1413 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1397);
    float _1415 = fma(_1407, 0.5, 0.5);
    float _1417 = fma(_1381, _1409, 1.570728778839111328125);
    float _1419 = _1411 * _1395;
    float _1421 = _1413 * _1395;
    float _1423 = fma(_1419, 0.5, 0.5);
    float _1425 = fma(_1421, -0.5, 0.5);
    float _1427 = _1403 * 0.636619746685028076171875;
    float _1429 = -_1417;
    float _1431 = fma(_1427, _1429, 1.0);
    float3 _4156 = float3(_1423, _1425, _1401);
    float _1433 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4156, float3(0.0), isnan(_4156)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4156, float3(0.0), isnan(_4156)), level(0.0)).x;
    float3 _4167 = float3(_1423, _1425, _1401);
    float4 _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4167, float3(0.0), isnan(_4167)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4167, float3(0.0), isnan(_4167)), level(0.0)).xyzw;
    float _1438 = _1436.x;
    float _1440 = _1436.y;
    float _1442 = _1436.z;
    float _1444 = _1436.w;
    float2 _4184 = float2(_1431, _1415);
    float3 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4184, float2(0.0), isnan(_4184)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4184, float2(0.0), isnan(_4184)), level(0.0)).xyz;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = float(uint(_495));
    float _1458 = trunc(_589);
    int _1460 = int(_1458);
    int _1462 = ~_495;
    int _1464 = _1462 + 1;
    out.m_45.x = 1.0;
    int _1466 = abs(_469);
    float _1468 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1470 = _151 > 0.5;
    int _1472 = ~_495;
    int _1474 = _1472 + 1;
    float _1476 = 1.0 / _1456;
    float _1478 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1468);
    float _1480 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1478);
    float _1482 = float(uint(_1460));
    float _1484 = 1.0 / _291;
    float _1486 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1480);
    int _1488 = as_type<int>(_1476) + (-2);
    float _1490 = as_type<float>(_1488) * _1482;
    float _1492 = _629 * _1484;
    float _1494 = trunc(_1490);
    float _1496 = precise::max(_1494, 0.0);
    uint _1499 = uint(_1496);
    float _1501 = trunc(_1492);
    int _1503 = int(_1501);
    int _1505 = _1464 * int(_1499);
    int _1507 = _1505 + _1460;
    float _1509 = float(uint(_1507));
    float _1511 = as_type<float>(_1488) * _1509;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1515 = _1513 != 0;
    float _1517 = trunc(_1511);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    bool _1523 = !_1515;
    float _1525 = _1523 ? 7.345489978790283203125 : 1.0;
    float _1527 = _1525 * _151;
    float _1529 = floor(_1527);
    int _1531 = int(_1499) + int(_1521);
    float _1533 = float(_1460);
    int _1535 = _1464 * _1531;
    int _1537 = _1535 + _1460;
    bool _1539 = _1533 >= _621;
    bool _1541 = isnan(_1533);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan(_621);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    bool _1551 = uint(_1537) >= uint(_495);
    float _1553 = trunc(_1549);
    int _1555 = int(_1553);
    float _1557 = -_1529;
    float _1559 = _1527 + _1557;
    bool _1561 = !_1551;
    int _1563 = _1561 ? 0 : (-1);
    bool _1565 = _495 == 0;
    int _1567 = ~_1531;
    int _1569 = _1567 + _1563;
    int _1571 = _1569 + 1;
    float _1573 = _1559 * _621;
    int _1575 = _495 + (-1);
    int _1577 = _495 * _1571;
    int _1579 = _1577 + _1460;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1583 = _1581 != 0;
    float _1585 = trunc(_1573);
    int _1587 = int(_1585);
    int _1589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1591 = _1589 != 0;
    int _1593 = ~_1555;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    bool _1599 = !_1565;
    int _1601 = _1599 ? _1579 : (-1);
    bool _1603 = !_1583;
    int _1605 = _1603 ? 0 : 1;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1609 = _1607 != 0;
    int _1611 = _1601 * _1597;
    int _1613 = abs(_459);
    int _1615 = abs(_1605);
    int _1617 = _1555 * _1575;
    int _1619 = _1617 + _1611;
    bool _1621 = !_1609;
    int _1623 = _1621 ? 0 : 1;
    int _1625 = abs(_475);
    int _1627 = _1619 * _1613;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1631 = _1629 != 0;
    int _1633 = _1587 * _1615;
    int _1635 = _1633 + _1460;
    int _1637 = abs(_1623);
    int _1639 = _1503 * _1466;
    int _1641 = _1639 + _1627;
    int _1643 = ~_495;
    int _1645 = _1643 + 1;
    int _1647 = ~_495;
    int _1649 = _1647 + 1;
    int _1651 = _1635 * _1625;
    int _1653 = _1651 + _1641;
    float _1655 = float(uint(_1635));
    float _1657 = -_199;
    int _1659 = _1470 ? as_type<int>(_1657) : as_type<int>(_199);
    int _1661 = _1587 * _1637;
    int _1663 = _1661 + _1653;
    bool _1665 = _293 > 0.5;
    bool _1667 = !_1591;
    float _1669 = _1667 ? _199 : as_type<float>(_1659);
    float _1671 = float(uint(_1663));
    float _1673 = as_type<float>(_1488) * _1671;
    float _1675 = trunc(_1673);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    int _1681 = _1645 * int(_1679);
    int _1683 = _1681 + _1663;
    float _1685 = float(uint(_1683));
    float _1687 = as_type<float>(_1488) * _1685;
    float _1689 = trunc(_1687);
    float _1691 = precise::max(_1689, 0.0);
    uint _1693 = uint(_1691);
    int _1695 = ~_495;
    int _1697 = _1695 + 1;
    int _1699 = int(_1679) + int(_1693);
    float _1701 = as_type<float>(_1488) * _1655;
    int _1703 = _1649 * _1699;
    int _1705 = _1703 + _1663;
    float _1707 = trunc(_1701);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    bool _1713 = uint(_1705) >= uint(_495);
    bool _1715 = !_1713;
    int _1717 = _1715 ? 0 : (-1);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1721 = _1719 != 0;
    int _1723 = ~_1699;
    int _1725 = _1723 + _1717;
    int _1727 = _1725 + 1;
    int _1729 = _1697 * int(_1711);
    int _1731 = _1729 + _1635;
    int _1733 = _495 * _1727;
    int _1735 = _1733 + _1663;
    float _1737 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1739 = float(uint(_1731));
    bool _1741 = !_1565;
    int _1743 = _1741 ? _1735 : (-1);
    float _1745 = _1737 * _151;
    float _1747 = as_type<float>(_1488) * _1739;
    int _1749 = _1743 >> 31;
    float _1751 = trunc(_1745);
    int _1753 = int(_1751);
    int _1755 = _1749 & 3;
    int _1757 = _1743 & 3;
    bool _1759 = _1757 != 0;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1763 = _1743 + _1755;
    float _1765 = trunc(_1747);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1773 = _1763 >> 2;
    float _1775 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1777 = uint(_1757) > 1u;
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1781 = _1773 << 4;
    int _1783 = _1781 + 368;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1787 = _1743 & 3;
    bool _1789 = _1787 != 0;
    uint _1791 = uint(int(uint(_1783) >> uint(2)));
    uint _1793 = uint(int(uint(int(_1791)) >> uint(2)));
    int _1795 = int(_1791) & 3;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[int(_1793)][_1795];
    int _1799 = int(_1791) + 1;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    int _1803 = _1799 & 3;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[int(_1801)][_1803];
    float _1807 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1809 = _1753 << 4;
    int _1811 = _1809 + 1712;
    int _1813 = _1789 ? 0 : 1;
    int _1815 = int(_1711) + int(_1769);
    out.m_64.x = _1807;
    out.m_64.y = _1775;
    out.m_64.z = _1779;
    int _1817 = _1783 + 8;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[int(_1829)][_1831];
    float _1835 = -_179;
    int _1837 = _1665 ? as_type<int>(_1835) : as_type<int>(_179);
    float _1839 = _1669 + 0.5;
    bool _1841 = _1757 != 3;
    int _1843 = _1474 * _1815;
    int _1845 = _1843 + _1635;
    bool _1847 = uint(_1757) >= 2u;
    uint _1849 = uint(int(uint(_1811) >> uint(2)));
    uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
    int _1853 = int(_1849) & 3;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[int(_1851)][_1853];
    int _1857 = int(_1849) + 1;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    int _1861 = _1857 & 3;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[int(_1859)][_1861];
    int _1865 = _1847 ? 0 : 1;
    bool _1867 = !_1631;
    float _1869 = _1867 ? _179 : as_type<float>(_1837);
    float _1871 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[80].x, _335);
    int _1873 = ~_1813;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1877;
    if (!_1777)
    {
        int _1881 = ~_1813;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    int _1887 = _1811 + 8;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    uint _1891 = uint(int(uint(int(_1889)) >> uint(2)));
    int _1893 = int(_1889) & 3;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[int(_1891)][_1893];
    bool _1897 = !_1759;
    int _1899 = _1897 ? 0 : 1;
    int _1901 = abs(_1885);
    bool _1903 = _1757 != 3;
    int _1905 = abs(_1899);
    int _1907 = ~_1865;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    int _1913 = _1911;
    if (_1841)
    {
        int _1915 = ~_1865;
        int _1917 = _1915 + 1;
        _1913 = _1917;
    }
    int _1919 = _1913;
    bool _1921 = !_1903;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = ~_1901;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = abs(_1919);
    int _1933 = abs(_1923);
    int _1935 = ~_1905;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    int _1941 = _1929 * as_type<int>(_1805);
    int _1943 = _1939 * as_type<int>(_1797);
    int _1945 = _1943 + _1941;
    bool _1947 = uint(_1845) >= uint(_495);
    float _1949 = _1869 + (-0.5);
    int _1951 = ~_1933;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    float _1957 = -_613;
    float _1959 = _1957 + 1.0;
    float _1961 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1963 = !_1947;
    int _1965 = _1963 ? 0 : (-1);
    float _1967 = -_1949;
    float _1969 = -_371;
    float _1971 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1969);
    int _1973 = ~_1931;
    int _1975 = _1973 + 1;
    int _1977 = _1975 + 1;
    float _1979 = -_1959;
    float _1981 = fma(_1669, _1979, _1871);
    int _1983 = ~_1815;
    int _1985 = _1983 + _1965;
    int _1987 = _1985 + 1;
    float _1989 = exp2(_1961);
    bool _1991 = !_1721;
    int _1993 = _1991 ? 0 : 1;
    int _1995 = _1977 * as_type<int>(_1825);
    int _1997 = _1995 + _1945;
    float _1999 = _1863 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2001 = _495 * _1987;
    int _2003 = _2001 + _1635;
    int _2005 = _1955 * as_type<int>(_1833);
    int _2007 = _2005 + _1997;
    int _2009 = abs(_1993);
    float _2011 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2013 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2017 = ~_2009;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _1999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2029 = !_1565;
    int _2031 = _2029 ? _2003 : (-1);
    float _2033 = -_1989;
    float _2035 = _2033 + 1.0;
    int _2037 = _2007 * _2021;
    float _2039 = -_633;
    float _2041 = _2039 + 1.0;
    out.m_66.x = _2023;
    out.m_66.y = _2025;
    out.m_66.z = _2027;
    out.m_66.w = _2015;
    float _2043 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2045 = _2031 * _2009;
    int _2047 = _2045 + _2037;
    float _2049 = fma(_1869, _2041, _1971);
    float _2051 = _1486 + _1369;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1413;
    out.gl_Position.z = _1486;
    out.gl_Position.w = _1369;
    float _2053 = float(_2047);
    float _2055 = _2051 * 0.5;
    float _2057 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _1981;
    out.m_68.y = _2049;
    float _2059 = _2043 * _1433;
    float _2061 = -_2043;
    float _2063 = _2061 + 1.0;
    out.m_70.z = _2055;
    out.m_70.w = _1369;
    float _2065 = _1444 * _2059;
    float _2067 = _1454 * _2059;
    out.m_72.x = _2053;
    float _2069 = fma(_1450, _2065, _1438);
    float _2071 = fma(_1452, _2065, _1440);
    float _2073 = _1444 * _2063;
    float _2075 = fma(_1444, _2067, _1442);
    out.m_74.w = _2057;
    out.m_76.x = _2069;
    out.m_76.y = _2071;
    out.m_76.z = _2075;
    out.m_76.w = _2073;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

