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
    float4 m_56 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _695 = false;
    bool _507 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_105);
        out.gl_Position.z = _2005;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_141);
        out.gl_Position.z = _2074;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = in.m_52.x;
    float _151 = _147 * _145;
    int _153 = as_type<int>(_143) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_143) & 2;
    bool _159 = _157 != 0;
    float _161 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    bool _163 = !_159;
    float _165 = _163 ? (-0.5) : 0.5;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 6.283185482025146484375;
    float _177 = floor(_161);
    float _179 = _175 * 0.15915493667125701904296875;
    bool _181 = !_155;
    float _183 = _181 ? (-0.5) : 0.5;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_169;
    int _191 = _189 ? 0 : 1;
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_191);
    int _203 = abs(_199);
    float _205 = -_177;
    float _207 = _161 + _205;
    float _209 = float(_201);
    float _211 = -_207;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_173;
    int _219 = _217 ? 0 : 1;
    float _221 = fma(_195, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _209 * _223;
    bool _227 = _207 < 0.5;
    float _229 = float(_227);
    int _231 = abs(_219);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_203);
    float _239 = -_229;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_231);
    float _245 = fma(_237, _235, _225);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_215;
    float _267;
    if (!_251)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_89);
        float _273 = 1.0 / _271;
        float _275 = _123 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _277 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = 1.0 / _293;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _301;
    float _313 = 1.0 / _297;
    float _315 = _285 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _319 = _277 + _317;
    float _321 = 1.0 / _305;
    float _323 = _281 * _311;
    bool _325 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_277);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -_335;
    float _339 = _337 + 1.0;
    float _341 = _289 * _313;
    bool _343 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_277);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_277);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _353 * _339;
    bool _369 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_277);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _319 * _321;
    float _383 = -_353;
    float _385 = _383 + 1.0;
    bool _387 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_277);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = _365 * _385;
    float _409 = -_365;
    float _411 = _409 + 1.0;
    float _413 = fma(_401, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_405, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = _379 * _411;
    float _423 = -_379;
    float _425 = _423 + 1.0;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_397;
    float _433 = _431 + 1.0;
    float _435 = fma(_419, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = _397 * _425;
    float _439 = fma(_429, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = _413 * _437;
    float _451 = _415 * _437;
    float _453 = fma(_443, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _463 = fma(_447, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _469 = fma(_439, _421, _459);
    float _471 = fma(_435, _421, _461);
    float _473 = fma(_457, _381, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _475 = fma(_467, _381, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _477 = fma(_453, _407, _469);
    float _479 = fma(_463, _407, _471);
    float _481 = fma(_473, _367, _477);
    float _483 = fma(_475, _367, _479);
    float _485 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _481);
    float _487 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _483);
    bool _489 = !_309;
    float _505;
    if (!_489)
    {
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _493 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _123 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _515 + _517;
    bool _521 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _523 = isnan(_515);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _535 = _515 + _533;
    bool _537 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _539 = isnan(_515);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _557 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _559 = isnan(_515);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _551;
    float _571 = -_567;
    float _573 = _571 + 1.0;
    bool _575 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _577 = _547 * _573;
    float _579 = -_547;
    float _581 = _579 + 1.0;
    float _583 = 1.0 / _555;
    float _585 = _519 * _569;
    float _587 = -_531;
    float _589 = _587 + 1.0;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _591;
    float _595 = _567 * _589;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _601;
    float _605 = fma(_593, _585, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _607 = _535 * _583;
    float _609 = fma(_599, _585, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _611 = fma(_603, _585, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _613 = _605 * _577;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _619 = _609 * _577;
    float _621 = _611 * _577;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _631 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].x, _619);
    float _633 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].y, _613);
    float _635 = fma(_625, _607, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _637 = fma(_617, _607, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _639 = fma(_629, _607, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _641 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].z, _621);
    float _643 = fma(_635, _595, _631);
    float _645 = fma(_637, _595, _633);
    float _647 = fma(_639, _595, _641);
    float _649 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].x, _643);
    float _651 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].y, _645);
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].z, _647);
    float _659 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _661 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _667;
    out.m_56.y = _669;
    out.m_56.z = _671;
    out.m_56.w = _663;
    float _673 = _487 * _655;
    float _675 = _485 * _653;
    bool _677 = !_575;
    float _693;
    if (!_677)
    {
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _681 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = in.m_42.x;
    float _707 = in.m_42.y;
    float _709 = in.m_42.z;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _713 = _703 + _711;
    float _715 = in.m_58.x;
    float _717 = in.m_58.y;
    float _719 = in.m_58.z;
    float _721 = in.m_58.w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _731 = in.m_60.x;
    float _733 = in.m_60.y;
    float _735 = in.m_60.z;
    float _737 = in.m_60.w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _739;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _745 = _743 != 0;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _749 = _703 + _747;
    float _751 = in.m_62.x;
    float _753 = in.m_62.y;
    float _755 = in.m_62.z;
    float _757 = in.m_62.w;
    float _759 = 1.0 / _725;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _763 = _761 != 0;
    float _765 = in.m_52.y;
    bool _767 = _149 > 0.5;
    float _769 = 1.0 / _729;
    bool _771 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _773 = isnan(_703);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _707 * _717;
    float _785 = 1.0 / _741;
    bool _787 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = isnan(_703);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = fma(_705, _715, _783);
    float _801 = _707 * _733;
    float _803 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _805 = _707 * _753;
    float _807 = fma(_705, _731, _801);
    float _809 = fma(_709, _719, _799);
    float _811 = fma(_705, _751, _805);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _825 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _827 = -_813;
    float _829 = fma(_803, 2.0, _827);
    float _831 = 1.0 / _821;
    float _833 = fma(_817, -2.0, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _843 = _765 > 0.5;
    float _845 = fma(_709, _735, _807);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _847;
    float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _855 = fma(_709, _755, _811);
    float _857 = -_183;
    int _859 = _767 ? as_type<int>(_857) : as_type<int>(_183);
    float _861 = -_123;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[76].x, _829);
    float _865 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _853);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _869 = _703 + _867;
    float _871 = 1.0 / _849;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _873;
    float _877 = _749 * _831;
    bool _879 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _881 = isnan(_703);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _893 = _703 + _891;
    float _895 = _809 + _721;
    float _897 = 1.0 / _837;
    float _899 = _845 + _737;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _901;
    float _905 = _855 + _757;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _907;
    float _911 = 1.0 / _841;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _915 = _703 + _913;
    float _917 = _915 * _759;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _921 = _703 + _919;
    float _923 = _869 * _769;
    float _925 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _929 = _703 + _927;
    float _931 = _921 * _785;
    float _933 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _833);
    float _935 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _865);
    float _937 = _929 * _871;
    bool _939 = !_745;
    float _941 = _939 ? _183 : as_type<float>(_859);
    float _943 = _851 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _945 = _713 * _897;
    float _947 = _941 + 0.5;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _957;
    float _961 = fma(_943, _947, _863);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _975 = fma(_951, _917, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _977 = fma(_959, _917, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _979 = fma(_965, _917, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _981;
    bool _985 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _987 = isnan(_703);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _997;
    float _1001 = fma(_955, _923, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1003 = fma(_969, _923, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1005 = fma(_973, _923, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1007 = fma(_983, _931, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1009 = fma(_999, _931, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1011 = -_995;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_875, _931, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1029 = _781 * _1013;
    float _1031 = -_781;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_1019, _877, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1037 = fma(_1023, _877, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1039 = fma(_1027, _877, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1041 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1043 = isnan(_703);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = _889 * _1033;
    float _1055 = -_889;
    float _1057 = _1055 + 1.0;
    bool _1059 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1061 = isnan(_703);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _893 * _911;
    bool _1073 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1075 = isnan(_703);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1051 * _1057;
    float _1087 = -_1051;
    float _1089 = _1087 + 1.0;
    float _1091 = -_1069;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_903, _945, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = _1069 * _1089;
    float _1103 = _797 * _1093;
    float _1105 = -_797;
    float _1107 = _1105 + 1.0;
    bool _1109 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1111 = isnan(_703);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1129 = _1083 * _1107;
    float _1131 = fma(_909, _945, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1133 = _1119 * _1099;
    float _1135 = -_1119;
    float _1137 = _1135 + 1.0;
    float _1139 = fma(_1123, _945, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1145 = _975 * _1133;
    float _1147 = _977 * _1133;
    float _1149 = _979 * _1133;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1145);
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1147);
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1149);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1161 = fma(_1001, _1129, _1151);
    float _1163 = fma(_1003, _1129, _1153);
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1175;
    float _1179 = fma(_1127, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1181 = fma(_1143, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1183 = fma(_1159, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1185 = fma(_1005, _1129, _1155);
    float _1187 = fma(_1169, _937, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1189 = fma(_1177, _937, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1191 = fma(_1173, _937, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1193 = -_165;
    int _1195 = _843 ? as_type<int>(_1193) : as_type<int>(_165);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _895 + _1197;
    float _1201 = fma(_1015, _1103, _1185);
    float _1203 = fma(_1007, _1103, _1161);
    bool _1205 = !_763;
    float _1207 = _1205 ? _165 : as_type<float>(_1195);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1211 = _899 + _1209;
    float _1213 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = fma(_1039, _1101, _1201);
    float _1217 = fma(_1009, _1103, _1163);
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1221 = _905 + _1219;
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1213);
    float _1225 = fma(_1035, _1101, _1203);
    float _1227 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1229 = _1207 + (-0.5);
    float _1231 = fma(_1131, _1085, _1215);
    float _1233 = fma(_1037, _1101, _1217);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1223);
    float _1237 = -_1227;
    float _1239 = -_933;
    float _1241 = fma(_1237, _1229, _1239);
    float _1243 = fma(_1183, _1053, _1231);
    float _1245 = fma(_1139, _1085, _1225);
    float _1247 = fma(_1095, _1085, _1233);
    float _1249 = _1199 * _1199;
    bool _1251 = _1235 >= 0.0;
    float _1253 = fma(_1191, _1029, _1243);
    float _1255 = fma(_1179, _1053, _1245);
    float _1257 = fma(_1181, _1053, _1247);
    float _1259 = fma(_1211, _1211, _1249);
    float _1261 = -_925;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1187, _1029, _1255);
    float _1267 = fma(_1189, _1029, _1257);
    float _1269 = fma(_1221, _1221, _1259);
    float _1271 = -_935;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1265);
    float _1277 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1267);
    float _1279 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1253);
    float _1281 = rsqrt(_1269);
    float _1283 = -_1263;
    float _1285 = fma(_941, _1283, _961);
    float _1287 = fma(_1207, _1273, _1241);
    float _1289 = _961;
    if (_1251)
    {
        _1289 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1291 = _1289;
    float _1293 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1297 = _1279 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1299 = as_type<int>(_1291);
    if (_1251)
    {
        float _1301 = _1291 * 5.0;
        _1299 = as_type<int>(_1301);
    }
    int _1303 = _1299;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1285;
    out.m_64.y = _1287;
    float _1311 = as_type<float>(_1303);
    if (_1251)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4000 = as_type<float>(_1303);
        out.gl_Position.z = _4000;
    }
    float _1313 = _1199 * _1281;
    float _1315 = _1211 * _1281;
    out.m_66.x = _1305;
    out.m_66.y = _1307;
    out.m_66.z = _1309;
    if (_1251)
    {
        out.m_45.x = 0.0;
    }
    if (_1251)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1317 = -_1313;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _1321 = _1221 * _1281;
    float _1323 = -_1315;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _1327 = -_1313;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1333 = _1319 + _1331;
    float _1335 = -_1321;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1341 = _1325 + _1339;
    float _1343 = -_1315;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1211);
    float _1347 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1351 = _1337 + _1349;
    float _1353 = -_1321;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1357 = _249 * _675;
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1347);
    float _1361 = _1329 * _1329;
    float _1363 = _249 * _673;
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1359);
    float _1367 = fma(_1345, _1345, _1361);
    bool _1369 = _1365 >= 0.0;
    float _1371 = fma(_1355, _1355, _1367);
    float _1373 = sqrt(_1371);
    float _1375 = _1333;
    float _1377 = _1337;
    if (_1369)
    {
        _1311 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1379 = _1311;
    int _1381 = as_type<int>(_1379);
    if (_1369)
    {
        out.m_45.x = 0.0;
    }
    if (_1369)
    {
        float _1383 = _1379 * 5.0;
        _1381 = as_type<int>(_1383);
    }
    int _1385 = _1381;
    float _1387 = _1281 * _1373;
    if (_1369)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4151 = as_type<float>(_1385);
        out.gl_Position.z = _4151;
    }
    if (_1369)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1389 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1393 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1397 = _1387 * _1389;
    float _1399 = _1387 * _1393;
    float _1401 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1403 = _1401 * 0.5;
    float _1405 = _1391 * _1397;
    bool _1407 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1415 = _1411 || _1413;
    float _1417 = _1395 * _1399;
    float _1419 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1423 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1419);
    float _1425 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1421);
    float _1427 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1423);
    float _1429 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1425);
    float _1431 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1433 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1435 = _905 + _1431;
    float _1437 = _899 + _1433;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1441 = _1435 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1445 = _1437 + _1443;
    float _1447 = _1441 * _1441;
    float _1449 = fma(_1445, _1445, _1447);
    float _1451 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1453 = sqrt(_1449);
    float _1455 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1451);
    float _1457 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1455);
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1461 = _895 + _1459;
    bool _1463 = _1453 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1465 = _1459;
    float _1467 = _1437;
    float _1469 = _1435;
    if (!_1463)
    {
        _1465 = _1461;
    }
    float _1471 = _1465;
    bool _1473 = !_1463;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1453 + _1479;
        float _1483 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1485 = _1481 * _1477;
        float _1487 = rsqrt(_1449);
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = _1493 + (-1.0);
        float _1501 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = fma(_1497, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1505 = fma(_1461, _1493, _1501);
        float _1507 = _1487 * _1503;
        float _1509 = fma(_1445, _1507, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1511 = fma(_1441, _1507, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1467 = _1509;
        _1475 = _1505;
        _1469 = _1511;
    }
    float _1513 = _1467;
    float _1515 = _1475;
    float _1517 = _1469;
    float _1519 = -_1315;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1513);
    float _1523 = -_1313;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1527 = -_1321;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1517);
    float _1531 = _1525;
    float _1533 = _1521;
    float _1535 = _1529;
    if (!_1415)
    {
        float _1537 = _1333 * _1333;
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1541 = -_895;
        float _1543 = _1541 + _1515;
        float _1545 = -_905;
        float _1547 = _1545 + _1517;
        float _1549 = fma(_1341, _1341, _1537);
        float _1551 = fma(_1351, _1351, _1549);
        float _1553 = 1.0 / _1387;
        float _1555 = sqrt(_1551);
        float _1557 = precise::min(_1555, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1559 = _1557 * _1539;
        float _1561 = -_899;
        float _1563 = _1561 + _1513;
        float _1565 = _1559 * _1553;
        float _1567 = fma(_1563, _1565, _1325);
        float _1569 = fma(_1543, _1565, _1319);
        float _1571 = fma(_1547, _1565, _1337);
        _1531 = _1569;
        _1533 = _1567;
        _1535 = _1571;
    }
    float _1573 = _1531;
    float _1575 = _1533;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = _1575 + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1589 = _1577 + _1587;
    float _1591 = _1581 * _1581;
    float _1593 = fma(_1585, _1585, _1591);
    float _1595 = fma(_1589, _1589, _1593);
    float _1597 = rsqrt(_1595);
    float _1599 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1601 = _1585 * _1599;
    float _1603 = _1589 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 * _1603;
    float _1609 = _1605 + _1607;
    float _1611 = sqrt(_1609);
    bool _1613 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1617 = _1611 + _1615;
    float _1619 = _1589;
    float _1621 = _1609;
    float _1623 = _1617;
    float _1625 = _1581;
    float _1627 = _1601;
    if (_1613)
    {
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (_1613)
    {
        float _1633 = rsqrt(_1609);
        _1621 = _1633;
    }
    float _1635 = _1621;
    if (_1613)
    {
        float _1637 = _1617 * _1631;
        _1623 = _1637;
    }
    float _1639 = _1623;
    if (_1613)
    {
        float _1641 = _1639 * 0.15915493667125701904296875;
        _1375 = _1641;
    }
    float _1643 = _1375;
    float _1645 = _1591;
    if (_1613)
    {
        float _1647 = _1643 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1655 = precise::max(0.0, _1653);
    float _1657 = _1597;
    float _1659 = _1655;
    float _1661 = _1653;
    if (_1613)
    {
        float _1663 = _1643 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        _1657 = _1665;
    }
    float _1667 = _1657;
    float _1669 = -_1599;
    float _1671 = -_1655;
    float _1673 = fma(_1581, _1669, _1671);
    float _1675 = _1673;
    if (!_1613)
    {
        _1659 = _1603;
    }
    float _1677 = _1659;
    float _1679 = _1677;
    if (!_1613)
    {
        _1625 = _1607;
    }
    float _1681 = _1625;
    float _1683 = _1681;
    if (_1613)
    {
        float _1685 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1685;
    }
    float _1687 = _1661;
    float _1689 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1691 = _1651;
    float _1693 = _1687;
    if (_1613)
    {
        float _1695 = fma(_1651, _1687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1691 = _1695;
    }
    float _1697 = _1691;
    float _1699 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1689);
    float _1701 = _1697;
    if (_1613)
    {
        float _1703 = _1667 + (-1.0);
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1613)
    {
        float _1709 = _1635 * _1697;
        _1377 = _1709;
    }
    float _1711 = _1377;
    float _1713 = sqrt(_1595);
    if (_1613)
    {
        float _1715 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1715;
    }
    float _1717 = _1701;
    if (_1613)
    {
        float _1719 = _1601 * _1711;
        _1627 = _1719;
    }
    float _1721 = _1627;
    if (!_1613)
    {
        _1707 = _1605;
    }
    float _1723 = _1707;
    float _1725 = _1723;
    if (_1613)
    {
        float _1727 = _1603 * _1711;
        _1679 = _1727;
    }
    float _1729 = _1679;
    if (_1613)
    {
        float _1731 = fma(_1673, _1667, _1717);
        _1675 = _1731;
    }
    float _1733 = _1675;
    if (_1613)
    {
        float _1735 = _1721 * _1721;
        _1725 = _1735;
    }
    float _1737 = _1725;
    if (_1613)
    {
        float _1739 = _1729 * _1729;
        _1683 = _1739;
    }
    float _1741 = _1683;
    float _1743 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1745 = fma(_1733, _1733, _1737);
    float _1747 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1749 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1743);
    float _1751 = _1745 + _1741;
    float _1753 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1747);
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1757 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1755);
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1763 = rsqrt(_1751);
    float _1765 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1767 = -_1759;
    float _1769 = _1767 + 1.0;
    float _1771 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1775 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1777 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1771);
    float _1779 = abs(_1769);
    float _1781 = log2(_1779);
    float _1783 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1749);
    float _1785 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1787 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1789 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1699);
    float _1791 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1793 = -_1785;
    float _1795 = fma(_1793, _1773, 1.0);
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1799 = _1763 * _1721;
    float _1801 = _1763 * _1733;
    float _1803 = _1763 * _1729;
    float _1805 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1797);
    float _1807 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1809 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1811 = log2(_1795);
    float _1813 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1805);
    float _1815 = -_1807;
    float _1817 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1815);
    float _1819 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1825 = -_1803;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1817);
    float _1829 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1831 = exp2(_1819);
    float _1833 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1835 = fma(_1827, -0.5, 0.5);
    float _1837 = fma(_1827, 0.5, 0.5);
    float _1839 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1829);
    float _1841 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1833);
    float _1843 = _1801 + 1.0;
    float _1845 = fma(_1837, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1847 = 1.0 / _1823;
    float _1849 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1839);
    float _1851 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1841);
    float _1853 = fma(_1837, _1845, -0.212114393711090087890625);
    float _1855 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1849);
    float _1857 = fma(_1837, _1853, 1.570728778839111328125);
    float _1859 = sqrt(_1835);
    float _1861 = -_1801;
    float _1863 = fma(_1831, _1843, _1861);
    float _1865 = _1811 * 0.693147182464599609375;
    float _1867 = fma(_1863, 0.5, 0.5);
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1871 = _1851 * _1847;
    float _1873 = _1855 * _1847;
    float _1875 = fma(_1871, 0.5, 0.5);
    float _1877 = fma(_1873, -0.5, 0.5);
    float _1879 = _1859 * 0.636619746685028076171875;
    float3 _4969 = float3(_1875, _1877, _1869);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4969, float3(0.0), isnan(_4969)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4969, float3(0.0), isnan(_4969)), level(0.0)).x;
    float3 _4980 = float3(_1875, _1877, _1869);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4980, float3(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4980, float3(0.0), isnan(_4980)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float _1894 = -_1857;
    float _1896 = fma(_1879, _1894, 1.0);
    float2 _5002 = float2(_1896, _1867);
    float3 _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5002, float2(0.0), isnan(_5002)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5002, float2(0.0), isnan(_5002)), level(0.0)).xyz;
    float _1902 = _1900.x;
    float _1904 = _1900.y;
    float _1906 = _1900.z;
    float _1908 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1910 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1912 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1910);
    float _1914 = exp2(_1908);
    float _1916 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1912);
    float _1918 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1916);
    float _1920 = _1918 + _1823;
    float _1922 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1851;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1823;
    float _1924 = _1920 * 0.5;
    float _1926 = -_1914;
    float _1928 = _1926 + 1.0;
    out.m_45.x = _1922;
    float _1930 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1924;
    out.m_68.w = _1823;
    float _1932 = _1930 * _1881;
    float _1934 = -_1930;
    float _1936 = _1934 + 1.0;
    float _1938 = _1892 * _1932;
    float _1940 = _1892 * _1936;
    float _1942 = _1906 * _1932;
    float _1944 = fma(_1902, _1938, _1886);
    float _1946 = fma(_1904, _1938, _1888);
    float _1948 = fma(_1892, _1942, _1890);
    out.m_70.x = _1944;
    out.m_70.y = _1946;
    out.m_70.z = _1948;
    out.m_70.w = _1940;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _695 = false;
    bool _507 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_105);
        out.gl_Position.z = _2005;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_141);
        out.gl_Position.z = _2074;
    }
    if (_133)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = in.m_52.x;
    float _151 = _147 * _145;
    int _153 = as_type<int>(_143) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_143) & 2;
    bool _159 = _157 != 0;
    float _161 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    bool _163 = !_159;
    float _165 = _163 ? (-0.5) : 0.5;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 6.283185482025146484375;
    float _177 = floor(_161);
    float _179 = _175 * 0.15915493667125701904296875;
    bool _181 = !_155;
    float _183 = _181 ? (-0.5) : 0.5;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_169;
    int _191 = _189 ? 0 : 1;
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_191);
    int _203 = abs(_199);
    float _205 = -_177;
    float _207 = _161 + _205;
    float _209 = float(_201);
    float _211 = -_207;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_173;
    int _219 = _217 ? 0 : 1;
    float _221 = fma(_195, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _209 * _223;
    bool _227 = _207 < 0.5;
    float _229 = float(_227);
    int _231 = abs(_219);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_203);
    float _239 = -_229;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_231);
    float _245 = fma(_237, _235, _225);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_215;
    float _267;
    if (!_251)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_89);
        float _273 = 1.0 / _271;
        float _275 = _123 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _277 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = 1.0 / _293;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _301;
    float _313 = 1.0 / _297;
    float _315 = _285 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _319 = _277 + _317;
    float _321 = 1.0 / _305;
    float _323 = _281 * _311;
    bool _325 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_277);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -_335;
    float _339 = _337 + 1.0;
    float _341 = _289 * _313;
    bool _343 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_277);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_277);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _353 * _339;
    bool _369 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_277);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _319 * _321;
    float _383 = -_353;
    float _385 = _383 + 1.0;
    bool _387 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_277);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = _365 * _385;
    float _409 = -_365;
    float _411 = _409 + 1.0;
    float _413 = fma(_401, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_405, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = _379 * _411;
    float _423 = -_379;
    float _425 = _423 + 1.0;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_397;
    float _433 = _431 + 1.0;
    float _435 = fma(_419, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = _397 * _425;
    float _439 = fma(_429, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = _413 * _437;
    float _451 = _415 * _437;
    float _453 = fma(_443, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _463 = fma(_447, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _469 = fma(_439, _421, _459);
    float _471 = fma(_435, _421, _461);
    float _473 = fma(_457, _381, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _475 = fma(_467, _381, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _477 = fma(_453, _407, _469);
    float _479 = fma(_463, _407, _471);
    float _481 = fma(_473, _367, _477);
    float _483 = fma(_475, _367, _479);
    float _485 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _481);
    float _487 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _483);
    bool _489 = !_309;
    float _505;
    if (!_489)
    {
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _493 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _123 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _515 + _517;
    bool _521 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _523 = isnan(_515);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _535 = _515 + _533;
    bool _537 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _539 = isnan(_515);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _557 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _559 = isnan(_515);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _551;
    float _571 = -_567;
    float _573 = _571 + 1.0;
    bool _575 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _577 = _547 * _573;
    float _579 = -_547;
    float _581 = _579 + 1.0;
    float _583 = 1.0 / _555;
    float _585 = _519 * _569;
    float _587 = -_531;
    float _589 = _587 + 1.0;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _591;
    float _595 = _567 * _589;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _601;
    float _605 = fma(_593, _585, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _607 = _535 * _583;
    float _609 = fma(_599, _585, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _611 = fma(_603, _585, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _613 = _605 * _577;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _619 = _609 * _577;
    float _621 = _611 * _577;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _631 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].x, _619);
    float _633 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].y, _613);
    float _635 = fma(_625, _607, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _637 = fma(_617, _607, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _639 = fma(_629, _607, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _641 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].z, _621);
    float _643 = fma(_635, _595, _631);
    float _645 = fma(_637, _595, _633);
    float _647 = fma(_639, _595, _641);
    float _649 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].x, _643);
    float _651 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].y, _645);
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].z, _647);
    float _659 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _661 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _667;
    out.m_56.y = _669;
    out.m_56.z = _671;
    out.m_56.w = _663;
    float _673 = _487 * _655;
    float _675 = _485 * _653;
    bool _677 = !_575;
    float _693;
    if (!_677)
    {
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _681 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = in.m_42.x;
    float _707 = in.m_42.y;
    float _709 = in.m_42.z;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _713 = _703 + _711;
    float _715 = in.m_58.x;
    float _717 = in.m_58.y;
    float _719 = in.m_58.z;
    float _721 = in.m_58.w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _731 = in.m_60.x;
    float _733 = in.m_60.y;
    float _735 = in.m_60.z;
    float _737 = in.m_60.w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _739;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _745 = _743 != 0;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _749 = _703 + _747;
    float _751 = in.m_62.x;
    float _753 = in.m_62.y;
    float _755 = in.m_62.z;
    float _757 = in.m_62.w;
    float _759 = 1.0 / _725;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _763 = _761 != 0;
    float _765 = in.m_52.y;
    bool _767 = _149 > 0.5;
    float _769 = 1.0 / _729;
    bool _771 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _773 = isnan(_703);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _707 * _717;
    float _785 = 1.0 / _741;
    bool _787 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = isnan(_703);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = fma(_705, _715, _783);
    float _801 = _707 * _733;
    float _803 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _805 = _707 * _753;
    float _807 = fma(_705, _731, _801);
    float _809 = fma(_709, _719, _799);
    float _811 = fma(_705, _751, _805);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _825 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _827 = -_813;
    float _829 = fma(_803, 2.0, _827);
    float _831 = 1.0 / _821;
    float _833 = fma(_817, -2.0, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _843 = _765 > 0.5;
    float _845 = fma(_709, _735, _807);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _847;
    float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _855 = fma(_709, _755, _811);
    float _857 = -_183;
    int _859 = _767 ? as_type<int>(_857) : as_type<int>(_183);
    float _861 = -_123;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[76].x, _829);
    float _865 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _853);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _869 = _703 + _867;
    float _871 = 1.0 / _849;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _873;
    float _877 = _749 * _831;
    bool _879 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _881 = isnan(_703);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _893 = _703 + _891;
    float _895 = _809 + _721;
    float _897 = 1.0 / _837;
    float _899 = _845 + _737;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _901;
    float _905 = _855 + _757;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _907;
    float _911 = 1.0 / _841;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _915 = _703 + _913;
    float _917 = _915 * _759;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _921 = _703 + _919;
    float _923 = _869 * _769;
    float _925 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _929 = _703 + _927;
    float _931 = _921 * _785;
    float _933 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _833);
    float _935 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _865);
    float _937 = _929 * _871;
    bool _939 = !_745;
    float _941 = _939 ? _183 : as_type<float>(_859);
    float _943 = _851 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _945 = _713 * _897;
    float _947 = _941 + 0.5;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _957;
    float _961 = fma(_943, _947, _863);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _975 = fma(_951, _917, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _977 = fma(_959, _917, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _979 = fma(_965, _917, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _981;
    bool _985 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _987 = isnan(_703);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _997;
    float _1001 = fma(_955, _923, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1003 = fma(_969, _923, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1005 = fma(_973, _923, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1007 = fma(_983, _931, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1009 = fma(_999, _931, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1011 = -_995;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_875, _931, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1029 = _781 * _1013;
    float _1031 = -_781;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_1019, _877, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1037 = fma(_1023, _877, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1039 = fma(_1027, _877, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1041 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1043 = isnan(_703);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = _889 * _1033;
    float _1055 = -_889;
    float _1057 = _1055 + 1.0;
    bool _1059 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1061 = isnan(_703);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _893 * _911;
    bool _1073 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1075 = isnan(_703);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1051 * _1057;
    float _1087 = -_1051;
    float _1089 = _1087 + 1.0;
    float _1091 = -_1069;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_903, _945, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = _1069 * _1089;
    float _1103 = _797 * _1093;
    float _1105 = -_797;
    float _1107 = _1105 + 1.0;
    bool _1109 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1111 = isnan(_703);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1129 = _1083 * _1107;
    float _1131 = fma(_909, _945, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1133 = _1119 * _1099;
    float _1135 = -_1119;
    float _1137 = _1135 + 1.0;
    float _1139 = fma(_1123, _945, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1145 = _975 * _1133;
    float _1147 = _977 * _1133;
    float _1149 = _979 * _1133;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1145);
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1147);
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1149);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1161 = fma(_1001, _1129, _1151);
    float _1163 = fma(_1003, _1129, _1153);
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1175;
    float _1179 = fma(_1127, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1181 = fma(_1143, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1183 = fma(_1159, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1185 = fma(_1005, _1129, _1155);
    float _1187 = fma(_1169, _937, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1189 = fma(_1177, _937, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1191 = fma(_1173, _937, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1193 = -_165;
    int _1195 = _843 ? as_type<int>(_1193) : as_type<int>(_165);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _895 + _1197;
    float _1201 = fma(_1015, _1103, _1185);
    float _1203 = fma(_1007, _1103, _1161);
    bool _1205 = !_763;
    float _1207 = _1205 ? _165 : as_type<float>(_1195);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1211 = _899 + _1209;
    float _1213 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = fma(_1039, _1101, _1201);
    float _1217 = fma(_1009, _1103, _1163);
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1221 = _905 + _1219;
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1213);
    float _1225 = fma(_1035, _1101, _1203);
    float _1227 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1229 = _1207 + (-0.5);
    float _1231 = fma(_1131, _1085, _1215);
    float _1233 = fma(_1037, _1101, _1217);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1223);
    float _1237 = -_1227;
    float _1239 = -_933;
    float _1241 = fma(_1237, _1229, _1239);
    float _1243 = fma(_1183, _1053, _1231);
    float _1245 = fma(_1139, _1085, _1225);
    float _1247 = fma(_1095, _1085, _1233);
    float _1249 = _1199 * _1199;
    bool _1251 = _1235 >= 0.0;
    float _1253 = fma(_1191, _1029, _1243);
    float _1255 = fma(_1179, _1053, _1245);
    float _1257 = fma(_1181, _1053, _1247);
    float _1259 = fma(_1211, _1211, _1249);
    float _1261 = -_925;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1187, _1029, _1255);
    float _1267 = fma(_1189, _1029, _1257);
    float _1269 = fma(_1221, _1221, _1259);
    float _1271 = -_935;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1265);
    float _1277 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1267);
    float _1279 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1253);
    float _1281 = rsqrt(_1269);
    float _1283 = -_1263;
    float _1285 = fma(_941, _1283, _961);
    float _1287 = fma(_1207, _1273, _1241);
    float _1289 = _961;
    if (_1251)
    {
        _1289 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1291 = _1289;
    float _1293 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1297 = _1279 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1299 = as_type<int>(_1291);
    if (_1251)
    {
        float _1301 = _1291 * 5.0;
        _1299 = as_type<int>(_1301);
    }
    int _1303 = _1299;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1285;
    out.m_64.y = _1287;
    float _1311 = as_type<float>(_1303);
    if (_1251)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4000 = as_type<float>(_1303);
        out.gl_Position.z = _4000;
    }
    float _1313 = _1199 * _1281;
    float _1315 = _1211 * _1281;
    out.m_66.x = _1305;
    out.m_66.y = _1307;
    out.m_66.z = _1309;
    if (_1251)
    {
        out.m_45.x = 0.0;
    }
    if (_1251)
    {
        return out;
    }
    float _1317 = -_1313;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _1321 = _1221 * _1281;
    float _1323 = -_1315;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _1327 = -_1313;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1333 = _1319 + _1331;
    float _1335 = -_1321;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1341 = _1325 + _1339;
    float _1343 = -_1315;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1211);
    float _1347 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1351 = _1337 + _1349;
    float _1353 = -_1321;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1357 = _249 * _675;
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1347);
    float _1361 = _1329 * _1329;
    float _1363 = _249 * _673;
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1359);
    float _1367 = fma(_1345, _1345, _1361);
    bool _1369 = _1365 >= 0.0;
    float _1371 = fma(_1355, _1355, _1367);
    float _1373 = sqrt(_1371);
    float _1375 = _1333;
    float _1377 = _1337;
    if (_1369)
    {
        _1311 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1379 = _1311;
    int _1381 = as_type<int>(_1379);
    if (_1369)
    {
        out.m_45.x = 0.0;
    }
    if (_1369)
    {
        float _1383 = _1379 * 5.0;
        _1381 = as_type<int>(_1383);
    }
    int _1385 = _1381;
    float _1387 = _1281 * _1373;
    if (_1369)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4151 = as_type<float>(_1385);
        out.gl_Position.z = _4151;
    }
    if (_1369)
    {
        return out;
    }
    float _1389 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1393 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1397 = _1387 * _1389;
    float _1399 = _1387 * _1393;
    float _1401 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1403 = _1401 * 0.5;
    float _1405 = _1391 * _1397;
    bool _1407 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1415 = _1411 || _1413;
    float _1417 = _1395 * _1399;
    float _1419 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1423 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1419);
    float _1425 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1421);
    float _1427 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1423);
    float _1429 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1425);
    float _1431 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1433 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1435 = _905 + _1431;
    float _1437 = _899 + _1433;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1441 = _1435 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1445 = _1437 + _1443;
    float _1447 = _1441 * _1441;
    float _1449 = fma(_1445, _1445, _1447);
    float _1451 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1453 = sqrt(_1449);
    float _1455 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1451);
    float _1457 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1455);
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1461 = _895 + _1459;
    bool _1463 = _1453 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1465 = _1459;
    float _1467 = _1437;
    float _1469 = _1435;
    if (!_1463)
    {
        _1465 = _1461;
    }
    float _1471 = _1465;
    bool _1473 = !_1463;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1453 + _1479;
        float _1483 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1485 = _1481 * _1477;
        float _1487 = rsqrt(_1449);
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = _1493 + (-1.0);
        float _1501 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = fma(_1497, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1505 = fma(_1461, _1493, _1501);
        float _1507 = _1487 * _1503;
        float _1509 = fma(_1445, _1507, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1511 = fma(_1441, _1507, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1467 = _1509;
        _1475 = _1505;
        _1469 = _1511;
    }
    float _1513 = _1467;
    float _1515 = _1475;
    float _1517 = _1469;
    float _1519 = -_1315;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1513);
    float _1523 = -_1313;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1527 = -_1321;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1517);
    float _1531 = _1525;
    float _1533 = _1521;
    float _1535 = _1529;
    if (!_1415)
    {
        float _1537 = _1333 * _1333;
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1541 = -_895;
        float _1543 = _1541 + _1515;
        float _1545 = -_905;
        float _1547 = _1545 + _1517;
        float _1549 = fma(_1341, _1341, _1537);
        float _1551 = fma(_1351, _1351, _1549);
        float _1553 = 1.0 / _1387;
        float _1555 = sqrt(_1551);
        float _1557 = precise::min(_1555, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1559 = _1557 * _1539;
        float _1561 = -_899;
        float _1563 = _1561 + _1513;
        float _1565 = _1559 * _1553;
        float _1567 = fma(_1563, _1565, _1325);
        float _1569 = fma(_1543, _1565, _1319);
        float _1571 = fma(_1547, _1565, _1337);
        _1531 = _1569;
        _1533 = _1567;
        _1535 = _1571;
    }
    float _1573 = _1531;
    float _1575 = _1533;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = _1575 + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1589 = _1577 + _1587;
    float _1591 = _1581 * _1581;
    float _1593 = fma(_1585, _1585, _1591);
    float _1595 = fma(_1589, _1589, _1593);
    float _1597 = rsqrt(_1595);
    float _1599 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1601 = _1585 * _1599;
    float _1603 = _1589 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 * _1603;
    float _1609 = _1605 + _1607;
    float _1611 = sqrt(_1609);
    bool _1613 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1617 = _1611 + _1615;
    float _1619 = _1589;
    float _1621 = _1609;
    float _1623 = _1617;
    float _1625 = _1581;
    float _1627 = _1601;
    if (_1613)
    {
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (_1613)
    {
        float _1633 = rsqrt(_1609);
        _1621 = _1633;
    }
    float _1635 = _1621;
    if (_1613)
    {
        float _1637 = _1617 * _1631;
        _1623 = _1637;
    }
    float _1639 = _1623;
    if (_1613)
    {
        float _1641 = _1639 * 0.15915493667125701904296875;
        _1375 = _1641;
    }
    float _1643 = _1375;
    float _1645 = _1591;
    if (_1613)
    {
        float _1647 = _1643 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1655 = precise::max(0.0, _1653);
    float _1657 = _1597;
    float _1659 = _1655;
    float _1661 = _1653;
    if (_1613)
    {
        float _1663 = _1643 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        _1657 = _1665;
    }
    float _1667 = _1657;
    float _1669 = -_1599;
    float _1671 = -_1655;
    float _1673 = fma(_1581, _1669, _1671);
    float _1675 = _1673;
    if (!_1613)
    {
        _1659 = _1603;
    }
    float _1677 = _1659;
    float _1679 = _1677;
    if (!_1613)
    {
        _1625 = _1607;
    }
    float _1681 = _1625;
    float _1683 = _1681;
    if (_1613)
    {
        float _1685 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1685;
    }
    float _1687 = _1661;
    float _1689 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1691 = _1651;
    float _1693 = _1687;
    if (_1613)
    {
        float _1695 = fma(_1651, _1687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1691 = _1695;
    }
    float _1697 = _1691;
    float _1699 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1689);
    float _1701 = _1697;
    if (_1613)
    {
        float _1703 = _1667 + (-1.0);
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1613)
    {
        float _1709 = _1635 * _1697;
        _1377 = _1709;
    }
    float _1711 = _1377;
    float _1713 = sqrt(_1595);
    if (_1613)
    {
        float _1715 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1715;
    }
    float _1717 = _1701;
    if (_1613)
    {
        float _1719 = _1601 * _1711;
        _1627 = _1719;
    }
    float _1721 = _1627;
    if (!_1613)
    {
        _1707 = _1605;
    }
    float _1723 = _1707;
    float _1725 = _1723;
    if (_1613)
    {
        float _1727 = _1603 * _1711;
        _1679 = _1727;
    }
    float _1729 = _1679;
    if (_1613)
    {
        float _1731 = fma(_1673, _1667, _1717);
        _1675 = _1731;
    }
    float _1733 = _1675;
    if (_1613)
    {
        float _1735 = _1721 * _1721;
        _1725 = _1735;
    }
    float _1737 = _1725;
    if (_1613)
    {
        float _1739 = _1729 * _1729;
        _1683 = _1739;
    }
    float _1741 = _1683;
    float _1743 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1745 = fma(_1733, _1733, _1737);
    float _1747 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1749 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1743);
    float _1751 = _1745 + _1741;
    float _1753 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1747);
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1757 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1755);
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1763 = rsqrt(_1751);
    float _1765 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1767 = -_1759;
    float _1769 = _1767 + 1.0;
    float _1771 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1775 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1777 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1771);
    float _1779 = abs(_1769);
    float _1781 = log2(_1779);
    float _1783 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1749);
    float _1785 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1787 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1789 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1699);
    float _1791 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1793 = -_1785;
    float _1795 = fma(_1793, _1773, 1.0);
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1799 = _1763 * _1721;
    float _1801 = _1763 * _1733;
    float _1803 = _1763 * _1729;
    float _1805 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1797);
    float _1807 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1809 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1811 = log2(_1795);
    float _1813 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1805);
    float _1815 = -_1807;
    float _1817 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1815);
    float _1819 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1825 = -_1803;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1817);
    float _1829 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1831 = exp2(_1819);
    float _1833 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1835 = fma(_1827, -0.5, 0.5);
    float _1837 = fma(_1827, 0.5, 0.5);
    float _1839 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1829);
    float _1841 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1833);
    float _1843 = _1801 + 1.0;
    float _1845 = fma(_1837, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1847 = 1.0 / _1823;
    float _1849 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1839);
    float _1851 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1841);
    float _1853 = fma(_1837, _1845, -0.212114393711090087890625);
    float _1855 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1849);
    float _1857 = fma(_1837, _1853, 1.570728778839111328125);
    float _1859 = sqrt(_1835);
    float _1861 = -_1801;
    float _1863 = fma(_1831, _1843, _1861);
    float _1865 = _1811 * 0.693147182464599609375;
    float _1867 = fma(_1863, 0.5, 0.5);
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1871 = _1851 * _1847;
    float _1873 = _1855 * _1847;
    float _1875 = fma(_1871, 0.5, 0.5);
    float _1877 = fma(_1873, -0.5, 0.5);
    float _1879 = _1859 * 0.636619746685028076171875;
    float3 _4969 = float3(_1875, _1877, _1869);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4969, float3(0.0), isnan(_4969)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4969, float3(0.0), isnan(_4969)), level(0.0)).x;
    float3 _4980 = float3(_1875, _1877, _1869);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4980, float3(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4980, float3(0.0), isnan(_4980)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float _1894 = -_1857;
    float _1896 = fma(_1879, _1894, 1.0);
    float2 _5002 = float2(_1896, _1867);
    float3 _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5002, float2(0.0), isnan(_5002)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5002, float2(0.0), isnan(_5002)), level(0.0)).xyz;
    float _1902 = _1900.x;
    float _1904 = _1900.y;
    float _1906 = _1900.z;
    float _1908 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1910 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1912 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1910);
    float _1914 = exp2(_1908);
    float _1916 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1912);
    float _1918 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1916);
    float _1920 = _1918 + _1823;
    float _1922 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1851;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1823;
    float _1924 = _1920 * 0.5;
    float _1926 = -_1914;
    float _1928 = _1926 + 1.0;
    out.m_45.x = _1922;
    float _1930 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1924;
    out.m_68.w = _1823;
    float _1932 = _1930 * _1881;
    float _1934 = -_1930;
    float _1936 = _1934 + 1.0;
    float _1938 = _1892 * _1932;
    float _1940 = _1892 * _1936;
    float _1942 = _1906 * _1932;
    float _1944 = fma(_1902, _1938, _1886);
    float _1946 = fma(_1904, _1938, _1888);
    float _1948 = fma(_1892, _1942, _1890);
    out.m_70.x = _1944;
    out.m_70.y = _1946;
    out.m_70.z = _1948;
    out.m_70.w = _1940;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _695 = false;
    bool _507 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_105);
        out.gl_Position.z = _2005;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_141);
        out.gl_Position.z = _2074;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = in.m_52.x;
    float _151 = _147 * _145;
    int _153 = as_type<int>(_143) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_143) & 2;
    bool _159 = _157 != 0;
    float _161 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    bool _163 = !_159;
    float _165 = _163 ? (-0.5) : 0.5;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 6.283185482025146484375;
    float _177 = floor(_161);
    float _179 = _175 * 0.15915493667125701904296875;
    bool _181 = !_155;
    float _183 = _181 ? (-0.5) : 0.5;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_169;
    int _191 = _189 ? 0 : 1;
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_191);
    int _203 = abs(_199);
    float _205 = -_177;
    float _207 = _161 + _205;
    float _209 = float(_201);
    float _211 = -_207;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_173;
    int _219 = _217 ? 0 : 1;
    float _221 = fma(_195, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _209 * _223;
    bool _227 = _207 < 0.5;
    float _229 = float(_227);
    int _231 = abs(_219);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_203);
    float _239 = -_229;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_231);
    float _245 = fma(_237, _235, _225);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    bool _251 = !_215;
    float _267;
    if (!_251)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_89);
        float _273 = 1.0 / _271;
        float _275 = _123 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _277 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _277 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _277 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = 1.0 / _293;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _301;
    float _313 = 1.0 / _297;
    float _315 = _285 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _319 = _277 + _317;
    float _321 = 1.0 / _305;
    float _323 = _281 * _311;
    bool _325 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_277);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -_335;
    float _339 = _337 + 1.0;
    float _341 = _289 * _313;
    bool _343 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_277);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_277);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _353 * _339;
    bool _369 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_277);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _319 * _321;
    float _383 = -_353;
    float _385 = _383 + 1.0;
    bool _387 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_277);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = _365 * _385;
    float _409 = -_365;
    float _411 = _409 + 1.0;
    float _413 = fma(_401, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_405, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = _379 * _411;
    float _423 = -_379;
    float _425 = _423 + 1.0;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = -_397;
    float _433 = _431 + 1.0;
    float _435 = fma(_419, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = _397 * _425;
    float _439 = fma(_429, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = _413 * _437;
    float _451 = _415 * _437;
    float _453 = fma(_443, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _463 = fma(_447, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _469 = fma(_439, _421, _459);
    float _471 = fma(_435, _421, _461);
    float _473 = fma(_457, _381, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _475 = fma(_467, _381, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _477 = fma(_453, _407, _469);
    float _479 = fma(_463, _407, _471);
    float _481 = fma(_473, _367, _477);
    float _483 = fma(_475, _367, _479);
    float _485 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _481);
    float _487 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _483);
    bool _489 = !_309;
    float _505;
    if (!_489)
    {
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _493 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _123 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _515 + _517;
    bool _521 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _523 = isnan(_515);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _535 = _515 + _533;
    bool _537 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _539 = isnan(_515);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _557 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _559 = isnan(_515);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _551;
    float _571 = -_567;
    float _573 = _571 + 1.0;
    bool _575 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _577 = _547 * _573;
    float _579 = -_547;
    float _581 = _579 + 1.0;
    float _583 = 1.0 / _555;
    float _585 = _519 * _569;
    float _587 = -_531;
    float _589 = _587 + 1.0;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _591;
    float _595 = _567 * _589;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _601;
    float _605 = fma(_593, _585, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _607 = _535 * _583;
    float _609 = fma(_599, _585, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _611 = fma(_603, _585, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _613 = _605 * _577;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _619 = _609 * _577;
    float _621 = _611 * _577;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _631 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].x, _619);
    float _633 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].y, _613);
    float _635 = fma(_625, _607, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _637 = fma(_617, _607, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _639 = fma(_629, _607, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _641 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[107].z, _621);
    float _643 = fma(_635, _595, _631);
    float _645 = fma(_637, _595, _633);
    float _647 = fma(_639, _595, _641);
    float _649 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].x, _643);
    float _651 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].y, _645);
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[109].z, _647);
    float _659 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _661 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _667;
    out.m_56.y = _669;
    out.m_56.z = _671;
    out.m_56.w = _663;
    float _673 = _487 * _655;
    float _675 = _485 * _653;
    bool _677 = !_575;
    float _693;
    if (!_677)
    {
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _681 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_89);
        float _699 = 1.0 / _697;
        float _701 = _123 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = in.m_42.x;
    float _707 = in.m_42.y;
    float _709 = in.m_42.z;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _713 = _703 + _711;
    float _715 = in.m_58.x;
    float _717 = in.m_58.y;
    float _719 = in.m_58.z;
    float _721 = in.m_58.w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _731 = in.m_60.x;
    float _733 = in.m_60.y;
    float _735 = in.m_60.z;
    float _737 = in.m_60.w;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _739;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _745 = _743 != 0;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _749 = _703 + _747;
    float _751 = in.m_62.x;
    float _753 = in.m_62.y;
    float _755 = in.m_62.z;
    float _757 = in.m_62.w;
    float _759 = 1.0 / _725;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _763 = _761 != 0;
    float _765 = in.m_52.y;
    bool _767 = _149 > 0.5;
    float _769 = 1.0 / _729;
    bool _771 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _773 = isnan(_703);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _707 * _717;
    float _785 = 1.0 / _741;
    bool _787 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = isnan(_703);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = fma(_705, _715, _783);
    float _801 = _707 * _733;
    float _803 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _805 = _707 * _753;
    float _807 = fma(_705, _731, _801);
    float _809 = fma(_709, _719, _799);
    float _811 = fma(_705, _751, _805);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = _765 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _825 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _827 = -_813;
    float _829 = fma(_803, 2.0, _827);
    float _831 = 1.0 / _821;
    float _833 = fma(_817, -2.0, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _843 = _765 > 0.5;
    float _845 = fma(_709, _735, _807);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _847;
    float _851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _855 = fma(_709, _755, _811);
    float _857 = -_183;
    int _859 = _767 ? as_type<int>(_857) : as_type<int>(_183);
    float _861 = -_123;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[76].x, _829);
    float _865 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[78].w, _853);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _869 = _703 + _867;
    float _871 = 1.0 / _849;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _873;
    float _877 = _749 * _831;
    bool _879 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _881 = isnan(_703);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _893 = _703 + _891;
    float _895 = _809 + _721;
    float _897 = 1.0 / _837;
    float _899 = _845 + _737;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _901;
    float _905 = _855 + _757;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _907;
    float _911 = 1.0 / _841;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _915 = _703 + _913;
    float _917 = _915 * _759;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _921 = _703 + _919;
    float _923 = _869 * _769;
    float _925 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _929 = _703 + _927;
    float _931 = _921 * _785;
    float _933 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _833);
    float _935 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _865);
    float _937 = _929 * _871;
    bool _939 = !_745;
    float _941 = _939 ? _183 : as_type<float>(_859);
    float _943 = _851 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _945 = _713 * _897;
    float _947 = _941 + 0.5;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _957;
    float _961 = fma(_943, _947, _863);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _975 = fma(_951, _917, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _977 = fma(_959, _917, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _979 = fma(_965, _917, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _981;
    bool _985 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _987 = isnan(_703);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _997;
    float _1001 = fma(_955, _923, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1003 = fma(_969, _923, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1005 = fma(_973, _923, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1007 = fma(_983, _931, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1009 = fma(_999, _931, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1011 = -_995;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_875, _931, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1029 = _781 * _1013;
    float _1031 = -_781;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_1019, _877, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1037 = fma(_1023, _877, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1039 = fma(_1027, _877, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1041 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1043 = isnan(_703);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = _889 * _1033;
    float _1055 = -_889;
    float _1057 = _1055 + 1.0;
    bool _1059 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1061 = isnan(_703);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _893 * _911;
    bool _1073 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1075 = isnan(_703);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1051 * _1057;
    float _1087 = -_1051;
    float _1089 = _1087 + 1.0;
    float _1091 = -_1069;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_903, _945, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = _1069 * _1089;
    float _1103 = _797 * _1093;
    float _1105 = -_797;
    float _1107 = _1105 + 1.0;
    bool _1109 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1111 = isnan(_703);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1117 = _1113 || _1115;
    float _1119 = float(_1117);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1129 = _1083 * _1107;
    float _1131 = fma(_909, _945, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1133 = _1119 * _1099;
    float _1135 = -_1119;
    float _1137 = _1135 + 1.0;
    float _1139 = fma(_1123, _945, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1145 = _975 * _1133;
    float _1147 = _977 * _1133;
    float _1149 = _979 * _1133;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1145);
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1147);
    float _1155 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1149);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1161 = fma(_1001, _1129, _1151);
    float _1163 = fma(_1003, _1129, _1153);
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1175;
    float _1179 = fma(_1127, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1181 = fma(_1143, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1183 = fma(_1159, _1071, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1185 = fma(_1005, _1129, _1155);
    float _1187 = fma(_1169, _937, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1189 = fma(_1177, _937, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1191 = fma(_1173, _937, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1193 = -_165;
    int _1195 = _843 ? as_type<int>(_1193) : as_type<int>(_165);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _895 + _1197;
    float _1201 = fma(_1015, _1103, _1185);
    float _1203 = fma(_1007, _1103, _1161);
    bool _1205 = !_763;
    float _1207 = _1205 ? _165 : as_type<float>(_1195);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1211 = _899 + _1209;
    float _1213 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = fma(_1039, _1101, _1201);
    float _1217 = fma(_1009, _1103, _1163);
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1221 = _905 + _1219;
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1213);
    float _1225 = fma(_1035, _1101, _1203);
    float _1227 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1229 = _1207 + (-0.5);
    float _1231 = fma(_1131, _1085, _1215);
    float _1233 = fma(_1037, _1101, _1217);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1223);
    float _1237 = -_1227;
    float _1239 = -_933;
    float _1241 = fma(_1237, _1229, _1239);
    float _1243 = fma(_1183, _1053, _1231);
    float _1245 = fma(_1139, _1085, _1225);
    float _1247 = fma(_1095, _1085, _1233);
    float _1249 = _1199 * _1199;
    bool _1251 = _1235 >= 0.0;
    float _1253 = fma(_1191, _1029, _1243);
    float _1255 = fma(_1179, _1053, _1245);
    float _1257 = fma(_1181, _1053, _1247);
    float _1259 = fma(_1211, _1211, _1249);
    float _1261 = -_925;
    float _1263 = _1261 + 1.0;
    float _1265 = fma(_1187, _1029, _1255);
    float _1267 = fma(_1189, _1029, _1257);
    float _1269 = fma(_1221, _1221, _1259);
    float _1271 = -_935;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1265);
    float _1277 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1267);
    float _1279 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1253);
    float _1281 = rsqrt(_1269);
    float _1283 = -_1263;
    float _1285 = fma(_941, _1283, _961);
    float _1287 = fma(_1207, _1273, _1241);
    float _1289 = _961;
    if (_1251)
    {
        _1289 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1291 = _1289;
    float _1293 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1297 = _1279 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1299 = as_type<int>(_1291);
    if (_1251)
    {
        float _1301 = _1291 * 5.0;
        _1299 = as_type<int>(_1301);
    }
    int _1303 = _1299;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1285;
    out.m_64.y = _1287;
    float _1311 = as_type<float>(_1303);
    if (_1251)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4000 = as_type<float>(_1303);
        out.gl_Position.z = _4000;
    }
    float _1313 = _1199 * _1281;
    float _1315 = _1211 * _1281;
    out.m_66.x = _1305;
    out.m_66.y = _1307;
    out.m_66.z = _1309;
    if (_1251)
    {
        out.m_45.x = 0.0;
    }
    if (_1251)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1317 = -_1313;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _1321 = _1221 * _1281;
    float _1323 = -_1315;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _1327 = -_1313;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1199);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1333 = _1319 + _1331;
    float _1335 = -_1321;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1341 = _1325 + _1339;
    float _1343 = -_1315;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1211);
    float _1347 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1351 = _1337 + _1349;
    float _1353 = -_1321;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1357 = _249 * _675;
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1347);
    float _1361 = _1329 * _1329;
    float _1363 = _249 * _673;
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1359);
    float _1367 = fma(_1345, _1345, _1361);
    bool _1369 = _1365 >= 0.0;
    float _1371 = fma(_1355, _1355, _1367);
    float _1373 = sqrt(_1371);
    float _1375 = _1333;
    float _1377 = _1337;
    if (_1369)
    {
        _1311 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1379 = _1311;
    int _1381 = as_type<int>(_1379);
    if (_1369)
    {
        out.m_45.x = 0.0;
    }
    if (_1369)
    {
        float _1383 = _1379 * 5.0;
        _1381 = as_type<int>(_1383);
    }
    int _1385 = _1381;
    float _1387 = _1281 * _1373;
    if (_1369)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4151 = as_type<float>(_1385);
        out.gl_Position.z = _4151;
    }
    if (_1369)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1389 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1391 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _1393 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1397 = _1387 * _1389;
    float _1399 = _1387 * _1393;
    float _1401 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1403 = _1401 * 0.5;
    float _1405 = _1391 * _1397;
    bool _1407 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1415 = _1411 || _1413;
    float _1417 = _1395 * _1399;
    float _1419 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1423 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1419);
    float _1425 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1421);
    float _1427 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1423);
    float _1429 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1425);
    float _1431 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1433 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1435 = _905 + _1431;
    float _1437 = _899 + _1433;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1441 = _1435 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1445 = _1437 + _1443;
    float _1447 = _1441 * _1441;
    float _1449 = fma(_1445, _1445, _1447);
    float _1451 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1453 = sqrt(_1449);
    float _1455 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1451);
    float _1457 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1455);
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1461 = _895 + _1459;
    bool _1463 = _1453 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1465 = _1459;
    float _1467 = _1437;
    float _1469 = _1435;
    if (!_1463)
    {
        _1465 = _1461;
    }
    float _1471 = _1465;
    bool _1473 = !_1463;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1453 + _1479;
        float _1483 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1485 = _1481 * _1477;
        float _1487 = rsqrt(_1449);
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = _1493 + (-1.0);
        float _1501 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = fma(_1497, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1505 = fma(_1461, _1493, _1501);
        float _1507 = _1487 * _1503;
        float _1509 = fma(_1445, _1507, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1511 = fma(_1441, _1507, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1467 = _1509;
        _1475 = _1505;
        _1469 = _1511;
    }
    float _1513 = _1467;
    float _1515 = _1475;
    float _1517 = _1469;
    float _1519 = -_1315;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1513);
    float _1523 = -_1313;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1527 = -_1321;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1517);
    float _1531 = _1525;
    float _1533 = _1521;
    float _1535 = _1529;
    if (!_1415)
    {
        float _1537 = _1333 * _1333;
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1541 = -_895;
        float _1543 = _1541 + _1515;
        float _1545 = -_905;
        float _1547 = _1545 + _1517;
        float _1549 = fma(_1341, _1341, _1537);
        float _1551 = fma(_1351, _1351, _1549);
        float _1553 = 1.0 / _1387;
        float _1555 = sqrt(_1551);
        float _1557 = precise::min(_1555, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1559 = _1557 * _1539;
        float _1561 = -_899;
        float _1563 = _1561 + _1513;
        float _1565 = _1559 * _1553;
        float _1567 = fma(_1563, _1565, _1325);
        float _1569 = fma(_1543, _1565, _1319);
        float _1571 = fma(_1547, _1565, _1337);
        _1531 = _1569;
        _1533 = _1567;
        _1535 = _1571;
    }
    float _1573 = _1531;
    float _1575 = _1533;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = _1575 + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1589 = _1577 + _1587;
    float _1591 = _1581 * _1581;
    float _1593 = fma(_1585, _1585, _1591);
    float _1595 = fma(_1589, _1589, _1593);
    float _1597 = rsqrt(_1595);
    float _1599 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1601 = _1585 * _1599;
    float _1603 = _1589 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 * _1603;
    float _1609 = _1605 + _1607;
    float _1611 = sqrt(_1609);
    bool _1613 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1617 = _1611 + _1615;
    float _1619 = _1589;
    float _1621 = _1609;
    float _1623 = _1617;
    float _1625 = _1581;
    float _1627 = _1601;
    if (_1613)
    {
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (_1613)
    {
        float _1633 = rsqrt(_1609);
        _1621 = _1633;
    }
    float _1635 = _1621;
    if (_1613)
    {
        float _1637 = _1617 * _1631;
        _1623 = _1637;
    }
    float _1639 = _1623;
    if (_1613)
    {
        float _1641 = _1639 * 0.15915493667125701904296875;
        _1375 = _1641;
    }
    float _1643 = _1375;
    float _1645 = _1591;
    if (_1613)
    {
        float _1647 = _1643 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1655 = precise::max(0.0, _1653);
    float _1657 = _1597;
    float _1659 = _1655;
    float _1661 = _1653;
    if (_1613)
    {
        float _1663 = _1643 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        _1657 = _1665;
    }
    float _1667 = _1657;
    float _1669 = -_1599;
    float _1671 = -_1655;
    float _1673 = fma(_1581, _1669, _1671);
    float _1675 = _1673;
    if (!_1613)
    {
        _1659 = _1603;
    }
    float _1677 = _1659;
    float _1679 = _1677;
    if (!_1613)
    {
        _1625 = _1607;
    }
    float _1681 = _1625;
    float _1683 = _1681;
    if (_1613)
    {
        float _1685 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1661 = _1685;
    }
    float _1687 = _1661;
    float _1689 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1691 = _1651;
    float _1693 = _1687;
    if (_1613)
    {
        float _1695 = fma(_1651, _1687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1691 = _1695;
    }
    float _1697 = _1691;
    float _1699 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1689);
    float _1701 = _1697;
    if (_1613)
    {
        float _1703 = _1667 + (-1.0);
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1613)
    {
        float _1709 = _1635 * _1697;
        _1377 = _1709;
    }
    float _1711 = _1377;
    float _1713 = sqrt(_1595);
    if (_1613)
    {
        float _1715 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1715;
    }
    float _1717 = _1701;
    if (_1613)
    {
        float _1719 = _1601 * _1711;
        _1627 = _1719;
    }
    float _1721 = _1627;
    if (!_1613)
    {
        _1707 = _1605;
    }
    float _1723 = _1707;
    float _1725 = _1723;
    if (_1613)
    {
        float _1727 = _1603 * _1711;
        _1679 = _1727;
    }
    float _1729 = _1679;
    if (_1613)
    {
        float _1731 = fma(_1673, _1667, _1717);
        _1675 = _1731;
    }
    float _1733 = _1675;
    if (_1613)
    {
        float _1735 = _1721 * _1721;
        _1725 = _1735;
    }
    float _1737 = _1725;
    if (_1613)
    {
        float _1739 = _1729 * _1729;
        _1683 = _1739;
    }
    float _1741 = _1683;
    float _1743 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1745 = fma(_1733, _1733, _1737);
    float _1747 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1749 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1743);
    float _1751 = _1745 + _1741;
    float _1753 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1747);
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1757 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1755);
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1763 = rsqrt(_1751);
    float _1765 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1767 = -_1759;
    float _1769 = _1767 + 1.0;
    float _1771 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1775 = _1765 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1777 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1771);
    float _1779 = abs(_1769);
    float _1781 = log2(_1779);
    float _1783 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1749);
    float _1785 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1787 = _1777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1789 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1699);
    float _1791 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1793 = -_1785;
    float _1795 = fma(_1793, _1773, 1.0);
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1799 = _1763 * _1721;
    float _1801 = _1763 * _1733;
    float _1803 = _1763 * _1729;
    float _1805 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1797);
    float _1807 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1809 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1811 = log2(_1795);
    float _1813 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1805);
    float _1815 = -_1807;
    float _1817 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1815);
    float _1819 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1825 = -_1803;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1817);
    float _1829 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1831 = exp2(_1819);
    float _1833 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1835 = fma(_1827, -0.5, 0.5);
    float _1837 = fma(_1827, 0.5, 0.5);
    float _1839 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1829);
    float _1841 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1833);
    float _1843 = _1801 + 1.0;
    float _1845 = fma(_1837, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1847 = 1.0 / _1823;
    float _1849 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1839);
    float _1851 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1841);
    float _1853 = fma(_1837, _1845, -0.212114393711090087890625);
    float _1855 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1849);
    float _1857 = fma(_1837, _1853, 1.570728778839111328125);
    float _1859 = sqrt(_1835);
    float _1861 = -_1801;
    float _1863 = fma(_1831, _1843, _1861);
    float _1865 = _1811 * 0.693147182464599609375;
    float _1867 = fma(_1863, 0.5, 0.5);
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1871 = _1851 * _1847;
    float _1873 = _1855 * _1847;
    float _1875 = fma(_1871, 0.5, 0.5);
    float _1877 = fma(_1873, -0.5, 0.5);
    float _1879 = _1859 * 0.636619746685028076171875;
    float3 _4969 = float3(_1875, _1877, _1869);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4969, float3(0.0), isnan(_4969)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4969, float3(0.0), isnan(_4969)), level(0.0)).x;
    float3 _4980 = float3(_1875, _1877, _1869);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4980, float3(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4980, float3(0.0), isnan(_4980)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float _1894 = -_1857;
    float _1896 = fma(_1879, _1894, 1.0);
    float2 _5002 = float2(_1896, _1867);
    float3 _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5002, float2(0.0), isnan(_5002)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5002, float2(0.0), isnan(_5002)), level(0.0)).xyz;
    float _1902 = _1900.x;
    float _1904 = _1900.y;
    float _1906 = _1900.z;
    float _1908 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1910 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1912 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1910);
    float _1914 = exp2(_1908);
    float _1916 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1912);
    float _1918 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1916);
    float _1920 = _1918 + _1823;
    float _1922 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1851;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1823;
    float _1924 = _1920 * 0.5;
    float _1926 = -_1914;
    float _1928 = _1926 + 1.0;
    out.m_45.x = _1922;
    float _1930 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1924;
    out.m_68.w = _1823;
    float _1932 = _1930 * _1881;
    float _1934 = -_1930;
    float _1936 = _1934 + 1.0;
    float _1938 = _1892 * _1932;
    float _1940 = _1892 * _1936;
    float _1942 = _1906 * _1932;
    float _1944 = fma(_1902, _1938, _1886);
    float _1946 = fma(_1904, _1938, _1888);
    float _1948 = fma(_1892, _1942, _1890);
    out.m_70.x = _1944;
    out.m_70.y = _1946;
    out.m_70.z = _1948;
    out.m_70.w = _1940;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

