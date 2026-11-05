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
    bool _423 = false;
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
        float _1487 = as_type<float>(_101);
        out.gl_Position.z = _1487;
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
        float _1555 = as_type<float>(_137);
        out.gl_Position.z = _1555;
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
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_285);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -_301;
    float _325 = _323 + 1.0;
    float _327 = 1.0 / _317;
    bool _329 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_285);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _313 * _325;
    float _343 = -_313;
    float _345 = _343 + 1.0;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _349 = _339 * _345;
    float _351 = 1.0 / _321;
    float _353 = -_339;
    float _355 = _353 + 1.0;
    float _357 = _289 * _327;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _285 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = fma(_365, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_369, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _361 * _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = _371 * _349;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _373 * _349;
    float _389 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _393 = fma(_385, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _395 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _397 = fma(_389, _341, _391);
    float _399 = fma(_393, _341, _395);
    float _401 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].x, _397);
    float _403 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].y, _399);
    bool _405 = !_347;
    float _421;
    if (!_405)
    {
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _409 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_85);
        float _427 = 1.0 / _425;
        float _429 = _119 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = as_type<float>(int(gl_VertexIndex));
    float _435 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _437 = in.m_56.x;
    float _439 = in.m_56.y;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    float _445 = in.m_42.z;
    int _447 = as_type<int>(_433) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_433) & 2;
    bool _453 = _451 != 0;
    float _455 = _403 * _439;
    float _457 = _401 * _437;
    bool _459 = !_453;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _251 * _455;
    float _465 = _251 * _457;
    bool _467 = !_449;
    float _469 = _467 ? (-0.5) : 0.5;
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _461);
    float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _469);
    float _479 = _473 * _471;
    float _481 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _483 = _475 * _477;
    float _485 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _487 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _491 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _485);
    float _495 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _497 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _489);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _491);
    float _501 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].z, _493);
    float _503 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _507 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].z, _499);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _517 = _505 + _509;
    float _519 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _521 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _523 = _511 + _515;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _517 + _525;
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _519);
    float _531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _533 = _523 + _531;
    float _535 = _527 * _527;
    float _537 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].z, _529);
    float _539 = fma(_533, _533, _535);
    float _541 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
    float _543 = _537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = sqrt(_539);
    float _547 = _541 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = _547 + _543;
    bool _551 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _553 = _521;
    float _555 = _445;
    float _557 = _543;
    if (!_551)
    {
        _553 = _523;
    }
    float _559 = _553;
    float _561 = _559;
    if (!_551)
    {
        _555 = _517;
    }
    float _563 = _555;
    float _565 = _563;
    if (!_551)
    {
        _557 = _549;
    }
    float _567 = _557;
    bool _569 = !_551;
    float _571 = _567;
    if (!_569)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _577 = _545 + _575;
        float _579 = rsqrt(_539);
        float _581 = _577 * _573;
        float _583 = _549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _585 = _581 * 0.15915493667125701904296875;
        float _587 = _585 * 6.283185482025146484375;
        float _589 = cos(_587);
        float _591 = _585 * 6.283185482025146484375;
        float _593 = sin(_591);
        float _595 = _589 + (-1.0);
        float _597 = fma(_593, _583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _599 = _595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _601 = _579 * _597;
        float _603 = fma(_549, _589, _599);
        float _605 = fma(_533, _601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _607 = fma(_527, _601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _571 = _603;
        _561 = _605;
        _565 = _607;
    }
    float _609 = _571;
    float _611 = _561;
    float _613 = _565;
    float _615 = -_547;
    float _617 = _615 + _609;
    float _619 = -_511;
    float _621 = _619 + _611;
    float _623 = -_505;
    float _625 = _623 + _613;
    float _627 = _547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _629 = _617 * _617;
    bool _631 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _633 = isnan(0.5);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _639 = _635 || _637;
    float _641 = fma(_621, _621, _629);
    bool _643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _645 = isnan(0.5);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _651 = _647 || _649;
    float _653 = fma(_625, _625, _641);
    float _655 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _627);
    float _657 = _547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _659 = sqrt(_653);
    float _661 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].z, _655);
    float _663 = _661 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _665 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _657);
    float _667 = 1.0 / _663;
    float _669 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].z, _665);
    float _671 = _669 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _673 = _659 > 0.0;
    float _675 = _671 + _663;
    float _677 = _675 * _667;
    float _679 = _677 * 0.5;
    bool _681 = !_673;
    float _683 = _611;
    float _685 = _609;
    float _687 = _613;
    float _689 = _617;
    float _691 = _667;
    if (!_681)
    {
        float _693 = _197 * _197;
        float _695 = fma(_245, _245, _693);
        float _697 = fma(_247, _247, _695);
        float _699 = rsqrt(_653);
        float _701 = sqrt(_697);
        float _703 = _621 * _699;
        float _705 = _617 * _699;
        bool _707 = _701 > 0.0;
        float _709 = _625 * _699;
        bool _711 = !_707;
        _691 = _699;
        if (!_711)
        {
            float _713 = rsqrt(_697);
            float _715 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _717 = _197 * _713;
            float _719 = _245 * _713;
            float _721 = _705 * _717;
            float _723 = _247 * _713;
            float _725 = fma(_703, _719, _721);
            float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _729 = fma(_709, _723, _725);
            float _731 = _729 * _727;
            float _733 = fma(_245, _731, _611);
            float _735 = fma(_197, _731, _609);
            float _737 = fma(_247, _731, _613);
            _683 = _733;
            _685 = _735;
            _687 = _737;
            _689 = _723;
            _691 = _731;
        }
    }
    float _739 = _683;
    float _741 = _685;
    float _743 = _687;
    float _745 = _689;
    float _747 = _691;
    float _749 = _745;
    float _751 = _739;
    float _753 = _747;
    float _755 = _743;
    if (_651)
    {
        _749 = 1.0;
    }
    float _757 = _749;
    float _759 = _757;
    if (_639)
    {
        _255 = _739;
    }
    float _761 = _255;
    float _763 = _761;
    if (_639)
    {
        _257 = _741;
    }
    float _765 = _257;
    float _767 = _765;
    if (_639)
    {
        _259 = _743;
    }
    float _769 = _259;
    float _771 = _769;
    if (!_639)
    {
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _775 = _547 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _779 = _511 + _777;
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _783 = -_511;
        float _785 = _783 + _739;
        float _787 = _775 * _775;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _791 = _505 + _789;
        float _793 = -_547;
        float _795 = _793 + _741;
        float _797 = -_505;
        float _799 = _797 + _743;
        float _801 = fma(_779, _779, _787);
        float _803 = fma(_791, _791, _801);
        float _805 = sqrt(_803);
        float _807 = precise::min(_805, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _809 = _807 * _781;
        float _811 = fma(_785, _809, _511);
        float _813 = fma(_795, _809, _547);
        float _815 = fma(_799, _809, _505);
        _751 = _785;
        _767 = _813;
        _763 = _811;
        _771 = _815;
        _753 = _805;
    }
    float _817 = _751;
    float _819 = _767;
    float _821 = _763;
    float _823 = _771;
    float _825 = _753;
    float _827 = _825;
    float _829 = _817;
    if (!_651)
    {
        float _831 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _833 = _831 * 0.15915493667125701904296875;
        float _835 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _839 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[30].w, _837);
        float _841 = _833 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = _835 * 0.15915493667125701904296875;
        float _847 = _833 * 6.283185482025146484375;
        float _849 = sin(_847);
        float _851 = 1.0 / _843;
        float _853 = _845 * 6.283185482025146484375;
        float _855 = cos(_853);
        float _857 = _849 * _851;
        float _859 = _845 * 6.283185482025146484375;
        float _861 = sin(_859);
        float _863 = _855 * _857;
        float _865 = 1.0 / _839;
        float _867 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _869 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _867;
        float _871 = 1.0 / _863;
        float _873 = 1.0 / _869;
        float _875 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _877 = _865 * _875;
        float _879 = _861 * _871;
        float _881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _883 = fma(_879, _877, _881);
        float _885 = _883 * _873;
        float _887 = precise::clamp(_885, 0.0, 1.0);
        _755 = _877;
        _827 = _845;
        _829 = _843;
        _759 = _887;
    }
    float _889 = _755;
    float _891 = _827;
    float _893 = _829;
    float _895 = _759;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _899 = _819 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _903 = _821 + _901;
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _907 = _823 + _905;
    float _909 = _899 * _899;
    float _911 = fma(_903, _903, _909);
    float _913 = fma(_907, _907, _911);
    float _915 = rsqrt(_913);
    float _917 = _915 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _903 * _917;
    float _921 = _907 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _889;
    float _939 = _935;
    float _941 = _891;
    float _943 = _899;
    float _945 = _917;
    float _947 = _919;
    if (_931)
    {
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _949;
    }
    float _951 = _937;
    float _953 = _951;
    if (_931)
    {
        float _955 = _935 * _951;
        _939 = _955;
    }
    float _957 = _939;
    if (_931)
    {
        float _959 = rsqrt(_927);
        _953 = _959;
    }
    float _961 = _953;
    float _963 = _961;
    if (_931)
    {
        float _965 = _957 * 0.15915493667125701904296875;
        _941 = _965;
    }
    float _967 = _941;
    float _969 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _971 = _907;
    if (_931)
    {
        float _973 = _967 * 6.283185482025146484375;
        float _975 = sin(_973);
        _971 = _975;
    }
    float _977 = _971;
    float _979 = precise::max(0.0, _969);
    float _981 = _893;
    float _983 = _979;
    if (_931)
    {
        float _985 = _967 * 6.283185482025146484375;
        float _987 = cos(_985);
        _981 = _987;
    }
    float _989 = _981;
    float _991 = -_917;
    float _993 = -_979;
    float _995 = fma(_899, _991, _993);
    if (_931)
    {
        float _997 = _995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _997;
    }
    float _999 = _943;
    float _1001 = sqrt(_913);
    float _1003 = _977;
    float _1005 = _999;
    if (_931)
    {
        float _1007 = fma(_977, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = _1009;
    if (!_931)
    {
        _1005 = _923;
    }
    float _1013 = _1005;
    float _1015 = _1013;
    if (_931)
    {
        float _1017 = _961 * _1009;
        _945 = _1017;
    }
    float _1019 = _945;
    if (!_931)
    {
        _1011 = _995;
    }
    float _1021 = _1011;
    float _1023 = _1021;
    float _1025 = _989;
    if (_931)
    {
        float _1027 = _989 + (-1.0);
        _983 = _1027;
    }
    float _1029 = _983;
    float _1031 = _1029;
    if (_931)
    {
        float _1033 = _919 * _1019;
        _947 = _1033;
    }
    float _1035 = _947;
    if (_931)
    {
        float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _963 = _1037;
    }
    float _1039 = _963;
    if (!_931)
    {
        _1031 = _921;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (_931)
    {
        float _1045 = _921 * _1019;
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (_931)
    {
        float _1049 = _1035 * _1035;
        _1015 = _1049;
    }
    float _1051 = _1015;
    if (_931)
    {
        float _1053 = fma(_995, _989, _1039);
        _1023 = _1053;
    }
    float _1055 = _1023;
    if (!_931)
    {
        _1025 = _925;
    }
    float _1057 = _1025;
    float _1059 = _1057;
    if (_931)
    {
        float _1061 = _1047 * _1047;
        _1059 = _1061;
    }
    float _1063 = _1059;
    float _1065 = fma(_1055, _1055, _1051);
    float _1067 = _819 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1069 = _1065 + _1063;
    float _1071 = _819 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1073);
    float _1077 = precise::clamp(_1075, 0.0, 1.0);
    float _1079 = _819 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1081 = rsqrt(_1069);
    float _1083 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1071);
    float _1085 = -_1077;
    float _1087 = _1085 + 1.0;
    float _1089 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1079);
    float _1091 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1093 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1083);
    float _1095 = _819 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1089);
    float _1099 = abs(_1087);
    float _1101 = log2(_1099);
    float _1103 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1105 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1095);
    float _1107 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1067);
    float _1109 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1105);
    float _1115 = _1081 * _1035;
    float _1117 = -_1111;
    float _1119 = fma(_1117, _1091, 1.0);
    float _1121 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1107);
    float _1123 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1127 = _1081 * _1055;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1131 = _1081 * _1047;
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1125);
    float _1135 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1137 = -_1129;
    float _1139 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1137);
    float _1141 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1143 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1133);
    float _1145 = log2(_1119);
    float _1147 = -_1131;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1139);
    float _1151 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1143);
    float _1155 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1157 = fma(_1149, -0.5, 0.5);
    float _1159 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1151);
    float _1161 = fma(_1149, 0.5, 0.5);
    float _1163 = exp2(_1141);
    float _1165 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1155);
    float _1167 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1159);
    float _1169 = _1127 + 1.0;
    float _1171 = fma(_1161, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1173 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1165);
    float _1175 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1177 = 1.0 / _1153;
    float _1179 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1173);
    float _1181 = fma(_1161, _1171, -0.212114393711090087890625);
    float _1183 = fma(_1161, _1181, 1.570728778839111328125);
    float _1185 = sqrt(_1157);
    float _1187 = -_1127;
    float _1189 = fma(_1163, _1169, _1187);
    float _1191 = _1145 * 0.693147182464599609375;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1197 = _1175 * _1177;
    float _1199 = _1179 * _1177;
    float _1201 = fma(_1197, 0.5, 0.5);
    float _1203 = fma(_1199, -0.5, 0.5);
    float _1205 = _1185 * 0.636619746685028076171875;
    float _1207 = -_1183;
    float _1209 = fma(_1205, _1207, 1.0);
    float3 _3243 = float3(_1201, _1203, _1195);
    float _1211 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3243, float3(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3243, float3(0.0), isnan(_3243)), level(0.0)).x;
    float3 _3254 = float3(_1201, _1203, _1195);
    float4 _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).xyzw;
    float _1216 = _1214.x;
    float _1218 = _1214.y;
    float _1220 = _1214.z;
    float _1222 = _1214.w;
    float2 _3271 = float2(_1209, _1193);
    float3 _1226 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3271, float2(0.0), isnan(_3271)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3271, float2(0.0), isnan(_3271)), level(0.0)).xyz;
    float _1228 = _1226.x;
    float _1230 = _1226.y;
    float _1232 = _1226.z;
    float _1234 = in.m_49.y;
    float _1236 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1238 = _139 > 0.5;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1240;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1246 = _1244 != 0;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1250 = _431 + _1248;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    float _1256 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1236);
    float _1258 = 1.0 / _1242;
    float _1260 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1256);
    bool _1262 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1264 = isnan(_431);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    out.m_58.x = _821;
    out.m_58.y = _819;
    out.m_58.z = _823;
    float _1274 = -_469;
    int _1276 = _1238 ? as_type<int>(_1274) : as_type<int>(_469);
    float _1278 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1260);
    bool _1280 = _895 > 0.0;
    bool _1282 = isnan(_895);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    bool _1290 = !_1246;
    float _1292 = _1290 ? _469 : as_type<float>(_1276);
    bool _1294 = _1234 > 0.5;
    float _1296 = _1292 + 0.5;
    bool _1298 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1300 = isnan(_431);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = _1250 * _1258;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1316;
    float _1320 = -_1272;
    float _1322 = _1320 + 1.0;
    float _1324 = fma(_1314, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1326 = fma(_1318, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1328 = _1308 * _1322;
    float _1330 = -_461;
    int _1332 = _1294 ? as_type<int>(_1330) : as_type<int>(_461);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1334;
    float _1338 = -_1308;
    float _1340 = _1338 + 1.0;
    float _1342 = _1326 * _1328;
    bool _1344 = !_1254;
    float _1346 = _1344 ? _461 : as_type<float>(_1332);
    float _1348 = fma(_1336, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1350 = _1324 * _1328;
    float _1352 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1342);
    float _1354 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1356 = _1348 * _1328;
    float _1358 = -_1346;
    float _1360 = _1358 + 0.5;
    float _1362 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1352);
    float _1364 = exp2(_1354);
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1356);
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1350);
    float _1370 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1374 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1366);
    float _1376 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1368);
    float _1378 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1382 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1390 = -_1364;
    float _1392 = _1390 + 1.0;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1179;
    out.gl_Position.z = _1278;
    out.gl_Position.w = _1153;
    float _1400 = _1370 * _1380;
    float _1402 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1278 + _1153;
    float _1406 = -_1398;
    float _1408 = _1406 + 1.0;
    float _1410 = _1404 * 0.5;
    float _1412 = _1386 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1402;
    out.m_60.y = _1384;
    out.m_60.z = _1396;
    float _1414 = _1378 * _1394;
    out.m_62.z = _1410;
    out.m_62.w = _1153;
    out.m_64.x = _1414;
    out.m_64.y = _1400;
    out.m_45.x = _1412;
    float _1416 = _1398 * _1211;
    float _1418 = _1222 * _1416;
    float _1420 = _1232 * _1416;
    float _1422 = fma(_1228, _1418, _1216);
    float _1424 = fma(_1230, _1418, _1218);
    float _1426 = _1222 * _1408;
    float _1428 = fma(_1222, _1420, _1220);
    out.m_66.x = _1422;
    out.m_66.y = _1424;
    out.m_66.z = _1428;
    out.m_66.w = _1426;
    if (_1288)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1430 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1430;
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
    bool _423 = false;
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
        float _1487 = as_type<float>(_101);
        out.gl_Position.z = _1487;
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
        float _1555 = as_type<float>(_137);
        out.gl_Position.z = _1555;
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
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_285);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -_301;
    float _325 = _323 + 1.0;
    float _327 = 1.0 / _317;
    bool _329 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_285);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _313 * _325;
    float _343 = -_313;
    float _345 = _343 + 1.0;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _349 = _339 * _345;
    float _351 = 1.0 / _321;
    float _353 = -_339;
    float _355 = _353 + 1.0;
    float _357 = _289 * _327;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _285 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = fma(_365, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_369, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _361 * _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = _371 * _349;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _373 * _349;
    float _389 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _393 = fma(_385, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _395 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _397 = fma(_389, _341, _391);
    float _399 = fma(_393, _341, _395);
    float _401 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].x, _397);
    float _403 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].y, _399);
    bool _405 = !_347;
    float _421;
    if (!_405)
    {
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _409 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_85);
        float _427 = 1.0 / _425;
        float _429 = _119 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = as_type<float>(int(gl_VertexIndex));
    float _435 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _437 = in.m_56.x;
    float _439 = in.m_56.y;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    float _445 = in.m_42.z;
    int _447 = as_type<int>(_433) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_433) & 2;
    bool _453 = _451 != 0;
    float _455 = _403 * _439;
    float _457 = _401 * _437;
    bool _459 = !_453;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _251 * _455;
    float _465 = _251 * _457;
    bool _467 = !_449;
    float _469 = _467 ? (-0.5) : 0.5;
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _461);
    float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _469);
    float _479 = _473 * _471;
    float _481 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _483 = _475 * _477;
    float _485 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _487 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _491 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _485);
    float _495 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _497 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _489);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _491);
    float _501 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].z, _493);
    float _503 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _507 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].z, _499);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _517 = _505 + _509;
    float _519 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _521 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _523 = _511 + _515;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _517 + _525;
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _519);
    float _531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _533 = _523 + _531;
    float _535 = _527 * _527;
    float _537 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].z, _529);
    float _539 = fma(_533, _533, _535);
    float _541 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
    float _543 = _537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = sqrt(_539);
    float _547 = _541 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = _547 + _543;
    bool _551 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _553 = _521;
    float _555 = _445;
    float _557 = _543;
    if (!_551)
    {
        _553 = _523;
    }
    float _559 = _553;
    float _561 = _559;
    if (!_551)
    {
        _555 = _517;
    }
    float _563 = _555;
    float _565 = _563;
    if (!_551)
    {
        _557 = _549;
    }
    float _567 = _557;
    bool _569 = !_551;
    float _571 = _567;
    if (!_569)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _577 = _545 + _575;
        float _579 = rsqrt(_539);
        float _581 = _577 * _573;
        float _583 = _549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _585 = _581 * 0.15915493667125701904296875;
        float _587 = _585 * 6.283185482025146484375;
        float _589 = cos(_587);
        float _591 = _585 * 6.283185482025146484375;
        float _593 = sin(_591);
        float _595 = _589 + (-1.0);
        float _597 = fma(_593, _583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _599 = _595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _601 = _579 * _597;
        float _603 = fma(_549, _589, _599);
        float _605 = fma(_533, _601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _607 = fma(_527, _601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _571 = _603;
        _561 = _605;
        _565 = _607;
    }
    float _609 = _571;
    float _611 = _561;
    float _613 = _565;
    float _615 = -_547;
    float _617 = _615 + _609;
    float _619 = -_511;
    float _621 = _619 + _611;
    float _623 = -_505;
    float _625 = _623 + _613;
    float _627 = _547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _629 = _617 * _617;
    bool _631 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _633 = isnan(0.5);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _639 = _635 || _637;
    float _641 = fma(_621, _621, _629);
    bool _643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _645 = isnan(0.5);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _651 = _647 || _649;
    float _653 = fma(_625, _625, _641);
    float _655 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _627);
    float _657 = _547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _659 = sqrt(_653);
    float _661 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].z, _655);
    float _663 = _661 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _665 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _657);
    float _667 = 1.0 / _663;
    float _669 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].z, _665);
    float _671 = _669 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _673 = _659 > 0.0;
    float _675 = _671 + _663;
    float _677 = _675 * _667;
    float _679 = _677 * 0.5;
    bool _681 = !_673;
    float _683 = _611;
    float _685 = _609;
    float _687 = _613;
    float _689 = _617;
    float _691 = _667;
    if (!_681)
    {
        float _693 = _197 * _197;
        float _695 = fma(_245, _245, _693);
        float _697 = fma(_247, _247, _695);
        float _699 = rsqrt(_653);
        float _701 = sqrt(_697);
        float _703 = _621 * _699;
        float _705 = _617 * _699;
        bool _707 = _701 > 0.0;
        float _709 = _625 * _699;
        bool _711 = !_707;
        _691 = _699;
        if (!_711)
        {
            float _713 = rsqrt(_697);
            float _715 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _717 = _197 * _713;
            float _719 = _245 * _713;
            float _721 = _705 * _717;
            float _723 = _247 * _713;
            float _725 = fma(_703, _719, _721);
            float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _729 = fma(_709, _723, _725);
            float _731 = _729 * _727;
            float _733 = fma(_245, _731, _611);
            float _735 = fma(_197, _731, _609);
            float _737 = fma(_247, _731, _613);
            _683 = _733;
            _685 = _735;
            _687 = _737;
            _689 = _723;
            _691 = _731;
        }
    }
    float _739 = _683;
    float _741 = _685;
    float _743 = _687;
    float _745 = _689;
    float _747 = _691;
    float _749 = _745;
    float _751 = _739;
    float _753 = _747;
    float _755 = _743;
    if (_651)
    {
        _749 = 1.0;
    }
    float _757 = _749;
    float _759 = _757;
    if (_639)
    {
        _255 = _739;
    }
    float _761 = _255;
    float _763 = _761;
    if (_639)
    {
        _257 = _741;
    }
    float _765 = _257;
    float _767 = _765;
    if (_639)
    {
        _259 = _743;
    }
    float _769 = _259;
    float _771 = _769;
    if (!_639)
    {
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _775 = _547 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _779 = _511 + _777;
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _783 = -_511;
        float _785 = _783 + _739;
        float _787 = _775 * _775;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _791 = _505 + _789;
        float _793 = -_547;
        float _795 = _793 + _741;
        float _797 = -_505;
        float _799 = _797 + _743;
        float _801 = fma(_779, _779, _787);
        float _803 = fma(_791, _791, _801);
        float _805 = sqrt(_803);
        float _807 = precise::min(_805, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _809 = _807 * _781;
        float _811 = fma(_785, _809, _511);
        float _813 = fma(_795, _809, _547);
        float _815 = fma(_799, _809, _505);
        _751 = _785;
        _767 = _813;
        _763 = _811;
        _771 = _815;
        _753 = _805;
    }
    float _817 = _751;
    float _819 = _767;
    float _821 = _763;
    float _823 = _771;
    float _825 = _753;
    float _827 = _825;
    float _829 = _817;
    if (!_651)
    {
        float _831 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _833 = _831 * 0.15915493667125701904296875;
        float _835 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _839 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[30].w, _837);
        float _841 = _833 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = _835 * 0.15915493667125701904296875;
        float _847 = _833 * 6.283185482025146484375;
        float _849 = sin(_847);
        float _851 = 1.0 / _843;
        float _853 = _845 * 6.283185482025146484375;
        float _855 = cos(_853);
        float _857 = _849 * _851;
        float _859 = _845 * 6.283185482025146484375;
        float _861 = sin(_859);
        float _863 = _855 * _857;
        float _865 = 1.0 / _839;
        float _867 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _869 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _867;
        float _871 = 1.0 / _863;
        float _873 = 1.0 / _869;
        float _875 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _877 = _865 * _875;
        float _879 = _861 * _871;
        float _881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _883 = fma(_879, _877, _881);
        float _885 = _883 * _873;
        float _887 = precise::clamp(_885, 0.0, 1.0);
        _755 = _877;
        _827 = _845;
        _829 = _843;
        _759 = _887;
    }
    float _889 = _755;
    float _891 = _827;
    float _893 = _829;
    float _895 = _759;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _899 = _819 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _903 = _821 + _901;
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _907 = _823 + _905;
    float _909 = _899 * _899;
    float _911 = fma(_903, _903, _909);
    float _913 = fma(_907, _907, _911);
    float _915 = rsqrt(_913);
    float _917 = _915 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _903 * _917;
    float _921 = _907 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _889;
    float _939 = _935;
    float _941 = _891;
    float _943 = _899;
    float _945 = _917;
    float _947 = _919;
    if (_931)
    {
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _949;
    }
    float _951 = _937;
    float _953 = _951;
    if (_931)
    {
        float _955 = _935 * _951;
        _939 = _955;
    }
    float _957 = _939;
    if (_931)
    {
        float _959 = rsqrt(_927);
        _953 = _959;
    }
    float _961 = _953;
    float _963 = _961;
    if (_931)
    {
        float _965 = _957 * 0.15915493667125701904296875;
        _941 = _965;
    }
    float _967 = _941;
    float _969 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _971 = _907;
    if (_931)
    {
        float _973 = _967 * 6.283185482025146484375;
        float _975 = sin(_973);
        _971 = _975;
    }
    float _977 = _971;
    float _979 = precise::max(0.0, _969);
    float _981 = _893;
    float _983 = _979;
    if (_931)
    {
        float _985 = _967 * 6.283185482025146484375;
        float _987 = cos(_985);
        _981 = _987;
    }
    float _989 = _981;
    float _991 = -_917;
    float _993 = -_979;
    float _995 = fma(_899, _991, _993);
    if (_931)
    {
        float _997 = _995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _997;
    }
    float _999 = _943;
    float _1001 = sqrt(_913);
    float _1003 = _977;
    float _1005 = _999;
    if (_931)
    {
        float _1007 = fma(_977, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = _1009;
    if (!_931)
    {
        _1005 = _923;
    }
    float _1013 = _1005;
    float _1015 = _1013;
    if (_931)
    {
        float _1017 = _961 * _1009;
        _945 = _1017;
    }
    float _1019 = _945;
    if (!_931)
    {
        _1011 = _995;
    }
    float _1021 = _1011;
    float _1023 = _1021;
    float _1025 = _989;
    if (_931)
    {
        float _1027 = _989 + (-1.0);
        _983 = _1027;
    }
    float _1029 = _983;
    float _1031 = _1029;
    if (_931)
    {
        float _1033 = _919 * _1019;
        _947 = _1033;
    }
    float _1035 = _947;
    if (_931)
    {
        float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _963 = _1037;
    }
    float _1039 = _963;
    if (!_931)
    {
        _1031 = _921;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (_931)
    {
        float _1045 = _921 * _1019;
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (_931)
    {
        float _1049 = _1035 * _1035;
        _1015 = _1049;
    }
    float _1051 = _1015;
    if (_931)
    {
        float _1053 = fma(_995, _989, _1039);
        _1023 = _1053;
    }
    float _1055 = _1023;
    if (!_931)
    {
        _1025 = _925;
    }
    float _1057 = _1025;
    float _1059 = _1057;
    if (_931)
    {
        float _1061 = _1047 * _1047;
        _1059 = _1061;
    }
    float _1063 = _1059;
    float _1065 = fma(_1055, _1055, _1051);
    float _1067 = _819 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1069 = _1065 + _1063;
    float _1071 = _819 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1073);
    float _1077 = precise::clamp(_1075, 0.0, 1.0);
    float _1079 = _819 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1081 = rsqrt(_1069);
    float _1083 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1071);
    float _1085 = -_1077;
    float _1087 = _1085 + 1.0;
    float _1089 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1079);
    float _1091 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1093 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1083);
    float _1095 = _819 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1089);
    float _1099 = abs(_1087);
    float _1101 = log2(_1099);
    float _1103 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1105 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1095);
    float _1107 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1067);
    float _1109 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1105);
    float _1115 = _1081 * _1035;
    float _1117 = -_1111;
    float _1119 = fma(_1117, _1091, 1.0);
    float _1121 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1107);
    float _1123 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1127 = _1081 * _1055;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1131 = _1081 * _1047;
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1125);
    float _1135 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1137 = -_1129;
    float _1139 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1137);
    float _1141 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1143 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1133);
    float _1145 = log2(_1119);
    float _1147 = -_1131;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1139);
    float _1151 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1143);
    float _1155 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1157 = fma(_1149, -0.5, 0.5);
    float _1159 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1151);
    float _1161 = fma(_1149, 0.5, 0.5);
    float _1163 = exp2(_1141);
    float _1165 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1155);
    float _1167 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1159);
    float _1169 = _1127 + 1.0;
    float _1171 = fma(_1161, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1173 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1165);
    float _1175 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1177 = 1.0 / _1153;
    float _1179 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1173);
    float _1181 = fma(_1161, _1171, -0.212114393711090087890625);
    float _1183 = fma(_1161, _1181, 1.570728778839111328125);
    float _1185 = sqrt(_1157);
    float _1187 = -_1127;
    float _1189 = fma(_1163, _1169, _1187);
    float _1191 = _1145 * 0.693147182464599609375;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1197 = _1175 * _1177;
    float _1199 = _1179 * _1177;
    float _1201 = fma(_1197, 0.5, 0.5);
    float _1203 = fma(_1199, -0.5, 0.5);
    float _1205 = _1185 * 0.636619746685028076171875;
    float _1207 = -_1183;
    float _1209 = fma(_1205, _1207, 1.0);
    float3 _3243 = float3(_1201, _1203, _1195);
    float _1211 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3243, float3(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3243, float3(0.0), isnan(_3243)), level(0.0)).x;
    float3 _3254 = float3(_1201, _1203, _1195);
    float4 _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).xyzw;
    float _1216 = _1214.x;
    float _1218 = _1214.y;
    float _1220 = _1214.z;
    float _1222 = _1214.w;
    float2 _3271 = float2(_1209, _1193);
    float3 _1226 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3271, float2(0.0), isnan(_3271)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3271, float2(0.0), isnan(_3271)), level(0.0)).xyz;
    float _1228 = _1226.x;
    float _1230 = _1226.y;
    float _1232 = _1226.z;
    float _1234 = in.m_49.y;
    float _1236 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1238 = _139 > 0.5;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1240;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1246 = _1244 != 0;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1250 = _431 + _1248;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    float _1256 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1236);
    float _1258 = 1.0 / _1242;
    float _1260 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1256);
    bool _1262 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1264 = isnan(_431);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    out.m_58.x = _821;
    out.m_58.y = _819;
    out.m_58.z = _823;
    float _1274 = -_469;
    int _1276 = _1238 ? as_type<int>(_1274) : as_type<int>(_469);
    float _1278 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1260);
    bool _1280 = _895 > 0.0;
    bool _1282 = isnan(_895);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    bool _1290 = !_1246;
    float _1292 = _1290 ? _469 : as_type<float>(_1276);
    bool _1294 = _1234 > 0.5;
    float _1296 = _1292 + 0.5;
    bool _1298 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1300 = isnan(_431);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = _1250 * _1258;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1316;
    float _1320 = -_1272;
    float _1322 = _1320 + 1.0;
    float _1324 = fma(_1314, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1326 = fma(_1318, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1328 = _1308 * _1322;
    float _1330 = -_461;
    int _1332 = _1294 ? as_type<int>(_1330) : as_type<int>(_461);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1334;
    float _1338 = -_1308;
    float _1340 = _1338 + 1.0;
    float _1342 = _1326 * _1328;
    bool _1344 = !_1254;
    float _1346 = _1344 ? _461 : as_type<float>(_1332);
    float _1348 = fma(_1336, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1350 = _1324 * _1328;
    float _1352 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1342);
    float _1354 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1356 = _1348 * _1328;
    float _1358 = -_1346;
    float _1360 = _1358 + 0.5;
    float _1362 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1352);
    float _1364 = exp2(_1354);
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1356);
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1350);
    float _1370 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1374 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1366);
    float _1376 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1368);
    float _1378 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1382 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1390 = -_1364;
    float _1392 = _1390 + 1.0;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1179;
    out.gl_Position.z = _1278;
    out.gl_Position.w = _1153;
    float _1400 = _1370 * _1380;
    float _1402 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1278 + _1153;
    float _1406 = -_1398;
    float _1408 = _1406 + 1.0;
    float _1410 = _1404 * 0.5;
    float _1412 = _1386 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1402;
    out.m_60.y = _1384;
    out.m_60.z = _1396;
    float _1414 = _1378 * _1394;
    out.m_62.z = _1410;
    out.m_62.w = _1153;
    out.m_64.x = _1414;
    out.m_64.y = _1400;
    out.m_45.x = _1412;
    float _1416 = _1398 * _1211;
    float _1418 = _1222 * _1416;
    float _1420 = _1232 * _1416;
    float _1422 = fma(_1228, _1418, _1216);
    float _1424 = fma(_1230, _1418, _1218);
    float _1426 = _1222 * _1408;
    float _1428 = fma(_1222, _1420, _1220);
    out.m_66.x = _1422;
    out.m_66.y = _1424;
    out.m_66.z = _1428;
    out.m_66.w = _1426;
    if (_1288)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1430 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1430;
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
    bool _423 = false;
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
        float _1487 = as_type<float>(_101);
        out.gl_Position.z = _1487;
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
        float _1555 = as_type<float>(_137);
        out.gl_Position.z = _1555;
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
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_285);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -_301;
    float _325 = _323 + 1.0;
    float _327 = 1.0 / _317;
    bool _329 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_285);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _313 * _325;
    float _343 = -_313;
    float _345 = _343 + 1.0;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _349 = _339 * _345;
    float _351 = 1.0 / _321;
    float _353 = -_339;
    float _355 = _353 + 1.0;
    float _357 = _289 * _327;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _285 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = fma(_365, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_369, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = _361 * _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = _371 * _349;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _373 * _349;
    float _389 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _391 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _393 = fma(_385, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _395 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _397 = fma(_389, _341, _391);
    float _399 = fma(_393, _341, _395);
    float _401 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].x, _397);
    float _403 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].y, _399);
    bool _405 = !_347;
    float _421;
    if (!_405)
    {
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _409 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_85);
        float _427 = 1.0 / _425;
        float _429 = _119 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = as_type<float>(int(gl_VertexIndex));
    float _435 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _437 = in.m_56.x;
    float _439 = in.m_56.y;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    float _445 = in.m_42.z;
    int _447 = as_type<int>(_433) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_433) & 2;
    bool _453 = _451 != 0;
    float _455 = _403 * _439;
    float _457 = _401 * _437;
    bool _459 = !_453;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _251 * _455;
    float _465 = _251 * _457;
    bool _467 = !_449;
    float _469 = _467 ? (-0.5) : 0.5;
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _461);
    float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _475 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _469);
    float _479 = _473 * _471;
    float _481 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _483 = _475 * _477;
    float _485 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _487 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _489 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _491 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _485);
    float _495 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _487);
    float _497 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _489);
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _491);
    float _501 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[26].z, _493);
    float _503 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _507 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[24].z, _499);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _511 = _503 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _513 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _517 = _505 + _509;
    float _519 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _521 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
    float _523 = _511 + _515;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _517 + _525;
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _519);
    float _531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _533 = _523 + _531;
    float _535 = _527 * _527;
    float _537 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[25].z, _529);
    float _539 = fma(_533, _533, _535);
    float _541 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
    float _543 = _537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = sqrt(_539);
    float _547 = _541 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _549 = _547 + _543;
    bool _551 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _553 = _521;
    float _555 = _445;
    float _557 = _543;
    if (!_551)
    {
        _553 = _523;
    }
    float _559 = _553;
    float _561 = _559;
    if (!_551)
    {
        _555 = _517;
    }
    float _563 = _555;
    float _565 = _563;
    if (!_551)
    {
        _557 = _549;
    }
    float _567 = _557;
    bool _569 = !_551;
    float _571 = _567;
    if (!_569)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _577 = _545 + _575;
        float _579 = rsqrt(_539);
        float _581 = _577 * _573;
        float _583 = _549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _585 = _581 * 0.15915493667125701904296875;
        float _587 = _585 * 6.283185482025146484375;
        float _589 = cos(_587);
        float _591 = _585 * 6.283185482025146484375;
        float _593 = sin(_591);
        float _595 = _589 + (-1.0);
        float _597 = fma(_593, _583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _599 = _595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _601 = _579 * _597;
        float _603 = fma(_549, _589, _599);
        float _605 = fma(_533, _601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _607 = fma(_527, _601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _571 = _603;
        _561 = _605;
        _565 = _607;
    }
    float _609 = _571;
    float _611 = _561;
    float _613 = _565;
    float _615 = -_547;
    float _617 = _615 + _609;
    float _619 = -_511;
    float _621 = _619 + _611;
    float _623 = -_505;
    float _625 = _623 + _613;
    float _627 = _547 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _629 = _617 * _617;
    bool _631 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _633 = isnan(0.5);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _639 = _635 || _637;
    float _641 = fma(_621, _621, _629);
    bool _643 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _645 = isnan(0.5);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _651 = _647 || _649;
    float _653 = fma(_625, _625, _641);
    float _655 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[11].x, _627);
    float _657 = _547 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _659 = sqrt(_653);
    float _661 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[11].z, _655);
    float _663 = _661 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _665 = fma(_511, (*spvDescriptorSet0.vp_c8)._m0[10].x, _657);
    float _667 = 1.0 / _663;
    float _669 = fma(_505, (*spvDescriptorSet0.vp_c8)._m0[10].z, _665);
    float _671 = _669 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _673 = _659 > 0.0;
    float _675 = _671 + _663;
    float _677 = _675 * _667;
    float _679 = _677 * 0.5;
    bool _681 = !_673;
    float _683 = _611;
    float _685 = _609;
    float _687 = _613;
    float _689 = _617;
    float _691 = _667;
    if (!_681)
    {
        float _693 = _197 * _197;
        float _695 = fma(_245, _245, _693);
        float _697 = fma(_247, _247, _695);
        float _699 = rsqrt(_653);
        float _701 = sqrt(_697);
        float _703 = _621 * _699;
        float _705 = _617 * _699;
        bool _707 = _701 > 0.0;
        float _709 = _625 * _699;
        bool _711 = !_707;
        _691 = _699;
        if (!_711)
        {
            float _713 = rsqrt(_697);
            float _715 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _717 = _197 * _713;
            float _719 = _245 * _713;
            float _721 = _705 * _717;
            float _723 = _247 * _713;
            float _725 = fma(_703, _719, _721);
            float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _729 = fma(_709, _723, _725);
            float _731 = _729 * _727;
            float _733 = fma(_245, _731, _611);
            float _735 = fma(_197, _731, _609);
            float _737 = fma(_247, _731, _613);
            _683 = _733;
            _685 = _735;
            _687 = _737;
            _689 = _723;
            _691 = _731;
        }
    }
    float _739 = _683;
    float _741 = _685;
    float _743 = _687;
    float _745 = _689;
    float _747 = _691;
    float _749 = _745;
    float _751 = _739;
    float _753 = _747;
    float _755 = _743;
    if (_651)
    {
        _749 = 1.0;
    }
    float _757 = _749;
    float _759 = _757;
    if (_639)
    {
        _255 = _739;
    }
    float _761 = _255;
    float _763 = _761;
    if (_639)
    {
        _257 = _741;
    }
    float _765 = _257;
    float _767 = _765;
    if (_639)
    {
        _259 = _743;
    }
    float _769 = _259;
    float _771 = _769;
    if (!_639)
    {
        float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _775 = _547 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _779 = _511 + _777;
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _783 = -_511;
        float _785 = _783 + _739;
        float _787 = _775 * _775;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _791 = _505 + _789;
        float _793 = -_547;
        float _795 = _793 + _741;
        float _797 = -_505;
        float _799 = _797 + _743;
        float _801 = fma(_779, _779, _787);
        float _803 = fma(_791, _791, _801);
        float _805 = sqrt(_803);
        float _807 = precise::min(_805, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _809 = _807 * _781;
        float _811 = fma(_785, _809, _511);
        float _813 = fma(_795, _809, _547);
        float _815 = fma(_799, _809, _505);
        _751 = _785;
        _767 = _813;
        _763 = _811;
        _771 = _815;
        _753 = _805;
    }
    float _817 = _751;
    float _819 = _767;
    float _821 = _763;
    float _823 = _771;
    float _825 = _753;
    float _827 = _825;
    float _829 = _817;
    if (!_651)
    {
        float _831 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _833 = _831 * 0.15915493667125701904296875;
        float _835 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _839 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[30].w, _837);
        float _841 = _833 * 6.283185482025146484375;
        float _843 = cos(_841);
        float _845 = _835 * 0.15915493667125701904296875;
        float _847 = _833 * 6.283185482025146484375;
        float _849 = sin(_847);
        float _851 = 1.0 / _843;
        float _853 = _845 * 6.283185482025146484375;
        float _855 = cos(_853);
        float _857 = _849 * _851;
        float _859 = _845 * 6.283185482025146484375;
        float _861 = sin(_859);
        float _863 = _855 * _857;
        float _865 = 1.0 / _839;
        float _867 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _869 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _867;
        float _871 = 1.0 / _863;
        float _873 = 1.0 / _869;
        float _875 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _877 = _865 * _875;
        float _879 = _861 * _871;
        float _881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _883 = fma(_879, _877, _881);
        float _885 = _883 * _873;
        float _887 = precise::clamp(_885, 0.0, 1.0);
        _755 = _877;
        _827 = _845;
        _829 = _843;
        _759 = _887;
    }
    float _889 = _755;
    float _891 = _827;
    float _893 = _829;
    float _895 = _759;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _899 = _819 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _903 = _821 + _901;
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _907 = _823 + _905;
    float _909 = _899 * _899;
    float _911 = fma(_903, _903, _909);
    float _913 = fma(_907, _907, _911);
    float _915 = rsqrt(_913);
    float _917 = _915 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _903 * _917;
    float _921 = _907 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _889;
    float _939 = _935;
    float _941 = _891;
    float _943 = _899;
    float _945 = _917;
    float _947 = _919;
    if (_931)
    {
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _949;
    }
    float _951 = _937;
    float _953 = _951;
    if (_931)
    {
        float _955 = _935 * _951;
        _939 = _955;
    }
    float _957 = _939;
    if (_931)
    {
        float _959 = rsqrt(_927);
        _953 = _959;
    }
    float _961 = _953;
    float _963 = _961;
    if (_931)
    {
        float _965 = _957 * 0.15915493667125701904296875;
        _941 = _965;
    }
    float _967 = _941;
    float _969 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _971 = _907;
    if (_931)
    {
        float _973 = _967 * 6.283185482025146484375;
        float _975 = sin(_973);
        _971 = _975;
    }
    float _977 = _971;
    float _979 = precise::max(0.0, _969);
    float _981 = _893;
    float _983 = _979;
    if (_931)
    {
        float _985 = _967 * 6.283185482025146484375;
        float _987 = cos(_985);
        _981 = _987;
    }
    float _989 = _981;
    float _991 = -_917;
    float _993 = -_979;
    float _995 = fma(_899, _991, _993);
    if (_931)
    {
        float _997 = _995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _997;
    }
    float _999 = _943;
    float _1001 = sqrt(_913);
    float _1003 = _977;
    float _1005 = _999;
    if (_931)
    {
        float _1007 = fma(_977, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = _1009;
    if (!_931)
    {
        _1005 = _923;
    }
    float _1013 = _1005;
    float _1015 = _1013;
    if (_931)
    {
        float _1017 = _961 * _1009;
        _945 = _1017;
    }
    float _1019 = _945;
    if (!_931)
    {
        _1011 = _995;
    }
    float _1021 = _1011;
    float _1023 = _1021;
    float _1025 = _989;
    if (_931)
    {
        float _1027 = _989 + (-1.0);
        _983 = _1027;
    }
    float _1029 = _983;
    float _1031 = _1029;
    if (_931)
    {
        float _1033 = _919 * _1019;
        _947 = _1033;
    }
    float _1035 = _947;
    if (_931)
    {
        float _1037 = _1029 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _963 = _1037;
    }
    float _1039 = _963;
    if (!_931)
    {
        _1031 = _921;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (_931)
    {
        float _1045 = _921 * _1019;
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (_931)
    {
        float _1049 = _1035 * _1035;
        _1015 = _1049;
    }
    float _1051 = _1015;
    if (_931)
    {
        float _1053 = fma(_995, _989, _1039);
        _1023 = _1053;
    }
    float _1055 = _1023;
    if (!_931)
    {
        _1025 = _925;
    }
    float _1057 = _1025;
    float _1059 = _1057;
    if (_931)
    {
        float _1061 = _1047 * _1047;
        _1059 = _1061;
    }
    float _1063 = _1059;
    float _1065 = fma(_1055, _1055, _1051);
    float _1067 = _819 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1069 = _1065 + _1063;
    float _1071 = _819 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1073);
    float _1077 = precise::clamp(_1075, 0.0, 1.0);
    float _1079 = _819 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1081 = rsqrt(_1069);
    float _1083 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1071);
    float _1085 = -_1077;
    float _1087 = _1085 + 1.0;
    float _1089 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1079);
    float _1091 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1093 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1083);
    float _1095 = _819 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1089);
    float _1099 = abs(_1087);
    float _1101 = log2(_1099);
    float _1103 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1105 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1095);
    float _1107 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1067);
    float _1109 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1111 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1105);
    float _1115 = _1081 * _1035;
    float _1117 = -_1111;
    float _1119 = fma(_1117, _1091, 1.0);
    float _1121 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1107);
    float _1123 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1127 = _1081 * _1055;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1131 = _1081 * _1047;
    float _1133 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1125);
    float _1135 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1137 = -_1129;
    float _1139 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1137);
    float _1141 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1143 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1133);
    float _1145 = log2(_1119);
    float _1147 = -_1131;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1139);
    float _1151 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1143);
    float _1155 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1157 = fma(_1149, -0.5, 0.5);
    float _1159 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1151);
    float _1161 = fma(_1149, 0.5, 0.5);
    float _1163 = exp2(_1141);
    float _1165 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1155);
    float _1167 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1159);
    float _1169 = _1127 + 1.0;
    float _1171 = fma(_1161, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1173 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1165);
    float _1175 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1177 = 1.0 / _1153;
    float _1179 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1173);
    float _1181 = fma(_1161, _1171, -0.212114393711090087890625);
    float _1183 = fma(_1161, _1181, 1.570728778839111328125);
    float _1185 = sqrt(_1157);
    float _1187 = -_1127;
    float _1189 = fma(_1163, _1169, _1187);
    float _1191 = _1145 * 0.693147182464599609375;
    float _1193 = fma(_1189, 0.5, 0.5);
    float _1195 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1197 = _1175 * _1177;
    float _1199 = _1179 * _1177;
    float _1201 = fma(_1197, 0.5, 0.5);
    float _1203 = fma(_1199, -0.5, 0.5);
    float _1205 = _1185 * 0.636619746685028076171875;
    float _1207 = -_1183;
    float _1209 = fma(_1205, _1207, 1.0);
    float3 _3243 = float3(_1201, _1203, _1195);
    float _1211 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3243, float3(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3243, float3(0.0), isnan(_3243)), level(0.0)).x;
    float3 _3254 = float3(_1201, _1203, _1195);
    float4 _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).xyzw;
    float _1216 = _1214.x;
    float _1218 = _1214.y;
    float _1220 = _1214.z;
    float _1222 = _1214.w;
    float2 _3271 = float2(_1209, _1193);
    float3 _1226 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3271, float2(0.0), isnan(_3271)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3271, float2(0.0), isnan(_3271)), level(0.0)).xyz;
    float _1228 = _1226.x;
    float _1230 = _1226.y;
    float _1232 = _1226.z;
    float _1234 = in.m_49.y;
    float _1236 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1238 = _139 > 0.5;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1240;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1246 = _1244 != 0;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1250 = _431 + _1248;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    float _1256 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1236);
    float _1258 = 1.0 / _1242;
    float _1260 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1256);
    bool _1262 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1264 = isnan(_431);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    out.m_58.x = _821;
    out.m_58.y = _819;
    out.m_58.z = _823;
    float _1274 = -_469;
    int _1276 = _1238 ? as_type<int>(_1274) : as_type<int>(_469);
    float _1278 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1260);
    bool _1280 = _895 > 0.0;
    bool _1282 = isnan(_895);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    bool _1290 = !_1246;
    float _1292 = _1290 ? _469 : as_type<float>(_1276);
    bool _1294 = _1234 > 0.5;
    float _1296 = _1292 + 0.5;
    bool _1298 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1300 = isnan(_431);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = _1250 * _1258;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1316;
    float _1320 = -_1272;
    float _1322 = _1320 + 1.0;
    float _1324 = fma(_1314, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1326 = fma(_1318, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1328 = _1308 * _1322;
    float _1330 = -_461;
    int _1332 = _1294 ? as_type<int>(_1330) : as_type<int>(_461);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1334;
    float _1338 = -_1308;
    float _1340 = _1338 + 1.0;
    float _1342 = _1326 * _1328;
    bool _1344 = !_1254;
    float _1346 = _1344 ? _461 : as_type<float>(_1332);
    float _1348 = fma(_1336, _1310, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1350 = _1324 * _1328;
    float _1352 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1342);
    float _1354 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1356 = _1348 * _1328;
    float _1358 = -_1346;
    float _1360 = _1358 + 0.5;
    float _1362 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1352);
    float _1364 = exp2(_1354);
    float _1366 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1356);
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1350);
    float _1370 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1374 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1366);
    float _1376 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1368);
    float _1378 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1382 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1390 = -_1364;
    float _1392 = _1390 + 1.0;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1179;
    out.gl_Position.z = _1278;
    out.gl_Position.w = _1153;
    float _1400 = _1370 * _1380;
    float _1402 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1278 + _1153;
    float _1406 = -_1398;
    float _1408 = _1406 + 1.0;
    float _1410 = _1404 * 0.5;
    float _1412 = _1386 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1402;
    out.m_60.y = _1384;
    out.m_60.z = _1396;
    float _1414 = _1378 * _1394;
    out.m_62.z = _1410;
    out.m_62.w = _1153;
    out.m_64.x = _1414;
    out.m_64.y = _1400;
    out.m_45.x = _1412;
    float _1416 = _1398 * _1211;
    float _1418 = _1222 * _1416;
    float _1420 = _1232 * _1416;
    float _1422 = fma(_1228, _1418, _1216);
    float _1424 = fma(_1230, _1418, _1218);
    float _1426 = _1222 * _1408;
    float _1428 = fma(_1222, _1420, _1220);
    out.m_66.x = _1422;
    out.m_66.y = _1424;
    out.m_66.z = _1428;
    out.m_66.w = _1426;
    if (_1288)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1430 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1430;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

