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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2110 = false;
    bool _463 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2408 = as_type<float>(_121);
        out.gl_Position.z = _2408;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2477 = as_type<float>(_161);
        out.gl_Position.z = _2477;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _183;
    float _209;
    if (!_189)
    {
        float _193 = in.m_55.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_107);
        float _215 = 1.0 / _213;
        float _217 = _139 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_219);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = 1.0 / _239;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = _223 * _253;
    float _263 = -_235;
    float _265 = _263 + 1.0;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_257, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = _251 * _265;
    float _275 = fma(_269, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_251;
    float _279 = _277 + 1.0;
    float _281 = _271 * _273;
    float _283 = _275 * _273;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_259;
    float _311;
    if (!_293)
    {
        float _295 = in.m_55.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_107);
        float _317 = 1.0 / _315;
        float _319 = _139 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _343 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _345 = isnan(_321);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _357;
    float _361 = -_337;
    float _363 = _361 + 1.0;
    bool _365 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _367 = isnan(_321);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = _353 * _363;
    float _381 = -_353;
    float _383 = _381 + 1.0;
    float _385 = 1.0 / _341;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = _359 * _355;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _395 = _321 + _393;
    float _397 = -_375;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _395, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _405 = _321 + _403;
    float _407 = _337 * _399;
    float _409 = _389 * _385;
    float _411 = _401 * _379;
    float _413 = in.m_57.x;
    float _415 = in.m_57.y;
    float _417 = fma(_409, _405, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[115].x, _411);
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _423 = fma(_417, _407, _419);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _427 = _421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[117].x, _423);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _433 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _435 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _437 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _427;
    out.m_59.y = _433;
    out.m_59.z = _437;
    out.m_59.w = _435;
    float _439 = _291 * _415;
    float _441 = _289 * _413;
    bool _443 = !_377;
    float _461;
    if (!_443)
    {
        float _445 = in.m_55.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_107);
        float _467 = 1.0 / _465;
        float _469 = _139 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = in.m_55.x;
    float _475 = in.m_55.y;
    float _477 = in.m_55.z;
    float _479 = in.m_55.w;
    float _481 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _483 = log2(_481);
    float _485 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _487 = _483 * _139;
    float _489 = exp2(_487);
    float _491 = _477 * 2.0;
    float _493 = _473 * 2.0;
    float _495 = _475 * 2.0;
    float _497 = _475 + _473;
    float _499 = floor(_491);
    float _501 = _497 + (-1.0);
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _505 = floor(_493);
    float _507 = -_489;
    float _509 = _507 + 1.0;
    bool _511 = _499 > 0.0;
    float _513 = floor(_495);
    bool _515 = _499 >= 0.0;
    bool _517 = isnan(_499);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    int _525 = _523 ? 0 : 1;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _537 = _535 != 0;
    int _539 = ~_525;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    bool _545 = _505 > 0.0;
    int _547 = _543;
    if (!_511)
    {
        int _549 = ~_525;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    bool _555 = _505 >= 0.0;
    bool _557 = isnan(_505);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    bool _565 = !_529;
    int _567 = _565 ? 0 : 1;
    bool _569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _571 = isnan(1.0);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _577 = _573 || _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _581 = 1.0 + _579;
    bool _583 = _513 > 0.0;
    bool _585 = _513 >= 0.0;
    bool _587 = isnan(_513);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = 1.0 / _581;
    float _597 = in.m_61.x;
    float _599 = in.m_61.y;
    float _601 = in.m_61.z;
    int _603 = abs(_567);
    bool _605 = !_533;
    int _607 = _605 ? 0 : 1;
    int _609 = _563 ? 0 : 1;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    int _621 = abs(_607);
    float _623 = float(_603);
    float _625 = float(_553);
    int _627 = ~_609;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    int _633 = _631;
    if (!_545)
    {
        int _635 = ~_609;
        int _637 = _635 + 1;
        _633 = _637;
    }
    int _639 = _633;
    float _641 = _623 * _625;
    float _643 = _619 ? _509 : 0.0;
    int _645 = _593 ? 0 : 1;
    float _647 = float(_621);
    if (_577)
    {
        float _649 = _643 * _595;
        _143 = _649;
    }
    float _651 = _143;
    int _653 = ~_645;
    int _655 = _653 + 1;
    int _657 = _655 + 1;
    float _659 = float(_639);
    int _661 = _657;
    if (!_583)
    {
        int _663 = ~_645;
        int _665 = _663 + 1;
        _661 = _665;
    }
    int _667 = _661;
    float _669 = _641 * (-2.0);
    bool _671 = !_537;
    int _673 = _671 ? 0 : 1;
    float _675 = _647 * _659;
    float _677 = _473 + (-0.5);
    float _679 = float(_667);
    int _681 = abs(_673);
    float _683 = fma(_669, _597, _597);
    float _685 = fma(_503, _669, _503);
    float _687 = _475 + _477;
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].x, _683);
    float _691 = float(_681);
    float _693 = _687 + (-1.0);
    float _695 = fma(_685, _651, _689);
    float _697 = _675 * (-2.0);
    float _699 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _701 = _691 * _679;
    float _703 = _475 + (-0.5);
    float _705 = fma(_697, _599, _599);
    float _707 = fma(_699, _697, _699);
    float _709 = _477 + _473;
    float _711 = as_type<float>(int(gl_VertexIndex));
    float _713 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _705);
    float _715 = _709 + (-1.0);
    float _717 = _701 * (-2.0);
    float _719 = fma(_707, _651, _713);
    float _721 = _695 * 0.15915493667125701904296875;
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _725 = fma(_717, _601, _601);
    float _727 = _477 + (-0.5);
    float _729 = _719 * 0.15915493667125701904296875;
    float _731 = fma(_723, _717, _723);
    float _733 = _721 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _739 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _741 = fma(_731, _651, _737);
    float _743 = in.m_46.x;
    float _745 = in.m_46.y;
    float _747 = in.m_46.z;
    float _749 = _729 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _741 * 0.15915493667125701904296875;
    int _755 = as_type<int>(_711) & 1;
    bool _757 = _755 != 0;
    int _759 = as_type<int>(_711) & 2;
    bool _761 = _759 != 0;
    float _763 = _729 * 6.283185482025146484375;
    float _765 = cos(_763);
    bool _767 = !_757;
    float _769 = _767 ? (-0.5) : 0.5;
    bool _771 = !_761;
    float _773 = _771 ? (-0.5) : 0.5;
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _769);
    float _777 = _721 * 6.283185482025146484375;
    float _779 = sin(_777);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _773);
    float _783 = _735 * _751;
    float _785 = _739 * _781;
    float _787 = _753 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = _485 * _775;
    float _793 = _735 * _765;
    float _795 = _753 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _779 * _751;
    float _801 = _779 * _765;
    float _803 = _735 * _789;
    float _805 = _779 * _789;
    float _807 = _765 * _789;
    float _809 = _751 * _789;
    float _811 = _803 * _785;
    float _813 = _805 * _785;
    float _815 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _817 = fma(_797, _793, _799);
    float _819 = -_783;
    float _821 = fma(_797, _801, _819);
    float _823 = -_801;
    float _825 = fma(_797, _783, _823);
    float _827 = -_785;
    float _829 = _797 * _827;
    float _831 = fma(_817, _791, _811);
    float _833 = fma(_797, _799, _793);
    float _835 = fma(_821, _791, _813);
    float _837 = fma(_807, _791, _829);
    float _839 = fma(_825, _815, _831);
    float _841 = _745 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _843 = fma(_833, _815, _835);
    float _845 = fma(_809, _815, _837);
    float _847 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _849 = _745 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[6].x, _841);
    float _853 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _847);
    float _857 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _859 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _861 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _853);
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _855);
    float _865 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _869 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _861);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _875 = _745 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _879 = _867 + _871;
    float _881 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _885 = _873 + _877;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _889 = _879 + _887;
    float _891 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _893 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[5].z, _883);
    float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _897 = _885 + _895;
    float _899 = _889 * _889;
    float _901 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _891);
    float _903 = fma(_897, _897, _899);
    float _905 = _893 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = sqrt(_903);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _913 = _905 + _907;
    float _915 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _911);
    float _917 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    bool _919 = _909 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = _915;
    float _923 = _747;
    float _925 = _907;
    if (!_919)
    {
        _921 = _885;
    }
    float _927 = _921;
    float _929 = _927;
    if (!_919)
    {
        _923 = _879;
    }
    float _931 = _923;
    float _933 = _931;
    if (!_919)
    {
        _925 = _913;
    }
    float _935 = _925;
    bool _937 = !_919;
    float _939 = _935;
    if (!_937)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _943 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _945 = _909 + _943;
        float _947 = rsqrt(_903);
        float _949 = _945 * _941;
        float _951 = _913 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _949 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _953 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _957 + (-1.0);
        float _965 = fma(_961, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _967 = _963 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _969 = _947 * _965;
        float _971 = fma(_913, _957, _967);
        float _973 = fma(_897, _969, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _975 = fma(_889, _969, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _939 = _971;
        _929 = _973;
        _933 = _975;
    }
    float _977 = _939;
    float _979 = _929;
    float _981 = _933;
    float _983 = -_905;
    float _985 = _983 + _977;
    float _987 = -_873;
    float _989 = _987 + _979;
    float _991 = _917 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _993 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _995 = _985 * _985;
    float _997 = -_867;
    float _999 = _997 + _981;
    float _1001 = 1.0 / _991;
    float _1003 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _993);
    float _1005 = fma(_989, _989, _995);
    float _1007 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1003);
    float _1009 = fma(_999, _999, _1005);
    bool _1011 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1013 = isnan(0.5);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1019 = _1015 || _1017;
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = sqrt(_1009);
    bool _1025 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1027 = isnan(0.5);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1033 = _1029 || _1031;
    float _1035 = _1021 + _991;
    float _1037 = _1035 * _1001;
    float _1039 = _1037 * 0.5;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1043 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1041);
    float _1045 = 1.0 / _1043;
    bool _1047 = _1023 > 0.0;
    bool _1049 = !_1047;
    float _1051 = _977;
    float _1053 = _981;
    float _1055 = _979;
    float _1057 = _1023;
    float _1059 = _991;
    float _1061 = _1043;
    float _1063 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_1049)
    {
        float _1065 = _185 * _185;
        float _1067 = rsqrt(_1009);
        float _1069 = fma(_183, _183, _1065);
        float _1071 = fma(_187, _187, _1069);
        float _1073 = sqrt(_1071);
        float _1075 = _989 * _1067;
        float _1077 = _985 * _1067;
        float _1079 = _999 * _1067;
        bool _1081 = _1073 > 0.0;
        bool _1083 = !_1081;
        _1057 = _1067;
        _1061 = _1071;
        _1063 = _1073;
        if (!_1083)
        {
            float _1085 = rsqrt(_1071);
            float _1087 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1089 = _185 * _1085;
            float _1091 = _183 * _1085;
            float _1093 = _1077 * _1089;
            float _1095 = _187 * _1085;
            float _1097 = fma(_1075, _1091, _1093);
            float _1099 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1101 = fma(_1079, _1095, _1097);
            float _1103 = _1101 * _1099;
            float _1105 = fma(_183, _1103, _979);
            float _1107 = fma(_185, _1103, _977);
            float _1109 = fma(_187, _1103, _981);
            _1051 = _1107;
            _1053 = _1109;
            _1055 = _1105;
            _1057 = _1091;
            _1059 = _1087;
            _1061 = _1085;
            _1063 = _1103;
        }
    }
    float _1111 = _1051;
    float _1113 = _1053;
    float _1115 = _1055;
    float _1117 = _1057;
    float _1119 = _1059;
    float _1121 = _1061;
    float _1123 = _1063;
    float _1125 = _1117;
    float _1127 = _1115;
    float _1129 = _1113;
    float _1131 = _1121;
    float _1133 = _1123;
    float _1135 = _1119;
    if (_1033)
    {
        _191 = 1.0;
    }
    float _1137 = _191;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1141 = _1045 * _1139;
    float _1143 = _1137;
    if (_1019)
    {
        _1125 = _1111;
    }
    float _1145 = _1125;
    float _1147 = _1145;
    if (!_1019)
    {
        float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1151 = _905 + _1149;
        float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1155 = _873 + _1153;
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = -_905;
        float _1161 = _1159 + _1111;
        float _1163 = _1151 * _1151;
        float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1167 = _867 + _1165;
        float _1169 = -_867;
        float _1171 = _1169 + _1113;
        float _1173 = fma(_1155, _1155, _1163);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1177 = fma(_1167, _1167, _1173);
        float _1179 = sqrt(_1177);
        float _1181 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1183 = precise::min(_1179, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1185 = _1183 * _1175;
        float _1187 = -_873;
        float _1189 = _1187 + _1115;
        float _1191 = _1181 * _1185;
        float _1193 = fma(_1161, _1191, _905);
        float _1195 = fma(_1189, _1191, _873);
        float _1197 = fma(_1171, _1191, _867);
        _1147 = _1193;
        _1127 = _1195;
        _1129 = _1197;
        _1131 = _1179;
    }
    float _1199 = _1147;
    float _1201 = _1127;
    float _1203 = _1129;
    float _1205 = _1131;
    float _1207 = _1205;
    if (!_1033)
    {
        float _1209 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = _1211 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 0.15915493667125701904296875;
        float _1221 = _1211 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = 1.0 / _1217;
        float _1227 = _1219 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = _1223 * _1225;
        float _1233 = _1219 * 6.283185482025146484375;
        float _1235 = sin(_1233);
        float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1239 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1237;
        float _1241 = _1229 * _1231;
        float _1243 = 1.0 / _1239;
        float _1245 = 1.0 / _1241;
        float _1247 = _1235 * _1245;
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = fma(_1141, _1247, _1249);
        float _1253 = _1251 * _1243;
        float _1255 = precise::clamp(_1253, 0.0, 1.0);
        _1207 = _1243;
        _1133 = _1219;
        _1143 = _1255;
    }
    float _1257 = _1207;
    float _1259 = _1133;
    float _1261 = _1143;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1265 = _1199 + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1269 = _1201 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1273 = _1203 + _1271;
    float _1275 = _1265 * _1265;
    float _1277 = fma(_1269, _1269, _1275);
    float _1279 = fma(_1273, _1273, _1277);
    float _1281 = rsqrt(_1279);
    float _1283 = sqrt(_1279);
    float _1285 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1287 = _1269 * _1285;
    float _1289 = _1273 * _1285;
    float _1291 = _1287 * _1287;
    float _1293 = _1289 * _1289;
    float _1295 = _1291 + _1293;
    float _1297 = sqrt(_1295);
    bool _1299 = _1297 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = _1297 + _1301;
    float _1305 = _1281;
    float _1307 = _1259;
    float _1309 = _1303;
    float _1311 = _1265;
    if (_1299)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1305 = _1313;
    }
    float _1315 = _1305;
    if (_1299)
    {
        float _1317 = rsqrt(_1295);
        _1307 = _1317;
    }
    float _1319 = _1307;
    float _1321 = _1319;
    if (_1299)
    {
        float _1323 = _1303 * _1315;
        _1309 = _1323;
    }
    float _1325 = _1309;
    if (_1299)
    {
        float _1327 = _1325 * 0.15915493667125701904296875;
        _1135 = _1327;
    }
    float _1329 = _1135;
    float _1331 = _1273;
    if (_1299)
    {
        float _1333 = _1329 * 6.283185482025146484375;
        float _1335 = sin(_1333);
        _1331 = _1335;
    }
    float _1337 = _1331;
    float _1339 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1341 = precise::max(0.0, _1339);
    float _1343 = _1257;
    float _1345 = _1341;
    if (_1299)
    {
        float _1347 = _1329 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        _1343 = _1349;
    }
    float _1351 = _1343;
    float _1353 = -_1285;
    float _1355 = -_1341;
    float _1357 = fma(_1265, _1353, _1355);
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1299)
    {
        _1311 = _1289;
    }
    float _1361 = _1311;
    float _1363 = fma(_873, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1365 = _1361;
    if (_1299)
    {
        float _1367 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1373 = _1369;
    float _1375 = _1337;
    if (_1299)
    {
        float _1377 = fma(_1337, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1373 = _1377;
    }
    float _1379 = _1373;
    float _1381 = _1379;
    if (!_1299)
    {
        _1375 = _1357;
    }
    float _1383 = _1375;
    float _1385 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1371);
    float _1387 = _1383;
    float _1389 = _1351;
    if (_1299)
    {
        float _1391 = _1351 + (-1.0);
        _1359 = _1391;
    }
    float _1393 = _1359;
    float _1395 = 0.0;
    float _1397 = _1393;
    if (_1299)
    {
        float _1399 = _1319 * _1379;
        _1395 = _1399;
    }
    float _1401 = _1395;
    if (!_1299)
    {
        _1321 = _1287;
    }
    float _1403 = _1321;
    float _1405 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1385);
    float _1407 = _1403;
    if (_1299)
    {
        float _1409 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1397 = _1409;
    }
    float _1411 = _1397;
    if (_1299)
    {
        float _1413 = _1287 * _1401;
        _1407 = _1413;
    }
    float _1415 = _1407;
    if (!_1299)
    {
        _1381 = _1291;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1299)
    {
        float _1421 = _1289 * _1401;
        _1365 = _1421;
    }
    float _1423 = _1365;
    if (_1299)
    {
        float _1425 = fma(_1357, _1351, _1411);
        _1387 = _1425;
    }
    float _1427 = _1387;
    if (_1299)
    {
        float _1429 = _1415 * _1415;
        _1419 = _1429;
    }
    float _1431 = _1419;
    if (!_1299)
    {
        _1389 = _1293;
    }
    float _1433 = _1389;
    float _1435 = _1433;
    if (_1299)
    {
        float _1437 = _1423 * _1423;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1443 = fma(_1427, _1427, _1431);
    float _1445 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = _1443 + _1439;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = floor(_1363);
    float _1457 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1459 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1461 = -_1453;
    float _1463 = _1461 + 1.0;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1467 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1469 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1471 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1459);
    float _1473 = rsqrt(_1447);
    float _1475 = -_1467;
    float _1477 = fma(_1475, _1465, 1.0);
    float _1479 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1483 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1487 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1481);
    float _1489 = abs(_1463);
    float _1491 = log2(_1489);
    float _1493 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1485);
    float _1495 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1499 = _1473 * _1415;
    float _1501 = _1473 * _1427;
    float _1503 = _1473 * _1423;
    float _1505 = floor(_1457);
    float _1507 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1509 = -_1507;
    float _1511 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1509);
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1515 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1517 = log2(_1477);
    float _1519 = -_1503;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1511);
    float _1523 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1513);
    float _1525 = -_1455;
    float _1527 = _1363 + _1525;
    float _1529 = fma(_1521, -0.5, 0.5);
    float _1531 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1523);
    float _1533 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = exp2(_1515);
    float _1537 = fma(_1521, 0.5, 0.5);
    float _1539 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1531);
    float _1541 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1543 = -_1505;
    float _1545 = _1457 + _1543;
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1551 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1541);
    float _1553 = 1.0 / _1539;
    float _1555 = _1501 + 1.0;
    float _1557 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1559 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1551);
    float _1561 = _1517 * 0.693147182464599609375;
    float _1563 = fma(_1537, _1557, 1.570728778839111328125);
    float _1565 = sqrt(_1529);
    float _1567 = -_1501;
    float _1569 = fma(_1535, _1555, _1567);
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1549);
    float _1575 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1559);
    float _1577 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1579 = _1575 * _1553;
    float _1581 = _1565 * 0.636619746685028076171875;
    float _1583 = _1577 * _1553;
    float _1585 = fma(_1579, -0.5, 0.5);
    float _1587 = -_1563;
    float _1589 = fma(_1581, _1587, 1.0);
    float _1591 = fma(_1583, 0.5, 0.5);
    float _1593 = fma(_1569, 0.5, 0.5);
    float2 _4694 = float2(_1527, _1545);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4694, float2(0.0), isnan(_4694)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4694, float2(0.0), isnan(_4694)), level(0.0)).x;
    float3 _4705 = float3(_1591, _1585, _1571);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4705, float3(0.0), isnan(_4705)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4705, float3(0.0), isnan(_4705)), level(0.0)).x;
    float3 _4716 = float3(_1591, _1585, _1571);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4716, float3(0.0), isnan(_4716)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4716, float3(0.0), isnan(_4716)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _4732 = float2(_1589, _1593);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4732, float2(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4732, float2(0.0), isnan(_4732)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1622 = _803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1624 = _473 > 0.5;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1630 = _479 > 0.5;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1632;
    bool _1636 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1638 = isnan(_471);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = 1.0 / _1628;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1652 = _471 + _1650;
    bool _1654 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1656 = isnan(_471);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1662 = _1658 || _1660;
    float _1664 = float(_1662);
    out.m_66.x = _1201;
    out.m_66.y = _1199;
    out.m_66.z = _1203;
    float _1666 = -_1646;
    float _1668 = _1666 + 1.0;
    bool _1670 = _475 > 0.5;
    float _1672 = -_773;
    int _1674 = _1630 ? as_type<int>(_1672) : as_type<int>(_773);
    float _1676 = _1664 * _1668;
    float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1682 = _1680 != 0;
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1686 = _1684 != 0;
    float _1688 = _1634 * _1648;
    float _1690 = -_769;
    int _1692 = _1624 ? as_type<int>(_1690) : as_type<int>(_769);
    bool _1694 = _477 > 0.5;
    float _1696 = fma(_1688, _1652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = -_773;
    int _1700 = _1670 ? as_type<int>(_1698) : as_type<int>(_773);
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1706 = _1704 != 0;
    float _1708 = _1696 * _1676;
    float _1710 = -_1664;
    float _1712 = _1710 + 1.0;
    bool _1714 = !_1682;
    float _1716 = _1714 ? _773 : as_type<float>(_1700);
    bool _1718 = !_1686;
    float _1720 = _1718 ? _769 : as_type<float>(_1692);
    float _1722 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1708);
    float _1724 = -_769;
    int _1726 = _1694 ? as_type<int>(_1724) : as_type<int>(_769);
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1732 = _1730 != 0;
    float _1734 = -_1716;
    float _1736 = _1734 + 0.5;
    bool _1738 = !_1706;
    float _1740 = _1738 ? _769 : as_type<float>(_1726);
    float _1742 = _1720 + 0.5;
    bool _1744 = !_1732;
    float _1746 = _1744 ? _773 : as_type<float>(_1674);
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1750 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1722);
    float _1752 = _1740 + 0.5;
    float _1754 = abs(_1141);
    float _1756 = log2(_1754);
    float _1758 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1760 = -_1746;
    float _1762 = _1760 + 0.5;
    float _1764 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1766 = _1748 * _1678;
    float _1768 = _1758 * _1620;
    float _1770 = _1764 * _1702;
    float _1772 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1774 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1776 = _1772 * _1728;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1782 = _803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1786 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1794 = _803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_68.x = _1768;
    out.m_68.y = _1766;
    out.m_68.z = _1770;
    out.m_68.w = _1776;
    float _1796 = exp2(_1786);
    float _1798 = _769 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1800 = -_797;
    float _1802 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1794);
    out.m_70.x = _1788;
    out.m_70.y = _1790;
    out.m_70.z = _1792;
    out.m_70.w = _1774;
    bool _1804 = _1141 <= 8000.0;
    bool _1806 = isnan(_1141);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(8000.0);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    bool _1816 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1818 = isnan(_1283);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1824 = _1820 || _1822;
    float _1826 = -_797;
    float _1828 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1782);
    float _1830 = -_797;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1834 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1802);
    float _1836 = _817 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1838 = _773 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1840 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1842 = _817 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1844 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1846 = precise::clamp(_1844, 0.0, 1.0);
    float _1848 = fma(_1838, _1838, 1.0);
    float _1850 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1828);
    float _1852 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1832);
    float _1854 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1856 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1858 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1836);
    float _1860 = rsqrt(_1848);
    float _1862 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1840);
    float _1864 = _817 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1866 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1842);
    float _1868 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1858);
    float _1870 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1864);
    float _1872 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1866);
    float _1874 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1854);
    float _1876 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1856);
    float _1878 = fma(_1846, -2.0, 3.0);
    float _1880 = _1846 * _1846;
    float _1882 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1870);
    float _1884 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1886 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1862);
    float _1888 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1890 = _1838 * _1850;
    float _1892 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1894 = _1880 * _1878;
    float _1896 = _1838 * _1860;
    float _1898 = _1838 * _1834;
    float _1900 = fma(_1798, _1872, _1890);
    float _1902 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1892);
    float _1904 = -_1894;
    float _1906 = _1904 + 1.0;
    float _1908 = -_1884;
    float _1910 = _1896 * _1908;
    float _1912 = -_1886;
    float _1914 = _1896 * _1912;
    out.m_72.x = _1868;
    out.m_72.y = _1872;
    out.m_72.z = _1882;
    float _1916 = -_1888;
    float _1918 = _1896 * _1916;
    float _1920 = fma(_1798, _1868, _1898);
    float _1922 = fma(_1906, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1894);
    float _1924 = fma(_1860, _1834, _1910);
    float _1926 = fma(_1860, _1850, _1914);
    float _1928 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1902);
    float _1930 = _1814 * _1922;
    float _1932 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1936 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1938 = _1838 * _1852;
    float _1940 = fma(_1860, _1852, _1918);
    float _1942 = exp2(_1936);
    float _1944 = in.m_74.x;
    float _1946 = fma(_1798, _1882, _1938);
    float _1948 = _1932 + _1539;
    out.m_76.x = _1924;
    out.m_76.y = _1926;
    out.m_76.z = _1940;
    float _1950 = _1888 + _1946;
    float _1952 = _1948 * 0.5;
    float _1954 = _1884 + _1920;
    out.gl_Position.x = _1577;
    out.gl_Position.y = _1575;
    out.gl_Position.z = _1932;
    out.gl_Position.w = _1539;
    float _1956 = _1886 + _1900;
    out.m_78.z = _1952;
    out.m_78.w = _1539;
    float _1958 = -_1942;
    float _1960 = _1958 + 1.0;
    out.m_80.x = _1954;
    out.m_80.y = _1956;
    out.m_80.z = _1950;
    float _1962 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1966 = _1539;
    float _1968 = _1932;
    float _1970 = _1575;
    if (!_1824)
    {
        _1966 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1972 = _1966;
    float _1974 = _1972;
    float _1976 = _1972;
    if (!_1824)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1978 = _1968;
    float _1980 = _1978;
    float _1982 = _1978;
    if (!_1824)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1984 = _1970;
    float _1986 = -_1595;
    float _1988 = _1986 + 1.0;
    float _1990 = _1964 * _1597;
    float _1992 = -_1964;
    float _1994 = _1992 + 1.0;
    float _1996 = _1988 * _1934;
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = _1608 * _1990;
    float _2002 = _1618 * _1990;
    float _2004 = _1608 * _1994;
    float _2006 = -_1998;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2010 = fma(_1614, _2000, _1602);
    float _2012 = fma(_1616, _2000, _1604);
    float _2014 = fma(_1608, _2002, _1606);
    float _2016 = _2008 * _1944;
    float _2018 = _1994;
    float _2020 = _2016;
    float _2022 = _1984;
    float _2024 = _1984;
    if (!_1824)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2026 = _2018;
    out.m_82.x = _2010;
    out.m_82.y = _2012;
    out.m_82.z = _2014;
    out.m_82.w = _2004;
    float _2028 = _2016 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2030 = _2028;
    float _2032 = _2026;
    float _2034 = _2026;
    if (!_1824)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2020;
    out.m_84.x = _2028;
    float _2038 = _2036;
    float _2040 = _2036;
    if (!_1824)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2042 = _2030;
    bool _2044 = !_1824;
    float _2046 = _2042;
    float _2048 = _2042;
    if (!_2044)
    {
        bool _2050 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2052 = isnan(_1283);
        bool _2054 = _2050 || _2052;
        bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2058 = _2054 || _2056;
        if (!_2058)
        {
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2062 = _1283 + _2060;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2066 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2064;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2072 = 1.0 / _2066;
            float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2090 = _2062 * _2072;
            float _2092 = precise::clamp(_2090, 0.0, 1.0);
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2098 = fma(_2092, _2070, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2100 = fma(_2092, _2096, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2102 = fma(_2092, _2076, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2104 = fma(_2092, _2080, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2106 = fma(_2092, _2084, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2108 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2102;
            _2024 = _2106;
            _2040 = _2098;
            _1982 = _2104;
            _1976 = _2100;
            _2048 = _2108;
            _2110 = true;
        }
        else
        {
            bool _2112 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2114 = isnan(_1283);
            bool _2116 = _2112 || _2114;
            bool _2118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2120 = _2116 || _2118;
            if (!_2120)
            {
                _2038 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2122 = _2038;
            _2040 = _2122;
            if (!_2120)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2124 = _2032;
            _2034 = _2124;
            if (!_2120)
            {
                _1974 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2126 = _1974;
            _1976 = _2126;
            if (!_2120)
            {
                _1980 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2128 = _1980;
            _1982 = _2128;
            if (!_2120)
            {
                _2022 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2130 = _2022;
            _2024 = _2130;
            if (!_2120)
            {
                _2046 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2132 = _2046;
            bool _2134 = !_2120;
            _2048 = _2132;
            if (!_2134)
            {
                bool _2136 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2138 = isnan(_1283);
                bool _2140 = _2136 || _2138;
                bool _2142 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2144 = _2140 || _2142;
                if (!_2144)
                {
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2148 = _1283 + _2146;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2152 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2150;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2158 = 1.0 / _2152;
                    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2176 = _2148 * _2158;
                    float _2178 = precise::clamp(_2176, 0.0, 1.0);
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2184 = fma(_2178, _2156, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2186 = fma(_2178, _2182, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2188 = fma(_2178, _2162, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2190 = fma(_2178, _2166, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2192 = fma(_2178, _2170, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2194 = fma(_2178, _2174, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2188;
                    _2024 = _2192;
                    _2040 = _2184;
                    _1982 = _2190;
                    _1976 = _2186;
                    _2048 = _2194;
                    _2110 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2024 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2040 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1982 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1976 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2048 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2110 = false;
    float _2196 = _2034;
    float _2198 = _2024;
    float _2200 = _2040;
    float _2202 = _1982;
    float _2204 = _1976;
    float _2206 = _2048;
    float _2208 = fma(_1956, -0.5, 0.5);
    float _2210 = precise::clamp(_2208, 0.0, 1.0);
    float _2212 = -_2196;
    float _2214 = _2212 + _2198;
    float _2216 = _1962 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2218 = -_2200;
    float _2220 = _2218 + _2202;
    float _2222 = fma(_2210, _2214, _2196);
    out.m_86.x = 0.0;
    float _2224 = -_2204;
    float _2226 = _2224 + _2206;
    float _2228 = fma(_2210, _2220, _2200);
    float _2230 = _2222 * 0.586610972881317138671875;
    out.m_49.x = _2216;
    bool _2232 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2234 = fma(_2210, _2226, _2204);
    float _2236 = fma(_2228, 0.298911988735198974609375, _2230);
    bool _2238 = _1261 > 0.0;
    bool _2240 = isnan(_1261);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(0.0);
    bool _2246 = _2242 || _2244;
    float _2248 = fma(_2234, 0.114477999508380889892578125, _2236);
    float _2250 = -_2248;
    float _2252 = _2228 + _2250;
    float _2254 = -_2248;
    float _2256 = _2222 + _2254;
    float _2258 = -_2248;
    float _2260 = _2234 + _2258;
    float _2262 = fma(_2252, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    float _2264 = fma(_2256, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    float _2266 = fma(_2260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    bool _2268 = !_2232;
    if (!_2268)
    {
        float _2270 = -_1199;
        float _2272 = _2270 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2274 = -_1201;
        float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2278 = -_1203;
        float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2282 = _2272 * _2272;
        float _2284 = fma(_2276, _2276, _2282);
        float _2286 = fma(_2280, _2280, _2284);
        float _2288 = sqrt(_2286);
        float _2290 = rsqrt(_2286);
        float _2292 = -_2288;
        float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2296 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2298 = precise::clamp(_2296, 0.0, 1.0);
        float _2300 = _2276 * _2290;
        float _2302 = _2272 * _2290;
        float _2304 = abs(_2298);
        float _2306 = log2(_2304);
        float _2308 = _2280 * _2290;
        float _2310 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2312 = _1956 * _2302;
        float _2314 = -_2302;
        float _2316 = -_2310;
        float _2318 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2316);
        float _2320 = fma(_1954, _2300, _2312);
        float _2322 = -_2308;
        float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2318);
        float _2326 = fma(_1950, _2308, _2320);
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2332 = _2324 + _2330;
        float _2334 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2336 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2338 = precise::clamp(_2336, 0.0, 1.0);
        float _2340 = exp2(_2334);
        float _2342 = _2340 * _2338;
        float _2344 = _2328 * _2342;
        float _2346 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2348 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2350 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2346;
        out.m_86.y = _2348;
        out.m_86.z = _2350;
    }
    out.m_88.x = _2262;
    out.m_88.y = _2264;
    out.m_88.z = _2266;
    if (_2246)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2352 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2352;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2110 = false;
    bool _463 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2408 = as_type<float>(_121);
        out.gl_Position.z = _2408;
    }
    if (!_111)
    {
        return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2477 = as_type<float>(_161);
        out.gl_Position.z = _2477;
    }
    if (_153)
    {
        return out;
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _183;
    float _209;
    if (!_189)
    {
        float _193 = in.m_55.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_107);
        float _215 = 1.0 / _213;
        float _217 = _139 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_219);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = 1.0 / _239;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = _223 * _253;
    float _263 = -_235;
    float _265 = _263 + 1.0;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_257, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = _251 * _265;
    float _275 = fma(_269, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_251;
    float _279 = _277 + 1.0;
    float _281 = _271 * _273;
    float _283 = _275 * _273;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_259;
    float _311;
    if (!_293)
    {
        float _295 = in.m_55.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_107);
        float _317 = 1.0 / _315;
        float _319 = _139 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _343 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _345 = isnan(_321);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _357;
    float _361 = -_337;
    float _363 = _361 + 1.0;
    bool _365 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _367 = isnan(_321);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = _353 * _363;
    float _381 = -_353;
    float _383 = _381 + 1.0;
    float _385 = 1.0 / _341;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = _359 * _355;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _395 = _321 + _393;
    float _397 = -_375;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _395, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _405 = _321 + _403;
    float _407 = _337 * _399;
    float _409 = _389 * _385;
    float _411 = _401 * _379;
    float _413 = in.m_57.x;
    float _415 = in.m_57.y;
    float _417 = fma(_409, _405, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[115].x, _411);
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _423 = fma(_417, _407, _419);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _427 = _421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[117].x, _423);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _433 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _435 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _437 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _427;
    out.m_59.y = _433;
    out.m_59.z = _437;
    out.m_59.w = _435;
    float _439 = _291 * _415;
    float _441 = _289 * _413;
    bool _443 = !_377;
    float _461;
    if (!_443)
    {
        float _445 = in.m_55.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_107);
        float _467 = 1.0 / _465;
        float _469 = _139 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = in.m_55.x;
    float _475 = in.m_55.y;
    float _477 = in.m_55.z;
    float _479 = in.m_55.w;
    float _481 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _483 = log2(_481);
    float _485 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _487 = _483 * _139;
    float _489 = exp2(_487);
    float _491 = _477 * 2.0;
    float _493 = _473 * 2.0;
    float _495 = _475 * 2.0;
    float _497 = _475 + _473;
    float _499 = floor(_491);
    float _501 = _497 + (-1.0);
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _505 = floor(_493);
    float _507 = -_489;
    float _509 = _507 + 1.0;
    bool _511 = _499 > 0.0;
    float _513 = floor(_495);
    bool _515 = _499 >= 0.0;
    bool _517 = isnan(_499);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    int _525 = _523 ? 0 : 1;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _537 = _535 != 0;
    int _539 = ~_525;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    bool _545 = _505 > 0.0;
    int _547 = _543;
    if (!_511)
    {
        int _549 = ~_525;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    bool _555 = _505 >= 0.0;
    bool _557 = isnan(_505);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    bool _565 = !_529;
    int _567 = _565 ? 0 : 1;
    bool _569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _571 = isnan(1.0);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _577 = _573 || _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _581 = 1.0 + _579;
    bool _583 = _513 > 0.0;
    bool _585 = _513 >= 0.0;
    bool _587 = isnan(_513);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = 1.0 / _581;
    float _597 = in.m_61.x;
    float _599 = in.m_61.y;
    float _601 = in.m_61.z;
    int _603 = abs(_567);
    bool _605 = !_533;
    int _607 = _605 ? 0 : 1;
    int _609 = _563 ? 0 : 1;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    int _621 = abs(_607);
    float _623 = float(_603);
    float _625 = float(_553);
    int _627 = ~_609;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    int _633 = _631;
    if (!_545)
    {
        int _635 = ~_609;
        int _637 = _635 + 1;
        _633 = _637;
    }
    int _639 = _633;
    float _641 = _623 * _625;
    float _643 = _619 ? _509 : 0.0;
    int _645 = _593 ? 0 : 1;
    float _647 = float(_621);
    if (_577)
    {
        float _649 = _643 * _595;
        _143 = _649;
    }
    float _651 = _143;
    int _653 = ~_645;
    int _655 = _653 + 1;
    int _657 = _655 + 1;
    float _659 = float(_639);
    int _661 = _657;
    if (!_583)
    {
        int _663 = ~_645;
        int _665 = _663 + 1;
        _661 = _665;
    }
    int _667 = _661;
    float _669 = _641 * (-2.0);
    bool _671 = !_537;
    int _673 = _671 ? 0 : 1;
    float _675 = _647 * _659;
    float _677 = _473 + (-0.5);
    float _679 = float(_667);
    int _681 = abs(_673);
    float _683 = fma(_669, _597, _597);
    float _685 = fma(_503, _669, _503);
    float _687 = _475 + _477;
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].x, _683);
    float _691 = float(_681);
    float _693 = _687 + (-1.0);
    float _695 = fma(_685, _651, _689);
    float _697 = _675 * (-2.0);
    float _699 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _701 = _691 * _679;
    float _703 = _475 + (-0.5);
    float _705 = fma(_697, _599, _599);
    float _707 = fma(_699, _697, _699);
    float _709 = _477 + _473;
    float _711 = as_type<float>(int(gl_VertexIndex));
    float _713 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _705);
    float _715 = _709 + (-1.0);
    float _717 = _701 * (-2.0);
    float _719 = fma(_707, _651, _713);
    float _721 = _695 * 0.15915493667125701904296875;
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _725 = fma(_717, _601, _601);
    float _727 = _477 + (-0.5);
    float _729 = _719 * 0.15915493667125701904296875;
    float _731 = fma(_723, _717, _723);
    float _733 = _721 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _739 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _741 = fma(_731, _651, _737);
    float _743 = in.m_46.x;
    float _745 = in.m_46.y;
    float _747 = in.m_46.z;
    float _749 = _729 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _741 * 0.15915493667125701904296875;
    int _755 = as_type<int>(_711) & 1;
    bool _757 = _755 != 0;
    int _759 = as_type<int>(_711) & 2;
    bool _761 = _759 != 0;
    float _763 = _729 * 6.283185482025146484375;
    float _765 = cos(_763);
    bool _767 = !_757;
    float _769 = _767 ? (-0.5) : 0.5;
    bool _771 = !_761;
    float _773 = _771 ? (-0.5) : 0.5;
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _769);
    float _777 = _721 * 6.283185482025146484375;
    float _779 = sin(_777);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _773);
    float _783 = _735 * _751;
    float _785 = _739 * _781;
    float _787 = _753 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = _485 * _775;
    float _793 = _735 * _765;
    float _795 = _753 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _779 * _751;
    float _801 = _779 * _765;
    float _803 = _735 * _789;
    float _805 = _779 * _789;
    float _807 = _765 * _789;
    float _809 = _751 * _789;
    float _811 = _803 * _785;
    float _813 = _805 * _785;
    float _815 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _817 = fma(_797, _793, _799);
    float _819 = -_783;
    float _821 = fma(_797, _801, _819);
    float _823 = -_801;
    float _825 = fma(_797, _783, _823);
    float _827 = -_785;
    float _829 = _797 * _827;
    float _831 = fma(_817, _791, _811);
    float _833 = fma(_797, _799, _793);
    float _835 = fma(_821, _791, _813);
    float _837 = fma(_807, _791, _829);
    float _839 = fma(_825, _815, _831);
    float _841 = _745 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _843 = fma(_833, _815, _835);
    float _845 = fma(_809, _815, _837);
    float _847 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _849 = _745 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[6].x, _841);
    float _853 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _847);
    float _857 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _859 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _861 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _853);
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _855);
    float _865 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _869 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _861);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _875 = _745 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _879 = _867 + _871;
    float _881 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _885 = _873 + _877;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _889 = _879 + _887;
    float _891 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _893 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[5].z, _883);
    float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _897 = _885 + _895;
    float _899 = _889 * _889;
    float _901 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _891);
    float _903 = fma(_897, _897, _899);
    float _905 = _893 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = sqrt(_903);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _913 = _905 + _907;
    float _915 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _911);
    float _917 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    bool _919 = _909 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = _915;
    float _923 = _747;
    float _925 = _907;
    if (!_919)
    {
        _921 = _885;
    }
    float _927 = _921;
    float _929 = _927;
    if (!_919)
    {
        _923 = _879;
    }
    float _931 = _923;
    float _933 = _931;
    if (!_919)
    {
        _925 = _913;
    }
    float _935 = _925;
    bool _937 = !_919;
    float _939 = _935;
    if (!_937)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _943 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _945 = _909 + _943;
        float _947 = rsqrt(_903);
        float _949 = _945 * _941;
        float _951 = _913 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _949 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _953 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _957 + (-1.0);
        float _965 = fma(_961, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _967 = _963 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _969 = _947 * _965;
        float _971 = fma(_913, _957, _967);
        float _973 = fma(_897, _969, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _975 = fma(_889, _969, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _939 = _971;
        _929 = _973;
        _933 = _975;
    }
    float _977 = _939;
    float _979 = _929;
    float _981 = _933;
    float _983 = -_905;
    float _985 = _983 + _977;
    float _987 = -_873;
    float _989 = _987 + _979;
    float _991 = _917 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _993 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _995 = _985 * _985;
    float _997 = -_867;
    float _999 = _997 + _981;
    float _1001 = 1.0 / _991;
    float _1003 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _993);
    float _1005 = fma(_989, _989, _995);
    float _1007 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1003);
    float _1009 = fma(_999, _999, _1005);
    bool _1011 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1013 = isnan(0.5);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1019 = _1015 || _1017;
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = sqrt(_1009);
    bool _1025 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1027 = isnan(0.5);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1033 = _1029 || _1031;
    float _1035 = _1021 + _991;
    float _1037 = _1035 * _1001;
    float _1039 = _1037 * 0.5;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1043 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1041);
    float _1045 = 1.0 / _1043;
    bool _1047 = _1023 > 0.0;
    bool _1049 = !_1047;
    float _1051 = _977;
    float _1053 = _981;
    float _1055 = _979;
    float _1057 = _1023;
    float _1059 = _991;
    float _1061 = _1043;
    float _1063 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_1049)
    {
        float _1065 = _185 * _185;
        float _1067 = rsqrt(_1009);
        float _1069 = fma(_183, _183, _1065);
        float _1071 = fma(_187, _187, _1069);
        float _1073 = sqrt(_1071);
        float _1075 = _989 * _1067;
        float _1077 = _985 * _1067;
        float _1079 = _999 * _1067;
        bool _1081 = _1073 > 0.0;
        bool _1083 = !_1081;
        _1057 = _1067;
        _1061 = _1071;
        _1063 = _1073;
        if (!_1083)
        {
            float _1085 = rsqrt(_1071);
            float _1087 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1089 = _185 * _1085;
            float _1091 = _183 * _1085;
            float _1093 = _1077 * _1089;
            float _1095 = _187 * _1085;
            float _1097 = fma(_1075, _1091, _1093);
            float _1099 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1101 = fma(_1079, _1095, _1097);
            float _1103 = _1101 * _1099;
            float _1105 = fma(_183, _1103, _979);
            float _1107 = fma(_185, _1103, _977);
            float _1109 = fma(_187, _1103, _981);
            _1051 = _1107;
            _1053 = _1109;
            _1055 = _1105;
            _1057 = _1091;
            _1059 = _1087;
            _1061 = _1085;
            _1063 = _1103;
        }
    }
    float _1111 = _1051;
    float _1113 = _1053;
    float _1115 = _1055;
    float _1117 = _1057;
    float _1119 = _1059;
    float _1121 = _1061;
    float _1123 = _1063;
    float _1125 = _1117;
    float _1127 = _1115;
    float _1129 = _1113;
    float _1131 = _1121;
    float _1133 = _1123;
    float _1135 = _1119;
    if (_1033)
    {
        _191 = 1.0;
    }
    float _1137 = _191;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1141 = _1045 * _1139;
    float _1143 = _1137;
    if (_1019)
    {
        _1125 = _1111;
    }
    float _1145 = _1125;
    float _1147 = _1145;
    if (!_1019)
    {
        float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1151 = _905 + _1149;
        float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1155 = _873 + _1153;
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = -_905;
        float _1161 = _1159 + _1111;
        float _1163 = _1151 * _1151;
        float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1167 = _867 + _1165;
        float _1169 = -_867;
        float _1171 = _1169 + _1113;
        float _1173 = fma(_1155, _1155, _1163);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1177 = fma(_1167, _1167, _1173);
        float _1179 = sqrt(_1177);
        float _1181 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1183 = precise::min(_1179, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1185 = _1183 * _1175;
        float _1187 = -_873;
        float _1189 = _1187 + _1115;
        float _1191 = _1181 * _1185;
        float _1193 = fma(_1161, _1191, _905);
        float _1195 = fma(_1189, _1191, _873);
        float _1197 = fma(_1171, _1191, _867);
        _1147 = _1193;
        _1127 = _1195;
        _1129 = _1197;
        _1131 = _1179;
    }
    float _1199 = _1147;
    float _1201 = _1127;
    float _1203 = _1129;
    float _1205 = _1131;
    float _1207 = _1205;
    if (!_1033)
    {
        float _1209 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = _1211 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 0.15915493667125701904296875;
        float _1221 = _1211 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = 1.0 / _1217;
        float _1227 = _1219 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = _1223 * _1225;
        float _1233 = _1219 * 6.283185482025146484375;
        float _1235 = sin(_1233);
        float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1239 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1237;
        float _1241 = _1229 * _1231;
        float _1243 = 1.0 / _1239;
        float _1245 = 1.0 / _1241;
        float _1247 = _1235 * _1245;
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = fma(_1141, _1247, _1249);
        float _1253 = _1251 * _1243;
        float _1255 = precise::clamp(_1253, 0.0, 1.0);
        _1207 = _1243;
        _1133 = _1219;
        _1143 = _1255;
    }
    float _1257 = _1207;
    float _1259 = _1133;
    float _1261 = _1143;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1265 = _1199 + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1269 = _1201 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1273 = _1203 + _1271;
    float _1275 = _1265 * _1265;
    float _1277 = fma(_1269, _1269, _1275);
    float _1279 = fma(_1273, _1273, _1277);
    float _1281 = rsqrt(_1279);
    float _1283 = sqrt(_1279);
    float _1285 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1287 = _1269 * _1285;
    float _1289 = _1273 * _1285;
    float _1291 = _1287 * _1287;
    float _1293 = _1289 * _1289;
    float _1295 = _1291 + _1293;
    float _1297 = sqrt(_1295);
    bool _1299 = _1297 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = _1297 + _1301;
    float _1305 = _1281;
    float _1307 = _1259;
    float _1309 = _1303;
    float _1311 = _1265;
    if (_1299)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1305 = _1313;
    }
    float _1315 = _1305;
    if (_1299)
    {
        float _1317 = rsqrt(_1295);
        _1307 = _1317;
    }
    float _1319 = _1307;
    float _1321 = _1319;
    if (_1299)
    {
        float _1323 = _1303 * _1315;
        _1309 = _1323;
    }
    float _1325 = _1309;
    if (_1299)
    {
        float _1327 = _1325 * 0.15915493667125701904296875;
        _1135 = _1327;
    }
    float _1329 = _1135;
    float _1331 = _1273;
    if (_1299)
    {
        float _1333 = _1329 * 6.283185482025146484375;
        float _1335 = sin(_1333);
        _1331 = _1335;
    }
    float _1337 = _1331;
    float _1339 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1341 = precise::max(0.0, _1339);
    float _1343 = _1257;
    float _1345 = _1341;
    if (_1299)
    {
        float _1347 = _1329 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        _1343 = _1349;
    }
    float _1351 = _1343;
    float _1353 = -_1285;
    float _1355 = -_1341;
    float _1357 = fma(_1265, _1353, _1355);
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1299)
    {
        _1311 = _1289;
    }
    float _1361 = _1311;
    float _1363 = fma(_873, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1365 = _1361;
    if (_1299)
    {
        float _1367 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1373 = _1369;
    float _1375 = _1337;
    if (_1299)
    {
        float _1377 = fma(_1337, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1373 = _1377;
    }
    float _1379 = _1373;
    float _1381 = _1379;
    if (!_1299)
    {
        _1375 = _1357;
    }
    float _1383 = _1375;
    float _1385 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1371);
    float _1387 = _1383;
    float _1389 = _1351;
    if (_1299)
    {
        float _1391 = _1351 + (-1.0);
        _1359 = _1391;
    }
    float _1393 = _1359;
    float _1395 = 0.0;
    float _1397 = _1393;
    if (_1299)
    {
        float _1399 = _1319 * _1379;
        _1395 = _1399;
    }
    float _1401 = _1395;
    if (!_1299)
    {
        _1321 = _1287;
    }
    float _1403 = _1321;
    float _1405 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1385);
    float _1407 = _1403;
    if (_1299)
    {
        float _1409 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1397 = _1409;
    }
    float _1411 = _1397;
    if (_1299)
    {
        float _1413 = _1287 * _1401;
        _1407 = _1413;
    }
    float _1415 = _1407;
    if (!_1299)
    {
        _1381 = _1291;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1299)
    {
        float _1421 = _1289 * _1401;
        _1365 = _1421;
    }
    float _1423 = _1365;
    if (_1299)
    {
        float _1425 = fma(_1357, _1351, _1411);
        _1387 = _1425;
    }
    float _1427 = _1387;
    if (_1299)
    {
        float _1429 = _1415 * _1415;
        _1419 = _1429;
    }
    float _1431 = _1419;
    if (!_1299)
    {
        _1389 = _1293;
    }
    float _1433 = _1389;
    float _1435 = _1433;
    if (_1299)
    {
        float _1437 = _1423 * _1423;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1443 = fma(_1427, _1427, _1431);
    float _1445 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = _1443 + _1439;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = floor(_1363);
    float _1457 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1459 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1461 = -_1453;
    float _1463 = _1461 + 1.0;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1467 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1469 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1471 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1459);
    float _1473 = rsqrt(_1447);
    float _1475 = -_1467;
    float _1477 = fma(_1475, _1465, 1.0);
    float _1479 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1483 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1487 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1481);
    float _1489 = abs(_1463);
    float _1491 = log2(_1489);
    float _1493 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1485);
    float _1495 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1499 = _1473 * _1415;
    float _1501 = _1473 * _1427;
    float _1503 = _1473 * _1423;
    float _1505 = floor(_1457);
    float _1507 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1509 = -_1507;
    float _1511 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1509);
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1515 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1517 = log2(_1477);
    float _1519 = -_1503;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1511);
    float _1523 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1513);
    float _1525 = -_1455;
    float _1527 = _1363 + _1525;
    float _1529 = fma(_1521, -0.5, 0.5);
    float _1531 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1523);
    float _1533 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = exp2(_1515);
    float _1537 = fma(_1521, 0.5, 0.5);
    float _1539 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1531);
    float _1541 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1543 = -_1505;
    float _1545 = _1457 + _1543;
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1551 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1541);
    float _1553 = 1.0 / _1539;
    float _1555 = _1501 + 1.0;
    float _1557 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1559 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1551);
    float _1561 = _1517 * 0.693147182464599609375;
    float _1563 = fma(_1537, _1557, 1.570728778839111328125);
    float _1565 = sqrt(_1529);
    float _1567 = -_1501;
    float _1569 = fma(_1535, _1555, _1567);
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1549);
    float _1575 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1559);
    float _1577 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1579 = _1575 * _1553;
    float _1581 = _1565 * 0.636619746685028076171875;
    float _1583 = _1577 * _1553;
    float _1585 = fma(_1579, -0.5, 0.5);
    float _1587 = -_1563;
    float _1589 = fma(_1581, _1587, 1.0);
    float _1591 = fma(_1583, 0.5, 0.5);
    float _1593 = fma(_1569, 0.5, 0.5);
    float2 _4694 = float2(_1527, _1545);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4694, float2(0.0), isnan(_4694)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4694, float2(0.0), isnan(_4694)), level(0.0)).x;
    float3 _4705 = float3(_1591, _1585, _1571);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4705, float3(0.0), isnan(_4705)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4705, float3(0.0), isnan(_4705)), level(0.0)).x;
    float3 _4716 = float3(_1591, _1585, _1571);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4716, float3(0.0), isnan(_4716)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4716, float3(0.0), isnan(_4716)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _4732 = float2(_1589, _1593);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4732, float2(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4732, float2(0.0), isnan(_4732)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1622 = _803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1624 = _473 > 0.5;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1630 = _479 > 0.5;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1632;
    bool _1636 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1638 = isnan(_471);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = 1.0 / _1628;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1652 = _471 + _1650;
    bool _1654 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1656 = isnan(_471);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1662 = _1658 || _1660;
    float _1664 = float(_1662);
    out.m_66.x = _1201;
    out.m_66.y = _1199;
    out.m_66.z = _1203;
    float _1666 = -_1646;
    float _1668 = _1666 + 1.0;
    bool _1670 = _475 > 0.5;
    float _1672 = -_773;
    int _1674 = _1630 ? as_type<int>(_1672) : as_type<int>(_773);
    float _1676 = _1664 * _1668;
    float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1682 = _1680 != 0;
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1686 = _1684 != 0;
    float _1688 = _1634 * _1648;
    float _1690 = -_769;
    int _1692 = _1624 ? as_type<int>(_1690) : as_type<int>(_769);
    bool _1694 = _477 > 0.5;
    float _1696 = fma(_1688, _1652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = -_773;
    int _1700 = _1670 ? as_type<int>(_1698) : as_type<int>(_773);
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1706 = _1704 != 0;
    float _1708 = _1696 * _1676;
    float _1710 = -_1664;
    float _1712 = _1710 + 1.0;
    bool _1714 = !_1682;
    float _1716 = _1714 ? _773 : as_type<float>(_1700);
    bool _1718 = !_1686;
    float _1720 = _1718 ? _769 : as_type<float>(_1692);
    float _1722 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1708);
    float _1724 = -_769;
    int _1726 = _1694 ? as_type<int>(_1724) : as_type<int>(_769);
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1732 = _1730 != 0;
    float _1734 = -_1716;
    float _1736 = _1734 + 0.5;
    bool _1738 = !_1706;
    float _1740 = _1738 ? _769 : as_type<float>(_1726);
    float _1742 = _1720 + 0.5;
    bool _1744 = !_1732;
    float _1746 = _1744 ? _773 : as_type<float>(_1674);
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1750 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1722);
    float _1752 = _1740 + 0.5;
    float _1754 = abs(_1141);
    float _1756 = log2(_1754);
    float _1758 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1760 = -_1746;
    float _1762 = _1760 + 0.5;
    float _1764 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1766 = _1748 * _1678;
    float _1768 = _1758 * _1620;
    float _1770 = _1764 * _1702;
    float _1772 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1774 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1776 = _1772 * _1728;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1782 = _803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1786 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1794 = _803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_68.x = _1768;
    out.m_68.y = _1766;
    out.m_68.z = _1770;
    out.m_68.w = _1776;
    float _1796 = exp2(_1786);
    float _1798 = _769 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1800 = -_797;
    float _1802 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1794);
    out.m_70.x = _1788;
    out.m_70.y = _1790;
    out.m_70.z = _1792;
    out.m_70.w = _1774;
    bool _1804 = _1141 <= 8000.0;
    bool _1806 = isnan(_1141);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(8000.0);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    bool _1816 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1818 = isnan(_1283);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1824 = _1820 || _1822;
    float _1826 = -_797;
    float _1828 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1782);
    float _1830 = -_797;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1834 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1802);
    float _1836 = _817 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1838 = _773 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1840 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1842 = _817 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1844 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1846 = precise::clamp(_1844, 0.0, 1.0);
    float _1848 = fma(_1838, _1838, 1.0);
    float _1850 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1828);
    float _1852 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1832);
    float _1854 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1856 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1858 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1836);
    float _1860 = rsqrt(_1848);
    float _1862 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1840);
    float _1864 = _817 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1866 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1842);
    float _1868 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1858);
    float _1870 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1864);
    float _1872 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1866);
    float _1874 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1854);
    float _1876 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1856);
    float _1878 = fma(_1846, -2.0, 3.0);
    float _1880 = _1846 * _1846;
    float _1882 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1870);
    float _1884 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1886 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1862);
    float _1888 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1890 = _1838 * _1850;
    float _1892 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1894 = _1880 * _1878;
    float _1896 = _1838 * _1860;
    float _1898 = _1838 * _1834;
    float _1900 = fma(_1798, _1872, _1890);
    float _1902 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1892);
    float _1904 = -_1894;
    float _1906 = _1904 + 1.0;
    float _1908 = -_1884;
    float _1910 = _1896 * _1908;
    float _1912 = -_1886;
    float _1914 = _1896 * _1912;
    out.m_72.x = _1868;
    out.m_72.y = _1872;
    out.m_72.z = _1882;
    float _1916 = -_1888;
    float _1918 = _1896 * _1916;
    float _1920 = fma(_1798, _1868, _1898);
    float _1922 = fma(_1906, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1894);
    float _1924 = fma(_1860, _1834, _1910);
    float _1926 = fma(_1860, _1850, _1914);
    float _1928 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1902);
    float _1930 = _1814 * _1922;
    float _1932 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1936 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1938 = _1838 * _1852;
    float _1940 = fma(_1860, _1852, _1918);
    float _1942 = exp2(_1936);
    float _1944 = in.m_74.x;
    float _1946 = fma(_1798, _1882, _1938);
    float _1948 = _1932 + _1539;
    out.m_76.x = _1924;
    out.m_76.y = _1926;
    out.m_76.z = _1940;
    float _1950 = _1888 + _1946;
    float _1952 = _1948 * 0.5;
    float _1954 = _1884 + _1920;
    out.gl_Position.x = _1577;
    out.gl_Position.y = _1575;
    out.gl_Position.z = _1932;
    out.gl_Position.w = _1539;
    float _1956 = _1886 + _1900;
    out.m_78.z = _1952;
    out.m_78.w = _1539;
    float _1958 = -_1942;
    float _1960 = _1958 + 1.0;
    out.m_80.x = _1954;
    out.m_80.y = _1956;
    out.m_80.z = _1950;
    float _1962 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1966 = _1539;
    float _1968 = _1932;
    float _1970 = _1575;
    if (!_1824)
    {
        _1966 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1972 = _1966;
    float _1974 = _1972;
    float _1976 = _1972;
    if (!_1824)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1978 = _1968;
    float _1980 = _1978;
    float _1982 = _1978;
    if (!_1824)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1984 = _1970;
    float _1986 = -_1595;
    float _1988 = _1986 + 1.0;
    float _1990 = _1964 * _1597;
    float _1992 = -_1964;
    float _1994 = _1992 + 1.0;
    float _1996 = _1988 * _1934;
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = _1608 * _1990;
    float _2002 = _1618 * _1990;
    float _2004 = _1608 * _1994;
    float _2006 = -_1998;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2010 = fma(_1614, _2000, _1602);
    float _2012 = fma(_1616, _2000, _1604);
    float _2014 = fma(_1608, _2002, _1606);
    float _2016 = _2008 * _1944;
    float _2018 = _1994;
    float _2020 = _2016;
    float _2022 = _1984;
    float _2024 = _1984;
    if (!_1824)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2026 = _2018;
    out.m_82.x = _2010;
    out.m_82.y = _2012;
    out.m_82.z = _2014;
    out.m_82.w = _2004;
    float _2028 = _2016 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2030 = _2028;
    float _2032 = _2026;
    float _2034 = _2026;
    if (!_1824)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2020;
    out.m_84.x = _2028;
    float _2038 = _2036;
    float _2040 = _2036;
    if (!_1824)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2042 = _2030;
    bool _2044 = !_1824;
    float _2046 = _2042;
    float _2048 = _2042;
    if (!_2044)
    {
        bool _2050 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2052 = isnan(_1283);
        bool _2054 = _2050 || _2052;
        bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2058 = _2054 || _2056;
        if (!_2058)
        {
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2062 = _1283 + _2060;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2066 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2064;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2072 = 1.0 / _2066;
            float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2090 = _2062 * _2072;
            float _2092 = precise::clamp(_2090, 0.0, 1.0);
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2098 = fma(_2092, _2070, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2100 = fma(_2092, _2096, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2102 = fma(_2092, _2076, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2104 = fma(_2092, _2080, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2106 = fma(_2092, _2084, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2108 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2102;
            _2024 = _2106;
            _2040 = _2098;
            _1982 = _2104;
            _1976 = _2100;
            _2048 = _2108;
            _2110 = true;
        }
        else
        {
            bool _2112 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2114 = isnan(_1283);
            bool _2116 = _2112 || _2114;
            bool _2118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2120 = _2116 || _2118;
            if (!_2120)
            {
                _2038 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2122 = _2038;
            _2040 = _2122;
            if (!_2120)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2124 = _2032;
            _2034 = _2124;
            if (!_2120)
            {
                _1974 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2126 = _1974;
            _1976 = _2126;
            if (!_2120)
            {
                _1980 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2128 = _1980;
            _1982 = _2128;
            if (!_2120)
            {
                _2022 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2130 = _2022;
            _2024 = _2130;
            if (!_2120)
            {
                _2046 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2132 = _2046;
            bool _2134 = !_2120;
            _2048 = _2132;
            if (!_2134)
            {
                bool _2136 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2138 = isnan(_1283);
                bool _2140 = _2136 || _2138;
                bool _2142 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2144 = _2140 || _2142;
                if (!_2144)
                {
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2148 = _1283 + _2146;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2152 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2150;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2158 = 1.0 / _2152;
                    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2176 = _2148 * _2158;
                    float _2178 = precise::clamp(_2176, 0.0, 1.0);
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2184 = fma(_2178, _2156, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2186 = fma(_2178, _2182, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2188 = fma(_2178, _2162, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2190 = fma(_2178, _2166, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2192 = fma(_2178, _2170, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2194 = fma(_2178, _2174, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2188;
                    _2024 = _2192;
                    _2040 = _2184;
                    _1982 = _2190;
                    _1976 = _2186;
                    _2048 = _2194;
                    _2110 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2024 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2040 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1982 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1976 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2048 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2110 = false;
    float _2196 = _2034;
    float _2198 = _2024;
    float _2200 = _2040;
    float _2202 = _1982;
    float _2204 = _1976;
    float _2206 = _2048;
    float _2208 = fma(_1956, -0.5, 0.5);
    float _2210 = precise::clamp(_2208, 0.0, 1.0);
    float _2212 = -_2196;
    float _2214 = _2212 + _2198;
    float _2216 = _1962 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2218 = -_2200;
    float _2220 = _2218 + _2202;
    float _2222 = fma(_2210, _2214, _2196);
    out.m_86.x = 0.0;
    float _2224 = -_2204;
    float _2226 = _2224 + _2206;
    float _2228 = fma(_2210, _2220, _2200);
    float _2230 = _2222 * 0.586610972881317138671875;
    out.m_49.x = _2216;
    bool _2232 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2234 = fma(_2210, _2226, _2204);
    float _2236 = fma(_2228, 0.298911988735198974609375, _2230);
    bool _2238 = _1261 > 0.0;
    bool _2240 = isnan(_1261);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(0.0);
    bool _2246 = _2242 || _2244;
    float _2248 = fma(_2234, 0.114477999508380889892578125, _2236);
    float _2250 = -_2248;
    float _2252 = _2228 + _2250;
    float _2254 = -_2248;
    float _2256 = _2222 + _2254;
    float _2258 = -_2248;
    float _2260 = _2234 + _2258;
    float _2262 = fma(_2252, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    float _2264 = fma(_2256, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    float _2266 = fma(_2260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    bool _2268 = !_2232;
    if (!_2268)
    {
        float _2270 = -_1199;
        float _2272 = _2270 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2274 = -_1201;
        float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2278 = -_1203;
        float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2282 = _2272 * _2272;
        float _2284 = fma(_2276, _2276, _2282);
        float _2286 = fma(_2280, _2280, _2284);
        float _2288 = sqrt(_2286);
        float _2290 = rsqrt(_2286);
        float _2292 = -_2288;
        float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2296 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2298 = precise::clamp(_2296, 0.0, 1.0);
        float _2300 = _2276 * _2290;
        float _2302 = _2272 * _2290;
        float _2304 = abs(_2298);
        float _2306 = log2(_2304);
        float _2308 = _2280 * _2290;
        float _2310 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2312 = _1956 * _2302;
        float _2314 = -_2302;
        float _2316 = -_2310;
        float _2318 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2316);
        float _2320 = fma(_1954, _2300, _2312);
        float _2322 = -_2308;
        float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2318);
        float _2326 = fma(_1950, _2308, _2320);
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2332 = _2324 + _2330;
        float _2334 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2336 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2338 = precise::clamp(_2336, 0.0, 1.0);
        float _2340 = exp2(_2334);
        float _2342 = _2340 * _2338;
        float _2344 = _2328 * _2342;
        float _2346 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2348 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2350 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2346;
        out.m_86.y = _2348;
        out.m_86.z = _2350;
    }
    out.m_88.x = _2262;
    out.m_88.y = _2264;
    out.m_88.z = _2266;
    if (_2246)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2352 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2352;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2110 = false;
    bool _463 = false;
    bool _313 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2408 = as_type<float>(_121);
        out.gl_Position.z = _2408;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_107);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = 0.0;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2477 = as_type<float>(_161);
        out.gl_Position.z = _2477;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _183;
    float _209;
    if (!_189)
    {
        float _193 = in.m_55.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_107);
        float _215 = 1.0 / _213;
        float _217 = _139 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_219);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = 1.0 / _239;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = _223 * _253;
    float _263 = -_235;
    float _265 = _263 + 1.0;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_257, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = _251 * _265;
    float _275 = fma(_269, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = -_251;
    float _279 = _277 + 1.0;
    float _281 = _271 * _273;
    float _283 = _275 * _273;
    float _285 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_259;
    float _311;
    if (!_293)
    {
        float _295 = in.m_55.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_107);
        float _317 = 1.0 / _315;
        float _319 = _139 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _343 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _345 = isnan(_321);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _325;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _357;
    float _361 = -_337;
    float _363 = _361 + 1.0;
    bool _365 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _367 = isnan(_321);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _379 = _353 * _363;
    float _381 = -_353;
    float _383 = _381 + 1.0;
    float _385 = 1.0 / _341;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = _359 * _355;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _395 = _321 + _393;
    float _397 = -_375;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _395, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _405 = _321 + _403;
    float _407 = _337 * _399;
    float _409 = _389 * _385;
    float _411 = _401 * _379;
    float _413 = in.m_57.x;
    float _415 = in.m_57.y;
    float _417 = fma(_409, _405, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[115].x, _411);
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _423 = fma(_417, _407, _419);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _427 = _421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[117].x, _423);
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _433 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _435 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _437 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _427;
    out.m_59.y = _433;
    out.m_59.z = _437;
    out.m_59.w = _435;
    float _439 = _291 * _415;
    float _441 = _289 * _413;
    bool _443 = !_377;
    float _461;
    if (!_443)
    {
        float _445 = in.m_55.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_107);
        float _467 = 1.0 / _465;
        float _469 = _139 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = in.m_55.x;
    float _475 = in.m_55.y;
    float _477 = in.m_55.z;
    float _479 = in.m_55.w;
    float _481 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _483 = log2(_481);
    float _485 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _487 = _483 * _139;
    float _489 = exp2(_487);
    float _491 = _477 * 2.0;
    float _493 = _473 * 2.0;
    float _495 = _475 * 2.0;
    float _497 = _475 + _473;
    float _499 = floor(_491);
    float _501 = _497 + (-1.0);
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _505 = floor(_493);
    float _507 = -_489;
    float _509 = _507 + 1.0;
    bool _511 = _499 > 0.0;
    float _513 = floor(_495);
    bool _515 = _499 >= 0.0;
    bool _517 = isnan(_499);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    int _525 = _523 ? 0 : 1;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _537 = _535 != 0;
    int _539 = ~_525;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    bool _545 = _505 > 0.0;
    int _547 = _543;
    if (!_511)
    {
        int _549 = ~_525;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    bool _555 = _505 >= 0.0;
    bool _557 = isnan(_505);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    bool _565 = !_529;
    int _567 = _565 ? 0 : 1;
    bool _569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _571 = isnan(1.0);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _577 = _573 || _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _581 = 1.0 + _579;
    bool _583 = _513 > 0.0;
    bool _585 = _513 >= 0.0;
    bool _587 = isnan(_513);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = 1.0 / _581;
    float _597 = in.m_61.x;
    float _599 = in.m_61.y;
    float _601 = in.m_61.z;
    int _603 = abs(_567);
    bool _605 = !_533;
    int _607 = _605 ? 0 : 1;
    int _609 = _563 ? 0 : 1;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    int _621 = abs(_607);
    float _623 = float(_603);
    float _625 = float(_553);
    int _627 = ~_609;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    int _633 = _631;
    if (!_545)
    {
        int _635 = ~_609;
        int _637 = _635 + 1;
        _633 = _637;
    }
    int _639 = _633;
    float _641 = _623 * _625;
    float _643 = _619 ? _509 : 0.0;
    int _645 = _593 ? 0 : 1;
    float _647 = float(_621);
    if (_577)
    {
        float _649 = _643 * _595;
        _143 = _649;
    }
    float _651 = _143;
    int _653 = ~_645;
    int _655 = _653 + 1;
    int _657 = _655 + 1;
    float _659 = float(_639);
    int _661 = _657;
    if (!_583)
    {
        int _663 = ~_645;
        int _665 = _663 + 1;
        _661 = _665;
    }
    int _667 = _661;
    float _669 = _641 * (-2.0);
    bool _671 = !_537;
    int _673 = _671 ? 0 : 1;
    float _675 = _647 * _659;
    float _677 = _473 + (-0.5);
    float _679 = float(_667);
    int _681 = abs(_673);
    float _683 = fma(_669, _597, _597);
    float _685 = fma(_503, _669, _503);
    float _687 = _475 + _477;
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].x, _683);
    float _691 = float(_681);
    float _693 = _687 + (-1.0);
    float _695 = fma(_685, _651, _689);
    float _697 = _675 * (-2.0);
    float _699 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _701 = _691 * _679;
    float _703 = _475 + (-0.5);
    float _705 = fma(_697, _599, _599);
    float _707 = fma(_699, _697, _699);
    float _709 = _477 + _473;
    float _711 = as_type<float>(int(gl_VertexIndex));
    float _713 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _705);
    float _715 = _709 + (-1.0);
    float _717 = _701 * (-2.0);
    float _719 = fma(_707, _651, _713);
    float _721 = _695 * 0.15915493667125701904296875;
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _725 = fma(_717, _601, _601);
    float _727 = _477 + (-0.5);
    float _729 = _719 * 0.15915493667125701904296875;
    float _731 = fma(_723, _717, _723);
    float _733 = _721 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _739 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _741 = fma(_731, _651, _737);
    float _743 = in.m_46.x;
    float _745 = in.m_46.y;
    float _747 = in.m_46.z;
    float _749 = _729 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _741 * 0.15915493667125701904296875;
    int _755 = as_type<int>(_711) & 1;
    bool _757 = _755 != 0;
    int _759 = as_type<int>(_711) & 2;
    bool _761 = _759 != 0;
    float _763 = _729 * 6.283185482025146484375;
    float _765 = cos(_763);
    bool _767 = !_757;
    float _769 = _767 ? (-0.5) : 0.5;
    bool _771 = !_761;
    float _773 = _771 ? (-0.5) : 0.5;
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _769);
    float _777 = _721 * 6.283185482025146484375;
    float _779 = sin(_777);
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _773);
    float _783 = _735 * _751;
    float _785 = _739 * _781;
    float _787 = _753 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = _485 * _775;
    float _793 = _735 * _765;
    float _795 = _753 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _779 * _751;
    float _801 = _779 * _765;
    float _803 = _735 * _789;
    float _805 = _779 * _789;
    float _807 = _765 * _789;
    float _809 = _751 * _789;
    float _811 = _803 * _785;
    float _813 = _805 * _785;
    float _815 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _817 = fma(_797, _793, _799);
    float _819 = -_783;
    float _821 = fma(_797, _801, _819);
    float _823 = -_801;
    float _825 = fma(_797, _783, _823);
    float _827 = -_785;
    float _829 = _797 * _827;
    float _831 = fma(_817, _791, _811);
    float _833 = fma(_797, _799, _793);
    float _835 = fma(_821, _791, _813);
    float _837 = fma(_807, _791, _829);
    float _839 = fma(_825, _815, _831);
    float _841 = _745 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _843 = fma(_833, _815, _835);
    float _845 = fma(_809, _815, _837);
    float _847 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _849 = _745 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[6].x, _841);
    float _853 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _847);
    float _857 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _859 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _861 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _853);
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _855);
    float _865 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _869 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _861);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _875 = _745 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _879 = _867 + _871;
    float _881 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = fma(_743, (*spvDescriptorSet0.vp_c10)._m0[5].x, _875);
    float _885 = _873 + _877;
    float _887 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _889 = _879 + _887;
    float _891 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _893 = fma(_747, (*spvDescriptorSet0.vp_c10)._m0[5].z, _883);
    float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _897 = _885 + _895;
    float _899 = _889 * _889;
    float _901 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _891);
    float _903 = fma(_897, _897, _899);
    float _905 = _893 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = sqrt(_903);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _913 = _905 + _907;
    float _915 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _911);
    float _917 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    bool _919 = _909 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = _915;
    float _923 = _747;
    float _925 = _907;
    if (!_919)
    {
        _921 = _885;
    }
    float _927 = _921;
    float _929 = _927;
    if (!_919)
    {
        _923 = _879;
    }
    float _931 = _923;
    float _933 = _931;
    if (!_919)
    {
        _925 = _913;
    }
    float _935 = _925;
    bool _937 = !_919;
    float _939 = _935;
    if (!_937)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _943 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _945 = _909 + _943;
        float _947 = rsqrt(_903);
        float _949 = _945 * _941;
        float _951 = _913 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _949 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _953 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _957 + (-1.0);
        float _965 = fma(_961, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _967 = _963 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _969 = _947 * _965;
        float _971 = fma(_913, _957, _967);
        float _973 = fma(_897, _969, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _975 = fma(_889, _969, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _939 = _971;
        _929 = _973;
        _933 = _975;
    }
    float _977 = _939;
    float _979 = _929;
    float _981 = _933;
    float _983 = -_905;
    float _985 = _983 + _977;
    float _987 = -_873;
    float _989 = _987 + _979;
    float _991 = _917 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _993 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _995 = _985 * _985;
    float _997 = -_867;
    float _999 = _997 + _981;
    float _1001 = 1.0 / _991;
    float _1003 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _993);
    float _1005 = fma(_989, _989, _995);
    float _1007 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1003);
    float _1009 = fma(_999, _999, _1005);
    bool _1011 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1013 = isnan(0.5);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1019 = _1015 || _1017;
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = sqrt(_1009);
    bool _1025 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1027 = isnan(0.5);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1033 = _1029 || _1031;
    float _1035 = _1021 + _991;
    float _1037 = _1035 * _1001;
    float _1039 = _1037 * 0.5;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1043 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1041);
    float _1045 = 1.0 / _1043;
    bool _1047 = _1023 > 0.0;
    bool _1049 = !_1047;
    float _1051 = _977;
    float _1053 = _981;
    float _1055 = _979;
    float _1057 = _1023;
    float _1059 = _991;
    float _1061 = _1043;
    float _1063 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_1049)
    {
        float _1065 = _185 * _185;
        float _1067 = rsqrt(_1009);
        float _1069 = fma(_183, _183, _1065);
        float _1071 = fma(_187, _187, _1069);
        float _1073 = sqrt(_1071);
        float _1075 = _989 * _1067;
        float _1077 = _985 * _1067;
        float _1079 = _999 * _1067;
        bool _1081 = _1073 > 0.0;
        bool _1083 = !_1081;
        _1057 = _1067;
        _1061 = _1071;
        _1063 = _1073;
        if (!_1083)
        {
            float _1085 = rsqrt(_1071);
            float _1087 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1089 = _185 * _1085;
            float _1091 = _183 * _1085;
            float _1093 = _1077 * _1089;
            float _1095 = _187 * _1085;
            float _1097 = fma(_1075, _1091, _1093);
            float _1099 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1101 = fma(_1079, _1095, _1097);
            float _1103 = _1101 * _1099;
            float _1105 = fma(_183, _1103, _979);
            float _1107 = fma(_185, _1103, _977);
            float _1109 = fma(_187, _1103, _981);
            _1051 = _1107;
            _1053 = _1109;
            _1055 = _1105;
            _1057 = _1091;
            _1059 = _1087;
            _1061 = _1085;
            _1063 = _1103;
        }
    }
    float _1111 = _1051;
    float _1113 = _1053;
    float _1115 = _1055;
    float _1117 = _1057;
    float _1119 = _1059;
    float _1121 = _1061;
    float _1123 = _1063;
    float _1125 = _1117;
    float _1127 = _1115;
    float _1129 = _1113;
    float _1131 = _1121;
    float _1133 = _1123;
    float _1135 = _1119;
    if (_1033)
    {
        _191 = 1.0;
    }
    float _1137 = _191;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1141 = _1045 * _1139;
    float _1143 = _1137;
    if (_1019)
    {
        _1125 = _1111;
    }
    float _1145 = _1125;
    float _1147 = _1145;
    if (!_1019)
    {
        float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1151 = _905 + _1149;
        float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1155 = _873 + _1153;
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = -_905;
        float _1161 = _1159 + _1111;
        float _1163 = _1151 * _1151;
        float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1167 = _867 + _1165;
        float _1169 = -_867;
        float _1171 = _1169 + _1113;
        float _1173 = fma(_1155, _1155, _1163);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1177 = fma(_1167, _1167, _1173);
        float _1179 = sqrt(_1177);
        float _1181 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1183 = precise::min(_1179, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1185 = _1183 * _1175;
        float _1187 = -_873;
        float _1189 = _1187 + _1115;
        float _1191 = _1181 * _1185;
        float _1193 = fma(_1161, _1191, _905);
        float _1195 = fma(_1189, _1191, _873);
        float _1197 = fma(_1171, _1191, _867);
        _1147 = _1193;
        _1127 = _1195;
        _1129 = _1197;
        _1131 = _1179;
    }
    float _1199 = _1147;
    float _1201 = _1127;
    float _1203 = _1129;
    float _1205 = _1131;
    float _1207 = _1205;
    if (!_1033)
    {
        float _1209 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = _1211 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 0.15915493667125701904296875;
        float _1221 = _1211 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = 1.0 / _1217;
        float _1227 = _1219 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = _1223 * _1225;
        float _1233 = _1219 * 6.283185482025146484375;
        float _1235 = sin(_1233);
        float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1239 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1237;
        float _1241 = _1229 * _1231;
        float _1243 = 1.0 / _1239;
        float _1245 = 1.0 / _1241;
        float _1247 = _1235 * _1245;
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = fma(_1141, _1247, _1249);
        float _1253 = _1251 * _1243;
        float _1255 = precise::clamp(_1253, 0.0, 1.0);
        _1207 = _1243;
        _1133 = _1219;
        _1143 = _1255;
    }
    float _1257 = _1207;
    float _1259 = _1133;
    float _1261 = _1143;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1265 = _1199 + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1269 = _1201 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1273 = _1203 + _1271;
    float _1275 = _1265 * _1265;
    float _1277 = fma(_1269, _1269, _1275);
    float _1279 = fma(_1273, _1273, _1277);
    float _1281 = rsqrt(_1279);
    float _1283 = sqrt(_1279);
    float _1285 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1287 = _1269 * _1285;
    float _1289 = _1273 * _1285;
    float _1291 = _1287 * _1287;
    float _1293 = _1289 * _1289;
    float _1295 = _1291 + _1293;
    float _1297 = sqrt(_1295);
    bool _1299 = _1297 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = _1297 + _1301;
    float _1305 = _1281;
    float _1307 = _1259;
    float _1309 = _1303;
    float _1311 = _1265;
    if (_1299)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1305 = _1313;
    }
    float _1315 = _1305;
    if (_1299)
    {
        float _1317 = rsqrt(_1295);
        _1307 = _1317;
    }
    float _1319 = _1307;
    float _1321 = _1319;
    if (_1299)
    {
        float _1323 = _1303 * _1315;
        _1309 = _1323;
    }
    float _1325 = _1309;
    if (_1299)
    {
        float _1327 = _1325 * 0.15915493667125701904296875;
        _1135 = _1327;
    }
    float _1329 = _1135;
    float _1331 = _1273;
    if (_1299)
    {
        float _1333 = _1329 * 6.283185482025146484375;
        float _1335 = sin(_1333);
        _1331 = _1335;
    }
    float _1337 = _1331;
    float _1339 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1341 = precise::max(0.0, _1339);
    float _1343 = _1257;
    float _1345 = _1341;
    if (_1299)
    {
        float _1347 = _1329 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        _1343 = _1349;
    }
    float _1351 = _1343;
    float _1353 = -_1285;
    float _1355 = -_1341;
    float _1357 = fma(_1265, _1353, _1355);
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1299)
    {
        _1311 = _1289;
    }
    float _1361 = _1311;
    float _1363 = fma(_873, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1365 = _1361;
    if (_1299)
    {
        float _1367 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1373 = _1369;
    float _1375 = _1337;
    if (_1299)
    {
        float _1377 = fma(_1337, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1373 = _1377;
    }
    float _1379 = _1373;
    float _1381 = _1379;
    if (!_1299)
    {
        _1375 = _1357;
    }
    float _1383 = _1375;
    float _1385 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1371);
    float _1387 = _1383;
    float _1389 = _1351;
    if (_1299)
    {
        float _1391 = _1351 + (-1.0);
        _1359 = _1391;
    }
    float _1393 = _1359;
    float _1395 = 0.0;
    float _1397 = _1393;
    if (_1299)
    {
        float _1399 = _1319 * _1379;
        _1395 = _1399;
    }
    float _1401 = _1395;
    if (!_1299)
    {
        _1321 = _1287;
    }
    float _1403 = _1321;
    float _1405 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1385);
    float _1407 = _1403;
    if (_1299)
    {
        float _1409 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1397 = _1409;
    }
    float _1411 = _1397;
    if (_1299)
    {
        float _1413 = _1287 * _1401;
        _1407 = _1413;
    }
    float _1415 = _1407;
    if (!_1299)
    {
        _1381 = _1291;
    }
    float _1417 = _1381;
    float _1419 = _1417;
    if (_1299)
    {
        float _1421 = _1289 * _1401;
        _1365 = _1421;
    }
    float _1423 = _1365;
    if (_1299)
    {
        float _1425 = fma(_1357, _1351, _1411);
        _1387 = _1425;
    }
    float _1427 = _1387;
    if (_1299)
    {
        float _1429 = _1415 * _1415;
        _1419 = _1429;
    }
    float _1431 = _1419;
    if (!_1299)
    {
        _1389 = _1293;
    }
    float _1433 = _1389;
    float _1435 = _1433;
    if (_1299)
    {
        float _1437 = _1423 * _1423;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1443 = fma(_1427, _1427, _1431);
    float _1445 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = _1443 + _1439;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = floor(_1363);
    float _1457 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1459 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1461 = -_1453;
    float _1463 = _1461 + 1.0;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1467 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1469 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1471 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1459);
    float _1473 = rsqrt(_1447);
    float _1475 = -_1467;
    float _1477 = fma(_1475, _1465, 1.0);
    float _1479 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1483 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1487 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1481);
    float _1489 = abs(_1463);
    float _1491 = log2(_1489);
    float _1493 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1485);
    float _1495 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1499 = _1473 * _1415;
    float _1501 = _1473 * _1427;
    float _1503 = _1473 * _1423;
    float _1505 = floor(_1457);
    float _1507 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1509 = -_1507;
    float _1511 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1509);
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1515 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1517 = log2(_1477);
    float _1519 = -_1503;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1511);
    float _1523 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1513);
    float _1525 = -_1455;
    float _1527 = _1363 + _1525;
    float _1529 = fma(_1521, -0.5, 0.5);
    float _1531 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1523);
    float _1533 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = exp2(_1515);
    float _1537 = fma(_1521, 0.5, 0.5);
    float _1539 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1531);
    float _1541 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1543 = -_1505;
    float _1545 = _1457 + _1543;
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1551 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1541);
    float _1553 = 1.0 / _1539;
    float _1555 = _1501 + 1.0;
    float _1557 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1559 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1551);
    float _1561 = _1517 * 0.693147182464599609375;
    float _1563 = fma(_1537, _1557, 1.570728778839111328125);
    float _1565 = sqrt(_1529);
    float _1567 = -_1501;
    float _1569 = fma(_1535, _1555, _1567);
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1549);
    float _1575 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1559);
    float _1577 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1579 = _1575 * _1553;
    float _1581 = _1565 * 0.636619746685028076171875;
    float _1583 = _1577 * _1553;
    float _1585 = fma(_1579, -0.5, 0.5);
    float _1587 = -_1563;
    float _1589 = fma(_1581, _1587, 1.0);
    float _1591 = fma(_1583, 0.5, 0.5);
    float _1593 = fma(_1569, 0.5, 0.5);
    float2 _4694 = float2(_1527, _1545);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4694, float2(0.0), isnan(_4694)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4694, float2(0.0), isnan(_4694)), level(0.0)).x;
    float3 _4705 = float3(_1591, _1585, _1571);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4705, float3(0.0), isnan(_4705)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4705, float3(0.0), isnan(_4705)), level(0.0)).x;
    float3 _4716 = float3(_1591, _1585, _1571);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4716, float3(0.0), isnan(_4716)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4716, float3(0.0), isnan(_4716)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _4732 = float2(_1589, _1593);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4732, float2(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4732, float2(0.0), isnan(_4732)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1622 = _803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1624 = _473 > 0.5;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1628 = _1626 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1630 = _479 > 0.5;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1632;
    bool _1636 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1638 = isnan(_471);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = 1.0 / _1628;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1652 = _471 + _1650;
    bool _1654 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1656 = isnan(_471);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1662 = _1658 || _1660;
    float _1664 = float(_1662);
    out.m_66.x = _1201;
    out.m_66.y = _1199;
    out.m_66.z = _1203;
    float _1666 = -_1646;
    float _1668 = _1666 + 1.0;
    bool _1670 = _475 > 0.5;
    float _1672 = -_773;
    int _1674 = _1630 ? as_type<int>(_1672) : as_type<int>(_773);
    float _1676 = _1664 * _1668;
    float _1678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1682 = _1680 != 0;
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1686 = _1684 != 0;
    float _1688 = _1634 * _1648;
    float _1690 = -_769;
    int _1692 = _1624 ? as_type<int>(_1690) : as_type<int>(_769);
    bool _1694 = _477 > 0.5;
    float _1696 = fma(_1688, _1652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = -_773;
    int _1700 = _1670 ? as_type<int>(_1698) : as_type<int>(_773);
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1706 = _1704 != 0;
    float _1708 = _1696 * _1676;
    float _1710 = -_1664;
    float _1712 = _1710 + 1.0;
    bool _1714 = !_1682;
    float _1716 = _1714 ? _773 : as_type<float>(_1700);
    bool _1718 = !_1686;
    float _1720 = _1718 ? _769 : as_type<float>(_1692);
    float _1722 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1708);
    float _1724 = -_769;
    int _1726 = _1694 ? as_type<int>(_1724) : as_type<int>(_769);
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1732 = _1730 != 0;
    float _1734 = -_1716;
    float _1736 = _1734 + 0.5;
    bool _1738 = !_1706;
    float _1740 = _1738 ? _769 : as_type<float>(_1726);
    float _1742 = _1720 + 0.5;
    bool _1744 = !_1732;
    float _1746 = _1744 ? _773 : as_type<float>(_1674);
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1750 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1722);
    float _1752 = _1740 + 0.5;
    float _1754 = abs(_1141);
    float _1756 = log2(_1754);
    float _1758 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1760 = -_1746;
    float _1762 = _1760 + 0.5;
    float _1764 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1766 = _1748 * _1678;
    float _1768 = _1758 * _1620;
    float _1770 = _1764 * _1702;
    float _1772 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1774 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1776 = _1772 * _1728;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1782 = _803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1786 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1794 = _803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_68.x = _1768;
    out.m_68.y = _1766;
    out.m_68.z = _1770;
    out.m_68.w = _1776;
    float _1796 = exp2(_1786);
    float _1798 = _769 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1800 = -_797;
    float _1802 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1794);
    out.m_70.x = _1788;
    out.m_70.y = _1790;
    out.m_70.z = _1792;
    out.m_70.w = _1774;
    bool _1804 = _1141 <= 8000.0;
    bool _1806 = isnan(_1141);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(8000.0);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    bool _1816 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1818 = isnan(_1283);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1824 = _1820 || _1822;
    float _1826 = -_797;
    float _1828 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1782);
    float _1830 = -_797;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1834 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1802);
    float _1836 = _817 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1838 = _773 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1840 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1842 = _817 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1844 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1846 = precise::clamp(_1844, 0.0, 1.0);
    float _1848 = fma(_1838, _1838, 1.0);
    float _1850 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1828);
    float _1852 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1832);
    float _1854 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1856 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1858 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1836);
    float _1860 = rsqrt(_1848);
    float _1862 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1840);
    float _1864 = _817 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1866 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1842);
    float _1868 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1858);
    float _1870 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1864);
    float _1872 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1866);
    float _1874 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1854);
    float _1876 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1856);
    float _1878 = fma(_1846, -2.0, 3.0);
    float _1880 = _1846 * _1846;
    float _1882 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1870);
    float _1884 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1886 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1862);
    float _1888 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1890 = _1838 * _1850;
    float _1892 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1894 = _1880 * _1878;
    float _1896 = _1838 * _1860;
    float _1898 = _1838 * _1834;
    float _1900 = fma(_1798, _1872, _1890);
    float _1902 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1892);
    float _1904 = -_1894;
    float _1906 = _1904 + 1.0;
    float _1908 = -_1884;
    float _1910 = _1896 * _1908;
    float _1912 = -_1886;
    float _1914 = _1896 * _1912;
    out.m_72.x = _1868;
    out.m_72.y = _1872;
    out.m_72.z = _1882;
    float _1916 = -_1888;
    float _1918 = _1896 * _1916;
    float _1920 = fma(_1798, _1868, _1898);
    float _1922 = fma(_1906, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1894);
    float _1924 = fma(_1860, _1834, _1910);
    float _1926 = fma(_1860, _1850, _1914);
    float _1928 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1902);
    float _1930 = _1814 * _1922;
    float _1932 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1936 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1938 = _1838 * _1852;
    float _1940 = fma(_1860, _1852, _1918);
    float _1942 = exp2(_1936);
    float _1944 = in.m_74.x;
    float _1946 = fma(_1798, _1882, _1938);
    float _1948 = _1932 + _1539;
    out.m_76.x = _1924;
    out.m_76.y = _1926;
    out.m_76.z = _1940;
    float _1950 = _1888 + _1946;
    float _1952 = _1948 * 0.5;
    float _1954 = _1884 + _1920;
    out.gl_Position.x = _1577;
    out.gl_Position.y = _1575;
    out.gl_Position.z = _1932;
    out.gl_Position.w = _1539;
    float _1956 = _1886 + _1900;
    out.m_78.z = _1952;
    out.m_78.w = _1539;
    float _1958 = -_1942;
    float _1960 = _1958 + 1.0;
    out.m_80.x = _1954;
    out.m_80.y = _1956;
    out.m_80.z = _1950;
    float _1962 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1966 = _1539;
    float _1968 = _1932;
    float _1970 = _1575;
    if (!_1824)
    {
        _1966 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1972 = _1966;
    float _1974 = _1972;
    float _1976 = _1972;
    if (!_1824)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1978 = _1968;
    float _1980 = _1978;
    float _1982 = _1978;
    if (!_1824)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1984 = _1970;
    float _1986 = -_1595;
    float _1988 = _1986 + 1.0;
    float _1990 = _1964 * _1597;
    float _1992 = -_1964;
    float _1994 = _1992 + 1.0;
    float _1996 = _1988 * _1934;
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = _1608 * _1990;
    float _2002 = _1618 * _1990;
    float _2004 = _1608 * _1994;
    float _2006 = -_1998;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2010 = fma(_1614, _2000, _1602);
    float _2012 = fma(_1616, _2000, _1604);
    float _2014 = fma(_1608, _2002, _1606);
    float _2016 = _2008 * _1944;
    float _2018 = _1994;
    float _2020 = _2016;
    float _2022 = _1984;
    float _2024 = _1984;
    if (!_1824)
    {
        _2018 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2026 = _2018;
    out.m_82.x = _2010;
    out.m_82.y = _2012;
    out.m_82.z = _2014;
    out.m_82.w = _2004;
    float _2028 = _2016 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2030 = _2028;
    float _2032 = _2026;
    float _2034 = _2026;
    if (!_1824)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2020;
    out.m_84.x = _2028;
    float _2038 = _2036;
    float _2040 = _2036;
    if (!_1824)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2042 = _2030;
    bool _2044 = !_1824;
    float _2046 = _2042;
    float _2048 = _2042;
    if (!_2044)
    {
        bool _2050 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2052 = isnan(_1283);
        bool _2054 = _2050 || _2052;
        bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2058 = _2054 || _2056;
        if (!_2058)
        {
            float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2062 = _1283 + _2060;
            float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2066 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2064;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2072 = 1.0 / _2066;
            float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2090 = _2062 * _2072;
            float _2092 = precise::clamp(_2090, 0.0, 1.0);
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2098 = fma(_2092, _2070, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2100 = fma(_2092, _2096, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2102 = fma(_2092, _2076, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2104 = fma(_2092, _2080, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2106 = fma(_2092, _2084, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2108 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2034 = _2102;
            _2024 = _2106;
            _2040 = _2098;
            _1982 = _2104;
            _1976 = _2100;
            _2048 = _2108;
            _2110 = true;
        }
        else
        {
            bool _2112 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2114 = isnan(_1283);
            bool _2116 = _2112 || _2114;
            bool _2118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2120 = _2116 || _2118;
            if (!_2120)
            {
                _2038 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2122 = _2038;
            _2040 = _2122;
            if (!_2120)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2124 = _2032;
            _2034 = _2124;
            if (!_2120)
            {
                _1974 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2126 = _1974;
            _1976 = _2126;
            if (!_2120)
            {
                _1980 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2128 = _1980;
            _1982 = _2128;
            if (!_2120)
            {
                _2022 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2130 = _2022;
            _2024 = _2130;
            if (!_2120)
            {
                _2046 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2132 = _2046;
            bool _2134 = !_2120;
            _2048 = _2132;
            if (!_2134)
            {
                bool _2136 = _1283 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2138 = isnan(_1283);
                bool _2140 = _2136 || _2138;
                bool _2142 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2144 = _2140 || _2142;
                if (!_2144)
                {
                    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2148 = _1283 + _2146;
                    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2152 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2150;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2158 = 1.0 / _2152;
                    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2176 = _2148 * _2158;
                    float _2178 = precise::clamp(_2176, 0.0, 1.0);
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2184 = fma(_2178, _2156, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2186 = fma(_2178, _2182, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2188 = fma(_2178, _2162, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2190 = fma(_2178, _2166, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2192 = fma(_2178, _2170, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2194 = fma(_2178, _2174, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2034 = _2188;
                    _2024 = _2192;
                    _2040 = _2184;
                    _1982 = _2190;
                    _1976 = _2186;
                    _2048 = _2194;
                    _2110 = true;
                }
                else
                {
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2024 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2040 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1982 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1976 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2048 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2110 = false;
    float _2196 = _2034;
    float _2198 = _2024;
    float _2200 = _2040;
    float _2202 = _1982;
    float _2204 = _1976;
    float _2206 = _2048;
    float _2208 = fma(_1956, -0.5, 0.5);
    float _2210 = precise::clamp(_2208, 0.0, 1.0);
    float _2212 = -_2196;
    float _2214 = _2212 + _2198;
    float _2216 = _1962 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2218 = -_2200;
    float _2220 = _2218 + _2202;
    float _2222 = fma(_2210, _2214, _2196);
    out.m_86.x = 0.0;
    float _2224 = -_2204;
    float _2226 = _2224 + _2206;
    float _2228 = fma(_2210, _2220, _2200);
    float _2230 = _2222 * 0.586610972881317138671875;
    out.m_49.x = _2216;
    bool _2232 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2234 = fma(_2210, _2226, _2204);
    float _2236 = fma(_2228, 0.298911988735198974609375, _2230);
    bool _2238 = _1261 > 0.0;
    bool _2240 = isnan(_1261);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(0.0);
    bool _2246 = _2242 || _2244;
    float _2248 = fma(_2234, 0.114477999508380889892578125, _2236);
    float _2250 = -_2248;
    float _2252 = _2228 + _2250;
    float _2254 = -_2248;
    float _2256 = _2222 + _2254;
    float _2258 = -_2248;
    float _2260 = _2234 + _2258;
    float _2262 = fma(_2252, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    float _2264 = fma(_2256, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    float _2266 = fma(_2260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2248);
    bool _2268 = !_2232;
    if (!_2268)
    {
        float _2270 = -_1199;
        float _2272 = _2270 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2274 = -_1201;
        float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2278 = -_1203;
        float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2282 = _2272 * _2272;
        float _2284 = fma(_2276, _2276, _2282);
        float _2286 = fma(_2280, _2280, _2284);
        float _2288 = sqrt(_2286);
        float _2290 = rsqrt(_2286);
        float _2292 = -_2288;
        float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2296 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2298 = precise::clamp(_2296, 0.0, 1.0);
        float _2300 = _2276 * _2290;
        float _2302 = _2272 * _2290;
        float _2304 = abs(_2298);
        float _2306 = log2(_2304);
        float _2308 = _2280 * _2290;
        float _2310 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2312 = _1956 * _2302;
        float _2314 = -_2302;
        float _2316 = -_2310;
        float _2318 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2316);
        float _2320 = fma(_1954, _2300, _2312);
        float _2322 = -_2308;
        float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2318);
        float _2326 = fma(_1950, _2308, _2320);
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2332 = _2324 + _2330;
        float _2334 = _2306 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2336 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2338 = precise::clamp(_2336, 0.0, 1.0);
        float _2340 = exp2(_2334);
        float _2342 = _2340 * _2338;
        float _2344 = _2328 * _2342;
        float _2346 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2348 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2350 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2346;
        out.m_86.y = _2348;
        out.m_86.z = _2350;
    }
    out.m_88.x = _2262;
    out.m_88.y = _2264;
    out.m_88.z = _2266;
    if (_2246)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2352 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2352;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

