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
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _555 = false;
    bool _271 = false;
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
        float _1779 = as_type<float>(_101);
        out.gl_Position.z = _1779;
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
        float _1847 = as_type<float>(_137);
        out.gl_Position.z = _1847;
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
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    float _201 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_169;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    int _213 = abs(_195);
    int _215 = abs(_209);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_199);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_189, 0.5, 0.5);
    float _227 = abs(_219);
    float _229 = _221 * _227;
    bool _231 = _205 < 0.5;
    float _233 = float(_231);
    float _235 = -_225;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_213);
    float _241 = -_233;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = fma(_239, _237, _229);
    float _249 = abs(_243);
    float _251 = fma(_245, _249, _247);
    bool _253 = !_223;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _119 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _279 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _301;
    float _305 = 1.0 / _287;
    bool _307 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_279);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = 1.0 / _291;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _279 + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _327 = 1.0 / _299;
    float _329 = _323 * _305;
    bool _331 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _333 = isnan(_279);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    bool _343 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_279);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _303;
    float _357 = _283 * _319;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _361 = _279 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _279 + _363;
    float _367 = 1.0 / _295;
    float _369 = _361 * _327;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _379 = _279 + _377;
    float _381 = _379 * _355;
    bool _383 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _385 = isnan(_279);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_341;
    float _397 = _395 + 1.0;
    float _399 = _365 * _367;
    float _401 = -_353;
    float _403 = _401 + 1.0;
    float _405 = _393 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_393;
    float _413 = _411 + 1.0;
    float _415 = _317 * _403;
    float _417 = -_317;
    float _419 = _417 + 1.0;
    float _421 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _423 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _425 = isnan(_279);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _353 * _413;
    bool _437 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_279);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = _433 * _419;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = fma(_451, _357, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _469 = fma(_455, _357, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _471 = _447 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _375 * _471;
    float _483 = _421 * _471;
    float _485 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _487 = fma(_479, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = fma(_467, _457, _489);
    float _503 = fma(_469, _457, _491);
    float _505 = fma(_495, _369, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _507;
    float _511 = fma(_499, _369, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _513;
    float _517 = fma(_485, _415, _501);
    float _519 = fma(_487, _415, _503);
    float _521 = fma(_509, _381, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _523 = fma(_515, _381, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _525 = fma(_505, _435, _517);
    float _527 = fma(_511, _435, _519);
    float _529 = fma(_521, _405, _525);
    float _531 = fma(_523, _405, _527);
    float _533 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[148].x, _529);
    float _535 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[148].y, _531);
    bool _537 = !_325;
    float _553;
    if (!_537)
    {
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _541 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _545 = _543 * _539;
        float _547 = floor(_545);
        float _549 = -_547;
        float _551 = _545 + _549;
        _553 = _551;
        _555 = true;
    }
    else
    {
        float _557 = float(_85);
        float _559 = 1.0 / _557;
        float _561 = _119 * _559;
        _553 = _561;
    }
    _555 = false;
    float _563 = _553;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    float _571 = as_type<float>(int(gl_VertexIndex));
    float _573 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _575 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _577 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
    float _581 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _583 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    int _585 = as_type<int>(_571) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_571) & 2;
    bool _591 = _589 != 0;
    float _593 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
    float _597 = _593 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _599 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
    float _601 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _597 + _603;
    float _607 = _599 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _611 = _601 + _609;
    float _613 = _605 * _605;
    float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _617 = _607 + _615;
    float _619 = fma(_611, _611, _613);
    float _621 = _201 * _201;
    float _623 = fma(_617, _617, _619);
    float _625 = fma(_197, _197, _621);
    float _627 = rsqrt(_623);
    float _629 = fma(_211, _211, _625);
    float _631 = rsqrt(_629);
    float _633 = _605 * _627;
    float _635 = _611 * _627;
    float _637 = -_633;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _641 = -_635;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _645 = in.m_56.x;
    float _647 = in.m_56.y;
    float _649 = _639 * _639;
    float _651 = _211 * _631;
    float _653 = _197 * _631;
    float _655 = _201 * _631;
    float _657 = fma(_643, _643, _649);
    float _659 = _617 * _627;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _663 = _651 * _661;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _667 = _655 * _665;
    float _669 = -_659;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _675 = -_663;
    float _677 = fma(_653, _673, _675);
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _681 = _653 * _679;
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _685 = -_667;
    float _687 = fma(_651, _683, _685);
    float _689 = fma(_671, _671, _657);
    float _691 = _677 * _677;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _695 = -_681;
    float _697 = fma(_655, _693, _695);
    float _699 = fma(_687, _687, _691);
    float _701 = sqrt(_689);
    float _703 = fma(_697, _697, _699);
    float _705 = _535 * _647;
    float _707 = _533 * _645;
    float _709 = rsqrt(_703);
    float _711 = _251 * _705;
    float _713 = _251 * _707;
    bool _715 = !_591;
    float _717 = _715 ? (-0.5) : 0.5;
    float _719 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _721 = !_587;
    float _723 = _721 ? (-0.5) : 0.5;
    float _725 = _627 * _701;
    float _727 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _717);
    float _731 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _723);
    float _733 = _719 * _725;
    float _735 = _727 * _725;
    float _737 = _677 * _709;
    float _739 = _733 * _729;
    float _741 = _687 * _709;
    float _743 = _697 * _709;
    float _745 = _653 * _737;
    float _747 = _735 * _731;
    float _749 = _739 * _651;
    float _751 = _655 * _743;
    float _753 = -_745;
    float _755 = fma(_655, _741, _753);
    float _757 = _725 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _759 = _757 * 0.5;
    float _761 = _739 * _653;
    float _763 = fma(_747, _743, _749);
    float _765 = -_751;
    float _767 = fma(_651, _737, _765);
    float _769 = fma(_747, _741, _761);
    float _771 = fma(_759, _755, _763);
    float _773 = _651 * _741;
    float _775 = fma(_759, _767, _769);
    float _777 = _607 + _771;
    float _779 = _739 * _655;
    float _781 = _601 + _775;
    float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _785 = _777 + _783;
    float _787 = fma(_747, _737, _779);
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _791 = _781 + _789;
    float _793 = _785 * _785;
    float _795 = fma(_791, _791, _793);
    float _797 = -_773;
    float _799 = fma(_653, _743, _797);
    float _801 = sqrt(_795);
    float _803 = fma(_759, _799, _787);
    float _805 = _597 + _803;
    bool _807 = _801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _809 = _739;
    float _811 = _787;
    float _813 = _781;
    float _815 = _629;
    float _817 = _633;
    float _819 = _717;
    if (!_807)
    {
        _809 = _777;
    }
    float _821 = _809;
    float _823 = _821;
    if (!_807)
    {
        _811 = _805;
    }
    float _825 = _811;
    bool _827 = !_807;
    float _829 = _825;
    if (!_827)
    {
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _835 = _801 + _833;
        float _837 = rsqrt(_795);
        float _839 = _835 * _831;
        float _841 = _805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _843 = _839 * 0.15915493667125701904296875;
        float _845 = _843 * 6.283185482025146484375;
        float _847 = cos(_845);
        float _849 = _843 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = _847 + (-1.0);
        float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = fma(_851, _841, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _859 = fma(_805, _847, _855);
        float _861 = _837 * _857;
        float _863 = fma(_791, _861, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _865 = fma(_785, _861, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _829 = _859;
        _813 = _863;
        _823 = _865;
    }
    float _867 = _829;
    float _869 = _813;
    float _871 = _823;
    float _873 = -_597;
    float _875 = _873 + _867;
    float _877 = -_601;
    float _879 = _877 + _869;
    float _881 = -_607;
    float _883 = _881 + _871;
    float _885 = _875 * _875;
    bool _887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _895 = _891 || _893;
    float _897 = -_635;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _901 = fma(_879, _879, _885);
    float _903 = fma(_883, _883, _901);
    float _905 = sqrt(_903);
    bool _907 = _905 > 0.0;
    bool _909 = !_907;
    float _911 = _869;
    float _913 = _867;
    float _915 = _871;
    float _917 = _905;
    if (!_909)
    {
        float _919 = sqrt(_629);
        float _921 = rsqrt(_903);
        bool _923 = _919 > 0.0;
        float _925 = _879 * _921;
        float _927 = _875 * _921;
        float _929 = _883 * _921;
        bool _931 = !_923;
        _815 = _919;
        _917 = _927;
        if (!_931)
        {
            float _933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _935 = _655 * _927;
            float _937 = fma(_653, _925, _935);
            float _939 = fma(_651, _929, _937);
            float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _943 = _939 * _941;
            float _945 = fma(_197, _943, _869);
            float _947 = fma(_201, _943, _867);
            float _949 = fma(_211, _943, _871);
            _911 = _945;
            _913 = _947;
            _915 = _949;
            _815 = _941;
        }
    }
    float _951 = _911;
    float _953 = _913;
    float _955 = _915;
    float _957 = _815;
    float _959 = _917;
    float _961 = -_635;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _965 = -_633;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _953);
    float _969 = -_659;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _973 = -_633;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _977 = -_659;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _981 = _967;
    float _983 = _963;
    float _985 = _971;
    float _987 = _957;
    float _989 = _959;
    if (!_895)
    {
        float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _993 = _975 + _991;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _997 = _899 + _995;
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1001 = -_597;
        float _1003 = _1001 + _953;
        float _1005 = _993 * _993;
        float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1009 = _979 + _1007;
        float _1011 = -_607;
        float _1013 = _1011 + _955;
        float _1015 = fma(_997, _997, _1005);
        float _1017 = 1.0 / _725;
        float _1019 = fma(_1009, _1009, _1015);
        float _1021 = -_601;
        float _1023 = _1021 + _951;
        float _1025 = sqrt(_1019);
        float _1027 = precise::min(_1025, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1029 = _1027 * _999;
        float _1031 = _1029 * _1017;
        float _1033 = fma(_1023, _1031, _899);
        float _1035 = fma(_1003, _1031, _975);
        float _1037 = fma(_1013, _1031, _979);
        _981 = _1035;
        _983 = _1033;
        _985 = _1037;
    }
    float _1039 = _981;
    float _1041 = _983;
    float _1043 = _985;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = _1039 + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1041 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = _1043 + _1053;
    float _1057 = _1047 * _1047;
    float _1059 = fma(_1051, _1051, _1057);
    float _1061 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1063 = fma(_1055, _1055, _1059);
    float _1065 = rsqrt(_1063);
    float _1067 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1069 = _1051 * _1067;
    float _1071 = _1055 * _1067;
    float _1073 = _1069 * _1069;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    bool _1081 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1079 + _1083;
    float _1087 = _1065;
    float _1089 = _1077;
    float _1091 = _1085;
    float _1093 = _1047;
    if (_1081)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1087 = _1095;
    }
    float _1097 = _1087;
    if (_1081)
    {
        float _1099 = rsqrt(_1077);
        _1089 = _1099;
    }
    float _1101 = _1089;
    float _1103 = _1101;
    if (_1081)
    {
        float _1105 = _1085 * _1097;
        _1091 = _1105;
    }
    float _1107 = _1091;
    if (_1081)
    {
        float _1109 = _1107 * 0.15915493667125701904296875;
        _987 = _1109;
    }
    float _1111 = _987;
    float _1113 = _1055;
    if (_1081)
    {
        float _1115 = _1111 * 6.283185482025146484375;
        float _1117 = sin(_1115);
        _1113 = _1117;
    }
    float _1119 = _1113;
    float _1121 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1123 = precise::max(0.0, _1121);
    float _1125 = _1097;
    float _1127 = _1123;
    if (_1081)
    {
        float _1129 = _1111 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = -_1067;
    float _1137 = -_1123;
    float _1139 = fma(_1047, _1135, _1137);
    if (_1081)
    {
        float _1141 = _1139 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1093 = _1141;
    }
    float _1143 = _1093;
    float _1145 = sqrt(_1063);
    float _1147 = _1143;
    float _1149 = _1119;
    if (_1081)
    {
        float _1151 = fma(_1119, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_1081)
    {
        _1149 = _1069;
    }
    float _1157 = _1149;
    float _1159 = _1157;
    float _1161 = _1133;
    if (_1081)
    {
        float _1163 = _1133 + (-1.0);
        _1127 = _1163;
    }
    float _1165 = _1127;
    float _1167 = _1165;
    if (_1081)
    {
        float _1169 = _1101 * _1153;
        _989 = _1169;
    }
    float _1171 = _989;
    if (!_1081)
    {
        _1155 = _1139;
    }
    float _1173 = _1155;
    float _1175 = _1173;
    if (_1081)
    {
        float _1177 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _817 = _1177;
    }
    float _1179 = _817;
    if (_1081)
    {
        float _1181 = _1069 * _1171;
        _1159 = _1181;
    }
    float _1183 = _1159;
    if (!_1081)
    {
        _1167 = _1071;
    }
    float _1185 = _1167;
    float _1187 = _1185;
    if (_1081)
    {
        float _1189 = _1071 * _1171;
        _1187 = _1189;
    }
    float _1191 = _1187;
    if (!_1081)
    {
        _1103 = _1073;
    }
    float _1193 = _1103;
    float _1195 = _1193;
    if (_1081)
    {
        float _1197 = fma(_1139, _1133, _1179);
        _1175 = _1197;
    }
    float _1199 = _1175;
    if (_1081)
    {
        float _1201 = _1183 * _1183;
        _1195 = _1201;
    }
    float _1203 = _1195;
    if (!_1081)
    {
        _1161 = _1075;
    }
    float _1205 = _1161;
    float _1207 = _1205;
    if (_1081)
    {
        float _1209 = _1191 * _1191;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = fma(_1199, _1199, _1203);
    float _1215 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = _1213 + _1211;
    float _1219 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1223 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1221);
    float _1225 = precise::clamp(_1223, 0.0, 1.0);
    float _1227 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = rsqrt(_1217);
    float _1231 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1219);
    float _1233 = -_1225;
    float _1235 = _1233 + 1.0;
    float _1237 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1227);
    float _1239 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1241 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1231);
    float _1243 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1245 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1237);
    float _1247 = abs(_1235);
    float _1249 = log2(_1247);
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1253 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1261 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1253);
    float _1263 = _1229 * _1183;
    float _1265 = _1229 * _1199;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1269 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1273 = _1229 * _1191;
    float _1275 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1277 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1279 = -_1271;
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1279);
    float _1283 = -_1259;
    float _1285 = fma(_1283, _1061, 1.0);
    float _1287 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1289 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1277);
    float _1291 = -_1273;
    float _1293 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1281);
    float _1295 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1297 = exp2(_1287);
    float _1299 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1289);
    float _1301 = fma(_1293, -0.5, 0.5);
    float _1303 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1305 = fma(_1293, 0.5, 0.5);
    float _1307 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1295);
    float _1309 = _1265 + 1.0;
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1303);
    float _1313 = log2(_1285);
    float _1315 = fma(_1305, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1317 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1307);
    float _1319 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1311);
    float _1321 = fma(_1305, _1315, -0.212114393711090087890625);
    float _1323 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1317);
    float _1325 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1319);
    float _1327 = 1.0 / _1299;
    float _1329 = -_1265;
    float _1331 = fma(_1297, _1309, _1329);
    float _1333 = fma(_1305, _1321, 1.570728778839111328125);
    float _1335 = fma(_1331, 0.5, 0.5);
    float _1337 = sqrt(_1301);
    float _1339 = _1313 * 0.693147182464599609375;
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1343 = _1323 * _1327;
    float _1345 = _1325 * _1327;
    float _1347 = fma(_1343, 0.5, 0.5);
    float _1349 = fma(_1345, -0.5, 0.5);
    float _1351 = _1337 * 0.636619746685028076171875;
    float _1353 = -_1333;
    float _1355 = fma(_1351, _1353, 1.0);
    float3 _3782 = float3(_1347, _1349, _1341);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3782, float3(0.0), isnan(_3782)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3782, float3(0.0), isnan(_3782)), level(0.0)).x;
    float3 _3793 = float3(_1347, _1349, _1341);
    float4 _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3793, float3(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3793, float3(0.0), isnan(_3793)), level(0.0)).xyzw;
    float _1362 = _1360.x;
    float _1364 = _1360.y;
    float _1366 = _1360.z;
    float _1368 = _1360.w;
    float2 _3810 = float2(_1355, _1335);
    float3 _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3810, float2(0.0), isnan(_3810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3810, float2(0.0), isnan(_3810)), level(0.0)).xyz;
    float _1374 = _1372.x;
    float _1376 = _1372.y;
    float _1378 = _1372.z;
    float _1380 = in.m_49.y;
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1390 = _1386 || _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1394 = _563 + _1392;
    bool _1396 = _139 > 0.5;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1408 = _563 + _1406;
    float _1410 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1412 = 1.0 / _1404;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1416 = _1414 != 0;
    float _1418 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1422 = _1420 != 0;
    out.m_58.y = _1039;
    float _1424 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1418);
    float _1426 = 1.0 / _1400;
    float _1428 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1424);
    bool _1430 = _1380 > 0.5;
    float _1432 = _1394 * _1412;
    float _1434 = _975 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1436;
    bool _1440 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1442 = isnan(_563);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = exp2(_1410);
    float _1454 = _1408 * _1426;
    float _1456 = _975 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1458 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1434);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1460;
    float _1464 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1456);
    float _1466 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1458);
    float _1468 = fma(_1462, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1470 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1472 = isnan(_563);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1482;
    float _1486 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1488 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1464);
    float _1490 = fma(_1438, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1500 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1502 = fma(_1484, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1504 = -_1480;
    float _1506 = _1504 + 1.0;
    float _1508 = 1.0 / _1486;
    float _1510 = fma(_1494, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1512 = _1500 + _1486;
    bool _1514 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1516 = isnan(_563);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    float _1526 = _1450 * _1506;
    float _1528 = -_1450;
    float _1530 = _1528 + 1.0;
    float _1532 = -_723;
    int _1534 = _1396 ? as_type<int>(_1532) : as_type<int>(_723);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1542 = _1480;
    if (!_1390)
    {
        _1540 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1544 = _1540;
    float _1546 = _1524 * _1530;
    bool _1548 = !_1416;
    float _1550 = _1548 ? _723 : as_type<float>(_1534);
    float _1552 = -_1524;
    float _1554 = _1552 + 1.0;
    float _1556 = fma(_1498, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1558 = _1468 * _1546;
    float _1560 = _1490 * _1546;
    float _1562 = _1502 * _1546;
    float _1564 = _1512 * _1508;
    float _1566 = _1564 * 0.5;
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1558);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1560);
    float _1572 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    float _1574 = _1566;
    float _1576 = _1568;
    if (!_1390)
    {
        float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1580 = fma(_1566, _1544, _1578);
        _1574 = _1580;
    }
    float _1582 = _1574;
    float _1584 = fma(_1510, _1526, _1568);
    float _1586 = -_717;
    int _1588 = _1430 ? as_type<int>(_1586) : as_type<int>(_717);
    float _1590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1390)
    {
        _1576 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1592 = _1576;
    float _1594 = fma(_1538, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1596 = !_1422;
    float _1598 = _1596 ? _717 : as_type<float>(_1588);
    float _1600 = fma(_1556, _1526, _1570);
    float _1602 = _1550 + 0.5;
    if (!_1390)
    {
        float _1604 = -_1592;
        float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _819 = _1606;
    }
    float _1608 = _819;
    float _1610 = fma(_1594, _1526, _1572);
    float _1612 = _1582;
    if (!_1390)
    {
        float _1614 = 1.0 / _1582;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = -_1598;
    float _1620 = _1618 + 0.5;
    float _1622 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1584);
    float _1624 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1600);
    float _1626 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1610);
    float _1628 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1630 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1634 = _1608;
    if (!_1390)
    {
        float _1636 = 1.0 / _1608;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = _1628 * _1590;
    float _1642 = _1590;
    if (_1390)
    {
        _1642 = 1.0;
    }
    float _1644 = _1642;
    float _1646 = _1624 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1654 = _1644;
    if (!_1390)
    {
        float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1658 = -_1592;
        float _1660 = fma(_1616, _1656, _1658);
        _1542 = _1660;
    }
    float _1662 = _1542;
    float _1664 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1390)
    {
        float _1668 = _1662 * _1638;
        float _1670 = precise::clamp(_1668, 0.0, 1.0);
        _1654 = _1670;
    }
    float _1672 = _1654;
    float _1674 = -_1452;
    float _1676 = _1674 + 1.0;
    float _1678 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1680 = _1672 > 0.0;
    bool _1682 = isnan(_1672);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = _1630 * _1652;
    out.m_60.x = _1690;
    out.m_60.y = _1640;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1694 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1428);
    float _1696 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1698 = -_1678;
    float _1700 = _1698 + 1.0;
    out.m_62.x = _1648;
    out.m_62.y = _1650;
    out.m_62.z = _1666;
    out.m_62.w = _1692;
    float _1702 = _1694 + _1299;
    out.gl_Position.x = _1323;
    out.gl_Position.y = _1325;
    out.gl_Position.z = _1694;
    out.gl_Position.w = _1299;
    float _1704 = _1702 * 0.5;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1704;
    out.m_64.w = _1299;
    out.m_45.x = _1706;
    float _1708 = _1678 * _1357;
    float _1710 = _1368 * _1700;
    float _1712 = _1368 * _1708;
    float _1714 = _1378 * _1708;
    float _1716 = fma(_1374, _1712, _1362);
    float _1718 = fma(_1376, _1712, _1364);
    float _1720 = fma(_1368, _1714, _1366);
    out.m_66.x = _1716;
    out.m_66.y = _1718;
    out.m_66.z = _1720;
    out.m_66.w = _1710;
    if (_1688)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1722 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1722;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _555 = false;
    bool _271 = false;
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
        float _1779 = as_type<float>(_101);
        out.gl_Position.z = _1779;
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
        float _1847 = as_type<float>(_137);
        out.gl_Position.z = _1847;
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
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    float _201 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_169;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    int _213 = abs(_195);
    int _215 = abs(_209);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_199);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_189, 0.5, 0.5);
    float _227 = abs(_219);
    float _229 = _221 * _227;
    bool _231 = _205 < 0.5;
    float _233 = float(_231);
    float _235 = -_225;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_213);
    float _241 = -_233;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = fma(_239, _237, _229);
    float _249 = abs(_243);
    float _251 = fma(_245, _249, _247);
    bool _253 = !_223;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _119 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _279 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _301;
    float _305 = 1.0 / _287;
    bool _307 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_279);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = 1.0 / _291;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _279 + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _327 = 1.0 / _299;
    float _329 = _323 * _305;
    bool _331 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _333 = isnan(_279);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    bool _343 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_279);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _303;
    float _357 = _283 * _319;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _361 = _279 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _279 + _363;
    float _367 = 1.0 / _295;
    float _369 = _361 * _327;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _379 = _279 + _377;
    float _381 = _379 * _355;
    bool _383 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _385 = isnan(_279);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_341;
    float _397 = _395 + 1.0;
    float _399 = _365 * _367;
    float _401 = -_353;
    float _403 = _401 + 1.0;
    float _405 = _393 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_393;
    float _413 = _411 + 1.0;
    float _415 = _317 * _403;
    float _417 = -_317;
    float _419 = _417 + 1.0;
    float _421 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _423 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _425 = isnan(_279);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _353 * _413;
    bool _437 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_279);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = _433 * _419;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = fma(_451, _357, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _469 = fma(_455, _357, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _471 = _447 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _375 * _471;
    float _483 = _421 * _471;
    float _485 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _487 = fma(_479, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = fma(_467, _457, _489);
    float _503 = fma(_469, _457, _491);
    float _505 = fma(_495, _369, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _507;
    float _511 = fma(_499, _369, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _513;
    float _517 = fma(_485, _415, _501);
    float _519 = fma(_487, _415, _503);
    float _521 = fma(_509, _381, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _523 = fma(_515, _381, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _525 = fma(_505, _435, _517);
    float _527 = fma(_511, _435, _519);
    float _529 = fma(_521, _405, _525);
    float _531 = fma(_523, _405, _527);
    float _533 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[148].x, _529);
    float _535 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[148].y, _531);
    bool _537 = !_325;
    float _553;
    if (!_537)
    {
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _541 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _545 = _543 * _539;
        float _547 = floor(_545);
        float _549 = -_547;
        float _551 = _545 + _549;
        _553 = _551;
        _555 = true;
    }
    else
    {
        float _557 = float(_85);
        float _559 = 1.0 / _557;
        float _561 = _119 * _559;
        _553 = _561;
    }
    _555 = false;
    float _563 = _553;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    float _571 = as_type<float>(int(gl_VertexIndex));
    float _573 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _575 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _577 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
    float _581 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _583 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    int _585 = as_type<int>(_571) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_571) & 2;
    bool _591 = _589 != 0;
    float _593 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
    float _597 = _593 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _599 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
    float _601 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _597 + _603;
    float _607 = _599 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _611 = _601 + _609;
    float _613 = _605 * _605;
    float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _617 = _607 + _615;
    float _619 = fma(_611, _611, _613);
    float _621 = _201 * _201;
    float _623 = fma(_617, _617, _619);
    float _625 = fma(_197, _197, _621);
    float _627 = rsqrt(_623);
    float _629 = fma(_211, _211, _625);
    float _631 = rsqrt(_629);
    float _633 = _605 * _627;
    float _635 = _611 * _627;
    float _637 = -_633;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _641 = -_635;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _645 = in.m_56.x;
    float _647 = in.m_56.y;
    float _649 = _639 * _639;
    float _651 = _211 * _631;
    float _653 = _197 * _631;
    float _655 = _201 * _631;
    float _657 = fma(_643, _643, _649);
    float _659 = _617 * _627;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _663 = _651 * _661;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _667 = _655 * _665;
    float _669 = -_659;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _675 = -_663;
    float _677 = fma(_653, _673, _675);
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _681 = _653 * _679;
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _685 = -_667;
    float _687 = fma(_651, _683, _685);
    float _689 = fma(_671, _671, _657);
    float _691 = _677 * _677;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _695 = -_681;
    float _697 = fma(_655, _693, _695);
    float _699 = fma(_687, _687, _691);
    float _701 = sqrt(_689);
    float _703 = fma(_697, _697, _699);
    float _705 = _535 * _647;
    float _707 = _533 * _645;
    float _709 = rsqrt(_703);
    float _711 = _251 * _705;
    float _713 = _251 * _707;
    bool _715 = !_591;
    float _717 = _715 ? (-0.5) : 0.5;
    float _719 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _721 = !_587;
    float _723 = _721 ? (-0.5) : 0.5;
    float _725 = _627 * _701;
    float _727 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _717);
    float _731 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _723);
    float _733 = _719 * _725;
    float _735 = _727 * _725;
    float _737 = _677 * _709;
    float _739 = _733 * _729;
    float _741 = _687 * _709;
    float _743 = _697 * _709;
    float _745 = _653 * _737;
    float _747 = _735 * _731;
    float _749 = _739 * _651;
    float _751 = _655 * _743;
    float _753 = -_745;
    float _755 = fma(_655, _741, _753);
    float _757 = _725 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _759 = _757 * 0.5;
    float _761 = _739 * _653;
    float _763 = fma(_747, _743, _749);
    float _765 = -_751;
    float _767 = fma(_651, _737, _765);
    float _769 = fma(_747, _741, _761);
    float _771 = fma(_759, _755, _763);
    float _773 = _651 * _741;
    float _775 = fma(_759, _767, _769);
    float _777 = _607 + _771;
    float _779 = _739 * _655;
    float _781 = _601 + _775;
    float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _785 = _777 + _783;
    float _787 = fma(_747, _737, _779);
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _791 = _781 + _789;
    float _793 = _785 * _785;
    float _795 = fma(_791, _791, _793);
    float _797 = -_773;
    float _799 = fma(_653, _743, _797);
    float _801 = sqrt(_795);
    float _803 = fma(_759, _799, _787);
    float _805 = _597 + _803;
    bool _807 = _801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _809 = _739;
    float _811 = _787;
    float _813 = _781;
    float _815 = _629;
    float _817 = _633;
    float _819 = _717;
    if (!_807)
    {
        _809 = _777;
    }
    float _821 = _809;
    float _823 = _821;
    if (!_807)
    {
        _811 = _805;
    }
    float _825 = _811;
    bool _827 = !_807;
    float _829 = _825;
    if (!_827)
    {
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _835 = _801 + _833;
        float _837 = rsqrt(_795);
        float _839 = _835 * _831;
        float _841 = _805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _843 = _839 * 0.15915493667125701904296875;
        float _845 = _843 * 6.283185482025146484375;
        float _847 = cos(_845);
        float _849 = _843 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = _847 + (-1.0);
        float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = fma(_851, _841, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _859 = fma(_805, _847, _855);
        float _861 = _837 * _857;
        float _863 = fma(_791, _861, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _865 = fma(_785, _861, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _829 = _859;
        _813 = _863;
        _823 = _865;
    }
    float _867 = _829;
    float _869 = _813;
    float _871 = _823;
    float _873 = -_597;
    float _875 = _873 + _867;
    float _877 = -_601;
    float _879 = _877 + _869;
    float _881 = -_607;
    float _883 = _881 + _871;
    float _885 = _875 * _875;
    bool _887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _895 = _891 || _893;
    float _897 = -_635;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _901 = fma(_879, _879, _885);
    float _903 = fma(_883, _883, _901);
    float _905 = sqrt(_903);
    bool _907 = _905 > 0.0;
    bool _909 = !_907;
    float _911 = _869;
    float _913 = _867;
    float _915 = _871;
    float _917 = _905;
    if (!_909)
    {
        float _919 = sqrt(_629);
        float _921 = rsqrt(_903);
        bool _923 = _919 > 0.0;
        float _925 = _879 * _921;
        float _927 = _875 * _921;
        float _929 = _883 * _921;
        bool _931 = !_923;
        _815 = _919;
        _917 = _927;
        if (!_931)
        {
            float _933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _935 = _655 * _927;
            float _937 = fma(_653, _925, _935);
            float _939 = fma(_651, _929, _937);
            float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _943 = _939 * _941;
            float _945 = fma(_197, _943, _869);
            float _947 = fma(_201, _943, _867);
            float _949 = fma(_211, _943, _871);
            _911 = _945;
            _913 = _947;
            _915 = _949;
            _815 = _941;
        }
    }
    float _951 = _911;
    float _953 = _913;
    float _955 = _915;
    float _957 = _815;
    float _959 = _917;
    float _961 = -_635;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _965 = -_633;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _953);
    float _969 = -_659;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _973 = -_633;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _977 = -_659;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _981 = _967;
    float _983 = _963;
    float _985 = _971;
    float _987 = _957;
    float _989 = _959;
    if (!_895)
    {
        float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _993 = _975 + _991;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _997 = _899 + _995;
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1001 = -_597;
        float _1003 = _1001 + _953;
        float _1005 = _993 * _993;
        float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1009 = _979 + _1007;
        float _1011 = -_607;
        float _1013 = _1011 + _955;
        float _1015 = fma(_997, _997, _1005);
        float _1017 = 1.0 / _725;
        float _1019 = fma(_1009, _1009, _1015);
        float _1021 = -_601;
        float _1023 = _1021 + _951;
        float _1025 = sqrt(_1019);
        float _1027 = precise::min(_1025, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1029 = _1027 * _999;
        float _1031 = _1029 * _1017;
        float _1033 = fma(_1023, _1031, _899);
        float _1035 = fma(_1003, _1031, _975);
        float _1037 = fma(_1013, _1031, _979);
        _981 = _1035;
        _983 = _1033;
        _985 = _1037;
    }
    float _1039 = _981;
    float _1041 = _983;
    float _1043 = _985;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = _1039 + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1041 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = _1043 + _1053;
    float _1057 = _1047 * _1047;
    float _1059 = fma(_1051, _1051, _1057);
    float _1061 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1063 = fma(_1055, _1055, _1059);
    float _1065 = rsqrt(_1063);
    float _1067 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1069 = _1051 * _1067;
    float _1071 = _1055 * _1067;
    float _1073 = _1069 * _1069;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    bool _1081 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1079 + _1083;
    float _1087 = _1065;
    float _1089 = _1077;
    float _1091 = _1085;
    float _1093 = _1047;
    if (_1081)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1087 = _1095;
    }
    float _1097 = _1087;
    if (_1081)
    {
        float _1099 = rsqrt(_1077);
        _1089 = _1099;
    }
    float _1101 = _1089;
    float _1103 = _1101;
    if (_1081)
    {
        float _1105 = _1085 * _1097;
        _1091 = _1105;
    }
    float _1107 = _1091;
    if (_1081)
    {
        float _1109 = _1107 * 0.15915493667125701904296875;
        _987 = _1109;
    }
    float _1111 = _987;
    float _1113 = _1055;
    if (_1081)
    {
        float _1115 = _1111 * 6.283185482025146484375;
        float _1117 = sin(_1115);
        _1113 = _1117;
    }
    float _1119 = _1113;
    float _1121 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1123 = precise::max(0.0, _1121);
    float _1125 = _1097;
    float _1127 = _1123;
    if (_1081)
    {
        float _1129 = _1111 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = -_1067;
    float _1137 = -_1123;
    float _1139 = fma(_1047, _1135, _1137);
    if (_1081)
    {
        float _1141 = _1139 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1093 = _1141;
    }
    float _1143 = _1093;
    float _1145 = sqrt(_1063);
    float _1147 = _1143;
    float _1149 = _1119;
    if (_1081)
    {
        float _1151 = fma(_1119, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_1081)
    {
        _1149 = _1069;
    }
    float _1157 = _1149;
    float _1159 = _1157;
    float _1161 = _1133;
    if (_1081)
    {
        float _1163 = _1133 + (-1.0);
        _1127 = _1163;
    }
    float _1165 = _1127;
    float _1167 = _1165;
    if (_1081)
    {
        float _1169 = _1101 * _1153;
        _989 = _1169;
    }
    float _1171 = _989;
    if (!_1081)
    {
        _1155 = _1139;
    }
    float _1173 = _1155;
    float _1175 = _1173;
    if (_1081)
    {
        float _1177 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _817 = _1177;
    }
    float _1179 = _817;
    if (_1081)
    {
        float _1181 = _1069 * _1171;
        _1159 = _1181;
    }
    float _1183 = _1159;
    if (!_1081)
    {
        _1167 = _1071;
    }
    float _1185 = _1167;
    float _1187 = _1185;
    if (_1081)
    {
        float _1189 = _1071 * _1171;
        _1187 = _1189;
    }
    float _1191 = _1187;
    if (!_1081)
    {
        _1103 = _1073;
    }
    float _1193 = _1103;
    float _1195 = _1193;
    if (_1081)
    {
        float _1197 = fma(_1139, _1133, _1179);
        _1175 = _1197;
    }
    float _1199 = _1175;
    if (_1081)
    {
        float _1201 = _1183 * _1183;
        _1195 = _1201;
    }
    float _1203 = _1195;
    if (!_1081)
    {
        _1161 = _1075;
    }
    float _1205 = _1161;
    float _1207 = _1205;
    if (_1081)
    {
        float _1209 = _1191 * _1191;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = fma(_1199, _1199, _1203);
    float _1215 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = _1213 + _1211;
    float _1219 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1223 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1221);
    float _1225 = precise::clamp(_1223, 0.0, 1.0);
    float _1227 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = rsqrt(_1217);
    float _1231 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1219);
    float _1233 = -_1225;
    float _1235 = _1233 + 1.0;
    float _1237 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1227);
    float _1239 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1241 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1231);
    float _1243 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1245 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1237);
    float _1247 = abs(_1235);
    float _1249 = log2(_1247);
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1253 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1261 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1253);
    float _1263 = _1229 * _1183;
    float _1265 = _1229 * _1199;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1269 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1273 = _1229 * _1191;
    float _1275 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1277 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1279 = -_1271;
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1279);
    float _1283 = -_1259;
    float _1285 = fma(_1283, _1061, 1.0);
    float _1287 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1289 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1277);
    float _1291 = -_1273;
    float _1293 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1281);
    float _1295 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1297 = exp2(_1287);
    float _1299 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1289);
    float _1301 = fma(_1293, -0.5, 0.5);
    float _1303 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1305 = fma(_1293, 0.5, 0.5);
    float _1307 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1295);
    float _1309 = _1265 + 1.0;
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1303);
    float _1313 = log2(_1285);
    float _1315 = fma(_1305, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1317 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1307);
    float _1319 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1311);
    float _1321 = fma(_1305, _1315, -0.212114393711090087890625);
    float _1323 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1317);
    float _1325 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1319);
    float _1327 = 1.0 / _1299;
    float _1329 = -_1265;
    float _1331 = fma(_1297, _1309, _1329);
    float _1333 = fma(_1305, _1321, 1.570728778839111328125);
    float _1335 = fma(_1331, 0.5, 0.5);
    float _1337 = sqrt(_1301);
    float _1339 = _1313 * 0.693147182464599609375;
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1343 = _1323 * _1327;
    float _1345 = _1325 * _1327;
    float _1347 = fma(_1343, 0.5, 0.5);
    float _1349 = fma(_1345, -0.5, 0.5);
    float _1351 = _1337 * 0.636619746685028076171875;
    float _1353 = -_1333;
    float _1355 = fma(_1351, _1353, 1.0);
    float3 _3782 = float3(_1347, _1349, _1341);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3782, float3(0.0), isnan(_3782)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3782, float3(0.0), isnan(_3782)), level(0.0)).x;
    float3 _3793 = float3(_1347, _1349, _1341);
    float4 _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3793, float3(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3793, float3(0.0), isnan(_3793)), level(0.0)).xyzw;
    float _1362 = _1360.x;
    float _1364 = _1360.y;
    float _1366 = _1360.z;
    float _1368 = _1360.w;
    float2 _3810 = float2(_1355, _1335);
    float3 _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3810, float2(0.0), isnan(_3810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3810, float2(0.0), isnan(_3810)), level(0.0)).xyz;
    float _1374 = _1372.x;
    float _1376 = _1372.y;
    float _1378 = _1372.z;
    float _1380 = in.m_49.y;
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1390 = _1386 || _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1394 = _563 + _1392;
    bool _1396 = _139 > 0.5;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1408 = _563 + _1406;
    float _1410 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1412 = 1.0 / _1404;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1416 = _1414 != 0;
    float _1418 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1422 = _1420 != 0;
    out.m_58.y = _1039;
    float _1424 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1418);
    float _1426 = 1.0 / _1400;
    float _1428 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1424);
    bool _1430 = _1380 > 0.5;
    float _1432 = _1394 * _1412;
    float _1434 = _975 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1436;
    bool _1440 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1442 = isnan(_563);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = exp2(_1410);
    float _1454 = _1408 * _1426;
    float _1456 = _975 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1458 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1434);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1460;
    float _1464 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1456);
    float _1466 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1458);
    float _1468 = fma(_1462, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1470 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1472 = isnan(_563);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1482;
    float _1486 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1488 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1464);
    float _1490 = fma(_1438, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1500 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1502 = fma(_1484, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1504 = -_1480;
    float _1506 = _1504 + 1.0;
    float _1508 = 1.0 / _1486;
    float _1510 = fma(_1494, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1512 = _1500 + _1486;
    bool _1514 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1516 = isnan(_563);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    float _1526 = _1450 * _1506;
    float _1528 = -_1450;
    float _1530 = _1528 + 1.0;
    float _1532 = -_723;
    int _1534 = _1396 ? as_type<int>(_1532) : as_type<int>(_723);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1542 = _1480;
    if (!_1390)
    {
        _1540 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1544 = _1540;
    float _1546 = _1524 * _1530;
    bool _1548 = !_1416;
    float _1550 = _1548 ? _723 : as_type<float>(_1534);
    float _1552 = -_1524;
    float _1554 = _1552 + 1.0;
    float _1556 = fma(_1498, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1558 = _1468 * _1546;
    float _1560 = _1490 * _1546;
    float _1562 = _1502 * _1546;
    float _1564 = _1512 * _1508;
    float _1566 = _1564 * 0.5;
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1558);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1560);
    float _1572 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    float _1574 = _1566;
    float _1576 = _1568;
    if (!_1390)
    {
        float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1580 = fma(_1566, _1544, _1578);
        _1574 = _1580;
    }
    float _1582 = _1574;
    float _1584 = fma(_1510, _1526, _1568);
    float _1586 = -_717;
    int _1588 = _1430 ? as_type<int>(_1586) : as_type<int>(_717);
    float _1590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1390)
    {
        _1576 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1592 = _1576;
    float _1594 = fma(_1538, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1596 = !_1422;
    float _1598 = _1596 ? _717 : as_type<float>(_1588);
    float _1600 = fma(_1556, _1526, _1570);
    float _1602 = _1550 + 0.5;
    if (!_1390)
    {
        float _1604 = -_1592;
        float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _819 = _1606;
    }
    float _1608 = _819;
    float _1610 = fma(_1594, _1526, _1572);
    float _1612 = _1582;
    if (!_1390)
    {
        float _1614 = 1.0 / _1582;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = -_1598;
    float _1620 = _1618 + 0.5;
    float _1622 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1584);
    float _1624 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1600);
    float _1626 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1610);
    float _1628 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1630 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1634 = _1608;
    if (!_1390)
    {
        float _1636 = 1.0 / _1608;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = _1628 * _1590;
    float _1642 = _1590;
    if (_1390)
    {
        _1642 = 1.0;
    }
    float _1644 = _1642;
    float _1646 = _1624 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1654 = _1644;
    if (!_1390)
    {
        float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1658 = -_1592;
        float _1660 = fma(_1616, _1656, _1658);
        _1542 = _1660;
    }
    float _1662 = _1542;
    float _1664 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1390)
    {
        float _1668 = _1662 * _1638;
        float _1670 = precise::clamp(_1668, 0.0, 1.0);
        _1654 = _1670;
    }
    float _1672 = _1654;
    float _1674 = -_1452;
    float _1676 = _1674 + 1.0;
    float _1678 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1680 = _1672 > 0.0;
    bool _1682 = isnan(_1672);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = _1630 * _1652;
    out.m_60.x = _1690;
    out.m_60.y = _1640;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1694 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1428);
    float _1696 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1698 = -_1678;
    float _1700 = _1698 + 1.0;
    out.m_62.x = _1648;
    out.m_62.y = _1650;
    out.m_62.z = _1666;
    out.m_62.w = _1692;
    float _1702 = _1694 + _1299;
    out.gl_Position.x = _1323;
    out.gl_Position.y = _1325;
    out.gl_Position.z = _1694;
    out.gl_Position.w = _1299;
    float _1704 = _1702 * 0.5;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1704;
    out.m_64.w = _1299;
    out.m_45.x = _1706;
    float _1708 = _1678 * _1357;
    float _1710 = _1368 * _1700;
    float _1712 = _1368 * _1708;
    float _1714 = _1378 * _1708;
    float _1716 = fma(_1374, _1712, _1362);
    float _1718 = fma(_1376, _1712, _1364);
    float _1720 = fma(_1368, _1714, _1366);
    out.m_66.x = _1716;
    out.m_66.y = _1718;
    out.m_66.z = _1720;
    out.m_66.w = _1710;
    if (_1688)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1722 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1722;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _555 = false;
    bool _271 = false;
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
        float _1779 = as_type<float>(_101);
        out.gl_Position.z = _1779;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1847 = as_type<float>(_137);
        out.gl_Position.z = _1847;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    float _201 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_169;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _191);
    int _213 = abs(_195);
    int _215 = abs(_209);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_199);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_189, 0.5, 0.5);
    float _227 = abs(_219);
    float _229 = _221 * _227;
    bool _231 = _205 < 0.5;
    float _233 = float(_231);
    float _235 = -_225;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_213);
    float _241 = -_233;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_215);
    float _247 = fma(_239, _237, _229);
    float _249 = abs(_243);
    float _251 = fma(_245, _249, _247);
    bool _253 = !_223;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _119 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _279 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _301;
    float _305 = 1.0 / _287;
    bool _307 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_279);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = 1.0 / _291;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _323 = _279 + _321;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _327 = 1.0 / _299;
    float _329 = _323 * _305;
    bool _331 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _333 = isnan(_279);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    bool _343 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_279);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _303;
    float _357 = _283 * _319;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _361 = _279 + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _279 + _363;
    float _367 = 1.0 / _295;
    float _369 = _361 * _327;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _379 = _279 + _377;
    float _381 = _379 * _355;
    bool _383 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _385 = isnan(_279);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_341;
    float _397 = _395 + 1.0;
    float _399 = _365 * _367;
    float _401 = -_353;
    float _403 = _401 + 1.0;
    float _405 = _393 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_393;
    float _413 = _411 + 1.0;
    float _415 = _317 * _403;
    float _417 = -_317;
    float _419 = _417 + 1.0;
    float _421 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _423 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _425 = isnan(_279);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _353 * _413;
    bool _437 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_279);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = _433 * _419;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    float _463 = -_447;
    float _465 = _463 + 1.0;
    float _467 = fma(_451, _357, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _469 = fma(_455, _357, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _471 = _447 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _375 * _471;
    float _483 = _421 * _471;
    float _485 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _487 = fma(_479, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = fma(_467, _457, _489);
    float _503 = fma(_469, _457, _491);
    float _505 = fma(_495, _369, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _507;
    float _511 = fma(_499, _369, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _513;
    float _517 = fma(_485, _415, _501);
    float _519 = fma(_487, _415, _503);
    float _521 = fma(_509, _381, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _523 = fma(_515, _381, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _525 = fma(_505, _435, _517);
    float _527 = fma(_511, _435, _519);
    float _529 = fma(_521, _405, _525);
    float _531 = fma(_523, _405, _527);
    float _533 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[148].x, _529);
    float _535 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[148].y, _531);
    bool _537 = !_325;
    float _553;
    if (!_537)
    {
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _541 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _543 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _545 = _543 * _539;
        float _547 = floor(_545);
        float _549 = -_547;
        float _551 = _545 + _549;
        _553 = _551;
        _555 = true;
    }
    else
    {
        float _557 = float(_85);
        float _559 = 1.0 / _557;
        float _561 = _119 * _559;
        _553 = _561;
    }
    _555 = false;
    float _563 = _553;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    float _571 = as_type<float>(int(gl_VertexIndex));
    float _573 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _575 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _577 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
    float _581 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _583 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    int _585 = as_type<int>(_571) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_571) & 2;
    bool _591 = _589 != 0;
    float _593 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
    float _595 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
    float _597 = _593 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _599 = fma(_569, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
    float _601 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _597 + _603;
    float _607 = _599 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _611 = _601 + _609;
    float _613 = _605 * _605;
    float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _617 = _607 + _615;
    float _619 = fma(_611, _611, _613);
    float _621 = _201 * _201;
    float _623 = fma(_617, _617, _619);
    float _625 = fma(_197, _197, _621);
    float _627 = rsqrt(_623);
    float _629 = fma(_211, _211, _625);
    float _631 = rsqrt(_629);
    float _633 = _605 * _627;
    float _635 = _611 * _627;
    float _637 = -_633;
    float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _641 = -_635;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _645 = in.m_56.x;
    float _647 = in.m_56.y;
    float _649 = _639 * _639;
    float _651 = _211 * _631;
    float _653 = _197 * _631;
    float _655 = _201 * _631;
    float _657 = fma(_643, _643, _649);
    float _659 = _617 * _627;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _663 = _651 * _661;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _667 = _655 * _665;
    float _669 = -_659;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _675 = -_663;
    float _677 = fma(_653, _673, _675);
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _681 = _653 * _679;
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _685 = -_667;
    float _687 = fma(_651, _683, _685);
    float _689 = fma(_671, _671, _657);
    float _691 = _677 * _677;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _695 = -_681;
    float _697 = fma(_655, _693, _695);
    float _699 = fma(_687, _687, _691);
    float _701 = sqrt(_689);
    float _703 = fma(_697, _697, _699);
    float _705 = _535 * _647;
    float _707 = _533 * _645;
    float _709 = rsqrt(_703);
    float _711 = _251 * _705;
    float _713 = _251 * _707;
    bool _715 = !_591;
    float _717 = _715 ? (-0.5) : 0.5;
    float _719 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _721 = !_587;
    float _723 = _721 ? (-0.5) : 0.5;
    float _725 = _627 * _701;
    float _727 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _717);
    float _731 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _723);
    float _733 = _719 * _725;
    float _735 = _727 * _725;
    float _737 = _677 * _709;
    float _739 = _733 * _729;
    float _741 = _687 * _709;
    float _743 = _697 * _709;
    float _745 = _653 * _737;
    float _747 = _735 * _731;
    float _749 = _739 * _651;
    float _751 = _655 * _743;
    float _753 = -_745;
    float _755 = fma(_655, _741, _753);
    float _757 = _725 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _759 = _757 * 0.5;
    float _761 = _739 * _653;
    float _763 = fma(_747, _743, _749);
    float _765 = -_751;
    float _767 = fma(_651, _737, _765);
    float _769 = fma(_747, _741, _761);
    float _771 = fma(_759, _755, _763);
    float _773 = _651 * _741;
    float _775 = fma(_759, _767, _769);
    float _777 = _607 + _771;
    float _779 = _739 * _655;
    float _781 = _601 + _775;
    float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _785 = _777 + _783;
    float _787 = fma(_747, _737, _779);
    float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _791 = _781 + _789;
    float _793 = _785 * _785;
    float _795 = fma(_791, _791, _793);
    float _797 = -_773;
    float _799 = fma(_653, _743, _797);
    float _801 = sqrt(_795);
    float _803 = fma(_759, _799, _787);
    float _805 = _597 + _803;
    bool _807 = _801 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _809 = _739;
    float _811 = _787;
    float _813 = _781;
    float _815 = _629;
    float _817 = _633;
    float _819 = _717;
    if (!_807)
    {
        _809 = _777;
    }
    float _821 = _809;
    float _823 = _821;
    if (!_807)
    {
        _811 = _805;
    }
    float _825 = _811;
    bool _827 = !_807;
    float _829 = _825;
    if (!_827)
    {
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _835 = _801 + _833;
        float _837 = rsqrt(_795);
        float _839 = _835 * _831;
        float _841 = _805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _843 = _839 * 0.15915493667125701904296875;
        float _845 = _843 * 6.283185482025146484375;
        float _847 = cos(_845);
        float _849 = _843 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = _847 + (-1.0);
        float _855 = _853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _857 = fma(_851, _841, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _859 = fma(_805, _847, _855);
        float _861 = _837 * _857;
        float _863 = fma(_791, _861, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _865 = fma(_785, _861, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _829 = _859;
        _813 = _863;
        _823 = _865;
    }
    float _867 = _829;
    float _869 = _813;
    float _871 = _823;
    float _873 = -_597;
    float _875 = _873 + _867;
    float _877 = -_601;
    float _879 = _877 + _869;
    float _881 = -_607;
    float _883 = _881 + _871;
    float _885 = _875 * _875;
    bool _887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _895 = _891 || _893;
    float _897 = -_635;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _901 = fma(_879, _879, _885);
    float _903 = fma(_883, _883, _901);
    float _905 = sqrt(_903);
    bool _907 = _905 > 0.0;
    bool _909 = !_907;
    float _911 = _869;
    float _913 = _867;
    float _915 = _871;
    float _917 = _905;
    if (!_909)
    {
        float _919 = sqrt(_629);
        float _921 = rsqrt(_903);
        bool _923 = _919 > 0.0;
        float _925 = _879 * _921;
        float _927 = _875 * _921;
        float _929 = _883 * _921;
        bool _931 = !_923;
        _815 = _919;
        _917 = _927;
        if (!_931)
        {
            float _933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _935 = _655 * _927;
            float _937 = fma(_653, _925, _935);
            float _939 = fma(_651, _929, _937);
            float _941 = _933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _943 = _939 * _941;
            float _945 = fma(_197, _943, _869);
            float _947 = fma(_201, _943, _867);
            float _949 = fma(_211, _943, _871);
            _911 = _945;
            _913 = _947;
            _915 = _949;
            _815 = _941;
        }
    }
    float _951 = _911;
    float _953 = _913;
    float _955 = _915;
    float _957 = _815;
    float _959 = _917;
    float _961 = -_635;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _965 = -_633;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _953);
    float _969 = -_659;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _973 = -_633;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _977 = -_659;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _981 = _967;
    float _983 = _963;
    float _985 = _971;
    float _987 = _957;
    float _989 = _959;
    if (!_895)
    {
        float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _993 = _975 + _991;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _997 = _899 + _995;
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1001 = -_597;
        float _1003 = _1001 + _953;
        float _1005 = _993 * _993;
        float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1009 = _979 + _1007;
        float _1011 = -_607;
        float _1013 = _1011 + _955;
        float _1015 = fma(_997, _997, _1005);
        float _1017 = 1.0 / _725;
        float _1019 = fma(_1009, _1009, _1015);
        float _1021 = -_601;
        float _1023 = _1021 + _951;
        float _1025 = sqrt(_1019);
        float _1027 = precise::min(_1025, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1029 = _1027 * _999;
        float _1031 = _1029 * _1017;
        float _1033 = fma(_1023, _1031, _899);
        float _1035 = fma(_1003, _1031, _975);
        float _1037 = fma(_1013, _1031, _979);
        _981 = _1035;
        _983 = _1033;
        _985 = _1037;
    }
    float _1039 = _981;
    float _1041 = _983;
    float _1043 = _985;
    float _1045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = _1039 + _1045;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1041 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = _1043 + _1053;
    float _1057 = _1047 * _1047;
    float _1059 = fma(_1051, _1051, _1057);
    float _1061 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1063 = fma(_1055, _1055, _1059);
    float _1065 = rsqrt(_1063);
    float _1067 = _1065 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1069 = _1051 * _1067;
    float _1071 = _1055 * _1067;
    float _1073 = _1069 * _1069;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    bool _1081 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1085 = _1079 + _1083;
    float _1087 = _1065;
    float _1089 = _1077;
    float _1091 = _1085;
    float _1093 = _1047;
    if (_1081)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1087 = _1095;
    }
    float _1097 = _1087;
    if (_1081)
    {
        float _1099 = rsqrt(_1077);
        _1089 = _1099;
    }
    float _1101 = _1089;
    float _1103 = _1101;
    if (_1081)
    {
        float _1105 = _1085 * _1097;
        _1091 = _1105;
    }
    float _1107 = _1091;
    if (_1081)
    {
        float _1109 = _1107 * 0.15915493667125701904296875;
        _987 = _1109;
    }
    float _1111 = _987;
    float _1113 = _1055;
    if (_1081)
    {
        float _1115 = _1111 * 6.283185482025146484375;
        float _1117 = sin(_1115);
        _1113 = _1117;
    }
    float _1119 = _1113;
    float _1121 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1123 = precise::max(0.0, _1121);
    float _1125 = _1097;
    float _1127 = _1123;
    if (_1081)
    {
        float _1129 = _1111 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = -_1067;
    float _1137 = -_1123;
    float _1139 = fma(_1047, _1135, _1137);
    if (_1081)
    {
        float _1141 = _1139 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1093 = _1141;
    }
    float _1143 = _1093;
    float _1145 = sqrt(_1063);
    float _1147 = _1143;
    float _1149 = _1119;
    if (_1081)
    {
        float _1151 = fma(_1119, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_1081)
    {
        _1149 = _1069;
    }
    float _1157 = _1149;
    float _1159 = _1157;
    float _1161 = _1133;
    if (_1081)
    {
        float _1163 = _1133 + (-1.0);
        _1127 = _1163;
    }
    float _1165 = _1127;
    float _1167 = _1165;
    if (_1081)
    {
        float _1169 = _1101 * _1153;
        _989 = _1169;
    }
    float _1171 = _989;
    if (!_1081)
    {
        _1155 = _1139;
    }
    float _1173 = _1155;
    float _1175 = _1173;
    if (_1081)
    {
        float _1177 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _817 = _1177;
    }
    float _1179 = _817;
    if (_1081)
    {
        float _1181 = _1069 * _1171;
        _1159 = _1181;
    }
    float _1183 = _1159;
    if (!_1081)
    {
        _1167 = _1071;
    }
    float _1185 = _1167;
    float _1187 = _1185;
    if (_1081)
    {
        float _1189 = _1071 * _1171;
        _1187 = _1189;
    }
    float _1191 = _1187;
    if (!_1081)
    {
        _1103 = _1073;
    }
    float _1193 = _1103;
    float _1195 = _1193;
    if (_1081)
    {
        float _1197 = fma(_1139, _1133, _1179);
        _1175 = _1197;
    }
    float _1199 = _1175;
    if (_1081)
    {
        float _1201 = _1183 * _1183;
        _1195 = _1201;
    }
    float _1203 = _1195;
    if (!_1081)
    {
        _1161 = _1075;
    }
    float _1205 = _1161;
    float _1207 = _1205;
    if (_1081)
    {
        float _1209 = _1191 * _1191;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = fma(_1199, _1199, _1203);
    float _1215 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = _1213 + _1211;
    float _1219 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1223 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1221);
    float _1225 = precise::clamp(_1223, 0.0, 1.0);
    float _1227 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = rsqrt(_1217);
    float _1231 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1219);
    float _1233 = -_1225;
    float _1235 = _1233 + 1.0;
    float _1237 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1227);
    float _1239 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1215);
    float _1241 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1231);
    float _1243 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1245 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1237);
    float _1247 = abs(_1235);
    float _1249 = log2(_1247);
    float _1251 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1253 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1257 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1261 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1253);
    float _1263 = _1229 * _1183;
    float _1265 = _1229 * _1199;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1269 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1273 = _1229 * _1191;
    float _1275 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1277 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1269);
    float _1279 = -_1271;
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1279);
    float _1283 = -_1259;
    float _1285 = fma(_1283, _1061, 1.0);
    float _1287 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1289 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1277);
    float _1291 = -_1273;
    float _1293 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1281);
    float _1295 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1297 = exp2(_1287);
    float _1299 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1289);
    float _1301 = fma(_1293, -0.5, 0.5);
    float _1303 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1305 = fma(_1293, 0.5, 0.5);
    float _1307 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1295);
    float _1309 = _1265 + 1.0;
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1303);
    float _1313 = log2(_1285);
    float _1315 = fma(_1305, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1317 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1307);
    float _1319 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1311);
    float _1321 = fma(_1305, _1315, -0.212114393711090087890625);
    float _1323 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1317);
    float _1325 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1319);
    float _1327 = 1.0 / _1299;
    float _1329 = -_1265;
    float _1331 = fma(_1297, _1309, _1329);
    float _1333 = fma(_1305, _1321, 1.570728778839111328125);
    float _1335 = fma(_1331, 0.5, 0.5);
    float _1337 = sqrt(_1301);
    float _1339 = _1313 * 0.693147182464599609375;
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1343 = _1323 * _1327;
    float _1345 = _1325 * _1327;
    float _1347 = fma(_1343, 0.5, 0.5);
    float _1349 = fma(_1345, -0.5, 0.5);
    float _1351 = _1337 * 0.636619746685028076171875;
    float _1353 = -_1333;
    float _1355 = fma(_1351, _1353, 1.0);
    float3 _3782 = float3(_1347, _1349, _1341);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3782, float3(0.0), isnan(_3782)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3782, float3(0.0), isnan(_3782)), level(0.0)).x;
    float3 _3793 = float3(_1347, _1349, _1341);
    float4 _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3793, float3(0.0), isnan(_3793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3793, float3(0.0), isnan(_3793)), level(0.0)).xyzw;
    float _1362 = _1360.x;
    float _1364 = _1360.y;
    float _1366 = _1360.z;
    float _1368 = _1360.w;
    float2 _3810 = float2(_1355, _1335);
    float3 _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3810, float2(0.0), isnan(_3810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3810, float2(0.0), isnan(_3810)), level(0.0)).xyz;
    float _1374 = _1372.x;
    float _1376 = _1372.y;
    float _1378 = _1372.z;
    float _1380 = in.m_49.y;
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1390 = _1386 || _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1394 = _563 + _1392;
    bool _1396 = _139 > 0.5;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1408 = _563 + _1406;
    float _1410 = _1249 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1412 = 1.0 / _1404;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1416 = _1414 != 0;
    float _1418 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1422 = _1420 != 0;
    out.m_58.y = _1039;
    float _1424 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1418);
    float _1426 = 1.0 / _1400;
    float _1428 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1424);
    bool _1430 = _1380 > 0.5;
    float _1432 = _1394 * _1412;
    float _1434 = _975 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1436;
    bool _1440 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1442 = isnan(_563);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = exp2(_1410);
    float _1454 = _1408 * _1426;
    float _1456 = _975 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1458 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1434);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1460;
    float _1464 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1456);
    float _1466 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1458);
    float _1468 = fma(_1462, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1470 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1472 = isnan(_563);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1482;
    float _1486 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1488 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1464);
    float _1490 = fma(_1438, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1500 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1502 = fma(_1484, _1454, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1504 = -_1480;
    float _1506 = _1504 + 1.0;
    float _1508 = 1.0 / _1486;
    float _1510 = fma(_1494, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1512 = _1500 + _1486;
    bool _1514 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1516 = isnan(_563);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    float _1526 = _1450 * _1506;
    float _1528 = -_1450;
    float _1530 = _1528 + 1.0;
    float _1532 = -_723;
    int _1534 = _1396 ? as_type<int>(_1532) : as_type<int>(_723);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1542 = _1480;
    if (!_1390)
    {
        _1540 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1544 = _1540;
    float _1546 = _1524 * _1530;
    bool _1548 = !_1416;
    float _1550 = _1548 ? _723 : as_type<float>(_1534);
    float _1552 = -_1524;
    float _1554 = _1552 + 1.0;
    float _1556 = fma(_1498, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1558 = _1468 * _1546;
    float _1560 = _1490 * _1546;
    float _1562 = _1502 * _1546;
    float _1564 = _1512 * _1508;
    float _1566 = _1564 * 0.5;
    float _1568 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1558);
    float _1570 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1560);
    float _1572 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    float _1574 = _1566;
    float _1576 = _1568;
    if (!_1390)
    {
        float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1580 = fma(_1566, _1544, _1578);
        _1574 = _1580;
    }
    float _1582 = _1574;
    float _1584 = fma(_1510, _1526, _1568);
    float _1586 = -_717;
    int _1588 = _1430 ? as_type<int>(_1586) : as_type<int>(_717);
    float _1590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_1390)
    {
        _1576 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1592 = _1576;
    float _1594 = fma(_1538, _1432, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1596 = !_1422;
    float _1598 = _1596 ? _717 : as_type<float>(_1588);
    float _1600 = fma(_1556, _1526, _1570);
    float _1602 = _1550 + 0.5;
    if (!_1390)
    {
        float _1604 = -_1592;
        float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _819 = _1606;
    }
    float _1608 = _819;
    float _1610 = fma(_1594, _1526, _1572);
    float _1612 = _1582;
    if (!_1390)
    {
        float _1614 = 1.0 / _1582;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = -_1598;
    float _1620 = _1618 + 0.5;
    float _1622 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1584);
    float _1624 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1600);
    float _1626 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1610);
    float _1628 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1630 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1634 = _1608;
    if (!_1390)
    {
        float _1636 = 1.0 / _1608;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = _1628 * _1590;
    float _1642 = _1590;
    if (_1390)
    {
        _1642 = 1.0;
    }
    float _1644 = _1642;
    float _1646 = _1624 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1654 = _1644;
    if (!_1390)
    {
        float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1658 = -_1592;
        float _1660 = fma(_1616, _1656, _1658);
        _1542 = _1660;
    }
    float _1662 = _1542;
    float _1664 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1390)
    {
        float _1668 = _1662 * _1638;
        float _1670 = precise::clamp(_1668, 0.0, 1.0);
        _1654 = _1670;
    }
    float _1672 = _1654;
    float _1674 = -_1452;
    float _1676 = _1674 + 1.0;
    float _1678 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1680 = _1672 > 0.0;
    bool _1682 = isnan(_1672);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = _1630 * _1652;
    out.m_60.x = _1690;
    out.m_60.y = _1640;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1694 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1428);
    float _1696 = _1672 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1698 = -_1678;
    float _1700 = _1698 + 1.0;
    out.m_62.x = _1648;
    out.m_62.y = _1650;
    out.m_62.z = _1666;
    out.m_62.w = _1692;
    float _1702 = _1694 + _1299;
    out.gl_Position.x = _1323;
    out.gl_Position.y = _1325;
    out.gl_Position.z = _1694;
    out.gl_Position.w = _1299;
    float _1704 = _1702 * 0.5;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1704;
    out.m_64.w = _1299;
    out.m_45.x = _1706;
    float _1708 = _1678 * _1357;
    float _1710 = _1368 * _1700;
    float _1712 = _1368 * _1708;
    float _1714 = _1378 * _1708;
    float _1716 = fma(_1374, _1712, _1362);
    float _1718 = fma(_1376, _1712, _1364);
    float _1720 = fma(_1368, _1714, _1366);
    out.m_66.x = _1716;
    out.m_66.y = _1718;
    out.m_66.z = _1720;
    out.m_66.w = _1710;
    if (_1688)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1722 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1722;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

