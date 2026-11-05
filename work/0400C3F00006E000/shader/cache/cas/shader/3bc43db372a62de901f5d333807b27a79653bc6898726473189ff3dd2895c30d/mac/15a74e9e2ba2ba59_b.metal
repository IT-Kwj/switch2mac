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
    float4 m_62 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _469 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1591 = as_type<float>(_101);
        out.gl_Position.z = _1591;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1660 = as_type<float>(_137);
        out.gl_Position.z = _1660;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    int _199 = abs(_181);
    float _201 = -_161;
    float _203 = _157 + _201;
    bool _205 = !_169;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = float(_199);
    float _213 = -_203;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_189, 0.5, 0.5);
    float _223 = abs(_215);
    float _225 = _211 * _223;
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_235, _233, _225);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_217;
    float _255 = _197;
    float _257 = _247;
    float _259 = _245;
    float _275;
    if (!_253)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_85);
        float _281 = 1.0 / _279;
        float _283 = _119 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _285 + _291;
    bool _295 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_285);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _285 + _319;
    float _323 = 1.0 / _313;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _309;
    float _329 = 1.0 / _317;
    float _331 = _321 * _323;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _289 * _327;
    bool _347 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_285);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_305;
    float _361 = _359 + 1.0;
    float _363 = _357 * _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _293 * _329;
    bool _371 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _373 = isnan(_285);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_357;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _381 * _385;
    float _401 = -_381;
    float _403 = _401 + 1.0;
    float _405 = fma(_389, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = fma(_393, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _409 = _343 * _403;
    float _411 = fma(_367, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _413 = fma(_397, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = -_343;
    float _417 = _415 + 1.0;
    float _419 = _405 * _409;
    float _421 = _407 * _409;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _427;
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _435 = fma(_425, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _437 = fma(_429, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_411, _399, _431);
    float _441 = fma(_413, _399, _433);
    float _443 = fma(_435, _363, _439);
    float _445 = fma(_437, _363, _441);
    float _447 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _443);
    float _449 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _445);
    bool _451 = !_325;
    float _467;
    if (!_451)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _455 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        float _471 = float(_85);
        float _473 = 1.0 / _471;
        float _475 = _119 * _473;
        _467 = _475;
    }
    _469 = false;
    float _477 = _467;
    float _479 = as_type<float>(int(gl_VertexIndex));
    float _481 = in.m_56.x;
    float _483 = in.m_56.y;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = in.m_42.z;
    int _491 = as_type<int>(_479) & 1;
    bool _493 = _491 != 0;
    int _495 = as_type<int>(_479) & 2;
    bool _497 = _495 != 0;
    float _499 = _449 * _483;
    float _501 = _447 * _481;
    bool _503 = !_497;
    float _505 = _503 ? (-0.5) : 0.5;
    float _507 = _251 * _499;
    bool _509 = !_493;
    float _511 = _509 ? (-0.5) : 0.5;
    float _513 = _251 * _501;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _511);
    float _523 = _517 * _515;
    float _525 = _487 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _519 * _521;
    float _529 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _531 = _487 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _533 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _535 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _537 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    float _555 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _559 = _487 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _563 = _551 + _555;
    float _565 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _567 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = _557 + _561;
    float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _573 = _563 + _571;
    float _575 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _565);
    float _577 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _569 + _579;
    float _583 = _573 * _573;
    float _585 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _575);
    float _587 = _577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _589 = fma(_581, _581, _583);
    float _591 = _585 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _593 = sqrt(_589);
    float _595 = _587 + _591;
    bool _597 = _593 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _599 = _533;
    float _601 = _489;
    float _603 = _583;
    if (!_597)
    {
        _599 = _569;
    }
    float _605 = _599;
    float _607 = _605;
    if (!_597)
    {
        _601 = _563;
    }
    float _609 = _601;
    float _611 = _609;
    if (!_597)
    {
        _603 = _595;
    }
    float _613 = _603;
    bool _615 = !_597;
    float _617 = _613;
    if (!_615)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _623 = _593 + _621;
        float _625 = _595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _627 = rsqrt(_589);
        float _629 = _623 * _619;
        float _631 = _629 * 0.15915493667125701904296875;
        float _633 = _631 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _631 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 + (-1.0);
        float _643 = _641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _645 = fma(_639, _625, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _647 = fma(_595, _635, _643);
        float _649 = _627 * _645;
        float _651 = fma(_581, _649, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_573, _649, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _617 = _647;
        _607 = _651;
        _611 = _653;
    }
    float _655 = _617;
    float _657 = _607;
    float _659 = _611;
    float _661 = -_587;
    float _663 = _661 + _655;
    float _665 = -_557;
    float _667 = _665 + _657;
    float _669 = -_551;
    float _671 = _669 + _659;
    float _673 = _587 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _675 = _663 * _663;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _673);
    float _689 = fma(_667, _667, _675);
    bool _691 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _693 = isnan(0.5);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _699 = _695 || _697;
    float _701 = fma(_671, _671, _689);
    float _703 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _687);
    float _705 = _587 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _707 = sqrt(_701);
    float _709 = _703 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _711 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _705);
    float _713 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _715 = 1.0 / _709;
    float _717 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _719 = _717 + _709;
    bool _721 = _707 > 0.0;
    float _723 = _719 * _715;
    float _725 = _723 * 0.5;
    bool _727 = !_721;
    float _729 = _657;
    float _731 = _655;
    float _733 = _659;
    float _735 = _717;
    if (!_727)
    {
        float _737 = _197 * _197;
        float _739 = fma(_245, _245, _737);
        float _741 = fma(_247, _247, _739);
        float _743 = rsqrt(_701);
        float _745 = sqrt(_741);
        float _747 = _667 * _743;
        float _749 = _663 * _743;
        float _751 = _671 * _743;
        bool _753 = _745 > 0.0;
        bool _755 = !_753;
        _735 = _741;
        if (!_755)
        {
            float _757 = rsqrt(_741);
            float _759 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _761 = _197 * _757;
            float _763 = _245 * _757;
            float _765 = _247 * _757;
            float _767 = _749 * _761;
            float _769 = fma(_747, _763, _767);
            float _771 = _759 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _773 = fma(_751, _765, _769);
            float _775 = _773 * _771;
            float _777 = fma(_245, _775, _657);
            float _779 = fma(_197, _775, _655);
            float _781 = fma(_247, _775, _659);
            _729 = _777;
            _731 = _779;
            _733 = _781;
        }
    }
    float _783 = _729;
    float _785 = _731;
    float _787 = _733;
    float _789 = _735;
    float _791 = _789;
    float _793 = _783;
    if (_699)
    {
        _791 = 1.0;
    }
    float _795 = _791;
    float _797 = _795;
    if (_685)
    {
        _255 = _783;
    }
    float _799 = _255;
    float _801 = _799;
    if (_685)
    {
        _257 = _785;
    }
    float _803 = _257;
    float _805 = _803;
    if (_685)
    {
        _259 = _787;
    }
    float _807 = _259;
    float _809 = _807;
    if (!_685)
    {
        float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _813 = _587 + _811;
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _817 = _557 + _815;
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _821 = -_557;
        float _823 = _821 + _783;
        float _825 = _813 * _813;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _829 = _551 + _827;
        float _831 = -_587;
        float _833 = _831 + _785;
        float _835 = -_551;
        float _837 = _835 + _787;
        float _839 = fma(_817, _817, _825);
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _843 = fma(_829, _829, _839);
        float _845 = sqrt(_843);
        float _847 = _819 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _849 = precise::min(_845, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _851 = _849 * _841;
        float _853 = _847 * _851;
        float _855 = fma(_823, _853, _557);
        float _857 = fma(_833, _853, _587);
        float _859 = fma(_837, _853, _551);
        _805 = _857;
        _801 = _855;
        _809 = _859;
        _793 = _823;
    }
    float _861 = _805;
    float _863 = _801;
    float _865 = _809;
    float _867 = _793;
    float _869 = _867;
    if (!_699)
    {
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _877 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _879 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _877);
        float _881 = _873 * 6.283185482025146484375;
        float _883 = cos(_881);
        float _885 = _875 * 0.15915493667125701904296875;
        float _887 = _873 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = 1.0 / _883;
        float _893 = _885 * 6.283185482025146484375;
        float _895 = cos(_893);
        float _897 = _889 * _891;
        float _899 = _885 * 6.283185482025146484375;
        float _901 = sin(_899);
        float _903 = _895 * _897;
        float _905 = 1.0 / _879;
        float _907 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _909 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _907;
        float _911 = 1.0 / _903;
        float _913 = 1.0 / _909;
        float _915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _917 = _905 * _915;
        float _919 = _901 * _911;
        float _921 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _923 = fma(_919, _917, _921);
        float _925 = _923 * _913;
        float _927 = precise::clamp(_925, 0.0, 1.0);
        _869 = _911;
        _797 = _927;
    }
    float _929 = _869;
    float _931 = _797;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _861 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _939 = _863 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _943 = _865 + _941;
    float _945 = _935 * _935;
    float _947 = fma(_939, _939, _945);
    float _949 = fma(_943, _943, _947);
    float _951 = rsqrt(_949);
    float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _939 * _953;
    float _957 = _943 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _943;
    float _975 = _963;
    float _977 = _971;
    float _979 = _929;
    float _981 = _953;
    if (_967)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _983;
    }
    float _985 = _973;
    if (_967)
    {
        float _987 = rsqrt(_963);
        _975 = _987;
    }
    float _989 = _975;
    if (_967)
    {
        float _991 = _971 * _985;
        _977 = _991;
    }
    float _993 = _977;
    if (_967)
    {
        float _995 = _993 * 0.15915493667125701904296875;
        _979 = _995;
    }
    float _997 = _979;
    float _999 = _945;
    float _1001 = _997;
    if (_967)
    {
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _951;
    float _1015 = _1011;
    float _1017 = _1009;
    if (_967)
    {
        float _1019 = _997 * 6.283185482025146484375;
        float _1021 = cos(_1019);
        _1013 = _1021;
    }
    float _1023 = _1013;
    float _1025 = -_953;
    float _1027 = -_1011;
    float _1029 = fma(_935, _1025, _1027);
    float _1031 = _1029;
    if (!_967)
    {
        _1015 = _955;
    }
    float _1033 = _1015;
    float _1035 = _1033;
    if (_967)
    {
        float _1037 = _1029 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1017 = _1037;
    }
    float _1039 = _1017;
    float _1041 = _1007;
    float _1043 = _1039;
    if (_967)
    {
        float _1045 = fma(_1007, _1039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1041 = _1045;
    }
    float _1047 = _1041;
    float _1049 = _1047;
    float _1051 = _1023;
    if (_967)
    {
        float _1053 = _1023 + (-1.0);
        _1043 = _1053;
    }
    float _1055 = _1043;
    float _1057 = _1055;
    if (_967)
    {
        float _1059 = _989 * _1047;
        _981 = _1059;
    }
    float _1061 = _981;
    if (!_967)
    {
        _1049 = _959;
    }
    float _1063 = _1049;
    float _1065 = sqrt(_949);
    float _1067 = _1063;
    if (_967)
    {
        float _1069 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1069;
    }
    float _1071 = _1001;
    if (_967)
    {
        float _1073 = _955 * _1061;
        _1035 = _1073;
    }
    float _1075 = _1035;
    if (!_967)
    {
        _1057 = _957;
    }
    float _1077 = _1057;
    float _1079 = _1077;
    if (_967)
    {
        float _1081 = _957 * _1061;
        _1079 = _1081;
    }
    float _1083 = _1079;
    if (_967)
    {
        float _1085 = fma(_1029, _1023, _1071);
        _1031 = _1085;
    }
    float _1087 = _1031;
    if (_967)
    {
        float _1089 = _1075 * _1075;
        _1067 = _1089;
    }
    float _1091 = _1067;
    if (!_967)
    {
        _1051 = _961;
    }
    float _1093 = _1051;
    float _1095 = _1093;
    if (_967)
    {
        float _1097 = _1083 * _1083;
        _1095 = _1097;
    }
    float _1099 = _1095;
    float _1101 = fma(_1087, _1087, _1091);
    float _1103 = _1101 + _1099;
    float _1105 = _861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1109 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1107);
    float _1111 = precise::clamp(_1109, 0.0, 1.0);
    float _1113 = _861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1115 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1117 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1119 = rsqrt(_1103);
    float _1121 = -_1111;
    float _1123 = _1121 + 1.0;
    float _1125 = _861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1127 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1117);
    float _1129 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1113);
    float _1131 = _861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1133 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1125);
    float _1137 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1129);
    float _1139 = abs(_1123);
    float _1141 = log2(_1139);
    float _1143 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1131);
    float _1145 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1149 = _1133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1151 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1143);
    float _1153 = _1119 * _1075;
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1159 = _1119 * _1087;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1163 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1165 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1157);
    float _1167 = _1119 * _1083;
    float _1169 = -_1161;
    float _1171 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = -_1149;
    float _1175 = fma(_1173, _1115, 1.0);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1179 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1181 = -_1167;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1187 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1177);
    float _1189 = exp2(_1179);
    float _1191 = fma(_1183, -0.5, 0.5);
    float _1193 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1195 = fma(_1183, 0.5, 0.5);
    float _1197 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1185);
    float _1199 = _1159 + 1.0;
    float _1201 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1193);
    float _1203 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1205 = log2(_1175);
    float _1207 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1197);
    float _1209 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1201);
    float _1211 = fma(_1195, _1203, -0.212114393711090087890625);
    float _1213 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1217 = fma(_1195, _1211, 1.570728778839111328125);
    float _1219 = 1.0 / _1187;
    float _1221 = -_1159;
    float _1223 = fma(_1189, _1199, _1221);
    float _1225 = fma(_1223, 0.5, 0.5);
    float _1227 = sqrt(_1191);
    float _1229 = _1205 * 0.693147182464599609375;
    float _1231 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1233 = _1215 * _1219;
    float _1235 = _1213 * _1219;
    float _1237 = fma(_1233, 0.5, 0.5);
    float _1239 = fma(_1235, -0.5, 0.5);
    float _1241 = _1227 * 0.636619746685028076171875;
    float3 _3415 = float3(_1237, _1239, _1231);
    float _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3415, float3(0.0), isnan(_3415)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3415, float3(0.0), isnan(_3415)), level(0.0)).x;
    float3 _3426 = float3(_1237, _1239, _1231);
    float4 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3426, float3(0.0), isnan(_3426)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3426, float3(0.0), isnan(_3426)), level(0.0)).xyzw;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1246.w;
    float _1256 = -_1217;
    float _1258 = fma(_1241, _1256, 1.0);
    float2 _3448 = float2(_1258, _1225);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3448, float2(0.0), isnan(_3448)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3448, float2(0.0), isnan(_3448)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float _1270 = in.m_49.y;
    float _1272 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = 1.0 / _1276;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1290 = _1288 != 0;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1300 = _139 > 0.5;
    float _1302 = 1.0 / _1280;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1306 = _477 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1310 = _477 + _1308;
    float _1312 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1316 = _1270 > 0.5;
    float _1318 = _1310 * _1284;
    bool _1320 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1322 = isnan(_477);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1332;
    out.m_58.x = _1292;
    out.m_58.y = _1312;
    out.m_58.z = _1314;
    float _1336 = exp2(_1272);
    float _1338 = fma(_1334, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1340 = _1306 * _1302;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1346;
    float _1350 = -_1330;
    float _1352 = _1350 + 1.0;
    float _1354 = fma(_1344, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1356 = fma(_1348, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1358 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1360 = isnan(_477);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1374 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1376 = isnan(_477);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1390 = -_511;
    int _1392 = _1300 ? as_type<int>(_1390) : as_type<int>(_511);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1398 = -_505;
    int _1400 = _1316 ? as_type<int>(_1398) : as_type<int>(_505);
    float _1402 = _1384 * _1352;
    float _1404 = -_1384;
    float _1406 = _1404 + 1.0;
    bool _1408 = !_1290;
    float _1410 = _1408 ? _511 : as_type<float>(_1392);
    float _1412 = fma(_1372, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1414 = !_1296;
    float _1416 = _1414 ? _505 : as_type<float>(_1400);
    float _1418 = _1368 * _1406;
    float _1420 = -_1368;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1388, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1426 = fma(_1396, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1428 = _1354 * _1418;
    float _1430 = _1356 * _1418;
    float _1432 = _1338 * _1418;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1428);
    float _1438 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1430);
    float _1440 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1432);
    float _1442 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1444 = fma(_1412, _1402, _1436);
    float _1446 = fma(_1424, _1402, _1438);
    float _1448 = fma(_1426, _1402, _1440);
    float _1450 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1442);
    float _1452 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1444);
    float _1454 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1446);
    float _1456 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1448);
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1460 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1450);
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1464 = _1410 + 0.5;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1468 = -_1336;
    float _1470 = _1468 + 1.0;
    float _1472 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1460);
    float _1474 = -_1416;
    float _1476 = _1474 + 0.5;
    bool _1478 = _931 > 0.0;
    bool _1480 = isnan(_931);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    float _1488 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1490 = _1472 + _1187;
    float _1492 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1494 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1496 = -_1488;
    float _1498 = _1496 + 1.0;
    float _1500 = _1490 * 0.5;
    float _1502 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1504 = _1454 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1506 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.gl_Position.x = _1215;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1472;
    out.gl_Position.w = _1187;
    float _1508 = _1494 * _1434;
    float _1510 = _1502 * _1462;
    float _1512 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1518 = _1492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1508;
    out.m_60.y = _1510;
    out.m_62.x = _1512;
    out.m_62.y = _1514;
    out.m_62.z = _1516;
    out.m_62.w = _1466;
    out.m_64.z = _1500;
    out.m_64.w = _1187;
    out.m_45.x = _1518;
    float _1520 = _1488 * _1243;
    float _1522 = _1254 * _1520;
    float _1524 = _1268 * _1520;
    float _1526 = fma(_1264, _1522, _1248);
    float _1528 = fma(_1266, _1522, _1250);
    float _1530 = _1254 * _1498;
    float _1532 = fma(_1254, _1524, _1252);
    out.m_66.x = _1526;
    out.m_66.y = _1528;
    out.m_66.z = _1532;
    out.m_66.w = _1530;
    if (_1486)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1534 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1534;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _469 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1591 = as_type<float>(_101);
        out.gl_Position.z = _1591;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1660 = as_type<float>(_137);
        out.gl_Position.z = _1660;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    int _199 = abs(_181);
    float _201 = -_161;
    float _203 = _157 + _201;
    bool _205 = !_169;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = float(_199);
    float _213 = -_203;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_189, 0.5, 0.5);
    float _223 = abs(_215);
    float _225 = _211 * _223;
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_235, _233, _225);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_217;
    float _255 = _197;
    float _257 = _247;
    float _259 = _245;
    float _275;
    if (!_253)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_85);
        float _281 = 1.0 / _279;
        float _283 = _119 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _285 + _291;
    bool _295 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_285);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _285 + _319;
    float _323 = 1.0 / _313;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _309;
    float _329 = 1.0 / _317;
    float _331 = _321 * _323;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _289 * _327;
    bool _347 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_285);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_305;
    float _361 = _359 + 1.0;
    float _363 = _357 * _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _293 * _329;
    bool _371 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _373 = isnan(_285);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_357;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _381 * _385;
    float _401 = -_381;
    float _403 = _401 + 1.0;
    float _405 = fma(_389, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = fma(_393, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _409 = _343 * _403;
    float _411 = fma(_367, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _413 = fma(_397, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = -_343;
    float _417 = _415 + 1.0;
    float _419 = _405 * _409;
    float _421 = _407 * _409;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _427;
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _435 = fma(_425, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _437 = fma(_429, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_411, _399, _431);
    float _441 = fma(_413, _399, _433);
    float _443 = fma(_435, _363, _439);
    float _445 = fma(_437, _363, _441);
    float _447 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _443);
    float _449 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _445);
    bool _451 = !_325;
    float _467;
    if (!_451)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _455 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        float _471 = float(_85);
        float _473 = 1.0 / _471;
        float _475 = _119 * _473;
        _467 = _475;
    }
    _469 = false;
    float _477 = _467;
    float _479 = as_type<float>(int(gl_VertexIndex));
    float _481 = in.m_56.x;
    float _483 = in.m_56.y;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = in.m_42.z;
    int _491 = as_type<int>(_479) & 1;
    bool _493 = _491 != 0;
    int _495 = as_type<int>(_479) & 2;
    bool _497 = _495 != 0;
    float _499 = _449 * _483;
    float _501 = _447 * _481;
    bool _503 = !_497;
    float _505 = _503 ? (-0.5) : 0.5;
    float _507 = _251 * _499;
    bool _509 = !_493;
    float _511 = _509 ? (-0.5) : 0.5;
    float _513 = _251 * _501;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _511);
    float _523 = _517 * _515;
    float _525 = _487 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _519 * _521;
    float _529 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _531 = _487 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _533 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _535 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _537 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    float _555 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _559 = _487 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _563 = _551 + _555;
    float _565 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _567 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = _557 + _561;
    float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _573 = _563 + _571;
    float _575 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _565);
    float _577 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _569 + _579;
    float _583 = _573 * _573;
    float _585 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _575);
    float _587 = _577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _589 = fma(_581, _581, _583);
    float _591 = _585 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _593 = sqrt(_589);
    float _595 = _587 + _591;
    bool _597 = _593 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _599 = _533;
    float _601 = _489;
    float _603 = _583;
    if (!_597)
    {
        _599 = _569;
    }
    float _605 = _599;
    float _607 = _605;
    if (!_597)
    {
        _601 = _563;
    }
    float _609 = _601;
    float _611 = _609;
    if (!_597)
    {
        _603 = _595;
    }
    float _613 = _603;
    bool _615 = !_597;
    float _617 = _613;
    if (!_615)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _623 = _593 + _621;
        float _625 = _595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _627 = rsqrt(_589);
        float _629 = _623 * _619;
        float _631 = _629 * 0.15915493667125701904296875;
        float _633 = _631 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _631 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 + (-1.0);
        float _643 = _641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _645 = fma(_639, _625, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _647 = fma(_595, _635, _643);
        float _649 = _627 * _645;
        float _651 = fma(_581, _649, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_573, _649, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _617 = _647;
        _607 = _651;
        _611 = _653;
    }
    float _655 = _617;
    float _657 = _607;
    float _659 = _611;
    float _661 = -_587;
    float _663 = _661 + _655;
    float _665 = -_557;
    float _667 = _665 + _657;
    float _669 = -_551;
    float _671 = _669 + _659;
    float _673 = _587 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _675 = _663 * _663;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _673);
    float _689 = fma(_667, _667, _675);
    bool _691 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _693 = isnan(0.5);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _699 = _695 || _697;
    float _701 = fma(_671, _671, _689);
    float _703 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _687);
    float _705 = _587 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _707 = sqrt(_701);
    float _709 = _703 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _711 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _705);
    float _713 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _715 = 1.0 / _709;
    float _717 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _719 = _717 + _709;
    bool _721 = _707 > 0.0;
    float _723 = _719 * _715;
    float _725 = _723 * 0.5;
    bool _727 = !_721;
    float _729 = _657;
    float _731 = _655;
    float _733 = _659;
    float _735 = _717;
    if (!_727)
    {
        float _737 = _197 * _197;
        float _739 = fma(_245, _245, _737);
        float _741 = fma(_247, _247, _739);
        float _743 = rsqrt(_701);
        float _745 = sqrt(_741);
        float _747 = _667 * _743;
        float _749 = _663 * _743;
        float _751 = _671 * _743;
        bool _753 = _745 > 0.0;
        bool _755 = !_753;
        _735 = _741;
        if (!_755)
        {
            float _757 = rsqrt(_741);
            float _759 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _761 = _197 * _757;
            float _763 = _245 * _757;
            float _765 = _247 * _757;
            float _767 = _749 * _761;
            float _769 = fma(_747, _763, _767);
            float _771 = _759 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _773 = fma(_751, _765, _769);
            float _775 = _773 * _771;
            float _777 = fma(_245, _775, _657);
            float _779 = fma(_197, _775, _655);
            float _781 = fma(_247, _775, _659);
            _729 = _777;
            _731 = _779;
            _733 = _781;
        }
    }
    float _783 = _729;
    float _785 = _731;
    float _787 = _733;
    float _789 = _735;
    float _791 = _789;
    float _793 = _783;
    if (_699)
    {
        _791 = 1.0;
    }
    float _795 = _791;
    float _797 = _795;
    if (_685)
    {
        _255 = _783;
    }
    float _799 = _255;
    float _801 = _799;
    if (_685)
    {
        _257 = _785;
    }
    float _803 = _257;
    float _805 = _803;
    if (_685)
    {
        _259 = _787;
    }
    float _807 = _259;
    float _809 = _807;
    if (!_685)
    {
        float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _813 = _587 + _811;
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _817 = _557 + _815;
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _821 = -_557;
        float _823 = _821 + _783;
        float _825 = _813 * _813;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _829 = _551 + _827;
        float _831 = -_587;
        float _833 = _831 + _785;
        float _835 = -_551;
        float _837 = _835 + _787;
        float _839 = fma(_817, _817, _825);
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _843 = fma(_829, _829, _839);
        float _845 = sqrt(_843);
        float _847 = _819 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _849 = precise::min(_845, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _851 = _849 * _841;
        float _853 = _847 * _851;
        float _855 = fma(_823, _853, _557);
        float _857 = fma(_833, _853, _587);
        float _859 = fma(_837, _853, _551);
        _805 = _857;
        _801 = _855;
        _809 = _859;
        _793 = _823;
    }
    float _861 = _805;
    float _863 = _801;
    float _865 = _809;
    float _867 = _793;
    float _869 = _867;
    if (!_699)
    {
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _877 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _879 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _877);
        float _881 = _873 * 6.283185482025146484375;
        float _883 = cos(_881);
        float _885 = _875 * 0.15915493667125701904296875;
        float _887 = _873 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = 1.0 / _883;
        float _893 = _885 * 6.283185482025146484375;
        float _895 = cos(_893);
        float _897 = _889 * _891;
        float _899 = _885 * 6.283185482025146484375;
        float _901 = sin(_899);
        float _903 = _895 * _897;
        float _905 = 1.0 / _879;
        float _907 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _909 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _907;
        float _911 = 1.0 / _903;
        float _913 = 1.0 / _909;
        float _915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _917 = _905 * _915;
        float _919 = _901 * _911;
        float _921 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _923 = fma(_919, _917, _921);
        float _925 = _923 * _913;
        float _927 = precise::clamp(_925, 0.0, 1.0);
        _869 = _911;
        _797 = _927;
    }
    float _929 = _869;
    float _931 = _797;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _861 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _939 = _863 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _943 = _865 + _941;
    float _945 = _935 * _935;
    float _947 = fma(_939, _939, _945);
    float _949 = fma(_943, _943, _947);
    float _951 = rsqrt(_949);
    float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _939 * _953;
    float _957 = _943 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _943;
    float _975 = _963;
    float _977 = _971;
    float _979 = _929;
    float _981 = _953;
    if (_967)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _983;
    }
    float _985 = _973;
    if (_967)
    {
        float _987 = rsqrt(_963);
        _975 = _987;
    }
    float _989 = _975;
    if (_967)
    {
        float _991 = _971 * _985;
        _977 = _991;
    }
    float _993 = _977;
    if (_967)
    {
        float _995 = _993 * 0.15915493667125701904296875;
        _979 = _995;
    }
    float _997 = _979;
    float _999 = _945;
    float _1001 = _997;
    if (_967)
    {
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _951;
    float _1015 = _1011;
    float _1017 = _1009;
    if (_967)
    {
        float _1019 = _997 * 6.283185482025146484375;
        float _1021 = cos(_1019);
        _1013 = _1021;
    }
    float _1023 = _1013;
    float _1025 = -_953;
    float _1027 = -_1011;
    float _1029 = fma(_935, _1025, _1027);
    float _1031 = _1029;
    if (!_967)
    {
        _1015 = _955;
    }
    float _1033 = _1015;
    float _1035 = _1033;
    if (_967)
    {
        float _1037 = _1029 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1017 = _1037;
    }
    float _1039 = _1017;
    float _1041 = _1007;
    float _1043 = _1039;
    if (_967)
    {
        float _1045 = fma(_1007, _1039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1041 = _1045;
    }
    float _1047 = _1041;
    float _1049 = _1047;
    float _1051 = _1023;
    if (_967)
    {
        float _1053 = _1023 + (-1.0);
        _1043 = _1053;
    }
    float _1055 = _1043;
    float _1057 = _1055;
    if (_967)
    {
        float _1059 = _989 * _1047;
        _981 = _1059;
    }
    float _1061 = _981;
    if (!_967)
    {
        _1049 = _959;
    }
    float _1063 = _1049;
    float _1065 = sqrt(_949);
    float _1067 = _1063;
    if (_967)
    {
        float _1069 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1069;
    }
    float _1071 = _1001;
    if (_967)
    {
        float _1073 = _955 * _1061;
        _1035 = _1073;
    }
    float _1075 = _1035;
    if (!_967)
    {
        _1057 = _957;
    }
    float _1077 = _1057;
    float _1079 = _1077;
    if (_967)
    {
        float _1081 = _957 * _1061;
        _1079 = _1081;
    }
    float _1083 = _1079;
    if (_967)
    {
        float _1085 = fma(_1029, _1023, _1071);
        _1031 = _1085;
    }
    float _1087 = _1031;
    if (_967)
    {
        float _1089 = _1075 * _1075;
        _1067 = _1089;
    }
    float _1091 = _1067;
    if (!_967)
    {
        _1051 = _961;
    }
    float _1093 = _1051;
    float _1095 = _1093;
    if (_967)
    {
        float _1097 = _1083 * _1083;
        _1095 = _1097;
    }
    float _1099 = _1095;
    float _1101 = fma(_1087, _1087, _1091);
    float _1103 = _1101 + _1099;
    float _1105 = _861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1109 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1107);
    float _1111 = precise::clamp(_1109, 0.0, 1.0);
    float _1113 = _861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1115 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1117 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1119 = rsqrt(_1103);
    float _1121 = -_1111;
    float _1123 = _1121 + 1.0;
    float _1125 = _861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1127 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1117);
    float _1129 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1113);
    float _1131 = _861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1133 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1125);
    float _1137 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1129);
    float _1139 = abs(_1123);
    float _1141 = log2(_1139);
    float _1143 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1131);
    float _1145 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1149 = _1133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1151 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1143);
    float _1153 = _1119 * _1075;
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1159 = _1119 * _1087;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1163 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1165 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1157);
    float _1167 = _1119 * _1083;
    float _1169 = -_1161;
    float _1171 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = -_1149;
    float _1175 = fma(_1173, _1115, 1.0);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1179 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1181 = -_1167;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1187 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1177);
    float _1189 = exp2(_1179);
    float _1191 = fma(_1183, -0.5, 0.5);
    float _1193 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1195 = fma(_1183, 0.5, 0.5);
    float _1197 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1185);
    float _1199 = _1159 + 1.0;
    float _1201 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1193);
    float _1203 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1205 = log2(_1175);
    float _1207 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1197);
    float _1209 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1201);
    float _1211 = fma(_1195, _1203, -0.212114393711090087890625);
    float _1213 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1217 = fma(_1195, _1211, 1.570728778839111328125);
    float _1219 = 1.0 / _1187;
    float _1221 = -_1159;
    float _1223 = fma(_1189, _1199, _1221);
    float _1225 = fma(_1223, 0.5, 0.5);
    float _1227 = sqrt(_1191);
    float _1229 = _1205 * 0.693147182464599609375;
    float _1231 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1233 = _1215 * _1219;
    float _1235 = _1213 * _1219;
    float _1237 = fma(_1233, 0.5, 0.5);
    float _1239 = fma(_1235, -0.5, 0.5);
    float _1241 = _1227 * 0.636619746685028076171875;
    float3 _3415 = float3(_1237, _1239, _1231);
    float _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3415, float3(0.0), isnan(_3415)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3415, float3(0.0), isnan(_3415)), level(0.0)).x;
    float3 _3426 = float3(_1237, _1239, _1231);
    float4 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3426, float3(0.0), isnan(_3426)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3426, float3(0.0), isnan(_3426)), level(0.0)).xyzw;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1246.w;
    float _1256 = -_1217;
    float _1258 = fma(_1241, _1256, 1.0);
    float2 _3448 = float2(_1258, _1225);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3448, float2(0.0), isnan(_3448)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3448, float2(0.0), isnan(_3448)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float _1270 = in.m_49.y;
    float _1272 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = 1.0 / _1276;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1290 = _1288 != 0;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1300 = _139 > 0.5;
    float _1302 = 1.0 / _1280;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1306 = _477 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1310 = _477 + _1308;
    float _1312 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1316 = _1270 > 0.5;
    float _1318 = _1310 * _1284;
    bool _1320 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1322 = isnan(_477);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1332;
    out.m_58.x = _1292;
    out.m_58.y = _1312;
    out.m_58.z = _1314;
    float _1336 = exp2(_1272);
    float _1338 = fma(_1334, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1340 = _1306 * _1302;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1346;
    float _1350 = -_1330;
    float _1352 = _1350 + 1.0;
    float _1354 = fma(_1344, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1356 = fma(_1348, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1358 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1360 = isnan(_477);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1374 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1376 = isnan(_477);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1390 = -_511;
    int _1392 = _1300 ? as_type<int>(_1390) : as_type<int>(_511);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1398 = -_505;
    int _1400 = _1316 ? as_type<int>(_1398) : as_type<int>(_505);
    float _1402 = _1384 * _1352;
    float _1404 = -_1384;
    float _1406 = _1404 + 1.0;
    bool _1408 = !_1290;
    float _1410 = _1408 ? _511 : as_type<float>(_1392);
    float _1412 = fma(_1372, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1414 = !_1296;
    float _1416 = _1414 ? _505 : as_type<float>(_1400);
    float _1418 = _1368 * _1406;
    float _1420 = -_1368;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1388, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1426 = fma(_1396, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1428 = _1354 * _1418;
    float _1430 = _1356 * _1418;
    float _1432 = _1338 * _1418;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1428);
    float _1438 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1430);
    float _1440 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1432);
    float _1442 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1444 = fma(_1412, _1402, _1436);
    float _1446 = fma(_1424, _1402, _1438);
    float _1448 = fma(_1426, _1402, _1440);
    float _1450 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1442);
    float _1452 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1444);
    float _1454 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1446);
    float _1456 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1448);
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1460 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1450);
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1464 = _1410 + 0.5;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1468 = -_1336;
    float _1470 = _1468 + 1.0;
    float _1472 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1460);
    float _1474 = -_1416;
    float _1476 = _1474 + 0.5;
    bool _1478 = _931 > 0.0;
    bool _1480 = isnan(_931);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    float _1488 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1490 = _1472 + _1187;
    float _1492 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1494 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1496 = -_1488;
    float _1498 = _1496 + 1.0;
    float _1500 = _1490 * 0.5;
    float _1502 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1504 = _1454 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1506 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.gl_Position.x = _1215;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1472;
    out.gl_Position.w = _1187;
    float _1508 = _1494 * _1434;
    float _1510 = _1502 * _1462;
    float _1512 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1518 = _1492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1508;
    out.m_60.y = _1510;
    out.m_62.x = _1512;
    out.m_62.y = _1514;
    out.m_62.z = _1516;
    out.m_62.w = _1466;
    out.m_64.z = _1500;
    out.m_64.w = _1187;
    out.m_45.x = _1518;
    float _1520 = _1488 * _1243;
    float _1522 = _1254 * _1520;
    float _1524 = _1268 * _1520;
    float _1526 = fma(_1264, _1522, _1248);
    float _1528 = fma(_1266, _1522, _1250);
    float _1530 = _1254 * _1498;
    float _1532 = fma(_1254, _1524, _1252);
    out.m_66.x = _1526;
    out.m_66.y = _1528;
    out.m_66.z = _1532;
    out.m_66.w = _1530;
    if (_1486)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1534 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1534;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _469 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1591 = as_type<float>(_101);
        out.gl_Position.z = _1591;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1660 = as_type<float>(_137);
        out.gl_Position.z = _1660;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _159 * 0.15915493667125701904296875;
    float _175 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    int _199 = abs(_181);
    float _201 = -_161;
    float _203 = _157 + _201;
    bool _205 = !_169;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = float(_199);
    float _213 = -_203;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_189, 0.5, 0.5);
    float _223 = abs(_215);
    float _225 = _211 * _223;
    bool _227 = _203 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_235, _233, _225);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_217;
    float _255 = _197;
    float _257 = _247;
    float _259 = _245;
    float _275;
    if (!_253)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_85);
        float _281 = 1.0 / _279;
        float _283 = _119 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _285 + _291;
    bool _295 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_285);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _285 + _319;
    float _323 = 1.0 / _313;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _309;
    float _329 = 1.0 / _317;
    float _331 = _321 * _323;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _289 * _327;
    bool _347 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _349 = isnan(_285);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_305;
    float _361 = _359 + 1.0;
    float _363 = _357 * _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _293 * _329;
    bool _371 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _373 = isnan(_285);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_357;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _381 * _385;
    float _401 = -_381;
    float _403 = _401 + 1.0;
    float _405 = fma(_389, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = fma(_393, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _409 = _343 * _403;
    float _411 = fma(_367, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _413 = fma(_397, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = -_343;
    float _417 = _415 + 1.0;
    float _419 = _405 * _409;
    float _421 = _407 * _409;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _427;
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _435 = fma(_425, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _437 = fma(_429, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_411, _399, _431);
    float _441 = fma(_413, _399, _433);
    float _443 = fma(_435, _363, _439);
    float _445 = fma(_437, _363, _441);
    float _447 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _443);
    float _449 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _445);
    bool _451 = !_325;
    float _467;
    if (!_451)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _455 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        float _471 = float(_85);
        float _473 = 1.0 / _471;
        float _475 = _119 * _473;
        _467 = _475;
    }
    _469 = false;
    float _477 = _467;
    float _479 = as_type<float>(int(gl_VertexIndex));
    float _481 = in.m_56.x;
    float _483 = in.m_56.y;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = in.m_42.z;
    int _491 = as_type<int>(_479) & 1;
    bool _493 = _491 != 0;
    int _495 = as_type<int>(_479) & 2;
    bool _497 = _495 != 0;
    float _499 = _449 * _483;
    float _501 = _447 * _481;
    bool _503 = !_497;
    float _505 = _503 ? (-0.5) : 0.5;
    float _507 = _251 * _499;
    bool _509 = !_493;
    float _511 = _509 ? (-0.5) : 0.5;
    float _513 = _251 * _501;
    float _515 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _517 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _511);
    float _523 = _517 * _515;
    float _525 = _487 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _527 = _519 * _521;
    float _529 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _531 = _487 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _533 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _535 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _537 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    float _555 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _559 = _487 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _563 = _551 + _555;
    float _565 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _567 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = _557 + _561;
    float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _573 = _563 + _571;
    float _575 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _565);
    float _577 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _569 + _579;
    float _583 = _573 * _573;
    float _585 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _575);
    float _587 = _577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _589 = fma(_581, _581, _583);
    float _591 = _585 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _593 = sqrt(_589);
    float _595 = _587 + _591;
    bool _597 = _593 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _599 = _533;
    float _601 = _489;
    float _603 = _583;
    if (!_597)
    {
        _599 = _569;
    }
    float _605 = _599;
    float _607 = _605;
    if (!_597)
    {
        _601 = _563;
    }
    float _609 = _601;
    float _611 = _609;
    if (!_597)
    {
        _603 = _595;
    }
    float _613 = _603;
    bool _615 = !_597;
    float _617 = _613;
    if (!_615)
    {
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _623 = _593 + _621;
        float _625 = _595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _627 = rsqrt(_589);
        float _629 = _623 * _619;
        float _631 = _629 * 0.15915493667125701904296875;
        float _633 = _631 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _631 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 + (-1.0);
        float _643 = _641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _645 = fma(_639, _625, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _647 = fma(_595, _635, _643);
        float _649 = _627 * _645;
        float _651 = fma(_581, _649, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_573, _649, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _617 = _647;
        _607 = _651;
        _611 = _653;
    }
    float _655 = _617;
    float _657 = _607;
    float _659 = _611;
    float _661 = -_587;
    float _663 = _661 + _655;
    float _665 = -_557;
    float _667 = _665 + _657;
    float _669 = -_551;
    float _671 = _669 + _659;
    float _673 = _587 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _675 = _663 * _663;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _673);
    float _689 = fma(_667, _667, _675);
    bool _691 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _693 = isnan(0.5);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _699 = _695 || _697;
    float _701 = fma(_671, _671, _689);
    float _703 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _687);
    float _705 = _587 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _707 = sqrt(_701);
    float _709 = _703 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _711 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _705);
    float _713 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _715 = 1.0 / _709;
    float _717 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _719 = _717 + _709;
    bool _721 = _707 > 0.0;
    float _723 = _719 * _715;
    float _725 = _723 * 0.5;
    bool _727 = !_721;
    float _729 = _657;
    float _731 = _655;
    float _733 = _659;
    float _735 = _717;
    if (!_727)
    {
        float _737 = _197 * _197;
        float _739 = fma(_245, _245, _737);
        float _741 = fma(_247, _247, _739);
        float _743 = rsqrt(_701);
        float _745 = sqrt(_741);
        float _747 = _667 * _743;
        float _749 = _663 * _743;
        float _751 = _671 * _743;
        bool _753 = _745 > 0.0;
        bool _755 = !_753;
        _735 = _741;
        if (!_755)
        {
            float _757 = rsqrt(_741);
            float _759 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _761 = _197 * _757;
            float _763 = _245 * _757;
            float _765 = _247 * _757;
            float _767 = _749 * _761;
            float _769 = fma(_747, _763, _767);
            float _771 = _759 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _773 = fma(_751, _765, _769);
            float _775 = _773 * _771;
            float _777 = fma(_245, _775, _657);
            float _779 = fma(_197, _775, _655);
            float _781 = fma(_247, _775, _659);
            _729 = _777;
            _731 = _779;
            _733 = _781;
        }
    }
    float _783 = _729;
    float _785 = _731;
    float _787 = _733;
    float _789 = _735;
    float _791 = _789;
    float _793 = _783;
    if (_699)
    {
        _791 = 1.0;
    }
    float _795 = _791;
    float _797 = _795;
    if (_685)
    {
        _255 = _783;
    }
    float _799 = _255;
    float _801 = _799;
    if (_685)
    {
        _257 = _785;
    }
    float _803 = _257;
    float _805 = _803;
    if (_685)
    {
        _259 = _787;
    }
    float _807 = _259;
    float _809 = _807;
    if (!_685)
    {
        float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _813 = _587 + _811;
        float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _817 = _557 + _815;
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _821 = -_557;
        float _823 = _821 + _783;
        float _825 = _813 * _813;
        float _827 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _829 = _551 + _827;
        float _831 = -_587;
        float _833 = _831 + _785;
        float _835 = -_551;
        float _837 = _835 + _787;
        float _839 = fma(_817, _817, _825);
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _843 = fma(_829, _829, _839);
        float _845 = sqrt(_843);
        float _847 = _819 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _849 = precise::min(_845, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _851 = _849 * _841;
        float _853 = _847 * _851;
        float _855 = fma(_823, _853, _557);
        float _857 = fma(_833, _853, _587);
        float _859 = fma(_837, _853, _551);
        _805 = _857;
        _801 = _855;
        _809 = _859;
        _793 = _823;
    }
    float _861 = _805;
    float _863 = _801;
    float _865 = _809;
    float _867 = _793;
    float _869 = _867;
    if (!_699)
    {
        float _871 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _877 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _879 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _877);
        float _881 = _873 * 6.283185482025146484375;
        float _883 = cos(_881);
        float _885 = _875 * 0.15915493667125701904296875;
        float _887 = _873 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = 1.0 / _883;
        float _893 = _885 * 6.283185482025146484375;
        float _895 = cos(_893);
        float _897 = _889 * _891;
        float _899 = _885 * 6.283185482025146484375;
        float _901 = sin(_899);
        float _903 = _895 * _897;
        float _905 = 1.0 / _879;
        float _907 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _909 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _907;
        float _911 = 1.0 / _903;
        float _913 = 1.0 / _909;
        float _915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _917 = _905 * _915;
        float _919 = _901 * _911;
        float _921 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _923 = fma(_919, _917, _921);
        float _925 = _923 * _913;
        float _927 = precise::clamp(_925, 0.0, 1.0);
        _869 = _911;
        _797 = _927;
    }
    float _929 = _869;
    float _931 = _797;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _861 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _939 = _863 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _943 = _865 + _941;
    float _945 = _935 * _935;
    float _947 = fma(_939, _939, _945);
    float _949 = fma(_943, _943, _947);
    float _951 = rsqrt(_949);
    float _953 = _951 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _955 = _939 * _953;
    float _957 = _943 * _953;
    float _959 = _955 * _955;
    float _961 = _957 * _957;
    float _963 = _959 + _961;
    float _965 = sqrt(_963);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _971 = _965 + _969;
    float _973 = _943;
    float _975 = _963;
    float _977 = _971;
    float _979 = _929;
    float _981 = _953;
    if (_967)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _973 = _983;
    }
    float _985 = _973;
    if (_967)
    {
        float _987 = rsqrt(_963);
        _975 = _987;
    }
    float _989 = _975;
    if (_967)
    {
        float _991 = _971 * _985;
        _977 = _991;
    }
    float _993 = _977;
    if (_967)
    {
        float _995 = _993 * 0.15915493667125701904296875;
        _979 = _995;
    }
    float _997 = _979;
    float _999 = _945;
    float _1001 = _997;
    if (_967)
    {
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1011 = precise::max(0.0, _1009);
    float _1013 = _951;
    float _1015 = _1011;
    float _1017 = _1009;
    if (_967)
    {
        float _1019 = _997 * 6.283185482025146484375;
        float _1021 = cos(_1019);
        _1013 = _1021;
    }
    float _1023 = _1013;
    float _1025 = -_953;
    float _1027 = -_1011;
    float _1029 = fma(_935, _1025, _1027);
    float _1031 = _1029;
    if (!_967)
    {
        _1015 = _955;
    }
    float _1033 = _1015;
    float _1035 = _1033;
    if (_967)
    {
        float _1037 = _1029 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1017 = _1037;
    }
    float _1039 = _1017;
    float _1041 = _1007;
    float _1043 = _1039;
    if (_967)
    {
        float _1045 = fma(_1007, _1039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1041 = _1045;
    }
    float _1047 = _1041;
    float _1049 = _1047;
    float _1051 = _1023;
    if (_967)
    {
        float _1053 = _1023 + (-1.0);
        _1043 = _1053;
    }
    float _1055 = _1043;
    float _1057 = _1055;
    if (_967)
    {
        float _1059 = _989 * _1047;
        _981 = _1059;
    }
    float _1061 = _981;
    if (!_967)
    {
        _1049 = _959;
    }
    float _1063 = _1049;
    float _1065 = sqrt(_949);
    float _1067 = _1063;
    if (_967)
    {
        float _1069 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1069;
    }
    float _1071 = _1001;
    if (_967)
    {
        float _1073 = _955 * _1061;
        _1035 = _1073;
    }
    float _1075 = _1035;
    if (!_967)
    {
        _1057 = _957;
    }
    float _1077 = _1057;
    float _1079 = _1077;
    if (_967)
    {
        float _1081 = _957 * _1061;
        _1079 = _1081;
    }
    float _1083 = _1079;
    if (_967)
    {
        float _1085 = fma(_1029, _1023, _1071);
        _1031 = _1085;
    }
    float _1087 = _1031;
    if (_967)
    {
        float _1089 = _1075 * _1075;
        _1067 = _1089;
    }
    float _1091 = _1067;
    if (!_967)
    {
        _1051 = _961;
    }
    float _1093 = _1051;
    float _1095 = _1093;
    if (_967)
    {
        float _1097 = _1083 * _1083;
        _1095 = _1097;
    }
    float _1099 = _1095;
    float _1101 = fma(_1087, _1087, _1091);
    float _1103 = _1101 + _1099;
    float _1105 = _861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1109 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1107);
    float _1111 = precise::clamp(_1109, 0.0, 1.0);
    float _1113 = _861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1115 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1117 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1105);
    float _1119 = rsqrt(_1103);
    float _1121 = -_1111;
    float _1123 = _1121 + 1.0;
    float _1125 = _861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1127 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1117);
    float _1129 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1113);
    float _1131 = _861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1133 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1135 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1125);
    float _1137 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1129);
    float _1139 = abs(_1123);
    float _1141 = log2(_1139);
    float _1143 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1131);
    float _1145 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1149 = _1133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1151 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1143);
    float _1153 = _1119 * _1075;
    float _1155 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1159 = _1119 * _1087;
    float _1161 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1163 = _1151 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1165 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1157);
    float _1167 = _1119 * _1083;
    float _1169 = -_1161;
    float _1171 = fma(_1159, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1169);
    float _1173 = -_1149;
    float _1175 = fma(_1173, _1115, 1.0);
    float _1177 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1179 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1181 = -_1167;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1171);
    float _1185 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1187 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1177);
    float _1189 = exp2(_1179);
    float _1191 = fma(_1183, -0.5, 0.5);
    float _1193 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1195 = fma(_1183, 0.5, 0.5);
    float _1197 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1185);
    float _1199 = _1159 + 1.0;
    float _1201 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1193);
    float _1203 = fma(_1195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1205 = log2(_1175);
    float _1207 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1197);
    float _1209 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1201);
    float _1211 = fma(_1195, _1203, -0.212114393711090087890625);
    float _1213 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1207);
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1209);
    float _1217 = fma(_1195, _1211, 1.570728778839111328125);
    float _1219 = 1.0 / _1187;
    float _1221 = -_1159;
    float _1223 = fma(_1189, _1199, _1221);
    float _1225 = fma(_1223, 0.5, 0.5);
    float _1227 = sqrt(_1191);
    float _1229 = _1205 * 0.693147182464599609375;
    float _1231 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1233 = _1215 * _1219;
    float _1235 = _1213 * _1219;
    float _1237 = fma(_1233, 0.5, 0.5);
    float _1239 = fma(_1235, -0.5, 0.5);
    float _1241 = _1227 * 0.636619746685028076171875;
    float3 _3415 = float3(_1237, _1239, _1231);
    float _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3415, float3(0.0), isnan(_3415)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3415, float3(0.0), isnan(_3415)), level(0.0)).x;
    float3 _3426 = float3(_1237, _1239, _1231);
    float4 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3426, float3(0.0), isnan(_3426)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3426, float3(0.0), isnan(_3426)), level(0.0)).xyzw;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1246.w;
    float _1256 = -_1217;
    float _1258 = fma(_1241, _1256, 1.0);
    float2 _3448 = float2(_1258, _1225);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3448, float2(0.0), isnan(_3448)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3448, float2(0.0), isnan(_3448)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float _1270 = in.m_49.y;
    float _1272 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = 1.0 / _1276;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1290 = _1288 != 0;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1300 = _139 > 0.5;
    float _1302 = 1.0 / _1280;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1306 = _477 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1310 = _477 + _1308;
    float _1312 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1316 = _1270 > 0.5;
    float _1318 = _1310 * _1284;
    bool _1320 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1322 = isnan(_477);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1332;
    out.m_58.x = _1292;
    out.m_58.y = _1312;
    out.m_58.z = _1314;
    float _1336 = exp2(_1272);
    float _1338 = fma(_1334, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1340 = _1306 * _1302;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1346;
    float _1350 = -_1330;
    float _1352 = _1350 + 1.0;
    float _1354 = fma(_1344, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1356 = fma(_1348, _1318, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1358 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1360 = isnan(_477);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1374 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1376 = isnan(_477);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1390 = -_511;
    int _1392 = _1300 ? as_type<int>(_1390) : as_type<int>(_511);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1398 = -_505;
    int _1400 = _1316 ? as_type<int>(_1398) : as_type<int>(_505);
    float _1402 = _1384 * _1352;
    float _1404 = -_1384;
    float _1406 = _1404 + 1.0;
    bool _1408 = !_1290;
    float _1410 = _1408 ? _511 : as_type<float>(_1392);
    float _1412 = fma(_1372, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1414 = !_1296;
    float _1416 = _1414 ? _505 : as_type<float>(_1400);
    float _1418 = _1368 * _1406;
    float _1420 = -_1368;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1388, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1426 = fma(_1396, _1340, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1428 = _1354 * _1418;
    float _1430 = _1356 * _1418;
    float _1432 = _1338 * _1418;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1428);
    float _1438 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1430);
    float _1440 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1432);
    float _1442 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1444 = fma(_1412, _1402, _1436);
    float _1446 = fma(_1424, _1402, _1438);
    float _1448 = fma(_1426, _1402, _1440);
    float _1450 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1442);
    float _1452 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1444);
    float _1454 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1446);
    float _1456 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1448);
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1460 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1450);
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1464 = _1410 + 0.5;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1468 = -_1336;
    float _1470 = _1468 + 1.0;
    float _1472 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1460);
    float _1474 = -_1416;
    float _1476 = _1474 + 0.5;
    bool _1478 = _931 > 0.0;
    bool _1480 = isnan(_931);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    float _1488 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1490 = _1472 + _1187;
    float _1492 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1494 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1496 = -_1488;
    float _1498 = _1496 + 1.0;
    float _1500 = _1490 * 0.5;
    float _1502 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1504 = _1454 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1506 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.gl_Position.x = _1215;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1472;
    out.gl_Position.w = _1187;
    float _1508 = _1494 * _1434;
    float _1510 = _1502 * _1462;
    float _1512 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1518 = _1492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1508;
    out.m_60.y = _1510;
    out.m_62.x = _1512;
    out.m_62.y = _1514;
    out.m_62.z = _1516;
    out.m_62.w = _1466;
    out.m_64.z = _1500;
    out.m_64.w = _1187;
    out.m_45.x = _1518;
    float _1520 = _1488 * _1243;
    float _1522 = _1254 * _1520;
    float _1524 = _1268 * _1520;
    float _1526 = fma(_1264, _1522, _1248);
    float _1528 = fma(_1266, _1522, _1250);
    float _1530 = _1254 * _1498;
    float _1532 = fma(_1254, _1524, _1252);
    out.m_66.x = _1526;
    out.m_66.y = _1528;
    out.m_66.z = _1532;
    out.m_66.w = _1530;
    if (_1486)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1534 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1534;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

