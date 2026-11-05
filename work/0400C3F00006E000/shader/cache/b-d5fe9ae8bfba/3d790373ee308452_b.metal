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
    float4 m_58 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_64 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2553 = as_type<float>(_99);
        out.gl_Position.z = _2553;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    float _105 = float(_83);
    float _107 = -_103;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_103);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    bool _121 = _109 >= _105;
    bool _123 = !_119;
    bool _125 = _121 || _123;
    float _127 = _109;
    if (_125)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _91;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _101 = as_type<int>(_131);
    }
    int _133 = _101;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2617 = as_type<float>(_133);
        out.gl_Position.z = _2617;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _139 = in.m_52.w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    float _171 = _135;
    float _173 = 0.5;
    if (!_149)
    {
        float _175 = _137 * _137;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_149)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_149;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _137 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _137);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = 1.0 / _105;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _245 = _229;
    if (!_149)
    {
        _245 = _137;
    }
    float _247 = _245;
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].y, _241);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].z, _243);
    float _255 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    float _257 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    bool _259 = !_149;
    float _261 = _247;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _137 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _261 = _281;
    }
    float _283 = _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _289 = fma(_283, _151, _255);
    float _291 = fma(_283, _153, _257);
    float _293 = _109 * _233;
    float _295 = fma(_283, _155, _287);
    float _297 = fma(_289, _139, _157);
    float _299 = fma(_291, _139, _159);
    float _301 = fma(_295, _139, _161);
    bool _303 = !_285;
    float _321;
    if (!_303)
    {
        float _305 = in.m_54.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        _321 = _293;
    }
    _323 = false;
    float _325 = _321;
    float _327 = in.m_54.x;
    float _329 = in.m_54.y;
    float _331 = in.m_54.z;
    float _333 = in.m_54.w;
    float _335 = _299 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _337 = _299 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _339 = _299 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = 1.0 / _343;
    float _351 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].x, _335);
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].x, _339);
    float _361 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].x, _337);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _325 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _325 + _367;
    float _371 = 1.0 / _347;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _375 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].z, _359);
    float _377 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _325 + _379;
    float _383 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _385 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _387 = 1.0 / _357;
    float _389 = -_353;
    float _391 = fma(_383, 2.0, _389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = fma(_385, -2.0, _373);
    float _399 = _327 * 2.0;
    float _401 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _403 = 1.0 / _395;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _325 + _405;
    float _409 = _365 * _371;
    float _411 = fma(_329, 6.283185482025146484375, _109);
    float _413 = _407 * _349;
    float _415 = _293 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _417 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _419 = isnan(_325);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = floor(_399);
    float _431 = _329 + _327;
    float _433 = -_415;
    float _435 = _433 + 1.0;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = _381 * _387;
    float _441 = _329 * 2.0;
    float _443 = _431 + (-1.0);
    float _445 = fma(_437, -2.0, 3.0);
    float _447 = _437 * _437;
    float _449 = _369 * _403;
    float _451 = _331 * 2.0;
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _455 = _445 * _447;
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = _329 + _331;
    float _461 = _331 + _327;
    float _463 = floor(_451);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    float _477 = _459 + (-1.0);
    float _479 = _461 + (-1.0);
    bool _481 = _429 > 0.0;
    float _483 = _411 * 1.57079637050628662109375;
    bool _485 = _429 >= 0.0;
    bool _487 = isnan(_429);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _497 = floor(_441);
    float _499 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _501 = !_471;
    int _503 = _501 ? 0 : 1;
    float _505 = _483 * 0.15915493667125701904296875;
    bool _507 = !_475;
    int _509 = _507 ? 0 : 1;
    float _511 = _377 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _513 = _401 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _517 = log2(_515);
    bool _519 = !_467;
    int _521 = _519 ? 0 : 1;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _523;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _537 = _535 != 0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    bool _543 = _463 >= 0.0;
    bool _545 = isnan(_463);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = fma(_525, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _563 = _551 ? 0 : 1;
    float _565 = fma(_555, _439, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _567 = _463 > 0.0;
    float _569 = fma(_559, _439, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _571 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _573 = isnan(_325);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = fma(_541, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _585 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _587 = isnan(_325);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -_427;
    float _599 = _597 + 1.0;
    bool _601 = !_529;
    int _603 = _601 ? 0 : 1;
    float _605 = -_581;
    float _607 = _605 + 1.0;
    bool _609 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _611 = isnan(_325);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _581 * _599;
    bool _623 = _497 > 0.0;
    float _625 = _595 * _607;
    bool _627 = _497 >= 0.0;
    bool _629 = isnan(_497);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    float _637 = -_595;
    float _639 = _637 + 1.0;
    bool _641 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _643 = isnan(_325);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = _517 * _109;
    float _655 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _657 = int(_655);
    float _659 = _375 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _661 = _651 * _639;
    float _663 = -_651;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _675 = exp2(_653);
    int _677 = ~_563;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = fma(_669, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_673, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _687;
    float _691 = _619 * _665;
    int _693 = _681;
    if (!_567)
    {
        int _695 = ~_563;
        int _697 = _695 + 1;
        _693 = _697;
    }
    int _699 = _693;
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = float(_657);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _709 = 1.0 + _707;
    bool _711 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _719 = _715 || _717;
    float _721 = fma(_689, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _723 = _561 * _691;
    float _725 = _583 * _691;
    float _727 = -_675;
    float _729 = _727 + 1.0;
    float _731 = 1.0 / _705;
    float _733 = -_619;
    float _735 = _733 + 1.0;
    float _737 = fma(_333, 6.283185482025146484375, _109);
    float _739 = _719 ? _729 : 0.0;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _755 = 1.0 / _709;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _761 = float(_703);
    float _763 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].z, _741);
    float _765 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _753);
    float _767 = _737 * 1.57079637050628662109375;
    float _769 = -_109;
    float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _773 = fma(_759, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _775 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _763);
    float _777 = fma(_331, 6.283185482025146484375, _109);
    float _779 = _761 * _109;
    float _781 = _731 * _109;
    float _783 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _397);
    float _785 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _765);
    float _787 = _767 * 0.15915493667125701904296875;
    float _789 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].x, _723);
    if (_751)
    {
        float _791 = _739 * _755;
        _127 = _791;
    }
    float _793 = _127;
    float _795 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    float _797 = in.m_56.x;
    float _799 = in.m_56.y;
    float _801 = in.m_56.z;
    int _803 = abs(_603);
    int _805 = _493 ? 0 : 1;
    float _807 = _787 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = float(_803);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = float(_699);
    float _819 = _777 * 1.57079637050628662109375;
    int _821 = ~_805;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_481)
    {
        int _831 = ~_805;
        int _833 = _831 + 1;
        _827 = _833;
    }
    int _835 = _827;
    float _837 = _819 * 0.15915493667125701904296875;
    float _839 = _811 * _817;
    float _841 = -_511;
    float _843 = _841 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _845 = !_533;
    int _847 = _845 ? 0 : 1;
    float _849 = -_513;
    float _851 = _849 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _853 = _635 ? 0 : 1;
    float _855 = _843 * _843;
    float _857 = _839 * (-2.0);
    int _859 = abs(_847);
    float _861 = _505 * 6.283185482025146484375;
    float _863 = sin(_861);
    int _865 = ~_853;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = fma(_851, _851, _855);
    int _873 = _869;
    if (!_623)
    {
        int _875 = ~_853;
        int _877 = _875 + 1;
        _873 = _877;
    }
    int _879 = _873;
    float _881 = fma(_857, _797, _797);
    float _883 = _327 + (-0.5);
    float _885 = float(_835);
    float _887 = fma(_453, _857, _453);
    float _889 = float(_859);
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].x, _881);
    bool _893 = !_537;
    int _895 = _893 ? 0 : 1;
    float _897 = -_659;
    float _899 = _897 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _901 = _837 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _889 * _885;
    float _907 = fma(_887, _793, _891);
    int _909 = abs(_895);
    float _911 = fma(_899, _899, _871);
    float _913 = _905 * (-2.0);
    float _915 = _329 + (-0.5);
    float _917 = rsqrt(_911);
    float _919 = fma(_913, _799, _799);
    float _921 = float(_879);
    float _923 = _907 * 0.15915493667125701904296875;
    float _925 = float(_909);
    float _927 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[196].y, _919);
    float _929 = fma(_565, _661, _789);
    float _931 = fma(_569, _661, _795);
    float _933 = fma(_495, _913, _495);
    float _935 = _925 * _921;
    float _937 = fma(_683, _625, _929);
    float _939 = fma(_721, _625, _931);
    float _941 = fma(_933, _793, _927);
    float _943 = _935 * (-2.0);
    float _945 = in.m_52.x;
    float _947 = in.m_52.y;
    float _949 = fma(_685, _621, _937);
    float _951 = _851 * _917;
    float _953 = fma(_943, _801, _801);
    float _955 = _331 + (-0.5);
    float _957 = fma(_499, _943, _499);
    float _959 = _843 * _917;
    float _961 = _899 * _917;
    float _963 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[196].z, _953);
    float _965 = fma(_773, _621, _939);
    float _967 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].x, _949);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _961 * _969;
    float _973 = fma(_957, _793, _963);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _977 = _951 * _975;
    float _979 = _457 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _981 = _941 * 0.15915493667125701904296875;
    float _983 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].y, _965);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _987 = -_977;
    float _989 = fma(_961, _985, _987);
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _993 = -_971;
    float _995 = fma(_959, _991, _993);
    float _997 = _809 * _979;
    float _999 = fma(_863, _979, _183);
    float _1001 = fma(_903, _979, _193);
    float _1003 = _989 * _989;
    float _1005 = _923 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _967 * _945;
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1013 = _959 * _1011;
    float _1015 = _973 * 0.15915493667125701904296875;
    float _1017 = fma(_995, _995, _1003);
    float _1019 = _983 * _947;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = -_1013;
    float _1025 = fma(_951, _1021, _1023);
    float _1027 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _999);
    float _1029 = _923 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1035 = fma(_1025, _1025, _1017);
    float _1037 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1039 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _997);
    if (_815)
    {
        _829 = 1.0;
    }
    float _1043 = _829;
    float _1045 = _1037 * _1027;
    float _1047 = _981 * 6.283185482025146484375;
    float _1049 = sin(_1047);
    float _1051 = _1039 * _1033;
    float _1053 = _1043;
    if (!_815)
    {
        _1053 = 7.345489978790283203125;
    }
    float _1055 = _1053;
    bool _1057 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1059 = isnan(0.5);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1065 = _1061 || _1063;
    float _1067 = _981 * 6.283185482025146484375;
    float _1069 = cos(_1067);
    float _1071 = _1015 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _1031 * _1049;
    float _1077 = _1015 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    float _1081 = _1007 * _1069;
    float _1083 = _1031 * _1069;
    float _1085 = rsqrt(_1035);
    float _1087 = -_1075;
    float _1089 = fma(_1073, _1081, _1087);
    float _1091 = -_1081;
    float _1093 = fma(_1073, _1075, _1091);
    float _1095 = _1007 * _1049;
    float _1097 = _1049 * _1079;
    float _1099 = _1079 * _1051;
    float _1101 = _1069 * _1079;
    float _1103 = -_1051;
    float _1105 = _1073 * _1103;
    float _1107 = fma(_1073, _1083, _1095);
    float _1109 = fma(_1073, _1095, _1083);
    float _1111 = _1031 * _1099;
    float _1113 = fma(_1101, _1045, _1105);
    float _1115 = _995 * _1085;
    float _1117 = _989 * _1085;
    float _1119 = fma(_1107, _1045, _1111);
    float _1121 = _1007 * _1099;
    float _1123 = _959 * _1115;
    float _1125 = _1025 * _1085;
    float _1127 = fma(_1093, _1041, _1119);
    float _1129 = _961 * _1117;
    float _1131 = -_1123;
    float _1133 = fma(_951, _1117, _1131);
    float _1135 = fma(_1089, _1045, _1121);
    float _1137 = fma(_1097, _1041, _1113);
    float _1139 = -_1129;
    float _1141 = fma(_959, _1125, _1139);
    float _1143 = _1133 * _1127;
    float _1145 = fma(_1109, _1041, _1135);
    float _1147 = _327 * _1055;
    float _1149 = _1141 * _1127;
    float _1151 = fma(_1125, _1137, _1143);
    float _1153 = _951 * _1125;
    float _1155 = fma(_1115, _1137, _1149);
    float _1157 = fma(_961, _1145, _1151);
    float _1159 = -_1153;
    float _1161 = fma(_961, _1115, _1159);
    float _1163 = fma(_951, _1145, _1155);
    float _1165 = _659 + _1157;
    float _1167 = _1161 * _1127;
    float _1169 = _513 + _1163;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1165 + _1171;
    float _1175 = fma(_1117, _1137, _1167);
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1169 + _1177;
    float _1181 = _1173 * _1173;
    float _1183 = fma(_959, _1145, _1175);
    float _1185 = fma(_1179, _1179, _1181);
    float _1187 = _511 + _1183;
    float _1189 = sqrt(_1185);
    bool _1191 = _1189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1193 = _1161;
    float _1195 = _1181;
    float _1197 = _1169;
    float _1199 = _1113;
    float _1201 = _1185;
    if (!_1191)
    {
        _1193 = _1169;
    }
    float _1203 = _1193;
    float _1205 = _1203;
    if (!_1191)
    {
        _1195 = _1165;
    }
    float _1207 = _1195;
    float _1209 = _1207;
    if (!_1191)
    {
        _1197 = _1187;
    }
    float _1211 = _1197;
    bool _1213 = !_1191;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1189 + _1219;
        float _1223 = rsqrt(_1185);
        float _1225 = _1221 * _1217;
        float _1227 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1225 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = sin(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        float _1239 = fma(_1233, _1227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1241 = _1223 * _1239;
        float _1243 = _1237 + (-1.0);
        float _1245 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = fma(_1179, _1241, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1249 = fma(_1173, _1241, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1251 = fma(_1187, _1237, _1245);
        _1205 = _1247;
        _1209 = _1249;
        _1215 = _1251;
    }
    float _1253 = _1205;
    float _1255 = _1209;
    float _1257 = _1215;
    float _1259 = _1257;
    float _1261 = _1253;
    float _1263 = _1255;
    if (!_1065)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _511 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _513 + _1269;
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1275 = -_513;
        float _1277 = _1275 + _1253;
        float _1279 = _1267 * _1267;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _659 + _1281;
        float _1285 = -_659;
        float _1287 = _1285 + _1255;
        float _1289 = fma(_1271, _1271, _1279);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = fma(_1283, _1283, _1289);
        float _1295 = sqrt(_1293);
        float _1297 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1299 = precise::min(_1295, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1301 = _1299 * _1291;
        float _1303 = _1297 * _1301;
        float _1305 = -_511;
        float _1307 = _1305 + _1257;
        float _1309 = fma(_1277, _1303, _513);
        float _1311 = fma(_1307, _1303, _511);
        float _1313 = fma(_1287, _1303, _659);
        _1259 = _1311;
        _1261 = _1309;
        _1263 = _1313;
    }
    float _1315 = _1259;
    float _1317 = _1261;
    float _1319 = _1263;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1323 = _1315 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1327 = _1317 + _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1331 = _1319 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1327, _1327, _1333);
    float _1337 = fma(_1331, _1331, _1335);
    float _1339 = rsqrt(_1337);
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1327 * _1341;
    float _1345 = _1331 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1331;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1323;
    if (_1355)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1369;
    }
    float _1371 = _1361;
    if (_1355)
    {
        float _1373 = rsqrt(_1351);
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (_1355)
    {
        float _1377 = _1359 * _1371;
        _1365 = _1377;
    }
    float _1379 = _1365;
    if (_1355)
    {
        float _1381 = _1379 * 0.15915493667125701904296875;
        _1199 = _1381;
    }
    float _1383 = _1199;
    float _1385 = _1333;
    float _1387 = _1383;
    if (_1355)
    {
        float _1389 = _1383 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1385 = _1391;
    }
    float _1393 = _1385;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1339;
    float _1401 = _1395;
    float _1403 = _1397;
    if (_1355)
    {
        float _1405 = _1383 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        _1399 = _1407;
    }
    float _1409 = _1399;
    float _1411 = -_1341;
    float _1413 = -_1397;
    float _1415 = fma(_1323, _1411, _1413);
    if (!_1355)
    {
        _1367 = _1343;
    }
    float _1417 = _1367;
    float _1419 = _1417;
    if (_1355)
    {
        float _1421 = _1415 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1421;
    }
    float _1423 = _1401;
    float _1425 = _1423;
    float _1427 = _1393;
    if (_1355)
    {
        float _1429 = fma(_1393, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1201 = _1429;
    }
    float _1431 = _1201;
    if (!_1355)
    {
        _1425 = _1415;
    }
    float _1433 = _1425;
    float _1435 = _1433;
    float _1437 = _1409;
    if (_1355)
    {
        float _1439 = _1409 + (-1.0);
        _1403 = _1439;
    }
    float _1441 = _1403;
    float _1443 = _1441;
    if (_1355)
    {
        float _1445 = _1375 * _1431;
        _1387 = _1445;
    }
    float _1447 = _1387;
    float _1449 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1451 = sqrt(_1337);
    if (_1355)
    {
        float _1453 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1453;
    }
    float _1455 = _1427;
    float _1457 = _1455;
    if (_1355)
    {
        float _1459 = _1343 * _1447;
        _1419 = _1459;
    }
    float _1461 = _1419;
    if (!_1355)
    {
        _1443 = _1345;
    }
    float _1463 = _1443;
    float _1465 = _1463;
    if (_1355)
    {
        float _1467 = _1345 * _1447;
        _1465 = _1467;
    }
    float _1469 = _1465;
    if (_1355)
    {
        float _1471 = fma(_1415, _1409, _1455);
        _1435 = _1471;
    }
    float _1473 = _1435;
    if (!_1355)
    {
        _1457 = _1347;
    }
    float _1475 = _1457;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    if (!_1355)
    {
        _1437 = _1349;
    }
    float _1483 = _1437;
    float _1485 = _1483;
    if (_1355)
    {
        float _1487 = _1469 * _1469;
        _1485 = _1487;
    }
    float _1489 = _1485;
    float _1491 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = fma(_1473, _1473, _1481);
    float _1495 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1501 = _1493 + _1489;
    float _1503 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1449);
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1507 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1505);
    float _1509 = precise::clamp(_1507, 0.0, 1.0);
    float _1511 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1499);
    float _1513 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1515 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1517 = rsqrt(_1501);
    float _1519 = _1511 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = -_1509;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1527 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1513);
    float _1533 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1525);
    float _1535 = abs(_1523);
    float _1537 = log2(_1535);
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1541 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1543 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1545 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1539);
    float _1551 = _1517 * _1461;
    float _1553 = _1517 * _1473;
    float _1555 = _1517 * _1469;
    float _1557 = -_1547;
    float _1559 = fma(_1557, _1543, 1.0);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1563 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1567 = -_1561;
    float _1569 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1573 = log2(_1559);
    float _1575 = -_1555;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1579 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1581 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1565);
    float _1583 = _1553 + 1.0;
    float _1585 = fma(_1577, -0.5, 0.5);
    float _1587 = fma(_1577, 0.5, 0.5);
    float _1589 = exp2(_1571);
    float _1591 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1579);
    float _1593 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1581);
    float _1595 = fma(_1587, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1597 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1591);
    float _1599 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1601 = fma(_1587, _1595, -0.212114393711090087890625);
    float _1603 = sqrt(_1585);
    float _1605 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1597);
    float _1607 = _1573 * 0.693147182464599609375;
    float _1609 = fma(_1587, _1601, 1.570728778839111328125);
    float _1611 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1613 = 1.0 / _1563;
    float _1615 = -_1553;
    float _1617 = fma(_1589, _1583, _1615);
    float _1619 = _1603 * 0.636619746685028076171875;
    float _1621 = -_1609;
    float _1623 = fma(_1619, _1621, 1.0);
    float _1625 = fma(_1617, 0.5, 0.5);
    float _1627 = _1599 * _1613;
    float _1629 = _1605 * _1613;
    float _1631 = fma(_1627, 0.5, 0.5);
    float _1633 = fma(_1629, -0.5, 0.5);
    float3 _4947 = float3(_1631, _1633, _1611);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4947, float3(0.0), isnan(_4947)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4947, float3(0.0), isnan(_4947)), level(0.0)).x;
    float3 _4958 = float3(_1631, _1633, _1611);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4958, float3(0.0), isnan(_4958)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4958, float3(0.0), isnan(_4958)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4975 = float2(_1623, _1625);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4975, float2(0.0), isnan(_4975)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4975, float2(0.0), isnan(_4975)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    float _1658 = float(uint(_703));
    float _1660 = trunc(_781);
    int _1662 = int(_1660);
    int _1664 = ~_703;
    int _1666 = _1664 + 1;
    float _1668 = _779 * _233;
    int _1670 = _703 + (-1);
    float _1672 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1674 = abs(_509);
    float _1676 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1678 = -_785;
    float _1680 = _1678 + 1.0;
    float _1682 = 1.0 / _1658;
    float _1684 = -_775;
    float _1686 = _1684 + 1.0;
    float _1688 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1676);
    float _1690 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    float _1692 = floor(_1147);
    float _1694 = float(uint(_1662));
    int _1696 = as_type<int>(_1682) + (-2);
    float _1698 = trunc(_1668);
    int _1700 = int(_1698);
    float _1702 = float(_1662);
    float _1704 = as_type<float>(_1696) * _1694;
    float _1706 = trunc(_1704);
    float _1708 = precise::max(_1706, 0.0);
    uint _1711 = uint(_1708);
    float _1713 = exp2(_1672);
    int _1715 = _1666 * int(_1711);
    int _1717 = _1715 + _1662;
    float _1719 = float(uint(_1717));
    float _1721 = -_1713;
    float _1723 = _1721 + 1.0;
    float _1725 = as_type<float>(_1696) * _1719;
    int _1727 = ~_703;
    int _1729 = _1727 + 1;
    float _1731 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1733 = trunc(_1725);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    int _1739 = int(_1711) + int(_1737);
    int _1741 = _1729 * _1739;
    int _1743 = _1741 + _1662;
    bool _1745 = _1702 >= _761;
    bool _1747 = isnan(_1702);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan(_761);
    bool _1753 = _1749 || _1751;
    float _1755 = float(_1753);
    float _1757 = -_1692;
    float _1759 = _1147 + _1757;
    bool _1761 = uint(_1743) >= uint(_703);
    float _1763 = _1759 * _761;
    float _1765 = trunc(_1755);
    int _1767 = int(_1765);
    bool _1769 = !_1761;
    int _1771 = _1769 ? 0 : (-1);
    bool _1773 = _703 == 0;
    int _1775 = ~_1739;
    int _1777 = _1775 + _1771;
    int _1779 = _1777 + 1;
    float _1781 = trunc(_1763);
    int _1783 = int(_1781);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1787 = _1785 != 0;
    int _1789 = _703 * _1779;
    int _1791 = _1789 + _1662;
    bool _1793 = !_1787;
    int _1795 = _1793 ? 0 : 1;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1799 = _1797 != 0;
    int _1801 = ~_1767;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    bool _1807 = !_1773;
    int _1809 = _1807 ? _1791 : (-1);
    int _1811 = abs(_1795);
    int _1813 = abs(_503);
    int _1815 = _1809 * _1805;
    int _1817 = abs(_521);
    int _1819 = _1767 * _1670;
    int _1821 = _1819 + _1815;
    bool _1823 = !_1799;
    int _1825 = _1823 ? 0 : 1;
    int _1827 = _1821 * _1813;
    int _1829 = ~_703;
    int _1831 = _1829 + 1;
    int _1833 = _1783 * _1811;
    int _1835 = _1833 + _1662;
    int _1837 = abs(_1825);
    int _1839 = _1700 * _1817;
    int _1841 = _1839 + _1827;
    float _1843 = float(uint(_1835));
    int _1845 = _1835 * _1674;
    int _1847 = _1845 + _1841;
    int _1849 = ~_703;
    int _1851 = _1849 + 1;
    int _1853 = _1783 * _1837;
    int _1855 = _1853 + _1847;
    float _1857 = as_type<float>(_1696) * _1843;
    float _1859 = float(uint(_1855));
    float _1861 = as_type<float>(_1696) * _1859;
    float _1863 = trunc(_1861);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    int _1869 = _1851 * int(_1867);
    int _1871 = _1869 + _1855;
    float _1873 = float(uint(_1871));
    int _1875 = ~_703;
    int _1877 = _1875 + 1;
    float _1879 = as_type<float>(_1696) * _1873;
    float _1881 = trunc(_1879);
    float _1883 = precise::max(_1881, 0.0);
    uint _1885 = uint(_1883);
    int _1887 = int(_1867) + int(_1885);
    int _1889 = ~_703;
    int _1891 = _1889 + 1;
    int _1893 = _1877 * _1887;
    int _1895 = _1893 + _1855;
    float _1897 = trunc(_1857);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    bool _1903 = uint(_1895) >= uint(_703);
    bool _1905 = !_1903;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = ~_1887;
    int _1911 = _1909 + _1907;
    int _1913 = _1911 + 1;
    int _1915 = _703 * _1913;
    int _1917 = _1915 + _1855;
    int _1919 = _1891 * int(_1901);
    int _1921 = _1919 + _1835;
    bool _1923 = !_1773;
    int _1925 = _1923 ? _1917 : (-1);
    float _1927 = float(uint(_1921));
    int _1929 = _1925 >> 31;
    int _1931 = _1925 & 3;
    bool _1933 = _1931 != 0;
    float _1935 = as_type<float>(_1696) * _1927;
    int _1937 = _1929 & 3;
    float _1939 = trunc(_1935);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    int _1945 = _1925 + _1937;
    int _1947 = _1945 >> 2;
    int _1949 = _1947 << 4;
    int _1951 = _1949 + 368;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[int(_1963)][_1965];
    int _1969 = int(_1901) + int(_1943);
    int _1971 = _1925 & 3;
    bool _1973 = _1971 != 0;
    int _1975 = _1933 ? 0 : 1;
    int _1977 = _1951 + 8;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[int(_1989)][_1991];
    int _1995 = _1831 * _1969;
    int _1997 = _1995 + _1835;
    bool _1999 = uint(_1971) > 1u;
    bool _2001 = _1971 != 3;
    bool _2003 = uint(_1997) >= uint(_703);
    bool _2005 = !_2003;
    int _2007 = _2005 ? 0 : (-1);
    bool _2009 = uint(_1971) >= 2u;
    int _2011 = ~_1969;
    int _2013 = _2011 + _2007;
    int _2015 = _2013 + 1;
    int _2017 = ~_1975;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    int _2023 = _2021;
    if (!_1999)
    {
        int _2025 = ~_1975;
        int _2027 = _2025 + 1;
        _2023 = _2027;
    }
    int _2029 = _2023;
    int _2031 = _703 * _2015;
    int _2033 = _2031 + _1835;
    bool _2035 = !_1973;
    int _2037 = _2035 ? 0 : 1;
    int _2039 = abs(_2029);
    int _2041 = _2009 ? 0 : 1;
    bool _2043 = _1971 != 3;
    int _2045 = abs(_2037);
    float _2047 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2049 = int(_2047);
    int _2051 = ~_2041;
    int _2053 = _2051 + 1;
    int _2055 = _2053 + 1;
    int _2057 = _2055;
    if (_2001)
    {
        int _2059 = ~_2041;
        int _2061 = _2059 + 1;
        _2057 = _2061;
    }
    int _2063 = _2057;
    int _2065 = ~_2039;
    int _2067 = _2065 + 1;
    int _2069 = _2067 + 1;
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2073 = _2071 != 0;
    bool _2075 = !_2043;
    int _2077 = _2075 ? 0 : (-1);
    int _2079 = _2069 * as_type<int>(_1967);
    int _2081 = abs(_2063);
    int _2083 = ~_2045;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    bool _2089 = !_2073;
    int _2091 = _2089 ? 0 : 1;
    int _2093 = abs(_2077);
    int _2095 = _2087 * as_type<int>(_1959);
    int _2097 = _2095 + _2079;
    int _2099 = abs(_2091);
    int _2101 = ~_2081;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    int _2107 = abs(_2049);
    int _2109 = ~_2093;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    int _2115 = _2105 * as_type<int>(_1985);
    int _2117 = _2115 + _2097;
    float _2119 = float(uint(_2049));
    int _2121 = _2113 * as_type<int>(_1993);
    int _2123 = _2121 + _2117;
    float _2125 = float(uint(_2107));
    int _2127 = ~_2099;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    float _2133 = 1.0 / _2119;
    bool _2135 = !_1773;
    int _2137 = _2135 ? _2033 : (-1);
    int _2139 = ~_2107;
    int _2141 = _2139 + 1;
    int _2143 = _2123 * _2131;
    float _2145 = _511 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2147 = ~_2049;
    int _2149 = _2147 + 1;
    float _2151 = _511 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2153 = 1.0 / _2125;
    int _2155 = _2137 * _2099;
    int _2157 = _2155 + _2143;
    float _2159 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2145);
    float _2161 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2151);
    bool _2163 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2165 = isnan(0.5);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2171 = _2167 || _2169;
    int _2173 = abs(_2157);
    float _2175 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2159);
    int _2177 = as_type<int>(_2133) + (-2);
    float _2179 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2161);
    float _2181 = float(uint(_2173));
    float _2183 = float(uint(_2157));
    float _2185 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2187 = _329 > 0.5;
    int _2189 = as_type<int>(_2153) + (-2);
    float _2191 = as_type<float>(_2177) * _2183;
    int _2193 = ~_2049;
    int _2195 = _2193 + 1;
    int _2197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2199 = _2197 != 0;
    float _2201 = as_type<float>(_2189) * _2181;
    float _2203 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2205 = trunc(_2191);
    float _2207 = precise::max(_2205, 0.0);
    uint _2209 = uint(_2207);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2213 = _2211 != 0;
    float _2215 = _2185 + _2203;
    bool _2217 = _327 > 0.5;
    if (!_2171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2219 = _173;
    float _2221 = trunc(_2201);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2229 = _2149 * int(_2209);
    int _2231 = _2229 + _2157;
    float _2233 = 1.0 / _2203;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2239 = float(uint(_2231));
    float _2241 = _2235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2243 = _2141 * int(_2225);
    int _2245 = _2243 + _2173;
    float _2247 = as_type<float>(_2177) * _2239;
    float _2249 = float(uint(_2245));
    float _2251 = trunc(_2247);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    float _2257 = _2215 * _2233;
    float _2259 = _2257 * 0.5;
    float _2261 = as_type<float>(_2189) * _2249;
    float _2263 = _2219;
    float _2265 = _2259;
    if (!_2171)
    {
        float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2269 = fma(_2259, _2219, _2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = _2271;
    if (!_2171)
    {
        _2265 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2275 = _2265;
    float _2277 = trunc(_2261);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    int _2283 = int(_2209) + int(_2255);
    if (!_2171)
    {
        float _2285 = 1.0 / _2271;
        _2273 = _2285;
    }
    float _2287 = _2273;
    int _2289 = int(_2225) + int(_2281);
    float _2291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2293 = ~_2107;
    int _2295 = _2293 + 1;
    int _2297 = _2195 * _2283;
    int _2299 = _2297 + _2157;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2303 = _2295 * _2289;
    int _2305 = _2303 + _2173;
    bool _2307 = uint(_2299) >= uint(_2049);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2311 = as_type<float>(_2299);
    if (!_2171)
    {
        float _2313 = -_2275;
        float _2315 = _2313 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2311 = _2315;
    }
    float _2317 = _2311;
    float _2319 = -_183;
    int _2321 = _2217 ? as_type<int>(_2319) : as_type<int>(_183);
    bool _2323 = !_2307;
    int _2325 = _2323 ? 0 : (-1);
    out.m_58.x = _2237;
    out.m_58.y = _2309;
    out.m_58.z = _2241;
    bool _2327 = uint(_2305) >= uint(_2107);
    float _2329 = _2317;
    if (!_2171)
    {
        float _2331 = 1.0 / _2317;
        _2329 = _2331;
    }
    float _2333 = _2329;
    int _2335 = ~_2283;
    int _2337 = _2335 + _2325;
    int _2339 = _2337 + 1;
    float _2341 = _2291 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2343 = _2157 ^ _2049;
    bool _2345 = !_2199;
    float _2347 = _2345 ? _183 : as_type<float>(_2321);
    int _2349 = _2049 * _2339;
    int _2351 = _2349 + _2157;
    uint _2353 = uint(int(uint(_2343) >> uint(31)));
    bool _2355 = _2049 == 0;
    float _2357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2359 = !_2327;
    float _2361 = _2359 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2363 = _2347 + 0.5;
    float _2365 = -_193;
    int _2367 = _2187 ? as_type<int>(_2365) : as_type<int>(_193);
    bool _2369 = _2049 == 0;
    int _2371 = ~as_type<int>(_2361);
    int _2373 = _2289 + _2371;
    int _2375 = _2373 + 1;
    float _2377 = _2361;
    if (!_2171)
    {
        float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2381 = -_2275;
        float _2383 = fma(_2287, _2379, _2381);
        _2377 = _2383;
    }
    float _2385 = _2377;
    int _2387 = ~int(_2353);
    int _2389 = _2387 + 1;
    bool _2391 = !_2213;
    float _2393 = _2391 ? _193 : as_type<float>(_2367);
    bool _2395 = !_2355;
    int _2397 = _2395 ? _2351 : (-1);
    int _2399 = _2375 ^ _2389;
    float _2401 = float(_2397);
    int _2403 = ~_2389;
    int _2405 = _2403 + _2399;
    int _2407 = _2405 + 1;
    float _2409 = as_type<float>(_2399);
    if (!_2171)
    {
        float _2411 = _2385 * _2333;
        float _2413 = precise::clamp(_2411, 0.0, 1.0);
        _2409 = _2413;
    }
    float _2415 = _2409;
    float _2417 = _2357 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2419 = fma(_2341, _2401, _771);
    bool _2421 = !_2369;
    float _2423 = _2421 ? as_type<float>(_2407) : as_type<float>(0xffffffffu /* nan */);
    float _2425 = fma(_2341, _2363, _2419);
    float _2427 = float(as_type<int>(_2423));
    float _2429 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1690);
    float _2431 = _2423;
    if (_2171)
    {
        _2431 = 1.0;
    }
    float _2433 = _2431;
    float _2435 = _2433;
    if (!_2171)
    {
        float _2437 = -_2415;
        float _2439 = _2437 + 1.0;
        _2435 = _2439;
    }
    float _2441 = _2435;
    float _2443 = -_1686;
    float _2445 = fma(_2347, _2443, _2425);
    float _2447 = -_783;
    float _2449 = fma(_2417, _2427, _2447);
    float _2451 = _2393 + (-0.5);
    float _2453 = _2441 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2455 = _2441 > 0.0;
    bool _2457 = isnan(_2441);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    out.gl_Position.x = _1599;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _2429;
    out.gl_Position.w = _1563;
    float _2465 = -_2417;
    float _2467 = fma(_2465, _2451, _2449);
    float _2469 = _2429 + _1563;
    float _2471 = _2453 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2473 = fma(_2393, _1680, _2467);
    float _2475 = _1731 * _1635;
    float _2477 = _2469 * 0.5;
    float _2479 = -_1731;
    float _2481 = _2479 + 1.0;
    out.m_45.x = _2471;
    float _2483 = _1646 * _2475;
    float _2485 = _1656 * _2475;
    float _2487 = _1646 * _2481;
    out.m_60.z = _2477;
    out.m_60.w = _1563;
    float _2489 = fma(_1652, _2483, _1640);
    float _2491 = fma(_1654, _2483, _1642);
    float _2493 = fma(_1646, _2485, _1644);
    out.m_62.x = _2445;
    out.m_62.y = _2473;
    out.m_64.x = _2489;
    out.m_64.y = _2491;
    out.m_64.z = _2493;
    out.m_64.w = _2487;
    if (_2463)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2495 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2495;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2553 = as_type<float>(_99);
        out.gl_Position.z = _2553;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    float _105 = float(_83);
    float _107 = -_103;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_103);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    bool _121 = _109 >= _105;
    bool _123 = !_119;
    bool _125 = _121 || _123;
    float _127 = _109;
    if (_125)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _91;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _101 = as_type<int>(_131);
    }
    int _133 = _101;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2617 = as_type<float>(_133);
        out.gl_Position.z = _2617;
    }
    if (_125)
    {
        return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _139 = in.m_52.w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    float _171 = _135;
    float _173 = 0.5;
    if (!_149)
    {
        float _175 = _137 * _137;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_149)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_149;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _137 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _137);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = 1.0 / _105;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _245 = _229;
    if (!_149)
    {
        _245 = _137;
    }
    float _247 = _245;
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].y, _241);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].z, _243);
    float _255 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    float _257 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    bool _259 = !_149;
    float _261 = _247;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _137 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _261 = _281;
    }
    float _283 = _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _289 = fma(_283, _151, _255);
    float _291 = fma(_283, _153, _257);
    float _293 = _109 * _233;
    float _295 = fma(_283, _155, _287);
    float _297 = fma(_289, _139, _157);
    float _299 = fma(_291, _139, _159);
    float _301 = fma(_295, _139, _161);
    bool _303 = !_285;
    float _321;
    if (!_303)
    {
        float _305 = in.m_54.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        _321 = _293;
    }
    _323 = false;
    float _325 = _321;
    float _327 = in.m_54.x;
    float _329 = in.m_54.y;
    float _331 = in.m_54.z;
    float _333 = in.m_54.w;
    float _335 = _299 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _337 = _299 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _339 = _299 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = 1.0 / _343;
    float _351 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].x, _335);
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].x, _339);
    float _361 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].x, _337);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _325 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _325 + _367;
    float _371 = 1.0 / _347;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _375 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].z, _359);
    float _377 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _325 + _379;
    float _383 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _385 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _387 = 1.0 / _357;
    float _389 = -_353;
    float _391 = fma(_383, 2.0, _389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = fma(_385, -2.0, _373);
    float _399 = _327 * 2.0;
    float _401 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _403 = 1.0 / _395;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _325 + _405;
    float _409 = _365 * _371;
    float _411 = fma(_329, 6.283185482025146484375, _109);
    float _413 = _407 * _349;
    float _415 = _293 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _417 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _419 = isnan(_325);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = floor(_399);
    float _431 = _329 + _327;
    float _433 = -_415;
    float _435 = _433 + 1.0;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = _381 * _387;
    float _441 = _329 * 2.0;
    float _443 = _431 + (-1.0);
    float _445 = fma(_437, -2.0, 3.0);
    float _447 = _437 * _437;
    float _449 = _369 * _403;
    float _451 = _331 * 2.0;
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _455 = _445 * _447;
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = _329 + _331;
    float _461 = _331 + _327;
    float _463 = floor(_451);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    float _477 = _459 + (-1.0);
    float _479 = _461 + (-1.0);
    bool _481 = _429 > 0.0;
    float _483 = _411 * 1.57079637050628662109375;
    bool _485 = _429 >= 0.0;
    bool _487 = isnan(_429);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _497 = floor(_441);
    float _499 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _501 = !_471;
    int _503 = _501 ? 0 : 1;
    float _505 = _483 * 0.15915493667125701904296875;
    bool _507 = !_475;
    int _509 = _507 ? 0 : 1;
    float _511 = _377 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _513 = _401 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _517 = log2(_515);
    bool _519 = !_467;
    int _521 = _519 ? 0 : 1;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _523;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _537 = _535 != 0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    bool _543 = _463 >= 0.0;
    bool _545 = isnan(_463);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = fma(_525, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _563 = _551 ? 0 : 1;
    float _565 = fma(_555, _439, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _567 = _463 > 0.0;
    float _569 = fma(_559, _439, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _571 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _573 = isnan(_325);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = fma(_541, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _585 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _587 = isnan(_325);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -_427;
    float _599 = _597 + 1.0;
    bool _601 = !_529;
    int _603 = _601 ? 0 : 1;
    float _605 = -_581;
    float _607 = _605 + 1.0;
    bool _609 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _611 = isnan(_325);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _581 * _599;
    bool _623 = _497 > 0.0;
    float _625 = _595 * _607;
    bool _627 = _497 >= 0.0;
    bool _629 = isnan(_497);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    float _637 = -_595;
    float _639 = _637 + 1.0;
    bool _641 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _643 = isnan(_325);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = _517 * _109;
    float _655 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _657 = int(_655);
    float _659 = _375 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _661 = _651 * _639;
    float _663 = -_651;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _675 = exp2(_653);
    int _677 = ~_563;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = fma(_669, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_673, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _687;
    float _691 = _619 * _665;
    int _693 = _681;
    if (!_567)
    {
        int _695 = ~_563;
        int _697 = _695 + 1;
        _693 = _697;
    }
    int _699 = _693;
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = float(_657);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _709 = 1.0 + _707;
    bool _711 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _719 = _715 || _717;
    float _721 = fma(_689, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _723 = _561 * _691;
    float _725 = _583 * _691;
    float _727 = -_675;
    float _729 = _727 + 1.0;
    float _731 = 1.0 / _705;
    float _733 = -_619;
    float _735 = _733 + 1.0;
    float _737 = fma(_333, 6.283185482025146484375, _109);
    float _739 = _719 ? _729 : 0.0;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _755 = 1.0 / _709;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _761 = float(_703);
    float _763 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].z, _741);
    float _765 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _753);
    float _767 = _737 * 1.57079637050628662109375;
    float _769 = -_109;
    float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _773 = fma(_759, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _775 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _763);
    float _777 = fma(_331, 6.283185482025146484375, _109);
    float _779 = _761 * _109;
    float _781 = _731 * _109;
    float _783 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _397);
    float _785 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _765);
    float _787 = _767 * 0.15915493667125701904296875;
    float _789 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].x, _723);
    if (_751)
    {
        float _791 = _739 * _755;
        _127 = _791;
    }
    float _793 = _127;
    float _795 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    float _797 = in.m_56.x;
    float _799 = in.m_56.y;
    float _801 = in.m_56.z;
    int _803 = abs(_603);
    int _805 = _493 ? 0 : 1;
    float _807 = _787 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = float(_803);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = float(_699);
    float _819 = _777 * 1.57079637050628662109375;
    int _821 = ~_805;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_481)
    {
        int _831 = ~_805;
        int _833 = _831 + 1;
        _827 = _833;
    }
    int _835 = _827;
    float _837 = _819 * 0.15915493667125701904296875;
    float _839 = _811 * _817;
    float _841 = -_511;
    float _843 = _841 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _845 = !_533;
    int _847 = _845 ? 0 : 1;
    float _849 = -_513;
    float _851 = _849 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _853 = _635 ? 0 : 1;
    float _855 = _843 * _843;
    float _857 = _839 * (-2.0);
    int _859 = abs(_847);
    float _861 = _505 * 6.283185482025146484375;
    float _863 = sin(_861);
    int _865 = ~_853;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = fma(_851, _851, _855);
    int _873 = _869;
    if (!_623)
    {
        int _875 = ~_853;
        int _877 = _875 + 1;
        _873 = _877;
    }
    int _879 = _873;
    float _881 = fma(_857, _797, _797);
    float _883 = _327 + (-0.5);
    float _885 = float(_835);
    float _887 = fma(_453, _857, _453);
    float _889 = float(_859);
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].x, _881);
    bool _893 = !_537;
    int _895 = _893 ? 0 : 1;
    float _897 = -_659;
    float _899 = _897 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _901 = _837 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _889 * _885;
    float _907 = fma(_887, _793, _891);
    int _909 = abs(_895);
    float _911 = fma(_899, _899, _871);
    float _913 = _905 * (-2.0);
    float _915 = _329 + (-0.5);
    float _917 = rsqrt(_911);
    float _919 = fma(_913, _799, _799);
    float _921 = float(_879);
    float _923 = _907 * 0.15915493667125701904296875;
    float _925 = float(_909);
    float _927 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[196].y, _919);
    float _929 = fma(_565, _661, _789);
    float _931 = fma(_569, _661, _795);
    float _933 = fma(_495, _913, _495);
    float _935 = _925 * _921;
    float _937 = fma(_683, _625, _929);
    float _939 = fma(_721, _625, _931);
    float _941 = fma(_933, _793, _927);
    float _943 = _935 * (-2.0);
    float _945 = in.m_52.x;
    float _947 = in.m_52.y;
    float _949 = fma(_685, _621, _937);
    float _951 = _851 * _917;
    float _953 = fma(_943, _801, _801);
    float _955 = _331 + (-0.5);
    float _957 = fma(_499, _943, _499);
    float _959 = _843 * _917;
    float _961 = _899 * _917;
    float _963 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[196].z, _953);
    float _965 = fma(_773, _621, _939);
    float _967 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].x, _949);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _961 * _969;
    float _973 = fma(_957, _793, _963);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _977 = _951 * _975;
    float _979 = _457 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _981 = _941 * 0.15915493667125701904296875;
    float _983 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].y, _965);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _987 = -_977;
    float _989 = fma(_961, _985, _987);
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _993 = -_971;
    float _995 = fma(_959, _991, _993);
    float _997 = _809 * _979;
    float _999 = fma(_863, _979, _183);
    float _1001 = fma(_903, _979, _193);
    float _1003 = _989 * _989;
    float _1005 = _923 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _967 * _945;
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1013 = _959 * _1011;
    float _1015 = _973 * 0.15915493667125701904296875;
    float _1017 = fma(_995, _995, _1003);
    float _1019 = _983 * _947;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = -_1013;
    float _1025 = fma(_951, _1021, _1023);
    float _1027 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _999);
    float _1029 = _923 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1035 = fma(_1025, _1025, _1017);
    float _1037 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1039 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _997);
    if (_815)
    {
        _829 = 1.0;
    }
    float _1043 = _829;
    float _1045 = _1037 * _1027;
    float _1047 = _981 * 6.283185482025146484375;
    float _1049 = sin(_1047);
    float _1051 = _1039 * _1033;
    float _1053 = _1043;
    if (!_815)
    {
        _1053 = 7.345489978790283203125;
    }
    float _1055 = _1053;
    bool _1057 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1059 = isnan(0.5);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1065 = _1061 || _1063;
    float _1067 = _981 * 6.283185482025146484375;
    float _1069 = cos(_1067);
    float _1071 = _1015 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _1031 * _1049;
    float _1077 = _1015 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    float _1081 = _1007 * _1069;
    float _1083 = _1031 * _1069;
    float _1085 = rsqrt(_1035);
    float _1087 = -_1075;
    float _1089 = fma(_1073, _1081, _1087);
    float _1091 = -_1081;
    float _1093 = fma(_1073, _1075, _1091);
    float _1095 = _1007 * _1049;
    float _1097 = _1049 * _1079;
    float _1099 = _1079 * _1051;
    float _1101 = _1069 * _1079;
    float _1103 = -_1051;
    float _1105 = _1073 * _1103;
    float _1107 = fma(_1073, _1083, _1095);
    float _1109 = fma(_1073, _1095, _1083);
    float _1111 = _1031 * _1099;
    float _1113 = fma(_1101, _1045, _1105);
    float _1115 = _995 * _1085;
    float _1117 = _989 * _1085;
    float _1119 = fma(_1107, _1045, _1111);
    float _1121 = _1007 * _1099;
    float _1123 = _959 * _1115;
    float _1125 = _1025 * _1085;
    float _1127 = fma(_1093, _1041, _1119);
    float _1129 = _961 * _1117;
    float _1131 = -_1123;
    float _1133 = fma(_951, _1117, _1131);
    float _1135 = fma(_1089, _1045, _1121);
    float _1137 = fma(_1097, _1041, _1113);
    float _1139 = -_1129;
    float _1141 = fma(_959, _1125, _1139);
    float _1143 = _1133 * _1127;
    float _1145 = fma(_1109, _1041, _1135);
    float _1147 = _327 * _1055;
    float _1149 = _1141 * _1127;
    float _1151 = fma(_1125, _1137, _1143);
    float _1153 = _951 * _1125;
    float _1155 = fma(_1115, _1137, _1149);
    float _1157 = fma(_961, _1145, _1151);
    float _1159 = -_1153;
    float _1161 = fma(_961, _1115, _1159);
    float _1163 = fma(_951, _1145, _1155);
    float _1165 = _659 + _1157;
    float _1167 = _1161 * _1127;
    float _1169 = _513 + _1163;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1165 + _1171;
    float _1175 = fma(_1117, _1137, _1167);
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1169 + _1177;
    float _1181 = _1173 * _1173;
    float _1183 = fma(_959, _1145, _1175);
    float _1185 = fma(_1179, _1179, _1181);
    float _1187 = _511 + _1183;
    float _1189 = sqrt(_1185);
    bool _1191 = _1189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1193 = _1161;
    float _1195 = _1181;
    float _1197 = _1169;
    float _1199 = _1113;
    float _1201 = _1185;
    if (!_1191)
    {
        _1193 = _1169;
    }
    float _1203 = _1193;
    float _1205 = _1203;
    if (!_1191)
    {
        _1195 = _1165;
    }
    float _1207 = _1195;
    float _1209 = _1207;
    if (!_1191)
    {
        _1197 = _1187;
    }
    float _1211 = _1197;
    bool _1213 = !_1191;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1189 + _1219;
        float _1223 = rsqrt(_1185);
        float _1225 = _1221 * _1217;
        float _1227 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1225 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = sin(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        float _1239 = fma(_1233, _1227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1241 = _1223 * _1239;
        float _1243 = _1237 + (-1.0);
        float _1245 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = fma(_1179, _1241, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1249 = fma(_1173, _1241, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1251 = fma(_1187, _1237, _1245);
        _1205 = _1247;
        _1209 = _1249;
        _1215 = _1251;
    }
    float _1253 = _1205;
    float _1255 = _1209;
    float _1257 = _1215;
    float _1259 = _1257;
    float _1261 = _1253;
    float _1263 = _1255;
    if (!_1065)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _511 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _513 + _1269;
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1275 = -_513;
        float _1277 = _1275 + _1253;
        float _1279 = _1267 * _1267;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _659 + _1281;
        float _1285 = -_659;
        float _1287 = _1285 + _1255;
        float _1289 = fma(_1271, _1271, _1279);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = fma(_1283, _1283, _1289);
        float _1295 = sqrt(_1293);
        float _1297 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1299 = precise::min(_1295, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1301 = _1299 * _1291;
        float _1303 = _1297 * _1301;
        float _1305 = -_511;
        float _1307 = _1305 + _1257;
        float _1309 = fma(_1277, _1303, _513);
        float _1311 = fma(_1307, _1303, _511);
        float _1313 = fma(_1287, _1303, _659);
        _1259 = _1311;
        _1261 = _1309;
        _1263 = _1313;
    }
    float _1315 = _1259;
    float _1317 = _1261;
    float _1319 = _1263;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1323 = _1315 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1327 = _1317 + _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1331 = _1319 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1327, _1327, _1333);
    float _1337 = fma(_1331, _1331, _1335);
    float _1339 = rsqrt(_1337);
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1327 * _1341;
    float _1345 = _1331 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1331;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1323;
    if (_1355)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1369;
    }
    float _1371 = _1361;
    if (_1355)
    {
        float _1373 = rsqrt(_1351);
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (_1355)
    {
        float _1377 = _1359 * _1371;
        _1365 = _1377;
    }
    float _1379 = _1365;
    if (_1355)
    {
        float _1381 = _1379 * 0.15915493667125701904296875;
        _1199 = _1381;
    }
    float _1383 = _1199;
    float _1385 = _1333;
    float _1387 = _1383;
    if (_1355)
    {
        float _1389 = _1383 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1385 = _1391;
    }
    float _1393 = _1385;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1339;
    float _1401 = _1395;
    float _1403 = _1397;
    if (_1355)
    {
        float _1405 = _1383 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        _1399 = _1407;
    }
    float _1409 = _1399;
    float _1411 = -_1341;
    float _1413 = -_1397;
    float _1415 = fma(_1323, _1411, _1413);
    if (!_1355)
    {
        _1367 = _1343;
    }
    float _1417 = _1367;
    float _1419 = _1417;
    if (_1355)
    {
        float _1421 = _1415 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1421;
    }
    float _1423 = _1401;
    float _1425 = _1423;
    float _1427 = _1393;
    if (_1355)
    {
        float _1429 = fma(_1393, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1201 = _1429;
    }
    float _1431 = _1201;
    if (!_1355)
    {
        _1425 = _1415;
    }
    float _1433 = _1425;
    float _1435 = _1433;
    float _1437 = _1409;
    if (_1355)
    {
        float _1439 = _1409 + (-1.0);
        _1403 = _1439;
    }
    float _1441 = _1403;
    float _1443 = _1441;
    if (_1355)
    {
        float _1445 = _1375 * _1431;
        _1387 = _1445;
    }
    float _1447 = _1387;
    float _1449 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1451 = sqrt(_1337);
    if (_1355)
    {
        float _1453 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1453;
    }
    float _1455 = _1427;
    float _1457 = _1455;
    if (_1355)
    {
        float _1459 = _1343 * _1447;
        _1419 = _1459;
    }
    float _1461 = _1419;
    if (!_1355)
    {
        _1443 = _1345;
    }
    float _1463 = _1443;
    float _1465 = _1463;
    if (_1355)
    {
        float _1467 = _1345 * _1447;
        _1465 = _1467;
    }
    float _1469 = _1465;
    if (_1355)
    {
        float _1471 = fma(_1415, _1409, _1455);
        _1435 = _1471;
    }
    float _1473 = _1435;
    if (!_1355)
    {
        _1457 = _1347;
    }
    float _1475 = _1457;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    if (!_1355)
    {
        _1437 = _1349;
    }
    float _1483 = _1437;
    float _1485 = _1483;
    if (_1355)
    {
        float _1487 = _1469 * _1469;
        _1485 = _1487;
    }
    float _1489 = _1485;
    float _1491 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = fma(_1473, _1473, _1481);
    float _1495 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1501 = _1493 + _1489;
    float _1503 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1449);
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1507 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1505);
    float _1509 = precise::clamp(_1507, 0.0, 1.0);
    float _1511 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1499);
    float _1513 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1515 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1517 = rsqrt(_1501);
    float _1519 = _1511 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = -_1509;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1527 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1513);
    float _1533 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1525);
    float _1535 = abs(_1523);
    float _1537 = log2(_1535);
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1541 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1543 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1545 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1539);
    float _1551 = _1517 * _1461;
    float _1553 = _1517 * _1473;
    float _1555 = _1517 * _1469;
    float _1557 = -_1547;
    float _1559 = fma(_1557, _1543, 1.0);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1563 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1567 = -_1561;
    float _1569 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1573 = log2(_1559);
    float _1575 = -_1555;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1579 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1581 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1565);
    float _1583 = _1553 + 1.0;
    float _1585 = fma(_1577, -0.5, 0.5);
    float _1587 = fma(_1577, 0.5, 0.5);
    float _1589 = exp2(_1571);
    float _1591 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1579);
    float _1593 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1581);
    float _1595 = fma(_1587, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1597 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1591);
    float _1599 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1601 = fma(_1587, _1595, -0.212114393711090087890625);
    float _1603 = sqrt(_1585);
    float _1605 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1597);
    float _1607 = _1573 * 0.693147182464599609375;
    float _1609 = fma(_1587, _1601, 1.570728778839111328125);
    float _1611 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1613 = 1.0 / _1563;
    float _1615 = -_1553;
    float _1617 = fma(_1589, _1583, _1615);
    float _1619 = _1603 * 0.636619746685028076171875;
    float _1621 = -_1609;
    float _1623 = fma(_1619, _1621, 1.0);
    float _1625 = fma(_1617, 0.5, 0.5);
    float _1627 = _1599 * _1613;
    float _1629 = _1605 * _1613;
    float _1631 = fma(_1627, 0.5, 0.5);
    float _1633 = fma(_1629, -0.5, 0.5);
    float3 _4947 = float3(_1631, _1633, _1611);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4947, float3(0.0), isnan(_4947)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4947, float3(0.0), isnan(_4947)), level(0.0)).x;
    float3 _4958 = float3(_1631, _1633, _1611);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4958, float3(0.0), isnan(_4958)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4958, float3(0.0), isnan(_4958)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4975 = float2(_1623, _1625);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4975, float2(0.0), isnan(_4975)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4975, float2(0.0), isnan(_4975)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    float _1658 = float(uint(_703));
    float _1660 = trunc(_781);
    int _1662 = int(_1660);
    int _1664 = ~_703;
    int _1666 = _1664 + 1;
    float _1668 = _779 * _233;
    int _1670 = _703 + (-1);
    float _1672 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1674 = abs(_509);
    float _1676 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1678 = -_785;
    float _1680 = _1678 + 1.0;
    float _1682 = 1.0 / _1658;
    float _1684 = -_775;
    float _1686 = _1684 + 1.0;
    float _1688 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1676);
    float _1690 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    float _1692 = floor(_1147);
    float _1694 = float(uint(_1662));
    int _1696 = as_type<int>(_1682) + (-2);
    float _1698 = trunc(_1668);
    int _1700 = int(_1698);
    float _1702 = float(_1662);
    float _1704 = as_type<float>(_1696) * _1694;
    float _1706 = trunc(_1704);
    float _1708 = precise::max(_1706, 0.0);
    uint _1711 = uint(_1708);
    float _1713 = exp2(_1672);
    int _1715 = _1666 * int(_1711);
    int _1717 = _1715 + _1662;
    float _1719 = float(uint(_1717));
    float _1721 = -_1713;
    float _1723 = _1721 + 1.0;
    float _1725 = as_type<float>(_1696) * _1719;
    int _1727 = ~_703;
    int _1729 = _1727 + 1;
    float _1731 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1733 = trunc(_1725);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    int _1739 = int(_1711) + int(_1737);
    int _1741 = _1729 * _1739;
    int _1743 = _1741 + _1662;
    bool _1745 = _1702 >= _761;
    bool _1747 = isnan(_1702);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan(_761);
    bool _1753 = _1749 || _1751;
    float _1755 = float(_1753);
    float _1757 = -_1692;
    float _1759 = _1147 + _1757;
    bool _1761 = uint(_1743) >= uint(_703);
    float _1763 = _1759 * _761;
    float _1765 = trunc(_1755);
    int _1767 = int(_1765);
    bool _1769 = !_1761;
    int _1771 = _1769 ? 0 : (-1);
    bool _1773 = _703 == 0;
    int _1775 = ~_1739;
    int _1777 = _1775 + _1771;
    int _1779 = _1777 + 1;
    float _1781 = trunc(_1763);
    int _1783 = int(_1781);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1787 = _1785 != 0;
    int _1789 = _703 * _1779;
    int _1791 = _1789 + _1662;
    bool _1793 = !_1787;
    int _1795 = _1793 ? 0 : 1;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1799 = _1797 != 0;
    int _1801 = ~_1767;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    bool _1807 = !_1773;
    int _1809 = _1807 ? _1791 : (-1);
    int _1811 = abs(_1795);
    int _1813 = abs(_503);
    int _1815 = _1809 * _1805;
    int _1817 = abs(_521);
    int _1819 = _1767 * _1670;
    int _1821 = _1819 + _1815;
    bool _1823 = !_1799;
    int _1825 = _1823 ? 0 : 1;
    int _1827 = _1821 * _1813;
    int _1829 = ~_703;
    int _1831 = _1829 + 1;
    int _1833 = _1783 * _1811;
    int _1835 = _1833 + _1662;
    int _1837 = abs(_1825);
    int _1839 = _1700 * _1817;
    int _1841 = _1839 + _1827;
    float _1843 = float(uint(_1835));
    int _1845 = _1835 * _1674;
    int _1847 = _1845 + _1841;
    int _1849 = ~_703;
    int _1851 = _1849 + 1;
    int _1853 = _1783 * _1837;
    int _1855 = _1853 + _1847;
    float _1857 = as_type<float>(_1696) * _1843;
    float _1859 = float(uint(_1855));
    float _1861 = as_type<float>(_1696) * _1859;
    float _1863 = trunc(_1861);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    int _1869 = _1851 * int(_1867);
    int _1871 = _1869 + _1855;
    float _1873 = float(uint(_1871));
    int _1875 = ~_703;
    int _1877 = _1875 + 1;
    float _1879 = as_type<float>(_1696) * _1873;
    float _1881 = trunc(_1879);
    float _1883 = precise::max(_1881, 0.0);
    uint _1885 = uint(_1883);
    int _1887 = int(_1867) + int(_1885);
    int _1889 = ~_703;
    int _1891 = _1889 + 1;
    int _1893 = _1877 * _1887;
    int _1895 = _1893 + _1855;
    float _1897 = trunc(_1857);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    bool _1903 = uint(_1895) >= uint(_703);
    bool _1905 = !_1903;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = ~_1887;
    int _1911 = _1909 + _1907;
    int _1913 = _1911 + 1;
    int _1915 = _703 * _1913;
    int _1917 = _1915 + _1855;
    int _1919 = _1891 * int(_1901);
    int _1921 = _1919 + _1835;
    bool _1923 = !_1773;
    int _1925 = _1923 ? _1917 : (-1);
    float _1927 = float(uint(_1921));
    int _1929 = _1925 >> 31;
    int _1931 = _1925 & 3;
    bool _1933 = _1931 != 0;
    float _1935 = as_type<float>(_1696) * _1927;
    int _1937 = _1929 & 3;
    float _1939 = trunc(_1935);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    int _1945 = _1925 + _1937;
    int _1947 = _1945 >> 2;
    int _1949 = _1947 << 4;
    int _1951 = _1949 + 368;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[int(_1963)][_1965];
    int _1969 = int(_1901) + int(_1943);
    int _1971 = _1925 & 3;
    bool _1973 = _1971 != 0;
    int _1975 = _1933 ? 0 : 1;
    int _1977 = _1951 + 8;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[int(_1989)][_1991];
    int _1995 = _1831 * _1969;
    int _1997 = _1995 + _1835;
    bool _1999 = uint(_1971) > 1u;
    bool _2001 = _1971 != 3;
    bool _2003 = uint(_1997) >= uint(_703);
    bool _2005 = !_2003;
    int _2007 = _2005 ? 0 : (-1);
    bool _2009 = uint(_1971) >= 2u;
    int _2011 = ~_1969;
    int _2013 = _2011 + _2007;
    int _2015 = _2013 + 1;
    int _2017 = ~_1975;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    int _2023 = _2021;
    if (!_1999)
    {
        int _2025 = ~_1975;
        int _2027 = _2025 + 1;
        _2023 = _2027;
    }
    int _2029 = _2023;
    int _2031 = _703 * _2015;
    int _2033 = _2031 + _1835;
    bool _2035 = !_1973;
    int _2037 = _2035 ? 0 : 1;
    int _2039 = abs(_2029);
    int _2041 = _2009 ? 0 : 1;
    bool _2043 = _1971 != 3;
    int _2045 = abs(_2037);
    float _2047 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2049 = int(_2047);
    int _2051 = ~_2041;
    int _2053 = _2051 + 1;
    int _2055 = _2053 + 1;
    int _2057 = _2055;
    if (_2001)
    {
        int _2059 = ~_2041;
        int _2061 = _2059 + 1;
        _2057 = _2061;
    }
    int _2063 = _2057;
    int _2065 = ~_2039;
    int _2067 = _2065 + 1;
    int _2069 = _2067 + 1;
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2073 = _2071 != 0;
    bool _2075 = !_2043;
    int _2077 = _2075 ? 0 : (-1);
    int _2079 = _2069 * as_type<int>(_1967);
    int _2081 = abs(_2063);
    int _2083 = ~_2045;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    bool _2089 = !_2073;
    int _2091 = _2089 ? 0 : 1;
    int _2093 = abs(_2077);
    int _2095 = _2087 * as_type<int>(_1959);
    int _2097 = _2095 + _2079;
    int _2099 = abs(_2091);
    int _2101 = ~_2081;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    int _2107 = abs(_2049);
    int _2109 = ~_2093;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    int _2115 = _2105 * as_type<int>(_1985);
    int _2117 = _2115 + _2097;
    float _2119 = float(uint(_2049));
    int _2121 = _2113 * as_type<int>(_1993);
    int _2123 = _2121 + _2117;
    float _2125 = float(uint(_2107));
    int _2127 = ~_2099;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    float _2133 = 1.0 / _2119;
    bool _2135 = !_1773;
    int _2137 = _2135 ? _2033 : (-1);
    int _2139 = ~_2107;
    int _2141 = _2139 + 1;
    int _2143 = _2123 * _2131;
    float _2145 = _511 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2147 = ~_2049;
    int _2149 = _2147 + 1;
    float _2151 = _511 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2153 = 1.0 / _2125;
    int _2155 = _2137 * _2099;
    int _2157 = _2155 + _2143;
    float _2159 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2145);
    float _2161 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2151);
    bool _2163 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2165 = isnan(0.5);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2171 = _2167 || _2169;
    int _2173 = abs(_2157);
    float _2175 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2159);
    int _2177 = as_type<int>(_2133) + (-2);
    float _2179 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2161);
    float _2181 = float(uint(_2173));
    float _2183 = float(uint(_2157));
    float _2185 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2187 = _329 > 0.5;
    int _2189 = as_type<int>(_2153) + (-2);
    float _2191 = as_type<float>(_2177) * _2183;
    int _2193 = ~_2049;
    int _2195 = _2193 + 1;
    int _2197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2199 = _2197 != 0;
    float _2201 = as_type<float>(_2189) * _2181;
    float _2203 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2205 = trunc(_2191);
    float _2207 = precise::max(_2205, 0.0);
    uint _2209 = uint(_2207);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2213 = _2211 != 0;
    float _2215 = _2185 + _2203;
    bool _2217 = _327 > 0.5;
    if (!_2171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2219 = _173;
    float _2221 = trunc(_2201);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2229 = _2149 * int(_2209);
    int _2231 = _2229 + _2157;
    float _2233 = 1.0 / _2203;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2239 = float(uint(_2231));
    float _2241 = _2235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2243 = _2141 * int(_2225);
    int _2245 = _2243 + _2173;
    float _2247 = as_type<float>(_2177) * _2239;
    float _2249 = float(uint(_2245));
    float _2251 = trunc(_2247);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    float _2257 = _2215 * _2233;
    float _2259 = _2257 * 0.5;
    float _2261 = as_type<float>(_2189) * _2249;
    float _2263 = _2219;
    float _2265 = _2259;
    if (!_2171)
    {
        float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2269 = fma(_2259, _2219, _2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = _2271;
    if (!_2171)
    {
        _2265 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2275 = _2265;
    float _2277 = trunc(_2261);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    int _2283 = int(_2209) + int(_2255);
    if (!_2171)
    {
        float _2285 = 1.0 / _2271;
        _2273 = _2285;
    }
    float _2287 = _2273;
    int _2289 = int(_2225) + int(_2281);
    float _2291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2293 = ~_2107;
    int _2295 = _2293 + 1;
    int _2297 = _2195 * _2283;
    int _2299 = _2297 + _2157;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2303 = _2295 * _2289;
    int _2305 = _2303 + _2173;
    bool _2307 = uint(_2299) >= uint(_2049);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2311 = as_type<float>(_2299);
    if (!_2171)
    {
        float _2313 = -_2275;
        float _2315 = _2313 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2311 = _2315;
    }
    float _2317 = _2311;
    float _2319 = -_183;
    int _2321 = _2217 ? as_type<int>(_2319) : as_type<int>(_183);
    bool _2323 = !_2307;
    int _2325 = _2323 ? 0 : (-1);
    out.m_58.x = _2237;
    out.m_58.y = _2309;
    out.m_58.z = _2241;
    bool _2327 = uint(_2305) >= uint(_2107);
    float _2329 = _2317;
    if (!_2171)
    {
        float _2331 = 1.0 / _2317;
        _2329 = _2331;
    }
    float _2333 = _2329;
    int _2335 = ~_2283;
    int _2337 = _2335 + _2325;
    int _2339 = _2337 + 1;
    float _2341 = _2291 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2343 = _2157 ^ _2049;
    bool _2345 = !_2199;
    float _2347 = _2345 ? _183 : as_type<float>(_2321);
    int _2349 = _2049 * _2339;
    int _2351 = _2349 + _2157;
    uint _2353 = uint(int(uint(_2343) >> uint(31)));
    bool _2355 = _2049 == 0;
    float _2357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2359 = !_2327;
    float _2361 = _2359 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2363 = _2347 + 0.5;
    float _2365 = -_193;
    int _2367 = _2187 ? as_type<int>(_2365) : as_type<int>(_193);
    bool _2369 = _2049 == 0;
    int _2371 = ~as_type<int>(_2361);
    int _2373 = _2289 + _2371;
    int _2375 = _2373 + 1;
    float _2377 = _2361;
    if (!_2171)
    {
        float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2381 = -_2275;
        float _2383 = fma(_2287, _2379, _2381);
        _2377 = _2383;
    }
    float _2385 = _2377;
    int _2387 = ~int(_2353);
    int _2389 = _2387 + 1;
    bool _2391 = !_2213;
    float _2393 = _2391 ? _193 : as_type<float>(_2367);
    bool _2395 = !_2355;
    int _2397 = _2395 ? _2351 : (-1);
    int _2399 = _2375 ^ _2389;
    float _2401 = float(_2397);
    int _2403 = ~_2389;
    int _2405 = _2403 + _2399;
    int _2407 = _2405 + 1;
    float _2409 = as_type<float>(_2399);
    if (!_2171)
    {
        float _2411 = _2385 * _2333;
        float _2413 = precise::clamp(_2411, 0.0, 1.0);
        _2409 = _2413;
    }
    float _2415 = _2409;
    float _2417 = _2357 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2419 = fma(_2341, _2401, _771);
    bool _2421 = !_2369;
    float _2423 = _2421 ? as_type<float>(_2407) : as_type<float>(0xffffffffu /* nan */);
    float _2425 = fma(_2341, _2363, _2419);
    float _2427 = float(as_type<int>(_2423));
    float _2429 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1690);
    float _2431 = _2423;
    if (_2171)
    {
        _2431 = 1.0;
    }
    float _2433 = _2431;
    float _2435 = _2433;
    if (!_2171)
    {
        float _2437 = -_2415;
        float _2439 = _2437 + 1.0;
        _2435 = _2439;
    }
    float _2441 = _2435;
    float _2443 = -_1686;
    float _2445 = fma(_2347, _2443, _2425);
    float _2447 = -_783;
    float _2449 = fma(_2417, _2427, _2447);
    float _2451 = _2393 + (-0.5);
    float _2453 = _2441 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2455 = _2441 > 0.0;
    bool _2457 = isnan(_2441);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    out.gl_Position.x = _1599;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _2429;
    out.gl_Position.w = _1563;
    float _2465 = -_2417;
    float _2467 = fma(_2465, _2451, _2449);
    float _2469 = _2429 + _1563;
    float _2471 = _2453 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2473 = fma(_2393, _1680, _2467);
    float _2475 = _1731 * _1635;
    float _2477 = _2469 * 0.5;
    float _2479 = -_1731;
    float _2481 = _2479 + 1.0;
    out.m_45.x = _2471;
    float _2483 = _1646 * _2475;
    float _2485 = _1656 * _2475;
    float _2487 = _1646 * _2481;
    out.m_60.z = _2477;
    out.m_60.w = _1563;
    float _2489 = fma(_1652, _2483, _1640);
    float _2491 = fma(_1654, _2483, _1642);
    float _2493 = fma(_1646, _2485, _1644);
    out.m_62.x = _2445;
    out.m_62.y = _2473;
    out.m_64.x = _2489;
    out.m_64.y = _2491;
    out.m_64.z = _2493;
    out.m_64.w = _2487;
    if (_2463)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2495 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2495;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2553 = as_type<float>(_99);
        out.gl_Position.z = _2553;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    float _105 = float(_83);
    float _107 = -_103;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_103);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    bool _121 = _109 >= _105;
    bool _123 = !_119;
    bool _125 = _121 || _123;
    float _127 = _109;
    if (_125)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _91;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _101 = as_type<int>(_131);
    }
    int _133 = _101;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2617 = as_type<float>(_133);
        out.gl_Position.z = _2617;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _139 = in.m_52.w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    float _171 = _135;
    float _173 = 0.5;
    if (!_149)
    {
        float _175 = _137 * _137;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_149)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_149;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _137 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _137);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = 1.0 / _105;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _245 = _229;
    if (!_149)
    {
        _245 = _137;
    }
    float _247 = _245;
    float _249 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].y, _241);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[8].z, _243);
    float _255 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    float _257 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    bool _259 = !_149;
    float _261 = _247;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _137 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _261 = _281;
    }
    float _283 = _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _289 = fma(_283, _151, _255);
    float _291 = fma(_283, _153, _257);
    float _293 = _109 * _233;
    float _295 = fma(_283, _155, _287);
    float _297 = fma(_289, _139, _157);
    float _299 = fma(_291, _139, _159);
    float _301 = fma(_295, _139, _161);
    bool _303 = !_285;
    float _321;
    if (!_303)
    {
        float _305 = in.m_54.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        _321 = _293;
    }
    _323 = false;
    float _325 = _321;
    float _327 = in.m_54.x;
    float _329 = in.m_54.y;
    float _331 = in.m_54.z;
    float _333 = in.m_54.w;
    float _335 = _299 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _337 = _299 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _339 = _299 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = 1.0 / _343;
    float _351 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].x, _335);
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].x, _339);
    float _361 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].x, _337);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _325 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _325 + _367;
    float _371 = 1.0 / _347;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _375 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].z, _359);
    float _377 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _325 + _379;
    float _383 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _385 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _387 = 1.0 / _357;
    float _389 = -_353;
    float _391 = fma(_383, 2.0, _389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = fma(_385, -2.0, _373);
    float _399 = _327 * 2.0;
    float _401 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _403 = 1.0 / _395;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _407 = _325 + _405;
    float _409 = _365 * _371;
    float _411 = fma(_329, 6.283185482025146484375, _109);
    float _413 = _407 * _349;
    float _415 = _293 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _417 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _419 = isnan(_325);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = floor(_399);
    float _431 = _329 + _327;
    float _433 = -_415;
    float _435 = _433 + 1.0;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = _381 * _387;
    float _441 = _329 * 2.0;
    float _443 = _431 + (-1.0);
    float _445 = fma(_437, -2.0, 3.0);
    float _447 = _437 * _437;
    float _449 = _369 * _403;
    float _451 = _331 * 2.0;
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _455 = _445 * _447;
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = _329 + _331;
    float _461 = _331 + _327;
    float _463 = floor(_451);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    float _477 = _459 + (-1.0);
    float _479 = _461 + (-1.0);
    bool _481 = _429 > 0.0;
    float _483 = _411 * 1.57079637050628662109375;
    bool _485 = _429 >= 0.0;
    bool _487 = isnan(_429);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _497 = floor(_441);
    float _499 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _501 = !_471;
    int _503 = _501 ? 0 : 1;
    float _505 = _483 * 0.15915493667125701904296875;
    bool _507 = !_475;
    int _509 = _507 ? 0 : 1;
    float _511 = _377 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _513 = _401 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _517 = log2(_515);
    bool _519 = !_467;
    int _521 = _519 ? 0 : 1;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _523;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _537 = _535 != 0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    bool _543 = _463 >= 0.0;
    bool _545 = isnan(_463);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = fma(_525, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _563 = _551 ? 0 : 1;
    float _565 = fma(_555, _439, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _567 = _463 > 0.0;
    float _569 = fma(_559, _439, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _571 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _573 = isnan(_325);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = fma(_541, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _585 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _587 = isnan(_325);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -_427;
    float _599 = _597 + 1.0;
    bool _601 = !_529;
    int _603 = _601 ? 0 : 1;
    float _605 = -_581;
    float _607 = _605 + 1.0;
    bool _609 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _611 = isnan(_325);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _581 * _599;
    bool _623 = _497 > 0.0;
    float _625 = _595 * _607;
    bool _627 = _497 >= 0.0;
    bool _629 = isnan(_497);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    float _637 = -_595;
    float _639 = _637 + 1.0;
    bool _641 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _643 = isnan(_325);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = _517 * _109;
    float _655 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _657 = int(_655);
    float _659 = _375 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _661 = _651 * _639;
    float _663 = -_651;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _675 = exp2(_653);
    int _677 = ~_563;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = fma(_669, _409, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_673, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _687;
    float _691 = _619 * _665;
    int _693 = _681;
    if (!_567)
    {
        int _695 = ~_563;
        int _697 = _695 + 1;
        _693 = _697;
    }
    int _699 = _693;
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = float(_657);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _709 = 1.0 + _707;
    bool _711 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _719 = _715 || _717;
    float _721 = fma(_689, _409, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _723 = _561 * _691;
    float _725 = _583 * _691;
    float _727 = -_675;
    float _729 = _727 + 1.0;
    float _731 = 1.0 / _705;
    float _733 = -_619;
    float _735 = _733 + 1.0;
    float _737 = fma(_333, 6.283185482025146484375, _109);
    float _739 = _719 ? _729 : 0.0;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _755 = 1.0 / _709;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _761 = float(_703);
    float _763 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].z, _741);
    float _765 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].w, _753);
    float _767 = _737 * 1.57079637050628662109375;
    float _769 = -_109;
    float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _773 = fma(_759, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _775 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _763);
    float _777 = fma(_331, 6.283185482025146484375, _109);
    float _779 = _761 * _109;
    float _781 = _731 * _109;
    float _783 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _397);
    float _785 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _765);
    float _787 = _767 * 0.15915493667125701904296875;
    float _789 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].x, _723);
    if (_751)
    {
        float _791 = _739 * _755;
        _127 = _791;
    }
    float _793 = _127;
    float _795 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    float _797 = in.m_56.x;
    float _799 = in.m_56.y;
    float _801 = in.m_56.z;
    int _803 = abs(_603);
    int _805 = _493 ? 0 : 1;
    float _807 = _787 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = float(_803);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = float(_699);
    float _819 = _777 * 1.57079637050628662109375;
    int _821 = ~_805;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = _825;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_481)
    {
        int _831 = ~_805;
        int _833 = _831 + 1;
        _827 = _833;
    }
    int _835 = _827;
    float _837 = _819 * 0.15915493667125701904296875;
    float _839 = _811 * _817;
    float _841 = -_511;
    float _843 = _841 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _845 = !_533;
    int _847 = _845 ? 0 : 1;
    float _849 = -_513;
    float _851 = _849 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _853 = _635 ? 0 : 1;
    float _855 = _843 * _843;
    float _857 = _839 * (-2.0);
    int _859 = abs(_847);
    float _861 = _505 * 6.283185482025146484375;
    float _863 = sin(_861);
    int _865 = ~_853;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = fma(_851, _851, _855);
    int _873 = _869;
    if (!_623)
    {
        int _875 = ~_853;
        int _877 = _875 + 1;
        _873 = _877;
    }
    int _879 = _873;
    float _881 = fma(_857, _797, _797);
    float _883 = _327 + (-0.5);
    float _885 = float(_835);
    float _887 = fma(_453, _857, _453);
    float _889 = float(_859);
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].x, _881);
    bool _893 = !_537;
    int _895 = _893 ? 0 : 1;
    float _897 = -_659;
    float _899 = _897 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _901 = _837 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _889 * _885;
    float _907 = fma(_887, _793, _891);
    int _909 = abs(_895);
    float _911 = fma(_899, _899, _871);
    float _913 = _905 * (-2.0);
    float _915 = _329 + (-0.5);
    float _917 = rsqrt(_911);
    float _919 = fma(_913, _799, _799);
    float _921 = float(_879);
    float _923 = _907 * 0.15915493667125701904296875;
    float _925 = float(_909);
    float _927 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[196].y, _919);
    float _929 = fma(_565, _661, _789);
    float _931 = fma(_569, _661, _795);
    float _933 = fma(_495, _913, _495);
    float _935 = _925 * _921;
    float _937 = fma(_683, _625, _929);
    float _939 = fma(_721, _625, _931);
    float _941 = fma(_933, _793, _927);
    float _943 = _935 * (-2.0);
    float _945 = in.m_52.x;
    float _947 = in.m_52.y;
    float _949 = fma(_685, _621, _937);
    float _951 = _851 * _917;
    float _953 = fma(_943, _801, _801);
    float _955 = _331 + (-0.5);
    float _957 = fma(_499, _943, _499);
    float _959 = _843 * _917;
    float _961 = _899 * _917;
    float _963 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[196].z, _953);
    float _965 = fma(_773, _621, _939);
    float _967 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].x, _949);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _961 * _969;
    float _973 = fma(_957, _793, _963);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _977 = _951 * _975;
    float _979 = _457 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _981 = _941 * 0.15915493667125701904296875;
    float _983 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[147].y, _965);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _987 = -_977;
    float _989 = fma(_961, _985, _987);
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _993 = -_971;
    float _995 = fma(_959, _991, _993);
    float _997 = _809 * _979;
    float _999 = fma(_863, _979, _183);
    float _1001 = fma(_903, _979, _193);
    float _1003 = _989 * _989;
    float _1005 = _923 * 6.283185482025146484375;
    float _1007 = sin(_1005);
    float _1009 = _967 * _945;
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1013 = _959 * _1011;
    float _1015 = _973 * 0.15915493667125701904296875;
    float _1017 = fma(_995, _995, _1003);
    float _1019 = _983 * _947;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1023 = -_1013;
    float _1025 = fma(_951, _1021, _1023);
    float _1027 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _999);
    float _1029 = _923 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1035 = fma(_1025, _1025, _1017);
    float _1037 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1039 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _997);
    if (_815)
    {
        _829 = 1.0;
    }
    float _1043 = _829;
    float _1045 = _1037 * _1027;
    float _1047 = _981 * 6.283185482025146484375;
    float _1049 = sin(_1047);
    float _1051 = _1039 * _1033;
    float _1053 = _1043;
    if (!_815)
    {
        _1053 = 7.345489978790283203125;
    }
    float _1055 = _1053;
    bool _1057 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1059 = isnan(0.5);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1065 = _1061 || _1063;
    float _1067 = _981 * 6.283185482025146484375;
    float _1069 = cos(_1067);
    float _1071 = _1015 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _1031 * _1049;
    float _1077 = _1015 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    float _1081 = _1007 * _1069;
    float _1083 = _1031 * _1069;
    float _1085 = rsqrt(_1035);
    float _1087 = -_1075;
    float _1089 = fma(_1073, _1081, _1087);
    float _1091 = -_1081;
    float _1093 = fma(_1073, _1075, _1091);
    float _1095 = _1007 * _1049;
    float _1097 = _1049 * _1079;
    float _1099 = _1079 * _1051;
    float _1101 = _1069 * _1079;
    float _1103 = -_1051;
    float _1105 = _1073 * _1103;
    float _1107 = fma(_1073, _1083, _1095);
    float _1109 = fma(_1073, _1095, _1083);
    float _1111 = _1031 * _1099;
    float _1113 = fma(_1101, _1045, _1105);
    float _1115 = _995 * _1085;
    float _1117 = _989 * _1085;
    float _1119 = fma(_1107, _1045, _1111);
    float _1121 = _1007 * _1099;
    float _1123 = _959 * _1115;
    float _1125 = _1025 * _1085;
    float _1127 = fma(_1093, _1041, _1119);
    float _1129 = _961 * _1117;
    float _1131 = -_1123;
    float _1133 = fma(_951, _1117, _1131);
    float _1135 = fma(_1089, _1045, _1121);
    float _1137 = fma(_1097, _1041, _1113);
    float _1139 = -_1129;
    float _1141 = fma(_959, _1125, _1139);
    float _1143 = _1133 * _1127;
    float _1145 = fma(_1109, _1041, _1135);
    float _1147 = _327 * _1055;
    float _1149 = _1141 * _1127;
    float _1151 = fma(_1125, _1137, _1143);
    float _1153 = _951 * _1125;
    float _1155 = fma(_1115, _1137, _1149);
    float _1157 = fma(_961, _1145, _1151);
    float _1159 = -_1153;
    float _1161 = fma(_961, _1115, _1159);
    float _1163 = fma(_951, _1145, _1155);
    float _1165 = _659 + _1157;
    float _1167 = _1161 * _1127;
    float _1169 = _513 + _1163;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1165 + _1171;
    float _1175 = fma(_1117, _1137, _1167);
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1169 + _1177;
    float _1181 = _1173 * _1173;
    float _1183 = fma(_959, _1145, _1175);
    float _1185 = fma(_1179, _1179, _1181);
    float _1187 = _511 + _1183;
    float _1189 = sqrt(_1185);
    bool _1191 = _1189 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1193 = _1161;
    float _1195 = _1181;
    float _1197 = _1169;
    float _1199 = _1113;
    float _1201 = _1185;
    if (!_1191)
    {
        _1193 = _1169;
    }
    float _1203 = _1193;
    float _1205 = _1203;
    if (!_1191)
    {
        _1195 = _1165;
    }
    float _1207 = _1195;
    float _1209 = _1207;
    if (!_1191)
    {
        _1197 = _1187;
    }
    float _1211 = _1197;
    bool _1213 = !_1191;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1189 + _1219;
        float _1223 = rsqrt(_1185);
        float _1225 = _1221 * _1217;
        float _1227 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1225 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = sin(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        float _1239 = fma(_1233, _1227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1241 = _1223 * _1239;
        float _1243 = _1237 + (-1.0);
        float _1245 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = fma(_1179, _1241, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1249 = fma(_1173, _1241, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1251 = fma(_1187, _1237, _1245);
        _1205 = _1247;
        _1209 = _1249;
        _1215 = _1251;
    }
    float _1253 = _1205;
    float _1255 = _1209;
    float _1257 = _1215;
    float _1259 = _1257;
    float _1261 = _1253;
    float _1263 = _1255;
    if (!_1065)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _511 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _513 + _1269;
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1275 = -_513;
        float _1277 = _1275 + _1253;
        float _1279 = _1267 * _1267;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _659 + _1281;
        float _1285 = -_659;
        float _1287 = _1285 + _1255;
        float _1289 = fma(_1271, _1271, _1279);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = fma(_1283, _1283, _1289);
        float _1295 = sqrt(_1293);
        float _1297 = _1273 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1299 = precise::min(_1295, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1301 = _1299 * _1291;
        float _1303 = _1297 * _1301;
        float _1305 = -_511;
        float _1307 = _1305 + _1257;
        float _1309 = fma(_1277, _1303, _513);
        float _1311 = fma(_1307, _1303, _511);
        float _1313 = fma(_1287, _1303, _659);
        _1259 = _1311;
        _1261 = _1309;
        _1263 = _1313;
    }
    float _1315 = _1259;
    float _1317 = _1261;
    float _1319 = _1263;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1323 = _1315 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1327 = _1317 + _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1331 = _1319 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1327, _1327, _1333);
    float _1337 = fma(_1331, _1331, _1335);
    float _1339 = rsqrt(_1337);
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1327 * _1341;
    float _1345 = _1331 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1331;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1323;
    if (_1355)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1369;
    }
    float _1371 = _1361;
    if (_1355)
    {
        float _1373 = rsqrt(_1351);
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (_1355)
    {
        float _1377 = _1359 * _1371;
        _1365 = _1377;
    }
    float _1379 = _1365;
    if (_1355)
    {
        float _1381 = _1379 * 0.15915493667125701904296875;
        _1199 = _1381;
    }
    float _1383 = _1199;
    float _1385 = _1333;
    float _1387 = _1383;
    if (_1355)
    {
        float _1389 = _1383 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1385 = _1391;
    }
    float _1393 = _1385;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1339;
    float _1401 = _1395;
    float _1403 = _1397;
    if (_1355)
    {
        float _1405 = _1383 * 6.283185482025146484375;
        float _1407 = cos(_1405);
        _1399 = _1407;
    }
    float _1409 = _1399;
    float _1411 = -_1341;
    float _1413 = -_1397;
    float _1415 = fma(_1323, _1411, _1413);
    if (!_1355)
    {
        _1367 = _1343;
    }
    float _1417 = _1367;
    float _1419 = _1417;
    if (_1355)
    {
        float _1421 = _1415 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1421;
    }
    float _1423 = _1401;
    float _1425 = _1423;
    float _1427 = _1393;
    if (_1355)
    {
        float _1429 = fma(_1393, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1201 = _1429;
    }
    float _1431 = _1201;
    if (!_1355)
    {
        _1425 = _1415;
    }
    float _1433 = _1425;
    float _1435 = _1433;
    float _1437 = _1409;
    if (_1355)
    {
        float _1439 = _1409 + (-1.0);
        _1403 = _1439;
    }
    float _1441 = _1403;
    float _1443 = _1441;
    if (_1355)
    {
        float _1445 = _1375 * _1431;
        _1387 = _1445;
    }
    float _1447 = _1387;
    float _1449 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1451 = sqrt(_1337);
    if (_1355)
    {
        float _1453 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1453;
    }
    float _1455 = _1427;
    float _1457 = _1455;
    if (_1355)
    {
        float _1459 = _1343 * _1447;
        _1419 = _1459;
    }
    float _1461 = _1419;
    if (!_1355)
    {
        _1443 = _1345;
    }
    float _1463 = _1443;
    float _1465 = _1463;
    if (_1355)
    {
        float _1467 = _1345 * _1447;
        _1465 = _1467;
    }
    float _1469 = _1465;
    if (_1355)
    {
        float _1471 = fma(_1415, _1409, _1455);
        _1435 = _1471;
    }
    float _1473 = _1435;
    if (!_1355)
    {
        _1457 = _1347;
    }
    float _1475 = _1457;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    if (!_1355)
    {
        _1437 = _1349;
    }
    float _1483 = _1437;
    float _1485 = _1483;
    if (_1355)
    {
        float _1487 = _1469 * _1469;
        _1485 = _1487;
    }
    float _1489 = _1485;
    float _1491 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = fma(_1473, _1473, _1481);
    float _1495 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1501 = _1493 + _1489;
    float _1503 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1449);
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1507 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1505);
    float _1509 = precise::clamp(_1507, 0.0, 1.0);
    float _1511 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1499);
    float _1513 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1515 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1517 = rsqrt(_1501);
    float _1519 = _1511 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = -_1509;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1527 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1513);
    float _1533 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1525);
    float _1535 = abs(_1523);
    float _1537 = log2(_1535);
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1541 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1543 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1545 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1539);
    float _1551 = _1517 * _1461;
    float _1553 = _1517 * _1473;
    float _1555 = _1517 * _1469;
    float _1557 = -_1547;
    float _1559 = fma(_1557, _1543, 1.0);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1563 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1567 = -_1561;
    float _1569 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1573 = log2(_1559);
    float _1575 = -_1555;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1579 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1581 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1565);
    float _1583 = _1553 + 1.0;
    float _1585 = fma(_1577, -0.5, 0.5);
    float _1587 = fma(_1577, 0.5, 0.5);
    float _1589 = exp2(_1571);
    float _1591 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1579);
    float _1593 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1581);
    float _1595 = fma(_1587, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1597 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1591);
    float _1599 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1593);
    float _1601 = fma(_1587, _1595, -0.212114393711090087890625);
    float _1603 = sqrt(_1585);
    float _1605 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1597);
    float _1607 = _1573 * 0.693147182464599609375;
    float _1609 = fma(_1587, _1601, 1.570728778839111328125);
    float _1611 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1613 = 1.0 / _1563;
    float _1615 = -_1553;
    float _1617 = fma(_1589, _1583, _1615);
    float _1619 = _1603 * 0.636619746685028076171875;
    float _1621 = -_1609;
    float _1623 = fma(_1619, _1621, 1.0);
    float _1625 = fma(_1617, 0.5, 0.5);
    float _1627 = _1599 * _1613;
    float _1629 = _1605 * _1613;
    float _1631 = fma(_1627, 0.5, 0.5);
    float _1633 = fma(_1629, -0.5, 0.5);
    float3 _4947 = float3(_1631, _1633, _1611);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4947, float3(0.0), isnan(_4947)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4947, float3(0.0), isnan(_4947)), level(0.0)).x;
    float3 _4958 = float3(_1631, _1633, _1611);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4958, float3(0.0), isnan(_4958)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4958, float3(0.0), isnan(_4958)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4975 = float2(_1623, _1625);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4975, float2(0.0), isnan(_4975)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4975, float2(0.0), isnan(_4975)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    float _1658 = float(uint(_703));
    float _1660 = trunc(_781);
    int _1662 = int(_1660);
    int _1664 = ~_703;
    int _1666 = _1664 + 1;
    float _1668 = _779 * _233;
    int _1670 = _703 + (-1);
    float _1672 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1674 = abs(_509);
    float _1676 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1678 = -_785;
    float _1680 = _1678 + 1.0;
    float _1682 = 1.0 / _1658;
    float _1684 = -_775;
    float _1686 = _1684 + 1.0;
    float _1688 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1676);
    float _1690 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    float _1692 = floor(_1147);
    float _1694 = float(uint(_1662));
    int _1696 = as_type<int>(_1682) + (-2);
    float _1698 = trunc(_1668);
    int _1700 = int(_1698);
    float _1702 = float(_1662);
    float _1704 = as_type<float>(_1696) * _1694;
    float _1706 = trunc(_1704);
    float _1708 = precise::max(_1706, 0.0);
    uint _1711 = uint(_1708);
    float _1713 = exp2(_1672);
    int _1715 = _1666 * int(_1711);
    int _1717 = _1715 + _1662;
    float _1719 = float(uint(_1717));
    float _1721 = -_1713;
    float _1723 = _1721 + 1.0;
    float _1725 = as_type<float>(_1696) * _1719;
    int _1727 = ~_703;
    int _1729 = _1727 + 1;
    float _1731 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1733 = trunc(_1725);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    int _1739 = int(_1711) + int(_1737);
    int _1741 = _1729 * _1739;
    int _1743 = _1741 + _1662;
    bool _1745 = _1702 >= _761;
    bool _1747 = isnan(_1702);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan(_761);
    bool _1753 = _1749 || _1751;
    float _1755 = float(_1753);
    float _1757 = -_1692;
    float _1759 = _1147 + _1757;
    bool _1761 = uint(_1743) >= uint(_703);
    float _1763 = _1759 * _761;
    float _1765 = trunc(_1755);
    int _1767 = int(_1765);
    bool _1769 = !_1761;
    int _1771 = _1769 ? 0 : (-1);
    bool _1773 = _703 == 0;
    int _1775 = ~_1739;
    int _1777 = _1775 + _1771;
    int _1779 = _1777 + 1;
    float _1781 = trunc(_1763);
    int _1783 = int(_1781);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1787 = _1785 != 0;
    int _1789 = _703 * _1779;
    int _1791 = _1789 + _1662;
    bool _1793 = !_1787;
    int _1795 = _1793 ? 0 : 1;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1799 = _1797 != 0;
    int _1801 = ~_1767;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    bool _1807 = !_1773;
    int _1809 = _1807 ? _1791 : (-1);
    int _1811 = abs(_1795);
    int _1813 = abs(_503);
    int _1815 = _1809 * _1805;
    int _1817 = abs(_521);
    int _1819 = _1767 * _1670;
    int _1821 = _1819 + _1815;
    bool _1823 = !_1799;
    int _1825 = _1823 ? 0 : 1;
    int _1827 = _1821 * _1813;
    int _1829 = ~_703;
    int _1831 = _1829 + 1;
    int _1833 = _1783 * _1811;
    int _1835 = _1833 + _1662;
    int _1837 = abs(_1825);
    int _1839 = _1700 * _1817;
    int _1841 = _1839 + _1827;
    float _1843 = float(uint(_1835));
    int _1845 = _1835 * _1674;
    int _1847 = _1845 + _1841;
    int _1849 = ~_703;
    int _1851 = _1849 + 1;
    int _1853 = _1783 * _1837;
    int _1855 = _1853 + _1847;
    float _1857 = as_type<float>(_1696) * _1843;
    float _1859 = float(uint(_1855));
    float _1861 = as_type<float>(_1696) * _1859;
    float _1863 = trunc(_1861);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    int _1869 = _1851 * int(_1867);
    int _1871 = _1869 + _1855;
    float _1873 = float(uint(_1871));
    int _1875 = ~_703;
    int _1877 = _1875 + 1;
    float _1879 = as_type<float>(_1696) * _1873;
    float _1881 = trunc(_1879);
    float _1883 = precise::max(_1881, 0.0);
    uint _1885 = uint(_1883);
    int _1887 = int(_1867) + int(_1885);
    int _1889 = ~_703;
    int _1891 = _1889 + 1;
    int _1893 = _1877 * _1887;
    int _1895 = _1893 + _1855;
    float _1897 = trunc(_1857);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    bool _1903 = uint(_1895) >= uint(_703);
    bool _1905 = !_1903;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = ~_1887;
    int _1911 = _1909 + _1907;
    int _1913 = _1911 + 1;
    int _1915 = _703 * _1913;
    int _1917 = _1915 + _1855;
    int _1919 = _1891 * int(_1901);
    int _1921 = _1919 + _1835;
    bool _1923 = !_1773;
    int _1925 = _1923 ? _1917 : (-1);
    float _1927 = float(uint(_1921));
    int _1929 = _1925 >> 31;
    int _1931 = _1925 & 3;
    bool _1933 = _1931 != 0;
    float _1935 = as_type<float>(_1696) * _1927;
    int _1937 = _1929 & 3;
    float _1939 = trunc(_1935);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    int _1945 = _1925 + _1937;
    int _1947 = _1945 >> 2;
    int _1949 = _1947 << 4;
    int _1951 = _1949 + 368;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[int(_1963)][_1965];
    int _1969 = int(_1901) + int(_1943);
    int _1971 = _1925 & 3;
    bool _1973 = _1971 != 0;
    int _1975 = _1933 ? 0 : 1;
    int _1977 = _1951 + 8;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[int(_1989)][_1991];
    int _1995 = _1831 * _1969;
    int _1997 = _1995 + _1835;
    bool _1999 = uint(_1971) > 1u;
    bool _2001 = _1971 != 3;
    bool _2003 = uint(_1997) >= uint(_703);
    bool _2005 = !_2003;
    int _2007 = _2005 ? 0 : (-1);
    bool _2009 = uint(_1971) >= 2u;
    int _2011 = ~_1969;
    int _2013 = _2011 + _2007;
    int _2015 = _2013 + 1;
    int _2017 = ~_1975;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    int _2023 = _2021;
    if (!_1999)
    {
        int _2025 = ~_1975;
        int _2027 = _2025 + 1;
        _2023 = _2027;
    }
    int _2029 = _2023;
    int _2031 = _703 * _2015;
    int _2033 = _2031 + _1835;
    bool _2035 = !_1973;
    int _2037 = _2035 ? 0 : 1;
    int _2039 = abs(_2029);
    int _2041 = _2009 ? 0 : 1;
    bool _2043 = _1971 != 3;
    int _2045 = abs(_2037);
    float _2047 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2049 = int(_2047);
    int _2051 = ~_2041;
    int _2053 = _2051 + 1;
    int _2055 = _2053 + 1;
    int _2057 = _2055;
    if (_2001)
    {
        int _2059 = ~_2041;
        int _2061 = _2059 + 1;
        _2057 = _2061;
    }
    int _2063 = _2057;
    int _2065 = ~_2039;
    int _2067 = _2065 + 1;
    int _2069 = _2067 + 1;
    int _2071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2073 = _2071 != 0;
    bool _2075 = !_2043;
    int _2077 = _2075 ? 0 : (-1);
    int _2079 = _2069 * as_type<int>(_1967);
    int _2081 = abs(_2063);
    int _2083 = ~_2045;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    bool _2089 = !_2073;
    int _2091 = _2089 ? 0 : 1;
    int _2093 = abs(_2077);
    int _2095 = _2087 * as_type<int>(_1959);
    int _2097 = _2095 + _2079;
    int _2099 = abs(_2091);
    int _2101 = ~_2081;
    int _2103 = _2101 + 1;
    int _2105 = _2103 + 1;
    int _2107 = abs(_2049);
    int _2109 = ~_2093;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    int _2115 = _2105 * as_type<int>(_1985);
    int _2117 = _2115 + _2097;
    float _2119 = float(uint(_2049));
    int _2121 = _2113 * as_type<int>(_1993);
    int _2123 = _2121 + _2117;
    float _2125 = float(uint(_2107));
    int _2127 = ~_2099;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    float _2133 = 1.0 / _2119;
    bool _2135 = !_1773;
    int _2137 = _2135 ? _2033 : (-1);
    int _2139 = ~_2107;
    int _2141 = _2139 + 1;
    int _2143 = _2123 * _2131;
    float _2145 = _511 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2147 = ~_2049;
    int _2149 = _2147 + 1;
    float _2151 = _511 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2153 = 1.0 / _2125;
    int _2155 = _2137 * _2099;
    int _2157 = _2155 + _2143;
    float _2159 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2145);
    float _2161 = fma(_513, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2151);
    bool _2163 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2165 = isnan(0.5);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2171 = _2167 || _2169;
    int _2173 = abs(_2157);
    float _2175 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2159);
    int _2177 = as_type<int>(_2133) + (-2);
    float _2179 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2161);
    float _2181 = float(uint(_2173));
    float _2183 = float(uint(_2157));
    float _2185 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2187 = _329 > 0.5;
    int _2189 = as_type<int>(_2153) + (-2);
    float _2191 = as_type<float>(_2177) * _2183;
    int _2193 = ~_2049;
    int _2195 = _2193 + 1;
    int _2197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2199 = _2197 != 0;
    float _2201 = as_type<float>(_2189) * _2181;
    float _2203 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2205 = trunc(_2191);
    float _2207 = precise::max(_2205, 0.0);
    uint _2209 = uint(_2207);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2213 = _2211 != 0;
    float _2215 = _2185 + _2203;
    bool _2217 = _327 > 0.5;
    if (!_2171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2219 = _173;
    float _2221 = trunc(_2201);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2229 = _2149 * int(_2209);
    int _2231 = _2229 + _2157;
    float _2233 = 1.0 / _2203;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2239 = float(uint(_2231));
    float _2241 = _2235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2243 = _2141 * int(_2225);
    int _2245 = _2243 + _2173;
    float _2247 = as_type<float>(_2177) * _2239;
    float _2249 = float(uint(_2245));
    float _2251 = trunc(_2247);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    float _2257 = _2215 * _2233;
    float _2259 = _2257 * 0.5;
    float _2261 = as_type<float>(_2189) * _2249;
    float _2263 = _2219;
    float _2265 = _2259;
    if (!_2171)
    {
        float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2269 = fma(_2259, _2219, _2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = _2271;
    if (!_2171)
    {
        _2265 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2275 = _2265;
    float _2277 = trunc(_2261);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    int _2283 = int(_2209) + int(_2255);
    if (!_2171)
    {
        float _2285 = 1.0 / _2271;
        _2273 = _2285;
    }
    float _2287 = _2273;
    int _2289 = int(_2225) + int(_2281);
    float _2291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2293 = ~_2107;
    int _2295 = _2293 + 1;
    int _2297 = _2195 * _2283;
    int _2299 = _2297 + _2157;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2303 = _2295 * _2289;
    int _2305 = _2303 + _2173;
    bool _2307 = uint(_2299) >= uint(_2049);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2311 = as_type<float>(_2299);
    if (!_2171)
    {
        float _2313 = -_2275;
        float _2315 = _2313 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2311 = _2315;
    }
    float _2317 = _2311;
    float _2319 = -_183;
    int _2321 = _2217 ? as_type<int>(_2319) : as_type<int>(_183);
    bool _2323 = !_2307;
    int _2325 = _2323 ? 0 : (-1);
    out.m_58.x = _2237;
    out.m_58.y = _2309;
    out.m_58.z = _2241;
    bool _2327 = uint(_2305) >= uint(_2107);
    float _2329 = _2317;
    if (!_2171)
    {
        float _2331 = 1.0 / _2317;
        _2329 = _2331;
    }
    float _2333 = _2329;
    int _2335 = ~_2283;
    int _2337 = _2335 + _2325;
    int _2339 = _2337 + 1;
    float _2341 = _2291 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2343 = _2157 ^ _2049;
    bool _2345 = !_2199;
    float _2347 = _2345 ? _183 : as_type<float>(_2321);
    int _2349 = _2049 * _2339;
    int _2351 = _2349 + _2157;
    uint _2353 = uint(int(uint(_2343) >> uint(31)));
    bool _2355 = _2049 == 0;
    float _2357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2359 = !_2327;
    float _2361 = _2359 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2363 = _2347 + 0.5;
    float _2365 = -_193;
    int _2367 = _2187 ? as_type<int>(_2365) : as_type<int>(_193);
    bool _2369 = _2049 == 0;
    int _2371 = ~as_type<int>(_2361);
    int _2373 = _2289 + _2371;
    int _2375 = _2373 + 1;
    float _2377 = _2361;
    if (!_2171)
    {
        float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2381 = -_2275;
        float _2383 = fma(_2287, _2379, _2381);
        _2377 = _2383;
    }
    float _2385 = _2377;
    int _2387 = ~int(_2353);
    int _2389 = _2387 + 1;
    bool _2391 = !_2213;
    float _2393 = _2391 ? _193 : as_type<float>(_2367);
    bool _2395 = !_2355;
    int _2397 = _2395 ? _2351 : (-1);
    int _2399 = _2375 ^ _2389;
    float _2401 = float(_2397);
    int _2403 = ~_2389;
    int _2405 = _2403 + _2399;
    int _2407 = _2405 + 1;
    float _2409 = as_type<float>(_2399);
    if (!_2171)
    {
        float _2411 = _2385 * _2333;
        float _2413 = precise::clamp(_2411, 0.0, 1.0);
        _2409 = _2413;
    }
    float _2415 = _2409;
    float _2417 = _2357 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2419 = fma(_2341, _2401, _771);
    bool _2421 = !_2369;
    float _2423 = _2421 ? as_type<float>(_2407) : as_type<float>(0xffffffffu /* nan */);
    float _2425 = fma(_2341, _2363, _2419);
    float _2427 = float(as_type<int>(_2423));
    float _2429 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1690);
    float _2431 = _2423;
    if (_2171)
    {
        _2431 = 1.0;
    }
    float _2433 = _2431;
    float _2435 = _2433;
    if (!_2171)
    {
        float _2437 = -_2415;
        float _2439 = _2437 + 1.0;
        _2435 = _2439;
    }
    float _2441 = _2435;
    float _2443 = -_1686;
    float _2445 = fma(_2347, _2443, _2425);
    float _2447 = -_783;
    float _2449 = fma(_2417, _2427, _2447);
    float _2451 = _2393 + (-0.5);
    float _2453 = _2441 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2455 = _2441 > 0.0;
    bool _2457 = isnan(_2441);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    out.gl_Position.x = _1599;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _2429;
    out.gl_Position.w = _1563;
    float _2465 = -_2417;
    float _2467 = fma(_2465, _2451, _2449);
    float _2469 = _2429 + _1563;
    float _2471 = _2453 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2473 = fma(_2393, _1680, _2467);
    float _2475 = _1731 * _1635;
    float _2477 = _2469 * 0.5;
    float _2479 = -_1731;
    float _2481 = _2479 + 1.0;
    out.m_45.x = _2471;
    float _2483 = _1646 * _2475;
    float _2485 = _1656 * _2475;
    float _2487 = _1646 * _2481;
    out.m_60.z = _2477;
    out.m_60.w = _1563;
    float _2489 = fma(_1652, _2483, _1640);
    float _2491 = fma(_1654, _2483, _1642);
    float _2493 = fma(_1646, _2485, _1644);
    out.m_62.x = _2445;
    out.m_62.y = _2473;
    out.m_64.x = _2489;
    out.m_64.y = _2491;
    out.m_64.z = _2493;
    out.m_64.w = _2487;
    if (_2463)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2495 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2495;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

