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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1992 = false;
    bool _1247 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2277 = as_type<float>(_125);
        out.gl_Position.z = _2277;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2346 = as_type<float>(_163);
        out.gl_Position.z = _2346;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_171;
    float _209;
    if (!_191)
    {
        float _193 = in.m_57.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_109);
        float _215 = 1.0 / _213;
        float _217 = _143 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_57.x;
    float _223 = in.m_57.y;
    float _225 = in.m_57.z;
    float _227 = in.m_57.w;
    float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _231 = log2(_229);
    float _233 = as_type<float>(int(gl_VertexIndex));
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _245 = 1.0 + _243;
    float _247 = 1.0 / _237;
    bool _249 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _257 = _253 || _255;
    float _259 = _231 * _143;
    float _261 = 1.0 / _245;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _263;
    float _267 = _225 * 2.0;
    float _269 = _221 * 2.0;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _271;
    float _275 = exp2(_259);
    int _277 = as_type<int>(_233) & 1;
    bool _279 = _277 != 0;
    int _281 = as_type<int>(_233) & 2;
    bool _283 = _281 != 0;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _287 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _289 = isnan(0.0);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _295 = _291 || _293;
    float _297 = floor(_267);
    float _299 = 1.0 / _241;
    float _301 = -_275;
    float _303 = _301 + 1.0;
    float _305 = _295 ? _303 : 0.0;
    float _307 = floor(_269);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    bool _313 = _297 > 0.0;
    if (_257)
    {
        float _315 = _305 * _261;
        _147 = _315;
    }
    float _317 = _147;
    bool _319 = _297 >= 0.0;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan(0.0);
    bool _327 = _323 || _325;
    float _329 = _223 * 2.0;
    bool _331 = _227 > 0.5;
    float _333 = _225 + _221;
    float _335 = 1.0 / _311;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _219 + _337;
    int _341 = _327 ? 0 : 1;
    float _343 = _333 + (-1.0);
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _355 = _353 != 0;
    float _357 = _339 * _247;
    int _359 = ~_341;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _219 + _365;
    int _369 = _363;
    if (!_313)
    {
        int _371 = ~_341;
        int _373 = _371 + 1;
        _369 = _373;
    }
    int _375 = _369;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = _219 + _377;
    bool _381 = _307 >= 0.0;
    bool _383 = isnan(_307);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = floor(_329);
    float _393 = _367 * _299;
    float _395 = _223 + _221;
    int _397 = _389 ? 0 : 1;
    float _399 = _379 * _335;
    bool _401 = _307 > 0.0;
    float _403 = _223 + _225;
    float _405 = _395 + (-1.0);
    float _407 = _403 + (-1.0);
    float _409 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    float _415 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    int _421 = ~_397;
    int _423 = _421 + 1;
    int _425 = _423 + 1;
    float _427 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _429 = _425;
    if (!_401)
    {
        int _431 = ~_397;
        int _433 = _431 + 1;
        _429 = _433;
    }
    int _435 = _429;
    float _437 = fma(_413, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _439 = !_347;
    int _441 = _439 ? 0 : 1;
    float _443 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _445 = _391 > 0.0;
    float _447 = _187 * _187;
    bool _449 = _391 >= 0.0;
    bool _451 = isnan(_391);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _463 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_219);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_185, _185, _447);
    bool _477 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _479 = isnan(_219);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _493 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _495 = isnan(_219);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_473;
    float _507 = _505 + 1.0;
    float _509 = fma(_189, _189, _475);
    float _511 = -_487;
    float _513 = _511 + 1.0;
    int _515 = abs(_441);
    float _517 = _487 * _507;
    float _519 = -_503;
    float _521 = _519 + 1.0;
    float _523 = _503 * _513;
    float _525 = fma(_461, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = in.m_62.x;
    float _529 = in.m_62.y;
    float _531 = in.m_62.z;
    float _533 = fma(_491, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _535 = !_351;
    int _537 = _535 ? 0 : 1;
    float _539 = rsqrt(_509);
    float _541 = fma(_265, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = fma(_273, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _545 = abs(_537);
    float _547 = float(_375);
    float _549 = float(_515);
    bool _551 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_219);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = float(_545);
    int _565 = _457 ? 0 : 1;
    float _567 = _561 * _521;
    float _569 = float(_435);
    float _571 = _549 * _547;
    int _573 = ~_565;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    float _579 = _189 * _539;
    int _581 = _577;
    if (!_445)
    {
        int _583 = ~_565;
        int _585 = _583 + 1;
        _581 = _585;
    }
    int _587 = _581;
    float _589 = _571 * (-2.0);
    float _591 = _563 * _569;
    float _593 = _187 * _539;
    float _595 = _437 * _567;
    float _597 = _443 * _567;
    float _599 = _185 * _539;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _603 = _579 * _601;
    float _605 = _221 + (-0.5);
    float _607 = fma(_589, _527, _527);
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _611 = _593 * _609;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _615 = -_603;
    float _617 = fma(_599, _613, _615);
    bool _619 = _221 > 0.5;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[196].x, _607);
    bool _623 = !_355;
    int _625 = _623 ? 0 : 1;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _629 = -_611;
    float _631 = fma(_579, _627, _629);
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _635 = _599 * _633;
    float _637 = _617 * _617;
    float _639 = _591 * (-2.0);
    float _641 = fma(_409, _589, _409);
    int _643 = abs(_625);
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _647 = -_635;
    float _649 = fma(_593, _645, _647);
    float _651 = fma(_631, _631, _637);
    float _653 = fma(_415, _639, _415);
    float _655 = fma(_641, _317, _621);
    float _657 = fma(_639, _529, _529);
    float _659 = fma(_649, _649, _651);
    float _661 = -_561;
    float _663 = _661 + 1.0;
    float _665 = _655 * 0.15915493667125701904296875;
    float _667 = _223 + (-0.5);
    float _669 = float(_643);
    float _671 = rsqrt(_659);
    float _673 = float(_587);
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _595);
    float _677 = in.m_48.x;
    float _679 = in.m_48.y;
    float _681 = in.m_48.z;
    bool _683 = _223 > 0.5;
    float _685 = _669 * _673;
    float _687 = fma(_525, _523, _675);
    float _689 = _665 * 6.283185482025146484375;
    float _691 = sin(_689);
    float _693 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _597);
    float _697 = fma(_541, _517, _687);
    float _699 = in.m_64.x;
    float _701 = in.m_64.y;
    float _703 = _225 + (-0.5);
    float _705 = fma(_533, _523, _695);
    float _707 = _685 * (-2.0);
    float _709 = fma(_653, _317, _693);
    float _711 = _665 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = fma(_543, _517, _705);
    float _717 = fma(_707, _531, _531);
    float _719 = fma(_427, _707, _427);
    float _721 = _709 * 0.15915493667125701904296875;
    float _723 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[146].y, _715);
    float _725 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].z, _717);
    float _727 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[146].x, _697);
    float _729 = _721 * 6.283185482025146484375;
    float _731 = sin(_729);
    float _733 = fma(_719, _317, _725);
    float _735 = _631 * _671;
    float _737 = _617 * _671;
    bool _739 = !_279;
    float _741 = _739 ? (-0.5) : 0.5;
    float _743 = _733 * 0.15915493667125701904296875;
    float _745 = _649 * _671;
    float _747 = _721 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = _679 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _741);
    float _755 = _723 * _701;
    float _757 = _727 * _699;
    float _759 = _679 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _761 = _679 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _763 = !_283;
    float _765 = _763 ? (-0.5) : 0.5;
    float _767 = _743 * 6.283185482025146484375;
    float _769 = cos(_767);
    float _771 = _757 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = _691 * _731;
    float _775 = _713 * _731;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _765);
    float _779 = _771 * _753;
    float _781 = _599 * _737;
    float _783 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _785 = _743 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _691 * _749;
    float _791 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[4].x, _751);
    float _793 = _783 * _777;
    float _795 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[5].x, _759);
    float _797 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[6].x, _761);
    float _799 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[4].z, _791);
    float _801 = _579 * _735;
    float _803 = _691 * _769;
    float _805 = _713 * _749;
    float _807 = _713 * _769;
    float _809 = _749 * _769;
    float _811 = _731 * _769;
    float _813 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[6].z, _797);
    float _815 = _807 * _599;
    float _817 = _807 * _579;
    float _819 = fma(_787, _805, _773);
    float _821 = -_775;
    float _823 = fma(_787, _789, _821);
    float _825 = fma(_787, _773, _805);
    float _827 = -_789;
    float _829 = fma(_787, _775, _827);
    float _831 = _593 * _745;
    float _833 = -_781;
    float _835 = fma(_593, _735, _833);
    float _837 = -_787;
    float _839 = fma(_837, _735, _815);
    float _841 = _819 * _599;
    float _843 = _829 * _599;
    float _845 = _829 * _579;
    float _847 = -_831;
    float _849 = fma(_579, _737, _847);
    float _851 = -_787;
    float _853 = fma(_851, _745, _817);
    float _855 = _819 * _579;
    float _857 = fma(_809, _735, _841);
    float _859 = fma(_811, _735, _843);
    float _861 = fma(_811, _745, _845);
    float _863 = fma(_809, _745, _855);
    float _865 = fma(_803, _849, _839);
    float _867 = fma(_803, _835, _853);
    float _869 = fma(_823, _849, _857);
    float _871 = fma(_825, _849, _859);
    float _873 = fma(_825, _835, _861);
    float _875 = fma(_823, _835, _863);
    float _877 = _793 * _865;
    float _879 = _793 * _867;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = _799 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _885 = fma(_779, _869, _877);
    float _887 = fma(_779, _875, _879);
    float _889 = _813 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = fma(_881, _871, _885);
    float _893 = fma(_881, _873, _887);
    float _895 = _807 * _593;
    float _897 = _883 + _891;
    float _899 = _889 + _893;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _905 = _897 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _909 = _899 + _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _913 = _285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _905 * _905;
    float _917 = _909 * _909;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _921 = _819 * _593;
    float _923 = -_801;
    float _925 = fma(_599, _745, _923);
    float _927 = _915 + _917;
    float _929 = -_787;
    float _931 = fma(_929, _737, _895);
    float _933 = fma(_809, _737, _921);
    float _935 = _829 * _593;
    float _937 = sqrt(_927);
    float _939 = fma(_803, _925, _931);
    float _941 = fma(_823, _925, _933);
    float _943 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _793 * _939;
    float _949 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[5].z, _795);
    float _951 = fma(_811, _737, _935);
    out.m_66.x = _943;
    out.m_66.y = _945;
    out.m_66.z = _913;
    out.m_66.w = _919;
    float _953 = fma(_779, _941, _947);
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    float _959 = fma(_825, _925, _951);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _963 = _961 != 0;
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _969 = _967 != 0;
    float _971 = fma(_881, _959, _953);
    bool _973 = _937 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = -_765;
    int _977 = _683 ? as_type<int>(_975) : as_type<int>(_765);
    bool _979 = _225 > 0.5;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = -_765;
    int _985 = _331 ? as_type<int>(_983) : as_type<int>(_765);
    float _987 = _949 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _991 = _989 != 0;
    float _993 = _987 + _971;
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _997 = _779;
    float _999 = _915;
    float _1001 = _917;
    float _1003 = _897;
    float _1005 = _899;
    float _1007 = _873;
    float _1009 = _941;
    float _1011 = _599;
    if (!_973)
    {
        _997 = _993;
    }
    float _1013 = _997;
    bool _1015 = !_973;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _937 + _1021;
        float _1025 = rsqrt(_927);
        float _1027 = _1023 * _1019;
        float _1029 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1031 = _1027 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = fma(_1035, _1029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1043 = _1025 * _1041;
        float _1045 = fma(_905, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1047 = _1039 + (-1.0);
        float _1049 = fma(_909, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1053 = _1045 + _1051;
        float _1055 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1059 = _1049 + _1057;
        float _1061 = _1053 * _1053;
        float _1063 = fma(_993, _1039, _1055);
        float _1065 = _1059 * _1059;
        _1017 = _1063;
        _999 = _1061;
        _1001 = _1065;
        _1003 = _1045;
        _1005 = _1049;
    }
    float _1067 = _1017;
    float _1069 = _999;
    float _1071 = _1001;
    float _1073 = _1003;
    float _1075 = _1005;
    float _1077 = _765 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1081 = _1067 + _1079;
    float _1083 = -_741;
    int _1085 = _619 ? as_type<int>(_1083) : as_type<int>(_741);
    float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1089 = -_741;
    int _1091 = _979 ? as_type<int>(_1089) : as_type<int>(_741);
    float _1093 = fma(_1077, _1077, 1.0);
    float _1095 = fma(_1081, _1081, _1069);
    bool _1097 = !_957;
    float _1099 = _1097 ? _741 : as_type<float>(_1085);
    float _1101 = _741 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1103 = !_969;
    float _1105 = _1103 ? _741 : as_type<float>(_1091);
    float _1107 = _865 * _1077;
    float _1109 = rsqrt(_1093);
    bool _1111 = !_963;
    float _1113 = _1111 ? _765 : as_type<float>(_977);
    float _1115 = _939 * _1077;
    bool _1117 = !_991;
    float _1119 = _1117 ? _765 : as_type<float>(_985);
    float _1121 = _867 * _1077;
    float _1123 = _1099 + 0.5;
    float _1125 = -_1113;
    float _1127 = _1125 + 0.5;
    float _1129 = fma(_869, _1101, _1107);
    float _1131 = fma(_941, _1101, _1115);
    float _1133 = fma(_875, _1101, _1121);
    float _1135 = -_1119;
    float _1137 = _1135 + 0.5;
    float _1139 = _1105 + 0.5;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = _1077 * _1109;
    float _1151 = _1141 * _965;
    float _1153 = _1095 + _1071;
    float _1155 = _1143 * _981;
    float _1157 = _1145 * _1087;
    float _1159 = _1147 * _995;
    float _1161 = -_1149;
    float _1163 = _959 * _1161;
    float _1165 = -_1149;
    float _1167 = _871 * _1165;
    float _1169 = sqrt(_1153);
    float _1171 = fma(_939, _1109, _1163);
    float _1173 = fma(_865, _1109, _1167);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1177 = -_1149;
    float _1179 = _873 * _1177;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1185 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = fma(_867, _1109, _1179);
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _871 + _1129;
    float _1195 = _959 + _1131;
    float _1197 = _873 + _1133;
    out.m_68.x = _1151;
    out.m_68.y = _1155;
    out.m_68.z = _1159;
    out.m_68.w = _1157;
    bool _1199 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1201 = isnan(_1169);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1207 = _1203 || _1205;
    out.m_70.x = _1185;
    out.m_70.y = _1189;
    out.m_70.z = _1191;
    out.m_72.x = _869;
    out.m_72.y = _941;
    out.m_72.z = _875;
    out.m_74.x = _1173;
    out.m_74.y = _1171;
    out.m_74.z = _1187;
    float _1209 = _1185;
    float _1211 = _1191;
    if (!_1207)
    {
        _1007 = 1.0;
    }
    float _1213 = _1007;
    out.m_76.x = _1193;
    out.m_76.y = _1195;
    out.m_76.z = _1197;
    bool _1215 = !_1207;
    float _1217 = _1213;
    if (!_1215)
    {
        bool _1219 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1221 = isnan(_1169);
        bool _1223 = _1219 || _1221;
        bool _1225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1227 = _1223 || _1225;
        if (!_1227)
        {
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1231 = _1169 + _1229;
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1239 = _1237 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1241 = 1.0 / _1235;
            float _1243 = _1231 * _1241;
            float _1245 = fma(_1243, _1239, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1217 = _1245;
            _1009 = _1241;
            _1247 = true;
        }
        else
        {
            bool _1249 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1251 = isnan(_1169);
            bool _1253 = _1249 || _1251;
            bool _1255 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1257 = _1253 || _1255;
            if (!_1257)
            {
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1261 = _1169 + _1259;
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1263 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1271 = 1.0 / _1265;
                float _1273 = _1261 * _1271;
                float _1275 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1217 = _1275;
                _1009 = _1271;
                _1247 = true;
            }
            else
            {
                _1217 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1247 = false;
    float _1277 = _1217;
    float _1279 = _1009;
    float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1283 = _1067 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1287 = _1073 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1291 = _1075 + _1289;
    float _1293 = fma(_1283, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1295 = fma(_1287, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1297 = fma(_1291, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1299 = -_987;
    float _1301 = _1299 + _1293;
    float _1303 = -_883;
    float _1305 = _1303 + _1295;
    float _1307 = -_889;
    float _1309 = _1307 + _1297;
    float _1311 = _1301 * _1301;
    float _1313 = fma(_1305, _1305, _1311);
    float _1315 = fma(_1309, _1309, _1313);
    float _1317 = sqrt(_1315);
    bool _1319 = _1317 > 0.0;
    float _1321 = _1317;
    float _1323 = _1279;
    float _1325 = _1297;
    if (!_1319)
    {
        _1321 = _1295;
    }
    float _1327 = _1321;
    float _1329 = _1327;
    if (!_1319)
    {
        _1323 = _1293;
    }
    float _1331 = _1323;
    bool _1333 = !_1319;
    float _1335 = _1331;
    float _1337 = _1331;
    if (!_1333)
    {
        float _1339 = sqrt(_509);
        float _1341 = rsqrt(_1315);
        bool _1343 = _1339 > 0.0;
        float _1345 = _1305 * _1341;
        float _1347 = _1301 * _1341;
        float _1349 = _1309 * _1341;
        float _1351 = _1341;
        _1209 = _1347;
        if (!_1343)
        {
            _1351 = _1295;
        }
        float _1353 = _1351;
        _1329 = _1353;
        if (!_1343)
        {
            _1335 = _1293;
        }
        float _1355 = _1335;
        bool _1357 = !_1343;
        _1337 = _1355;
        if (!_1357)
        {
            float _1359 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1361 = _593 * _1347;
            float _1363 = fma(_599, _1345, _1361);
            float _1365 = fma(_579, _1349, _1363);
            float _1367 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1369 = _1365 * _1367;
            float _1371 = fma(_185, _1369, _1295);
            float _1373 = fma(_187, _1369, _1293);
            float _1375 = fma(_189, _1369, _1297);
            _1337 = _1373;
            _1329 = _1371;
            _1325 = _1375;
            _1011 = _1369;
        }
    }
    float _1377 = _1337;
    float _1379 = _1329;
    float _1381 = _1325;
    float _1383 = _1209;
    float _1385 = _1011;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1377 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1393 = _1379 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1397 = _1381 + _1395;
    float _1399 = _1389 * _1389;
    float _1401 = fma(_1393, _1393, _1399);
    float _1403 = fma(_1397, _1397, _1401);
    float _1405 = rsqrt(_1403);
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1393 * _1407;
    float _1411 = _1397 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1397;
    float _1429 = _1383;
    float _1431 = _1425;
    float _1433 = _1389;
    float _1435 = _1385;
    if (_1421)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1421)
    {
        float _1441 = rsqrt(_1417);
        _1429 = _1441;
    }
    float _1443 = _1429;
    float _1445 = _1443;
    if (_1421)
    {
        float _1447 = _1425 * _1439;
        _1431 = _1447;
    }
    float _1449 = _1431;
    if (_1421)
    {
        float _1451 = _1449 * 0.15915493667125701904296875;
        _1211 = _1451;
    }
    float _1453 = _1211;
    float _1455 = _1399;
    if (_1421)
    {
        float _1457 = _1453 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        _1455 = _1459;
    }
    float _1461 = _1455;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1465 = precise::max(0.0, _1463);
    float _1467 = _1405;
    float _1469 = _1463;
    float _1471 = _1465;
    if (_1421)
    {
        float _1473 = _1453 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        _1467 = _1475;
    }
    float _1477 = _1467;
    float _1479 = -_1407;
    float _1481 = -_1465;
    float _1483 = fma(_1389, _1479, _1481);
    float _1485 = _1483;
    if (_1421)
    {
        float _1487 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1469 = _1487;
    }
    float _1489 = _1469;
    float _1491 = _1489;
    float _1493 = _1461;
    if (_1421)
    {
        float _1495 = fma(_1461, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    if (!_1421)
    {
        _1493 = _1411;
    }
    float _1499 = _1493;
    float _1501 = _1499;
    if (_1421)
    {
        float _1503 = _1477 + (-1.0);
        _1433 = _1503;
    }
    float _1505 = _1433;
    float _1507 = _1505;
    if (_1421)
    {
        float _1509 = _1443 * _1497;
        _1435 = _1509;
    }
    float _1511 = _1435;
    if (!_1421)
    {
        _1445 = _1409;
    }
    float _1513 = _1445;
    float _1515 = sqrt(_1403);
    float _1517 = _1513;
    if (_1421)
    {
        float _1519 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1519;
    }
    float _1521 = _1471;
    float _1523 = _1521;
    if (_1421)
    {
        float _1525 = _1409 * _1511;
        _1517 = _1525;
    }
    float _1527 = _1517;
    if (_1421)
    {
        float _1529 = _1411 * _1511;
        _1501 = _1529;
    }
    float _1531 = _1501;
    if (!_1421)
    {
        _1507 = _1415;
    }
    float _1533 = _1507;
    float _1535 = _1533;
    if (_1421)
    {
        float _1537 = fma(_1483, _1477, _1521);
        _1485 = _1537;
    }
    float _1539 = _1485;
    if (!_1421)
    {
        _1523 = _1413;
    }
    float _1541 = _1523;
    float _1543 = _1541;
    if (_1421)
    {
        float _1545 = _1527 * _1527;
        _1543 = _1545;
    }
    float _1547 = _1543;
    if (_1421)
    {
        float _1549 = _1531 * _1531;
        _1535 = _1549;
    }
    float _1551 = _1535;
    float _1553 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1555 = fma(_1539, _1539, _1547);
    float _1557 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1553);
    float _1561 = _1555 + _1551;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1565 = fma(_1515, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1563);
    float _1567 = precise::clamp(_1565, 0.0, 1.0);
    float _1569 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = rsqrt(_1561);
    float _1573 = -_1567;
    float _1575 = _1573 + 1.0;
    float _1577 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1579 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1587 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1589 = abs(_1575);
    float _1591 = log2(_1589);
    float _1593 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1595 = -_1585;
    float _1597 = fma(_1595, _1581, 1.0);
    float _1599 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1601 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1593);
    float _1603 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1599);
    float _1605 = _1571 * _1527;
    float _1607 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1609 = _1571 * _1539;
    float _1611 = _1571 * _1531;
    float _1613 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1615 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1603);
    float _1617 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1619 = floor(_1579);
    float _1621 = -_1613;
    float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1621);
    float _1625 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1627 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1629 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1631 = -_1611;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1623);
    float _1635 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1583);
    float _1637 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1627);
    float _1639 = floor(_1587);
    float _1641 = fma(_1633, -0.5, 0.5);
    float _1643 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1645 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1637);
    float _1647 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1645);
    float _1649 = exp2(_1629);
    float _1651 = -_1619;
    float _1653 = _1579 + _1651;
    float _1655 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1657 = fma(_1633, 0.5, 0.5);
    float _1659 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1661 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1655);
    float _1663 = log2(_1597);
    float _1665 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1659);
    float _1667 = _1609 + 1.0;
    float _1669 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1661);
    float _1671 = -_1639;
    float _1673 = _1587 + _1671;
    float _1675 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1665);
    float _1677 = fma(_1657, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1679 = 1.0 / _1647;
    float _1681 = fma(_1657, _1677, -0.212114393711090087890625);
    float _1683 = sqrt(_1641);
    float _1685 = _1663 * 0.693147182464599609375;
    float2 _4794 = float2(_1653, _1673);
    float _1687 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4794, float2(0.0), isnan(_4794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4794, float2(0.0), isnan(_4794)), level(0.0)).x;
    float _1689 = fma(_1657, _1681, 1.570728778839111328125);
    float _1691 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1693 = -_1609;
    float _1695 = fma(_1649, _1667, _1693);
    float _1697 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1669);
    float _1699 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1675);
    float _1701 = fma(_1695, 0.5, 0.5);
    float _1703 = _1697 * _1679;
    float _1705 = _1699 * _1679;
    float _1707 = _1683 * 0.636619746685028076171875;
    float _1709 = fma(_1703, 0.5, 0.5);
    float _1711 = fma(_1705, -0.5, 0.5);
    float _1713 = -_1689;
    float _1715 = fma(_1707, _1713, 1.0);
    float3 _4849 = float3(_1709, _1711, _1691);
    float _1717 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4849, float3(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4849, float3(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1709, _1711, _1691);
    float4 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).xyzw;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = _1720.w;
    float2 _4876 = float2(_1715, _1701);
    float3 _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4876, float2(0.0), isnan(_4876)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4876, float2(0.0), isnan(_4876)), level(0.0)).xyz;
    float _1734 = _1732.x;
    float _1736 = _1732.y;
    float _1738 = _1732.z;
    float _1740 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1742 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1744 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1379;
    out.m_78.y = _1377;
    out.m_78.z = _1381;
    float _1746 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1740);
    float _1748 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1742);
    float _1750 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1744);
    bool _1752 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1754 = isnan(_1515);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1760 = _1756 || _1758;
    float _1762 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1746);
    float _1764 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1748);
    float _1766 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1750);
    float _1768 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1770 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1772 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1766);
    float _1774 = 1.0 / _1768;
    float _1776 = _1770 + _1768;
    out.gl_Position.x = _1697;
    out.gl_Position.y = _1699;
    out.gl_Position.z = _1772;
    out.gl_Position.w = _1647;
    float _1778 = _1776 * _1774;
    float _1780 = _1778 * 0.5;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1784 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1782);
    float _1786 = _1699;
    float _1788 = _1697;
    float _1790 = _1647;
    float _1792 = _1772;
    if (!_1760)
    {
        _1786 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1794 = _1786;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1760)
    {
        _1788 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1800 = _1788;
    float _1802 = 1.0 / _1784;
    float _1804 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1806 = exp2(_1804);
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1810 = _1802 * _1808;
    bool _1812 = _1810 <= 8000.0;
    bool _1814 = isnan(_1810);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan(8000.0);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = abs(_1810);
    float _1826 = log2(_1824);
    float _1828 = -_1806;
    float _1830 = _1828 + 1.0;
    float _1832 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1834 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1836 = exp2(_1834);
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1840 = precise::clamp(_1838, 0.0, 1.0);
    float _1842 = in.m_80.x;
    float _1844 = fma(_1840, -2.0, 3.0);
    float _1846 = _1840 * _1840;
    float _1848 = _1846 * _1844;
    float _1850 = -_1848;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1848);
    float _1856 = _1772 + _1647;
    float _1858 = _1800;
    float _1860 = _1800;
    if (!_1760)
    {
        _1790 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1862 = _1790;
    float _1864 = _1822 * _1854;
    float _1866 = _1856 * 0.5;
    float _1868 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1872 = _1862;
    float _1874 = _1862;
    if (!_1760)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1876 = _1792;
    out.m_82.z = _1866;
    out.m_82.w = _1647;
    float _1878 = -_1687;
    float _1880 = _1878 + 1.0;
    float _1882 = _1880 * _1868;
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = -_1884;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1890 = _1722;
    float _1892 = _1876;
    float _1894 = _1876;
    if (!_1760)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1896 = _1870;
    float _1898 = _1888 * _1842;
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1902 = _1832 * _1717;
    float _1904 = -_1832;
    float _1906 = _1904 + 1.0;
    out.m_84.x = _1900;
    float _1908 = _1728 * _1902;
    float _1910 = _1738 * _1902;
    float _1912 = _1728 * _1906;
    float _1914 = fma(_1734, _1908, _1722);
    float _1916 = fma(_1736, _1908, _1724);
    float _1918 = fma(_1728, _1910, _1726);
    float _1920 = _1896;
    float _1922 = _1896;
    if (!_1760)
    {
        _1890 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1924 = _1890;
    out.m_86.x = _1914;
    out.m_86.y = _1916;
    out.m_86.z = _1918;
    out.m_86.w = _1912;
    bool _1926 = !_1760;
    float _1928 = _1924;
    float _1930 = _1924;
    if (!_1926)
    {
        bool _1932 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1934 = isnan(_1515);
        bool _1936 = _1932 || _1934;
        bool _1938 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1940 = _1936 || _1938;
        if (!_1940)
        {
            float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1944 = _1515 + _1942;
            float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1948 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1946;
            float _1950 = 1.0 / _1948;
            float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1972 = _1944 * _1950;
            float _1974 = precise::clamp(_1972, 0.0, 1.0);
            float _1976 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1978 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1980 = fma(_1974, _1954, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1982 = fma(_1974, _1978, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1984 = fma(_1974, _1958, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1986 = fma(_1974, _1962, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1988 = fma(_1974, _1966, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1990 = fma(_1974, _1970, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1874 = _1982;
            _1860 = _1988;
            _1930 = _1980;
            _1798 = _1986;
            _1894 = _1984;
            _1922 = _1990;
            _1992 = true;
        }
        else
        {
            bool _1994 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1996 = isnan(_1515);
            bool _1998 = _1994 || _1996;
            bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2002 = _1998 || _2000;
            if (!_2002)
            {
                _1928 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2004 = _1928;
            _1930 = _2004;
            if (!_2002)
            {
                _1872 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2006 = _1872;
            _1874 = _2006;
            if (!_2002)
            {
                _1892 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2008 = _1892;
            _1894 = _2008;
            if (!_2002)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2010 = _1796;
            _1798 = _2010;
            if (!_2002)
            {
                _1858 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2012 = _1858;
            _1860 = _2012;
            if (!_2002)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2014 = _1920;
            bool _2016 = !_2002;
            _1922 = _2014;
            if (!_2016)
            {
                bool _2018 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2020 = isnan(_1515);
                bool _2022 = _2018 || _2020;
                bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2026 = _2022 || _2024;
                if (!_2026)
                {
                    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2030 = _1515 + _2028;
                    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2034 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2032;
                    float _2036 = 1.0 / _2034;
                    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2040 = _2038 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2044 = _2042 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2048 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2052 = _2050 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2058 = _2030 * _2036;
                    float _2060 = precise::clamp(_2058, 0.0, 1.0);
                    float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2066 = fma(_2060, _2040, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2068 = fma(_2060, _2064, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2070 = fma(_2060, _2044, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2072 = fma(_2060, _2048, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2074 = fma(_2060, _2052, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2076 = fma(_2060, _2056, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1874 = _2068;
                    _1860 = _2074;
                    _1930 = _2066;
                    _1798 = _2072;
                    _1894 = _2070;
                    _1922 = _2076;
                    _1992 = true;
                }
                else
                {
                    _1874 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1860 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1930 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1894 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1992 = false;
    float _2078 = _1874;
    float _2080 = _1860;
    float _2082 = _1930;
    float _2084 = _1798;
    float _2086 = _1894;
    float _2088 = _1922;
    float _2090 = fma(_1195, -0.5, 0.5);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = -_2078;
    float _2096 = _2094 + _2080;
    float _2098 = -_2082;
    float _2100 = _2098 + _2084;
    float _2102 = -_2086;
    float _2104 = _2102 + _2088;
    bool _2106 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2108 = fma(_2092, _2096, _2078);
    float _2110 = fma(_2092, _2100, _2082);
    float _2112 = fma(_2092, _2104, _2086);
    float _2114 = _2108 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _2116 = fma(_2110, 0.298911988735198974609375, _2114);
    float _2118 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2120 = fma(_2112, 0.114477999508380889892578125, _2116);
    out.m_51.x = _2118;
    float _2122 = -_2120;
    float _2124 = _2110 + _2122;
    float _2126 = -_2120;
    float _2128 = _2108 + _2126;
    float _2130 = -_2120;
    float _2132 = _2112 + _2130;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    float _2138 = fma(_2132, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    out.m_90.x = _2134;
    out.m_90.y = _2136;
    out.m_90.z = _2138;
    if (!_2106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2140 = -_1377;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2144 = -_1379;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2148 = -_1381;
    float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2152 = _2142 * _2142;
    float _2154 = fma(_2146, _2146, _2152);
    float _2156 = fma(_2150, _2150, _2154);
    float _2158 = sqrt(_2156);
    float _2160 = rsqrt(_2156);
    float _2162 = -_2158;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2166 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2168 = precise::clamp(_2166, 0.0, 1.0);
    float _2170 = _2146 * _2160;
    float _2172 = _2142 * _2160;
    float _2174 = abs(_2168);
    float _2176 = log2(_2174);
    float _2178 = _2150 * _2160;
    float _2180 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2182 = _1195 * _2172;
    float _2184 = -_2172;
    float _2186 = -_2180;
    float _2188 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2186);
    float _2190 = fma(_1193, _2170, _2182);
    float _2192 = -_2178;
    float _2194 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2188);
    float _2196 = fma(_1197, _2178, _2190);
    float _2198 = precise::clamp(_2196, 0.0, 1.0);
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2202 = _2194 + _2200;
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2206 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = exp2(_2204);
    float _2212 = _2210 * _2208;
    float _2214 = _2198 * _2212;
    float _2216 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2218 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _2216;
    out.m_88.y = _2218;
    out.m_88.z = _2220;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1992 = false;
    bool _1247 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2277 = as_type<float>(_125);
        out.gl_Position.z = _2277;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2346 = as_type<float>(_163);
        out.gl_Position.z = _2346;
    }
    if (_157)
    {
        return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_171;
    float _209;
    if (!_191)
    {
        float _193 = in.m_57.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_109);
        float _215 = 1.0 / _213;
        float _217 = _143 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_57.x;
    float _223 = in.m_57.y;
    float _225 = in.m_57.z;
    float _227 = in.m_57.w;
    float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _231 = log2(_229);
    float _233 = as_type<float>(int(gl_VertexIndex));
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _245 = 1.0 + _243;
    float _247 = 1.0 / _237;
    bool _249 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _257 = _253 || _255;
    float _259 = _231 * _143;
    float _261 = 1.0 / _245;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _263;
    float _267 = _225 * 2.0;
    float _269 = _221 * 2.0;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _271;
    float _275 = exp2(_259);
    int _277 = as_type<int>(_233) & 1;
    bool _279 = _277 != 0;
    int _281 = as_type<int>(_233) & 2;
    bool _283 = _281 != 0;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _287 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _289 = isnan(0.0);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _295 = _291 || _293;
    float _297 = floor(_267);
    float _299 = 1.0 / _241;
    float _301 = -_275;
    float _303 = _301 + 1.0;
    float _305 = _295 ? _303 : 0.0;
    float _307 = floor(_269);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    bool _313 = _297 > 0.0;
    if (_257)
    {
        float _315 = _305 * _261;
        _147 = _315;
    }
    float _317 = _147;
    bool _319 = _297 >= 0.0;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan(0.0);
    bool _327 = _323 || _325;
    float _329 = _223 * 2.0;
    bool _331 = _227 > 0.5;
    float _333 = _225 + _221;
    float _335 = 1.0 / _311;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _219 + _337;
    int _341 = _327 ? 0 : 1;
    float _343 = _333 + (-1.0);
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _355 = _353 != 0;
    float _357 = _339 * _247;
    int _359 = ~_341;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _219 + _365;
    int _369 = _363;
    if (!_313)
    {
        int _371 = ~_341;
        int _373 = _371 + 1;
        _369 = _373;
    }
    int _375 = _369;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = _219 + _377;
    bool _381 = _307 >= 0.0;
    bool _383 = isnan(_307);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = floor(_329);
    float _393 = _367 * _299;
    float _395 = _223 + _221;
    int _397 = _389 ? 0 : 1;
    float _399 = _379 * _335;
    bool _401 = _307 > 0.0;
    float _403 = _223 + _225;
    float _405 = _395 + (-1.0);
    float _407 = _403 + (-1.0);
    float _409 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    float _415 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    int _421 = ~_397;
    int _423 = _421 + 1;
    int _425 = _423 + 1;
    float _427 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _429 = _425;
    if (!_401)
    {
        int _431 = ~_397;
        int _433 = _431 + 1;
        _429 = _433;
    }
    int _435 = _429;
    float _437 = fma(_413, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _439 = !_347;
    int _441 = _439 ? 0 : 1;
    float _443 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _445 = _391 > 0.0;
    float _447 = _187 * _187;
    bool _449 = _391 >= 0.0;
    bool _451 = isnan(_391);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _463 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_219);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_185, _185, _447);
    bool _477 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _479 = isnan(_219);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _493 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _495 = isnan(_219);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_473;
    float _507 = _505 + 1.0;
    float _509 = fma(_189, _189, _475);
    float _511 = -_487;
    float _513 = _511 + 1.0;
    int _515 = abs(_441);
    float _517 = _487 * _507;
    float _519 = -_503;
    float _521 = _519 + 1.0;
    float _523 = _503 * _513;
    float _525 = fma(_461, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = in.m_62.x;
    float _529 = in.m_62.y;
    float _531 = in.m_62.z;
    float _533 = fma(_491, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _535 = !_351;
    int _537 = _535 ? 0 : 1;
    float _539 = rsqrt(_509);
    float _541 = fma(_265, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = fma(_273, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _545 = abs(_537);
    float _547 = float(_375);
    float _549 = float(_515);
    bool _551 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_219);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = float(_545);
    int _565 = _457 ? 0 : 1;
    float _567 = _561 * _521;
    float _569 = float(_435);
    float _571 = _549 * _547;
    int _573 = ~_565;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    float _579 = _189 * _539;
    int _581 = _577;
    if (!_445)
    {
        int _583 = ~_565;
        int _585 = _583 + 1;
        _581 = _585;
    }
    int _587 = _581;
    float _589 = _571 * (-2.0);
    float _591 = _563 * _569;
    float _593 = _187 * _539;
    float _595 = _437 * _567;
    float _597 = _443 * _567;
    float _599 = _185 * _539;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _603 = _579 * _601;
    float _605 = _221 + (-0.5);
    float _607 = fma(_589, _527, _527);
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _611 = _593 * _609;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _615 = -_603;
    float _617 = fma(_599, _613, _615);
    bool _619 = _221 > 0.5;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[196].x, _607);
    bool _623 = !_355;
    int _625 = _623 ? 0 : 1;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _629 = -_611;
    float _631 = fma(_579, _627, _629);
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _635 = _599 * _633;
    float _637 = _617 * _617;
    float _639 = _591 * (-2.0);
    float _641 = fma(_409, _589, _409);
    int _643 = abs(_625);
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _647 = -_635;
    float _649 = fma(_593, _645, _647);
    float _651 = fma(_631, _631, _637);
    float _653 = fma(_415, _639, _415);
    float _655 = fma(_641, _317, _621);
    float _657 = fma(_639, _529, _529);
    float _659 = fma(_649, _649, _651);
    float _661 = -_561;
    float _663 = _661 + 1.0;
    float _665 = _655 * 0.15915493667125701904296875;
    float _667 = _223 + (-0.5);
    float _669 = float(_643);
    float _671 = rsqrt(_659);
    float _673 = float(_587);
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _595);
    float _677 = in.m_48.x;
    float _679 = in.m_48.y;
    float _681 = in.m_48.z;
    bool _683 = _223 > 0.5;
    float _685 = _669 * _673;
    float _687 = fma(_525, _523, _675);
    float _689 = _665 * 6.283185482025146484375;
    float _691 = sin(_689);
    float _693 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _597);
    float _697 = fma(_541, _517, _687);
    float _699 = in.m_64.x;
    float _701 = in.m_64.y;
    float _703 = _225 + (-0.5);
    float _705 = fma(_533, _523, _695);
    float _707 = _685 * (-2.0);
    float _709 = fma(_653, _317, _693);
    float _711 = _665 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = fma(_543, _517, _705);
    float _717 = fma(_707, _531, _531);
    float _719 = fma(_427, _707, _427);
    float _721 = _709 * 0.15915493667125701904296875;
    float _723 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[146].y, _715);
    float _725 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].z, _717);
    float _727 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[146].x, _697);
    float _729 = _721 * 6.283185482025146484375;
    float _731 = sin(_729);
    float _733 = fma(_719, _317, _725);
    float _735 = _631 * _671;
    float _737 = _617 * _671;
    bool _739 = !_279;
    float _741 = _739 ? (-0.5) : 0.5;
    float _743 = _733 * 0.15915493667125701904296875;
    float _745 = _649 * _671;
    float _747 = _721 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = _679 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _741);
    float _755 = _723 * _701;
    float _757 = _727 * _699;
    float _759 = _679 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _761 = _679 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _763 = !_283;
    float _765 = _763 ? (-0.5) : 0.5;
    float _767 = _743 * 6.283185482025146484375;
    float _769 = cos(_767);
    float _771 = _757 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = _691 * _731;
    float _775 = _713 * _731;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _765);
    float _779 = _771 * _753;
    float _781 = _599 * _737;
    float _783 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _785 = _743 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _691 * _749;
    float _791 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[4].x, _751);
    float _793 = _783 * _777;
    float _795 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[5].x, _759);
    float _797 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[6].x, _761);
    float _799 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[4].z, _791);
    float _801 = _579 * _735;
    float _803 = _691 * _769;
    float _805 = _713 * _749;
    float _807 = _713 * _769;
    float _809 = _749 * _769;
    float _811 = _731 * _769;
    float _813 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[6].z, _797);
    float _815 = _807 * _599;
    float _817 = _807 * _579;
    float _819 = fma(_787, _805, _773);
    float _821 = -_775;
    float _823 = fma(_787, _789, _821);
    float _825 = fma(_787, _773, _805);
    float _827 = -_789;
    float _829 = fma(_787, _775, _827);
    float _831 = _593 * _745;
    float _833 = -_781;
    float _835 = fma(_593, _735, _833);
    float _837 = -_787;
    float _839 = fma(_837, _735, _815);
    float _841 = _819 * _599;
    float _843 = _829 * _599;
    float _845 = _829 * _579;
    float _847 = -_831;
    float _849 = fma(_579, _737, _847);
    float _851 = -_787;
    float _853 = fma(_851, _745, _817);
    float _855 = _819 * _579;
    float _857 = fma(_809, _735, _841);
    float _859 = fma(_811, _735, _843);
    float _861 = fma(_811, _745, _845);
    float _863 = fma(_809, _745, _855);
    float _865 = fma(_803, _849, _839);
    float _867 = fma(_803, _835, _853);
    float _869 = fma(_823, _849, _857);
    float _871 = fma(_825, _849, _859);
    float _873 = fma(_825, _835, _861);
    float _875 = fma(_823, _835, _863);
    float _877 = _793 * _865;
    float _879 = _793 * _867;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = _799 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _885 = fma(_779, _869, _877);
    float _887 = fma(_779, _875, _879);
    float _889 = _813 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = fma(_881, _871, _885);
    float _893 = fma(_881, _873, _887);
    float _895 = _807 * _593;
    float _897 = _883 + _891;
    float _899 = _889 + _893;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _905 = _897 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _909 = _899 + _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _913 = _285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _905 * _905;
    float _917 = _909 * _909;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _921 = _819 * _593;
    float _923 = -_801;
    float _925 = fma(_599, _745, _923);
    float _927 = _915 + _917;
    float _929 = -_787;
    float _931 = fma(_929, _737, _895);
    float _933 = fma(_809, _737, _921);
    float _935 = _829 * _593;
    float _937 = sqrt(_927);
    float _939 = fma(_803, _925, _931);
    float _941 = fma(_823, _925, _933);
    float _943 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _793 * _939;
    float _949 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[5].z, _795);
    float _951 = fma(_811, _737, _935);
    out.m_66.x = _943;
    out.m_66.y = _945;
    out.m_66.z = _913;
    out.m_66.w = _919;
    float _953 = fma(_779, _941, _947);
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    float _959 = fma(_825, _925, _951);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _963 = _961 != 0;
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _969 = _967 != 0;
    float _971 = fma(_881, _959, _953);
    bool _973 = _937 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = -_765;
    int _977 = _683 ? as_type<int>(_975) : as_type<int>(_765);
    bool _979 = _225 > 0.5;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = -_765;
    int _985 = _331 ? as_type<int>(_983) : as_type<int>(_765);
    float _987 = _949 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _991 = _989 != 0;
    float _993 = _987 + _971;
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _997 = _779;
    float _999 = _915;
    float _1001 = _917;
    float _1003 = _897;
    float _1005 = _899;
    float _1007 = _873;
    float _1009 = _941;
    float _1011 = _599;
    if (!_973)
    {
        _997 = _993;
    }
    float _1013 = _997;
    bool _1015 = !_973;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _937 + _1021;
        float _1025 = rsqrt(_927);
        float _1027 = _1023 * _1019;
        float _1029 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1031 = _1027 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = fma(_1035, _1029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1043 = _1025 * _1041;
        float _1045 = fma(_905, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1047 = _1039 + (-1.0);
        float _1049 = fma(_909, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1053 = _1045 + _1051;
        float _1055 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1059 = _1049 + _1057;
        float _1061 = _1053 * _1053;
        float _1063 = fma(_993, _1039, _1055);
        float _1065 = _1059 * _1059;
        _1017 = _1063;
        _999 = _1061;
        _1001 = _1065;
        _1003 = _1045;
        _1005 = _1049;
    }
    float _1067 = _1017;
    float _1069 = _999;
    float _1071 = _1001;
    float _1073 = _1003;
    float _1075 = _1005;
    float _1077 = _765 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1081 = _1067 + _1079;
    float _1083 = -_741;
    int _1085 = _619 ? as_type<int>(_1083) : as_type<int>(_741);
    float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1089 = -_741;
    int _1091 = _979 ? as_type<int>(_1089) : as_type<int>(_741);
    float _1093 = fma(_1077, _1077, 1.0);
    float _1095 = fma(_1081, _1081, _1069);
    bool _1097 = !_957;
    float _1099 = _1097 ? _741 : as_type<float>(_1085);
    float _1101 = _741 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1103 = !_969;
    float _1105 = _1103 ? _741 : as_type<float>(_1091);
    float _1107 = _865 * _1077;
    float _1109 = rsqrt(_1093);
    bool _1111 = !_963;
    float _1113 = _1111 ? _765 : as_type<float>(_977);
    float _1115 = _939 * _1077;
    bool _1117 = !_991;
    float _1119 = _1117 ? _765 : as_type<float>(_985);
    float _1121 = _867 * _1077;
    float _1123 = _1099 + 0.5;
    float _1125 = -_1113;
    float _1127 = _1125 + 0.5;
    float _1129 = fma(_869, _1101, _1107);
    float _1131 = fma(_941, _1101, _1115);
    float _1133 = fma(_875, _1101, _1121);
    float _1135 = -_1119;
    float _1137 = _1135 + 0.5;
    float _1139 = _1105 + 0.5;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = _1077 * _1109;
    float _1151 = _1141 * _965;
    float _1153 = _1095 + _1071;
    float _1155 = _1143 * _981;
    float _1157 = _1145 * _1087;
    float _1159 = _1147 * _995;
    float _1161 = -_1149;
    float _1163 = _959 * _1161;
    float _1165 = -_1149;
    float _1167 = _871 * _1165;
    float _1169 = sqrt(_1153);
    float _1171 = fma(_939, _1109, _1163);
    float _1173 = fma(_865, _1109, _1167);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1177 = -_1149;
    float _1179 = _873 * _1177;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1185 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = fma(_867, _1109, _1179);
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _871 + _1129;
    float _1195 = _959 + _1131;
    float _1197 = _873 + _1133;
    out.m_68.x = _1151;
    out.m_68.y = _1155;
    out.m_68.z = _1159;
    out.m_68.w = _1157;
    bool _1199 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1201 = isnan(_1169);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1207 = _1203 || _1205;
    out.m_70.x = _1185;
    out.m_70.y = _1189;
    out.m_70.z = _1191;
    out.m_72.x = _869;
    out.m_72.y = _941;
    out.m_72.z = _875;
    out.m_74.x = _1173;
    out.m_74.y = _1171;
    out.m_74.z = _1187;
    float _1209 = _1185;
    float _1211 = _1191;
    if (!_1207)
    {
        _1007 = 1.0;
    }
    float _1213 = _1007;
    out.m_76.x = _1193;
    out.m_76.y = _1195;
    out.m_76.z = _1197;
    bool _1215 = !_1207;
    float _1217 = _1213;
    if (!_1215)
    {
        bool _1219 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1221 = isnan(_1169);
        bool _1223 = _1219 || _1221;
        bool _1225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1227 = _1223 || _1225;
        if (!_1227)
        {
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1231 = _1169 + _1229;
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1239 = _1237 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1241 = 1.0 / _1235;
            float _1243 = _1231 * _1241;
            float _1245 = fma(_1243, _1239, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1217 = _1245;
            _1009 = _1241;
            _1247 = true;
        }
        else
        {
            bool _1249 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1251 = isnan(_1169);
            bool _1253 = _1249 || _1251;
            bool _1255 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1257 = _1253 || _1255;
            if (!_1257)
            {
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1261 = _1169 + _1259;
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1263 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1271 = 1.0 / _1265;
                float _1273 = _1261 * _1271;
                float _1275 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1217 = _1275;
                _1009 = _1271;
                _1247 = true;
            }
            else
            {
                _1217 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1247 = false;
    float _1277 = _1217;
    float _1279 = _1009;
    float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1283 = _1067 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1287 = _1073 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1291 = _1075 + _1289;
    float _1293 = fma(_1283, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1295 = fma(_1287, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1297 = fma(_1291, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1299 = -_987;
    float _1301 = _1299 + _1293;
    float _1303 = -_883;
    float _1305 = _1303 + _1295;
    float _1307 = -_889;
    float _1309 = _1307 + _1297;
    float _1311 = _1301 * _1301;
    float _1313 = fma(_1305, _1305, _1311);
    float _1315 = fma(_1309, _1309, _1313);
    float _1317 = sqrt(_1315);
    bool _1319 = _1317 > 0.0;
    float _1321 = _1317;
    float _1323 = _1279;
    float _1325 = _1297;
    if (!_1319)
    {
        _1321 = _1295;
    }
    float _1327 = _1321;
    float _1329 = _1327;
    if (!_1319)
    {
        _1323 = _1293;
    }
    float _1331 = _1323;
    bool _1333 = !_1319;
    float _1335 = _1331;
    float _1337 = _1331;
    if (!_1333)
    {
        float _1339 = sqrt(_509);
        float _1341 = rsqrt(_1315);
        bool _1343 = _1339 > 0.0;
        float _1345 = _1305 * _1341;
        float _1347 = _1301 * _1341;
        float _1349 = _1309 * _1341;
        float _1351 = _1341;
        _1209 = _1347;
        if (!_1343)
        {
            _1351 = _1295;
        }
        float _1353 = _1351;
        _1329 = _1353;
        if (!_1343)
        {
            _1335 = _1293;
        }
        float _1355 = _1335;
        bool _1357 = !_1343;
        _1337 = _1355;
        if (!_1357)
        {
            float _1359 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1361 = _593 * _1347;
            float _1363 = fma(_599, _1345, _1361);
            float _1365 = fma(_579, _1349, _1363);
            float _1367 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1369 = _1365 * _1367;
            float _1371 = fma(_185, _1369, _1295);
            float _1373 = fma(_187, _1369, _1293);
            float _1375 = fma(_189, _1369, _1297);
            _1337 = _1373;
            _1329 = _1371;
            _1325 = _1375;
            _1011 = _1369;
        }
    }
    float _1377 = _1337;
    float _1379 = _1329;
    float _1381 = _1325;
    float _1383 = _1209;
    float _1385 = _1011;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1377 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1393 = _1379 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1397 = _1381 + _1395;
    float _1399 = _1389 * _1389;
    float _1401 = fma(_1393, _1393, _1399);
    float _1403 = fma(_1397, _1397, _1401);
    float _1405 = rsqrt(_1403);
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1393 * _1407;
    float _1411 = _1397 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1397;
    float _1429 = _1383;
    float _1431 = _1425;
    float _1433 = _1389;
    float _1435 = _1385;
    if (_1421)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1421)
    {
        float _1441 = rsqrt(_1417);
        _1429 = _1441;
    }
    float _1443 = _1429;
    float _1445 = _1443;
    if (_1421)
    {
        float _1447 = _1425 * _1439;
        _1431 = _1447;
    }
    float _1449 = _1431;
    if (_1421)
    {
        float _1451 = _1449 * 0.15915493667125701904296875;
        _1211 = _1451;
    }
    float _1453 = _1211;
    float _1455 = _1399;
    if (_1421)
    {
        float _1457 = _1453 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        _1455 = _1459;
    }
    float _1461 = _1455;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1465 = precise::max(0.0, _1463);
    float _1467 = _1405;
    float _1469 = _1463;
    float _1471 = _1465;
    if (_1421)
    {
        float _1473 = _1453 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        _1467 = _1475;
    }
    float _1477 = _1467;
    float _1479 = -_1407;
    float _1481 = -_1465;
    float _1483 = fma(_1389, _1479, _1481);
    float _1485 = _1483;
    if (_1421)
    {
        float _1487 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1469 = _1487;
    }
    float _1489 = _1469;
    float _1491 = _1489;
    float _1493 = _1461;
    if (_1421)
    {
        float _1495 = fma(_1461, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    if (!_1421)
    {
        _1493 = _1411;
    }
    float _1499 = _1493;
    float _1501 = _1499;
    if (_1421)
    {
        float _1503 = _1477 + (-1.0);
        _1433 = _1503;
    }
    float _1505 = _1433;
    float _1507 = _1505;
    if (_1421)
    {
        float _1509 = _1443 * _1497;
        _1435 = _1509;
    }
    float _1511 = _1435;
    if (!_1421)
    {
        _1445 = _1409;
    }
    float _1513 = _1445;
    float _1515 = sqrt(_1403);
    float _1517 = _1513;
    if (_1421)
    {
        float _1519 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1519;
    }
    float _1521 = _1471;
    float _1523 = _1521;
    if (_1421)
    {
        float _1525 = _1409 * _1511;
        _1517 = _1525;
    }
    float _1527 = _1517;
    if (_1421)
    {
        float _1529 = _1411 * _1511;
        _1501 = _1529;
    }
    float _1531 = _1501;
    if (!_1421)
    {
        _1507 = _1415;
    }
    float _1533 = _1507;
    float _1535 = _1533;
    if (_1421)
    {
        float _1537 = fma(_1483, _1477, _1521);
        _1485 = _1537;
    }
    float _1539 = _1485;
    if (!_1421)
    {
        _1523 = _1413;
    }
    float _1541 = _1523;
    float _1543 = _1541;
    if (_1421)
    {
        float _1545 = _1527 * _1527;
        _1543 = _1545;
    }
    float _1547 = _1543;
    if (_1421)
    {
        float _1549 = _1531 * _1531;
        _1535 = _1549;
    }
    float _1551 = _1535;
    float _1553 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1555 = fma(_1539, _1539, _1547);
    float _1557 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1553);
    float _1561 = _1555 + _1551;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1565 = fma(_1515, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1563);
    float _1567 = precise::clamp(_1565, 0.0, 1.0);
    float _1569 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = rsqrt(_1561);
    float _1573 = -_1567;
    float _1575 = _1573 + 1.0;
    float _1577 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1579 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1587 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1589 = abs(_1575);
    float _1591 = log2(_1589);
    float _1593 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1595 = -_1585;
    float _1597 = fma(_1595, _1581, 1.0);
    float _1599 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1601 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1593);
    float _1603 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1599);
    float _1605 = _1571 * _1527;
    float _1607 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1609 = _1571 * _1539;
    float _1611 = _1571 * _1531;
    float _1613 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1615 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1603);
    float _1617 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1619 = floor(_1579);
    float _1621 = -_1613;
    float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1621);
    float _1625 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1627 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1629 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1631 = -_1611;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1623);
    float _1635 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1583);
    float _1637 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1627);
    float _1639 = floor(_1587);
    float _1641 = fma(_1633, -0.5, 0.5);
    float _1643 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1645 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1637);
    float _1647 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1645);
    float _1649 = exp2(_1629);
    float _1651 = -_1619;
    float _1653 = _1579 + _1651;
    float _1655 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1657 = fma(_1633, 0.5, 0.5);
    float _1659 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1661 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1655);
    float _1663 = log2(_1597);
    float _1665 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1659);
    float _1667 = _1609 + 1.0;
    float _1669 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1661);
    float _1671 = -_1639;
    float _1673 = _1587 + _1671;
    float _1675 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1665);
    float _1677 = fma(_1657, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1679 = 1.0 / _1647;
    float _1681 = fma(_1657, _1677, -0.212114393711090087890625);
    float _1683 = sqrt(_1641);
    float _1685 = _1663 * 0.693147182464599609375;
    float2 _4794 = float2(_1653, _1673);
    float _1687 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4794, float2(0.0), isnan(_4794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4794, float2(0.0), isnan(_4794)), level(0.0)).x;
    float _1689 = fma(_1657, _1681, 1.570728778839111328125);
    float _1691 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1693 = -_1609;
    float _1695 = fma(_1649, _1667, _1693);
    float _1697 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1669);
    float _1699 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1675);
    float _1701 = fma(_1695, 0.5, 0.5);
    float _1703 = _1697 * _1679;
    float _1705 = _1699 * _1679;
    float _1707 = _1683 * 0.636619746685028076171875;
    float _1709 = fma(_1703, 0.5, 0.5);
    float _1711 = fma(_1705, -0.5, 0.5);
    float _1713 = -_1689;
    float _1715 = fma(_1707, _1713, 1.0);
    float3 _4849 = float3(_1709, _1711, _1691);
    float _1717 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4849, float3(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4849, float3(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1709, _1711, _1691);
    float4 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).xyzw;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = _1720.w;
    float2 _4876 = float2(_1715, _1701);
    float3 _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4876, float2(0.0), isnan(_4876)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4876, float2(0.0), isnan(_4876)), level(0.0)).xyz;
    float _1734 = _1732.x;
    float _1736 = _1732.y;
    float _1738 = _1732.z;
    float _1740 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1742 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1744 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1379;
    out.m_78.y = _1377;
    out.m_78.z = _1381;
    float _1746 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1740);
    float _1748 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1742);
    float _1750 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1744);
    bool _1752 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1754 = isnan(_1515);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1760 = _1756 || _1758;
    float _1762 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1746);
    float _1764 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1748);
    float _1766 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1750);
    float _1768 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1770 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1772 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1766);
    float _1774 = 1.0 / _1768;
    float _1776 = _1770 + _1768;
    out.gl_Position.x = _1697;
    out.gl_Position.y = _1699;
    out.gl_Position.z = _1772;
    out.gl_Position.w = _1647;
    float _1778 = _1776 * _1774;
    float _1780 = _1778 * 0.5;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1784 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1782);
    float _1786 = _1699;
    float _1788 = _1697;
    float _1790 = _1647;
    float _1792 = _1772;
    if (!_1760)
    {
        _1786 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1794 = _1786;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1760)
    {
        _1788 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1800 = _1788;
    float _1802 = 1.0 / _1784;
    float _1804 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1806 = exp2(_1804);
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1810 = _1802 * _1808;
    bool _1812 = _1810 <= 8000.0;
    bool _1814 = isnan(_1810);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan(8000.0);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = abs(_1810);
    float _1826 = log2(_1824);
    float _1828 = -_1806;
    float _1830 = _1828 + 1.0;
    float _1832 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1834 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1836 = exp2(_1834);
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1840 = precise::clamp(_1838, 0.0, 1.0);
    float _1842 = in.m_80.x;
    float _1844 = fma(_1840, -2.0, 3.0);
    float _1846 = _1840 * _1840;
    float _1848 = _1846 * _1844;
    float _1850 = -_1848;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1848);
    float _1856 = _1772 + _1647;
    float _1858 = _1800;
    float _1860 = _1800;
    if (!_1760)
    {
        _1790 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1862 = _1790;
    float _1864 = _1822 * _1854;
    float _1866 = _1856 * 0.5;
    float _1868 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1872 = _1862;
    float _1874 = _1862;
    if (!_1760)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1876 = _1792;
    out.m_82.z = _1866;
    out.m_82.w = _1647;
    float _1878 = -_1687;
    float _1880 = _1878 + 1.0;
    float _1882 = _1880 * _1868;
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = -_1884;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1890 = _1722;
    float _1892 = _1876;
    float _1894 = _1876;
    if (!_1760)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1896 = _1870;
    float _1898 = _1888 * _1842;
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1902 = _1832 * _1717;
    float _1904 = -_1832;
    float _1906 = _1904 + 1.0;
    out.m_84.x = _1900;
    float _1908 = _1728 * _1902;
    float _1910 = _1738 * _1902;
    float _1912 = _1728 * _1906;
    float _1914 = fma(_1734, _1908, _1722);
    float _1916 = fma(_1736, _1908, _1724);
    float _1918 = fma(_1728, _1910, _1726);
    float _1920 = _1896;
    float _1922 = _1896;
    if (!_1760)
    {
        _1890 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1924 = _1890;
    out.m_86.x = _1914;
    out.m_86.y = _1916;
    out.m_86.z = _1918;
    out.m_86.w = _1912;
    bool _1926 = !_1760;
    float _1928 = _1924;
    float _1930 = _1924;
    if (!_1926)
    {
        bool _1932 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1934 = isnan(_1515);
        bool _1936 = _1932 || _1934;
        bool _1938 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1940 = _1936 || _1938;
        if (!_1940)
        {
            float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1944 = _1515 + _1942;
            float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1948 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1946;
            float _1950 = 1.0 / _1948;
            float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1972 = _1944 * _1950;
            float _1974 = precise::clamp(_1972, 0.0, 1.0);
            float _1976 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1978 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1980 = fma(_1974, _1954, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1982 = fma(_1974, _1978, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1984 = fma(_1974, _1958, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1986 = fma(_1974, _1962, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1988 = fma(_1974, _1966, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1990 = fma(_1974, _1970, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1874 = _1982;
            _1860 = _1988;
            _1930 = _1980;
            _1798 = _1986;
            _1894 = _1984;
            _1922 = _1990;
            _1992 = true;
        }
        else
        {
            bool _1994 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1996 = isnan(_1515);
            bool _1998 = _1994 || _1996;
            bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2002 = _1998 || _2000;
            if (!_2002)
            {
                _1928 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2004 = _1928;
            _1930 = _2004;
            if (!_2002)
            {
                _1872 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2006 = _1872;
            _1874 = _2006;
            if (!_2002)
            {
                _1892 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2008 = _1892;
            _1894 = _2008;
            if (!_2002)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2010 = _1796;
            _1798 = _2010;
            if (!_2002)
            {
                _1858 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2012 = _1858;
            _1860 = _2012;
            if (!_2002)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2014 = _1920;
            bool _2016 = !_2002;
            _1922 = _2014;
            if (!_2016)
            {
                bool _2018 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2020 = isnan(_1515);
                bool _2022 = _2018 || _2020;
                bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2026 = _2022 || _2024;
                if (!_2026)
                {
                    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2030 = _1515 + _2028;
                    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2034 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2032;
                    float _2036 = 1.0 / _2034;
                    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2040 = _2038 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2044 = _2042 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2048 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2052 = _2050 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2058 = _2030 * _2036;
                    float _2060 = precise::clamp(_2058, 0.0, 1.0);
                    float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2066 = fma(_2060, _2040, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2068 = fma(_2060, _2064, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2070 = fma(_2060, _2044, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2072 = fma(_2060, _2048, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2074 = fma(_2060, _2052, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2076 = fma(_2060, _2056, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1874 = _2068;
                    _1860 = _2074;
                    _1930 = _2066;
                    _1798 = _2072;
                    _1894 = _2070;
                    _1922 = _2076;
                    _1992 = true;
                }
                else
                {
                    _1874 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1860 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1930 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1894 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1992 = false;
    float _2078 = _1874;
    float _2080 = _1860;
    float _2082 = _1930;
    float _2084 = _1798;
    float _2086 = _1894;
    float _2088 = _1922;
    float _2090 = fma(_1195, -0.5, 0.5);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = -_2078;
    float _2096 = _2094 + _2080;
    float _2098 = -_2082;
    float _2100 = _2098 + _2084;
    float _2102 = -_2086;
    float _2104 = _2102 + _2088;
    bool _2106 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2108 = fma(_2092, _2096, _2078);
    float _2110 = fma(_2092, _2100, _2082);
    float _2112 = fma(_2092, _2104, _2086);
    float _2114 = _2108 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _2116 = fma(_2110, 0.298911988735198974609375, _2114);
    float _2118 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2120 = fma(_2112, 0.114477999508380889892578125, _2116);
    out.m_51.x = _2118;
    float _2122 = -_2120;
    float _2124 = _2110 + _2122;
    float _2126 = -_2120;
    float _2128 = _2108 + _2126;
    float _2130 = -_2120;
    float _2132 = _2112 + _2130;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    float _2138 = fma(_2132, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    out.m_90.x = _2134;
    out.m_90.y = _2136;
    out.m_90.z = _2138;
    if (!_2106)
    {
        return out;
    }
    float _2140 = -_1377;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2144 = -_1379;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2148 = -_1381;
    float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2152 = _2142 * _2142;
    float _2154 = fma(_2146, _2146, _2152);
    float _2156 = fma(_2150, _2150, _2154);
    float _2158 = sqrt(_2156);
    float _2160 = rsqrt(_2156);
    float _2162 = -_2158;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2166 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2168 = precise::clamp(_2166, 0.0, 1.0);
    float _2170 = _2146 * _2160;
    float _2172 = _2142 * _2160;
    float _2174 = abs(_2168);
    float _2176 = log2(_2174);
    float _2178 = _2150 * _2160;
    float _2180 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2182 = _1195 * _2172;
    float _2184 = -_2172;
    float _2186 = -_2180;
    float _2188 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2186);
    float _2190 = fma(_1193, _2170, _2182);
    float _2192 = -_2178;
    float _2194 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2188);
    float _2196 = fma(_1197, _2178, _2190);
    float _2198 = precise::clamp(_2196, 0.0, 1.0);
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2202 = _2194 + _2200;
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2206 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = exp2(_2204);
    float _2212 = _2210 * _2208;
    float _2214 = _2198 * _2212;
    float _2216 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2218 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _2216;
    out.m_88.y = _2218;
    out.m_88.z = _2220;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1992 = false;
    bool _1247 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2277 = as_type<float>(_125);
        out.gl_Position.z = _2277;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2346 = as_type<float>(_163);
        out.gl_Position.z = _2346;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _173);
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _183);
    bool _191 = !_171;
    float _209;
    if (!_191)
    {
        float _193 = in.m_57.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_109);
        float _215 = 1.0 / _213;
        float _217 = _143 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_57.x;
    float _223 = in.m_57.y;
    float _225 = in.m_57.z;
    float _227 = in.m_57.w;
    float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _231 = log2(_229);
    float _233 = as_type<float>(int(gl_VertexIndex));
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _245 = 1.0 + _243;
    float _247 = 1.0 / _237;
    bool _249 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _257 = _253 || _255;
    float _259 = _231 * _143;
    float _261 = 1.0 / _245;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _263;
    float _267 = _225 * 2.0;
    float _269 = _221 * 2.0;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _271;
    float _275 = exp2(_259);
    int _277 = as_type<int>(_233) & 1;
    bool _279 = _277 != 0;
    int _281 = as_type<int>(_233) & 2;
    bool _283 = _281 != 0;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _287 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _289 = isnan(0.0);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _295 = _291 || _293;
    float _297 = floor(_267);
    float _299 = 1.0 / _241;
    float _301 = -_275;
    float _303 = _301 + 1.0;
    float _305 = _295 ? _303 : 0.0;
    float _307 = floor(_269);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    bool _313 = _297 > 0.0;
    if (_257)
    {
        float _315 = _305 * _261;
        _147 = _315;
    }
    float _317 = _147;
    bool _319 = _297 >= 0.0;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan(0.0);
    bool _327 = _323 || _325;
    float _329 = _223 * 2.0;
    bool _331 = _227 > 0.5;
    float _333 = _225 + _221;
    float _335 = 1.0 / _311;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _219 + _337;
    int _341 = _327 ? 0 : 1;
    float _343 = _333 + (-1.0);
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _355 = _353 != 0;
    float _357 = _339 * _247;
    int _359 = ~_341;
    int _361 = _359 + 1;
    int _363 = _361 + 1;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _219 + _365;
    int _369 = _363;
    if (!_313)
    {
        int _371 = ~_341;
        int _373 = _371 + 1;
        _369 = _373;
    }
    int _375 = _369;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = _219 + _377;
    bool _381 = _307 >= 0.0;
    bool _383 = isnan(_307);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = floor(_329);
    float _393 = _367 * _299;
    float _395 = _223 + _221;
    int _397 = _389 ? 0 : 1;
    float _399 = _379 * _335;
    bool _401 = _307 > 0.0;
    float _403 = _223 + _225;
    float _405 = _395 + (-1.0);
    float _407 = _403 + (-1.0);
    float _409 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    float _415 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    int _421 = ~_397;
    int _423 = _421 + 1;
    int _425 = _423 + 1;
    float _427 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _429 = _425;
    if (!_401)
    {
        int _431 = ~_397;
        int _433 = _431 + 1;
        _429 = _433;
    }
    int _435 = _429;
    float _437 = fma(_413, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _439 = !_347;
    int _441 = _439 ? 0 : 1;
    float _443 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _445 = _391 > 0.0;
    float _447 = _187 * _187;
    bool _449 = _391 >= 0.0;
    bool _451 = isnan(_391);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _463 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _465 = isnan(_219);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_185, _185, _447);
    bool _477 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _479 = isnan(_219);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _493 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _495 = isnan(_219);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_473;
    float _507 = _505 + 1.0;
    float _509 = fma(_189, _189, _475);
    float _511 = -_487;
    float _513 = _511 + 1.0;
    int _515 = abs(_441);
    float _517 = _487 * _507;
    float _519 = -_503;
    float _521 = _519 + 1.0;
    float _523 = _503 * _513;
    float _525 = fma(_461, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = in.m_62.x;
    float _529 = in.m_62.y;
    float _531 = in.m_62.z;
    float _533 = fma(_491, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _535 = !_351;
    int _537 = _535 ? 0 : 1;
    float _539 = rsqrt(_509);
    float _541 = fma(_265, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = fma(_273, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _545 = abs(_537);
    float _547 = float(_375);
    float _549 = float(_515);
    bool _551 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_219);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = float(_545);
    int _565 = _457 ? 0 : 1;
    float _567 = _561 * _521;
    float _569 = float(_435);
    float _571 = _549 * _547;
    int _573 = ~_565;
    int _575 = _573 + 1;
    int _577 = _575 + 1;
    float _579 = _189 * _539;
    int _581 = _577;
    if (!_445)
    {
        int _583 = ~_565;
        int _585 = _583 + 1;
        _581 = _585;
    }
    int _587 = _581;
    float _589 = _571 * (-2.0);
    float _591 = _563 * _569;
    float _593 = _187 * _539;
    float _595 = _437 * _567;
    float _597 = _443 * _567;
    float _599 = _185 * _539;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _603 = _579 * _601;
    float _605 = _221 + (-0.5);
    float _607 = fma(_589, _527, _527);
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _611 = _593 * _609;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _615 = -_603;
    float _617 = fma(_599, _613, _615);
    bool _619 = _221 > 0.5;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[196].x, _607);
    bool _623 = !_355;
    int _625 = _623 ? 0 : 1;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _629 = -_611;
    float _631 = fma(_579, _627, _629);
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _635 = _599 * _633;
    float _637 = _617 * _617;
    float _639 = _591 * (-2.0);
    float _641 = fma(_409, _589, _409);
    int _643 = abs(_625);
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _647 = -_635;
    float _649 = fma(_593, _645, _647);
    float _651 = fma(_631, _631, _637);
    float _653 = fma(_415, _639, _415);
    float _655 = fma(_641, _317, _621);
    float _657 = fma(_639, _529, _529);
    float _659 = fma(_649, _649, _651);
    float _661 = -_561;
    float _663 = _661 + 1.0;
    float _665 = _655 * 0.15915493667125701904296875;
    float _667 = _223 + (-0.5);
    float _669 = float(_643);
    float _671 = rsqrt(_659);
    float _673 = float(_587);
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _595);
    float _677 = in.m_48.x;
    float _679 = in.m_48.y;
    float _681 = in.m_48.z;
    bool _683 = _223 > 0.5;
    float _685 = _669 * _673;
    float _687 = fma(_525, _523, _675);
    float _689 = _665 * 6.283185482025146484375;
    float _691 = sin(_689);
    float _693 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _597);
    float _697 = fma(_541, _517, _687);
    float _699 = in.m_64.x;
    float _701 = in.m_64.y;
    float _703 = _225 + (-0.5);
    float _705 = fma(_533, _523, _695);
    float _707 = _685 * (-2.0);
    float _709 = fma(_653, _317, _693);
    float _711 = _665 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = fma(_543, _517, _705);
    float _717 = fma(_707, _531, _531);
    float _719 = fma(_427, _707, _427);
    float _721 = _709 * 0.15915493667125701904296875;
    float _723 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[146].y, _715);
    float _725 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].z, _717);
    float _727 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[146].x, _697);
    float _729 = _721 * 6.283185482025146484375;
    float _731 = sin(_729);
    float _733 = fma(_719, _317, _725);
    float _735 = _631 * _671;
    float _737 = _617 * _671;
    bool _739 = !_279;
    float _741 = _739 ? (-0.5) : 0.5;
    float _743 = _733 * 0.15915493667125701904296875;
    float _745 = _649 * _671;
    float _747 = _721 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = _679 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _741);
    float _755 = _723 * _701;
    float _757 = _727 * _699;
    float _759 = _679 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _761 = _679 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _763 = !_283;
    float _765 = _763 ? (-0.5) : 0.5;
    float _767 = _743 * 6.283185482025146484375;
    float _769 = cos(_767);
    float _771 = _757 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = _691 * _731;
    float _775 = _713 * _731;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _765);
    float _779 = _771 * _753;
    float _781 = _599 * _737;
    float _783 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _785 = _743 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _691 * _749;
    float _791 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[4].x, _751);
    float _793 = _783 * _777;
    float _795 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[5].x, _759);
    float _797 = fma(_677, (*spvDescriptorSet0.vp_c10)._m0[6].x, _761);
    float _799 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[4].z, _791);
    float _801 = _579 * _735;
    float _803 = _691 * _769;
    float _805 = _713 * _749;
    float _807 = _713 * _769;
    float _809 = _749 * _769;
    float _811 = _731 * _769;
    float _813 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[6].z, _797);
    float _815 = _807 * _599;
    float _817 = _807 * _579;
    float _819 = fma(_787, _805, _773);
    float _821 = -_775;
    float _823 = fma(_787, _789, _821);
    float _825 = fma(_787, _773, _805);
    float _827 = -_789;
    float _829 = fma(_787, _775, _827);
    float _831 = _593 * _745;
    float _833 = -_781;
    float _835 = fma(_593, _735, _833);
    float _837 = -_787;
    float _839 = fma(_837, _735, _815);
    float _841 = _819 * _599;
    float _843 = _829 * _599;
    float _845 = _829 * _579;
    float _847 = -_831;
    float _849 = fma(_579, _737, _847);
    float _851 = -_787;
    float _853 = fma(_851, _745, _817);
    float _855 = _819 * _579;
    float _857 = fma(_809, _735, _841);
    float _859 = fma(_811, _735, _843);
    float _861 = fma(_811, _745, _845);
    float _863 = fma(_809, _745, _855);
    float _865 = fma(_803, _849, _839);
    float _867 = fma(_803, _835, _853);
    float _869 = fma(_823, _849, _857);
    float _871 = fma(_825, _849, _859);
    float _873 = fma(_825, _835, _861);
    float _875 = fma(_823, _835, _863);
    float _877 = _793 * _865;
    float _879 = _793 * _867;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = _799 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _885 = fma(_779, _869, _877);
    float _887 = fma(_779, _875, _879);
    float _889 = _813 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = fma(_881, _871, _885);
    float _893 = fma(_881, _873, _887);
    float _895 = _807 * _593;
    float _897 = _883 + _891;
    float _899 = _889 + _893;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _905 = _897 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _909 = _899 + _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _913 = _285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _905 * _905;
    float _917 = _909 * _909;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _921 = _819 * _593;
    float _923 = -_801;
    float _925 = fma(_599, _745, _923);
    float _927 = _915 + _917;
    float _929 = -_787;
    float _931 = fma(_929, _737, _895);
    float _933 = fma(_809, _737, _921);
    float _935 = _829 * _593;
    float _937 = sqrt(_927);
    float _939 = fma(_803, _925, _931);
    float _941 = fma(_823, _925, _933);
    float _943 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _793 * _939;
    float _949 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[5].z, _795);
    float _951 = fma(_811, _737, _935);
    out.m_66.x = _943;
    out.m_66.y = _945;
    out.m_66.z = _913;
    out.m_66.w = _919;
    float _953 = fma(_779, _941, _947);
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    float _959 = fma(_825, _925, _951);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _963 = _961 != 0;
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _969 = _967 != 0;
    float _971 = fma(_881, _959, _953);
    bool _973 = _937 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = -_765;
    int _977 = _683 ? as_type<int>(_975) : as_type<int>(_765);
    bool _979 = _225 > 0.5;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = -_765;
    int _985 = _331 ? as_type<int>(_983) : as_type<int>(_765);
    float _987 = _949 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _991 = _989 != 0;
    float _993 = _987 + _971;
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _997 = _779;
    float _999 = _915;
    float _1001 = _917;
    float _1003 = _897;
    float _1005 = _899;
    float _1007 = _873;
    float _1009 = _941;
    float _1011 = _599;
    if (!_973)
    {
        _997 = _993;
    }
    float _1013 = _997;
    bool _1015 = !_973;
    float _1017 = _1013;
    if (!_1015)
    {
        float _1019 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1023 = _937 + _1021;
        float _1025 = rsqrt(_927);
        float _1027 = _1023 * _1019;
        float _1029 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1031 = _1027 * 0.15915493667125701904296875;
        float _1033 = _1031 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = _1031 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = fma(_1035, _1029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1043 = _1025 * _1041;
        float _1045 = fma(_905, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1047 = _1039 + (-1.0);
        float _1049 = fma(_909, _1043, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1053 = _1045 + _1051;
        float _1055 = _1047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1059 = _1049 + _1057;
        float _1061 = _1053 * _1053;
        float _1063 = fma(_993, _1039, _1055);
        float _1065 = _1059 * _1059;
        _1017 = _1063;
        _999 = _1061;
        _1001 = _1065;
        _1003 = _1045;
        _1005 = _1049;
    }
    float _1067 = _1017;
    float _1069 = _999;
    float _1071 = _1001;
    float _1073 = _1003;
    float _1075 = _1005;
    float _1077 = _765 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1081 = _1067 + _1079;
    float _1083 = -_741;
    int _1085 = _619 ? as_type<int>(_1083) : as_type<int>(_741);
    float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1089 = -_741;
    int _1091 = _979 ? as_type<int>(_1089) : as_type<int>(_741);
    float _1093 = fma(_1077, _1077, 1.0);
    float _1095 = fma(_1081, _1081, _1069);
    bool _1097 = !_957;
    float _1099 = _1097 ? _741 : as_type<float>(_1085);
    float _1101 = _741 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1103 = !_969;
    float _1105 = _1103 ? _741 : as_type<float>(_1091);
    float _1107 = _865 * _1077;
    float _1109 = rsqrt(_1093);
    bool _1111 = !_963;
    float _1113 = _1111 ? _765 : as_type<float>(_977);
    float _1115 = _939 * _1077;
    bool _1117 = !_991;
    float _1119 = _1117 ? _765 : as_type<float>(_985);
    float _1121 = _867 * _1077;
    float _1123 = _1099 + 0.5;
    float _1125 = -_1113;
    float _1127 = _1125 + 0.5;
    float _1129 = fma(_869, _1101, _1107);
    float _1131 = fma(_941, _1101, _1115);
    float _1133 = fma(_875, _1101, _1121);
    float _1135 = -_1119;
    float _1137 = _1135 + 0.5;
    float _1139 = _1105 + 0.5;
    float _1141 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = _1077 * _1109;
    float _1151 = _1141 * _965;
    float _1153 = _1095 + _1071;
    float _1155 = _1143 * _981;
    float _1157 = _1145 * _1087;
    float _1159 = _1147 * _995;
    float _1161 = -_1149;
    float _1163 = _959 * _1161;
    float _1165 = -_1149;
    float _1167 = _871 * _1165;
    float _1169 = sqrt(_1153);
    float _1171 = fma(_939, _1109, _1163);
    float _1173 = fma(_865, _1109, _1167);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1177 = -_1149;
    float _1179 = _873 * _1177;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1185 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = fma(_867, _1109, _1179);
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _871 + _1129;
    float _1195 = _959 + _1131;
    float _1197 = _873 + _1133;
    out.m_68.x = _1151;
    out.m_68.y = _1155;
    out.m_68.z = _1159;
    out.m_68.w = _1157;
    bool _1199 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1201 = isnan(_1169);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1207 = _1203 || _1205;
    out.m_70.x = _1185;
    out.m_70.y = _1189;
    out.m_70.z = _1191;
    out.m_72.x = _869;
    out.m_72.y = _941;
    out.m_72.z = _875;
    out.m_74.x = _1173;
    out.m_74.y = _1171;
    out.m_74.z = _1187;
    float _1209 = _1185;
    float _1211 = _1191;
    if (!_1207)
    {
        _1007 = 1.0;
    }
    float _1213 = _1007;
    out.m_76.x = _1193;
    out.m_76.y = _1195;
    out.m_76.z = _1197;
    bool _1215 = !_1207;
    float _1217 = _1213;
    if (!_1215)
    {
        bool _1219 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1221 = isnan(_1169);
        bool _1223 = _1219 || _1221;
        bool _1225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1227 = _1223 || _1225;
        if (!_1227)
        {
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1231 = _1169 + _1229;
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1239 = _1237 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1241 = 1.0 / _1235;
            float _1243 = _1231 * _1241;
            float _1245 = fma(_1243, _1239, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1217 = _1245;
            _1009 = _1241;
            _1247 = true;
        }
        else
        {
            bool _1249 = _1169 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1251 = isnan(_1169);
            bool _1253 = _1249 || _1251;
            bool _1255 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1257 = _1253 || _1255;
            if (!_1257)
            {
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1261 = _1169 + _1259;
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1263 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1271 = 1.0 / _1265;
                float _1273 = _1261 * _1271;
                float _1275 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1217 = _1275;
                _1009 = _1271;
                _1247 = true;
            }
            else
            {
                _1217 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1247 = false;
    float _1277 = _1217;
    float _1279 = _1009;
    float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1283 = _1067 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1287 = _1073 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1291 = _1075 + _1289;
    float _1293 = fma(_1283, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1295 = fma(_1287, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1297 = fma(_1291, _1277, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1299 = -_987;
    float _1301 = _1299 + _1293;
    float _1303 = -_883;
    float _1305 = _1303 + _1295;
    float _1307 = -_889;
    float _1309 = _1307 + _1297;
    float _1311 = _1301 * _1301;
    float _1313 = fma(_1305, _1305, _1311);
    float _1315 = fma(_1309, _1309, _1313);
    float _1317 = sqrt(_1315);
    bool _1319 = _1317 > 0.0;
    float _1321 = _1317;
    float _1323 = _1279;
    float _1325 = _1297;
    if (!_1319)
    {
        _1321 = _1295;
    }
    float _1327 = _1321;
    float _1329 = _1327;
    if (!_1319)
    {
        _1323 = _1293;
    }
    float _1331 = _1323;
    bool _1333 = !_1319;
    float _1335 = _1331;
    float _1337 = _1331;
    if (!_1333)
    {
        float _1339 = sqrt(_509);
        float _1341 = rsqrt(_1315);
        bool _1343 = _1339 > 0.0;
        float _1345 = _1305 * _1341;
        float _1347 = _1301 * _1341;
        float _1349 = _1309 * _1341;
        float _1351 = _1341;
        _1209 = _1347;
        if (!_1343)
        {
            _1351 = _1295;
        }
        float _1353 = _1351;
        _1329 = _1353;
        if (!_1343)
        {
            _1335 = _1293;
        }
        float _1355 = _1335;
        bool _1357 = !_1343;
        _1337 = _1355;
        if (!_1357)
        {
            float _1359 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1361 = _593 * _1347;
            float _1363 = fma(_599, _1345, _1361);
            float _1365 = fma(_579, _1349, _1363);
            float _1367 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1369 = _1365 * _1367;
            float _1371 = fma(_185, _1369, _1295);
            float _1373 = fma(_187, _1369, _1293);
            float _1375 = fma(_189, _1369, _1297);
            _1337 = _1373;
            _1329 = _1371;
            _1325 = _1375;
            _1011 = _1369;
        }
    }
    float _1377 = _1337;
    float _1379 = _1329;
    float _1381 = _1325;
    float _1383 = _1209;
    float _1385 = _1011;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1377 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1393 = _1379 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1397 = _1381 + _1395;
    float _1399 = _1389 * _1389;
    float _1401 = fma(_1393, _1393, _1399);
    float _1403 = fma(_1397, _1397, _1401);
    float _1405 = rsqrt(_1403);
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1409 = _1393 * _1407;
    float _1411 = _1397 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 + _1415;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = _1419 + _1423;
    float _1427 = _1397;
    float _1429 = _1383;
    float _1431 = _1425;
    float _1433 = _1389;
    float _1435 = _1385;
    if (_1421)
    {
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1437;
    }
    float _1439 = _1427;
    if (_1421)
    {
        float _1441 = rsqrt(_1417);
        _1429 = _1441;
    }
    float _1443 = _1429;
    float _1445 = _1443;
    if (_1421)
    {
        float _1447 = _1425 * _1439;
        _1431 = _1447;
    }
    float _1449 = _1431;
    if (_1421)
    {
        float _1451 = _1449 * 0.15915493667125701904296875;
        _1211 = _1451;
    }
    float _1453 = _1211;
    float _1455 = _1399;
    if (_1421)
    {
        float _1457 = _1453 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        _1455 = _1459;
    }
    float _1461 = _1455;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1465 = precise::max(0.0, _1463);
    float _1467 = _1405;
    float _1469 = _1463;
    float _1471 = _1465;
    if (_1421)
    {
        float _1473 = _1453 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        _1467 = _1475;
    }
    float _1477 = _1467;
    float _1479 = -_1407;
    float _1481 = -_1465;
    float _1483 = fma(_1389, _1479, _1481);
    float _1485 = _1483;
    if (_1421)
    {
        float _1487 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1469 = _1487;
    }
    float _1489 = _1469;
    float _1491 = _1489;
    float _1493 = _1461;
    if (_1421)
    {
        float _1495 = fma(_1461, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    if (!_1421)
    {
        _1493 = _1411;
    }
    float _1499 = _1493;
    float _1501 = _1499;
    if (_1421)
    {
        float _1503 = _1477 + (-1.0);
        _1433 = _1503;
    }
    float _1505 = _1433;
    float _1507 = _1505;
    if (_1421)
    {
        float _1509 = _1443 * _1497;
        _1435 = _1509;
    }
    float _1511 = _1435;
    if (!_1421)
    {
        _1445 = _1409;
    }
    float _1513 = _1445;
    float _1515 = sqrt(_1403);
    float _1517 = _1513;
    if (_1421)
    {
        float _1519 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1519;
    }
    float _1521 = _1471;
    float _1523 = _1521;
    if (_1421)
    {
        float _1525 = _1409 * _1511;
        _1517 = _1525;
    }
    float _1527 = _1517;
    if (_1421)
    {
        float _1529 = _1411 * _1511;
        _1501 = _1529;
    }
    float _1531 = _1501;
    if (!_1421)
    {
        _1507 = _1415;
    }
    float _1533 = _1507;
    float _1535 = _1533;
    if (_1421)
    {
        float _1537 = fma(_1483, _1477, _1521);
        _1485 = _1537;
    }
    float _1539 = _1485;
    if (!_1421)
    {
        _1523 = _1413;
    }
    float _1541 = _1523;
    float _1543 = _1541;
    if (_1421)
    {
        float _1545 = _1527 * _1527;
        _1543 = _1545;
    }
    float _1547 = _1543;
    if (_1421)
    {
        float _1549 = _1531 * _1531;
        _1535 = _1549;
    }
    float _1551 = _1535;
    float _1553 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1555 = fma(_1539, _1539, _1547);
    float _1557 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1553);
    float _1561 = _1555 + _1551;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1565 = fma(_1515, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1563);
    float _1567 = precise::clamp(_1565, 0.0, 1.0);
    float _1569 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = rsqrt(_1561);
    float _1573 = -_1567;
    float _1575 = _1573 + 1.0;
    float _1577 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1579 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1583 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1587 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1589 = abs(_1575);
    float _1591 = log2(_1589);
    float _1593 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1595 = -_1585;
    float _1597 = fma(_1595, _1581, 1.0);
    float _1599 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1601 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1593);
    float _1603 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1599);
    float _1605 = _1571 * _1527;
    float _1607 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1609 = _1571 * _1539;
    float _1611 = _1571 * _1531;
    float _1613 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1615 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1603);
    float _1617 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1619 = floor(_1579);
    float _1621 = -_1613;
    float _1623 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1621);
    float _1625 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1627 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1629 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1631 = -_1611;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1623);
    float _1635 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1583);
    float _1637 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1627);
    float _1639 = floor(_1587);
    float _1641 = fma(_1633, -0.5, 0.5);
    float _1643 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1645 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1637);
    float _1647 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1645);
    float _1649 = exp2(_1629);
    float _1651 = -_1619;
    float _1653 = _1579 + _1651;
    float _1655 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1657 = fma(_1633, 0.5, 0.5);
    float _1659 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1661 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1655);
    float _1663 = log2(_1597);
    float _1665 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1659);
    float _1667 = _1609 + 1.0;
    float _1669 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1661);
    float _1671 = -_1639;
    float _1673 = _1587 + _1671;
    float _1675 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1665);
    float _1677 = fma(_1657, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1679 = 1.0 / _1647;
    float _1681 = fma(_1657, _1677, -0.212114393711090087890625);
    float _1683 = sqrt(_1641);
    float _1685 = _1663 * 0.693147182464599609375;
    float2 _4794 = float2(_1653, _1673);
    float _1687 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4794, float2(0.0), isnan(_4794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4794, float2(0.0), isnan(_4794)), level(0.0)).x;
    float _1689 = fma(_1657, _1681, 1.570728778839111328125);
    float _1691 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1693 = -_1609;
    float _1695 = fma(_1649, _1667, _1693);
    float _1697 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1669);
    float _1699 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1675);
    float _1701 = fma(_1695, 0.5, 0.5);
    float _1703 = _1697 * _1679;
    float _1705 = _1699 * _1679;
    float _1707 = _1683 * 0.636619746685028076171875;
    float _1709 = fma(_1703, 0.5, 0.5);
    float _1711 = fma(_1705, -0.5, 0.5);
    float _1713 = -_1689;
    float _1715 = fma(_1707, _1713, 1.0);
    float3 _4849 = float3(_1709, _1711, _1691);
    float _1717 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4849, float3(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4849, float3(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1709, _1711, _1691);
    float4 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).xyzw;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = _1720.w;
    float2 _4876 = float2(_1715, _1701);
    float3 _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4876, float2(0.0), isnan(_4876)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4876, float2(0.0), isnan(_4876)), level(0.0)).xyz;
    float _1734 = _1732.x;
    float _1736 = _1732.y;
    float _1738 = _1732.z;
    float _1740 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1742 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1744 = _1617 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _1379;
    out.m_78.y = _1377;
    out.m_78.z = _1381;
    float _1746 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1740);
    float _1748 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1742);
    float _1750 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1744);
    bool _1752 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1754 = isnan(_1515);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1760 = _1756 || _1758;
    float _1762 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1746);
    float _1764 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1748);
    float _1766 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1750);
    float _1768 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1770 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1772 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1766);
    float _1774 = 1.0 / _1768;
    float _1776 = _1770 + _1768;
    out.gl_Position.x = _1697;
    out.gl_Position.y = _1699;
    out.gl_Position.z = _1772;
    out.gl_Position.w = _1647;
    float _1778 = _1776 * _1774;
    float _1780 = _1778 * 0.5;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1784 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1782);
    float _1786 = _1699;
    float _1788 = _1697;
    float _1790 = _1647;
    float _1792 = _1772;
    if (!_1760)
    {
        _1786 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1794 = _1786;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1760)
    {
        _1788 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1800 = _1788;
    float _1802 = 1.0 / _1784;
    float _1804 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1806 = exp2(_1804);
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1810 = _1802 * _1808;
    bool _1812 = _1810 <= 8000.0;
    bool _1814 = isnan(_1810);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan(8000.0);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = abs(_1810);
    float _1826 = log2(_1824);
    float _1828 = -_1806;
    float _1830 = _1828 + 1.0;
    float _1832 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1834 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1836 = exp2(_1834);
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1840 = precise::clamp(_1838, 0.0, 1.0);
    float _1842 = in.m_80.x;
    float _1844 = fma(_1840, -2.0, 3.0);
    float _1846 = _1840 * _1840;
    float _1848 = _1846 * _1844;
    float _1850 = -_1848;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1848);
    float _1856 = _1772 + _1647;
    float _1858 = _1800;
    float _1860 = _1800;
    if (!_1760)
    {
        _1790 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1862 = _1790;
    float _1864 = _1822 * _1854;
    float _1866 = _1856 * 0.5;
    float _1868 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1872 = _1862;
    float _1874 = _1862;
    if (!_1760)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1876 = _1792;
    out.m_82.z = _1866;
    out.m_82.w = _1647;
    float _1878 = -_1687;
    float _1880 = _1878 + 1.0;
    float _1882 = _1880 * _1868;
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = -_1884;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1890 = _1722;
    float _1892 = _1876;
    float _1894 = _1876;
    if (!_1760)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1896 = _1870;
    float _1898 = _1888 * _1842;
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1902 = _1832 * _1717;
    float _1904 = -_1832;
    float _1906 = _1904 + 1.0;
    out.m_84.x = _1900;
    float _1908 = _1728 * _1902;
    float _1910 = _1738 * _1902;
    float _1912 = _1728 * _1906;
    float _1914 = fma(_1734, _1908, _1722);
    float _1916 = fma(_1736, _1908, _1724);
    float _1918 = fma(_1728, _1910, _1726);
    float _1920 = _1896;
    float _1922 = _1896;
    if (!_1760)
    {
        _1890 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1924 = _1890;
    out.m_86.x = _1914;
    out.m_86.y = _1916;
    out.m_86.z = _1918;
    out.m_86.w = _1912;
    bool _1926 = !_1760;
    float _1928 = _1924;
    float _1930 = _1924;
    if (!_1926)
    {
        bool _1932 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1934 = isnan(_1515);
        bool _1936 = _1932 || _1934;
        bool _1938 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1940 = _1936 || _1938;
        if (!_1940)
        {
            float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1944 = _1515 + _1942;
            float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1948 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1946;
            float _1950 = 1.0 / _1948;
            float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1972 = _1944 * _1950;
            float _1974 = precise::clamp(_1972, 0.0, 1.0);
            float _1976 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1978 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1980 = fma(_1974, _1954, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1982 = fma(_1974, _1978, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1984 = fma(_1974, _1958, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1986 = fma(_1974, _1962, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1988 = fma(_1974, _1966, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1990 = fma(_1974, _1970, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1874 = _1982;
            _1860 = _1988;
            _1930 = _1980;
            _1798 = _1986;
            _1894 = _1984;
            _1922 = _1990;
            _1992 = true;
        }
        else
        {
            bool _1994 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1996 = isnan(_1515);
            bool _1998 = _1994 || _1996;
            bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2002 = _1998 || _2000;
            if (!_2002)
            {
                _1928 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2004 = _1928;
            _1930 = _2004;
            if (!_2002)
            {
                _1872 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2006 = _1872;
            _1874 = _2006;
            if (!_2002)
            {
                _1892 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2008 = _1892;
            _1894 = _2008;
            if (!_2002)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2010 = _1796;
            _1798 = _2010;
            if (!_2002)
            {
                _1858 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2012 = _1858;
            _1860 = _2012;
            if (!_2002)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2014 = _1920;
            bool _2016 = !_2002;
            _1922 = _2014;
            if (!_2016)
            {
                bool _2018 = _1515 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2020 = isnan(_1515);
                bool _2022 = _2018 || _2020;
                bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2026 = _2022 || _2024;
                if (!_2026)
                {
                    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2030 = _1515 + _2028;
                    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2034 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2032;
                    float _2036 = 1.0 / _2034;
                    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2040 = _2038 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2044 = _2042 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2048 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2052 = _2050 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2058 = _2030 * _2036;
                    float _2060 = precise::clamp(_2058, 0.0, 1.0);
                    float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2066 = fma(_2060, _2040, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2068 = fma(_2060, _2064, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2070 = fma(_2060, _2044, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2072 = fma(_2060, _2048, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2074 = fma(_2060, _2052, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2076 = fma(_2060, _2056, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1874 = _2068;
                    _1860 = _2074;
                    _1930 = _2066;
                    _1798 = _2072;
                    _1894 = _2070;
                    _1922 = _2076;
                    _1992 = true;
                }
                else
                {
                    _1874 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1860 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1930 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1894 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1992 = false;
    float _2078 = _1874;
    float _2080 = _1860;
    float _2082 = _1930;
    float _2084 = _1798;
    float _2086 = _1894;
    float _2088 = _1922;
    float _2090 = fma(_1195, -0.5, 0.5);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = -_2078;
    float _2096 = _2094 + _2080;
    float _2098 = -_2082;
    float _2100 = _2098 + _2084;
    float _2102 = -_2086;
    float _2104 = _2102 + _2088;
    bool _2106 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2108 = fma(_2092, _2096, _2078);
    float _2110 = fma(_2092, _2100, _2082);
    float _2112 = fma(_2092, _2104, _2086);
    float _2114 = _2108 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _2116 = fma(_2110, 0.298911988735198974609375, _2114);
    float _2118 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2120 = fma(_2112, 0.114477999508380889892578125, _2116);
    out.m_51.x = _2118;
    float _2122 = -_2120;
    float _2124 = _2110 + _2122;
    float _2126 = -_2120;
    float _2128 = _2108 + _2126;
    float _2130 = -_2120;
    float _2132 = _2112 + _2130;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    float _2138 = fma(_2132, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2120);
    out.m_90.x = _2134;
    out.m_90.y = _2136;
    out.m_90.z = _2138;
    if (!_2106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2140 = -_1377;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2144 = -_1379;
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2148 = -_1381;
    float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2152 = _2142 * _2142;
    float _2154 = fma(_2146, _2146, _2152);
    float _2156 = fma(_2150, _2150, _2154);
    float _2158 = sqrt(_2156);
    float _2160 = rsqrt(_2156);
    float _2162 = -_2158;
    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2166 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2168 = precise::clamp(_2166, 0.0, 1.0);
    float _2170 = _2146 * _2160;
    float _2172 = _2142 * _2160;
    float _2174 = abs(_2168);
    float _2176 = log2(_2174);
    float _2178 = _2150 * _2160;
    float _2180 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2182 = _1195 * _2172;
    float _2184 = -_2172;
    float _2186 = -_2180;
    float _2188 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2186);
    float _2190 = fma(_1193, _2170, _2182);
    float _2192 = -_2178;
    float _2194 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2188);
    float _2196 = fma(_1197, _2178, _2190);
    float _2198 = precise::clamp(_2196, 0.0, 1.0);
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2202 = _2194 + _2200;
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2206 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = exp2(_2204);
    float _2212 = _2210 * _2208;
    float _2214 = _2198 * _2212;
    float _2216 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2218 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _2216;
    out.m_88.y = _2218;
    out.m_88.z = _2220;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

