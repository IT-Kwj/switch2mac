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
    float4 m_60 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn5)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1533 = as_type<float>(_101);
        out.gl_Position.z = _1533;
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
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1601 = as_type<float>(_137);
        out.gl_Position.z = _1601;
    }
    if (_131)
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
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = floor(_153);
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    float _181 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_159;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    int _199 = abs(_185);
    float _201 = -_155;
    float _203 = _153 + _201;
    bool _205 = !_173;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = float(_199);
    float _213 = -_203;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_191, 0.5, 0.5);
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
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_217;
    float _255 = _245;
    float _257 = _197;
    float _259 = _247;
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _285 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    bool _311 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_285);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = 1.0 / _301;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _309;
    float _329 = 1.0 / _305;
    float _331 = _289 * _323;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_321;
    float _347 = _345 + 1.0;
    float _349 = _343 * _347;
    float _351 = _293 * _327;
    bool _353 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_285);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -_343;
    float _367 = _365 + 1.0;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _373 = _363 * _367;
    float _375 = -_363;
    float _377 = _375 + 1.0;
    float _379 = _297 * _329;
    bool _381 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_285);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = fma(_371, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _407 = fma(_395, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = _391 * _377;
    float _411 = fma(_401, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = -_391;
    float _417 = _415 + 1.0;
    float _419 = _407 * _409;
    float _421 = _411 * _409;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _435 = fma(_425, _351, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _437 = fma(_397, _373, _427);
    float _439 = fma(_431, _351, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _441 = fma(_413, _373, _433);
    float _443 = fma(_435, _349, _437);
    float _445 = fma(_439, _349, _441);
    float _447 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].x, _443);
    float _449 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].y, _445);
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
    float _507 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _509 = _251 * _499;
    float _511 = _251 * _501;
    bool _513 = !_493;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _519 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _521 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _515);
    float _525 = _519 * _517;
    float _527 = _487 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _529 = _521 * _523;
    float _531 = _525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _533 = _487 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
    float _537 = _525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _531);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    float _555 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _559 = _487 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _563 = _551 + _555;
    float _565 = _525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _567 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = _557 + _561;
    float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _573 = _563 + _571;
    float _575 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _565);
    float _577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _579 = _569 + _577;
    float _581 = _573 * _573;
    float _583 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _575);
    float _585 = fma(_579, _579, _581);
    float _587 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_585);
    float _593 = _587 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _595 = _593 + _589;
    bool _597 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _599 = _567;
    float _601 = _489;
    float _603 = _589;
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
        float _623 = _591 + _621;
        float _625 = rsqrt(_585);
        float _627 = _623 * _619;
        float _629 = _595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _631 = _627 * 0.15915493667125701904296875;
        float _633 = _631 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _631 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 + (-1.0);
        float _643 = fma(_639, _629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = _641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _647 = _625 * _643;
        float _649 = fma(_595, _635, _645);
        float _651 = fma(_579, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_573, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _617 = _649;
        _607 = _651;
        _611 = _653;
    }
    float _655 = _617;
    float _657 = _607;
    float _659 = _611;
    float _661 = -_593;
    float _663 = _661 + _655;
    float _665 = -_557;
    float _667 = _665 + _657;
    float _669 = -_551;
    float _671 = _669 + _659;
    float _673 = _593 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _675 = _663 * _663;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = fma(_667, _667, _675);
    bool _689 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _691 = isnan(0.5);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _697 = _693 || _695;
    float _699 = fma(_671, _671, _687);
    float _701 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _673);
    float _703 = _593 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = sqrt(_699);
    float _707 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _701);
    float _709 = _707 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _711 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _713 = 1.0 / _709;
    float _715 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _717 = _715 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _719 = _705 > 0.0;
    float _721 = _717 + _709;
    float _723 = _721 * _713;
    float _725 = _723 * 0.5;
    bool _727 = !_719;
    float _729 = _657;
    float _731 = _655;
    float _733 = _659;
    float _735 = _663;
    float _737 = _713;
    if (!_727)
    {
        float _739 = _197 * _197;
        float _741 = fma(_245, _245, _739);
        float _743 = fma(_247, _247, _741);
        float _745 = rsqrt(_699);
        float _747 = sqrt(_743);
        float _749 = _667 * _745;
        float _751 = _663 * _745;
        bool _753 = _747 > 0.0;
        float _755 = _671 * _745;
        bool _757 = !_753;
        _737 = _745;
        if (!_757)
        {
            float _759 = rsqrt(_743);
            float _761 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _763 = _197 * _759;
            float _765 = _245 * _759;
            float _767 = _751 * _763;
            float _769 = _247 * _759;
            float _771 = fma(_749, _765, _767);
            float _773 = _761 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _775 = fma(_755, _769, _771);
            float _777 = _775 * _773;
            float _779 = fma(_245, _777, _657);
            float _781 = fma(_197, _777, _655);
            float _783 = fma(_247, _777, _659);
            _729 = _779;
            _731 = _781;
            _733 = _783;
            _735 = _769;
            _737 = _777;
        }
    }
    float _785 = _729;
    float _787 = _731;
    float _789 = _733;
    float _791 = _735;
    float _793 = _737;
    float _795 = _791;
    float _797 = _785;
    float _799 = _793;
    float _801 = _789;
    if (_697)
    {
        _795 = 1.0;
    }
    float _803 = _795;
    float _805 = _803;
    if (_685)
    {
        _255 = _785;
    }
    float _807 = _255;
    float _809 = _807;
    if (_685)
    {
        _257 = _787;
    }
    float _811 = _257;
    float _813 = _811;
    if (_685)
    {
        _259 = _789;
    }
    float _815 = _259;
    float _817 = _815;
    if (!_685)
    {
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _821 = _593 + _819;
        float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _825 = _557 + _823;
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _829 = -_557;
        float _831 = _829 + _785;
        float _833 = _821 * _821;
        float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _837 = _551 + _835;
        float _839 = -_593;
        float _841 = _839 + _787;
        float _843 = -_551;
        float _845 = _843 + _789;
        float _847 = fma(_825, _825, _833);
        float _849 = fma(_837, _837, _847);
        float _851 = sqrt(_849);
        float _853 = precise::min(_851, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _855 = _853 * _827;
        float _857 = fma(_831, _855, _557);
        float _859 = fma(_841, _855, _593);
        float _861 = fma(_845, _855, _551);
        _797 = _831;
        _813 = _859;
        _809 = _857;
        _817 = _861;
        _799 = _851;
    }
    float _863 = _797;
    float _865 = _813;
    float _867 = _809;
    float _869 = _817;
    float _871 = _799;
    float _873 = _871;
    float _875 = _863;
    if (!_697)
    {
        float _877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _879 = _877 * 0.15915493667125701904296875;
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _885 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _883);
        float _887 = _879 * 6.283185482025146484375;
        float _889 = cos(_887);
        float _891 = _881 * 0.15915493667125701904296875;
        float _893 = _879 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = 1.0 / _889;
        float _899 = _891 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = _895 * _897;
        float _905 = _891 * 6.283185482025146484375;
        float _907 = sin(_905);
        float _909 = _901 * _903;
        float _911 = 1.0 / _885;
        float _913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _913;
        float _917 = 1.0 / _909;
        float _919 = 1.0 / _915;
        float _921 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _923 = _911 * _921;
        float _925 = _907 * _917;
        float _927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _929 = fma(_925, _923, _927);
        float _931 = _929 * _919;
        float _933 = precise::clamp(_931, 0.0, 1.0);
        _801 = _923;
        _873 = _891;
        _875 = _889;
        _805 = _933;
    }
    float _935 = _801;
    float _937 = _873;
    float _939 = _875;
    float _941 = _805;
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _865 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _867 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _869 + _951;
    float _955 = _945 * _945;
    float _957 = fma(_949, _949, _955);
    float _959 = fma(_953, _953, _957);
    float _961 = rsqrt(_959);
    float _963 = _961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _949 * _963;
    float _967 = _953 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _935;
    float _985 = _981;
    float _987 = _937;
    float _989 = _945;
    float _991 = _963;
    float _993 = _965;
    if (_977)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _995;
    }
    float _997 = _983;
    float _999 = _997;
    if (_977)
    {
        float _1001 = _981 * _997;
        _985 = _1001;
    }
    float _1003 = _985;
    if (_977)
    {
        float _1005 = rsqrt(_973);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = _1007;
    if (_977)
    {
        float _1011 = _1003 * 0.15915493667125701904296875;
        _987 = _1011;
    }
    float _1013 = _987;
    float _1015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1017 = _953;
    if (_977)
    {
        float _1019 = _1013 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        _1017 = _1021;
    }
    float _1023 = _1017;
    float _1025 = precise::max(0.0, _1015);
    float _1027 = _939;
    float _1029 = _1025;
    if (_977)
    {
        float _1031 = _1013 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        _1027 = _1033;
    }
    float _1035 = _1027;
    float _1037 = -_963;
    float _1039 = -_1025;
    float _1041 = fma(_945, _1037, _1039);
    if (_977)
    {
        float _1043 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _989 = _1043;
    }
    float _1045 = _989;
    float _1047 = sqrt(_959);
    float _1049 = _1023;
    float _1051 = _1045;
    if (_977)
    {
        float _1053 = fma(_1023, _1045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = _1055;
    if (!_977)
    {
        _1051 = _969;
    }
    float _1059 = _1051;
    float _1061 = _1059;
    if (_977)
    {
        float _1063 = _1007 * _1055;
        _991 = _1063;
    }
    float _1065 = _991;
    if (!_977)
    {
        _1057 = _1041;
    }
    float _1067 = _1057;
    float _1069 = _1067;
    float _1071 = _1035;
    if (_977)
    {
        float _1073 = _1035 + (-1.0);
        _1029 = _1073;
    }
    float _1075 = _1029;
    float _1077 = _1075;
    if (_977)
    {
        float _1079 = _965 * _1065;
        _993 = _1079;
    }
    float _1081 = _993;
    if (_977)
    {
        float _1083 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1083;
    }
    float _1085 = _1009;
    if (!_977)
    {
        _1077 = _967;
    }
    float _1087 = _1077;
    float _1089 = _1087;
    if (_977)
    {
        float _1091 = _967 * _1065;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_977)
    {
        float _1095 = _1081 * _1081;
        _1061 = _1095;
    }
    float _1097 = _1061;
    if (_977)
    {
        float _1099 = fma(_1041, _1035, _1085);
        _1069 = _1099;
    }
    float _1101 = _1069;
    if (!_977)
    {
        _1071 = _971;
    }
    float _1103 = _1071;
    float _1105 = _1103;
    if (_977)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1101, _1101, _1097);
    float _1113 = _865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1115 = _1111 + _1109;
    float _1117 = _865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1121 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1119);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = _865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = rsqrt(_1115);
    float _1129 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1117);
    float _1131 = -_1123;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1137 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1139 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1141 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1143 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1135);
    float _1145 = abs(_1133);
    float _1147 = log2(_1145);
    float _1149 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1151 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1141);
    float _1153 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1113);
    float _1155 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = _1127 * _1081;
    float _1163 = -_1157;
    float _1165 = fma(_1163, _1137, 1.0);
    float _1167 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1153);
    float _1169 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1171 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1173 = _1127 * _1101;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1177 = _1127 * _1093;
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1171);
    float _1181 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1183 = -_1175;
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1183);
    float _1187 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1189 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1179);
    float _1191 = log2(_1165);
    float _1193 = -_1177;
    float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1185);
    float _1197 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1199 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1189);
    float _1201 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1203 = fma(_1195, -0.5, 0.5);
    float _1205 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1197);
    float _1207 = fma(_1195, 0.5, 0.5);
    float _1209 = exp2(_1187);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1201);
    float _1213 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1205);
    float _1215 = _1173 + 1.0;
    float _1217 = fma(_1207, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1219 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1211);
    float _1221 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1223 = 1.0 / _1199;
    float _1225 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1227 = fma(_1207, _1217, -0.212114393711090087890625);
    float _1229 = fma(_1207, _1227, 1.570728778839111328125);
    float _1231 = sqrt(_1203);
    float _1233 = -_1173;
    float _1235 = fma(_1209, _1215, _1233);
    float _1237 = _1191 * 0.693147182464599609375;
    float _1239 = fma(_1235, 0.5, 0.5);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1243 = _1221 * _1223;
    float _1245 = _1225 * _1223;
    float _1247 = fma(_1243, 0.5, 0.5);
    float _1249 = fma(_1245, -0.5, 0.5);
    float _1251 = _1231 * 0.636619746685028076171875;
    float _1253 = -_1229;
    float _1255 = fma(_1251, _1253, 1.0);
    float3 _3364 = float3(_1247, _1249, _1241);
    float _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3364, float3(0.0), isnan(_3364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3364, float3(0.0), isnan(_3364)), level(0.0)).x;
    float3 _3375 = float3(_1247, _1249, _1241);
    float4 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3375, float3(0.0), isnan(_3375)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3375, float3(0.0), isnan(_3375)), level(0.0)).xyzw;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = _1260.w;
    float2 _3392 = float2(_1255, _1239);
    float3 _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3392, float2(0.0), isnan(_3392)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3392, float2(0.0), isnan(_3392)), level(0.0)).xyz;
    float _1274 = _1272.x;
    float _1276 = _1272.y;
    float _1278 = _1272.z;
    float _1280 = in.m_49.y;
    float _1282 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1284 = _139 > 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1286;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1292 = _1290 != 0;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1296 = _477 + _1294;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1300 = _1298 != 0;
    float _1302 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1282);
    float _1304 = 1.0 / _1288;
    float _1306 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1302);
    bool _1308 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1310 = isnan(_477);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    out.m_58.x = _867;
    out.m_58.y = _865;
    out.m_58.z = _869;
    float _1320 = -_515;
    int _1322 = _1284 ? as_type<int>(_1320) : as_type<int>(_515);
    float _1324 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1306);
    bool _1326 = _941 > 0.0;
    bool _1328 = isnan(_941);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    bool _1336 = !_1292;
    float _1338 = _1336 ? _515 : as_type<float>(_1322);
    bool _1340 = _1280 > 0.5;
    float _1342 = _1338 + 0.5;
    bool _1344 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1346 = isnan(_477);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1296 * _1304;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1362;
    float _1366 = -_1318;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1360, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1372 = fma(_1364, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1374 = _1354 * _1368;
    float _1376 = -_505;
    int _1378 = _1340 ? as_type<int>(_1376) : as_type<int>(_505);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1380;
    float _1384 = -_1354;
    float _1386 = _1384 + 1.0;
    float _1388 = _1372 * _1374;
    bool _1390 = !_1300;
    float _1392 = _1390 ? _505 : as_type<float>(_1378);
    float _1394 = fma(_1382, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1396 = _1370 * _1374;
    float _1398 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1388);
    float _1400 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1402 = _1394 * _1374;
    float _1404 = -_1392;
    float _1406 = _1404 + 0.5;
    float _1408 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1398);
    float _1410 = exp2(_1400);
    float _1412 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1402);
    float _1414 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1396);
    float _1416 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1420 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1412);
    float _1422 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1414);
    float _1424 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1434 = _1422 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1436 = -_1410;
    float _1438 = _1436 + 1.0;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1444 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1221;
    out.gl_Position.y = _1225;
    out.gl_Position.z = _1324;
    out.gl_Position.w = _1199;
    float _1446 = _1416 * _1426;
    float _1448 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1450 = _1324 + _1199;
    float _1452 = -_1444;
    float _1454 = _1452 + 1.0;
    float _1456 = _1450 * 0.5;
    float _1458 = _1432 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1448;
    out.m_60.y = _1430;
    out.m_60.z = _1442;
    float _1460 = _1424 * _1440;
    out.m_62.z = _1456;
    out.m_62.w = _1199;
    out.m_64.x = _1460;
    out.m_64.y = _1446;
    out.m_45.x = _1458;
    float _1462 = _1444 * _1257;
    float _1464 = _1268 * _1462;
    float _1466 = _1278 * _1462;
    float _1468 = fma(_1274, _1464, _1262);
    float _1470 = fma(_1276, _1464, _1264);
    float _1472 = _1268 * _1454;
    float _1474 = fma(_1268, _1466, _1266);
    out.m_66.x = _1468;
    out.m_66.y = _1470;
    out.m_66.z = _1474;
    out.m_66.w = _1472;
    if (_1334)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1476 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1476;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1533 = as_type<float>(_101);
        out.gl_Position.z = _1533;
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
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1601 = as_type<float>(_137);
        out.gl_Position.z = _1601;
    }
    if (_131)
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
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = floor(_153);
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    float _181 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_159;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    int _199 = abs(_185);
    float _201 = -_155;
    float _203 = _153 + _201;
    bool _205 = !_173;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = float(_199);
    float _213 = -_203;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_191, 0.5, 0.5);
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
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_217;
    float _255 = _245;
    float _257 = _197;
    float _259 = _247;
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _285 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    bool _311 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_285);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = 1.0 / _301;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _309;
    float _329 = 1.0 / _305;
    float _331 = _289 * _323;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_321;
    float _347 = _345 + 1.0;
    float _349 = _343 * _347;
    float _351 = _293 * _327;
    bool _353 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_285);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -_343;
    float _367 = _365 + 1.0;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _373 = _363 * _367;
    float _375 = -_363;
    float _377 = _375 + 1.0;
    float _379 = _297 * _329;
    bool _381 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_285);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = fma(_371, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _407 = fma(_395, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = _391 * _377;
    float _411 = fma(_401, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = -_391;
    float _417 = _415 + 1.0;
    float _419 = _407 * _409;
    float _421 = _411 * _409;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _435 = fma(_425, _351, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _437 = fma(_397, _373, _427);
    float _439 = fma(_431, _351, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _441 = fma(_413, _373, _433);
    float _443 = fma(_435, _349, _437);
    float _445 = fma(_439, _349, _441);
    float _447 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].x, _443);
    float _449 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].y, _445);
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
    float _507 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _509 = _251 * _499;
    float _511 = _251 * _501;
    bool _513 = !_493;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _519 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _521 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _515);
    float _525 = _519 * _517;
    float _527 = _487 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _529 = _521 * _523;
    float _531 = _525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _533 = _487 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
    float _537 = _525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _531);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    float _555 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _559 = _487 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _563 = _551 + _555;
    float _565 = _525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _567 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = _557 + _561;
    float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _573 = _563 + _571;
    float _575 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _565);
    float _577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _579 = _569 + _577;
    float _581 = _573 * _573;
    float _583 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _575);
    float _585 = fma(_579, _579, _581);
    float _587 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_585);
    float _593 = _587 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _595 = _593 + _589;
    bool _597 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _599 = _567;
    float _601 = _489;
    float _603 = _589;
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
        float _623 = _591 + _621;
        float _625 = rsqrt(_585);
        float _627 = _623 * _619;
        float _629 = _595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _631 = _627 * 0.15915493667125701904296875;
        float _633 = _631 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _631 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 + (-1.0);
        float _643 = fma(_639, _629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = _641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _647 = _625 * _643;
        float _649 = fma(_595, _635, _645);
        float _651 = fma(_579, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_573, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _617 = _649;
        _607 = _651;
        _611 = _653;
    }
    float _655 = _617;
    float _657 = _607;
    float _659 = _611;
    float _661 = -_593;
    float _663 = _661 + _655;
    float _665 = -_557;
    float _667 = _665 + _657;
    float _669 = -_551;
    float _671 = _669 + _659;
    float _673 = _593 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _675 = _663 * _663;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = fma(_667, _667, _675);
    bool _689 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _691 = isnan(0.5);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _697 = _693 || _695;
    float _699 = fma(_671, _671, _687);
    float _701 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _673);
    float _703 = _593 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = sqrt(_699);
    float _707 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _701);
    float _709 = _707 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _711 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _713 = 1.0 / _709;
    float _715 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _717 = _715 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _719 = _705 > 0.0;
    float _721 = _717 + _709;
    float _723 = _721 * _713;
    float _725 = _723 * 0.5;
    bool _727 = !_719;
    float _729 = _657;
    float _731 = _655;
    float _733 = _659;
    float _735 = _663;
    float _737 = _713;
    if (!_727)
    {
        float _739 = _197 * _197;
        float _741 = fma(_245, _245, _739);
        float _743 = fma(_247, _247, _741);
        float _745 = rsqrt(_699);
        float _747 = sqrt(_743);
        float _749 = _667 * _745;
        float _751 = _663 * _745;
        bool _753 = _747 > 0.0;
        float _755 = _671 * _745;
        bool _757 = !_753;
        _737 = _745;
        if (!_757)
        {
            float _759 = rsqrt(_743);
            float _761 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _763 = _197 * _759;
            float _765 = _245 * _759;
            float _767 = _751 * _763;
            float _769 = _247 * _759;
            float _771 = fma(_749, _765, _767);
            float _773 = _761 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _775 = fma(_755, _769, _771);
            float _777 = _775 * _773;
            float _779 = fma(_245, _777, _657);
            float _781 = fma(_197, _777, _655);
            float _783 = fma(_247, _777, _659);
            _729 = _779;
            _731 = _781;
            _733 = _783;
            _735 = _769;
            _737 = _777;
        }
    }
    float _785 = _729;
    float _787 = _731;
    float _789 = _733;
    float _791 = _735;
    float _793 = _737;
    float _795 = _791;
    float _797 = _785;
    float _799 = _793;
    float _801 = _789;
    if (_697)
    {
        _795 = 1.0;
    }
    float _803 = _795;
    float _805 = _803;
    if (_685)
    {
        _255 = _785;
    }
    float _807 = _255;
    float _809 = _807;
    if (_685)
    {
        _257 = _787;
    }
    float _811 = _257;
    float _813 = _811;
    if (_685)
    {
        _259 = _789;
    }
    float _815 = _259;
    float _817 = _815;
    if (!_685)
    {
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _821 = _593 + _819;
        float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _825 = _557 + _823;
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _829 = -_557;
        float _831 = _829 + _785;
        float _833 = _821 * _821;
        float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _837 = _551 + _835;
        float _839 = -_593;
        float _841 = _839 + _787;
        float _843 = -_551;
        float _845 = _843 + _789;
        float _847 = fma(_825, _825, _833);
        float _849 = fma(_837, _837, _847);
        float _851 = sqrt(_849);
        float _853 = precise::min(_851, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _855 = _853 * _827;
        float _857 = fma(_831, _855, _557);
        float _859 = fma(_841, _855, _593);
        float _861 = fma(_845, _855, _551);
        _797 = _831;
        _813 = _859;
        _809 = _857;
        _817 = _861;
        _799 = _851;
    }
    float _863 = _797;
    float _865 = _813;
    float _867 = _809;
    float _869 = _817;
    float _871 = _799;
    float _873 = _871;
    float _875 = _863;
    if (!_697)
    {
        float _877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _879 = _877 * 0.15915493667125701904296875;
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _885 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _883);
        float _887 = _879 * 6.283185482025146484375;
        float _889 = cos(_887);
        float _891 = _881 * 0.15915493667125701904296875;
        float _893 = _879 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = 1.0 / _889;
        float _899 = _891 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = _895 * _897;
        float _905 = _891 * 6.283185482025146484375;
        float _907 = sin(_905);
        float _909 = _901 * _903;
        float _911 = 1.0 / _885;
        float _913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _913;
        float _917 = 1.0 / _909;
        float _919 = 1.0 / _915;
        float _921 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _923 = _911 * _921;
        float _925 = _907 * _917;
        float _927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _929 = fma(_925, _923, _927);
        float _931 = _929 * _919;
        float _933 = precise::clamp(_931, 0.0, 1.0);
        _801 = _923;
        _873 = _891;
        _875 = _889;
        _805 = _933;
    }
    float _935 = _801;
    float _937 = _873;
    float _939 = _875;
    float _941 = _805;
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _865 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _867 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _869 + _951;
    float _955 = _945 * _945;
    float _957 = fma(_949, _949, _955);
    float _959 = fma(_953, _953, _957);
    float _961 = rsqrt(_959);
    float _963 = _961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _949 * _963;
    float _967 = _953 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _935;
    float _985 = _981;
    float _987 = _937;
    float _989 = _945;
    float _991 = _963;
    float _993 = _965;
    if (_977)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _995;
    }
    float _997 = _983;
    float _999 = _997;
    if (_977)
    {
        float _1001 = _981 * _997;
        _985 = _1001;
    }
    float _1003 = _985;
    if (_977)
    {
        float _1005 = rsqrt(_973);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = _1007;
    if (_977)
    {
        float _1011 = _1003 * 0.15915493667125701904296875;
        _987 = _1011;
    }
    float _1013 = _987;
    float _1015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1017 = _953;
    if (_977)
    {
        float _1019 = _1013 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        _1017 = _1021;
    }
    float _1023 = _1017;
    float _1025 = precise::max(0.0, _1015);
    float _1027 = _939;
    float _1029 = _1025;
    if (_977)
    {
        float _1031 = _1013 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        _1027 = _1033;
    }
    float _1035 = _1027;
    float _1037 = -_963;
    float _1039 = -_1025;
    float _1041 = fma(_945, _1037, _1039);
    if (_977)
    {
        float _1043 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _989 = _1043;
    }
    float _1045 = _989;
    float _1047 = sqrt(_959);
    float _1049 = _1023;
    float _1051 = _1045;
    if (_977)
    {
        float _1053 = fma(_1023, _1045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = _1055;
    if (!_977)
    {
        _1051 = _969;
    }
    float _1059 = _1051;
    float _1061 = _1059;
    if (_977)
    {
        float _1063 = _1007 * _1055;
        _991 = _1063;
    }
    float _1065 = _991;
    if (!_977)
    {
        _1057 = _1041;
    }
    float _1067 = _1057;
    float _1069 = _1067;
    float _1071 = _1035;
    if (_977)
    {
        float _1073 = _1035 + (-1.0);
        _1029 = _1073;
    }
    float _1075 = _1029;
    float _1077 = _1075;
    if (_977)
    {
        float _1079 = _965 * _1065;
        _993 = _1079;
    }
    float _1081 = _993;
    if (_977)
    {
        float _1083 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1083;
    }
    float _1085 = _1009;
    if (!_977)
    {
        _1077 = _967;
    }
    float _1087 = _1077;
    float _1089 = _1087;
    if (_977)
    {
        float _1091 = _967 * _1065;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_977)
    {
        float _1095 = _1081 * _1081;
        _1061 = _1095;
    }
    float _1097 = _1061;
    if (_977)
    {
        float _1099 = fma(_1041, _1035, _1085);
        _1069 = _1099;
    }
    float _1101 = _1069;
    if (!_977)
    {
        _1071 = _971;
    }
    float _1103 = _1071;
    float _1105 = _1103;
    if (_977)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1101, _1101, _1097);
    float _1113 = _865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1115 = _1111 + _1109;
    float _1117 = _865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1121 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1119);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = _865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = rsqrt(_1115);
    float _1129 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1117);
    float _1131 = -_1123;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1137 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1139 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1141 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1143 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1135);
    float _1145 = abs(_1133);
    float _1147 = log2(_1145);
    float _1149 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1151 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1141);
    float _1153 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1113);
    float _1155 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = _1127 * _1081;
    float _1163 = -_1157;
    float _1165 = fma(_1163, _1137, 1.0);
    float _1167 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1153);
    float _1169 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1171 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1173 = _1127 * _1101;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1177 = _1127 * _1093;
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1171);
    float _1181 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1183 = -_1175;
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1183);
    float _1187 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1189 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1179);
    float _1191 = log2(_1165);
    float _1193 = -_1177;
    float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1185);
    float _1197 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1199 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1189);
    float _1201 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1203 = fma(_1195, -0.5, 0.5);
    float _1205 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1197);
    float _1207 = fma(_1195, 0.5, 0.5);
    float _1209 = exp2(_1187);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1201);
    float _1213 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1205);
    float _1215 = _1173 + 1.0;
    float _1217 = fma(_1207, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1219 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1211);
    float _1221 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1223 = 1.0 / _1199;
    float _1225 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1227 = fma(_1207, _1217, -0.212114393711090087890625);
    float _1229 = fma(_1207, _1227, 1.570728778839111328125);
    float _1231 = sqrt(_1203);
    float _1233 = -_1173;
    float _1235 = fma(_1209, _1215, _1233);
    float _1237 = _1191 * 0.693147182464599609375;
    float _1239 = fma(_1235, 0.5, 0.5);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1243 = _1221 * _1223;
    float _1245 = _1225 * _1223;
    float _1247 = fma(_1243, 0.5, 0.5);
    float _1249 = fma(_1245, -0.5, 0.5);
    float _1251 = _1231 * 0.636619746685028076171875;
    float _1253 = -_1229;
    float _1255 = fma(_1251, _1253, 1.0);
    float3 _3364 = float3(_1247, _1249, _1241);
    float _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3364, float3(0.0), isnan(_3364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3364, float3(0.0), isnan(_3364)), level(0.0)).x;
    float3 _3375 = float3(_1247, _1249, _1241);
    float4 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3375, float3(0.0), isnan(_3375)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3375, float3(0.0), isnan(_3375)), level(0.0)).xyzw;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = _1260.w;
    float2 _3392 = float2(_1255, _1239);
    float3 _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3392, float2(0.0), isnan(_3392)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3392, float2(0.0), isnan(_3392)), level(0.0)).xyz;
    float _1274 = _1272.x;
    float _1276 = _1272.y;
    float _1278 = _1272.z;
    float _1280 = in.m_49.y;
    float _1282 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1284 = _139 > 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1286;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1292 = _1290 != 0;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1296 = _477 + _1294;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1300 = _1298 != 0;
    float _1302 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1282);
    float _1304 = 1.0 / _1288;
    float _1306 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1302);
    bool _1308 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1310 = isnan(_477);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    out.m_58.x = _867;
    out.m_58.y = _865;
    out.m_58.z = _869;
    float _1320 = -_515;
    int _1322 = _1284 ? as_type<int>(_1320) : as_type<int>(_515);
    float _1324 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1306);
    bool _1326 = _941 > 0.0;
    bool _1328 = isnan(_941);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    bool _1336 = !_1292;
    float _1338 = _1336 ? _515 : as_type<float>(_1322);
    bool _1340 = _1280 > 0.5;
    float _1342 = _1338 + 0.5;
    bool _1344 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1346 = isnan(_477);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1296 * _1304;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1362;
    float _1366 = -_1318;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1360, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1372 = fma(_1364, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1374 = _1354 * _1368;
    float _1376 = -_505;
    int _1378 = _1340 ? as_type<int>(_1376) : as_type<int>(_505);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1380;
    float _1384 = -_1354;
    float _1386 = _1384 + 1.0;
    float _1388 = _1372 * _1374;
    bool _1390 = !_1300;
    float _1392 = _1390 ? _505 : as_type<float>(_1378);
    float _1394 = fma(_1382, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1396 = _1370 * _1374;
    float _1398 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1388);
    float _1400 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1402 = _1394 * _1374;
    float _1404 = -_1392;
    float _1406 = _1404 + 0.5;
    float _1408 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1398);
    float _1410 = exp2(_1400);
    float _1412 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1402);
    float _1414 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1396);
    float _1416 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1420 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1412);
    float _1422 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1414);
    float _1424 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1434 = _1422 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1436 = -_1410;
    float _1438 = _1436 + 1.0;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1444 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1221;
    out.gl_Position.y = _1225;
    out.gl_Position.z = _1324;
    out.gl_Position.w = _1199;
    float _1446 = _1416 * _1426;
    float _1448 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1450 = _1324 + _1199;
    float _1452 = -_1444;
    float _1454 = _1452 + 1.0;
    float _1456 = _1450 * 0.5;
    float _1458 = _1432 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1448;
    out.m_60.y = _1430;
    out.m_60.z = _1442;
    float _1460 = _1424 * _1440;
    out.m_62.z = _1456;
    out.m_62.w = _1199;
    out.m_64.x = _1460;
    out.m_64.y = _1446;
    out.m_45.x = _1458;
    float _1462 = _1444 * _1257;
    float _1464 = _1268 * _1462;
    float _1466 = _1278 * _1462;
    float _1468 = fma(_1274, _1464, _1262);
    float _1470 = fma(_1276, _1464, _1264);
    float _1472 = _1268 * _1454;
    float _1474 = fma(_1268, _1466, _1266);
    out.m_66.x = _1468;
    out.m_66.y = _1470;
    out.m_66.z = _1474;
    out.m_66.w = _1472;
    if (_1334)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1476 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1476;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1533 = as_type<float>(_101);
        out.gl_Position.z = _1533;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1601 = as_type<float>(_137);
        out.gl_Position.z = _1601;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    float _153 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _155 = floor(_153);
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _153 * 6.283185482025146484375;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    float _181 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    float _187 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_159;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    int _199 = abs(_185);
    float _201 = -_155;
    float _203 = _153 + _201;
    bool _205 = !_173;
    int _207 = _205 ? 0 : 1;
    int _209 = abs(_195);
    float _211 = float(_199);
    float _213 = -_203;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_207);
    float _221 = fma(_191, 0.5, 0.5);
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
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _187);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_217;
    float _255 = _245;
    float _257 = _197;
    float _259 = _247;
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _285 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    bool _311 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_285);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = 1.0 / _301;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _309;
    float _329 = 1.0 / _305;
    float _331 = _289 * _323;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_321;
    float _347 = _345 + 1.0;
    float _349 = _343 * _347;
    float _351 = _293 * _327;
    bool _353 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_285);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -_343;
    float _367 = _365 + 1.0;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _373 = _363 * _367;
    float _375 = -_363;
    float _377 = _375 + 1.0;
    float _379 = _297 * _329;
    bool _381 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _383 = isnan(_285);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = fma(_371, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _407 = fma(_395, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = _391 * _377;
    float _411 = fma(_401, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = -_391;
    float _417 = _415 + 1.0;
    float _419 = _407 * _409;
    float _421 = _411 * _409;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _423;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].x, _419);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _435 = fma(_425, _351, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _437 = fma(_397, _373, _427);
    float _439 = fma(_431, _351, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _441 = fma(_413, _373, _433);
    float _443 = fma(_435, _349, _437);
    float _445 = fma(_439, _349, _441);
    float _447 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].x, _443);
    float _449 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[146].y, _445);
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
    float _507 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _509 = _251 * _499;
    float _511 = _251 * _501;
    bool _513 = !_493;
    float _515 = _513 ? (-0.5) : 0.5;
    float _517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _505);
    float _519 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _521 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _515);
    float _525 = _519 * _517;
    float _527 = _487 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _529 = _521 * _523;
    float _531 = _525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _533 = _487 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
    float _537 = _525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _531);
    float _541 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
    float _547 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
    float _551 = _543 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _553 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
    float _555 = _547 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _557 = _549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _559 = _487 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = _553 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _563 = _551 + _555;
    float _565 = _525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _567 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    float _569 = _557 + _561;
    float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _573 = _563 + _571;
    float _575 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _565);
    float _577 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _579 = _569 + _577;
    float _581 = _573 * _573;
    float _583 = fma(_507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _575);
    float _585 = fma(_579, _579, _581);
    float _587 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
    float _589 = _583 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _591 = sqrt(_585);
    float _593 = _587 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _595 = _593 + _589;
    bool _597 = _591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _599 = _567;
    float _601 = _489;
    float _603 = _589;
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
        float _623 = _591 + _621;
        float _625 = rsqrt(_585);
        float _627 = _623 * _619;
        float _629 = _595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _631 = _627 * 0.15915493667125701904296875;
        float _633 = _631 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _631 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = _635 + (-1.0);
        float _643 = fma(_639, _629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _645 = _641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _647 = _625 * _643;
        float _649 = fma(_595, _635, _645);
        float _651 = fma(_579, _647, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _653 = fma(_573, _647, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _617 = _649;
        _607 = _651;
        _611 = _653;
    }
    float _655 = _617;
    float _657 = _607;
    float _659 = _611;
    float _661 = -_593;
    float _663 = _661 + _655;
    float _665 = -_557;
    float _667 = _665 + _657;
    float _669 = -_551;
    float _671 = _669 + _659;
    float _673 = _593 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _675 = _663 * _663;
    bool _677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _679 = isnan(0.5);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _685 = _681 || _683;
    float _687 = fma(_667, _667, _675);
    bool _689 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _691 = isnan(0.5);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _697 = _693 || _695;
    float _699 = fma(_671, _671, _687);
    float _701 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _673);
    float _703 = _593 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _705 = sqrt(_699);
    float _707 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _701);
    float _709 = _707 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _711 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _703);
    float _713 = 1.0 / _709;
    float _715 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _711);
    float _717 = _715 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _719 = _705 > 0.0;
    float _721 = _717 + _709;
    float _723 = _721 * _713;
    float _725 = _723 * 0.5;
    bool _727 = !_719;
    float _729 = _657;
    float _731 = _655;
    float _733 = _659;
    float _735 = _663;
    float _737 = _713;
    if (!_727)
    {
        float _739 = _197 * _197;
        float _741 = fma(_245, _245, _739);
        float _743 = fma(_247, _247, _741);
        float _745 = rsqrt(_699);
        float _747 = sqrt(_743);
        float _749 = _667 * _745;
        float _751 = _663 * _745;
        bool _753 = _747 > 0.0;
        float _755 = _671 * _745;
        bool _757 = !_753;
        _737 = _745;
        if (!_757)
        {
            float _759 = rsqrt(_743);
            float _761 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _763 = _197 * _759;
            float _765 = _245 * _759;
            float _767 = _751 * _763;
            float _769 = _247 * _759;
            float _771 = fma(_749, _765, _767);
            float _773 = _761 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _775 = fma(_755, _769, _771);
            float _777 = _775 * _773;
            float _779 = fma(_245, _777, _657);
            float _781 = fma(_197, _777, _655);
            float _783 = fma(_247, _777, _659);
            _729 = _779;
            _731 = _781;
            _733 = _783;
            _735 = _769;
            _737 = _777;
        }
    }
    float _785 = _729;
    float _787 = _731;
    float _789 = _733;
    float _791 = _735;
    float _793 = _737;
    float _795 = _791;
    float _797 = _785;
    float _799 = _793;
    float _801 = _789;
    if (_697)
    {
        _795 = 1.0;
    }
    float _803 = _795;
    float _805 = _803;
    if (_685)
    {
        _255 = _785;
    }
    float _807 = _255;
    float _809 = _807;
    if (_685)
    {
        _257 = _787;
    }
    float _811 = _257;
    float _813 = _811;
    if (_685)
    {
        _259 = _789;
    }
    float _815 = _259;
    float _817 = _815;
    if (!_685)
    {
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _821 = _593 + _819;
        float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _825 = _557 + _823;
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _829 = -_557;
        float _831 = _829 + _785;
        float _833 = _821 * _821;
        float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _837 = _551 + _835;
        float _839 = -_593;
        float _841 = _839 + _787;
        float _843 = -_551;
        float _845 = _843 + _789;
        float _847 = fma(_825, _825, _833);
        float _849 = fma(_837, _837, _847);
        float _851 = sqrt(_849);
        float _853 = precise::min(_851, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _855 = _853 * _827;
        float _857 = fma(_831, _855, _557);
        float _859 = fma(_841, _855, _593);
        float _861 = fma(_845, _855, _551);
        _797 = _831;
        _813 = _859;
        _809 = _857;
        _817 = _861;
        _799 = _851;
    }
    float _863 = _797;
    float _865 = _813;
    float _867 = _809;
    float _869 = _817;
    float _871 = _799;
    float _873 = _871;
    float _875 = _863;
    if (!_697)
    {
        float _877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _879 = _877 * 0.15915493667125701904296875;
        float _881 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _885 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _883);
        float _887 = _879 * 6.283185482025146484375;
        float _889 = cos(_887);
        float _891 = _881 * 0.15915493667125701904296875;
        float _893 = _879 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = 1.0 / _889;
        float _899 = _891 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = _895 * _897;
        float _905 = _891 * 6.283185482025146484375;
        float _907 = sin(_905);
        float _909 = _901 * _903;
        float _911 = 1.0 / _885;
        float _913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _913;
        float _917 = 1.0 / _909;
        float _919 = 1.0 / _915;
        float _921 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _923 = _911 * _921;
        float _925 = _907 * _917;
        float _927 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _929 = fma(_925, _923, _927);
        float _931 = _929 * _919;
        float _933 = precise::clamp(_931, 0.0, 1.0);
        _801 = _923;
        _873 = _891;
        _875 = _889;
        _805 = _933;
    }
    float _935 = _801;
    float _937 = _873;
    float _939 = _875;
    float _941 = _805;
    float _943 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _945 = _865 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _949 = _867 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _869 + _951;
    float _955 = _945 * _945;
    float _957 = fma(_949, _949, _955);
    float _959 = fma(_953, _953, _957);
    float _961 = rsqrt(_959);
    float _963 = _961 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _965 = _949 * _963;
    float _967 = _953 * _963;
    float _969 = _965 * _965;
    float _971 = _967 * _967;
    float _973 = _969 + _971;
    float _975 = sqrt(_973);
    bool _977 = _975 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = _975 + _979;
    float _983 = _935;
    float _985 = _981;
    float _987 = _937;
    float _989 = _945;
    float _991 = _963;
    float _993 = _965;
    if (_977)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _995;
    }
    float _997 = _983;
    float _999 = _997;
    if (_977)
    {
        float _1001 = _981 * _997;
        _985 = _1001;
    }
    float _1003 = _985;
    if (_977)
    {
        float _1005 = rsqrt(_973);
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = _1007;
    if (_977)
    {
        float _1011 = _1003 * 0.15915493667125701904296875;
        _987 = _1011;
    }
    float _1013 = _987;
    float _1015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1017 = _953;
    if (_977)
    {
        float _1019 = _1013 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        _1017 = _1021;
    }
    float _1023 = _1017;
    float _1025 = precise::max(0.0, _1015);
    float _1027 = _939;
    float _1029 = _1025;
    if (_977)
    {
        float _1031 = _1013 * 6.283185482025146484375;
        float _1033 = cos(_1031);
        _1027 = _1033;
    }
    float _1035 = _1027;
    float _1037 = -_963;
    float _1039 = -_1025;
    float _1041 = fma(_945, _1037, _1039);
    if (_977)
    {
        float _1043 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _989 = _1043;
    }
    float _1045 = _989;
    float _1047 = sqrt(_959);
    float _1049 = _1023;
    float _1051 = _1045;
    if (_977)
    {
        float _1053 = fma(_1023, _1045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = _1055;
    if (!_977)
    {
        _1051 = _969;
    }
    float _1059 = _1051;
    float _1061 = _1059;
    if (_977)
    {
        float _1063 = _1007 * _1055;
        _991 = _1063;
    }
    float _1065 = _991;
    if (!_977)
    {
        _1057 = _1041;
    }
    float _1067 = _1057;
    float _1069 = _1067;
    float _1071 = _1035;
    if (_977)
    {
        float _1073 = _1035 + (-1.0);
        _1029 = _1073;
    }
    float _1075 = _1029;
    float _1077 = _1075;
    if (_977)
    {
        float _1079 = _965 * _1065;
        _993 = _1079;
    }
    float _1081 = _993;
    if (_977)
    {
        float _1083 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1009 = _1083;
    }
    float _1085 = _1009;
    if (!_977)
    {
        _1077 = _967;
    }
    float _1087 = _1077;
    float _1089 = _1087;
    if (_977)
    {
        float _1091 = _967 * _1065;
        _1089 = _1091;
    }
    float _1093 = _1089;
    if (_977)
    {
        float _1095 = _1081 * _1081;
        _1061 = _1095;
    }
    float _1097 = _1061;
    if (_977)
    {
        float _1099 = fma(_1041, _1035, _1085);
        _1069 = _1099;
    }
    float _1101 = _1069;
    if (!_977)
    {
        _1071 = _971;
    }
    float _1103 = _1071;
    float _1105 = _1103;
    if (_977)
    {
        float _1107 = _1093 * _1093;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = fma(_1101, _1101, _1097);
    float _1113 = _865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1115 = _1111 + _1109;
    float _1117 = _865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1121 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1119);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = _865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1127 = rsqrt(_1115);
    float _1129 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1117);
    float _1131 = -_1123;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1125);
    float _1137 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1139 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1141 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1143 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1135);
    float _1145 = abs(_1133);
    float _1147 = log2(_1145);
    float _1149 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1151 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1141);
    float _1153 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1113);
    float _1155 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1159 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = _1127 * _1081;
    float _1163 = -_1157;
    float _1165 = fma(_1163, _1137, 1.0);
    float _1167 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1153);
    float _1169 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1171 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1173 = _1127 * _1101;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1177 = _1127 * _1093;
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1171);
    float _1181 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1183 = -_1175;
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1183);
    float _1187 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1189 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1179);
    float _1191 = log2(_1165);
    float _1193 = -_1177;
    float _1195 = fma(_1193, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1185);
    float _1197 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1199 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1189);
    float _1201 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1203 = fma(_1195, -0.5, 0.5);
    float _1205 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1197);
    float _1207 = fma(_1195, 0.5, 0.5);
    float _1209 = exp2(_1187);
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1201);
    float _1213 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1205);
    float _1215 = _1173 + 1.0;
    float _1217 = fma(_1207, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1219 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1211);
    float _1221 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1213);
    float _1223 = 1.0 / _1199;
    float _1225 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1227 = fma(_1207, _1217, -0.212114393711090087890625);
    float _1229 = fma(_1207, _1227, 1.570728778839111328125);
    float _1231 = sqrt(_1203);
    float _1233 = -_1173;
    float _1235 = fma(_1209, _1215, _1233);
    float _1237 = _1191 * 0.693147182464599609375;
    float _1239 = fma(_1235, 0.5, 0.5);
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1243 = _1221 * _1223;
    float _1245 = _1225 * _1223;
    float _1247 = fma(_1243, 0.5, 0.5);
    float _1249 = fma(_1245, -0.5, 0.5);
    float _1251 = _1231 * 0.636619746685028076171875;
    float _1253 = -_1229;
    float _1255 = fma(_1251, _1253, 1.0);
    float3 _3364 = float3(_1247, _1249, _1241);
    float _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3364, float3(0.0), isnan(_3364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3364, float3(0.0), isnan(_3364)), level(0.0)).x;
    float3 _3375 = float3(_1247, _1249, _1241);
    float4 _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3375, float3(0.0), isnan(_3375)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3375, float3(0.0), isnan(_3375)), level(0.0)).xyzw;
    float _1262 = _1260.x;
    float _1264 = _1260.y;
    float _1266 = _1260.z;
    float _1268 = _1260.w;
    float2 _3392 = float2(_1255, _1239);
    float3 _1272 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3392, float2(0.0), isnan(_3392)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3392, float2(0.0), isnan(_3392)), level(0.0)).xyz;
    float _1274 = _1272.x;
    float _1276 = _1272.y;
    float _1278 = _1272.z;
    float _1280 = in.m_49.y;
    float _1282 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1284 = _139 > 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1286;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1292 = _1290 != 0;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1296 = _477 + _1294;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1300 = _1298 != 0;
    float _1302 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1282);
    float _1304 = 1.0 / _1288;
    float _1306 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1302);
    bool _1308 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1310 = isnan(_477);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    out.m_58.x = _867;
    out.m_58.y = _865;
    out.m_58.z = _869;
    float _1320 = -_515;
    int _1322 = _1284 ? as_type<int>(_1320) : as_type<int>(_515);
    float _1324 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1306);
    bool _1326 = _941 > 0.0;
    bool _1328 = isnan(_941);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    bool _1336 = !_1292;
    float _1338 = _1336 ? _515 : as_type<float>(_1322);
    bool _1340 = _1280 > 0.5;
    float _1342 = _1338 + 0.5;
    bool _1344 = _477 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1346 = isnan(_477);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1296 * _1304;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1362;
    float _1366 = -_1318;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1360, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1372 = fma(_1364, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1374 = _1354 * _1368;
    float _1376 = -_505;
    int _1378 = _1340 ? as_type<int>(_1376) : as_type<int>(_505);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1380;
    float _1384 = -_1354;
    float _1386 = _1384 + 1.0;
    float _1388 = _1372 * _1374;
    bool _1390 = !_1300;
    float _1392 = _1390 ? _505 : as_type<float>(_1378);
    float _1394 = fma(_1382, _1356, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1396 = _1370 * _1374;
    float _1398 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1388);
    float _1400 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1402 = _1394 * _1374;
    float _1404 = -_1392;
    float _1406 = _1404 + 0.5;
    float _1408 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1398);
    float _1410 = exp2(_1400);
    float _1412 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1402);
    float _1414 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1396);
    float _1416 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1420 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1412);
    float _1422 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1414);
    float _1424 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1430 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _941 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1434 = _1422 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1436 = -_1410;
    float _1438 = _1436 + 1.0;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1442 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1444 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1221;
    out.gl_Position.y = _1225;
    out.gl_Position.z = _1324;
    out.gl_Position.w = _1199;
    float _1446 = _1416 * _1426;
    float _1448 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1450 = _1324 + _1199;
    float _1452 = -_1444;
    float _1454 = _1452 + 1.0;
    float _1456 = _1450 * 0.5;
    float _1458 = _1432 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1448;
    out.m_60.y = _1430;
    out.m_60.z = _1442;
    float _1460 = _1424 * _1440;
    out.m_62.z = _1456;
    out.m_62.w = _1199;
    out.m_64.x = _1460;
    out.m_64.y = _1446;
    out.m_45.x = _1458;
    float _1462 = _1444 * _1257;
    float _1464 = _1268 * _1462;
    float _1466 = _1278 * _1462;
    float _1468 = fma(_1274, _1464, _1262);
    float _1470 = fma(_1276, _1464, _1264);
    float _1472 = _1268 * _1454;
    float _1474 = fma(_1268, _1466, _1266);
    out.m_66.x = _1468;
    out.m_66.y = _1470;
    out.m_66.z = _1474;
    out.m_66.w = _1472;
    if (_1334)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1476 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1476;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

