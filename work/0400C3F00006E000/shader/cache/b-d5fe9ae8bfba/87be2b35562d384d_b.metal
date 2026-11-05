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
    float4 m_70 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2873 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_125);
        out.gl_Position.z = _3160;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3234 = as_type<float>(_165);
        out.gl_Position.z = _3234;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_107);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = in.m_51.y;
    float _217 = _131 * 2.0;
    float _219 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _221 = in.m_44.x;
    float _223 = in.m_44.y;
    float _225 = in.m_44.z;
    float _227 = floor(_217);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _213 + _229;
    float _233 = in.m_58.x;
    float _235 = in.m_58.y;
    float _237 = in.m_58.z;
    float _239 = in.m_58.w;
    float _241 = in.m_60.x;
    float _243 = in.m_60.y;
    float _245 = in.m_60.z;
    float _247 = in.m_60.w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _259 = in.m_51.z;
    float _261 = 1.0 / _255;
    float _263 = -_257;
    float _265 = fma(_219, 2.0, _263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = _227 > 0.0;
    float _273 = _215 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = 1.0 / _251;
    float _277 = _215 * 2.0;
    float _279 = _223 * _235;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _283 = floor(_277);
    float _285 = fma(_221, _233, _279);
    bool _287 = _227 >= 0.0;
    bool _289 = isnan(_227);
    bool _291 = _287 || _289;
    bool _293 = isnan(0.0);
    bool _295 = _291 || _293;
    float _297 = _223 * _243;
    float _299 = fma(_273, -2.0, _281);
    float _301 = _131 + _259;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _313 = _311 != 0;
    float _315 = _259 * 2.0;
    float _317 = 1.0 / _269;
    float _319 = _301 + (-1.0);
    float _321 = fma(_221, _241, _297);
    bool _323 = !_309;
    int _325 = _323 ? 0 : 1;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = _213 + _327;
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _333 = _295 ? 0 : 1;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _213 + _335;
    bool _339 = _283 > 0.0;
    float _341 = floor(_315);
    bool _343 = _283 >= 0.0;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = _329 * _275;
    bool _355 = !_305;
    int _357 = _355 ? 0 : 1;
    float _359 = _131 + _215;
    bool _361 = !_313;
    int _363 = _361 ? 0 : 1;
    float _365 = _231 * _261;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _377 = _375 != 0;
    float _379 = _359 + (-1.0);
    float _381 = _337 * _317;
    float _383 = _259 + _215;
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _387 = !_369;
    int _389 = _387 ? 0 : 1;
    float _391 = _383 + (-1.0);
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _395 = _393 != 0;
    float _397 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _399 = int(_397);
    float _401 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _299);
    bool _403 = _341 >= 0.0;
    bool _405 = isnan(_341);
    bool _407 = _403 || _405;
    bool _409 = isnan(0.0);
    bool _411 = _407 || _409;
    float _413 = fma(_225, _237, _285);
    float _415 = fma(_225, _245, _321);
    int _417 = ~_333;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _425 = int(_423);
    int _427 = _421;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].z);
    float _431 = _223;
    float _433 = _225;
    if (!_271)
    {
        int _435 = ~_333;
        int _437 = _435 + 1;
        _427 = _437;
    }
    int _439 = _427;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _441;
    bool _445 = _341 > 0.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    if (_395)
    {
        _429 = 0;
    }
    int _451 = _429;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _457 = _451;
    if (!_395)
    {
        _457 = 1;
    }
    int _459 = _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _465 = _411 ? 0 : 1;
    float _467 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _469 = _459 != 1;
    float _471 = fma(_443, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _473 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_213);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_455, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_463, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _489 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_213);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = fma(_449, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _507 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _509 = isnan(_213);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _519;
    float _523 = -_499;
    float _525 = _523 + 1.0;
    float _527 = _499 * _503;
    bool _529 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _531 = isnan(_213);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_521, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = _517 * _525;
    float _545 = -_517;
    float _547 = _545 + 1.0;
    float _549 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _551 = log2(_549);
    float _553 = _539 * _547;
    float _555 = float(_107);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _557;
    float _561 = _505;
    float _563 = _547;
    if (!_469)
    {
        _115 = _215;
    }
    float _565 = _115;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _569 = _565;
    if (_469)
    {
        _569 = _131;
    }
    float _571 = _569;
    float _573 = _471 * _553;
    float _575 = _505 * _553;
    float _577 = fma(_559, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].z, _567);
    float _581 = _571;
    if (!_469)
    {
        _561 = _259;
    }
    float _583 = _561;
    float _585 = 1.0 / _555;
    int _587 = ~_465;
    int _589 = _587 + 1;
    int _591 = _589 + 1;
    float _593 = _551 * _145;
    float _595 = _583;
    int _597 = _591;
    if (_469)
    {
        _595 = _215;
    }
    float _599 = _595;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_445)
    {
        int _603 = ~_465;
        int _605 = _603 + 1;
        _597 = _605;
    }
    int _607 = _597;
    float _609 = -_539;
    float _611 = _609 + 1.0;
    float _613 = _599 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _615 = abs(_389);
    float _617 = exp2(_593);
    if (!_469)
    {
        _581 = _259;
    }
    float _619 = _581;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _623 = _619;
    if (_469)
    {
        _623 = _215;
    }
    float _625 = _623;
    float _627 = _413 + _239;
    float _629 = float(_615);
    float _631 = fma(_613, -2.0, _621);
    float _633 = float(_607);
    float _635 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[83].w, _601);
    float _637 = float(_399);
    float _639 = _585 * _145;
    if (!_469)
    {
        _563 = _215;
    }
    float _641 = _563;
    float _643 = _629 * _633;
    float _645 = in.m_62.x;
    float _647 = in.m_62.y;
    float _649 = in.m_62.z;
    float _651 = -_617;
    float _653 = _651 + 1.0;
    float _655 = _641;
    if (_469)
    {
        _655 = _131;
    }
    float _657 = _655;
    float _659 = _643 * (-2.0);
    float _661 = float(_425);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _665 = 1.0 / _637;
    float _667 = _657 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _669 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(1.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = -_663;
    float _681 = fma(_667, 2.0, _679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _685 = 1.0 / _661;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _689 = 1.0 + _687;
    bool _691 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _699 = _695 || _697;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _703 = !_373;
    int _705 = _703 ? 0 : 1;
    float _707 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[78].w, _683);
    float _709 = _699 ? _653 : 0.0;
    float _711 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _701);
    float _713 = 1.0 / _689;
    float _715 = -_145;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[76].x, _265);
    float _719 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _579);
    float _721 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _635);
    float _723 = _665 * _145;
    float _725 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _727 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _707);
    float _729 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _631);
    float _731 = _685 * _145;
    float _733 = -_145;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[81].x, _681);
    int _737 = abs(_705);
    float _739 = fma(_385, _659, _385);
    float _741 = float(_439);
    float _743 = float(_737);
    float _745 = _723;
    float _747 = _731;
    if (_677)
    {
        float _749 = _709 * _713;
        _147 = _749;
    }
    float _751 = _147;
    float _753 = fma(_659, _645, _645);
    float _755 = _131 + (-0.5);
    float _757 = _743 * _741;
    int _759 = _351 ? 0 : 1;
    float _761 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].x, _753);
    bool _763 = !_377;
    int _765 = _763 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _767;
    int _771 = ~_759;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = _757 * (-2.0);
    int _779 = _775;
    if (!_339)
    {
        int _781 = ~_759;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = fma(_739, _751, _761);
    int _789 = abs(_765);
    float _791 = fma(_777, _647, _647);
    float _793 = float(_785);
    float _795 = _769 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _797 = float(_789);
    float _799 = _787 * 0.15915493667125701904296875;
    float _801 = _215 + (-0.5);
    float _803 = fma(_467, _777, _467);
    float _805 = precise::max(0.0, _795);
    float _807 = _797 * _793;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[196].y, _791);
    float _811 = _799 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _807 * (-2.0);
    float _817 = precise::max(_805, 375.0);
    float _819 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _573);
    float _821 = in.m_64.x;
    float _823 = in.m_64.y;
    float _825 = fma(_815, _649, _649);
    float _827 = _259 + (-0.5);
    float _829 = fma(_331, _815, _331);
    float _831 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _575);
    float _833 = fma(_803, _751, _809);
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _837 = precise::min(_817, 550.0);
    float _839 = fma(_485, _543, _819);
    float _841 = fma(_487, _543, _831);
    float _843 = fma(_829, _751, _835);
    float _845 = _833 * 0.15915493667125701904296875;
    float _847 = fma(_837, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _849 = precise::clamp(_847, 0.0, 1.0);
    float _851 = _843 * 0.15915493667125701904296875;
    float _853 = fma(_577, _527, _841);
    float _855 = fma(_541, _527, _839);
    float _857 = _799 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _863 = _861 + 1.0;
    float _865 = -_849;
    float _867 = _865 + 1.0;
    float _869 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[146].y, _853);
    float _871 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[146].x, _855);
    float _873 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _875 = _869 * _823;
    float _877 = _845 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _871 * _821;
    float _883 = _185 * _873;
    float _885 = _181 * _873;
    float _887 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _883);
    float _893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _885);
    float _895 = _845 * 6.283185482025146484375;
    float _897 = cos(_895);
    float _899 = _887 * _891;
    float _901 = _889 * _893;
    float _903 = _851 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _859 * _879;
    float _909 = _813 * _879;
    float _911 = _851 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = _859 * _897;
    float _917 = _813 * _897;
    float _919 = _859 * _905;
    float _921 = _813 * _905;
    float _923 = _897 * _905;
    float _925 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _927 = _919 * _899;
    float _929 = _879 * _905;
    float _931 = _921 * _899;
    float _933 = fma(_913, _915, _909);
    float _935 = -_907;
    float _937 = fma(_913, _917, _935);
    float _939 = -_917;
    float _941 = fma(_913, _907, _939);
    float _943 = -_899;
    float _945 = _913 * _943;
    float _947 = fma(_933, _901, _927);
    float _949 = fma(_913, _909, _915);
    float _951 = fma(_923, _901, _945);
    float _953 = fma(_941, _925, _947);
    float _955 = fma(_937, _901, _931);
    float _957 = _415 + _247;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _961 = _959 + 1.0;
    float _963 = fma(_929, _925, _951);
    float _965 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _967 = fma(_949, _925, _955);
    float _969 = fma(_867, _961, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _971 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].x, _965);
    float _975 = fma(_867, 0.10000002384185791015625, 0.89999997615814208984375);
    float _977 = -_225;
    float _979 = fma(_969, _225, _977);
    float _981 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].x, _971);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _973);
    float _985 = -_221;
    float _987 = fma(_969, _221, _985);
    float _989 = _979 + _627;
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _981);
    float _993 = _983 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _995 = in.m_66.x;
    float _997 = in.m_66.y;
    float _999 = in.m_66.z;
    float _1001 = in.m_66.w;
    float _1003 = _987 + _957;
    float _1005 = _991 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _989 + _993;
    float _1009 = _1003 + _1005;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1013 = _1007 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1009 + _1015;
    float _1019 = _1013 * _1013;
    float _1021 = fma(_1017, _1017, _1019);
    float _1023 = sqrt(_1021);
    float _1025 = _223 * _997;
    float _1027 = fma(_221, _995, _1025);
    float _1029 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1031 = -_223;
    float _1033 = fma(_975, _223, _1031);
    float _1035 = fma(_225, _999, _1027);
    float _1037 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1029);
    bool _1039 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1041 = _1035 + _1001;
    float _1043 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1037);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1059 = _1057 != 0;
    float _1061 = _1033 + _1041;
    float _1063 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1067 = isnan(0.5);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1073 = _1069 || _1071;
    bool _1075 = !_1051;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _1061 + _1063;
    bool _1081 = !_1047;
    int _1083 = _1081 ? 0 : 1;
    bool _1085 = !_1055;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1059;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = _1009;
    float _1095 = _1007;
    float _1097 = _1029;
    float _1099 = _1003;
    if (!_1039)
    {
        _431 = _1079;
    }
    float _1101 = _431;
    bool _1103 = !_1039;
    float _1105 = _1101;
    if (!_1103)
    {
        float _1107 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1111 = _1023 + _1109;
        float _1113 = _1079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1115 = rsqrt(_1021);
        float _1117 = _1111 * _1107;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1119 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = _1119 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = _1123 + (-1.0);
        float _1131 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1133 = fma(_1127, _1113, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1135 = fma(_1079, _1123, _1131);
        float _1137 = _1115 * _1133;
        float _1139 = fma(_1017, _1137, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1141 = fma(_1013, _1137, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1093 = _1139;
        _1095 = _1141;
        _1105 = _1135;
        _1097 = _1127;
        _433 = _1131;
    }
    float _1143 = _1093;
    float _1145 = _1095;
    float _1147 = _1105;
    float _1149 = _1097;
    float _1151 = _433;
    float _1153 = _1149;
    float _1155 = _1151;
    float _1157 = _1147;
    float _1159 = _1145;
    if (_1073)
    {
        _1153 = _1143;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (_1073)
    {
        _1155 = _1145;
    }
    float _1165 = _1155;
    float _1167 = _1165;
    if (!_1073)
    {
        float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1171 = _1061 + _1169;
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1175 = _1003 + _1173;
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1179 = -_1003;
        float _1181 = _1179 + _1143;
        float _1183 = _1171 * _1171;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1187 = _989 + _1185;
        float _1189 = -_1061;
        float _1191 = _1189 + _1147;
        float _1193 = fma(_1175, _1175, _1183);
        float _1195 = fma(_1187, _1187, _1193);
        float _1197 = -_989;
        float _1199 = _1197 + _1145;
        float _1201 = sqrt(_1195);
        float _1203 = precise::min(_1201, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1205 = _1203 * _1177;
        float _1207 = fma(_1181, _1205, _1003);
        float _1209 = fma(_1191, _1205, _1061);
        float _1211 = fma(_1199, _1205, _989);
        _1157 = _1209;
        _1163 = _1207;
        _1167 = _1211;
    }
    float _1213 = _1157;
    float _1215 = _1163;
    float _1217 = _1167;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1213 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1215 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = _1221 * _1221;
    float _1233 = fma(_1225, _1225, _1231);
    float _1235 = fma(_1229, _1229, _1233);
    float _1237 = rsqrt(_1235);
    float _1239 = sqrt(_1235);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1243 = _1225 * _1241;
    float _1245 = _1229 * _1241;
    float _1247 = _1243 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = _1247 + _1249;
    float _1253 = sqrt(_1251);
    bool _1255 = _1253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1259 = _1253 + _1257;
    float _1261 = _989;
    float _1263 = _1259;
    float _1265 = _1221;
    float _1267 = _1243;
    if (_1255)
    {
        float _1269 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1261 = _1269;
    }
    float _1271 = _1261;
    float _1273 = _1271;
    if (_1255)
    {
        float _1275 = _1259 * _1271;
        _1263 = _1275;
    }
    float _1277 = _1263;
    if (_1255)
    {
        float _1279 = rsqrt(_1251);
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = _1281;
    if (_1255)
    {
        float _1285 = _1277 * 0.15915493667125701904296875;
        _1099 = _1285;
    }
    float _1287 = _1099;
    float _1289 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1291 = _1229;
    if (_1255)
    {
        float _1293 = _1287 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        _1291 = _1295;
    }
    float _1297 = _1291;
    float _1299 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1301 = precise::max(0.0, _1289);
    float _1303 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1299);
    float _1305 = _975;
    float _1307 = _1301;
    if (_1255)
    {
        float _1309 = _1287 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -_1241;
    float _1317 = -_1301;
    float _1319 = fma(_1221, _1315, _1317);
    float _1321 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    if (_1255)
    {
        float _1323 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1323;
    }
    float _1325 = _1265;
    float _1327 = _1297;
    float _1329 = _1325;
    if (_1255)
    {
        float _1331 = fma(_1297, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = _1333;
    if (!_1255)
    {
        _1329 = _1319;
    }
    float _1337 = _1329;
    float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1341 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1339);
    float _1343 = precise::clamp(_1341, 0.0, 1.0);
    float _1345 = _1337;
    if (_1255)
    {
        float _1347 = _1281 * _1333;
        _1159 = _1347;
    }
    float _1349 = _1159;
    if (!_1255)
    {
        _1335 = _1247;
    }
    float _1351 = _1335;
    float _1353 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1351;
    float _1357 = _1313;
    if (_1255)
    {
        float _1359 = _1313 + (-1.0);
        _1307 = _1359;
    }
    float _1361 = _1307;
    float _1363 = _1361;
    if (_1255)
    {
        float _1365 = _1243 * _1349;
        _1267 = _1365;
    }
    float _1367 = _1267;
    float _1369 = -_1343;
    float _1371 = _1369 + 1.0;
    float _1373 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    if (_1255)
    {
        float _1375 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1375;
    }
    float _1377 = _1283;
    if (!_1255)
    {
        _1363 = _1245;
    }
    float _1379 = _1363;
    float _1381 = _1379;
    if (_1255)
    {
        float _1383 = _1245 * _1349;
        _1381 = _1383;
    }
    float _1385 = _1381;
    if (_1255)
    {
        float _1387 = _1367 * _1367;
        _1355 = _1387;
    }
    float _1389 = _1355;
    if (_1255)
    {
        float _1391 = fma(_1319, _1313, _1377);
        _1345 = _1391;
    }
    float _1393 = _1345;
    if (!_1255)
    {
        _1357 = _1249;
    }
    float _1395 = _1357;
    float _1397 = _1395;
    if (_1255)
    {
        float _1399 = _1385 * _1385;
        _1397 = _1399;
    }
    float _1401 = _1397;
    float _1403 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1405 = fma(_1393, _1393, _1389);
    float _1407 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1373);
    float _1409 = abs(_1371);
    float _1411 = log2(_1409);
    float _1413 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1403);
    float _1415 = _1405 + _1401;
    float _1417 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1421 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1413);
    float _1423 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1425 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1427 = rsqrt(_1415);
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1431 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1433 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1435 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1439 = -_1431;
    float _1441 = fma(_1439, _1423, 1.0);
    float _1443 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1437);
    float _1447 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1445);
    float _1449 = _1427 * _1367;
    float _1451 = _1427 * _1393;
    float _1453 = _1427 * _1385;
    float _1455 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1447);
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = log2(_1441);
    float _1461 = -_1457;
    float _1463 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1461);
    float _1465 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1467 = -_1453;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1463);
    float _1471 = 1.0 / _1455;
    float _1473 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = fma(_1469, -0.5, 0.5);
    float _1479 = fma(_1469, 0.5, 0.5);
    float _1481 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1483 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1485 = _1451 + 1.0;
    float _1487 = exp2(_1465);
    float _1489 = fma(_1479, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1491 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1481);
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1483);
    float _1495 = fma(_1479, _1489, -0.212114393711090087890625);
    float _1497 = sqrt(_1477);
    float _1499 = -_1451;
    float _1501 = fma(_1487, _1485, _1499);
    float _1503 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1491);
    float _1505 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1493);
    float _1507 = fma(_1479, _1495, 1.570728778839111328125);
    float _1509 = _1459 * 0.693147182464599609375;
    float _1511 = _1503 * _1471;
    float _1513 = _1505 * _1471;
    float _1515 = fma(_1501, 0.5, 0.5);
    float _1517 = _1497 * 0.636619746685028076171875;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1521 = fma(_1511, 0.5, 0.5);
    float _1523 = fma(_1513, -0.5, 0.5);
    float _1525 = -_1507;
    float _1527 = fma(_1517, _1525, 1.0);
    float3 _5349 = float3(_1521, _1523, _1519);
    float _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5349, float3(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5349, float3(0.0), isnan(_5349)), level(0.0)).x;
    float3 _5360 = float3(_1521, _1523, _1519);
    float4 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5360, float3(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5360, float3(0.0), isnan(_5360)), level(0.0)).xyzw;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = _1532.w;
    float2 _5377 = float2(_1527, _1515);
    float3 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5377, float2(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5377, float2(0.0), isnan(_5377)), level(0.0)).xyz;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1554 = int(_1552);
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1558 = _1556 != 0;
    float _1560 = -_719;
    float _1562 = _1560 + 1.0;
    bool _1564 = _131 > 0.5;
    float _1566 = -_725;
    float _1568 = _1566 + 1.0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1572 = _1570 != 0;
    float _1574 = -_727;
    float _1576 = _1574 + 1.0;
    bool _1578 = _215 > 0.5;
    float _1580 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1582 = int(_1580);
    bool _1584 = _259 > 0.5;
    float _1586 = -_721;
    float _1588 = _1586 + 1.0;
    int _1590 = abs(_1091);
    float _1592 = _885 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1594 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1596 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_68.x = _1215;
    out.m_68.y = _1213;
    out.m_68.z = _1217;
    float _1598 = float(uint(_1554));
    float _1600 = trunc(_723);
    int _1602 = int(_1600);
    float _1604 = float(_1554);
    float _1606 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1608 = float(uint(_1582));
    float _1610 = 1.0 / _1598;
    int _1612 = ~_1582;
    int _1614 = _1612 + 1;
    float _1616 = _1455;
    float _1618 = _1505;
    float _1620 = _1503;
    if (_1558)
    {
        _745 = 1.0;
    }
    float _1622 = _745;
    float _1624 = _1622;
    if (!_1558)
    {
        _1624 = 1.2345600128173828125;
    }
    float _1626 = _1624;
    float _1628 = 1.0 / _1608;
    float _1630 = trunc(_731);
    int _1632 = int(_1630);
    int _1634 = as_type<int>(_1610) + (-2);
    float _1636 = float(uint(_1602));
    int _1638 = ~_1554;
    int _1640 = _1638 + 1;
    int _1642 = as_type<int>(_1628) + (-2);
    float _1644 = as_type<float>(_1634) * _1636;
    if (_1558)
    {
        _747 = _131;
    }
    float _1646 = _747;
    float _1648 = exp2(_1596);
    float _1650 = _1646;
    if (!_1558)
    {
        _1650 = _215;
    }
    float _1652 = _1650;
    float _1654 = float(uint(_1632));
    float _1656 = _1626 * _1652;
    float _1658 = trunc(_1644);
    float _1660 = precise::max(_1658, 0.0);
    uint _1663 = uint(_1660);
    float _1665 = as_type<float>(_1642) * _1654;
    float _1667 = _1654;
    if (_1558)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    float _1671 = _1669;
    if (!_1558)
    {
        _1671 = 7.345489978790283203125;
    }
    float _1673 = _1671;
    float _1675 = trunc(_1665);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = -_1648;
    float _1683 = _1681 + 1.0;
    float _1685 = _1673 * _131;
    float _1687 = float(_1602);
    int _1689 = _1640 * int(_1663);
    int _1691 = _1689 + _1602;
    float _1693 = floor(_1685);
    float _1695 = float(uint(_1691));
    int _1697 = _1614 * int(_1679);
    int _1699 = _1697 + _1632;
    float _1701 = floor(_1656);
    float _1703 = as_type<float>(_1634) * _1695;
    float _1705 = float(uint(_1699));
    float _1707 = trunc(_1703);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = as_type<float>(_1642) * _1705;
    float _1715 = -_1693;
    float _1717 = _1685 + _1715;
    bool _1719 = _1687 >= _1604;
    bool _1721 = isnan(_1687);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan(_1604);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    int _1731 = ~_1582;
    int _1733 = _1731 + 1;
    float _1735 = _1717 * _1604;
    float _1737 = float(_1632);
    float _1739 = trunc(_1713);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = -_1701;
    float _1747 = _1656 + _1745;
    int _1749 = ~_1554;
    int _1751 = _1749 + 1;
    float _1753 = _1604 * _639;
    int _1755 = int(_1663) + int(_1711);
    float _1757 = trunc(_1735);
    int _1759 = int(_1757);
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1763 = _1761 != 0;
    int _1765 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1767 = _1765 != 0;
    int _1769 = _1751 * _1755;
    int _1771 = _1769 + _1602;
    int _1773 = int(_1679) + int(_1743);
    float _1775 = trunc(_1753);
    int _1777 = int(_1775);
    float _1779 = float(_1582);
    bool _1781 = uint(_1771) >= uint(_1554);
    bool _1783 = _1737 >= _1779;
    bool _1785 = isnan(_1737);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(_1779);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = _1779 * _639;
    bool _1797 = !_1781;
    int _1799 = _1797 ? 0 : (-1);
    float _1801 = trunc(_1729);
    int _1803 = int(_1801);
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1807 = _1805 != 0;
    int _1809 = ~_1755;
    int _1811 = _1809 + _1799;
    int _1813 = _1811 + 1;
    int _1815 = _1554 * _1813;
    int _1817 = _1815 + _1602;
    float _1819 = trunc(_1795);
    int _1821 = int(_1819);
    int _1823 = _1733 * _1773;
    int _1825 = _1823 + _1632;
    float _1827 = _1747 * _1779;
    bool _1829 = !_1763;
    int _1831 = _1829 ? 0 : 1;
    bool _1833 = uint(_1825) >= uint(_1582);
    float _1835 = trunc(_1793);
    int _1837 = int(_1835);
    int _1839 = abs(_1831);
    bool _1841 = !_1833;
    int _1843 = _1841 ? 0 : (-1);
    bool _1845 = _1582 == 0;
    int _1847 = _1759 * _1839;
    int _1849 = _1847 + _1602;
    int _1851 = ~_1773;
    int _1853 = _1851 + _1843;
    int _1855 = _1853 + 1;
    float _1857 = trunc(_1827);
    int _1859 = int(_1857);
    bool _1861 = !_1807;
    int _1863 = _1861 ? 0 : 1;
    bool _1865 = _1554 == 0;
    int _1867 = abs(_1863);
    int _1869 = _1582 * _1855;
    int _1871 = _1869 + _1632;
    int _1873 = ~_1803;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    bool _1879 = !_1865;
    int _1881 = _1879 ? _1817 : (-1);
    int _1883 = _1554 + (-1);
    int _1885 = ~_1837;
    int _1887 = _1885 + 1;
    int _1889 = _1887 + 1;
    int _1891 = _1881 * _1877;
    bool _1893 = !_1845;
    int _1895 = _1893 ? _1871 : (-1);
    int _1897 = _1859 * _1867;
    int _1899 = _1897 + _1632;
    int _1901 = _1582 + (-1);
    int _1903 = _1803 * _1883;
    int _1905 = _1903 + _1891;
    float _1907 = in.m_51.w;
    int _1909 = _1895 * _1889;
    int _1911 = abs(_325);
    int _1913 = ~_1554;
    int _1915 = _1913 + 1;
    int _1917 = _1837 * _1901;
    int _1919 = _1917 + _1909;
    int _1921 = abs(_357);
    int _1923 = _1905 * _1911;
    int _1925 = abs(_1077);
    int _1927 = abs(_1083);
    int _1929 = _1777 * _1921;
    int _1931 = _1929 + _1923;
    int _1933 = abs(_363);
    int _1935 = _1919 * _1925;
    bool _1937 = !_1572;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = float(uint(_1849));
    int _1943 = _1821 * _1927;
    int _1945 = _1943 + _1935;
    int _1947 = abs(_1087);
    int _1949 = _1849 * _1933;
    int _1951 = _1949 + _1931;
    int _1953 = abs(_1939);
    float _1955 = as_type<float>(_1634) * _1941;
    float _1957 = float(uint(_1899));
    int _1959 = _1899 * _1947;
    int _1961 = _1959 + _1945;
    bool _1963 = _1907 > 0.5;
    float _1965 = trunc(_1955);
    float _1967 = precise::max(_1965, 0.0);
    uint _1969 = uint(_1967);
    int _1971 = _1759 * _1953;
    int _1973 = _1971 + _1951;
    float _1975 = as_type<float>(_1642) * _1957;
    float _1977 = -_181;
    int _1979 = _1584 ? as_type<int>(_1977) : as_type<int>(_181);
    int _1981 = _1859 * _1590;
    int _1983 = _1981 + _1961;
    float _1985 = float(uint(_1973));
    float _1987 = -_181;
    int _1989 = _1564 ? as_type<int>(_1987) : as_type<int>(_181);
    float _1991 = trunc(_1975);
    float _1993 = precise::max(_1991, 0.0);
    uint _1995 = uint(_1993);
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1999 = _1997 != 0;
    float _2001 = as_type<float>(_1634) * _1985;
    float _2003 = float(uint(_1983));
    bool _2005 = !_1767;
    float _2007 = _2005 ? _181 : as_type<float>(_1989);
    bool _2009 = !_1999;
    float _2011 = _2009 ? _181 : as_type<float>(_1979);
    int _2013 = _1915 * int(_1969);
    int _2015 = _2013 + _1849;
    float _2017 = as_type<float>(_1642) * _2003;
    float _2019 = trunc(_2001);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    int _2025 = ~_1582;
    int _2027 = _2025 + 1;
    float _2029 = _2007 + 0.5;
    float _2031 = float(uint(_2015));
    float _2033 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[80].x, _717);
    int _2035 = ~_1554;
    int _2037 = _2035 + 1;
    float _2039 = trunc(_2017);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = ~_1582;
    int _2047 = _2045 + 1;
    int _2049 = _2027 * int(_1995);
    int _2051 = _2049 + _1899;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2055 = _2053 != 0;
    float _2057 = -_1568;
    float _2059 = fma(_2007, _2057, _2033);
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2063 = _2061 != 0;
    float _2065 = as_type<float>(_1634) * _2031;
    float _2067 = float(uint(_2051));
    int _2069 = _2037 * int(_2023);
    int _2071 = _2069 + _1973;
    float _2073 = -_185;
    int _2075 = _1578 ? as_type<int>(_2073) : as_type<int>(_185);
    float _2077 = -_185;
    int _2079 = _1963 ? as_type<int>(_2077) : as_type<int>(_185);
    float _2081 = as_type<float>(_1642) * _2067;
    float _2083 = float(uint(_2071));
    float _2085 = trunc(_2065);
    float _2087 = precise::max(_2085, 0.0);
    uint _2089 = uint(_2087);
    bool _2091 = !_2055;
    float _2093 = _2091 ? _185 : as_type<float>(_2075);
    int _2095 = _2047 * int(_2043);
    int _2097 = _2095 + _1983;
    bool _2099 = !_2063;
    float _2101 = _2099 ? _185 : as_type<float>(_2079);
    float _2103 = as_type<float>(_1634) * _2083;
    float _2105 = _2011 + 0.5;
    float _2107 = _2093 + (-0.5);
    float _2109 = float(uint(_2097));
    float _2111 = _2101 + (-0.5);
    float _2113 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[85].x, _735);
    float _2115 = trunc(_2103);
    float _2117 = precise::max(_2115, 0.0);
    uint _2119 = uint(_2117);
    float _2121 = -_2107;
    float _2123 = -_401;
    float _2125 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2123);
    float _2127 = as_type<float>(_1642) * _2109;
    float _2129 = -_2111;
    float _2131 = -_729;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2131);
    float _2135 = -_1562;
    float _2137 = fma(_2011, _2135, _2113);
    int _2139 = ~_1554;
    int _2141 = _2139 + 1;
    float _2143 = fma(_2093, _1576, _2125);
    float _2145 = fma(_2101, _1588, _2133);
    float _2147 = trunc(_2127);
    float _2149 = precise::max(_2147, 0.0);
    uint _2151 = uint(_2149);
    int _2153 = int(_1969) + int(_2089);
    float _2155 = _883 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2157 = ~_1554;
    int _2159 = _2157 + 1;
    out.m_70.x = _2059;
    out.m_70.y = _2143;
    out.m_70.z = _2137;
    out.m_70.w = _2145;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2167 = _2165 != 0;
    float _2169 = trunc(_2081);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = int(_2023) + int(_2119);
    int _2177 = _2159 * _2153;
    int _2179 = _2177 + _1849;
    bool _2181 = uint(_2179) >= uint(_1554);
    int _2183 = int(_2043) + int(_2151);
    float _2185 = _919 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2187 = ~_1582;
    int _2189 = _2187 + 1;
    int _2191 = _2141 * _2175;
    int _2193 = _2191 + _1973;
    float _2195 = -_913;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2185);
    int _2199 = int(_1995) + int(_2173);
    float _2201 = _919 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2203 = uint(_2193) >= uint(_1554);
    int _2205 = _2189 * _2183;
    int _2207 = _2205 + _1983;
    float _2209 = _919 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2211 = -_913;
    float _2213 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2201);
    bool _2215 = !_2203;
    int _2217 = _2215 ? 0 : (-1);
    float _2219 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2197);
    bool _2221 = uint(_2207) >= uint(_1582);
    float _2223 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2213);
    int _2225 = ~_2175;
    int _2227 = _2225 + _2217;
    int _2229 = _2227 + 1;
    float _2231 = -_913;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2209);
    bool _2235 = !_2221;
    int _2237 = _2235 ? 0 : (-1);
    float _2239 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2241 = ~_1582;
    int _2243 = _2241 + 1;
    float _2245 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2233);
    int _2247 = ~_2183;
    int _2249 = _2247 + _2237;
    int _2251 = _2249 + 1;
    int _2253 = _1554 * _2229;
    int _2255 = _2253 + _1973;
    float _2257 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2259 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2261 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2263 = _1582 * _2251;
    int _2265 = _2263 + _1983;
    bool _2267 = !_1865;
    int _2269 = _2267 ? _2255 : (-1);
    float _2271 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2257);
    float _2273 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2275 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2259);
    int _2277 = _2269 >> 31;
    int _2279 = _2243 * _2199;
    int _2281 = _2279 + _1899;
    int _2283 = _2269 & 3;
    bool _2285 = _2283 != 0;
    float _2287 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2239);
    int _2289 = _2277 & 3;
    float _2291 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2261);
    bool _2293 = !_1845;
    int _2295 = _2293 ? _2265 : (-1);
    float _2297 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2273);
    bool _2299 = !_2285;
    int _2301 = _2299 ? 0 : 1;
    float _2303 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2287);
    int _2305 = _2269 & 3;
    bool _2307 = _2305 != 0;
    float _2309 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2291);
    int _2311 = _2269 + _2289;
    float _2313 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2315 = _2295 >> 31;
    float _2317 = _2155 * _2219;
    bool _2319 = uint(_2281) >= uint(_1582);
    float _2321 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2297);
    int _2323 = _2315 & 3;
    float _2325 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2313);
    int _2327 = _2311 >> 2;
    float _2329 = _2155 * _2223;
    int _2331 = _2295 + _2323;
    float _2333 = _2155 * _2245;
    int _2335 = _2327 << 4;
    int _2337 = _2335 + 368;
    float _2339 = fma(_1592, _2303, _2317);
    int _2341 = _2331 >> 2;
    float _2343 = fma(_1592, _2309, _2329);
    int _2345 = _2307 ? 0 : 1;
    float _2347 = fma(_1592, _2321, _2333);
    int _2349 = _2341 << 4;
    int _2351 = _2349 + 512;
    int _2353 = _2337 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    bool _2371 = uint(_2283) >= 2u;
    float _2373 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2271);
    bool _2375 = !_2181;
    int _2377 = _2375 ? 0 : (-1);
    float _2379 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2275);
    bool _2381 = _2283 != 3;
    float _2383 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2325);
    int _2385 = _2371 ? 0 : 1;
    uint _2387 = uint(int(uint(_2337) >> uint(2)));
    uint _2389 = uint(int(uint(int(_2387)) >> uint(2)));
    int _2391 = int(_2387) & 3;
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[int(_2389)][_2391];
    int _2395 = int(_2387) + 1;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    int _2399 = _2395 & 3;
    float _2401 = (*spvDescriptorSet0.vp_c9)._m0[int(_2397)][_2399];
    bool _2403 = uint(_2283) > 1u;
    out.m_72.x = _2303;
    out.m_72.y = _2309;
    out.m_72.z = _2321;
    bool _2405 = !_2319;
    int _2407 = _2405 ? 0 : (-1);
    float _2409 = _2379 + _2343;
    int _2411 = ~_2153;
    int _2413 = _2411 + _2377;
    int _2415 = _2413 + 1;
    float _2417 = _2383 + _2347;
    int _2419 = ~_2199;
    int _2421 = _2419 + _2407;
    int _2423 = _2421 + 1;
    uint _2425 = uint(int(uint(_2351) >> uint(2)));
    uint _2427 = uint(int(uint(int(_2425)) >> uint(2)));
    int _2429 = int(_2425) & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    int _2433 = int(_2425) + 1;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    int _2437 = _2433 & 3;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[int(_2435)][_2437];
    int _2441 = _2295 & 3;
    bool _2443 = _2441 != 0;
    int _2445 = _1554 * _2415;
    int _2447 = _2445 + _1849;
    int _2449 = ~_2385;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    int _2455 = _1582 * _2423;
    int _2457 = _2455 + _1899;
    int _2459 = _2453;
    if (_2381)
    {
        int _2461 = ~_2385;
        int _2463 = _2461 + 1;
        _2459 = _2463;
    }
    int _2465 = _2459;
    bool _2467 = uint(_2441) > 1u;
    int _2469 = _2351 + 8;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    uint _2473 = uint(int(uint(int(_2471)) >> uint(2)));
    int _2475 = int(_2471) & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    int _2479 = int(_2471) + 1;
    uint _2481 = uint(int(uint(_2479) >> uint(2)));
    int _2483 = _2479 & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = ~_2345;
    int _2489 = _2487 + 1;
    int _2491 = _2489 + 1;
    int _2493 = _2491;
    if (!_2403)
    {
        int _2495 = ~_2345;
        int _2497 = _2495 + 1;
        _2493 = _2497;
    }
    int _2499 = _2493;
    int _2501 = _2295 & 3;
    bool _2503 = _2501 != 0;
    bool _2505 = !_2443;
    int _2507 = _2505 ? 0 : 1;
    int _2509 = _2503 ? 0 : 1;
    bool _2511 = uint(_2441) >= 2u;
    int _2513 = ~_2509;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _2517;
    if (!_2467)
    {
        int _2521 = ~_2509;
        int _2523 = _2521 + 1;
        _2519 = _2523;
    }
    int _2525 = _2519;
    bool _2527 = _2441 != 3;
    bool _2529 = _2441 != 3;
    float _2531 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    int _2533 = abs(_2499);
    int _2535 = abs(_2525);
    int _2537 = abs(_2301);
    int _2539 = abs(_2465);
    int _2541 = ~_2533;
    int _2543 = _2541 + 1;
    int _2545 = _2543 + 1;
    int _2547 = ~_2535;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    int _2553 = ~_2537;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    int _2559 = _2545 * as_type<int>(_2401);
    int _2561 = _2511 ? 0 : 1;
    int _2563 = _2557 * as_type<int>(_2393);
    int _2565 = _2563 + _2559;
    int _2567 = abs(_2507);
    int _2569 = _2551 * as_type<int>(_2439);
    int _2571 = ~_2539;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = ~_2561;
    int _2579 = _2577 + 1;
    int _2581 = _2579 + 1;
    int _2583 = _2581;
    if (_2527)
    {
        int _2585 = ~_2561;
        int _2587 = _2585 + 1;
        _2583 = _2587;
    }
    int _2589 = _2583;
    int _2591 = _2575 * as_type<int>(_2361);
    int _2593 = _2591 + _2565;
    bool _2595 = !_2167;
    int _2597 = _2595 ? 0 : 1;
    int _2599 = ~_2567;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    bool _2605 = !_2163;
    int _2607 = _2605 ? 0 : 1;
    bool _2609 = _2283 != 3;
    int _2611 = _2603 * as_type<int>(_2431);
    int _2613 = _2611 + _2569;
    bool _2615 = !_2529;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2589);
    int _2621 = abs(_2597);
    float _2623 = fma(_2155, _2155, 1.0);
    int _2625 = abs(_2607);
    bool _2627 = !_2609;
    int _2629 = _2627 ? 0 : (-1);
    int _2631 = abs(_2617);
    float _2633 = rsqrt(_2623);
    int _2635 = abs(_2629);
    int _2637 = ~_2619;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = ~_2635;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    int _2649 = ~_2631;
    int _2651 = _2649 + 1;
    int _2653 = _2651 + 1;
    int _2655 = _2641 * as_type<int>(_2477);
    int _2657 = _2655 + _2613;
    int _2659 = ~_2625;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    int _2665 = _2647 * as_type<int>(_2369);
    int _2667 = _2665 + _2593;
    int _2669 = ~_2621;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    int _2675 = _2653 * as_type<int>(_2485);
    int _2677 = _2675 + _2657;
    bool _2679 = !_1865;
    int _2681 = _2679 ? _2447 : (-1);
    int _2683 = _2667 * _2663;
    bool _2685 = !_1845;
    int _2687 = _2685 ? _2457 : (-1);
    int _2689 = _2677 * _2673;
    float _2691 = _2155 * _2633;
    int _2693 = _2681 * _2625;
    int _2695 = _2693 + _2683;
    float _2697 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2531);
    int _2699 = _2687 * _2621;
    int _2701 = _2699 + _2689;
    float _2703 = -_2373;
    float _2705 = _2691 * _2703;
    float _2707 = -_2379;
    float _2709 = _2691 * _2707;
    float _2711 = -_2383;
    float _2713 = _2691 * _2711;
    float _2715 = _2697 + _1455;
    float _2717 = fma(_2633, _2219, _2705);
    float _2719 = fma(_2633, _2223, _2709);
    float _2721 = fma(_2633, _2245, _2713);
    float _2723 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2725 = _1455 * 0.5;
    float _2727 = float(_2701);
    float _2729 = _1503 + _1455;
    float _2731 = _2723 * _1529;
    float _2733 = fma(_1505, -0.5, _2725);
    float _2735 = float(_2695);
    float _2737 = -_2723;
    float _2739 = _2737 + 1.0;
    float _2741 = _1540 * _2731;
    float _2743 = _1550 * _2731;
    out.m_74.x = _2735;
    out.m_74.y = _2727;
    float _2745 = _2715 * 0.5;
    float _2747 = _2729 * 0.5;
    float _2749 = _2373 + _2339;
    float _2751 = fma(_1546, _2741, _1534);
    float _2753 = fma(_1548, _2741, _1536);
    out.m_76.x = _2717;
    out.m_76.y = _2719;
    out.m_76.z = _2721;
    bool _2755 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2757 = isnan(_1239);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2763 = _2759 || _2761;
    float _2765 = _1540 * _2739;
    float _2767 = fma(_1540, _2743, _1538);
    out.m_78.x = _2747;
    out.m_78.y = _2733;
    out.m_78.z = _2745;
    out.m_78.w = _1455;
    out.m_80.x = _2751;
    out.m_80.y = _2753;
    out.m_80.z = _2767;
    out.m_80.w = _2765;
    out.m_82.x = _2749;
    out.m_82.y = _2409;
    out.m_82.z = _2417;
    float _2769 = _1536;
    float _2771 = _1534;
    float _2773 = _2697;
    if (!_2763)
    {
        _2769 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2775 = _2769;
    float _2777 = _2775;
    float _2779 = _2775;
    if (!_2763)
    {
        _2771 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2781 = _2771;
    out.gl_Position.x = _1503;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _2697;
    out.gl_Position.w = _1455;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2763)
    {
        _1616 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2787 = _1616;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2763)
    {
        _2773 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2793 = _2773;
    float _2795 = _2793;
    float _2797 = _2793;
    if (!_2763)
    {
        _1618 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2799 = _1618;
    float _2801 = _2799;
    float _2803 = _2799;
    if (!_2763)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2805 = _1620;
    bool _2807 = !_2763;
    float _2809 = _2805;
    float _2811 = _2805;
    if (!_2807)
    {
        bool _2813 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2815 = isnan(_1239);
        bool _2817 = _2813 || _2815;
        bool _2819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2821 = _2817 || _2819;
        if (!_2821)
        {
            float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2825 = _1239 + _2823;
            float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2829 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2827;
            float _2831 = 1.0 / _2829;
            float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2853 = _2825 * _2831;
            float _2855 = precise::clamp(_2853, 0.0, 1.0);
            float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2861 = fma(_2855, _2835, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2863 = fma(_2855, _2859, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2865 = fma(_2855, _2839, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2867 = fma(_2855, _2843, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2869 = fma(_2855, _2847, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2871 = fma(_2855, _2851, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2785 = _2863;
            _2803 = _2869;
            _2779 = _2861;
            _2797 = _2867;
            _2791 = _2865;
            _2811 = _2871;
            _2873 = true;
        }
        else
        {
            bool _2875 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2877 = isnan(_1239);
            bool _2879 = _2875 || _2877;
            bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2883 = _2879 || _2881;
            if (!_2883)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2885 = _2777;
            _2779 = _2885;
            if (!_2883)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2887 = _2783;
            _2785 = _2887;
            if (!_2883)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2889 = _2789;
            _2791 = _2889;
            if (!_2883)
            {
                _2795 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2891 = _2795;
            _2797 = _2891;
            if (!_2883)
            {
                _2801 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2893 = _2801;
            _2803 = _2893;
            if (!_2883)
            {
                _2809 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2895 = _2809;
            bool _2897 = !_2883;
            _2811 = _2895;
            if (!_2897)
            {
                bool _2899 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2901 = isnan(_1239);
                bool _2903 = _2899 || _2901;
                bool _2905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2907 = _2903 || _2905;
                if (!_2907)
                {
                    float _2909 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2911 = _1239 + _2909;
                    float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2915 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2913;
                    float _2917 = 1.0 / _2915;
                    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2927 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2939 = _2911 * _2917;
                    float _2941 = precise::clamp(_2939, 0.0, 1.0);
                    float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2947 = fma(_2941, _2921, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2949 = fma(_2941, _2945, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2951 = fma(_2941, _2925, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2953 = fma(_2941, _2929, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2955 = fma(_2941, _2933, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2957 = fma(_2941, _2937, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2785 = _2949;
                    _2803 = _2955;
                    _2779 = _2947;
                    _2797 = _2953;
                    _2791 = _2951;
                    _2811 = _2957;
                    _2873 = true;
                }
                else
                {
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2803 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2797 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2811 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2873 = false;
    float _2959 = _2785;
    float _2961 = _2803;
    float _2963 = _2779;
    float _2965 = _2797;
    float _2967 = _2791;
    float _2969 = _2811;
    float _2971 = fma(_2409, -0.5, 0.5);
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = -_2959;
    float _2977 = _2975 + _2961;
    float _2979 = -_2963;
    float _2981 = _2979 + _2965;
    float _2983 = -_2967;
    float _2985 = _2983 + _2969;
    bool _2987 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2989 = fma(_2973, _2977, _2959);
    float _2991 = fma(_2973, _2981, _2963);
    float _2993 = fma(_2973, _2985, _2967);
    float _2995 = _2989 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2997 = fma(_2991, 0.298911988735198974609375, _2995);
    float _2999 = fma(_2993, 0.114477999508380889892578125, _2997);
    out.m_84.x = 0.0;
    float _3001 = -_2999;
    float _3003 = _2991 + _3001;
    float _3005 = -_2999;
    float _3007 = _2989 + _3005;
    float _3009 = -_2999;
    float _3011 = _2993 + _3009;
    float _3013 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3015 = fma(_3003, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    float _3017 = fma(_3007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    float _3019 = fma(_3011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    out.m_86.w = _3013;
    out.m_88.x = _3015;
    out.m_88.y = _3017;
    out.m_88.z = _3019;
    if (!_2987)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3021 = -_1213;
    float _3023 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3025 = -_1215;
    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3029 = -_1217;
    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3033 = _3023 * _3023;
    float _3035 = fma(_3027, _3027, _3033);
    float _3037 = fma(_3031, _3031, _3035);
    float _3039 = sqrt(_3037);
    float _3041 = rsqrt(_3037);
    float _3043 = -_3039;
    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3047 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3049 = precise::clamp(_3047, 0.0, 1.0);
    float _3051 = _3027 * _3041;
    float _3053 = _3023 * _3041;
    float _3055 = abs(_3049);
    float _3057 = log2(_3055);
    float _3059 = _3031 * _3041;
    float _3061 = _3051 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3063 = _2409 * _3053;
    float _3065 = -_3053;
    float _3067 = -_3061;
    float _3069 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3067);
    float _3071 = fma(_2749, _3051, _3063);
    float _3073 = -_3059;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3069);
    float _3077 = fma(_2417, _3059, _3071);
    float _3079 = precise::clamp(_3077, 0.0, 1.0);
    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3083 = _3075 + _3081;
    float _3085 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3087 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3089 = precise::clamp(_3087, 0.0, 1.0);
    float _3091 = exp2(_3085);
    float _3093 = _3091 * _3089;
    float _3095 = _3079 * _3093;
    float _3097 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3099 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3101 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3097;
    out.m_84.y = _3099;
    out.m_84.z = _3101;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2873 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_125);
        out.gl_Position.z = _3160;
    }
    if (!_111)
    {
        return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3234 = as_type<float>(_165);
        out.gl_Position.z = _3234;
    }
    if (_157)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_107);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = in.m_51.y;
    float _217 = _131 * 2.0;
    float _219 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _221 = in.m_44.x;
    float _223 = in.m_44.y;
    float _225 = in.m_44.z;
    float _227 = floor(_217);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _213 + _229;
    float _233 = in.m_58.x;
    float _235 = in.m_58.y;
    float _237 = in.m_58.z;
    float _239 = in.m_58.w;
    float _241 = in.m_60.x;
    float _243 = in.m_60.y;
    float _245 = in.m_60.z;
    float _247 = in.m_60.w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _259 = in.m_51.z;
    float _261 = 1.0 / _255;
    float _263 = -_257;
    float _265 = fma(_219, 2.0, _263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = _227 > 0.0;
    float _273 = _215 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = 1.0 / _251;
    float _277 = _215 * 2.0;
    float _279 = _223 * _235;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _283 = floor(_277);
    float _285 = fma(_221, _233, _279);
    bool _287 = _227 >= 0.0;
    bool _289 = isnan(_227);
    bool _291 = _287 || _289;
    bool _293 = isnan(0.0);
    bool _295 = _291 || _293;
    float _297 = _223 * _243;
    float _299 = fma(_273, -2.0, _281);
    float _301 = _131 + _259;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _313 = _311 != 0;
    float _315 = _259 * 2.0;
    float _317 = 1.0 / _269;
    float _319 = _301 + (-1.0);
    float _321 = fma(_221, _241, _297);
    bool _323 = !_309;
    int _325 = _323 ? 0 : 1;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = _213 + _327;
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _333 = _295 ? 0 : 1;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _213 + _335;
    bool _339 = _283 > 0.0;
    float _341 = floor(_315);
    bool _343 = _283 >= 0.0;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = _329 * _275;
    bool _355 = !_305;
    int _357 = _355 ? 0 : 1;
    float _359 = _131 + _215;
    bool _361 = !_313;
    int _363 = _361 ? 0 : 1;
    float _365 = _231 * _261;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _377 = _375 != 0;
    float _379 = _359 + (-1.0);
    float _381 = _337 * _317;
    float _383 = _259 + _215;
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _387 = !_369;
    int _389 = _387 ? 0 : 1;
    float _391 = _383 + (-1.0);
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _395 = _393 != 0;
    float _397 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _399 = int(_397);
    float _401 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _299);
    bool _403 = _341 >= 0.0;
    bool _405 = isnan(_341);
    bool _407 = _403 || _405;
    bool _409 = isnan(0.0);
    bool _411 = _407 || _409;
    float _413 = fma(_225, _237, _285);
    float _415 = fma(_225, _245, _321);
    int _417 = ~_333;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _425 = int(_423);
    int _427 = _421;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].z);
    float _431 = _223;
    float _433 = _225;
    if (!_271)
    {
        int _435 = ~_333;
        int _437 = _435 + 1;
        _427 = _437;
    }
    int _439 = _427;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _441;
    bool _445 = _341 > 0.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    if (_395)
    {
        _429 = 0;
    }
    int _451 = _429;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _457 = _451;
    if (!_395)
    {
        _457 = 1;
    }
    int _459 = _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _465 = _411 ? 0 : 1;
    float _467 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _469 = _459 != 1;
    float _471 = fma(_443, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _473 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_213);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_455, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_463, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _489 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_213);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = fma(_449, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _507 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _509 = isnan(_213);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _519;
    float _523 = -_499;
    float _525 = _523 + 1.0;
    float _527 = _499 * _503;
    bool _529 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _531 = isnan(_213);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_521, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = _517 * _525;
    float _545 = -_517;
    float _547 = _545 + 1.0;
    float _549 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _551 = log2(_549);
    float _553 = _539 * _547;
    float _555 = float(_107);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _557;
    float _561 = _505;
    float _563 = _547;
    if (!_469)
    {
        _115 = _215;
    }
    float _565 = _115;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _569 = _565;
    if (_469)
    {
        _569 = _131;
    }
    float _571 = _569;
    float _573 = _471 * _553;
    float _575 = _505 * _553;
    float _577 = fma(_559, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].z, _567);
    float _581 = _571;
    if (!_469)
    {
        _561 = _259;
    }
    float _583 = _561;
    float _585 = 1.0 / _555;
    int _587 = ~_465;
    int _589 = _587 + 1;
    int _591 = _589 + 1;
    float _593 = _551 * _145;
    float _595 = _583;
    int _597 = _591;
    if (_469)
    {
        _595 = _215;
    }
    float _599 = _595;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_445)
    {
        int _603 = ~_465;
        int _605 = _603 + 1;
        _597 = _605;
    }
    int _607 = _597;
    float _609 = -_539;
    float _611 = _609 + 1.0;
    float _613 = _599 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _615 = abs(_389);
    float _617 = exp2(_593);
    if (!_469)
    {
        _581 = _259;
    }
    float _619 = _581;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _623 = _619;
    if (_469)
    {
        _623 = _215;
    }
    float _625 = _623;
    float _627 = _413 + _239;
    float _629 = float(_615);
    float _631 = fma(_613, -2.0, _621);
    float _633 = float(_607);
    float _635 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[83].w, _601);
    float _637 = float(_399);
    float _639 = _585 * _145;
    if (!_469)
    {
        _563 = _215;
    }
    float _641 = _563;
    float _643 = _629 * _633;
    float _645 = in.m_62.x;
    float _647 = in.m_62.y;
    float _649 = in.m_62.z;
    float _651 = -_617;
    float _653 = _651 + 1.0;
    float _655 = _641;
    if (_469)
    {
        _655 = _131;
    }
    float _657 = _655;
    float _659 = _643 * (-2.0);
    float _661 = float(_425);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _665 = 1.0 / _637;
    float _667 = _657 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _669 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(1.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = -_663;
    float _681 = fma(_667, 2.0, _679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _685 = 1.0 / _661;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _689 = 1.0 + _687;
    bool _691 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _699 = _695 || _697;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _703 = !_373;
    int _705 = _703 ? 0 : 1;
    float _707 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[78].w, _683);
    float _709 = _699 ? _653 : 0.0;
    float _711 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _701);
    float _713 = 1.0 / _689;
    float _715 = -_145;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[76].x, _265);
    float _719 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _579);
    float _721 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _635);
    float _723 = _665 * _145;
    float _725 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _727 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _707);
    float _729 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _631);
    float _731 = _685 * _145;
    float _733 = -_145;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[81].x, _681);
    int _737 = abs(_705);
    float _739 = fma(_385, _659, _385);
    float _741 = float(_439);
    float _743 = float(_737);
    float _745 = _723;
    float _747 = _731;
    if (_677)
    {
        float _749 = _709 * _713;
        _147 = _749;
    }
    float _751 = _147;
    float _753 = fma(_659, _645, _645);
    float _755 = _131 + (-0.5);
    float _757 = _743 * _741;
    int _759 = _351 ? 0 : 1;
    float _761 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].x, _753);
    bool _763 = !_377;
    int _765 = _763 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _767;
    int _771 = ~_759;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = _757 * (-2.0);
    int _779 = _775;
    if (!_339)
    {
        int _781 = ~_759;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = fma(_739, _751, _761);
    int _789 = abs(_765);
    float _791 = fma(_777, _647, _647);
    float _793 = float(_785);
    float _795 = _769 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _797 = float(_789);
    float _799 = _787 * 0.15915493667125701904296875;
    float _801 = _215 + (-0.5);
    float _803 = fma(_467, _777, _467);
    float _805 = precise::max(0.0, _795);
    float _807 = _797 * _793;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[196].y, _791);
    float _811 = _799 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _807 * (-2.0);
    float _817 = precise::max(_805, 375.0);
    float _819 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _573);
    float _821 = in.m_64.x;
    float _823 = in.m_64.y;
    float _825 = fma(_815, _649, _649);
    float _827 = _259 + (-0.5);
    float _829 = fma(_331, _815, _331);
    float _831 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _575);
    float _833 = fma(_803, _751, _809);
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _837 = precise::min(_817, 550.0);
    float _839 = fma(_485, _543, _819);
    float _841 = fma(_487, _543, _831);
    float _843 = fma(_829, _751, _835);
    float _845 = _833 * 0.15915493667125701904296875;
    float _847 = fma(_837, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _849 = precise::clamp(_847, 0.0, 1.0);
    float _851 = _843 * 0.15915493667125701904296875;
    float _853 = fma(_577, _527, _841);
    float _855 = fma(_541, _527, _839);
    float _857 = _799 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _863 = _861 + 1.0;
    float _865 = -_849;
    float _867 = _865 + 1.0;
    float _869 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[146].y, _853);
    float _871 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[146].x, _855);
    float _873 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _875 = _869 * _823;
    float _877 = _845 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _871 * _821;
    float _883 = _185 * _873;
    float _885 = _181 * _873;
    float _887 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _883);
    float _893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _885);
    float _895 = _845 * 6.283185482025146484375;
    float _897 = cos(_895);
    float _899 = _887 * _891;
    float _901 = _889 * _893;
    float _903 = _851 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _859 * _879;
    float _909 = _813 * _879;
    float _911 = _851 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = _859 * _897;
    float _917 = _813 * _897;
    float _919 = _859 * _905;
    float _921 = _813 * _905;
    float _923 = _897 * _905;
    float _925 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _927 = _919 * _899;
    float _929 = _879 * _905;
    float _931 = _921 * _899;
    float _933 = fma(_913, _915, _909);
    float _935 = -_907;
    float _937 = fma(_913, _917, _935);
    float _939 = -_917;
    float _941 = fma(_913, _907, _939);
    float _943 = -_899;
    float _945 = _913 * _943;
    float _947 = fma(_933, _901, _927);
    float _949 = fma(_913, _909, _915);
    float _951 = fma(_923, _901, _945);
    float _953 = fma(_941, _925, _947);
    float _955 = fma(_937, _901, _931);
    float _957 = _415 + _247;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _961 = _959 + 1.0;
    float _963 = fma(_929, _925, _951);
    float _965 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _967 = fma(_949, _925, _955);
    float _969 = fma(_867, _961, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _971 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].x, _965);
    float _975 = fma(_867, 0.10000002384185791015625, 0.89999997615814208984375);
    float _977 = -_225;
    float _979 = fma(_969, _225, _977);
    float _981 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].x, _971);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _973);
    float _985 = -_221;
    float _987 = fma(_969, _221, _985);
    float _989 = _979 + _627;
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _981);
    float _993 = _983 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _995 = in.m_66.x;
    float _997 = in.m_66.y;
    float _999 = in.m_66.z;
    float _1001 = in.m_66.w;
    float _1003 = _987 + _957;
    float _1005 = _991 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _989 + _993;
    float _1009 = _1003 + _1005;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1013 = _1007 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1009 + _1015;
    float _1019 = _1013 * _1013;
    float _1021 = fma(_1017, _1017, _1019);
    float _1023 = sqrt(_1021);
    float _1025 = _223 * _997;
    float _1027 = fma(_221, _995, _1025);
    float _1029 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1031 = -_223;
    float _1033 = fma(_975, _223, _1031);
    float _1035 = fma(_225, _999, _1027);
    float _1037 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1029);
    bool _1039 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1041 = _1035 + _1001;
    float _1043 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1037);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1059 = _1057 != 0;
    float _1061 = _1033 + _1041;
    float _1063 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1067 = isnan(0.5);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1073 = _1069 || _1071;
    bool _1075 = !_1051;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _1061 + _1063;
    bool _1081 = !_1047;
    int _1083 = _1081 ? 0 : 1;
    bool _1085 = !_1055;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1059;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = _1009;
    float _1095 = _1007;
    float _1097 = _1029;
    float _1099 = _1003;
    if (!_1039)
    {
        _431 = _1079;
    }
    float _1101 = _431;
    bool _1103 = !_1039;
    float _1105 = _1101;
    if (!_1103)
    {
        float _1107 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1111 = _1023 + _1109;
        float _1113 = _1079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1115 = rsqrt(_1021);
        float _1117 = _1111 * _1107;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1119 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = _1119 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = _1123 + (-1.0);
        float _1131 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1133 = fma(_1127, _1113, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1135 = fma(_1079, _1123, _1131);
        float _1137 = _1115 * _1133;
        float _1139 = fma(_1017, _1137, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1141 = fma(_1013, _1137, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1093 = _1139;
        _1095 = _1141;
        _1105 = _1135;
        _1097 = _1127;
        _433 = _1131;
    }
    float _1143 = _1093;
    float _1145 = _1095;
    float _1147 = _1105;
    float _1149 = _1097;
    float _1151 = _433;
    float _1153 = _1149;
    float _1155 = _1151;
    float _1157 = _1147;
    float _1159 = _1145;
    if (_1073)
    {
        _1153 = _1143;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (_1073)
    {
        _1155 = _1145;
    }
    float _1165 = _1155;
    float _1167 = _1165;
    if (!_1073)
    {
        float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1171 = _1061 + _1169;
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1175 = _1003 + _1173;
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1179 = -_1003;
        float _1181 = _1179 + _1143;
        float _1183 = _1171 * _1171;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1187 = _989 + _1185;
        float _1189 = -_1061;
        float _1191 = _1189 + _1147;
        float _1193 = fma(_1175, _1175, _1183);
        float _1195 = fma(_1187, _1187, _1193);
        float _1197 = -_989;
        float _1199 = _1197 + _1145;
        float _1201 = sqrt(_1195);
        float _1203 = precise::min(_1201, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1205 = _1203 * _1177;
        float _1207 = fma(_1181, _1205, _1003);
        float _1209 = fma(_1191, _1205, _1061);
        float _1211 = fma(_1199, _1205, _989);
        _1157 = _1209;
        _1163 = _1207;
        _1167 = _1211;
    }
    float _1213 = _1157;
    float _1215 = _1163;
    float _1217 = _1167;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1213 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1215 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = _1221 * _1221;
    float _1233 = fma(_1225, _1225, _1231);
    float _1235 = fma(_1229, _1229, _1233);
    float _1237 = rsqrt(_1235);
    float _1239 = sqrt(_1235);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1243 = _1225 * _1241;
    float _1245 = _1229 * _1241;
    float _1247 = _1243 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = _1247 + _1249;
    float _1253 = sqrt(_1251);
    bool _1255 = _1253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1259 = _1253 + _1257;
    float _1261 = _989;
    float _1263 = _1259;
    float _1265 = _1221;
    float _1267 = _1243;
    if (_1255)
    {
        float _1269 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1261 = _1269;
    }
    float _1271 = _1261;
    float _1273 = _1271;
    if (_1255)
    {
        float _1275 = _1259 * _1271;
        _1263 = _1275;
    }
    float _1277 = _1263;
    if (_1255)
    {
        float _1279 = rsqrt(_1251);
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = _1281;
    if (_1255)
    {
        float _1285 = _1277 * 0.15915493667125701904296875;
        _1099 = _1285;
    }
    float _1287 = _1099;
    float _1289 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1291 = _1229;
    if (_1255)
    {
        float _1293 = _1287 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        _1291 = _1295;
    }
    float _1297 = _1291;
    float _1299 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1301 = precise::max(0.0, _1289);
    float _1303 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1299);
    float _1305 = _975;
    float _1307 = _1301;
    if (_1255)
    {
        float _1309 = _1287 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -_1241;
    float _1317 = -_1301;
    float _1319 = fma(_1221, _1315, _1317);
    float _1321 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    if (_1255)
    {
        float _1323 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1323;
    }
    float _1325 = _1265;
    float _1327 = _1297;
    float _1329 = _1325;
    if (_1255)
    {
        float _1331 = fma(_1297, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = _1333;
    if (!_1255)
    {
        _1329 = _1319;
    }
    float _1337 = _1329;
    float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1341 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1339);
    float _1343 = precise::clamp(_1341, 0.0, 1.0);
    float _1345 = _1337;
    if (_1255)
    {
        float _1347 = _1281 * _1333;
        _1159 = _1347;
    }
    float _1349 = _1159;
    if (!_1255)
    {
        _1335 = _1247;
    }
    float _1351 = _1335;
    float _1353 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1351;
    float _1357 = _1313;
    if (_1255)
    {
        float _1359 = _1313 + (-1.0);
        _1307 = _1359;
    }
    float _1361 = _1307;
    float _1363 = _1361;
    if (_1255)
    {
        float _1365 = _1243 * _1349;
        _1267 = _1365;
    }
    float _1367 = _1267;
    float _1369 = -_1343;
    float _1371 = _1369 + 1.0;
    float _1373 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    if (_1255)
    {
        float _1375 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1375;
    }
    float _1377 = _1283;
    if (!_1255)
    {
        _1363 = _1245;
    }
    float _1379 = _1363;
    float _1381 = _1379;
    if (_1255)
    {
        float _1383 = _1245 * _1349;
        _1381 = _1383;
    }
    float _1385 = _1381;
    if (_1255)
    {
        float _1387 = _1367 * _1367;
        _1355 = _1387;
    }
    float _1389 = _1355;
    if (_1255)
    {
        float _1391 = fma(_1319, _1313, _1377);
        _1345 = _1391;
    }
    float _1393 = _1345;
    if (!_1255)
    {
        _1357 = _1249;
    }
    float _1395 = _1357;
    float _1397 = _1395;
    if (_1255)
    {
        float _1399 = _1385 * _1385;
        _1397 = _1399;
    }
    float _1401 = _1397;
    float _1403 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1405 = fma(_1393, _1393, _1389);
    float _1407 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1373);
    float _1409 = abs(_1371);
    float _1411 = log2(_1409);
    float _1413 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1403);
    float _1415 = _1405 + _1401;
    float _1417 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1421 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1413);
    float _1423 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1425 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1427 = rsqrt(_1415);
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1431 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1433 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1435 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1439 = -_1431;
    float _1441 = fma(_1439, _1423, 1.0);
    float _1443 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1437);
    float _1447 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1445);
    float _1449 = _1427 * _1367;
    float _1451 = _1427 * _1393;
    float _1453 = _1427 * _1385;
    float _1455 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1447);
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = log2(_1441);
    float _1461 = -_1457;
    float _1463 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1461);
    float _1465 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1467 = -_1453;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1463);
    float _1471 = 1.0 / _1455;
    float _1473 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = fma(_1469, -0.5, 0.5);
    float _1479 = fma(_1469, 0.5, 0.5);
    float _1481 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1483 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1485 = _1451 + 1.0;
    float _1487 = exp2(_1465);
    float _1489 = fma(_1479, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1491 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1481);
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1483);
    float _1495 = fma(_1479, _1489, -0.212114393711090087890625);
    float _1497 = sqrt(_1477);
    float _1499 = -_1451;
    float _1501 = fma(_1487, _1485, _1499);
    float _1503 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1491);
    float _1505 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1493);
    float _1507 = fma(_1479, _1495, 1.570728778839111328125);
    float _1509 = _1459 * 0.693147182464599609375;
    float _1511 = _1503 * _1471;
    float _1513 = _1505 * _1471;
    float _1515 = fma(_1501, 0.5, 0.5);
    float _1517 = _1497 * 0.636619746685028076171875;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1521 = fma(_1511, 0.5, 0.5);
    float _1523 = fma(_1513, -0.5, 0.5);
    float _1525 = -_1507;
    float _1527 = fma(_1517, _1525, 1.0);
    float3 _5349 = float3(_1521, _1523, _1519);
    float _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5349, float3(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5349, float3(0.0), isnan(_5349)), level(0.0)).x;
    float3 _5360 = float3(_1521, _1523, _1519);
    float4 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5360, float3(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5360, float3(0.0), isnan(_5360)), level(0.0)).xyzw;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = _1532.w;
    float2 _5377 = float2(_1527, _1515);
    float3 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5377, float2(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5377, float2(0.0), isnan(_5377)), level(0.0)).xyz;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1554 = int(_1552);
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1558 = _1556 != 0;
    float _1560 = -_719;
    float _1562 = _1560 + 1.0;
    bool _1564 = _131 > 0.5;
    float _1566 = -_725;
    float _1568 = _1566 + 1.0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1572 = _1570 != 0;
    float _1574 = -_727;
    float _1576 = _1574 + 1.0;
    bool _1578 = _215 > 0.5;
    float _1580 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1582 = int(_1580);
    bool _1584 = _259 > 0.5;
    float _1586 = -_721;
    float _1588 = _1586 + 1.0;
    int _1590 = abs(_1091);
    float _1592 = _885 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1594 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1596 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_68.x = _1215;
    out.m_68.y = _1213;
    out.m_68.z = _1217;
    float _1598 = float(uint(_1554));
    float _1600 = trunc(_723);
    int _1602 = int(_1600);
    float _1604 = float(_1554);
    float _1606 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1608 = float(uint(_1582));
    float _1610 = 1.0 / _1598;
    int _1612 = ~_1582;
    int _1614 = _1612 + 1;
    float _1616 = _1455;
    float _1618 = _1505;
    float _1620 = _1503;
    if (_1558)
    {
        _745 = 1.0;
    }
    float _1622 = _745;
    float _1624 = _1622;
    if (!_1558)
    {
        _1624 = 1.2345600128173828125;
    }
    float _1626 = _1624;
    float _1628 = 1.0 / _1608;
    float _1630 = trunc(_731);
    int _1632 = int(_1630);
    int _1634 = as_type<int>(_1610) + (-2);
    float _1636 = float(uint(_1602));
    int _1638 = ~_1554;
    int _1640 = _1638 + 1;
    int _1642 = as_type<int>(_1628) + (-2);
    float _1644 = as_type<float>(_1634) * _1636;
    if (_1558)
    {
        _747 = _131;
    }
    float _1646 = _747;
    float _1648 = exp2(_1596);
    float _1650 = _1646;
    if (!_1558)
    {
        _1650 = _215;
    }
    float _1652 = _1650;
    float _1654 = float(uint(_1632));
    float _1656 = _1626 * _1652;
    float _1658 = trunc(_1644);
    float _1660 = precise::max(_1658, 0.0);
    uint _1663 = uint(_1660);
    float _1665 = as_type<float>(_1642) * _1654;
    float _1667 = _1654;
    if (_1558)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    float _1671 = _1669;
    if (!_1558)
    {
        _1671 = 7.345489978790283203125;
    }
    float _1673 = _1671;
    float _1675 = trunc(_1665);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = -_1648;
    float _1683 = _1681 + 1.0;
    float _1685 = _1673 * _131;
    float _1687 = float(_1602);
    int _1689 = _1640 * int(_1663);
    int _1691 = _1689 + _1602;
    float _1693 = floor(_1685);
    float _1695 = float(uint(_1691));
    int _1697 = _1614 * int(_1679);
    int _1699 = _1697 + _1632;
    float _1701 = floor(_1656);
    float _1703 = as_type<float>(_1634) * _1695;
    float _1705 = float(uint(_1699));
    float _1707 = trunc(_1703);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = as_type<float>(_1642) * _1705;
    float _1715 = -_1693;
    float _1717 = _1685 + _1715;
    bool _1719 = _1687 >= _1604;
    bool _1721 = isnan(_1687);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan(_1604);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    int _1731 = ~_1582;
    int _1733 = _1731 + 1;
    float _1735 = _1717 * _1604;
    float _1737 = float(_1632);
    float _1739 = trunc(_1713);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = -_1701;
    float _1747 = _1656 + _1745;
    int _1749 = ~_1554;
    int _1751 = _1749 + 1;
    float _1753 = _1604 * _639;
    int _1755 = int(_1663) + int(_1711);
    float _1757 = trunc(_1735);
    int _1759 = int(_1757);
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1763 = _1761 != 0;
    int _1765 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1767 = _1765 != 0;
    int _1769 = _1751 * _1755;
    int _1771 = _1769 + _1602;
    int _1773 = int(_1679) + int(_1743);
    float _1775 = trunc(_1753);
    int _1777 = int(_1775);
    float _1779 = float(_1582);
    bool _1781 = uint(_1771) >= uint(_1554);
    bool _1783 = _1737 >= _1779;
    bool _1785 = isnan(_1737);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(_1779);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = _1779 * _639;
    bool _1797 = !_1781;
    int _1799 = _1797 ? 0 : (-1);
    float _1801 = trunc(_1729);
    int _1803 = int(_1801);
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1807 = _1805 != 0;
    int _1809 = ~_1755;
    int _1811 = _1809 + _1799;
    int _1813 = _1811 + 1;
    int _1815 = _1554 * _1813;
    int _1817 = _1815 + _1602;
    float _1819 = trunc(_1795);
    int _1821 = int(_1819);
    int _1823 = _1733 * _1773;
    int _1825 = _1823 + _1632;
    float _1827 = _1747 * _1779;
    bool _1829 = !_1763;
    int _1831 = _1829 ? 0 : 1;
    bool _1833 = uint(_1825) >= uint(_1582);
    float _1835 = trunc(_1793);
    int _1837 = int(_1835);
    int _1839 = abs(_1831);
    bool _1841 = !_1833;
    int _1843 = _1841 ? 0 : (-1);
    bool _1845 = _1582 == 0;
    int _1847 = _1759 * _1839;
    int _1849 = _1847 + _1602;
    int _1851 = ~_1773;
    int _1853 = _1851 + _1843;
    int _1855 = _1853 + 1;
    float _1857 = trunc(_1827);
    int _1859 = int(_1857);
    bool _1861 = !_1807;
    int _1863 = _1861 ? 0 : 1;
    bool _1865 = _1554 == 0;
    int _1867 = abs(_1863);
    int _1869 = _1582 * _1855;
    int _1871 = _1869 + _1632;
    int _1873 = ~_1803;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    bool _1879 = !_1865;
    int _1881 = _1879 ? _1817 : (-1);
    int _1883 = _1554 + (-1);
    int _1885 = ~_1837;
    int _1887 = _1885 + 1;
    int _1889 = _1887 + 1;
    int _1891 = _1881 * _1877;
    bool _1893 = !_1845;
    int _1895 = _1893 ? _1871 : (-1);
    int _1897 = _1859 * _1867;
    int _1899 = _1897 + _1632;
    int _1901 = _1582 + (-1);
    int _1903 = _1803 * _1883;
    int _1905 = _1903 + _1891;
    float _1907 = in.m_51.w;
    int _1909 = _1895 * _1889;
    int _1911 = abs(_325);
    int _1913 = ~_1554;
    int _1915 = _1913 + 1;
    int _1917 = _1837 * _1901;
    int _1919 = _1917 + _1909;
    int _1921 = abs(_357);
    int _1923 = _1905 * _1911;
    int _1925 = abs(_1077);
    int _1927 = abs(_1083);
    int _1929 = _1777 * _1921;
    int _1931 = _1929 + _1923;
    int _1933 = abs(_363);
    int _1935 = _1919 * _1925;
    bool _1937 = !_1572;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = float(uint(_1849));
    int _1943 = _1821 * _1927;
    int _1945 = _1943 + _1935;
    int _1947 = abs(_1087);
    int _1949 = _1849 * _1933;
    int _1951 = _1949 + _1931;
    int _1953 = abs(_1939);
    float _1955 = as_type<float>(_1634) * _1941;
    float _1957 = float(uint(_1899));
    int _1959 = _1899 * _1947;
    int _1961 = _1959 + _1945;
    bool _1963 = _1907 > 0.5;
    float _1965 = trunc(_1955);
    float _1967 = precise::max(_1965, 0.0);
    uint _1969 = uint(_1967);
    int _1971 = _1759 * _1953;
    int _1973 = _1971 + _1951;
    float _1975 = as_type<float>(_1642) * _1957;
    float _1977 = -_181;
    int _1979 = _1584 ? as_type<int>(_1977) : as_type<int>(_181);
    int _1981 = _1859 * _1590;
    int _1983 = _1981 + _1961;
    float _1985 = float(uint(_1973));
    float _1987 = -_181;
    int _1989 = _1564 ? as_type<int>(_1987) : as_type<int>(_181);
    float _1991 = trunc(_1975);
    float _1993 = precise::max(_1991, 0.0);
    uint _1995 = uint(_1993);
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1999 = _1997 != 0;
    float _2001 = as_type<float>(_1634) * _1985;
    float _2003 = float(uint(_1983));
    bool _2005 = !_1767;
    float _2007 = _2005 ? _181 : as_type<float>(_1989);
    bool _2009 = !_1999;
    float _2011 = _2009 ? _181 : as_type<float>(_1979);
    int _2013 = _1915 * int(_1969);
    int _2015 = _2013 + _1849;
    float _2017 = as_type<float>(_1642) * _2003;
    float _2019 = trunc(_2001);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    int _2025 = ~_1582;
    int _2027 = _2025 + 1;
    float _2029 = _2007 + 0.5;
    float _2031 = float(uint(_2015));
    float _2033 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[80].x, _717);
    int _2035 = ~_1554;
    int _2037 = _2035 + 1;
    float _2039 = trunc(_2017);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = ~_1582;
    int _2047 = _2045 + 1;
    int _2049 = _2027 * int(_1995);
    int _2051 = _2049 + _1899;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2055 = _2053 != 0;
    float _2057 = -_1568;
    float _2059 = fma(_2007, _2057, _2033);
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2063 = _2061 != 0;
    float _2065 = as_type<float>(_1634) * _2031;
    float _2067 = float(uint(_2051));
    int _2069 = _2037 * int(_2023);
    int _2071 = _2069 + _1973;
    float _2073 = -_185;
    int _2075 = _1578 ? as_type<int>(_2073) : as_type<int>(_185);
    float _2077 = -_185;
    int _2079 = _1963 ? as_type<int>(_2077) : as_type<int>(_185);
    float _2081 = as_type<float>(_1642) * _2067;
    float _2083 = float(uint(_2071));
    float _2085 = trunc(_2065);
    float _2087 = precise::max(_2085, 0.0);
    uint _2089 = uint(_2087);
    bool _2091 = !_2055;
    float _2093 = _2091 ? _185 : as_type<float>(_2075);
    int _2095 = _2047 * int(_2043);
    int _2097 = _2095 + _1983;
    bool _2099 = !_2063;
    float _2101 = _2099 ? _185 : as_type<float>(_2079);
    float _2103 = as_type<float>(_1634) * _2083;
    float _2105 = _2011 + 0.5;
    float _2107 = _2093 + (-0.5);
    float _2109 = float(uint(_2097));
    float _2111 = _2101 + (-0.5);
    float _2113 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[85].x, _735);
    float _2115 = trunc(_2103);
    float _2117 = precise::max(_2115, 0.0);
    uint _2119 = uint(_2117);
    float _2121 = -_2107;
    float _2123 = -_401;
    float _2125 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2123);
    float _2127 = as_type<float>(_1642) * _2109;
    float _2129 = -_2111;
    float _2131 = -_729;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2131);
    float _2135 = -_1562;
    float _2137 = fma(_2011, _2135, _2113);
    int _2139 = ~_1554;
    int _2141 = _2139 + 1;
    float _2143 = fma(_2093, _1576, _2125);
    float _2145 = fma(_2101, _1588, _2133);
    float _2147 = trunc(_2127);
    float _2149 = precise::max(_2147, 0.0);
    uint _2151 = uint(_2149);
    int _2153 = int(_1969) + int(_2089);
    float _2155 = _883 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2157 = ~_1554;
    int _2159 = _2157 + 1;
    out.m_70.x = _2059;
    out.m_70.y = _2143;
    out.m_70.z = _2137;
    out.m_70.w = _2145;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2167 = _2165 != 0;
    float _2169 = trunc(_2081);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = int(_2023) + int(_2119);
    int _2177 = _2159 * _2153;
    int _2179 = _2177 + _1849;
    bool _2181 = uint(_2179) >= uint(_1554);
    int _2183 = int(_2043) + int(_2151);
    float _2185 = _919 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2187 = ~_1582;
    int _2189 = _2187 + 1;
    int _2191 = _2141 * _2175;
    int _2193 = _2191 + _1973;
    float _2195 = -_913;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2185);
    int _2199 = int(_1995) + int(_2173);
    float _2201 = _919 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2203 = uint(_2193) >= uint(_1554);
    int _2205 = _2189 * _2183;
    int _2207 = _2205 + _1983;
    float _2209 = _919 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2211 = -_913;
    float _2213 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2201);
    bool _2215 = !_2203;
    int _2217 = _2215 ? 0 : (-1);
    float _2219 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2197);
    bool _2221 = uint(_2207) >= uint(_1582);
    float _2223 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2213);
    int _2225 = ~_2175;
    int _2227 = _2225 + _2217;
    int _2229 = _2227 + 1;
    float _2231 = -_913;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2209);
    bool _2235 = !_2221;
    int _2237 = _2235 ? 0 : (-1);
    float _2239 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2241 = ~_1582;
    int _2243 = _2241 + 1;
    float _2245 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2233);
    int _2247 = ~_2183;
    int _2249 = _2247 + _2237;
    int _2251 = _2249 + 1;
    int _2253 = _1554 * _2229;
    int _2255 = _2253 + _1973;
    float _2257 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2259 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2261 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2263 = _1582 * _2251;
    int _2265 = _2263 + _1983;
    bool _2267 = !_1865;
    int _2269 = _2267 ? _2255 : (-1);
    float _2271 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2257);
    float _2273 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2275 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2259);
    int _2277 = _2269 >> 31;
    int _2279 = _2243 * _2199;
    int _2281 = _2279 + _1899;
    int _2283 = _2269 & 3;
    bool _2285 = _2283 != 0;
    float _2287 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2239);
    int _2289 = _2277 & 3;
    float _2291 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2261);
    bool _2293 = !_1845;
    int _2295 = _2293 ? _2265 : (-1);
    float _2297 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2273);
    bool _2299 = !_2285;
    int _2301 = _2299 ? 0 : 1;
    float _2303 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2287);
    int _2305 = _2269 & 3;
    bool _2307 = _2305 != 0;
    float _2309 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2291);
    int _2311 = _2269 + _2289;
    float _2313 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2315 = _2295 >> 31;
    float _2317 = _2155 * _2219;
    bool _2319 = uint(_2281) >= uint(_1582);
    float _2321 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2297);
    int _2323 = _2315 & 3;
    float _2325 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2313);
    int _2327 = _2311 >> 2;
    float _2329 = _2155 * _2223;
    int _2331 = _2295 + _2323;
    float _2333 = _2155 * _2245;
    int _2335 = _2327 << 4;
    int _2337 = _2335 + 368;
    float _2339 = fma(_1592, _2303, _2317);
    int _2341 = _2331 >> 2;
    float _2343 = fma(_1592, _2309, _2329);
    int _2345 = _2307 ? 0 : 1;
    float _2347 = fma(_1592, _2321, _2333);
    int _2349 = _2341 << 4;
    int _2351 = _2349 + 512;
    int _2353 = _2337 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    bool _2371 = uint(_2283) >= 2u;
    float _2373 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2271);
    bool _2375 = !_2181;
    int _2377 = _2375 ? 0 : (-1);
    float _2379 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2275);
    bool _2381 = _2283 != 3;
    float _2383 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2325);
    int _2385 = _2371 ? 0 : 1;
    uint _2387 = uint(int(uint(_2337) >> uint(2)));
    uint _2389 = uint(int(uint(int(_2387)) >> uint(2)));
    int _2391 = int(_2387) & 3;
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[int(_2389)][_2391];
    int _2395 = int(_2387) + 1;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    int _2399 = _2395 & 3;
    float _2401 = (*spvDescriptorSet0.vp_c9)._m0[int(_2397)][_2399];
    bool _2403 = uint(_2283) > 1u;
    out.m_72.x = _2303;
    out.m_72.y = _2309;
    out.m_72.z = _2321;
    bool _2405 = !_2319;
    int _2407 = _2405 ? 0 : (-1);
    float _2409 = _2379 + _2343;
    int _2411 = ~_2153;
    int _2413 = _2411 + _2377;
    int _2415 = _2413 + 1;
    float _2417 = _2383 + _2347;
    int _2419 = ~_2199;
    int _2421 = _2419 + _2407;
    int _2423 = _2421 + 1;
    uint _2425 = uint(int(uint(_2351) >> uint(2)));
    uint _2427 = uint(int(uint(int(_2425)) >> uint(2)));
    int _2429 = int(_2425) & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    int _2433 = int(_2425) + 1;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    int _2437 = _2433 & 3;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[int(_2435)][_2437];
    int _2441 = _2295 & 3;
    bool _2443 = _2441 != 0;
    int _2445 = _1554 * _2415;
    int _2447 = _2445 + _1849;
    int _2449 = ~_2385;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    int _2455 = _1582 * _2423;
    int _2457 = _2455 + _1899;
    int _2459 = _2453;
    if (_2381)
    {
        int _2461 = ~_2385;
        int _2463 = _2461 + 1;
        _2459 = _2463;
    }
    int _2465 = _2459;
    bool _2467 = uint(_2441) > 1u;
    int _2469 = _2351 + 8;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    uint _2473 = uint(int(uint(int(_2471)) >> uint(2)));
    int _2475 = int(_2471) & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    int _2479 = int(_2471) + 1;
    uint _2481 = uint(int(uint(_2479) >> uint(2)));
    int _2483 = _2479 & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = ~_2345;
    int _2489 = _2487 + 1;
    int _2491 = _2489 + 1;
    int _2493 = _2491;
    if (!_2403)
    {
        int _2495 = ~_2345;
        int _2497 = _2495 + 1;
        _2493 = _2497;
    }
    int _2499 = _2493;
    int _2501 = _2295 & 3;
    bool _2503 = _2501 != 0;
    bool _2505 = !_2443;
    int _2507 = _2505 ? 0 : 1;
    int _2509 = _2503 ? 0 : 1;
    bool _2511 = uint(_2441) >= 2u;
    int _2513 = ~_2509;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _2517;
    if (!_2467)
    {
        int _2521 = ~_2509;
        int _2523 = _2521 + 1;
        _2519 = _2523;
    }
    int _2525 = _2519;
    bool _2527 = _2441 != 3;
    bool _2529 = _2441 != 3;
    float _2531 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    int _2533 = abs(_2499);
    int _2535 = abs(_2525);
    int _2537 = abs(_2301);
    int _2539 = abs(_2465);
    int _2541 = ~_2533;
    int _2543 = _2541 + 1;
    int _2545 = _2543 + 1;
    int _2547 = ~_2535;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    int _2553 = ~_2537;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    int _2559 = _2545 * as_type<int>(_2401);
    int _2561 = _2511 ? 0 : 1;
    int _2563 = _2557 * as_type<int>(_2393);
    int _2565 = _2563 + _2559;
    int _2567 = abs(_2507);
    int _2569 = _2551 * as_type<int>(_2439);
    int _2571 = ~_2539;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = ~_2561;
    int _2579 = _2577 + 1;
    int _2581 = _2579 + 1;
    int _2583 = _2581;
    if (_2527)
    {
        int _2585 = ~_2561;
        int _2587 = _2585 + 1;
        _2583 = _2587;
    }
    int _2589 = _2583;
    int _2591 = _2575 * as_type<int>(_2361);
    int _2593 = _2591 + _2565;
    bool _2595 = !_2167;
    int _2597 = _2595 ? 0 : 1;
    int _2599 = ~_2567;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    bool _2605 = !_2163;
    int _2607 = _2605 ? 0 : 1;
    bool _2609 = _2283 != 3;
    int _2611 = _2603 * as_type<int>(_2431);
    int _2613 = _2611 + _2569;
    bool _2615 = !_2529;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2589);
    int _2621 = abs(_2597);
    float _2623 = fma(_2155, _2155, 1.0);
    int _2625 = abs(_2607);
    bool _2627 = !_2609;
    int _2629 = _2627 ? 0 : (-1);
    int _2631 = abs(_2617);
    float _2633 = rsqrt(_2623);
    int _2635 = abs(_2629);
    int _2637 = ~_2619;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = ~_2635;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    int _2649 = ~_2631;
    int _2651 = _2649 + 1;
    int _2653 = _2651 + 1;
    int _2655 = _2641 * as_type<int>(_2477);
    int _2657 = _2655 + _2613;
    int _2659 = ~_2625;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    int _2665 = _2647 * as_type<int>(_2369);
    int _2667 = _2665 + _2593;
    int _2669 = ~_2621;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    int _2675 = _2653 * as_type<int>(_2485);
    int _2677 = _2675 + _2657;
    bool _2679 = !_1865;
    int _2681 = _2679 ? _2447 : (-1);
    int _2683 = _2667 * _2663;
    bool _2685 = !_1845;
    int _2687 = _2685 ? _2457 : (-1);
    int _2689 = _2677 * _2673;
    float _2691 = _2155 * _2633;
    int _2693 = _2681 * _2625;
    int _2695 = _2693 + _2683;
    float _2697 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2531);
    int _2699 = _2687 * _2621;
    int _2701 = _2699 + _2689;
    float _2703 = -_2373;
    float _2705 = _2691 * _2703;
    float _2707 = -_2379;
    float _2709 = _2691 * _2707;
    float _2711 = -_2383;
    float _2713 = _2691 * _2711;
    float _2715 = _2697 + _1455;
    float _2717 = fma(_2633, _2219, _2705);
    float _2719 = fma(_2633, _2223, _2709);
    float _2721 = fma(_2633, _2245, _2713);
    float _2723 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2725 = _1455 * 0.5;
    float _2727 = float(_2701);
    float _2729 = _1503 + _1455;
    float _2731 = _2723 * _1529;
    float _2733 = fma(_1505, -0.5, _2725);
    float _2735 = float(_2695);
    float _2737 = -_2723;
    float _2739 = _2737 + 1.0;
    float _2741 = _1540 * _2731;
    float _2743 = _1550 * _2731;
    out.m_74.x = _2735;
    out.m_74.y = _2727;
    float _2745 = _2715 * 0.5;
    float _2747 = _2729 * 0.5;
    float _2749 = _2373 + _2339;
    float _2751 = fma(_1546, _2741, _1534);
    float _2753 = fma(_1548, _2741, _1536);
    out.m_76.x = _2717;
    out.m_76.y = _2719;
    out.m_76.z = _2721;
    bool _2755 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2757 = isnan(_1239);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2763 = _2759 || _2761;
    float _2765 = _1540 * _2739;
    float _2767 = fma(_1540, _2743, _1538);
    out.m_78.x = _2747;
    out.m_78.y = _2733;
    out.m_78.z = _2745;
    out.m_78.w = _1455;
    out.m_80.x = _2751;
    out.m_80.y = _2753;
    out.m_80.z = _2767;
    out.m_80.w = _2765;
    out.m_82.x = _2749;
    out.m_82.y = _2409;
    out.m_82.z = _2417;
    float _2769 = _1536;
    float _2771 = _1534;
    float _2773 = _2697;
    if (!_2763)
    {
        _2769 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2775 = _2769;
    float _2777 = _2775;
    float _2779 = _2775;
    if (!_2763)
    {
        _2771 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2781 = _2771;
    out.gl_Position.x = _1503;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _2697;
    out.gl_Position.w = _1455;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2763)
    {
        _1616 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2787 = _1616;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2763)
    {
        _2773 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2793 = _2773;
    float _2795 = _2793;
    float _2797 = _2793;
    if (!_2763)
    {
        _1618 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2799 = _1618;
    float _2801 = _2799;
    float _2803 = _2799;
    if (!_2763)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2805 = _1620;
    bool _2807 = !_2763;
    float _2809 = _2805;
    float _2811 = _2805;
    if (!_2807)
    {
        bool _2813 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2815 = isnan(_1239);
        bool _2817 = _2813 || _2815;
        bool _2819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2821 = _2817 || _2819;
        if (!_2821)
        {
            float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2825 = _1239 + _2823;
            float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2829 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2827;
            float _2831 = 1.0 / _2829;
            float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2853 = _2825 * _2831;
            float _2855 = precise::clamp(_2853, 0.0, 1.0);
            float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2861 = fma(_2855, _2835, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2863 = fma(_2855, _2859, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2865 = fma(_2855, _2839, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2867 = fma(_2855, _2843, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2869 = fma(_2855, _2847, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2871 = fma(_2855, _2851, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2785 = _2863;
            _2803 = _2869;
            _2779 = _2861;
            _2797 = _2867;
            _2791 = _2865;
            _2811 = _2871;
            _2873 = true;
        }
        else
        {
            bool _2875 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2877 = isnan(_1239);
            bool _2879 = _2875 || _2877;
            bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2883 = _2879 || _2881;
            if (!_2883)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2885 = _2777;
            _2779 = _2885;
            if (!_2883)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2887 = _2783;
            _2785 = _2887;
            if (!_2883)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2889 = _2789;
            _2791 = _2889;
            if (!_2883)
            {
                _2795 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2891 = _2795;
            _2797 = _2891;
            if (!_2883)
            {
                _2801 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2893 = _2801;
            _2803 = _2893;
            if (!_2883)
            {
                _2809 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2895 = _2809;
            bool _2897 = !_2883;
            _2811 = _2895;
            if (!_2897)
            {
                bool _2899 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2901 = isnan(_1239);
                bool _2903 = _2899 || _2901;
                bool _2905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2907 = _2903 || _2905;
                if (!_2907)
                {
                    float _2909 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2911 = _1239 + _2909;
                    float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2915 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2913;
                    float _2917 = 1.0 / _2915;
                    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2927 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2939 = _2911 * _2917;
                    float _2941 = precise::clamp(_2939, 0.0, 1.0);
                    float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2947 = fma(_2941, _2921, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2949 = fma(_2941, _2945, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2951 = fma(_2941, _2925, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2953 = fma(_2941, _2929, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2955 = fma(_2941, _2933, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2957 = fma(_2941, _2937, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2785 = _2949;
                    _2803 = _2955;
                    _2779 = _2947;
                    _2797 = _2953;
                    _2791 = _2951;
                    _2811 = _2957;
                    _2873 = true;
                }
                else
                {
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2803 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2797 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2811 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2873 = false;
    float _2959 = _2785;
    float _2961 = _2803;
    float _2963 = _2779;
    float _2965 = _2797;
    float _2967 = _2791;
    float _2969 = _2811;
    float _2971 = fma(_2409, -0.5, 0.5);
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = -_2959;
    float _2977 = _2975 + _2961;
    float _2979 = -_2963;
    float _2981 = _2979 + _2965;
    float _2983 = -_2967;
    float _2985 = _2983 + _2969;
    bool _2987 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2989 = fma(_2973, _2977, _2959);
    float _2991 = fma(_2973, _2981, _2963);
    float _2993 = fma(_2973, _2985, _2967);
    float _2995 = _2989 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2997 = fma(_2991, 0.298911988735198974609375, _2995);
    float _2999 = fma(_2993, 0.114477999508380889892578125, _2997);
    out.m_84.x = 0.0;
    float _3001 = -_2999;
    float _3003 = _2991 + _3001;
    float _3005 = -_2999;
    float _3007 = _2989 + _3005;
    float _3009 = -_2999;
    float _3011 = _2993 + _3009;
    float _3013 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3015 = fma(_3003, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    float _3017 = fma(_3007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    float _3019 = fma(_3011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    out.m_86.w = _3013;
    out.m_88.x = _3015;
    out.m_88.y = _3017;
    out.m_88.z = _3019;
    if (!_2987)
    {
        return out;
    }
    float _3021 = -_1213;
    float _3023 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3025 = -_1215;
    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3029 = -_1217;
    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3033 = _3023 * _3023;
    float _3035 = fma(_3027, _3027, _3033);
    float _3037 = fma(_3031, _3031, _3035);
    float _3039 = sqrt(_3037);
    float _3041 = rsqrt(_3037);
    float _3043 = -_3039;
    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3047 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3049 = precise::clamp(_3047, 0.0, 1.0);
    float _3051 = _3027 * _3041;
    float _3053 = _3023 * _3041;
    float _3055 = abs(_3049);
    float _3057 = log2(_3055);
    float _3059 = _3031 * _3041;
    float _3061 = _3051 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3063 = _2409 * _3053;
    float _3065 = -_3053;
    float _3067 = -_3061;
    float _3069 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3067);
    float _3071 = fma(_2749, _3051, _3063);
    float _3073 = -_3059;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3069);
    float _3077 = fma(_2417, _3059, _3071);
    float _3079 = precise::clamp(_3077, 0.0, 1.0);
    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3083 = _3075 + _3081;
    float _3085 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3087 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3089 = precise::clamp(_3087, 0.0, 1.0);
    float _3091 = exp2(_3085);
    float _3093 = _3091 * _3089;
    float _3095 = _3079 * _3093;
    float _3097 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3099 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3101 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3097;
    out.m_84.y = _3099;
    out.m_84.z = _3101;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2873 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3160 = as_type<float>(_125);
        out.gl_Position.z = _3160;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3234 = as_type<float>(_165);
        out.gl_Position.z = _3234;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_107);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = in.m_51.y;
    float _217 = _131 * 2.0;
    float _219 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _221 = in.m_44.x;
    float _223 = in.m_44.y;
    float _225 = in.m_44.z;
    float _227 = floor(_217);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _213 + _229;
    float _233 = in.m_58.x;
    float _235 = in.m_58.y;
    float _237 = in.m_58.z;
    float _239 = in.m_58.w;
    float _241 = in.m_60.x;
    float _243 = in.m_60.y;
    float _245 = in.m_60.z;
    float _247 = in.m_60.w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _259 = in.m_51.z;
    float _261 = 1.0 / _255;
    float _263 = -_257;
    float _265 = fma(_219, 2.0, _263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = _227 > 0.0;
    float _273 = _215 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = 1.0 / _251;
    float _277 = _215 * 2.0;
    float _279 = _223 * _235;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _283 = floor(_277);
    float _285 = fma(_221, _233, _279);
    bool _287 = _227 >= 0.0;
    bool _289 = isnan(_227);
    bool _291 = _287 || _289;
    bool _293 = isnan(0.0);
    bool _295 = _291 || _293;
    float _297 = _223 * _243;
    float _299 = fma(_273, -2.0, _281);
    float _301 = _131 + _259;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _313 = _311 != 0;
    float _315 = _259 * 2.0;
    float _317 = 1.0 / _269;
    float _319 = _301 + (-1.0);
    float _321 = fma(_221, _241, _297);
    bool _323 = !_309;
    int _325 = _323 ? 0 : 1;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = _213 + _327;
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _333 = _295 ? 0 : 1;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _337 = _213 + _335;
    bool _339 = _283 > 0.0;
    float _341 = floor(_315);
    bool _343 = _283 >= 0.0;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = _329 * _275;
    bool _355 = !_305;
    int _357 = _355 ? 0 : 1;
    float _359 = _131 + _215;
    bool _361 = !_313;
    int _363 = _361 ? 0 : 1;
    float _365 = _231 * _261;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _377 = _375 != 0;
    float _379 = _359 + (-1.0);
    float _381 = _337 * _317;
    float _383 = _259 + _215;
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _387 = !_369;
    int _389 = _387 ? 0 : 1;
    float _391 = _383 + (-1.0);
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _395 = _393 != 0;
    float _397 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _399 = int(_397);
    float _401 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _299);
    bool _403 = _341 >= 0.0;
    bool _405 = isnan(_341);
    bool _407 = _403 || _405;
    bool _409 = isnan(0.0);
    bool _411 = _407 || _409;
    float _413 = fma(_225, _237, _285);
    float _415 = fma(_225, _245, _321);
    int _417 = ~_333;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _425 = int(_423);
    int _427 = _421;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].z);
    float _431 = _223;
    float _433 = _225;
    if (!_271)
    {
        int _435 = ~_333;
        int _437 = _435 + 1;
        _427 = _437;
    }
    int _439 = _427;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _441;
    bool _445 = _341 > 0.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    if (_395)
    {
        _429 = 0;
    }
    int _451 = _429;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _457 = _451;
    if (!_395)
    {
        _457 = 1;
    }
    int _459 = _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _465 = _411 ? 0 : 1;
    float _467 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _469 = _459 != 1;
    float _471 = fma(_443, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _473 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_213);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_455, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_463, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _489 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _491 = isnan(_213);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = fma(_449, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _507 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _509 = isnan(_213);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _519;
    float _523 = -_499;
    float _525 = _523 + 1.0;
    float _527 = _499 * _503;
    bool _529 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _531 = isnan(_213);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_521, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = _517 * _525;
    float _545 = -_517;
    float _547 = _545 + 1.0;
    float _549 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _551 = log2(_549);
    float _553 = _539 * _547;
    float _555 = float(_107);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _557;
    float _561 = _505;
    float _563 = _547;
    if (!_469)
    {
        _115 = _215;
    }
    float _565 = _115;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _569 = _565;
    if (_469)
    {
        _569 = _131;
    }
    float _571 = _569;
    float _573 = _471 * _553;
    float _575 = _505 * _553;
    float _577 = fma(_559, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].z, _567);
    float _581 = _571;
    if (!_469)
    {
        _561 = _259;
    }
    float _583 = _561;
    float _585 = 1.0 / _555;
    int _587 = ~_465;
    int _589 = _587 + 1;
    int _591 = _589 + 1;
    float _593 = _551 * _145;
    float _595 = _583;
    int _597 = _591;
    if (_469)
    {
        _595 = _215;
    }
    float _599 = _595;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_445)
    {
        int _603 = ~_465;
        int _605 = _603 + 1;
        _597 = _605;
    }
    int _607 = _597;
    float _609 = -_539;
    float _611 = _609 + 1.0;
    float _613 = _599 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _615 = abs(_389);
    float _617 = exp2(_593);
    if (!_469)
    {
        _581 = _259;
    }
    float _619 = _581;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _623 = _619;
    if (_469)
    {
        _623 = _215;
    }
    float _625 = _623;
    float _627 = _413 + _239;
    float _629 = float(_615);
    float _631 = fma(_613, -2.0, _621);
    float _633 = float(_607);
    float _635 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[83].w, _601);
    float _637 = float(_399);
    float _639 = _585 * _145;
    if (!_469)
    {
        _563 = _215;
    }
    float _641 = _563;
    float _643 = _629 * _633;
    float _645 = in.m_62.x;
    float _647 = in.m_62.y;
    float _649 = in.m_62.z;
    float _651 = -_617;
    float _653 = _651 + 1.0;
    float _655 = _641;
    if (_469)
    {
        _655 = _131;
    }
    float _657 = _655;
    float _659 = _643 * (-2.0);
    float _661 = float(_425);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _665 = 1.0 / _637;
    float _667 = _657 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _669 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(1.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = -_663;
    float _681 = fma(_667, 2.0, _679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _685 = 1.0 / _661;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _689 = 1.0 + _687;
    bool _691 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _693 = isnan(0.0);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _699 = _695 || _697;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _703 = !_373;
    int _705 = _703 ? 0 : 1;
    float _707 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[78].w, _683);
    float _709 = _699 ? _653 : 0.0;
    float _711 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _701);
    float _713 = 1.0 / _689;
    float _715 = -_145;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[76].x, _265);
    float _719 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _579);
    float _721 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _635);
    float _723 = _665 * _145;
    float _725 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _727 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _707);
    float _729 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _631);
    float _731 = _685 * _145;
    float _733 = -_145;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[81].x, _681);
    int _737 = abs(_705);
    float _739 = fma(_385, _659, _385);
    float _741 = float(_439);
    float _743 = float(_737);
    float _745 = _723;
    float _747 = _731;
    if (_677)
    {
        float _749 = _709 * _713;
        _147 = _749;
    }
    float _751 = _147;
    float _753 = fma(_659, _645, _645);
    float _755 = _131 + (-0.5);
    float _757 = _743 * _741;
    int _759 = _351 ? 0 : 1;
    float _761 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].x, _753);
    bool _763 = !_377;
    int _765 = _763 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _767;
    int _771 = ~_759;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = _757 * (-2.0);
    int _779 = _775;
    if (!_339)
    {
        int _781 = ~_759;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    float _787 = fma(_739, _751, _761);
    int _789 = abs(_765);
    float _791 = fma(_777, _647, _647);
    float _793 = float(_785);
    float _795 = _769 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _797 = float(_789);
    float _799 = _787 * 0.15915493667125701904296875;
    float _801 = _215 + (-0.5);
    float _803 = fma(_467, _777, _467);
    float _805 = precise::max(0.0, _795);
    float _807 = _797 * _793;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[196].y, _791);
    float _811 = _799 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _807 * (-2.0);
    float _817 = precise::max(_805, 375.0);
    float _819 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _573);
    float _821 = in.m_64.x;
    float _823 = in.m_64.y;
    float _825 = fma(_815, _649, _649);
    float _827 = _259 + (-0.5);
    float _829 = fma(_331, _815, _331);
    float _831 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _575);
    float _833 = fma(_803, _751, _809);
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _837 = precise::min(_817, 550.0);
    float _839 = fma(_485, _543, _819);
    float _841 = fma(_487, _543, _831);
    float _843 = fma(_829, _751, _835);
    float _845 = _833 * 0.15915493667125701904296875;
    float _847 = fma(_837, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _849 = precise::clamp(_847, 0.0, 1.0);
    float _851 = _843 * 0.15915493667125701904296875;
    float _853 = fma(_577, _527, _841);
    float _855 = fma(_541, _527, _839);
    float _857 = _799 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _863 = _861 + 1.0;
    float _865 = -_849;
    float _867 = _865 + 1.0;
    float _869 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[146].y, _853);
    float _871 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[146].x, _855);
    float _873 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _875 = _869 * _823;
    float _877 = _845 * 6.283185482025146484375;
    float _879 = sin(_877);
    float _881 = _871 * _821;
    float _883 = _185 * _873;
    float _885 = _181 * _873;
    float _887 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _883);
    float _893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _885);
    float _895 = _845 * 6.283185482025146484375;
    float _897 = cos(_895);
    float _899 = _887 * _891;
    float _901 = _889 * _893;
    float _903 = _851 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = _859 * _879;
    float _909 = _813 * _879;
    float _911 = _851 * 6.283185482025146484375;
    float _913 = sin(_911);
    float _915 = _859 * _897;
    float _917 = _813 * _897;
    float _919 = _859 * _905;
    float _921 = _813 * _905;
    float _923 = _897 * _905;
    float _925 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _927 = _919 * _899;
    float _929 = _879 * _905;
    float _931 = _921 * _899;
    float _933 = fma(_913, _915, _909);
    float _935 = -_907;
    float _937 = fma(_913, _917, _935);
    float _939 = -_917;
    float _941 = fma(_913, _907, _939);
    float _943 = -_899;
    float _945 = _913 * _943;
    float _947 = fma(_933, _901, _927);
    float _949 = fma(_913, _909, _915);
    float _951 = fma(_923, _901, _945);
    float _953 = fma(_941, _925, _947);
    float _955 = fma(_937, _901, _931);
    float _957 = _415 + _247;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _961 = _959 + 1.0;
    float _963 = fma(_929, _925, _951);
    float _965 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _967 = fma(_949, _925, _955);
    float _969 = fma(_867, _961, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _971 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].x, _965);
    float _975 = fma(_867, 0.10000002384185791015625, 0.89999997615814208984375);
    float _977 = -_225;
    float _979 = fma(_969, _225, _977);
    float _981 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].x, _971);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _973);
    float _985 = -_221;
    float _987 = fma(_969, _221, _985);
    float _989 = _979 + _627;
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _981);
    float _993 = _983 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _995 = in.m_66.x;
    float _997 = in.m_66.y;
    float _999 = in.m_66.z;
    float _1001 = in.m_66.w;
    float _1003 = _987 + _957;
    float _1005 = _991 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _989 + _993;
    float _1009 = _1003 + _1005;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1013 = _1007 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1009 + _1015;
    float _1019 = _1013 * _1013;
    float _1021 = fma(_1017, _1017, _1019);
    float _1023 = sqrt(_1021);
    float _1025 = _223 * _997;
    float _1027 = fma(_221, _995, _1025);
    float _1029 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1031 = -_223;
    float _1033 = fma(_975, _223, _1031);
    float _1035 = fma(_225, _999, _1027);
    float _1037 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1029);
    bool _1039 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1041 = _1035 + _1001;
    float _1043 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1037);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1059 = _1057 != 0;
    float _1061 = _1033 + _1041;
    float _1063 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1067 = isnan(0.5);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1073 = _1069 || _1071;
    bool _1075 = !_1051;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _1061 + _1063;
    bool _1081 = !_1047;
    int _1083 = _1081 ? 0 : 1;
    bool _1085 = !_1055;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1059;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = _1009;
    float _1095 = _1007;
    float _1097 = _1029;
    float _1099 = _1003;
    if (!_1039)
    {
        _431 = _1079;
    }
    float _1101 = _431;
    bool _1103 = !_1039;
    float _1105 = _1101;
    if (!_1103)
    {
        float _1107 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1111 = _1023 + _1109;
        float _1113 = _1079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1115 = rsqrt(_1021);
        float _1117 = _1111 * _1107;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1119 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = _1119 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = _1123 + (-1.0);
        float _1131 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1133 = fma(_1127, _1113, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1135 = fma(_1079, _1123, _1131);
        float _1137 = _1115 * _1133;
        float _1139 = fma(_1017, _1137, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1141 = fma(_1013, _1137, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1093 = _1139;
        _1095 = _1141;
        _1105 = _1135;
        _1097 = _1127;
        _433 = _1131;
    }
    float _1143 = _1093;
    float _1145 = _1095;
    float _1147 = _1105;
    float _1149 = _1097;
    float _1151 = _433;
    float _1153 = _1149;
    float _1155 = _1151;
    float _1157 = _1147;
    float _1159 = _1145;
    if (_1073)
    {
        _1153 = _1143;
    }
    float _1161 = _1153;
    float _1163 = _1161;
    if (_1073)
    {
        _1155 = _1145;
    }
    float _1165 = _1155;
    float _1167 = _1165;
    if (!_1073)
    {
        float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1171 = _1061 + _1169;
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1175 = _1003 + _1173;
        float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1179 = -_1003;
        float _1181 = _1179 + _1143;
        float _1183 = _1171 * _1171;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1187 = _989 + _1185;
        float _1189 = -_1061;
        float _1191 = _1189 + _1147;
        float _1193 = fma(_1175, _1175, _1183);
        float _1195 = fma(_1187, _1187, _1193);
        float _1197 = -_989;
        float _1199 = _1197 + _1145;
        float _1201 = sqrt(_1195);
        float _1203 = precise::min(_1201, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1205 = _1203 * _1177;
        float _1207 = fma(_1181, _1205, _1003);
        float _1209 = fma(_1191, _1205, _1061);
        float _1211 = fma(_1199, _1205, _989);
        _1157 = _1209;
        _1163 = _1207;
        _1167 = _1211;
    }
    float _1213 = _1157;
    float _1215 = _1163;
    float _1217 = _1167;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1221 = _1213 + _1219;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1215 + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1229 = _1217 + _1227;
    float _1231 = _1221 * _1221;
    float _1233 = fma(_1225, _1225, _1231);
    float _1235 = fma(_1229, _1229, _1233);
    float _1237 = rsqrt(_1235);
    float _1239 = sqrt(_1235);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1243 = _1225 * _1241;
    float _1245 = _1229 * _1241;
    float _1247 = _1243 * _1243;
    float _1249 = _1245 * _1245;
    float _1251 = _1247 + _1249;
    float _1253 = sqrt(_1251);
    bool _1255 = _1253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1259 = _1253 + _1257;
    float _1261 = _989;
    float _1263 = _1259;
    float _1265 = _1221;
    float _1267 = _1243;
    if (_1255)
    {
        float _1269 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1261 = _1269;
    }
    float _1271 = _1261;
    float _1273 = _1271;
    if (_1255)
    {
        float _1275 = _1259 * _1271;
        _1263 = _1275;
    }
    float _1277 = _1263;
    if (_1255)
    {
        float _1279 = rsqrt(_1251);
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = _1281;
    if (_1255)
    {
        float _1285 = _1277 * 0.15915493667125701904296875;
        _1099 = _1285;
    }
    float _1287 = _1099;
    float _1289 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1291 = _1229;
    if (_1255)
    {
        float _1293 = _1287 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        _1291 = _1295;
    }
    float _1297 = _1291;
    float _1299 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1301 = precise::max(0.0, _1289);
    float _1303 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1299);
    float _1305 = _975;
    float _1307 = _1301;
    if (_1255)
    {
        float _1309 = _1287 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -_1241;
    float _1317 = -_1301;
    float _1319 = fma(_1221, _1315, _1317);
    float _1321 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    if (_1255)
    {
        float _1323 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1323;
    }
    float _1325 = _1265;
    float _1327 = _1297;
    float _1329 = _1325;
    if (_1255)
    {
        float _1331 = fma(_1297, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = _1333;
    if (!_1255)
    {
        _1329 = _1319;
    }
    float _1337 = _1329;
    float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1341 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1339);
    float _1343 = precise::clamp(_1341, 0.0, 1.0);
    float _1345 = _1337;
    if (_1255)
    {
        float _1347 = _1281 * _1333;
        _1159 = _1347;
    }
    float _1349 = _1159;
    if (!_1255)
    {
        _1335 = _1247;
    }
    float _1351 = _1335;
    float _1353 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1351;
    float _1357 = _1313;
    if (_1255)
    {
        float _1359 = _1313 + (-1.0);
        _1307 = _1359;
    }
    float _1361 = _1307;
    float _1363 = _1361;
    if (_1255)
    {
        float _1365 = _1243 * _1349;
        _1267 = _1365;
    }
    float _1367 = _1267;
    float _1369 = -_1343;
    float _1371 = _1369 + 1.0;
    float _1373 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    if (_1255)
    {
        float _1375 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1375;
    }
    float _1377 = _1283;
    if (!_1255)
    {
        _1363 = _1245;
    }
    float _1379 = _1363;
    float _1381 = _1379;
    if (_1255)
    {
        float _1383 = _1245 * _1349;
        _1381 = _1383;
    }
    float _1385 = _1381;
    if (_1255)
    {
        float _1387 = _1367 * _1367;
        _1355 = _1387;
    }
    float _1389 = _1355;
    if (_1255)
    {
        float _1391 = fma(_1319, _1313, _1377);
        _1345 = _1391;
    }
    float _1393 = _1345;
    if (!_1255)
    {
        _1357 = _1249;
    }
    float _1395 = _1357;
    float _1397 = _1395;
    if (_1255)
    {
        float _1399 = _1385 * _1385;
        _1397 = _1399;
    }
    float _1401 = _1397;
    float _1403 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1405 = fma(_1393, _1393, _1389);
    float _1407 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1373);
    float _1409 = abs(_1371);
    float _1411 = log2(_1409);
    float _1413 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1403);
    float _1415 = _1405 + _1401;
    float _1417 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1421 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1413);
    float _1423 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1425 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1427 = rsqrt(_1415);
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1431 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1433 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1425);
    float _1435 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1439 = -_1431;
    float _1441 = fma(_1439, _1423, 1.0);
    float _1443 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1437);
    float _1447 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1445);
    float _1449 = _1427 * _1367;
    float _1451 = _1427 * _1393;
    float _1453 = _1427 * _1385;
    float _1455 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1447);
    float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1459 = log2(_1441);
    float _1461 = -_1457;
    float _1463 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1461);
    float _1465 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1467 = -_1453;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1463);
    float _1471 = 1.0 / _1455;
    float _1473 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = fma(_1469, -0.5, 0.5);
    float _1479 = fma(_1469, 0.5, 0.5);
    float _1481 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1483 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1485 = _1451 + 1.0;
    float _1487 = exp2(_1465);
    float _1489 = fma(_1479, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1491 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1481);
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1483);
    float _1495 = fma(_1479, _1489, -0.212114393711090087890625);
    float _1497 = sqrt(_1477);
    float _1499 = -_1451;
    float _1501 = fma(_1487, _1485, _1499);
    float _1503 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1491);
    float _1505 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1493);
    float _1507 = fma(_1479, _1495, 1.570728778839111328125);
    float _1509 = _1459 * 0.693147182464599609375;
    float _1511 = _1503 * _1471;
    float _1513 = _1505 * _1471;
    float _1515 = fma(_1501, 0.5, 0.5);
    float _1517 = _1497 * 0.636619746685028076171875;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1521 = fma(_1511, 0.5, 0.5);
    float _1523 = fma(_1513, -0.5, 0.5);
    float _1525 = -_1507;
    float _1527 = fma(_1517, _1525, 1.0);
    float3 _5349 = float3(_1521, _1523, _1519);
    float _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5349, float3(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5349, float3(0.0), isnan(_5349)), level(0.0)).x;
    float3 _5360 = float3(_1521, _1523, _1519);
    float4 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5360, float3(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5360, float3(0.0), isnan(_5360)), level(0.0)).xyzw;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = _1532.w;
    float2 _5377 = float2(_1527, _1515);
    float3 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5377, float2(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5377, float2(0.0), isnan(_5377)), level(0.0)).xyz;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1554 = int(_1552);
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1558 = _1556 != 0;
    float _1560 = -_719;
    float _1562 = _1560 + 1.0;
    bool _1564 = _131 > 0.5;
    float _1566 = -_725;
    float _1568 = _1566 + 1.0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1572 = _1570 != 0;
    float _1574 = -_727;
    float _1576 = _1574 + 1.0;
    bool _1578 = _215 > 0.5;
    float _1580 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1582 = int(_1580);
    bool _1584 = _259 > 0.5;
    float _1586 = -_721;
    float _1588 = _1586 + 1.0;
    int _1590 = abs(_1091);
    float _1592 = _885 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1594 = _1429 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1596 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_68.x = _1215;
    out.m_68.y = _1213;
    out.m_68.z = _1217;
    float _1598 = float(uint(_1554));
    float _1600 = trunc(_723);
    int _1602 = int(_1600);
    float _1604 = float(_1554);
    float _1606 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1594);
    float _1608 = float(uint(_1582));
    float _1610 = 1.0 / _1598;
    int _1612 = ~_1582;
    int _1614 = _1612 + 1;
    float _1616 = _1455;
    float _1618 = _1505;
    float _1620 = _1503;
    if (_1558)
    {
        _745 = 1.0;
    }
    float _1622 = _745;
    float _1624 = _1622;
    if (!_1558)
    {
        _1624 = 1.2345600128173828125;
    }
    float _1626 = _1624;
    float _1628 = 1.0 / _1608;
    float _1630 = trunc(_731);
    int _1632 = int(_1630);
    int _1634 = as_type<int>(_1610) + (-2);
    float _1636 = float(uint(_1602));
    int _1638 = ~_1554;
    int _1640 = _1638 + 1;
    int _1642 = as_type<int>(_1628) + (-2);
    float _1644 = as_type<float>(_1634) * _1636;
    if (_1558)
    {
        _747 = _131;
    }
    float _1646 = _747;
    float _1648 = exp2(_1596);
    float _1650 = _1646;
    if (!_1558)
    {
        _1650 = _215;
    }
    float _1652 = _1650;
    float _1654 = float(uint(_1632));
    float _1656 = _1626 * _1652;
    float _1658 = trunc(_1644);
    float _1660 = precise::max(_1658, 0.0);
    uint _1663 = uint(_1660);
    float _1665 = as_type<float>(_1642) * _1654;
    float _1667 = _1654;
    if (_1558)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    float _1671 = _1669;
    if (!_1558)
    {
        _1671 = 7.345489978790283203125;
    }
    float _1673 = _1671;
    float _1675 = trunc(_1665);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = -_1648;
    float _1683 = _1681 + 1.0;
    float _1685 = _1673 * _131;
    float _1687 = float(_1602);
    int _1689 = _1640 * int(_1663);
    int _1691 = _1689 + _1602;
    float _1693 = floor(_1685);
    float _1695 = float(uint(_1691));
    int _1697 = _1614 * int(_1679);
    int _1699 = _1697 + _1632;
    float _1701 = floor(_1656);
    float _1703 = as_type<float>(_1634) * _1695;
    float _1705 = float(uint(_1699));
    float _1707 = trunc(_1703);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = as_type<float>(_1642) * _1705;
    float _1715 = -_1693;
    float _1717 = _1685 + _1715;
    bool _1719 = _1687 >= _1604;
    bool _1721 = isnan(_1687);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan(_1604);
    bool _1727 = _1723 || _1725;
    float _1729 = float(_1727);
    int _1731 = ~_1582;
    int _1733 = _1731 + 1;
    float _1735 = _1717 * _1604;
    float _1737 = float(_1632);
    float _1739 = trunc(_1713);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = -_1701;
    float _1747 = _1656 + _1745;
    int _1749 = ~_1554;
    int _1751 = _1749 + 1;
    float _1753 = _1604 * _639;
    int _1755 = int(_1663) + int(_1711);
    float _1757 = trunc(_1735);
    int _1759 = int(_1757);
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1763 = _1761 != 0;
    int _1765 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1767 = _1765 != 0;
    int _1769 = _1751 * _1755;
    int _1771 = _1769 + _1602;
    int _1773 = int(_1679) + int(_1743);
    float _1775 = trunc(_1753);
    int _1777 = int(_1775);
    float _1779 = float(_1582);
    bool _1781 = uint(_1771) >= uint(_1554);
    bool _1783 = _1737 >= _1779;
    bool _1785 = isnan(_1737);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(_1779);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = _1779 * _639;
    bool _1797 = !_1781;
    int _1799 = _1797 ? 0 : (-1);
    float _1801 = trunc(_1729);
    int _1803 = int(_1801);
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1807 = _1805 != 0;
    int _1809 = ~_1755;
    int _1811 = _1809 + _1799;
    int _1813 = _1811 + 1;
    int _1815 = _1554 * _1813;
    int _1817 = _1815 + _1602;
    float _1819 = trunc(_1795);
    int _1821 = int(_1819);
    int _1823 = _1733 * _1773;
    int _1825 = _1823 + _1632;
    float _1827 = _1747 * _1779;
    bool _1829 = !_1763;
    int _1831 = _1829 ? 0 : 1;
    bool _1833 = uint(_1825) >= uint(_1582);
    float _1835 = trunc(_1793);
    int _1837 = int(_1835);
    int _1839 = abs(_1831);
    bool _1841 = !_1833;
    int _1843 = _1841 ? 0 : (-1);
    bool _1845 = _1582 == 0;
    int _1847 = _1759 * _1839;
    int _1849 = _1847 + _1602;
    int _1851 = ~_1773;
    int _1853 = _1851 + _1843;
    int _1855 = _1853 + 1;
    float _1857 = trunc(_1827);
    int _1859 = int(_1857);
    bool _1861 = !_1807;
    int _1863 = _1861 ? 0 : 1;
    bool _1865 = _1554 == 0;
    int _1867 = abs(_1863);
    int _1869 = _1582 * _1855;
    int _1871 = _1869 + _1632;
    int _1873 = ~_1803;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    bool _1879 = !_1865;
    int _1881 = _1879 ? _1817 : (-1);
    int _1883 = _1554 + (-1);
    int _1885 = ~_1837;
    int _1887 = _1885 + 1;
    int _1889 = _1887 + 1;
    int _1891 = _1881 * _1877;
    bool _1893 = !_1845;
    int _1895 = _1893 ? _1871 : (-1);
    int _1897 = _1859 * _1867;
    int _1899 = _1897 + _1632;
    int _1901 = _1582 + (-1);
    int _1903 = _1803 * _1883;
    int _1905 = _1903 + _1891;
    float _1907 = in.m_51.w;
    int _1909 = _1895 * _1889;
    int _1911 = abs(_325);
    int _1913 = ~_1554;
    int _1915 = _1913 + 1;
    int _1917 = _1837 * _1901;
    int _1919 = _1917 + _1909;
    int _1921 = abs(_357);
    int _1923 = _1905 * _1911;
    int _1925 = abs(_1077);
    int _1927 = abs(_1083);
    int _1929 = _1777 * _1921;
    int _1931 = _1929 + _1923;
    int _1933 = abs(_363);
    int _1935 = _1919 * _1925;
    bool _1937 = !_1572;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = float(uint(_1849));
    int _1943 = _1821 * _1927;
    int _1945 = _1943 + _1935;
    int _1947 = abs(_1087);
    int _1949 = _1849 * _1933;
    int _1951 = _1949 + _1931;
    int _1953 = abs(_1939);
    float _1955 = as_type<float>(_1634) * _1941;
    float _1957 = float(uint(_1899));
    int _1959 = _1899 * _1947;
    int _1961 = _1959 + _1945;
    bool _1963 = _1907 > 0.5;
    float _1965 = trunc(_1955);
    float _1967 = precise::max(_1965, 0.0);
    uint _1969 = uint(_1967);
    int _1971 = _1759 * _1953;
    int _1973 = _1971 + _1951;
    float _1975 = as_type<float>(_1642) * _1957;
    float _1977 = -_181;
    int _1979 = _1584 ? as_type<int>(_1977) : as_type<int>(_181);
    int _1981 = _1859 * _1590;
    int _1983 = _1981 + _1961;
    float _1985 = float(uint(_1973));
    float _1987 = -_181;
    int _1989 = _1564 ? as_type<int>(_1987) : as_type<int>(_181);
    float _1991 = trunc(_1975);
    float _1993 = precise::max(_1991, 0.0);
    uint _1995 = uint(_1993);
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1999 = _1997 != 0;
    float _2001 = as_type<float>(_1634) * _1985;
    float _2003 = float(uint(_1983));
    bool _2005 = !_1767;
    float _2007 = _2005 ? _181 : as_type<float>(_1989);
    bool _2009 = !_1999;
    float _2011 = _2009 ? _181 : as_type<float>(_1979);
    int _2013 = _1915 * int(_1969);
    int _2015 = _2013 + _1849;
    float _2017 = as_type<float>(_1642) * _2003;
    float _2019 = trunc(_2001);
    float _2021 = precise::max(_2019, 0.0);
    uint _2023 = uint(_2021);
    int _2025 = ~_1582;
    int _2027 = _2025 + 1;
    float _2029 = _2007 + 0.5;
    float _2031 = float(uint(_2015));
    float _2033 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[80].x, _717);
    int _2035 = ~_1554;
    int _2037 = _2035 + 1;
    float _2039 = trunc(_2017);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    int _2045 = ~_1582;
    int _2047 = _2045 + 1;
    int _2049 = _2027 * int(_1995);
    int _2051 = _2049 + _1899;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2055 = _2053 != 0;
    float _2057 = -_1568;
    float _2059 = fma(_2007, _2057, _2033);
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2063 = _2061 != 0;
    float _2065 = as_type<float>(_1634) * _2031;
    float _2067 = float(uint(_2051));
    int _2069 = _2037 * int(_2023);
    int _2071 = _2069 + _1973;
    float _2073 = -_185;
    int _2075 = _1578 ? as_type<int>(_2073) : as_type<int>(_185);
    float _2077 = -_185;
    int _2079 = _1963 ? as_type<int>(_2077) : as_type<int>(_185);
    float _2081 = as_type<float>(_1642) * _2067;
    float _2083 = float(uint(_2071));
    float _2085 = trunc(_2065);
    float _2087 = precise::max(_2085, 0.0);
    uint _2089 = uint(_2087);
    bool _2091 = !_2055;
    float _2093 = _2091 ? _185 : as_type<float>(_2075);
    int _2095 = _2047 * int(_2043);
    int _2097 = _2095 + _1983;
    bool _2099 = !_2063;
    float _2101 = _2099 ? _185 : as_type<float>(_2079);
    float _2103 = as_type<float>(_1634) * _2083;
    float _2105 = _2011 + 0.5;
    float _2107 = _2093 + (-0.5);
    float _2109 = float(uint(_2097));
    float _2111 = _2101 + (-0.5);
    float _2113 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[85].x, _735);
    float _2115 = trunc(_2103);
    float _2117 = precise::max(_2115, 0.0);
    uint _2119 = uint(_2117);
    float _2121 = -_2107;
    float _2123 = -_401;
    float _2125 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2123);
    float _2127 = as_type<float>(_1642) * _2109;
    float _2129 = -_2111;
    float _2131 = -_729;
    float _2133 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2131);
    float _2135 = -_1562;
    float _2137 = fma(_2011, _2135, _2113);
    int _2139 = ~_1554;
    int _2141 = _2139 + 1;
    float _2143 = fma(_2093, _1576, _2125);
    float _2145 = fma(_2101, _1588, _2133);
    float _2147 = trunc(_2127);
    float _2149 = precise::max(_2147, 0.0);
    uint _2151 = uint(_2149);
    int _2153 = int(_1969) + int(_2089);
    float _2155 = _883 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2157 = ~_1554;
    int _2159 = _2157 + 1;
    out.m_70.x = _2059;
    out.m_70.y = _2143;
    out.m_70.z = _2137;
    out.m_70.w = _2145;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2167 = _2165 != 0;
    float _2169 = trunc(_2081);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = int(_2023) + int(_2119);
    int _2177 = _2159 * _2153;
    int _2179 = _2177 + _1849;
    bool _2181 = uint(_2179) >= uint(_1554);
    int _2183 = int(_2043) + int(_2151);
    float _2185 = _919 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2187 = ~_1582;
    int _2189 = _2187 + 1;
    int _2191 = _2141 * _2175;
    int _2193 = _2191 + _1973;
    float _2195 = -_913;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2185);
    int _2199 = int(_1995) + int(_2173);
    float _2201 = _919 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2203 = uint(_2193) >= uint(_1554);
    int _2205 = _2189 * _2183;
    int _2207 = _2205 + _1983;
    float _2209 = _919 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2211 = -_913;
    float _2213 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2201);
    bool _2215 = !_2203;
    int _2217 = _2215 ? 0 : (-1);
    float _2219 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2197);
    bool _2221 = uint(_2207) >= uint(_1582);
    float _2223 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2213);
    int _2225 = ~_2175;
    int _2227 = _2225 + _2217;
    int _2229 = _2227 + 1;
    float _2231 = -_913;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2209);
    bool _2235 = !_2221;
    int _2237 = _2235 ? 0 : (-1);
    float _2239 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2241 = ~_1582;
    int _2243 = _2241 + 1;
    float _2245 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2233);
    int _2247 = ~_2183;
    int _2249 = _2247 + _2237;
    int _2251 = _2249 + 1;
    int _2253 = _1554 * _2229;
    int _2255 = _2253 + _1973;
    float _2257 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2259 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2261 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2263 = _1582 * _2251;
    int _2265 = _2263 + _1983;
    bool _2267 = !_1865;
    int _2269 = _2267 ? _2255 : (-1);
    float _2271 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2257);
    float _2273 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2275 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2259);
    int _2277 = _2269 >> 31;
    int _2279 = _2243 * _2199;
    int _2281 = _2279 + _1899;
    int _2283 = _2269 & 3;
    bool _2285 = _2283 != 0;
    float _2287 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2239);
    int _2289 = _2277 & 3;
    float _2291 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2261);
    bool _2293 = !_1845;
    int _2295 = _2293 ? _2265 : (-1);
    float _2297 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2273);
    bool _2299 = !_2285;
    int _2301 = _2299 ? 0 : 1;
    float _2303 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2287);
    int _2305 = _2269 & 3;
    bool _2307 = _2305 != 0;
    float _2309 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2291);
    int _2311 = _2269 + _2289;
    float _2313 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2315 = _2295 >> 31;
    float _2317 = _2155 * _2219;
    bool _2319 = uint(_2281) >= uint(_1582);
    float _2321 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2297);
    int _2323 = _2315 & 3;
    float _2325 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2313);
    int _2327 = _2311 >> 2;
    float _2329 = _2155 * _2223;
    int _2331 = _2295 + _2323;
    float _2333 = _2155 * _2245;
    int _2335 = _2327 << 4;
    int _2337 = _2335 + 368;
    float _2339 = fma(_1592, _2303, _2317);
    int _2341 = _2331 >> 2;
    float _2343 = fma(_1592, _2309, _2329);
    int _2345 = _2307 ? 0 : 1;
    float _2347 = fma(_1592, _2321, _2333);
    int _2349 = _2341 << 4;
    int _2351 = _2349 + 512;
    int _2353 = _2337 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    bool _2371 = uint(_2283) >= 2u;
    float _2373 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2271);
    bool _2375 = !_2181;
    int _2377 = _2375 ? 0 : (-1);
    float _2379 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2275);
    bool _2381 = _2283 != 3;
    float _2383 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2325);
    int _2385 = _2371 ? 0 : 1;
    uint _2387 = uint(int(uint(_2337) >> uint(2)));
    uint _2389 = uint(int(uint(int(_2387)) >> uint(2)));
    int _2391 = int(_2387) & 3;
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[int(_2389)][_2391];
    int _2395 = int(_2387) + 1;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    int _2399 = _2395 & 3;
    float _2401 = (*spvDescriptorSet0.vp_c9)._m0[int(_2397)][_2399];
    bool _2403 = uint(_2283) > 1u;
    out.m_72.x = _2303;
    out.m_72.y = _2309;
    out.m_72.z = _2321;
    bool _2405 = !_2319;
    int _2407 = _2405 ? 0 : (-1);
    float _2409 = _2379 + _2343;
    int _2411 = ~_2153;
    int _2413 = _2411 + _2377;
    int _2415 = _2413 + 1;
    float _2417 = _2383 + _2347;
    int _2419 = ~_2199;
    int _2421 = _2419 + _2407;
    int _2423 = _2421 + 1;
    uint _2425 = uint(int(uint(_2351) >> uint(2)));
    uint _2427 = uint(int(uint(int(_2425)) >> uint(2)));
    int _2429 = int(_2425) & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    int _2433 = int(_2425) + 1;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    int _2437 = _2433 & 3;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[int(_2435)][_2437];
    int _2441 = _2295 & 3;
    bool _2443 = _2441 != 0;
    int _2445 = _1554 * _2415;
    int _2447 = _2445 + _1849;
    int _2449 = ~_2385;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    int _2455 = _1582 * _2423;
    int _2457 = _2455 + _1899;
    int _2459 = _2453;
    if (_2381)
    {
        int _2461 = ~_2385;
        int _2463 = _2461 + 1;
        _2459 = _2463;
    }
    int _2465 = _2459;
    bool _2467 = uint(_2441) > 1u;
    int _2469 = _2351 + 8;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    uint _2473 = uint(int(uint(int(_2471)) >> uint(2)));
    int _2475 = int(_2471) & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    int _2479 = int(_2471) + 1;
    uint _2481 = uint(int(uint(_2479) >> uint(2)));
    int _2483 = _2479 & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = ~_2345;
    int _2489 = _2487 + 1;
    int _2491 = _2489 + 1;
    int _2493 = _2491;
    if (!_2403)
    {
        int _2495 = ~_2345;
        int _2497 = _2495 + 1;
        _2493 = _2497;
    }
    int _2499 = _2493;
    int _2501 = _2295 & 3;
    bool _2503 = _2501 != 0;
    bool _2505 = !_2443;
    int _2507 = _2505 ? 0 : 1;
    int _2509 = _2503 ? 0 : 1;
    bool _2511 = uint(_2441) >= 2u;
    int _2513 = ~_2509;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _2517;
    if (!_2467)
    {
        int _2521 = ~_2509;
        int _2523 = _2521 + 1;
        _2519 = _2523;
    }
    int _2525 = _2519;
    bool _2527 = _2441 != 3;
    bool _2529 = _2441 != 3;
    float _2531 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    int _2533 = abs(_2499);
    int _2535 = abs(_2525);
    int _2537 = abs(_2301);
    int _2539 = abs(_2465);
    int _2541 = ~_2533;
    int _2543 = _2541 + 1;
    int _2545 = _2543 + 1;
    int _2547 = ~_2535;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    int _2553 = ~_2537;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    int _2559 = _2545 * as_type<int>(_2401);
    int _2561 = _2511 ? 0 : 1;
    int _2563 = _2557 * as_type<int>(_2393);
    int _2565 = _2563 + _2559;
    int _2567 = abs(_2507);
    int _2569 = _2551 * as_type<int>(_2439);
    int _2571 = ~_2539;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = ~_2561;
    int _2579 = _2577 + 1;
    int _2581 = _2579 + 1;
    int _2583 = _2581;
    if (_2527)
    {
        int _2585 = ~_2561;
        int _2587 = _2585 + 1;
        _2583 = _2587;
    }
    int _2589 = _2583;
    int _2591 = _2575 * as_type<int>(_2361);
    int _2593 = _2591 + _2565;
    bool _2595 = !_2167;
    int _2597 = _2595 ? 0 : 1;
    int _2599 = ~_2567;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    bool _2605 = !_2163;
    int _2607 = _2605 ? 0 : 1;
    bool _2609 = _2283 != 3;
    int _2611 = _2603 * as_type<int>(_2431);
    int _2613 = _2611 + _2569;
    bool _2615 = !_2529;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2589);
    int _2621 = abs(_2597);
    float _2623 = fma(_2155, _2155, 1.0);
    int _2625 = abs(_2607);
    bool _2627 = !_2609;
    int _2629 = _2627 ? 0 : (-1);
    int _2631 = abs(_2617);
    float _2633 = rsqrt(_2623);
    int _2635 = abs(_2629);
    int _2637 = ~_2619;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = ~_2635;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    int _2649 = ~_2631;
    int _2651 = _2649 + 1;
    int _2653 = _2651 + 1;
    int _2655 = _2641 * as_type<int>(_2477);
    int _2657 = _2655 + _2613;
    int _2659 = ~_2625;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    int _2665 = _2647 * as_type<int>(_2369);
    int _2667 = _2665 + _2593;
    int _2669 = ~_2621;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    int _2675 = _2653 * as_type<int>(_2485);
    int _2677 = _2675 + _2657;
    bool _2679 = !_1865;
    int _2681 = _2679 ? _2447 : (-1);
    int _2683 = _2667 * _2663;
    bool _2685 = !_1845;
    int _2687 = _2685 ? _2457 : (-1);
    int _2689 = _2677 * _2673;
    float _2691 = _2155 * _2633;
    int _2693 = _2681 * _2625;
    int _2695 = _2693 + _2683;
    float _2697 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2531);
    int _2699 = _2687 * _2621;
    int _2701 = _2699 + _2689;
    float _2703 = -_2373;
    float _2705 = _2691 * _2703;
    float _2707 = -_2379;
    float _2709 = _2691 * _2707;
    float _2711 = -_2383;
    float _2713 = _2691 * _2711;
    float _2715 = _2697 + _1455;
    float _2717 = fma(_2633, _2219, _2705);
    float _2719 = fma(_2633, _2223, _2709);
    float _2721 = fma(_2633, _2245, _2713);
    float _2723 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2725 = _1455 * 0.5;
    float _2727 = float(_2701);
    float _2729 = _1503 + _1455;
    float _2731 = _2723 * _1529;
    float _2733 = fma(_1505, -0.5, _2725);
    float _2735 = float(_2695);
    float _2737 = -_2723;
    float _2739 = _2737 + 1.0;
    float _2741 = _1540 * _2731;
    float _2743 = _1550 * _2731;
    out.m_74.x = _2735;
    out.m_74.y = _2727;
    float _2745 = _2715 * 0.5;
    float _2747 = _2729 * 0.5;
    float _2749 = _2373 + _2339;
    float _2751 = fma(_1546, _2741, _1534);
    float _2753 = fma(_1548, _2741, _1536);
    out.m_76.x = _2717;
    out.m_76.y = _2719;
    out.m_76.z = _2721;
    bool _2755 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2757 = isnan(_1239);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2763 = _2759 || _2761;
    float _2765 = _1540 * _2739;
    float _2767 = fma(_1540, _2743, _1538);
    out.m_78.x = _2747;
    out.m_78.y = _2733;
    out.m_78.z = _2745;
    out.m_78.w = _1455;
    out.m_80.x = _2751;
    out.m_80.y = _2753;
    out.m_80.z = _2767;
    out.m_80.w = _2765;
    out.m_82.x = _2749;
    out.m_82.y = _2409;
    out.m_82.z = _2417;
    float _2769 = _1536;
    float _2771 = _1534;
    float _2773 = _2697;
    if (!_2763)
    {
        _2769 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2775 = _2769;
    float _2777 = _2775;
    float _2779 = _2775;
    if (!_2763)
    {
        _2771 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2781 = _2771;
    out.gl_Position.x = _1503;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _2697;
    out.gl_Position.w = _1455;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2763)
    {
        _1616 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2787 = _1616;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2763)
    {
        _2773 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2793 = _2773;
    float _2795 = _2793;
    float _2797 = _2793;
    if (!_2763)
    {
        _1618 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2799 = _1618;
    float _2801 = _2799;
    float _2803 = _2799;
    if (!_2763)
    {
        _1620 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2805 = _1620;
    bool _2807 = !_2763;
    float _2809 = _2805;
    float _2811 = _2805;
    if (!_2807)
    {
        bool _2813 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2815 = isnan(_1239);
        bool _2817 = _2813 || _2815;
        bool _2819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2821 = _2817 || _2819;
        if (!_2821)
        {
            float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2825 = _1239 + _2823;
            float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2829 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2827;
            float _2831 = 1.0 / _2829;
            float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2853 = _2825 * _2831;
            float _2855 = precise::clamp(_2853, 0.0, 1.0);
            float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2861 = fma(_2855, _2835, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2863 = fma(_2855, _2859, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2865 = fma(_2855, _2839, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2867 = fma(_2855, _2843, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2869 = fma(_2855, _2847, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2871 = fma(_2855, _2851, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2785 = _2863;
            _2803 = _2869;
            _2779 = _2861;
            _2797 = _2867;
            _2791 = _2865;
            _2811 = _2871;
            _2873 = true;
        }
        else
        {
            bool _2875 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2877 = isnan(_1239);
            bool _2879 = _2875 || _2877;
            bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2883 = _2879 || _2881;
            if (!_2883)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2885 = _2777;
            _2779 = _2885;
            if (!_2883)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2887 = _2783;
            _2785 = _2887;
            if (!_2883)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2889 = _2789;
            _2791 = _2889;
            if (!_2883)
            {
                _2795 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2891 = _2795;
            _2797 = _2891;
            if (!_2883)
            {
                _2801 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2893 = _2801;
            _2803 = _2893;
            if (!_2883)
            {
                _2809 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2895 = _2809;
            bool _2897 = !_2883;
            _2811 = _2895;
            if (!_2897)
            {
                bool _2899 = _1239 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2901 = isnan(_1239);
                bool _2903 = _2899 || _2901;
                bool _2905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2907 = _2903 || _2905;
                if (!_2907)
                {
                    float _2909 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2911 = _1239 + _2909;
                    float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2915 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2913;
                    float _2917 = 1.0 / _2915;
                    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2927 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2939 = _2911 * _2917;
                    float _2941 = precise::clamp(_2939, 0.0, 1.0);
                    float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2947 = fma(_2941, _2921, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2949 = fma(_2941, _2945, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2951 = fma(_2941, _2925, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2953 = fma(_2941, _2929, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2955 = fma(_2941, _2933, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2957 = fma(_2941, _2937, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2785 = _2949;
                    _2803 = _2955;
                    _2779 = _2947;
                    _2797 = _2953;
                    _2791 = _2951;
                    _2811 = _2957;
                    _2873 = true;
                }
                else
                {
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2803 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2797 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2811 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2873 = false;
    float _2959 = _2785;
    float _2961 = _2803;
    float _2963 = _2779;
    float _2965 = _2797;
    float _2967 = _2791;
    float _2969 = _2811;
    float _2971 = fma(_2409, -0.5, 0.5);
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = -_2959;
    float _2977 = _2975 + _2961;
    float _2979 = -_2963;
    float _2981 = _2979 + _2965;
    float _2983 = -_2967;
    float _2985 = _2983 + _2969;
    bool _2987 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2989 = fma(_2973, _2977, _2959);
    float _2991 = fma(_2973, _2981, _2963);
    float _2993 = fma(_2973, _2985, _2967);
    float _2995 = _2989 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2997 = fma(_2991, 0.298911988735198974609375, _2995);
    float _2999 = fma(_2993, 0.114477999508380889892578125, _2997);
    out.m_84.x = 0.0;
    float _3001 = -_2999;
    float _3003 = _2991 + _3001;
    float _3005 = -_2999;
    float _3007 = _2989 + _3005;
    float _3009 = -_2999;
    float _3011 = _2993 + _3009;
    float _3013 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3015 = fma(_3003, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    float _3017 = fma(_3007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    float _3019 = fma(_3011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2999);
    out.m_86.w = _3013;
    out.m_88.x = _3015;
    out.m_88.y = _3017;
    out.m_88.z = _3019;
    if (!_2987)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3021 = -_1213;
    float _3023 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3025 = -_1215;
    float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3029 = -_1217;
    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3033 = _3023 * _3023;
    float _3035 = fma(_3027, _3027, _3033);
    float _3037 = fma(_3031, _3031, _3035);
    float _3039 = sqrt(_3037);
    float _3041 = rsqrt(_3037);
    float _3043 = -_3039;
    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3047 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3049 = precise::clamp(_3047, 0.0, 1.0);
    float _3051 = _3027 * _3041;
    float _3053 = _3023 * _3041;
    float _3055 = abs(_3049);
    float _3057 = log2(_3055);
    float _3059 = _3031 * _3041;
    float _3061 = _3051 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3063 = _2409 * _3053;
    float _3065 = -_3053;
    float _3067 = -_3061;
    float _3069 = fma(_3065, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3067);
    float _3071 = fma(_2749, _3051, _3063);
    float _3073 = -_3059;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3069);
    float _3077 = fma(_2417, _3059, _3071);
    float _3079 = precise::clamp(_3077, 0.0, 1.0);
    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3083 = _3075 + _3081;
    float _3085 = _3057 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3087 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3089 = precise::clamp(_3087, 0.0, 1.0);
    float _3091 = exp2(_3085);
    float _3093 = _3091 * _3089;
    float _3095 = _3079 * _3093;
    float _3097 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3099 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3101 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3097;
    out.m_84.y = _3099;
    out.m_84.z = _3101;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

