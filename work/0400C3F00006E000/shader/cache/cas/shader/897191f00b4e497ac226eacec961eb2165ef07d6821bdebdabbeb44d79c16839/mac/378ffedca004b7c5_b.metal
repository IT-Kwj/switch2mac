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
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_72 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    float _99 = as_type<float>(_91);
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _97;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2333 = as_type<float>(_107);
        out.gl_Position.z = _2333;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    float _111 = float(_91);
    float _113 = in.m_49.x;
    float _115 = -_109;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_109);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    out.m_51.x = _113;
    bool _129 = _117 >= _111;
    bool _131 = !_127;
    bool _133 = _129 || _131;
    float _135 = 1.0 / _111;
    float _137 = _117;
    if (_133)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _141 = 0;
    if (_133)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    float _147 = _117 * _135;
    float _149 = _147;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2407 = as_type<float>(_145);
        out.gl_Position.z = _2407;
    }
    out.m_53.x = _147;
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = in.m_42.x;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    int _165 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _167 = _165 != 0;
    float _169 = _153 * _151;
    float _171 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _173 = _171 * 6.283185482025146484375;
    float _175 = floor(_171);
    out.m_55.x = _155;
    float _177 = _173 * 0.15915493667125701904296875;
    bool _179 = !_159;
    int _181 = _179 ? 0 : 1;
    int _183 = abs(_181);
    float _185 = _177 * 6.283185482025146484375;
    float _187 = cos(_185);
    bool _189 = !_167;
    int _191 = _189 ? 0 : 1;
    bool _193 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _195 = abs(_191);
    float _197 = -_175;
    float _199 = _171 + _197;
    bool _201 = !_163;
    int _203 = _201 ? 0 : 1;
    float _205 = float(_183);
    int _207 = abs(_203);
    float _209 = -_199;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _213 = fma(_187, 0.5, 0.5);
    float _215 = abs(_211);
    float _217 = _205 * _215;
    bool _219 = _199 < 0.5;
    float _221 = float(_219);
    float _223 = -_213;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_195);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_207);
    float _235 = fma(_227, _225, _217);
    float _237 = abs(_231);
    float _239 = fma(_233, _237, _235);
    bool _241 = !_193;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _113 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _149 = _255;
    }
    float _257 = _149;
    float _259 = in.m_49.y;
    float _261 = _113 * 2.0;
    float _263 = in.m_49.z;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _267 = _113 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _279 = 1.0 / _271;
    float _281 = -_277;
    float _283 = fma(_267, 2.0, _281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = 1.0 / _275;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _257 + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _315 = -_117;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[76].x, _283);
    float _319 = fma(_311, -2.0, _265);
    float _321 = _259 * 2.0;
    float _323 = floor(_261);
    float _325 = _263 * 2.0;
    float _327 = _301 * _279;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = _257 + _329;
    float _333 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[78].z, _313);
    float _335 = fma(_291, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_305, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = floor(_321);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _257 + _341;
    float _345 = _343 * _297;
    float _347 = _113 + _259;
    float _349 = _259 + _263;
    float _351 = 1.0 / _287;
    bool _353 = _323 > 0.0;
    float _355 = _347 + (-1.0);
    bool _357 = _323 >= 0.0;
    bool _359 = isnan(_323);
    bool _361 = _357 || _359;
    bool _363 = isnan(0.0);
    bool _365 = _361 || _363;
    float _367 = _349 + (-1.0);
    float _369 = fma(_295, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_309, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = floor(_325);
    bool _375 = _339 > 0.0;
    float _377 = _113 + _263;
    bool _379 = _339 >= 0.0;
    bool _381 = isnan(_339);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _393 = _377 + (-1.0);
    int _395 = _387 ? 0 : 1;
    float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _399 = log2(_397);
    float _401 = _331 * _351;
    int _403 = _365 ? 0 : 1;
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _407 = ~_403;
    int _409 = _407 + 1;
    int _411 = _409 + 1;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _415 = int(_413);
    bool _417 = _373 > 0.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _421 = 1.0 + _419;
    bool _423 = _373 >= 0.0;
    bool _425 = isnan(_373);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    int _433 = ~_395;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _449 = _447 != 0;
    float _451 = _399 * _117;
    int _453 = _411;
    int _455 = _437;
    if (!_353)
    {
        int _457 = ~_403;
        int _459 = _457 + 1;
        _453 = _459;
    }
    int _461 = _453;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _465 = int(_463);
    if (!_375)
    {
        int _467 = ~_395;
        int _469 = _467 + 1;
        _455 = _469;
    }
    int _471 = _455;
    bool _473 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _475 = isnan(0.0);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _481 = _477 || _479;
    bool _483 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _485 = isnan(1.0);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _491 = _487 || _489;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _495 = !_445;
    int _497 = _495 ? 0 : 1;
    float _499 = exp2(_451);
    bool _501 = !_441;
    int _503 = _501 ? 0 : 1;
    float _505 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].w, _493);
    bool _507 = !_449;
    int _509 = _507 ? 0 : 1;
    float _511 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _333);
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = float(_415);
    float _527 = 1.0 / _421;
    float _529 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _319);
    bool _531 = !_519;
    int _533 = _531 ? 0 : 1;
    float _535 = in.m_57.x;
    float _537 = in.m_57.y;
    float _539 = in.m_57.z;
    bool _541 = !_523;
    int _543 = _541 ? 0 : 1;
    float _545 = float(_461);
    float _547 = 1.0 / _525;
    int _549 = abs(_543);
    float _551 = -_499;
    float _553 = _551 + 1.0;
    float _555 = float(_465);
    float _557 = float(_471);
    float _559 = _481 ? _553 : 0.0;
    float _561 = _555 * _117;
    float _563 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _505);
    int _565 = abs(_533);
    bool _567 = !_515;
    int _569 = _567 ? 0 : 1;
    float _571 = _547 * _117;
    float _573 = float(_565);
    if (_491)
    {
        float _575 = _559 * _527;
        _137 = _575;
    }
    float _577 = _137;
    int _579 = _431 ? 0 : 1;
    float _581 = float(_549);
    float _583 = _573 * _545;
    int _585 = ~_579;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    int _591 = abs(_569);
    float _593 = _583 * (-2.0);
    int _595 = _589;
    if (!_417)
    {
        int _597 = ~_579;
        int _599 = _597 + 1;
        _595 = _599;
    }
    int _601 = _595;
    float _603 = _581 * _557;
    float _605 = _259 + (-0.5);
    float _607 = fma(_593, _537, _537);
    bool _609 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _611 = isnan(_257);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_391, _593, _391);
    float _623 = float(_591);
    float _625 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[196].y, _607);
    float _627 = float(_601);
    float _629 = -_619;
    float _631 = _629 + 1.0;
    bool _633 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _635 = isnan(_257);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = fma(_621, _577, _625);
    bool _647 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _649 = isnan(_257);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _623 * _627;
    bool _661 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_257);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = _643 * _631;
    float _675 = -_643;
    float _677 = _675 + 1.0;
    float _679 = _659 * (-2.0);
    float _681 = _113 + (-0.5);
    float _683 = _645 * 0.15915493667125701904296875;
    float _685 = _671 * _677;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = fma(_679, _535, _535);
    float _693 = fma(_389, _679, _389);
    float _695 = as_type<float>(int(gl_VertexIndex));
    float _697 = _657 * _689;
    float _699 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[196].x, _691);
    float _701 = _603 * (-2.0);
    float _703 = _335 * _697;
    float _705 = _337 * _697;
    float _707 = fma(_693, _577, _699);
    float _709 = -_657;
    float _711 = _709 + 1.0;
    float _713 = in.m_62.x;
    float _715 = in.m_62.y;
    float _717 = fma(_405, _701, _405);
    float _719 = fma(_701, _539, _539);
    float _721 = _263 + (-0.5);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _723;
    float _727 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].y, _705);
    float _729 = _707 * 0.15915493667125701904296875;
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].z, _719);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _733;
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].x, _703);
    float _739 = fma(_725, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _741 = fma(_371, _685, _727);
    float _743 = fma(_717, _577, _731);
    float _745 = fma(_735, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _747 = fma(_369, _685, _737);
    float _749 = fma(_739, _673, _741);
    float _751 = _683 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = _743 * 0.15915493667125701904296875;
    float _757 = fma(_745, _673, _747);
    float _759 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[146].y, _749);
    int _761 = as_type<int>(_695) & 1;
    bool _763 = _761 != 0;
    int _765 = as_type<int>(_695) & 2;
    bool _767 = _765 != 0;
    float _769 = in.m_42.y;
    float _771 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[146].x, _757);
    float _773 = _759 * _715;
    float _775 = _683 * 6.283185482025146484375;
    float _777 = cos(_775);
    bool _779 = !_763;
    float _781 = _779 ? (-0.5) : 0.5;
    float _783 = _771 * _713;
    bool _785 = !_767;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _239 * _773;
    bool _791 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _793 = isnan(0.5);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _799 = _795 || _797;
    float _801 = _239 * _783;
    float _803 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _781);
    float _805 = _729 * 6.283185482025146484375;
    float _807 = sin(_805);
    float _809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _811 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _813 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _823 = _819 || _821;
    float _825 = _811 * _809;
    float _827 = _813 * _803;
    float _829 = _729 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = in.m_42.z;
    float _835 = _755 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _807 * _777;
    float _841 = _755 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = _831 * _753;
    float _847 = -_845;
    float _849 = fma(_837, _839, _847);
    float _851 = -_839;
    float _853 = fma(_837, _845, _851);
    float _855 = _807 * _753;
    float _857 = _831 * _777;
    float _859 = _843 * _825;
    float _861 = _753 * _843;
    float _863 = _777 * _843;
    float _865 = fma(_837, _857, _855);
    float _867 = -_825;
    float _869 = _837 * _867;
    float _871 = fma(_837, _855, _857);
    float _873 = _831 * _859;
    float _875 = _807 * _859;
    float _877 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _879 = fma(_863, _827, _869);
    float _881 = fma(_865, _827, _873);
    float _883 = fma(_849, _827, _875);
    float _885 = _769 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _887 = fma(_861, _877, _879);
    float _889 = fma(_853, _877, _881);
    float _891 = fma(_871, _877, _883);
    float _893 = _769 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _895 = _769 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _897 = _889 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _889 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _893);
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _905 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _885);
    float _907 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[6].z, _901);
    float _909 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].z, _903);
    float _913 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[4].z, _905);
    float _915 = _907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].z, _909);
    float _919 = _911 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _921 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _895);
    float _923 = _913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _927 = _915 + _919;
    float _929 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[5].z, _921);
    float _931 = _923 + _925;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _935 = _927 + _933;
    float _937 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _941 = _931 + _939;
    float _943 = _935 * _935;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _947 = fma(_941, _941, _943);
    float _949 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].x, _945);
    float _951 = _937 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _953 = sqrt(_947);
    float _955 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _957 = _955 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _959 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].x, _951);
    float _961 = _889 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = 1.0 / _957;
    float _965 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[10].z, _959);
    float _967 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _969 = _965 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _971 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].z, _967);
    bool _973 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _969 + _957;
    float _977 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _979 = _937 + _977;
    float _981 = _975 * _963;
    float _983 = _981 * 0.5;
    float _985 = _971;
    float _987 = _931;
    float _989 = _977;
    float _991 = _961;
    float _993 = _953;
    float _995 = _935;
    float _997 = _729;
    if (!_973)
    {
        _985 = _931;
    }
    float _999 = _985;
    float _1001 = _999;
    if (!_973)
    {
        _987 = _927;
    }
    float _1003 = _987;
    float _1005 = _1003;
    if (!_973)
    {
        _989 = _979;
    }
    float _1007 = _989;
    bool _1009 = !_973;
    float _1011 = _1007;
    if (!_1009)
    {
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1017 = _953 + _1015;
        float _1019 = _979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = rsqrt(_947);
        float _1023 = _1017 * _1013;
        float _1025 = _1023 * 0.15915493667125701904296875;
        float _1027 = _1025 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        float _1031 = _1025 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        float _1035 = fma(_1029, _1019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1037 = _1021 * _1035;
        float _1039 = _1033 + (-1.0);
        float _1041 = fma(_941, _1037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1043 = fma(_935, _1037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1045 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = fma(_979, _1033, _1045);
        _1005 = _1043;
        _991 = _1035;
        _1011 = _1047;
        _1001 = _1041;
        _993 = _1045;
    }
    float _1049 = _1005;
    float _1051 = _991;
    float _1053 = _1011;
    float _1055 = _1001;
    float _1057 = _993;
    float _1059 = _1057;
    float _1061 = _1053;
    float _1063 = _1055;
    float _1065 = _1051;
    if (_823)
    {
        _1059 = 1.0;
    }
    float _1067 = _1059;
    float _1069 = _1067;
    if (_799)
    {
        _995 = _1049;
    }
    float _1071 = _995;
    float _1073 = _1071;
    if (!_799)
    {
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1077 = _937 + _1075;
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1081 = _923 + _1079;
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1085 = -_937;
        float _1087 = _1085 + _1053;
        float _1089 = _1077 * _1077;
        float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1093 = _915 + _1091;
        float _1095 = -_915;
        float _1097 = _1095 + _1049;
        float _1099 = fma(_1081, _1081, _1089);
        float _1101 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1103 = fma(_1093, _1093, _1099);
        float _1105 = sqrt(_1103);
        float _1107 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1109 = precise::min(_1105, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1111 = _1109 * _1101;
        float _1113 = -_923;
        float _1115 = _1113 + _1055;
        float _1117 = _1107 * _1111;
        float _1119 = fma(_1115, _1117, _923);
        float _1121 = fma(_1087, _1117, _937);
        float _1123 = fma(_1097, _1117, _915);
        _1061 = _1121;
        _1063 = _1119;
        _1073 = _1123;
        _1065 = _1083;
    }
    float _1125 = _1061;
    float _1127 = _1063;
    float _1129 = _1073;
    float _1131 = _1065;
    float _1133 = _1131;
    if (!_823)
    {
        float _1135 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1137 = _1135 * 0.15915493667125701904296875;
        float _1139 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1143 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
        float _1145 = _1137 * 6.283185482025146484375;
        float _1147 = cos(_1145);
        float _1149 = _1139 * 0.15915493667125701904296875;
        float _1151 = _1137 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = 1.0 / _1147;
        float _1157 = _1149 * 6.283185482025146484375;
        float _1159 = cos(_1157);
        float _1161 = _1153 * _1155;
        float _1163 = _1149 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = _1159 * _1161;
        float _1169 = 1.0 / _1143;
        float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1173 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1171;
        float _1175 = 1.0 / _1167;
        float _1177 = 1.0 / _1173;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1181 = _1169 * _1179;
        float _1183 = _1165 * _1175;
        float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1187 = fma(_1183, _1181, _1185);
        float _1189 = _1187 * _1177;
        float _1191 = precise::clamp(_1189, 0.0, 1.0);
        float _1193 = -_1191;
        float _1195 = _1193 + 1.0;
        _1133 = _1177;
        _1069 = _1195;
    }
    float _1197 = _1133;
    float _1199 = _1069;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1125 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1127 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1129 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = sqrt(_1217);
    float _1223 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1225 = _1207 * _1223;
    float _1227 = _1211 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 * _1227;
    float _1233 = _1229 + _1231;
    float _1235 = sqrt(_1233);
    bool _1237 = _1235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1241 = _1235 + _1239;
    float _1243 = _1215;
    float _1245 = _1241;
    float _1247 = _1197;
    float _1249 = _1203;
    float _1251 = _1223;
    if (_1237)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1253;
    }
    float _1255 = _1243;
    float _1257 = _1255;
    if (_1237)
    {
        float _1259 = _1241 * _1255;
        _1245 = _1259;
    }
    float _1261 = _1245;
    if (_1237)
    {
        float _1263 = rsqrt(_1233);
        _1257 = _1263;
    }
    float _1265 = _1257;
    float _1267 = _1265;
    if (_1237)
    {
        float _1269 = _1261 * 0.15915493667125701904296875;
        _1247 = _1269;
    }
    float _1271 = _1247;
    float _1273 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1275 = _1219;
    float _1277 = _1271;
    if (_1237)
    {
        float _1279 = _1271 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        _1275 = _1281;
    }
    float _1283 = _1275;
    float _1285 = precise::max(0.0, _1273);
    float _1287 = _1211;
    float _1289 = _1285;
    if (_1237)
    {
        float _1291 = _1271 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        _1287 = _1293;
    }
    float _1295 = _1287;
    float _1297 = -_1223;
    float _1299 = -_1285;
    float _1301 = fma(_1203, _1297, _1299);
    if (_1237)
    {
        float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1249 = _1303;
    }
    float _1305 = _1249;
    float _1307 = _1283;
    float _1309 = _1305;
    if (_1237)
    {
        float _1311 = fma(_1283, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = _1313;
    if (!_1237)
    {
        _1309 = _1227;
    }
    float _1317 = _1309;
    float _1319 = _1317;
    if (!_1237)
    {
        _1277 = _1229;
    }
    float _1321 = _1277;
    float _1323 = _1321;
    if (_1237)
    {
        float _1325 = _1265 * _1313;
        _997 = _1325;
    }
    float _1327 = _997;
    if (!_1237)
    {
        _1267 = _1225;
    }
    float _1329 = _1267;
    float _1331 = _1329;
    if (_1237)
    {
        float _1333 = _1295 + (-1.0);
        _1289 = _1333;
    }
    float _1335 = _1289;
    float _1337 = _1335;
    if (_1237)
    {
        float _1339 = _1225 * _1327;
        _1331 = _1339;
    }
    float _1341 = _1331;
    if (!_1237)
    {
        _1315 = _1301;
    }
    float _1343 = _1315;
    float _1345 = _1343;
    if (_1237)
    {
        float _1347 = _1227 * _1327;
        _1319 = _1347;
    }
    float _1349 = _1319;
    if (_1237)
    {
        float _1351 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1251 = _1351;
    }
    float _1353 = _1251;
    if (_1237)
    {
        float _1355 = _1341 * _1341;
        _1323 = _1355;
    }
    float _1357 = _1323;
    if (!_1237)
    {
        _1337 = _1231;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (_1237)
    {
        float _1363 = _1349 * _1349;
        _1361 = _1363;
    }
    float _1365 = _1361;
    if (_1237)
    {
        float _1367 = fma(_1301, _1295, _1353);
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1373 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1375 = fma(_1369, _1369, _1357);
    float _1377 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1381 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1379);
    float _1383 = precise::clamp(_1381, 0.0, 1.0);
    float _1385 = _1375 + _1365;
    float _1387 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1377);
    float _1389 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1391 = -_1383;
    float _1393 = _1391 + 1.0;
    float _1395 = rsqrt(_1385);
    float _1397 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1387);
    float _1399 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1389);
    float _1401 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1403 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1373);
    float _1405 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1407 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1409 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1401);
    float _1411 = abs(_1393);
    float _1413 = log2(_1411);
    float _1415 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1417 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1403);
    float _1419 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1421 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1409);
    float _1423 = -_1415;
    float _1425 = fma(_1423, _1371, 1.0);
    float _1427 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1431 = _1395 * _1341;
    float _1433 = _1395 * _1369;
    float _1435 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1437 = _1395 * _1349;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1441 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1429);
    float _1443 = log2(_1425);
    float _1445 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = -_1439;
    float _1449 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1447);
    float _1451 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1453 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1441);
    float _1455 = -_1437;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1449);
    float _1459 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1461 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1453);
    float _1463 = exp2(_1451);
    float _1465 = fma(_1457, -0.5, 0.5);
    float _1467 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1459);
    float _1469 = fma(_1457, 0.5, 0.5);
    float _1471 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1473 = _1433 + 1.0;
    float _1475 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1467);
    float _1477 = fma(_1469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1479 = 1.0 / _1461;
    float _1481 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1471);
    float _1483 = _1443 * 0.693147182464599609375;
    float _1485 = fma(_1469, _1477, -0.212114393711090087890625);
    float _1487 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1489 = fma(_1469, _1485, 1.570728778839111328125);
    float _1491 = sqrt(_1465);
    float _1493 = -_1433;
    float _1495 = fma(_1463, _1473, _1493);
    float _1497 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1475);
    float _1499 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1481);
    float _1501 = fma(_1495, 0.5, 0.5);
    float _1503 = _1497 * _1479;
    float _1505 = _1499 * _1479;
    float _1507 = fma(_1503, 0.5, 0.5);
    float _1509 = fma(_1505, -0.5, 0.5);
    float _1511 = _1491 * 0.636619746685028076171875;
    float _1513 = -_1489;
    float _1515 = fma(_1511, _1513, 1.0);
    float3 _4519 = float3(_1507, _1509, _1487);
    float _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4519, float3(0.0), isnan(_4519)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4519, float3(0.0), isnan(_4519)), level(0.0)).x;
    float3 _4530 = float3(_1507, _1509, _1487);
    float4 _1520 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4530, float3(0.0), isnan(_4530)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4530, float3(0.0), isnan(_4530)), level(0.0)).xyzw;
    float _1522 = _1520.x;
    float _1524 = _1520.y;
    float _1526 = _1520.z;
    float _1528 = _1520.w;
    float2 _4547 = float2(_1515, _1501);
    float3 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4547, float2(0.0), isnan(_4547)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4547, float2(0.0), isnan(_4547)), level(0.0)).xyz;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = float(uint(_465));
    float _1542 = trunc(_571);
    int _1544 = int(_1542);
    int _1546 = ~_465;
    int _1548 = _1546 + 1;
    float _1550 = _561 * _135;
    int _1552 = _465 + (-1);
    float _1554 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1556 = abs(_497);
    float _1558 = -_511;
    float _1560 = _1558 + 1.0;
    int _1562 = abs(_509);
    float _1564 = 1.0 / _1540;
    float _1566 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1554);
    float _1568 = -_563;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1566);
    float _1574 = float(uint(_1544));
    float _1576 = trunc(_1550);
    int _1578 = int(_1576);
    float _1580 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1572);
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>(_1564) + (-2);
    float _1588 = as_type<float>(_1586) * _1574;
    bool _1590 = !_1584;
    float _1592 = _1590 ? 7.345489978790283203125 : 1.0;
    float _1594 = trunc(_1588);
    float _1596 = precise::max(_1594, 0.0);
    uint _1599 = uint(_1596);
    float _1601 = _1592 * _113;
    int _1603 = _1548 * int(_1599);
    int _1605 = _1603 + _1544;
    float _1607 = float(_1544);
    float _1609 = float(uint(_1605));
    bool _1611 = _1607 >= _555;
    bool _1613 = isnan(_1607);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(_555);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = as_type<float>(_1586) * _1609;
    float _1625 = trunc(_1621);
    int _1627 = int(_1625);
    float _1629 = trunc(_1623);
    float _1631 = precise::max(_1629, 0.0);
    uint _1633 = uint(_1631);
    int _1635 = int(_1599) + int(_1633);
    float _1637 = floor(_1601);
    int _1639 = _1548 * _1635;
    int _1641 = _1639 + _1544;
    bool _1643 = uint(_1641) >= uint(_465);
    bool _1645 = !_1643;
    int _1647 = _1645 ? 0 : (-1);
    bool _1649 = _465 == 0;
    float _1651 = -_1637;
    float _1653 = _1601 + _1651;
    int _1655 = ~_1635;
    int _1657 = _1655 + _1647;
    int _1659 = _1657 + 1;
    float _1661 = _1653 * _555;
    int _1663 = _465 * _1659;
    int _1665 = _1663 + _1544;
    int _1667 = ~_1627;
    int _1669 = _1667 + 1;
    int _1671 = _1669 + 1;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1675 = _1673 != 0;
    float _1677 = trunc(_1661);
    int _1679 = int(_1677);
    bool _1681 = !_1649;
    int _1683 = _1681 ? _1665 : (-1);
    bool _1685 = !_1675;
    int _1687 = _1685 ? 0 : 1;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1691 = _1689 != 0;
    int _1693 = _1683 * _1671;
    int _1695 = abs(_503);
    int _1697 = _1627 * _1552;
    int _1699 = _1697 + _1693;
    int _1701 = abs(_1687);
    int _1703 = _1699 * _1556;
    bool _1705 = !_1691;
    int _1707 = _1705 ? 0 : 1;
    int _1709 = _1679 * _1701;
    int _1711 = _1709 + _1544;
    int _1713 = _1578 * _1695;
    int _1715 = _1713 + _1703;
    int _1717 = abs(_1707);
    int _1719 = ~_465;
    int _1721 = _1719 + 1;
    int _1723 = _1711 * _1562;
    int _1725 = _1723 + _1715;
    int _1727 = ~_465;
    int _1729 = _1727 + 1;
    int _1731 = ~_465;
    int _1733 = _1731 + 1;
    int _1735 = _1679 * _1717;
    int _1737 = _1735 + _1725;
    float _1739 = float(uint(_1737));
    float _1741 = as_type<float>(_1586) * _1739;
    float _1743 = trunc(_1741);
    float _1745 = precise::max(_1743, 0.0);
    uint _1747 = uint(_1745);
    int _1749 = _1721 * int(_1747);
    int _1751 = _1749 + _1737;
    float _1753 = float(uint(_1751));
    float _1755 = as_type<float>(_1586) * _1753;
    float _1757 = trunc(_1755);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    int _1763 = ~_465;
    int _1765 = _1763 + 1;
    int _1767 = int(_1747) + int(_1761);
    float _1769 = float(uint(_1711));
    int _1771 = _1729 * _1767;
    int _1773 = _1771 + _1737;
    bool _1775 = uint(_1773) >= uint(_465);
    bool _1777 = !_1775;
    int _1779 = _1777 ? 0 : (-1);
    int _1781 = ~_1767;
    int _1783 = _1781 + _1779;
    int _1785 = _1783 + 1;
    float _1787 = as_type<float>(_1586) * _1769;
    int _1789 = _465 * _1785;
    int _1791 = _1789 + _1737;
    float _1793 = trunc(_1787);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    bool _1799 = !_1649;
    int _1801 = _1799 ? _1791 : (-1);
    int _1803 = _1801 >> 31;
    int _1805 = _1801 & 3;
    bool _1807 = _1805 != 0;
    int _1809 = _1803 & 3;
    bool _1811 = uint(_1805) > 1u;
    int _1813 = _1801 + _1809;
    int _1815 = _1765 * int(_1797);
    int _1817 = _1815 + _1711;
    int _1819 = _1801 & 3;
    bool _1821 = _1819 != 0;
    int _1823 = _1813 >> 2;
    float _1825 = float(uint(_1817));
    int _1827 = _1823 << 4;
    int _1829 = _1827 + 368;
    int _1831 = _1821 ? 0 : 1;
    float _1833 = as_type<float>(_1586) * _1825;
    uint _1835 = uint(int(uint(_1829) >> uint(2)));
    uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
    int _1839 = int(_1835) & 3;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[int(_1837)][_1839];
    int _1843 = int(_1835) + 1;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    int _1847 = _1843 & 3;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[int(_1845)][_1847];
    float _1851 = trunc(_1833);
    float _1853 = precise::max(_1851, 0.0);
    uint _1855 = uint(_1853);
    int _1857 = _1829 + 8;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[int(_1869)][_1871];
    int _1875 = int(_1797) + int(_1855);
    int _1877 = ~_1831;
    int _1879 = _1877 + 1;
    int _1881 = _1879 + 1;
    int _1883 = _1881;
    if (!_1811)
    {
        int _1885 = ~_1831;
        int _1887 = _1885 + 1;
        _1883 = _1887;
    }
    int _1889 = _1883;
    int _1891 = _1733 * _1875;
    int _1893 = _1891 + _1711;
    bool _1895 = !_1807;
    int _1897 = _1895 ? 0 : 1;
    bool _1899 = _1805 != 3;
    int _1901 = abs(_1889);
    bool _1903 = uint(_1805) >= 2u;
    int _1905 = abs(_1897);
    int _1907 = ~_1901;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    float _1913 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1915 = int(_1913);
    bool _1917 = uint(_1893) >= uint(_465);
    int _1919 = _1903 ? 0 : 1;
    int _1921 = ~_1905;
    int _1923 = _1921 + 1;
    int _1925 = _1923 + 1;
    int _1927 = ~_1919;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    bool _1933 = _1805 != 3;
    int _1935 = _1931;
    if (_1899)
    {
        int _1937 = ~_1919;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = _1911 * as_type<int>(_1849);
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1947 = _1945 != 0;
    int _1949 = abs(_1941);
    int _1951 = _1925 * as_type<int>(_1841);
    int _1953 = _1951 + _1943;
    bool _1955 = !_1933;
    int _1957 = _1955 ? 0 : (-1);
    bool _1959 = !_1917;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = abs(_1957);
    bool _1965 = !_1947;
    int _1967 = _1965 ? 0 : 1;
    float _1969 = float(uint(_1915));
    int _1971 = abs(_1915);
    int _1973 = ~_1949;
    int _1975 = _1973 + 1;
    int _1977 = _1975 + 1;
    int _1979 = ~_1875;
    int _1981 = _1979 + _1961;
    int _1983 = _1981 + 1;
    float _1985 = 1.0 / _1969;
    int _1987 = abs(_1967);
    int _1989 = _1977 * as_type<int>(_1865);
    int _1991 = _1989 + _1953;
    int _1993 = _465 * _1983;
    int _1995 = _1993 + _1711;
    int _1997 = ~_1963;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    float _2003 = float(uint(_1971));
    int _2005 = ~_1987;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    int _2011 = _2001 * as_type<int>(_1873);
    int _2013 = _2011 + _1991;
    bool _2015 = !_1649;
    int _2017 = _2015 ? _1995 : (-1);
    float _2019 = 1.0 / _2003;
    int _2021 = _2013 * _2009;
    int _2023 = ~_1915;
    int _2025 = _2023 + 1;
    int _2027 = as_type<int>(_1985) + (-2);
    int _2029 = _2017 * _1987;
    int _2031 = _2029 + _2021;
    int _2033 = ~_1915;
    int _2035 = _2033 + 1;
    bool _2037 = _113 > 0.5;
    float _2039 = float(uint(_2031));
    int _2041 = abs(_2031);
    bool _2043 = _1915 == 0;
    float _2045 = as_type<float>(_2027) * _2039;
    int _2047 = as_type<int>(_2019) + (-2);
    float _2049 = float(uint(_2041));
    int _2051 = ~_1971;
    int _2053 = _2051 + 1;
    float _2055 = trunc(_2045);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    bool _2061 = _1915 == 0;
    float _2063 = as_type<float>(_2047) * _2049;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2067 = _2065 != 0;
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2071 = _2069 != 0;
    float _2073 = trunc(_2063);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    int _2079 = _2035 * int(_2059);
    int _2081 = _2079 + _2031;
    float _2083 = float(uint(_2081));
    int _2085 = _2053 * int(_2077);
    int _2087 = _2085 + _2041;
    float _2089 = as_type<float>(_2027) * _2083;
    float _2091 = float(uint(_2087));
    float _2093 = trunc(_2089);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_2047) * _2091;
    float _2101 = trunc(_2099);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    int _2107 = int(_2059) + int(_2097);
    int _2109 = ~_1971;
    int _2111 = _2109 + 1;
    int _2113 = _2025 * _2107;
    int _2115 = _2113 + _2031;
    int _2117 = int(_2077) + int(_2105);
    bool _2119 = uint(_2115) >= uint(_1915);
    int _2121 = _2111 * _2117;
    int _2123 = _2121 + _2041;
    bool _2125 = !_2119;
    int _2127 = _2125 ? 0 : (-1);
    bool _2129 = _259 > 0.5;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2133 = ~_2107;
    int _2135 = _2133 + _2127;
    int _2137 = _2135 + 1;
    float _2139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2141 = uint(_2123) >= uint(_1971);
    int _2143 = _2031 ^ _1915;
    int _2145 = _1915 * _2137;
    int _2147 = _2145 + _2031;
    bool _2149 = !_2141;
    int _2151 = _2149 ? 0 : (-1);
    out.m_64.w = _2131;
    uint _2153 = uint(int(uint(_2143) >> uint(31)));
    float _2155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2157 = ~_2151;
    int _2159 = _2117 + _2157;
    int _2161 = _2159 + 1;
    int _2163 = ~int(_2153);
    int _2165 = _2163 + 1;
    float _2167 = -_781;
    int _2169 = _2037 ? as_type<int>(_2167) : as_type<int>(_781);
    int _2171 = _2161 ^ _2165;
    float _2173 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2175 = !_2043;
    int _2177 = _2175 ? _2147 : (-1);
    int _2179 = ~_2165;
    int _2181 = _2179 + _2171;
    int _2183 = _2181 + 1;
    float _2185 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2187 = float(_2177);
    bool _2189 = !_2067;
    float _2191 = _2189 ? _781 : as_type<float>(_2169);
    float _2193 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2195 = -_787;
    int _2197 = _2129 ? as_type<int>(_2195) : as_type<int>(_787);
    float _2199 = exp2(_2185);
    float _2201 = fma(_2173, _2187, _317);
    bool _2203 = !_2061;
    int _2205 = _2203 ? _2183 : (-1);
    float _2207 = _2191 + 0.5;
    bool _2209 = !_2071;
    float _2211 = _2209 ? _787 : as_type<float>(_2197);
    float _2213 = float(_2205);
    float _2215 = fma(_2173, _2207, _2201);
    bool _2217 = _1199 > 0.0;
    bool _2219 = isnan(_1199);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(0.0);
    bool _2225 = _2221 || _2223;
    float _2227 = -_529;
    float _2229 = fma(_2193, _2213, _2227);
    float _2231 = _2211 + (-0.5);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2235 = -_1560;
    float _2237 = fma(_2191, _2235, _2215);
    float _2239 = _1580 + _1461;
    float _2241 = -_2199;
    float _2243 = _2241 + 1.0;
    float _2245 = -_2193;
    float _2247 = fma(_2245, _2231, _2229);
    out.m_66.w = _2233;
    float _2249 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2251 = fma(_2211, _1570, _2247);
    float _2253 = _2239 * 0.5;
    float _2255 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2257 = _2249 * _1517;
    float _2259 = -_2249;
    float _2261 = _2259 + 1.0;
    out.gl_Position.x = _1497;
    out.gl_Position.y = _1499;
    out.gl_Position.z = _1580;
    out.gl_Position.w = _1461;
    float _2263 = _1528 * _2257;
    float _2265 = _1538 * _2257;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _2237;
    out.m_68.y = _2251;
    float _2269 = fma(_1534, _2263, _1522);
    float _2271 = fma(_1536, _2263, _1524);
    float _2273 = _1528 * _2261;
    float _2275 = fma(_1528, _2265, _1526);
    out.m_70.z = _2253;
    out.m_70.w = _1461;
    out.m_45.x = _2267;
    out.m_72.x = _2269;
    out.m_72.y = _2271;
    out.m_72.z = _2275;
    out.m_72.w = _2273;
    if (_2225)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2277 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2277;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    float _99 = as_type<float>(_91);
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _97;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2333 = as_type<float>(_107);
        out.gl_Position.z = _2333;
    }
    if (!_95)
    {
        return out;
    }
    float _109 = in.m_47.w;
    float _111 = float(_91);
    float _113 = in.m_49.x;
    float _115 = -_109;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_109);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    out.m_51.x = _113;
    bool _129 = _117 >= _111;
    bool _131 = !_127;
    bool _133 = _129 || _131;
    float _135 = 1.0 / _111;
    float _137 = _117;
    if (_133)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _141 = 0;
    if (_133)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    float _147 = _117 * _135;
    float _149 = _147;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2407 = as_type<float>(_145);
        out.gl_Position.z = _2407;
    }
    out.m_53.x = _147;
    if (_133)
    {
        return out;
    }
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = in.m_42.x;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    int _165 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _167 = _165 != 0;
    float _169 = _153 * _151;
    float _171 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _173 = _171 * 6.283185482025146484375;
    float _175 = floor(_171);
    out.m_55.x = _155;
    float _177 = _173 * 0.15915493667125701904296875;
    bool _179 = !_159;
    int _181 = _179 ? 0 : 1;
    int _183 = abs(_181);
    float _185 = _177 * 6.283185482025146484375;
    float _187 = cos(_185);
    bool _189 = !_167;
    int _191 = _189 ? 0 : 1;
    bool _193 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _195 = abs(_191);
    float _197 = -_175;
    float _199 = _171 + _197;
    bool _201 = !_163;
    int _203 = _201 ? 0 : 1;
    float _205 = float(_183);
    int _207 = abs(_203);
    float _209 = -_199;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _213 = fma(_187, 0.5, 0.5);
    float _215 = abs(_211);
    float _217 = _205 * _215;
    bool _219 = _199 < 0.5;
    float _221 = float(_219);
    float _223 = -_213;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_195);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_207);
    float _235 = fma(_227, _225, _217);
    float _237 = abs(_231);
    float _239 = fma(_233, _237, _235);
    bool _241 = !_193;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _113 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _149 = _255;
    }
    float _257 = _149;
    float _259 = in.m_49.y;
    float _261 = _113 * 2.0;
    float _263 = in.m_49.z;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _267 = _113 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _279 = 1.0 / _271;
    float _281 = -_277;
    float _283 = fma(_267, 2.0, _281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = 1.0 / _275;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _257 + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _315 = -_117;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[76].x, _283);
    float _319 = fma(_311, -2.0, _265);
    float _321 = _259 * 2.0;
    float _323 = floor(_261);
    float _325 = _263 * 2.0;
    float _327 = _301 * _279;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = _257 + _329;
    float _333 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[78].z, _313);
    float _335 = fma(_291, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_305, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = floor(_321);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _257 + _341;
    float _345 = _343 * _297;
    float _347 = _113 + _259;
    float _349 = _259 + _263;
    float _351 = 1.0 / _287;
    bool _353 = _323 > 0.0;
    float _355 = _347 + (-1.0);
    bool _357 = _323 >= 0.0;
    bool _359 = isnan(_323);
    bool _361 = _357 || _359;
    bool _363 = isnan(0.0);
    bool _365 = _361 || _363;
    float _367 = _349 + (-1.0);
    float _369 = fma(_295, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_309, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = floor(_325);
    bool _375 = _339 > 0.0;
    float _377 = _113 + _263;
    bool _379 = _339 >= 0.0;
    bool _381 = isnan(_339);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _393 = _377 + (-1.0);
    int _395 = _387 ? 0 : 1;
    float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _399 = log2(_397);
    float _401 = _331 * _351;
    int _403 = _365 ? 0 : 1;
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _407 = ~_403;
    int _409 = _407 + 1;
    int _411 = _409 + 1;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _415 = int(_413);
    bool _417 = _373 > 0.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _421 = 1.0 + _419;
    bool _423 = _373 >= 0.0;
    bool _425 = isnan(_373);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    int _433 = ~_395;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _449 = _447 != 0;
    float _451 = _399 * _117;
    int _453 = _411;
    int _455 = _437;
    if (!_353)
    {
        int _457 = ~_403;
        int _459 = _457 + 1;
        _453 = _459;
    }
    int _461 = _453;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _465 = int(_463);
    if (!_375)
    {
        int _467 = ~_395;
        int _469 = _467 + 1;
        _455 = _469;
    }
    int _471 = _455;
    bool _473 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _475 = isnan(0.0);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _481 = _477 || _479;
    bool _483 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _485 = isnan(1.0);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _491 = _487 || _489;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _495 = !_445;
    int _497 = _495 ? 0 : 1;
    float _499 = exp2(_451);
    bool _501 = !_441;
    int _503 = _501 ? 0 : 1;
    float _505 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].w, _493);
    bool _507 = !_449;
    int _509 = _507 ? 0 : 1;
    float _511 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _333);
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = float(_415);
    float _527 = 1.0 / _421;
    float _529 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _319);
    bool _531 = !_519;
    int _533 = _531 ? 0 : 1;
    float _535 = in.m_57.x;
    float _537 = in.m_57.y;
    float _539 = in.m_57.z;
    bool _541 = !_523;
    int _543 = _541 ? 0 : 1;
    float _545 = float(_461);
    float _547 = 1.0 / _525;
    int _549 = abs(_543);
    float _551 = -_499;
    float _553 = _551 + 1.0;
    float _555 = float(_465);
    float _557 = float(_471);
    float _559 = _481 ? _553 : 0.0;
    float _561 = _555 * _117;
    float _563 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _505);
    int _565 = abs(_533);
    bool _567 = !_515;
    int _569 = _567 ? 0 : 1;
    float _571 = _547 * _117;
    float _573 = float(_565);
    if (_491)
    {
        float _575 = _559 * _527;
        _137 = _575;
    }
    float _577 = _137;
    int _579 = _431 ? 0 : 1;
    float _581 = float(_549);
    float _583 = _573 * _545;
    int _585 = ~_579;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    int _591 = abs(_569);
    float _593 = _583 * (-2.0);
    int _595 = _589;
    if (!_417)
    {
        int _597 = ~_579;
        int _599 = _597 + 1;
        _595 = _599;
    }
    int _601 = _595;
    float _603 = _581 * _557;
    float _605 = _259 + (-0.5);
    float _607 = fma(_593, _537, _537);
    bool _609 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _611 = isnan(_257);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_391, _593, _391);
    float _623 = float(_591);
    float _625 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[196].y, _607);
    float _627 = float(_601);
    float _629 = -_619;
    float _631 = _629 + 1.0;
    bool _633 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _635 = isnan(_257);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = fma(_621, _577, _625);
    bool _647 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _649 = isnan(_257);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _623 * _627;
    bool _661 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_257);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = _643 * _631;
    float _675 = -_643;
    float _677 = _675 + 1.0;
    float _679 = _659 * (-2.0);
    float _681 = _113 + (-0.5);
    float _683 = _645 * 0.15915493667125701904296875;
    float _685 = _671 * _677;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = fma(_679, _535, _535);
    float _693 = fma(_389, _679, _389);
    float _695 = as_type<float>(int(gl_VertexIndex));
    float _697 = _657 * _689;
    float _699 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[196].x, _691);
    float _701 = _603 * (-2.0);
    float _703 = _335 * _697;
    float _705 = _337 * _697;
    float _707 = fma(_693, _577, _699);
    float _709 = -_657;
    float _711 = _709 + 1.0;
    float _713 = in.m_62.x;
    float _715 = in.m_62.y;
    float _717 = fma(_405, _701, _405);
    float _719 = fma(_701, _539, _539);
    float _721 = _263 + (-0.5);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _723;
    float _727 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].y, _705);
    float _729 = _707 * 0.15915493667125701904296875;
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].z, _719);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _733;
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].x, _703);
    float _739 = fma(_725, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _741 = fma(_371, _685, _727);
    float _743 = fma(_717, _577, _731);
    float _745 = fma(_735, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _747 = fma(_369, _685, _737);
    float _749 = fma(_739, _673, _741);
    float _751 = _683 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = _743 * 0.15915493667125701904296875;
    float _757 = fma(_745, _673, _747);
    float _759 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[146].y, _749);
    int _761 = as_type<int>(_695) & 1;
    bool _763 = _761 != 0;
    int _765 = as_type<int>(_695) & 2;
    bool _767 = _765 != 0;
    float _769 = in.m_42.y;
    float _771 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[146].x, _757);
    float _773 = _759 * _715;
    float _775 = _683 * 6.283185482025146484375;
    float _777 = cos(_775);
    bool _779 = !_763;
    float _781 = _779 ? (-0.5) : 0.5;
    float _783 = _771 * _713;
    bool _785 = !_767;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _239 * _773;
    bool _791 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _793 = isnan(0.5);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _799 = _795 || _797;
    float _801 = _239 * _783;
    float _803 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _781);
    float _805 = _729 * 6.283185482025146484375;
    float _807 = sin(_805);
    float _809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _811 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _813 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _823 = _819 || _821;
    float _825 = _811 * _809;
    float _827 = _813 * _803;
    float _829 = _729 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = in.m_42.z;
    float _835 = _755 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _807 * _777;
    float _841 = _755 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = _831 * _753;
    float _847 = -_845;
    float _849 = fma(_837, _839, _847);
    float _851 = -_839;
    float _853 = fma(_837, _845, _851);
    float _855 = _807 * _753;
    float _857 = _831 * _777;
    float _859 = _843 * _825;
    float _861 = _753 * _843;
    float _863 = _777 * _843;
    float _865 = fma(_837, _857, _855);
    float _867 = -_825;
    float _869 = _837 * _867;
    float _871 = fma(_837, _855, _857);
    float _873 = _831 * _859;
    float _875 = _807 * _859;
    float _877 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _879 = fma(_863, _827, _869);
    float _881 = fma(_865, _827, _873);
    float _883 = fma(_849, _827, _875);
    float _885 = _769 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _887 = fma(_861, _877, _879);
    float _889 = fma(_853, _877, _881);
    float _891 = fma(_871, _877, _883);
    float _893 = _769 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _895 = _769 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _897 = _889 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _889 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _893);
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _905 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _885);
    float _907 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[6].z, _901);
    float _909 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].z, _903);
    float _913 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[4].z, _905);
    float _915 = _907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].z, _909);
    float _919 = _911 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _921 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _895);
    float _923 = _913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _927 = _915 + _919;
    float _929 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[5].z, _921);
    float _931 = _923 + _925;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _935 = _927 + _933;
    float _937 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _941 = _931 + _939;
    float _943 = _935 * _935;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _947 = fma(_941, _941, _943);
    float _949 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].x, _945);
    float _951 = _937 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _953 = sqrt(_947);
    float _955 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _957 = _955 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _959 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].x, _951);
    float _961 = _889 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = 1.0 / _957;
    float _965 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[10].z, _959);
    float _967 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _969 = _965 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _971 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].z, _967);
    bool _973 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _969 + _957;
    float _977 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _979 = _937 + _977;
    float _981 = _975 * _963;
    float _983 = _981 * 0.5;
    float _985 = _971;
    float _987 = _931;
    float _989 = _977;
    float _991 = _961;
    float _993 = _953;
    float _995 = _935;
    float _997 = _729;
    if (!_973)
    {
        _985 = _931;
    }
    float _999 = _985;
    float _1001 = _999;
    if (!_973)
    {
        _987 = _927;
    }
    float _1003 = _987;
    float _1005 = _1003;
    if (!_973)
    {
        _989 = _979;
    }
    float _1007 = _989;
    bool _1009 = !_973;
    float _1011 = _1007;
    if (!_1009)
    {
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1017 = _953 + _1015;
        float _1019 = _979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = rsqrt(_947);
        float _1023 = _1017 * _1013;
        float _1025 = _1023 * 0.15915493667125701904296875;
        float _1027 = _1025 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        float _1031 = _1025 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        float _1035 = fma(_1029, _1019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1037 = _1021 * _1035;
        float _1039 = _1033 + (-1.0);
        float _1041 = fma(_941, _1037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1043 = fma(_935, _1037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1045 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = fma(_979, _1033, _1045);
        _1005 = _1043;
        _991 = _1035;
        _1011 = _1047;
        _1001 = _1041;
        _993 = _1045;
    }
    float _1049 = _1005;
    float _1051 = _991;
    float _1053 = _1011;
    float _1055 = _1001;
    float _1057 = _993;
    float _1059 = _1057;
    float _1061 = _1053;
    float _1063 = _1055;
    float _1065 = _1051;
    if (_823)
    {
        _1059 = 1.0;
    }
    float _1067 = _1059;
    float _1069 = _1067;
    if (_799)
    {
        _995 = _1049;
    }
    float _1071 = _995;
    float _1073 = _1071;
    if (!_799)
    {
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1077 = _937 + _1075;
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1081 = _923 + _1079;
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1085 = -_937;
        float _1087 = _1085 + _1053;
        float _1089 = _1077 * _1077;
        float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1093 = _915 + _1091;
        float _1095 = -_915;
        float _1097 = _1095 + _1049;
        float _1099 = fma(_1081, _1081, _1089);
        float _1101 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1103 = fma(_1093, _1093, _1099);
        float _1105 = sqrt(_1103);
        float _1107 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1109 = precise::min(_1105, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1111 = _1109 * _1101;
        float _1113 = -_923;
        float _1115 = _1113 + _1055;
        float _1117 = _1107 * _1111;
        float _1119 = fma(_1115, _1117, _923);
        float _1121 = fma(_1087, _1117, _937);
        float _1123 = fma(_1097, _1117, _915);
        _1061 = _1121;
        _1063 = _1119;
        _1073 = _1123;
        _1065 = _1083;
    }
    float _1125 = _1061;
    float _1127 = _1063;
    float _1129 = _1073;
    float _1131 = _1065;
    float _1133 = _1131;
    if (!_823)
    {
        float _1135 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1137 = _1135 * 0.15915493667125701904296875;
        float _1139 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1143 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
        float _1145 = _1137 * 6.283185482025146484375;
        float _1147 = cos(_1145);
        float _1149 = _1139 * 0.15915493667125701904296875;
        float _1151 = _1137 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = 1.0 / _1147;
        float _1157 = _1149 * 6.283185482025146484375;
        float _1159 = cos(_1157);
        float _1161 = _1153 * _1155;
        float _1163 = _1149 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = _1159 * _1161;
        float _1169 = 1.0 / _1143;
        float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1173 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1171;
        float _1175 = 1.0 / _1167;
        float _1177 = 1.0 / _1173;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1181 = _1169 * _1179;
        float _1183 = _1165 * _1175;
        float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1187 = fma(_1183, _1181, _1185);
        float _1189 = _1187 * _1177;
        float _1191 = precise::clamp(_1189, 0.0, 1.0);
        float _1193 = -_1191;
        float _1195 = _1193 + 1.0;
        _1133 = _1177;
        _1069 = _1195;
    }
    float _1197 = _1133;
    float _1199 = _1069;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1125 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1127 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1129 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = sqrt(_1217);
    float _1223 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1225 = _1207 * _1223;
    float _1227 = _1211 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 * _1227;
    float _1233 = _1229 + _1231;
    float _1235 = sqrt(_1233);
    bool _1237 = _1235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1241 = _1235 + _1239;
    float _1243 = _1215;
    float _1245 = _1241;
    float _1247 = _1197;
    float _1249 = _1203;
    float _1251 = _1223;
    if (_1237)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1253;
    }
    float _1255 = _1243;
    float _1257 = _1255;
    if (_1237)
    {
        float _1259 = _1241 * _1255;
        _1245 = _1259;
    }
    float _1261 = _1245;
    if (_1237)
    {
        float _1263 = rsqrt(_1233);
        _1257 = _1263;
    }
    float _1265 = _1257;
    float _1267 = _1265;
    if (_1237)
    {
        float _1269 = _1261 * 0.15915493667125701904296875;
        _1247 = _1269;
    }
    float _1271 = _1247;
    float _1273 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1275 = _1219;
    float _1277 = _1271;
    if (_1237)
    {
        float _1279 = _1271 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        _1275 = _1281;
    }
    float _1283 = _1275;
    float _1285 = precise::max(0.0, _1273);
    float _1287 = _1211;
    float _1289 = _1285;
    if (_1237)
    {
        float _1291 = _1271 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        _1287 = _1293;
    }
    float _1295 = _1287;
    float _1297 = -_1223;
    float _1299 = -_1285;
    float _1301 = fma(_1203, _1297, _1299);
    if (_1237)
    {
        float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1249 = _1303;
    }
    float _1305 = _1249;
    float _1307 = _1283;
    float _1309 = _1305;
    if (_1237)
    {
        float _1311 = fma(_1283, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = _1313;
    if (!_1237)
    {
        _1309 = _1227;
    }
    float _1317 = _1309;
    float _1319 = _1317;
    if (!_1237)
    {
        _1277 = _1229;
    }
    float _1321 = _1277;
    float _1323 = _1321;
    if (_1237)
    {
        float _1325 = _1265 * _1313;
        _997 = _1325;
    }
    float _1327 = _997;
    if (!_1237)
    {
        _1267 = _1225;
    }
    float _1329 = _1267;
    float _1331 = _1329;
    if (_1237)
    {
        float _1333 = _1295 + (-1.0);
        _1289 = _1333;
    }
    float _1335 = _1289;
    float _1337 = _1335;
    if (_1237)
    {
        float _1339 = _1225 * _1327;
        _1331 = _1339;
    }
    float _1341 = _1331;
    if (!_1237)
    {
        _1315 = _1301;
    }
    float _1343 = _1315;
    float _1345 = _1343;
    if (_1237)
    {
        float _1347 = _1227 * _1327;
        _1319 = _1347;
    }
    float _1349 = _1319;
    if (_1237)
    {
        float _1351 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1251 = _1351;
    }
    float _1353 = _1251;
    if (_1237)
    {
        float _1355 = _1341 * _1341;
        _1323 = _1355;
    }
    float _1357 = _1323;
    if (!_1237)
    {
        _1337 = _1231;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (_1237)
    {
        float _1363 = _1349 * _1349;
        _1361 = _1363;
    }
    float _1365 = _1361;
    if (_1237)
    {
        float _1367 = fma(_1301, _1295, _1353);
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1373 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1375 = fma(_1369, _1369, _1357);
    float _1377 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1381 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1379);
    float _1383 = precise::clamp(_1381, 0.0, 1.0);
    float _1385 = _1375 + _1365;
    float _1387 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1377);
    float _1389 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1391 = -_1383;
    float _1393 = _1391 + 1.0;
    float _1395 = rsqrt(_1385);
    float _1397 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1387);
    float _1399 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1389);
    float _1401 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1403 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1373);
    float _1405 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1407 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1409 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1401);
    float _1411 = abs(_1393);
    float _1413 = log2(_1411);
    float _1415 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1417 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1403);
    float _1419 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1421 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1409);
    float _1423 = -_1415;
    float _1425 = fma(_1423, _1371, 1.0);
    float _1427 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1431 = _1395 * _1341;
    float _1433 = _1395 * _1369;
    float _1435 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1437 = _1395 * _1349;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1441 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1429);
    float _1443 = log2(_1425);
    float _1445 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = -_1439;
    float _1449 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1447);
    float _1451 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1453 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1441);
    float _1455 = -_1437;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1449);
    float _1459 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1461 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1453);
    float _1463 = exp2(_1451);
    float _1465 = fma(_1457, -0.5, 0.5);
    float _1467 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1459);
    float _1469 = fma(_1457, 0.5, 0.5);
    float _1471 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1473 = _1433 + 1.0;
    float _1475 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1467);
    float _1477 = fma(_1469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1479 = 1.0 / _1461;
    float _1481 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1471);
    float _1483 = _1443 * 0.693147182464599609375;
    float _1485 = fma(_1469, _1477, -0.212114393711090087890625);
    float _1487 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1489 = fma(_1469, _1485, 1.570728778839111328125);
    float _1491 = sqrt(_1465);
    float _1493 = -_1433;
    float _1495 = fma(_1463, _1473, _1493);
    float _1497 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1475);
    float _1499 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1481);
    float _1501 = fma(_1495, 0.5, 0.5);
    float _1503 = _1497 * _1479;
    float _1505 = _1499 * _1479;
    float _1507 = fma(_1503, 0.5, 0.5);
    float _1509 = fma(_1505, -0.5, 0.5);
    float _1511 = _1491 * 0.636619746685028076171875;
    float _1513 = -_1489;
    float _1515 = fma(_1511, _1513, 1.0);
    float3 _4519 = float3(_1507, _1509, _1487);
    float _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4519, float3(0.0), isnan(_4519)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4519, float3(0.0), isnan(_4519)), level(0.0)).x;
    float3 _4530 = float3(_1507, _1509, _1487);
    float4 _1520 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4530, float3(0.0), isnan(_4530)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4530, float3(0.0), isnan(_4530)), level(0.0)).xyzw;
    float _1522 = _1520.x;
    float _1524 = _1520.y;
    float _1526 = _1520.z;
    float _1528 = _1520.w;
    float2 _4547 = float2(_1515, _1501);
    float3 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4547, float2(0.0), isnan(_4547)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4547, float2(0.0), isnan(_4547)), level(0.0)).xyz;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = float(uint(_465));
    float _1542 = trunc(_571);
    int _1544 = int(_1542);
    int _1546 = ~_465;
    int _1548 = _1546 + 1;
    float _1550 = _561 * _135;
    int _1552 = _465 + (-1);
    float _1554 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1556 = abs(_497);
    float _1558 = -_511;
    float _1560 = _1558 + 1.0;
    int _1562 = abs(_509);
    float _1564 = 1.0 / _1540;
    float _1566 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1554);
    float _1568 = -_563;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1566);
    float _1574 = float(uint(_1544));
    float _1576 = trunc(_1550);
    int _1578 = int(_1576);
    float _1580 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1572);
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>(_1564) + (-2);
    float _1588 = as_type<float>(_1586) * _1574;
    bool _1590 = !_1584;
    float _1592 = _1590 ? 7.345489978790283203125 : 1.0;
    float _1594 = trunc(_1588);
    float _1596 = precise::max(_1594, 0.0);
    uint _1599 = uint(_1596);
    float _1601 = _1592 * _113;
    int _1603 = _1548 * int(_1599);
    int _1605 = _1603 + _1544;
    float _1607 = float(_1544);
    float _1609 = float(uint(_1605));
    bool _1611 = _1607 >= _555;
    bool _1613 = isnan(_1607);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(_555);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = as_type<float>(_1586) * _1609;
    float _1625 = trunc(_1621);
    int _1627 = int(_1625);
    float _1629 = trunc(_1623);
    float _1631 = precise::max(_1629, 0.0);
    uint _1633 = uint(_1631);
    int _1635 = int(_1599) + int(_1633);
    float _1637 = floor(_1601);
    int _1639 = _1548 * _1635;
    int _1641 = _1639 + _1544;
    bool _1643 = uint(_1641) >= uint(_465);
    bool _1645 = !_1643;
    int _1647 = _1645 ? 0 : (-1);
    bool _1649 = _465 == 0;
    float _1651 = -_1637;
    float _1653 = _1601 + _1651;
    int _1655 = ~_1635;
    int _1657 = _1655 + _1647;
    int _1659 = _1657 + 1;
    float _1661 = _1653 * _555;
    int _1663 = _465 * _1659;
    int _1665 = _1663 + _1544;
    int _1667 = ~_1627;
    int _1669 = _1667 + 1;
    int _1671 = _1669 + 1;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1675 = _1673 != 0;
    float _1677 = trunc(_1661);
    int _1679 = int(_1677);
    bool _1681 = !_1649;
    int _1683 = _1681 ? _1665 : (-1);
    bool _1685 = !_1675;
    int _1687 = _1685 ? 0 : 1;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1691 = _1689 != 0;
    int _1693 = _1683 * _1671;
    int _1695 = abs(_503);
    int _1697 = _1627 * _1552;
    int _1699 = _1697 + _1693;
    int _1701 = abs(_1687);
    int _1703 = _1699 * _1556;
    bool _1705 = !_1691;
    int _1707 = _1705 ? 0 : 1;
    int _1709 = _1679 * _1701;
    int _1711 = _1709 + _1544;
    int _1713 = _1578 * _1695;
    int _1715 = _1713 + _1703;
    int _1717 = abs(_1707);
    int _1719 = ~_465;
    int _1721 = _1719 + 1;
    int _1723 = _1711 * _1562;
    int _1725 = _1723 + _1715;
    int _1727 = ~_465;
    int _1729 = _1727 + 1;
    int _1731 = ~_465;
    int _1733 = _1731 + 1;
    int _1735 = _1679 * _1717;
    int _1737 = _1735 + _1725;
    float _1739 = float(uint(_1737));
    float _1741 = as_type<float>(_1586) * _1739;
    float _1743 = trunc(_1741);
    float _1745 = precise::max(_1743, 0.0);
    uint _1747 = uint(_1745);
    int _1749 = _1721 * int(_1747);
    int _1751 = _1749 + _1737;
    float _1753 = float(uint(_1751));
    float _1755 = as_type<float>(_1586) * _1753;
    float _1757 = trunc(_1755);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    int _1763 = ~_465;
    int _1765 = _1763 + 1;
    int _1767 = int(_1747) + int(_1761);
    float _1769 = float(uint(_1711));
    int _1771 = _1729 * _1767;
    int _1773 = _1771 + _1737;
    bool _1775 = uint(_1773) >= uint(_465);
    bool _1777 = !_1775;
    int _1779 = _1777 ? 0 : (-1);
    int _1781 = ~_1767;
    int _1783 = _1781 + _1779;
    int _1785 = _1783 + 1;
    float _1787 = as_type<float>(_1586) * _1769;
    int _1789 = _465 * _1785;
    int _1791 = _1789 + _1737;
    float _1793 = trunc(_1787);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    bool _1799 = !_1649;
    int _1801 = _1799 ? _1791 : (-1);
    int _1803 = _1801 >> 31;
    int _1805 = _1801 & 3;
    bool _1807 = _1805 != 0;
    int _1809 = _1803 & 3;
    bool _1811 = uint(_1805) > 1u;
    int _1813 = _1801 + _1809;
    int _1815 = _1765 * int(_1797);
    int _1817 = _1815 + _1711;
    int _1819 = _1801 & 3;
    bool _1821 = _1819 != 0;
    int _1823 = _1813 >> 2;
    float _1825 = float(uint(_1817));
    int _1827 = _1823 << 4;
    int _1829 = _1827 + 368;
    int _1831 = _1821 ? 0 : 1;
    float _1833 = as_type<float>(_1586) * _1825;
    uint _1835 = uint(int(uint(_1829) >> uint(2)));
    uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
    int _1839 = int(_1835) & 3;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[int(_1837)][_1839];
    int _1843 = int(_1835) + 1;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    int _1847 = _1843 & 3;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[int(_1845)][_1847];
    float _1851 = trunc(_1833);
    float _1853 = precise::max(_1851, 0.0);
    uint _1855 = uint(_1853);
    int _1857 = _1829 + 8;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[int(_1869)][_1871];
    int _1875 = int(_1797) + int(_1855);
    int _1877 = ~_1831;
    int _1879 = _1877 + 1;
    int _1881 = _1879 + 1;
    int _1883 = _1881;
    if (!_1811)
    {
        int _1885 = ~_1831;
        int _1887 = _1885 + 1;
        _1883 = _1887;
    }
    int _1889 = _1883;
    int _1891 = _1733 * _1875;
    int _1893 = _1891 + _1711;
    bool _1895 = !_1807;
    int _1897 = _1895 ? 0 : 1;
    bool _1899 = _1805 != 3;
    int _1901 = abs(_1889);
    bool _1903 = uint(_1805) >= 2u;
    int _1905 = abs(_1897);
    int _1907 = ~_1901;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    float _1913 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1915 = int(_1913);
    bool _1917 = uint(_1893) >= uint(_465);
    int _1919 = _1903 ? 0 : 1;
    int _1921 = ~_1905;
    int _1923 = _1921 + 1;
    int _1925 = _1923 + 1;
    int _1927 = ~_1919;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    bool _1933 = _1805 != 3;
    int _1935 = _1931;
    if (_1899)
    {
        int _1937 = ~_1919;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = _1911 * as_type<int>(_1849);
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1947 = _1945 != 0;
    int _1949 = abs(_1941);
    int _1951 = _1925 * as_type<int>(_1841);
    int _1953 = _1951 + _1943;
    bool _1955 = !_1933;
    int _1957 = _1955 ? 0 : (-1);
    bool _1959 = !_1917;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = abs(_1957);
    bool _1965 = !_1947;
    int _1967 = _1965 ? 0 : 1;
    float _1969 = float(uint(_1915));
    int _1971 = abs(_1915);
    int _1973 = ~_1949;
    int _1975 = _1973 + 1;
    int _1977 = _1975 + 1;
    int _1979 = ~_1875;
    int _1981 = _1979 + _1961;
    int _1983 = _1981 + 1;
    float _1985 = 1.0 / _1969;
    int _1987 = abs(_1967);
    int _1989 = _1977 * as_type<int>(_1865);
    int _1991 = _1989 + _1953;
    int _1993 = _465 * _1983;
    int _1995 = _1993 + _1711;
    int _1997 = ~_1963;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    float _2003 = float(uint(_1971));
    int _2005 = ~_1987;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    int _2011 = _2001 * as_type<int>(_1873);
    int _2013 = _2011 + _1991;
    bool _2015 = !_1649;
    int _2017 = _2015 ? _1995 : (-1);
    float _2019 = 1.0 / _2003;
    int _2021 = _2013 * _2009;
    int _2023 = ~_1915;
    int _2025 = _2023 + 1;
    int _2027 = as_type<int>(_1985) + (-2);
    int _2029 = _2017 * _1987;
    int _2031 = _2029 + _2021;
    int _2033 = ~_1915;
    int _2035 = _2033 + 1;
    bool _2037 = _113 > 0.5;
    float _2039 = float(uint(_2031));
    int _2041 = abs(_2031);
    bool _2043 = _1915 == 0;
    float _2045 = as_type<float>(_2027) * _2039;
    int _2047 = as_type<int>(_2019) + (-2);
    float _2049 = float(uint(_2041));
    int _2051 = ~_1971;
    int _2053 = _2051 + 1;
    float _2055 = trunc(_2045);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    bool _2061 = _1915 == 0;
    float _2063 = as_type<float>(_2047) * _2049;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2067 = _2065 != 0;
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2071 = _2069 != 0;
    float _2073 = trunc(_2063);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    int _2079 = _2035 * int(_2059);
    int _2081 = _2079 + _2031;
    float _2083 = float(uint(_2081));
    int _2085 = _2053 * int(_2077);
    int _2087 = _2085 + _2041;
    float _2089 = as_type<float>(_2027) * _2083;
    float _2091 = float(uint(_2087));
    float _2093 = trunc(_2089);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_2047) * _2091;
    float _2101 = trunc(_2099);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    int _2107 = int(_2059) + int(_2097);
    int _2109 = ~_1971;
    int _2111 = _2109 + 1;
    int _2113 = _2025 * _2107;
    int _2115 = _2113 + _2031;
    int _2117 = int(_2077) + int(_2105);
    bool _2119 = uint(_2115) >= uint(_1915);
    int _2121 = _2111 * _2117;
    int _2123 = _2121 + _2041;
    bool _2125 = !_2119;
    int _2127 = _2125 ? 0 : (-1);
    bool _2129 = _259 > 0.5;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2133 = ~_2107;
    int _2135 = _2133 + _2127;
    int _2137 = _2135 + 1;
    float _2139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2141 = uint(_2123) >= uint(_1971);
    int _2143 = _2031 ^ _1915;
    int _2145 = _1915 * _2137;
    int _2147 = _2145 + _2031;
    bool _2149 = !_2141;
    int _2151 = _2149 ? 0 : (-1);
    out.m_64.w = _2131;
    uint _2153 = uint(int(uint(_2143) >> uint(31)));
    float _2155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2157 = ~_2151;
    int _2159 = _2117 + _2157;
    int _2161 = _2159 + 1;
    int _2163 = ~int(_2153);
    int _2165 = _2163 + 1;
    float _2167 = -_781;
    int _2169 = _2037 ? as_type<int>(_2167) : as_type<int>(_781);
    int _2171 = _2161 ^ _2165;
    float _2173 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2175 = !_2043;
    int _2177 = _2175 ? _2147 : (-1);
    int _2179 = ~_2165;
    int _2181 = _2179 + _2171;
    int _2183 = _2181 + 1;
    float _2185 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2187 = float(_2177);
    bool _2189 = !_2067;
    float _2191 = _2189 ? _781 : as_type<float>(_2169);
    float _2193 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2195 = -_787;
    int _2197 = _2129 ? as_type<int>(_2195) : as_type<int>(_787);
    float _2199 = exp2(_2185);
    float _2201 = fma(_2173, _2187, _317);
    bool _2203 = !_2061;
    int _2205 = _2203 ? _2183 : (-1);
    float _2207 = _2191 + 0.5;
    bool _2209 = !_2071;
    float _2211 = _2209 ? _787 : as_type<float>(_2197);
    float _2213 = float(_2205);
    float _2215 = fma(_2173, _2207, _2201);
    bool _2217 = _1199 > 0.0;
    bool _2219 = isnan(_1199);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(0.0);
    bool _2225 = _2221 || _2223;
    float _2227 = -_529;
    float _2229 = fma(_2193, _2213, _2227);
    float _2231 = _2211 + (-0.5);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2235 = -_1560;
    float _2237 = fma(_2191, _2235, _2215);
    float _2239 = _1580 + _1461;
    float _2241 = -_2199;
    float _2243 = _2241 + 1.0;
    float _2245 = -_2193;
    float _2247 = fma(_2245, _2231, _2229);
    out.m_66.w = _2233;
    float _2249 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2251 = fma(_2211, _1570, _2247);
    float _2253 = _2239 * 0.5;
    float _2255 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2257 = _2249 * _1517;
    float _2259 = -_2249;
    float _2261 = _2259 + 1.0;
    out.gl_Position.x = _1497;
    out.gl_Position.y = _1499;
    out.gl_Position.z = _1580;
    out.gl_Position.w = _1461;
    float _2263 = _1528 * _2257;
    float _2265 = _1538 * _2257;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _2237;
    out.m_68.y = _2251;
    float _2269 = fma(_1534, _2263, _1522);
    float _2271 = fma(_1536, _2263, _1524);
    float _2273 = _1528 * _2261;
    float _2275 = fma(_1528, _2265, _1526);
    out.m_70.z = _2253;
    out.m_70.w = _1461;
    out.m_45.x = _2267;
    out.m_72.x = _2269;
    out.m_72.y = _2271;
    out.m_72.z = _2275;
    out.m_72.w = _2273;
    if (_2225)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2277 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2277;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    float _99 = as_type<float>(_91);
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _97;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2333 = as_type<float>(_107);
        out.gl_Position.z = _2333;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    float _111 = float(_91);
    float _113 = in.m_49.x;
    float _115 = -_109;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_109);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    out.m_51.x = _113;
    bool _129 = _117 >= _111;
    bool _131 = !_127;
    bool _133 = _129 || _131;
    float _135 = 1.0 / _111;
    float _137 = _117;
    if (_133)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _141 = 0;
    if (_133)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    float _147 = _117 * _135;
    float _149 = _147;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2407 = as_type<float>(_145);
        out.gl_Position.z = _2407;
    }
    out.m_53.x = _147;
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = in.m_42.x;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _159 = _157 != 0;
    int _161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _163 = _161 != 0;
    int _165 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _167 = _165 != 0;
    float _169 = _153 * _151;
    float _171 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _173 = _171 * 6.283185482025146484375;
    float _175 = floor(_171);
    out.m_55.x = _155;
    float _177 = _173 * 0.15915493667125701904296875;
    bool _179 = !_159;
    int _181 = _179 ? 0 : 1;
    int _183 = abs(_181);
    float _185 = _177 * 6.283185482025146484375;
    float _187 = cos(_185);
    bool _189 = !_167;
    int _191 = _189 ? 0 : 1;
    bool _193 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _195 = abs(_191);
    float _197 = -_175;
    float _199 = _171 + _197;
    bool _201 = !_163;
    int _203 = _201 ? 0 : 1;
    float _205 = float(_183);
    int _207 = abs(_203);
    float _209 = -_199;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _213 = fma(_187, 0.5, 0.5);
    float _215 = abs(_211);
    float _217 = _205 * _215;
    bool _219 = _199 < 0.5;
    float _221 = float(_219);
    float _223 = -_213;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_195);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_207);
    float _235 = fma(_227, _225, _217);
    float _237 = abs(_231);
    float _239 = fma(_233, _237, _235);
    bool _241 = !_193;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _113 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _149 = _255;
    }
    float _257 = _149;
    float _259 = in.m_49.y;
    float _261 = _113 * 2.0;
    float _263 = in.m_49.z;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _267 = _113 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _279 = 1.0 / _271;
    float _281 = -_277;
    float _283 = fma(_267, 2.0, _281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = 1.0 / _275;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _257 + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _311 = _259 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _315 = -_117;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[76].x, _283);
    float _319 = fma(_311, -2.0, _265);
    float _321 = _259 * 2.0;
    float _323 = floor(_261);
    float _325 = _263 * 2.0;
    float _327 = _301 * _279;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = _257 + _329;
    float _333 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[78].z, _313);
    float _335 = fma(_291, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_305, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = floor(_321);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _257 + _341;
    float _345 = _343 * _297;
    float _347 = _113 + _259;
    float _349 = _259 + _263;
    float _351 = 1.0 / _287;
    bool _353 = _323 > 0.0;
    float _355 = _347 + (-1.0);
    bool _357 = _323 >= 0.0;
    bool _359 = isnan(_323);
    bool _361 = _357 || _359;
    bool _363 = isnan(0.0);
    bool _365 = _361 || _363;
    float _367 = _349 + (-1.0);
    float _369 = fma(_295, _345, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_309, _345, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = floor(_325);
    bool _375 = _339 > 0.0;
    float _377 = _113 + _263;
    bool _379 = _339 >= 0.0;
    bool _381 = isnan(_339);
    bool _383 = _379 || _381;
    bool _385 = isnan(0.0);
    bool _387 = _383 || _385;
    float _389 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _393 = _377 + (-1.0);
    int _395 = _387 ? 0 : 1;
    float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _399 = log2(_397);
    float _401 = _331 * _351;
    int _403 = _365 ? 0 : 1;
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _407 = ~_403;
    int _409 = _407 + 1;
    int _411 = _409 + 1;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _415 = int(_413);
    bool _417 = _373 > 0.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _421 = 1.0 + _419;
    bool _423 = _373 >= 0.0;
    bool _425 = isnan(_373);
    bool _427 = _423 || _425;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    int _433 = ~_395;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _449 = _447 != 0;
    float _451 = _399 * _117;
    int _453 = _411;
    int _455 = _437;
    if (!_353)
    {
        int _457 = ~_403;
        int _459 = _457 + 1;
        _453 = _459;
    }
    int _461 = _453;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _465 = int(_463);
    if (!_375)
    {
        int _467 = ~_395;
        int _469 = _467 + 1;
        _455 = _469;
    }
    int _471 = _455;
    bool _473 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _475 = isnan(0.0);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _481 = _477 || _479;
    bool _483 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _485 = isnan(1.0);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _491 = _487 || _489;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _495 = !_445;
    int _497 = _495 ? 0 : 1;
    float _499 = exp2(_451);
    bool _501 = !_441;
    int _503 = _501 ? 0 : 1;
    float _505 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[78].w, _493);
    bool _507 = !_449;
    int _509 = _507 ? 0 : 1;
    float _511 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _333);
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = float(_415);
    float _527 = 1.0 / _421;
    float _529 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _319);
    bool _531 = !_519;
    int _533 = _531 ? 0 : 1;
    float _535 = in.m_57.x;
    float _537 = in.m_57.y;
    float _539 = in.m_57.z;
    bool _541 = !_523;
    int _543 = _541 ? 0 : 1;
    float _545 = float(_461);
    float _547 = 1.0 / _525;
    int _549 = abs(_543);
    float _551 = -_499;
    float _553 = _551 + 1.0;
    float _555 = float(_465);
    float _557 = float(_471);
    float _559 = _481 ? _553 : 0.0;
    float _561 = _555 * _117;
    float _563 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _505);
    int _565 = abs(_533);
    bool _567 = !_515;
    int _569 = _567 ? 0 : 1;
    float _571 = _547 * _117;
    float _573 = float(_565);
    if (_491)
    {
        float _575 = _559 * _527;
        _137 = _575;
    }
    float _577 = _137;
    int _579 = _431 ? 0 : 1;
    float _581 = float(_549);
    float _583 = _573 * _545;
    int _585 = ~_579;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    int _591 = abs(_569);
    float _593 = _583 * (-2.0);
    int _595 = _589;
    if (!_417)
    {
        int _597 = ~_579;
        int _599 = _597 + 1;
        _595 = _599;
    }
    int _601 = _595;
    float _603 = _581 * _557;
    float _605 = _259 + (-0.5);
    float _607 = fma(_593, _537, _537);
    bool _609 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _611 = isnan(_257);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_391, _593, _391);
    float _623 = float(_591);
    float _625 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[196].y, _607);
    float _627 = float(_601);
    float _629 = -_619;
    float _631 = _629 + 1.0;
    bool _633 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _635 = isnan(_257);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = fma(_621, _577, _625);
    bool _647 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _649 = isnan(_257);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _623 * _627;
    bool _661 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_257);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = _643 * _631;
    float _675 = -_643;
    float _677 = _675 + 1.0;
    float _679 = _659 * (-2.0);
    float _681 = _113 + (-0.5);
    float _683 = _645 * 0.15915493667125701904296875;
    float _685 = _671 * _677;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = fma(_679, _535, _535);
    float _693 = fma(_389, _679, _389);
    float _695 = as_type<float>(int(gl_VertexIndex));
    float _697 = _657 * _689;
    float _699 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[196].x, _691);
    float _701 = _603 * (-2.0);
    float _703 = _335 * _697;
    float _705 = _337 * _697;
    float _707 = fma(_693, _577, _699);
    float _709 = -_657;
    float _711 = _709 + 1.0;
    float _713 = in.m_62.x;
    float _715 = in.m_62.y;
    float _717 = fma(_405, _701, _405);
    float _719 = fma(_701, _539, _539);
    float _721 = _263 + (-0.5);
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _723;
    float _727 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].y, _705);
    float _729 = _707 * 0.15915493667125701904296875;
    float _731 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[196].z, _719);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _733;
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].x, _703);
    float _739 = fma(_725, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _741 = fma(_371, _685, _727);
    float _743 = fma(_717, _577, _731);
    float _745 = fma(_735, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _747 = fma(_369, _685, _737);
    float _749 = fma(_739, _673, _741);
    float _751 = _683 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = _743 * 0.15915493667125701904296875;
    float _757 = fma(_745, _673, _747);
    float _759 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[146].y, _749);
    int _761 = as_type<int>(_695) & 1;
    bool _763 = _761 != 0;
    int _765 = as_type<int>(_695) & 2;
    bool _767 = _765 != 0;
    float _769 = in.m_42.y;
    float _771 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[146].x, _757);
    float _773 = _759 * _715;
    float _775 = _683 * 6.283185482025146484375;
    float _777 = cos(_775);
    bool _779 = !_763;
    float _781 = _779 ? (-0.5) : 0.5;
    float _783 = _771 * _713;
    bool _785 = !_767;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _239 * _773;
    bool _791 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _793 = isnan(0.5);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _799 = _795 || _797;
    float _801 = _239 * _783;
    float _803 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _781);
    float _805 = _729 * 6.283185482025146484375;
    float _807 = sin(_805);
    float _809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _811 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _813 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _823 = _819 || _821;
    float _825 = _811 * _809;
    float _827 = _813 * _803;
    float _829 = _729 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = in.m_42.z;
    float _835 = _755 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _807 * _777;
    float _841 = _755 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = _831 * _753;
    float _847 = -_845;
    float _849 = fma(_837, _839, _847);
    float _851 = -_839;
    float _853 = fma(_837, _845, _851);
    float _855 = _807 * _753;
    float _857 = _831 * _777;
    float _859 = _843 * _825;
    float _861 = _753 * _843;
    float _863 = _777 * _843;
    float _865 = fma(_837, _857, _855);
    float _867 = -_825;
    float _869 = _837 * _867;
    float _871 = fma(_837, _855, _857);
    float _873 = _831 * _859;
    float _875 = _807 * _859;
    float _877 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _879 = fma(_863, _827, _869);
    float _881 = fma(_865, _827, _873);
    float _883 = fma(_849, _827, _875);
    float _885 = _769 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _887 = fma(_861, _877, _879);
    float _889 = fma(_853, _877, _881);
    float _891 = fma(_871, _877, _883);
    float _893 = _769 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _895 = _769 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _897 = _889 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _889 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _893);
    float _903 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _905 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _885);
    float _907 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[6].z, _901);
    float _909 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _911 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].z, _903);
    float _913 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[4].z, _905);
    float _915 = _907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].z, _909);
    float _919 = _911 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _921 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _895);
    float _923 = _913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _927 = _915 + _919;
    float _929 = fma(_833, (*spvDescriptorSet0.vp_c10)._m0[5].z, _921);
    float _931 = _923 + _925;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _935 = _927 + _933;
    float _937 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _941 = _931 + _939;
    float _943 = _935 * _935;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _947 = fma(_941, _941, _943);
    float _949 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].x, _945);
    float _951 = _937 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _953 = sqrt(_947);
    float _955 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _957 = _955 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _959 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].x, _951);
    float _961 = _889 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = 1.0 / _957;
    float _965 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[10].z, _959);
    float _967 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _969 = _965 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _971 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].z, _967);
    bool _973 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _969 + _957;
    float _977 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _979 = _937 + _977;
    float _981 = _975 * _963;
    float _983 = _981 * 0.5;
    float _985 = _971;
    float _987 = _931;
    float _989 = _977;
    float _991 = _961;
    float _993 = _953;
    float _995 = _935;
    float _997 = _729;
    if (!_973)
    {
        _985 = _931;
    }
    float _999 = _985;
    float _1001 = _999;
    if (!_973)
    {
        _987 = _927;
    }
    float _1003 = _987;
    float _1005 = _1003;
    if (!_973)
    {
        _989 = _979;
    }
    float _1007 = _989;
    bool _1009 = !_973;
    float _1011 = _1007;
    if (!_1009)
    {
        float _1013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1017 = _953 + _1015;
        float _1019 = _979 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1021 = rsqrt(_947);
        float _1023 = _1017 * _1013;
        float _1025 = _1023 * 0.15915493667125701904296875;
        float _1027 = _1025 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        float _1031 = _1025 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        float _1035 = fma(_1029, _1019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1037 = _1021 * _1035;
        float _1039 = _1033 + (-1.0);
        float _1041 = fma(_941, _1037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1043 = fma(_935, _1037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1045 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = fma(_979, _1033, _1045);
        _1005 = _1043;
        _991 = _1035;
        _1011 = _1047;
        _1001 = _1041;
        _993 = _1045;
    }
    float _1049 = _1005;
    float _1051 = _991;
    float _1053 = _1011;
    float _1055 = _1001;
    float _1057 = _993;
    float _1059 = _1057;
    float _1061 = _1053;
    float _1063 = _1055;
    float _1065 = _1051;
    if (_823)
    {
        _1059 = 1.0;
    }
    float _1067 = _1059;
    float _1069 = _1067;
    if (_799)
    {
        _995 = _1049;
    }
    float _1071 = _995;
    float _1073 = _1071;
    if (!_799)
    {
        float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1077 = _937 + _1075;
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1081 = _923 + _1079;
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1085 = -_937;
        float _1087 = _1085 + _1053;
        float _1089 = _1077 * _1077;
        float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1093 = _915 + _1091;
        float _1095 = -_915;
        float _1097 = _1095 + _1049;
        float _1099 = fma(_1081, _1081, _1089);
        float _1101 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1103 = fma(_1093, _1093, _1099);
        float _1105 = sqrt(_1103);
        float _1107 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1109 = precise::min(_1105, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1111 = _1109 * _1101;
        float _1113 = -_923;
        float _1115 = _1113 + _1055;
        float _1117 = _1107 * _1111;
        float _1119 = fma(_1115, _1117, _923);
        float _1121 = fma(_1087, _1117, _937);
        float _1123 = fma(_1097, _1117, _915);
        _1061 = _1121;
        _1063 = _1119;
        _1073 = _1123;
        _1065 = _1083;
    }
    float _1125 = _1061;
    float _1127 = _1063;
    float _1129 = _1073;
    float _1131 = _1065;
    float _1133 = _1131;
    if (!_823)
    {
        float _1135 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1137 = _1135 * 0.15915493667125701904296875;
        float _1139 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1143 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
        float _1145 = _1137 * 6.283185482025146484375;
        float _1147 = cos(_1145);
        float _1149 = _1139 * 0.15915493667125701904296875;
        float _1151 = _1137 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = 1.0 / _1147;
        float _1157 = _1149 * 6.283185482025146484375;
        float _1159 = cos(_1157);
        float _1161 = _1153 * _1155;
        float _1163 = _1149 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = _1159 * _1161;
        float _1169 = 1.0 / _1143;
        float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1173 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1171;
        float _1175 = 1.0 / _1167;
        float _1177 = 1.0 / _1173;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1181 = _1169 * _1179;
        float _1183 = _1165 * _1175;
        float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1187 = fma(_1183, _1181, _1185);
        float _1189 = _1187 * _1177;
        float _1191 = precise::clamp(_1189, 0.0, 1.0);
        float _1193 = -_1191;
        float _1195 = _1193 + 1.0;
        _1133 = _1177;
        _1069 = _1195;
    }
    float _1197 = _1133;
    float _1199 = _1069;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1125 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1127 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1129 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = sqrt(_1217);
    float _1223 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1225 = _1207 * _1223;
    float _1227 = _1211 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 * _1227;
    float _1233 = _1229 + _1231;
    float _1235 = sqrt(_1233);
    bool _1237 = _1235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1241 = _1235 + _1239;
    float _1243 = _1215;
    float _1245 = _1241;
    float _1247 = _1197;
    float _1249 = _1203;
    float _1251 = _1223;
    if (_1237)
    {
        float _1253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1253;
    }
    float _1255 = _1243;
    float _1257 = _1255;
    if (_1237)
    {
        float _1259 = _1241 * _1255;
        _1245 = _1259;
    }
    float _1261 = _1245;
    if (_1237)
    {
        float _1263 = rsqrt(_1233);
        _1257 = _1263;
    }
    float _1265 = _1257;
    float _1267 = _1265;
    if (_1237)
    {
        float _1269 = _1261 * 0.15915493667125701904296875;
        _1247 = _1269;
    }
    float _1271 = _1247;
    float _1273 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1275 = _1219;
    float _1277 = _1271;
    if (_1237)
    {
        float _1279 = _1271 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        _1275 = _1281;
    }
    float _1283 = _1275;
    float _1285 = precise::max(0.0, _1273);
    float _1287 = _1211;
    float _1289 = _1285;
    if (_1237)
    {
        float _1291 = _1271 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        _1287 = _1293;
    }
    float _1295 = _1287;
    float _1297 = -_1223;
    float _1299 = -_1285;
    float _1301 = fma(_1203, _1297, _1299);
    if (_1237)
    {
        float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1249 = _1303;
    }
    float _1305 = _1249;
    float _1307 = _1283;
    float _1309 = _1305;
    if (_1237)
    {
        float _1311 = fma(_1283, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = _1313;
    if (!_1237)
    {
        _1309 = _1227;
    }
    float _1317 = _1309;
    float _1319 = _1317;
    if (!_1237)
    {
        _1277 = _1229;
    }
    float _1321 = _1277;
    float _1323 = _1321;
    if (_1237)
    {
        float _1325 = _1265 * _1313;
        _997 = _1325;
    }
    float _1327 = _997;
    if (!_1237)
    {
        _1267 = _1225;
    }
    float _1329 = _1267;
    float _1331 = _1329;
    if (_1237)
    {
        float _1333 = _1295 + (-1.0);
        _1289 = _1333;
    }
    float _1335 = _1289;
    float _1337 = _1335;
    if (_1237)
    {
        float _1339 = _1225 * _1327;
        _1331 = _1339;
    }
    float _1341 = _1331;
    if (!_1237)
    {
        _1315 = _1301;
    }
    float _1343 = _1315;
    float _1345 = _1343;
    if (_1237)
    {
        float _1347 = _1227 * _1327;
        _1319 = _1347;
    }
    float _1349 = _1319;
    if (_1237)
    {
        float _1351 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1251 = _1351;
    }
    float _1353 = _1251;
    if (_1237)
    {
        float _1355 = _1341 * _1341;
        _1323 = _1355;
    }
    float _1357 = _1323;
    if (!_1237)
    {
        _1337 = _1231;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (_1237)
    {
        float _1363 = _1349 * _1349;
        _1361 = _1363;
    }
    float _1365 = _1361;
    if (_1237)
    {
        float _1367 = fma(_1301, _1295, _1353);
        _1345 = _1367;
    }
    float _1369 = _1345;
    float _1371 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1373 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1375 = fma(_1369, _1369, _1357);
    float _1377 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1381 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1379);
    float _1383 = precise::clamp(_1381, 0.0, 1.0);
    float _1385 = _1375 + _1365;
    float _1387 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1377);
    float _1389 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1391 = -_1383;
    float _1393 = _1391 + 1.0;
    float _1395 = rsqrt(_1385);
    float _1397 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1387);
    float _1399 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1389);
    float _1401 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1403 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1373);
    float _1405 = _1397 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1407 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1409 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1401);
    float _1411 = abs(_1393);
    float _1413 = log2(_1411);
    float _1415 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1417 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1403);
    float _1419 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1421 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1409);
    float _1423 = -_1415;
    float _1425 = fma(_1423, _1371, 1.0);
    float _1427 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1431 = _1395 * _1341;
    float _1433 = _1395 * _1369;
    float _1435 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1437 = _1395 * _1349;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1441 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1429);
    float _1443 = log2(_1425);
    float _1445 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = -_1439;
    float _1449 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1447);
    float _1451 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1453 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1441);
    float _1455 = -_1437;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1449);
    float _1459 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1461 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1453);
    float _1463 = exp2(_1451);
    float _1465 = fma(_1457, -0.5, 0.5);
    float _1467 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1459);
    float _1469 = fma(_1457, 0.5, 0.5);
    float _1471 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1473 = _1433 + 1.0;
    float _1475 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1467);
    float _1477 = fma(_1469, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1479 = 1.0 / _1461;
    float _1481 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1471);
    float _1483 = _1443 * 0.693147182464599609375;
    float _1485 = fma(_1469, _1477, -0.212114393711090087890625);
    float _1487 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1489 = fma(_1469, _1485, 1.570728778839111328125);
    float _1491 = sqrt(_1465);
    float _1493 = -_1433;
    float _1495 = fma(_1463, _1473, _1493);
    float _1497 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1475);
    float _1499 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1481);
    float _1501 = fma(_1495, 0.5, 0.5);
    float _1503 = _1497 * _1479;
    float _1505 = _1499 * _1479;
    float _1507 = fma(_1503, 0.5, 0.5);
    float _1509 = fma(_1505, -0.5, 0.5);
    float _1511 = _1491 * 0.636619746685028076171875;
    float _1513 = -_1489;
    float _1515 = fma(_1511, _1513, 1.0);
    float3 _4519 = float3(_1507, _1509, _1487);
    float _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4519, float3(0.0), isnan(_4519)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4519, float3(0.0), isnan(_4519)), level(0.0)).x;
    float3 _4530 = float3(_1507, _1509, _1487);
    float4 _1520 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4530, float3(0.0), isnan(_4530)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4530, float3(0.0), isnan(_4530)), level(0.0)).xyzw;
    float _1522 = _1520.x;
    float _1524 = _1520.y;
    float _1526 = _1520.z;
    float _1528 = _1520.w;
    float2 _4547 = float2(_1515, _1501);
    float3 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4547, float2(0.0), isnan(_4547)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4547, float2(0.0), isnan(_4547)), level(0.0)).xyz;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = float(uint(_465));
    float _1542 = trunc(_571);
    int _1544 = int(_1542);
    int _1546 = ~_465;
    int _1548 = _1546 + 1;
    float _1550 = _561 * _135;
    int _1552 = _465 + (-1);
    float _1554 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1556 = abs(_497);
    float _1558 = -_511;
    float _1560 = _1558 + 1.0;
    int _1562 = abs(_509);
    float _1564 = 1.0 / _1540;
    float _1566 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1554);
    float _1568 = -_563;
    float _1570 = _1568 + 1.0;
    float _1572 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1566);
    float _1574 = float(uint(_1544));
    float _1576 = trunc(_1550);
    int _1578 = int(_1576);
    float _1580 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1572);
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>(_1564) + (-2);
    float _1588 = as_type<float>(_1586) * _1574;
    bool _1590 = !_1584;
    float _1592 = _1590 ? 7.345489978790283203125 : 1.0;
    float _1594 = trunc(_1588);
    float _1596 = precise::max(_1594, 0.0);
    uint _1599 = uint(_1596);
    float _1601 = _1592 * _113;
    int _1603 = _1548 * int(_1599);
    int _1605 = _1603 + _1544;
    float _1607 = float(_1544);
    float _1609 = float(uint(_1605));
    bool _1611 = _1607 >= _555;
    bool _1613 = isnan(_1607);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(_555);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = as_type<float>(_1586) * _1609;
    float _1625 = trunc(_1621);
    int _1627 = int(_1625);
    float _1629 = trunc(_1623);
    float _1631 = precise::max(_1629, 0.0);
    uint _1633 = uint(_1631);
    int _1635 = int(_1599) + int(_1633);
    float _1637 = floor(_1601);
    int _1639 = _1548 * _1635;
    int _1641 = _1639 + _1544;
    bool _1643 = uint(_1641) >= uint(_465);
    bool _1645 = !_1643;
    int _1647 = _1645 ? 0 : (-1);
    bool _1649 = _465 == 0;
    float _1651 = -_1637;
    float _1653 = _1601 + _1651;
    int _1655 = ~_1635;
    int _1657 = _1655 + _1647;
    int _1659 = _1657 + 1;
    float _1661 = _1653 * _555;
    int _1663 = _465 * _1659;
    int _1665 = _1663 + _1544;
    int _1667 = ~_1627;
    int _1669 = _1667 + 1;
    int _1671 = _1669 + 1;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1675 = _1673 != 0;
    float _1677 = trunc(_1661);
    int _1679 = int(_1677);
    bool _1681 = !_1649;
    int _1683 = _1681 ? _1665 : (-1);
    bool _1685 = !_1675;
    int _1687 = _1685 ? 0 : 1;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1691 = _1689 != 0;
    int _1693 = _1683 * _1671;
    int _1695 = abs(_503);
    int _1697 = _1627 * _1552;
    int _1699 = _1697 + _1693;
    int _1701 = abs(_1687);
    int _1703 = _1699 * _1556;
    bool _1705 = !_1691;
    int _1707 = _1705 ? 0 : 1;
    int _1709 = _1679 * _1701;
    int _1711 = _1709 + _1544;
    int _1713 = _1578 * _1695;
    int _1715 = _1713 + _1703;
    int _1717 = abs(_1707);
    int _1719 = ~_465;
    int _1721 = _1719 + 1;
    int _1723 = _1711 * _1562;
    int _1725 = _1723 + _1715;
    int _1727 = ~_465;
    int _1729 = _1727 + 1;
    int _1731 = ~_465;
    int _1733 = _1731 + 1;
    int _1735 = _1679 * _1717;
    int _1737 = _1735 + _1725;
    float _1739 = float(uint(_1737));
    float _1741 = as_type<float>(_1586) * _1739;
    float _1743 = trunc(_1741);
    float _1745 = precise::max(_1743, 0.0);
    uint _1747 = uint(_1745);
    int _1749 = _1721 * int(_1747);
    int _1751 = _1749 + _1737;
    float _1753 = float(uint(_1751));
    float _1755 = as_type<float>(_1586) * _1753;
    float _1757 = trunc(_1755);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    int _1763 = ~_465;
    int _1765 = _1763 + 1;
    int _1767 = int(_1747) + int(_1761);
    float _1769 = float(uint(_1711));
    int _1771 = _1729 * _1767;
    int _1773 = _1771 + _1737;
    bool _1775 = uint(_1773) >= uint(_465);
    bool _1777 = !_1775;
    int _1779 = _1777 ? 0 : (-1);
    int _1781 = ~_1767;
    int _1783 = _1781 + _1779;
    int _1785 = _1783 + 1;
    float _1787 = as_type<float>(_1586) * _1769;
    int _1789 = _465 * _1785;
    int _1791 = _1789 + _1737;
    float _1793 = trunc(_1787);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    bool _1799 = !_1649;
    int _1801 = _1799 ? _1791 : (-1);
    int _1803 = _1801 >> 31;
    int _1805 = _1801 & 3;
    bool _1807 = _1805 != 0;
    int _1809 = _1803 & 3;
    bool _1811 = uint(_1805) > 1u;
    int _1813 = _1801 + _1809;
    int _1815 = _1765 * int(_1797);
    int _1817 = _1815 + _1711;
    int _1819 = _1801 & 3;
    bool _1821 = _1819 != 0;
    int _1823 = _1813 >> 2;
    float _1825 = float(uint(_1817));
    int _1827 = _1823 << 4;
    int _1829 = _1827 + 368;
    int _1831 = _1821 ? 0 : 1;
    float _1833 = as_type<float>(_1586) * _1825;
    uint _1835 = uint(int(uint(_1829) >> uint(2)));
    uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
    int _1839 = int(_1835) & 3;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[int(_1837)][_1839];
    int _1843 = int(_1835) + 1;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    int _1847 = _1843 & 3;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[int(_1845)][_1847];
    float _1851 = trunc(_1833);
    float _1853 = precise::max(_1851, 0.0);
    uint _1855 = uint(_1853);
    int _1857 = _1829 + 8;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[int(_1869)][_1871];
    int _1875 = int(_1797) + int(_1855);
    int _1877 = ~_1831;
    int _1879 = _1877 + 1;
    int _1881 = _1879 + 1;
    int _1883 = _1881;
    if (!_1811)
    {
        int _1885 = ~_1831;
        int _1887 = _1885 + 1;
        _1883 = _1887;
    }
    int _1889 = _1883;
    int _1891 = _1733 * _1875;
    int _1893 = _1891 + _1711;
    bool _1895 = !_1807;
    int _1897 = _1895 ? 0 : 1;
    bool _1899 = _1805 != 3;
    int _1901 = abs(_1889);
    bool _1903 = uint(_1805) >= 2u;
    int _1905 = abs(_1897);
    int _1907 = ~_1901;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    float _1913 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1915 = int(_1913);
    bool _1917 = uint(_1893) >= uint(_465);
    int _1919 = _1903 ? 0 : 1;
    int _1921 = ~_1905;
    int _1923 = _1921 + 1;
    int _1925 = _1923 + 1;
    int _1927 = ~_1919;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    bool _1933 = _1805 != 3;
    int _1935 = _1931;
    if (_1899)
    {
        int _1937 = ~_1919;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = _1911 * as_type<int>(_1849);
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1947 = _1945 != 0;
    int _1949 = abs(_1941);
    int _1951 = _1925 * as_type<int>(_1841);
    int _1953 = _1951 + _1943;
    bool _1955 = !_1933;
    int _1957 = _1955 ? 0 : (-1);
    bool _1959 = !_1917;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = abs(_1957);
    bool _1965 = !_1947;
    int _1967 = _1965 ? 0 : 1;
    float _1969 = float(uint(_1915));
    int _1971 = abs(_1915);
    int _1973 = ~_1949;
    int _1975 = _1973 + 1;
    int _1977 = _1975 + 1;
    int _1979 = ~_1875;
    int _1981 = _1979 + _1961;
    int _1983 = _1981 + 1;
    float _1985 = 1.0 / _1969;
    int _1987 = abs(_1967);
    int _1989 = _1977 * as_type<int>(_1865);
    int _1991 = _1989 + _1953;
    int _1993 = _465 * _1983;
    int _1995 = _1993 + _1711;
    int _1997 = ~_1963;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    float _2003 = float(uint(_1971));
    int _2005 = ~_1987;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    int _2011 = _2001 * as_type<int>(_1873);
    int _2013 = _2011 + _1991;
    bool _2015 = !_1649;
    int _2017 = _2015 ? _1995 : (-1);
    float _2019 = 1.0 / _2003;
    int _2021 = _2013 * _2009;
    int _2023 = ~_1915;
    int _2025 = _2023 + 1;
    int _2027 = as_type<int>(_1985) + (-2);
    int _2029 = _2017 * _1987;
    int _2031 = _2029 + _2021;
    int _2033 = ~_1915;
    int _2035 = _2033 + 1;
    bool _2037 = _113 > 0.5;
    float _2039 = float(uint(_2031));
    int _2041 = abs(_2031);
    bool _2043 = _1915 == 0;
    float _2045 = as_type<float>(_2027) * _2039;
    int _2047 = as_type<int>(_2019) + (-2);
    float _2049 = float(uint(_2041));
    int _2051 = ~_1971;
    int _2053 = _2051 + 1;
    float _2055 = trunc(_2045);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    bool _2061 = _1915 == 0;
    float _2063 = as_type<float>(_2047) * _2049;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2067 = _2065 != 0;
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2071 = _2069 != 0;
    float _2073 = trunc(_2063);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    int _2079 = _2035 * int(_2059);
    int _2081 = _2079 + _2031;
    float _2083 = float(uint(_2081));
    int _2085 = _2053 * int(_2077);
    int _2087 = _2085 + _2041;
    float _2089 = as_type<float>(_2027) * _2083;
    float _2091 = float(uint(_2087));
    float _2093 = trunc(_2089);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = as_type<float>(_2047) * _2091;
    float _2101 = trunc(_2099);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    int _2107 = int(_2059) + int(_2097);
    int _2109 = ~_1971;
    int _2111 = _2109 + 1;
    int _2113 = _2025 * _2107;
    int _2115 = _2113 + _2031;
    int _2117 = int(_2077) + int(_2105);
    bool _2119 = uint(_2115) >= uint(_1915);
    int _2121 = _2111 * _2117;
    int _2123 = _2121 + _2041;
    bool _2125 = !_2119;
    int _2127 = _2125 ? 0 : (-1);
    bool _2129 = _259 > 0.5;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2133 = ~_2107;
    int _2135 = _2133 + _2127;
    int _2137 = _2135 + 1;
    float _2139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2141 = uint(_2123) >= uint(_1971);
    int _2143 = _2031 ^ _1915;
    int _2145 = _1915 * _2137;
    int _2147 = _2145 + _2031;
    bool _2149 = !_2141;
    int _2151 = _2149 ? 0 : (-1);
    out.m_64.w = _2131;
    uint _2153 = uint(int(uint(_2143) >> uint(31)));
    float _2155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2157 = ~_2151;
    int _2159 = _2117 + _2157;
    int _2161 = _2159 + 1;
    int _2163 = ~int(_2153);
    int _2165 = _2163 + 1;
    float _2167 = -_781;
    int _2169 = _2037 ? as_type<int>(_2167) : as_type<int>(_781);
    int _2171 = _2161 ^ _2165;
    float _2173 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2175 = !_2043;
    int _2177 = _2175 ? _2147 : (-1);
    int _2179 = ~_2165;
    int _2181 = _2179 + _2171;
    int _2183 = _2181 + 1;
    float _2185 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2187 = float(_2177);
    bool _2189 = !_2067;
    float _2191 = _2189 ? _781 : as_type<float>(_2169);
    float _2193 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2195 = -_787;
    int _2197 = _2129 ? as_type<int>(_2195) : as_type<int>(_787);
    float _2199 = exp2(_2185);
    float _2201 = fma(_2173, _2187, _317);
    bool _2203 = !_2061;
    int _2205 = _2203 ? _2183 : (-1);
    float _2207 = _2191 + 0.5;
    bool _2209 = !_2071;
    float _2211 = _2209 ? _787 : as_type<float>(_2197);
    float _2213 = float(_2205);
    float _2215 = fma(_2173, _2207, _2201);
    bool _2217 = _1199 > 0.0;
    bool _2219 = isnan(_1199);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(0.0);
    bool _2225 = _2221 || _2223;
    float _2227 = -_529;
    float _2229 = fma(_2193, _2213, _2227);
    float _2231 = _2211 + (-0.5);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2235 = -_1560;
    float _2237 = fma(_2191, _2235, _2215);
    float _2239 = _1580 + _1461;
    float _2241 = -_2199;
    float _2243 = _2241 + 1.0;
    float _2245 = -_2193;
    float _2247 = fma(_2245, _2231, _2229);
    out.m_66.w = _2233;
    float _2249 = _2243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2251 = fma(_2211, _1570, _2247);
    float _2253 = _2239 * 0.5;
    float _2255 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2257 = _2249 * _1517;
    float _2259 = -_2249;
    float _2261 = _2259 + 1.0;
    out.gl_Position.x = _1497;
    out.gl_Position.y = _1499;
    out.gl_Position.z = _1580;
    out.gl_Position.w = _1461;
    float _2263 = _1528 * _2257;
    float _2265 = _1538 * _2257;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _2237;
    out.m_68.y = _2251;
    float _2269 = fma(_1534, _2263, _1522);
    float _2271 = fma(_1536, _2263, _1524);
    float _2273 = _1528 * _2261;
    float _2275 = fma(_1528, _2265, _1526);
    out.m_70.z = _2253;
    out.m_70.w = _1461;
    out.m_45.x = _2267;
    out.m_72.x = _2269;
    out.m_72.y = _2271;
    out.m_72.z = _2275;
    out.m_72.w = _2273;
    if (_2225)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2277 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2277;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

