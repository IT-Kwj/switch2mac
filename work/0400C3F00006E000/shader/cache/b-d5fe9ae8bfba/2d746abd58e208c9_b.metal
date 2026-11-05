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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _675 = false;
    bool _495 = false;
    bool _387 = false;
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
        float _1887 = as_type<float>(_101);
        out.gl_Position.z = _1887;
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
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1956 = as_type<float>(_139);
        out.gl_Position.z = _1956;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _145 * _143;
    float _169 = 0.0;
    float _171 = _149;
    if (!_159)
    {
        float _173 = _149 * _149;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _181 = _177;
    if (!_159)
    {
        float _183 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = _179 * 6.283185482025146484375;
    float _189 = floor(_179);
    int _191 = as_type<int>(_147) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_147) & 2;
    bool _197 = _195 != 0;
    float _199 = _187 * 0.15915493667125701904296875;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    float _205 = _199 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_197;
    int _211 = _209 ? (-1090519040) : 1056964608;
    float _213 = -_189;
    float _215 = _179 + _213;
    bool _217 = !_193;
    int _219 = _217 ? (-1090519040) : 1056964608;
    bool _221 = !_159;
    float _223 = _185;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _149 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _149);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_159;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _149 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _171 = _277;
    }
    float _279 = _171;
    float _281 = in.m_54.w;
    bool _283 = _215 < 0.5;
    float _285 = float(_283);
    float _287 = in.m_42.x;
    float _289 = in.m_42.y;
    float _291 = in.m_42.z;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _299 = _297 != 0;
    float _301 = -_215;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_207, 0.5, 0.5);
    float _307 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = -_285;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _313 = !_295;
    int _315 = _313 ? 0 : 1;
    float _317 = -_305;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_56.x = as_type<float>(_219);
    out.m_56.y = as_type<float>(_211);
    float _321 = fma(_279, _161, _307);
    bool _323 = !_203;
    int _325 = _323 ? 0 : 1;
    float _327 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_299;
    int _331 = _329 ? 0 : 1;
    float _333 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_315);
    float _337 = fma(_279, _163, _327);
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_279, _165, _333);
    int _343 = abs(_325);
    int _345 = abs(_331);
    float _347 = float(_335);
    float _349 = float(_343);
    float _351 = fma(_337, _281, _289);
    float _353 = abs(_303);
    float _355 = _347 * _353;
    float _357 = fma(_321, _281, _287);
    float _359 = fma(_341, _281, _291);
    float _361 = float(_345);
    float _363 = fma(_349, _319, _355);
    float _365 = abs(_311);
    float _367 = fma(_361, _365, _363);
    bool _369 = !_339;
    float _385;
    if (!_369)
    {
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _373 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_85);
        float _391 = 1.0 / _389;
        float _393 = _119 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _395 + _397;
    float _401 = in.m_54.x;
    float _403 = in.m_54.y;
    bool _405 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = 1.0 / _419;
    float _425 = -_415;
    float _427 = _425 + 1.0;
    float _429 = _399 * _423;
    bool _431 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _433 = isnan(_395);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _441 * _427;
    float _453 = fma(_445, _429, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _455 = fma(_449, _429, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _457 = -_441;
    float _459 = _457 + 1.0;
    float _461 = _453 * _451;
    float _463 = _455 * _451;
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _467 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _469 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].x, _465);
    float _471 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].y, _467);
    float _473 = _469 * _401;
    float _475 = _471 * _403;
    bool _477 = !_421;
    float _493;
    if (!_477)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _481 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_85);
        float _499 = 1.0 / _497;
        float _501 = _119 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = _503 + _505;
    bool _509 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _511 = isnan(_503);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _523 = _503 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _527;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _541 = 1.0 / _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _543;
    float _547 = _507 * _537;
    bool _549 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _551 = isnan(_503);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _561;
    bool _565 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _567 = isnan(_503);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_545, _547, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _579 = fma(_563, _547, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _581 = _575 * _535;
    float _583 = -_575;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = _523 * _541;
    float _593 = _559 * _585;
    float _595 = fma(_589, _547, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _597 = -_559;
    float _599 = _597 + 1.0;
    float _601 = _577 * _593;
    float _603 = _595 * _593;
    float _605 = _579 * _593;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _619 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].x, _603);
    float _621 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].y, _601);
    float _623 = fma(_609, _591, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _625 = fma(_613, _591, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _627 = fma(_617, _591, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _629 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].z, _605);
    float _631 = fma(_623, _581, _619);
    float _633 = fma(_625, _581, _621);
    float _635 = fma(_627, _581, _629);
    float _637 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].x, _631);
    float _639 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].y, _633);
    float _641 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].z, _635);
    float _643 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _651;
    out.m_58.y = _653;
    out.m_58.z = _655;
    out.m_58.w = _647;
    bool _657 = !_539;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _661 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_85);
        float _679 = 1.0 / _677;
        float _681 = _119 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = in.m_49.z;
    float _687 = _141 * 2.0;
    float _689 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _691 = log2(_689);
    float _693 = in.m_49.y;
    float _695 = _367 * _473;
    float _697 = _367 * _475;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_219));
    float _701 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _703 = floor(_687);
    float _705 = _697 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _707 = _691 * _119;
    float _709 = exp2(_707);
    float _711 = _685 * 2.0;
    bool _713 = _703 > 0.0;
    bool _715 = _703 >= 0.0;
    bool _717 = isnan(_703);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = _693 + _685;
    float _727 = floor(_711);
    float _729 = _693 * 2.0;
    int _731 = _723 ? 0 : 1;
    float _733 = _725 + (-1.0);
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _737 = _735 != 0;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _745 = _743 != 0;
    int _747 = ~_731;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    int _759 = _751;
    if (!_713)
    {
        int _761 = ~_731;
        int _763 = _761 + 1;
        _759 = _763;
    }
    int _765 = _759;
    float _767 = floor(_729);
    bool _769 = !_741;
    int _771 = _769 ? 0 : 1;
    float _773 = -_709;
    float _775 = _773 + 1.0;
    bool _777 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(1.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    int _787 = abs(_771);
    bool _789 = _727 > 0.0;
    float _791 = 1.0 / _757;
    bool _793 = _727 >= 0.0;
    bool _795 = isnan(_727);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = in.m_60.x;
    float _805 = in.m_60.y;
    float _807 = in.m_60.z;
    float _809 = float(_765);
    bool _811 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _819 = _815 || _817;
    int _821 = _801 ? 0 : 1;
    float _823 = float(_787);
    float _825 = _819 ? _775 : 0.0;
    bool _827 = !_737;
    int _829 = _827 ? 0 : 1;
    float _831 = _823 * _809;
    bool _833 = _767 > 0.0;
    if (_785)
    {
        float _835 = _825 * _791;
        _123 = _835;
    }
    float _837 = _123;
    bool _839 = _767 >= 0.0;
    bool _841 = isnan(_767);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = _831 * (-2.0);
    int _851 = ~_821;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = _693 + (-0.5);
    int _859 = _855;
    if (!_789)
    {
        int _861 = ~_821;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = fma(_753, _849, _753);
    int _869 = abs(_829);
    bool _871 = !_745;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_849, _805, _805);
    int _877 = _847 ? 0 : 1;
    float _879 = float(_869);
    float _881 = float(_865);
    int _883 = abs(_873);
    float _885 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[196].y, _875);
    int _887 = ~_877;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _141 + _693;
    int _895 = _891;
    if (!_833)
    {
        int _897 = ~_877;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _879 * _881;
    float _905 = fma(_867, _837, _885);
    float _907 = _893 + (-1.0);
    float _909 = float(_883);
    float _911 = _903 * (-2.0);
    float _913 = float(_901);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _917 = _141 + (-0.5);
    float _919 = fma(_911, _803, _803);
    float _921 = _141 + _685;
    float _923 = _909 * _913;
    float _925 = fma(_915, _911, _915);
    float _927 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[196].x, _919);
    float _929 = _921 + (-1.0);
    float _931 = _923 * (-2.0);
    float _933 = fma(_925, _837, _927);
    float _935 = _685 + (-0.5);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _939 = fma(_931, _807, _807);
    float _941 = _905 * 0.15915493667125701904296875;
    float _943 = _933 * 0.15915493667125701904296875;
    float _945 = fma(_937, _931, _937);
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _949 = _941 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_211));
    float _955 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _957 = fma(_945, _837, _947);
    float _959 = _701 * _699;
    float _961 = _705 * _953;
    float _963 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _955);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = _941 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _973 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _975 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _963);
    bool _977 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _985 = _981 || _983;
    float _987 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _971);
    float _989 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _973);
    float _991 = _965 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _987);
    float _997 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _989);
    float _999 = _995 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1001 = _943 * 6.283185482025146484375;
    float _1003 = sin(_1001);
    float _1005 = _943 * 6.283185482025146484375;
    float _1007 = cos(_1005);
    float _1009 = _993 * _961;
    float _1011 = _965 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _1003 * _951;
    float _1017 = _1003 * _969;
    float _1019 = _1003 * _1009;
    float _1021 = _997 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1023 = _1007 * _951;
    float _1025 = _1007 * _969;
    float _1027 = _951 * _993;
    float _1029 = _969 * _993;
    float _1031 = _1007 * _1009;
    float _1033 = fma(_1013, _1025, _1015);
    float _1035 = -_1023;
    float _1037 = fma(_1013, _1017, _1035);
    float _1039 = -_1017;
    float _1041 = fma(_1013, _1023, _1039);
    float _1043 = -_961;
    float _1045 = _1013 * _1043;
    float _1047 = fma(_1033, _959, _1031);
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_1013, _1015, _1025);
    float _1053 = fma(_1029, _959, _1045);
    float _1055 = fma(_1037, _959, _1019);
    float _1057 = fma(_1041, _1049, _1047);
    float _1059 = _975 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1061 = fma(_1027, _1049, _1053);
    float _1063 = fma(_1051, _1049, _1055);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = _999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1071 = _999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1073 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1075 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1069);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1073);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1083 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1077);
    float _1085 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1091 = _1021 + _1085;
    float _1093 = _1059 + _1087;
    float _1095 = 1.0 / _1089;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1093 + _1101;
    float _1105 = _1099 * _1099;
    float _1107 = fma(_1103, _1103, _1105);
    float _1109 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1071);
    float _1111 = sqrt(_1107);
    float _1113 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1109);
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1117 = _1115 + _1089;
    float _1119 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1121 = _1117 * _1095;
    float _1123 = _1121 * 0.5;
    float _1125 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1119);
    float _1127 = _1095;
    float _1129 = _1123;
    float _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1133 = _1107;
    float _1135 = _1061;
    float _1137 = _1027;
    if (_985)
    {
        _1127 = 1.0;
    }
    float _1139 = _1127;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
    bool _1145 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    float _1149 = 1.0 / _1143;
    float _1151 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1153 = _999 + _1151;
    float _1155 = _1151;
    float _1157 = _1139;
    if (!_1145)
    {
        _1129 = _1093;
    }
    float _1159 = _1129;
    float _1161 = _1159;
    if (!_1145)
    {
        _1155 = _1091;
    }
    float _1163 = _1155;
    float _1165 = _1163;
    if (!_1145)
    {
        _1131 = _1153;
    }
    float _1167 = _1131;
    bool _1169 = !_1145;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1111 + _1175;
        float _1179 = rsqrt(_1107);
        float _1181 = _1177 * _1173;
        float _1183 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1185 = _1181 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = _1189 + (-1.0);
        float _1197 = fma(_1193, _1183, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1199 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1201 = _1179 * _1197;
        float _1203 = fma(_1153, _1189, _1199);
        float _1205 = fma(_1103, _1201, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1207 = fma(_1099, _1201, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1171 = _1203;
        _1161 = _1205;
        _1165 = _1207;
    }
    float _1209 = _1171;
    float _1211 = _1161;
    float _1213 = _1165;
    if (_985)
    {
        _1133 = 1.0;
    }
    float _1215 = _1133;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1219 = _1149 * _1217;
    float _1221 = _1215;
    float _1223 = _1219;
    if (!_985)
    {
        float _1225 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1227 = _1225 * 0.15915493667125701904296875;
        float _1229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = _1227 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 0.15915493667125701904296875;
        float _1237 = _1227 * 6.283185482025146484375;
        float _1239 = sin(_1237);
        float _1241 = 1.0 / _1233;
        float _1243 = _1235 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1239 * _1241;
        float _1249 = _1235 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = 1.0 / _1253;
        float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1259 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1257;
        float _1261 = 1.0 / _1259;
        float _1263 = _1251 * _1255;
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = fma(_1219, _1263, _1265);
        float _1269 = _1267 * _1261;
        float _1271 = precise::clamp(_1269, 0.0, 1.0);
        _1135 = _1235;
        _1157 = _1271;
    }
    float _1273 = _1135;
    float _1275 = _1157;
    float _1277 = _1273;
    if (!_985)
    {
        float _1279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1281 = _1279 * 0.15915493667125701904296875;
        float _1283 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1285 = _1281 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = _1283 * 0.15915493667125701904296875;
        float _1291 = _1281 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = 1.0 / _1287;
        float _1297 = _1289 * 6.283185482025146484375;
        float _1299 = cos(_1297);
        float _1301 = _1293 * _1295;
        float _1303 = _1289 * 6.283185482025146484375;
        float _1305 = sin(_1303);
        float _1307 = _1299 * _1301;
        float _1309 = 1.0 / _1307;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1313 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1311;
        float _1315 = 1.0 / _1313;
        float _1317 = _1305 * _1309;
        float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1321 = fma(_1219, _1317, _1319);
        float _1323 = _1321 * _1315;
        float _1325 = precise::clamp(_1323, 0.0, 1.0);
        float _1327 = -_1325;
        float _1329 = _1327 + 1.0;
        _1277 = _1295;
        _1221 = _1329;
    }
    float _1331 = _1277;
    float _1333 = _1221;
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1337 = _1209 + _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1341 = _1211 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1345 = _1213 + _1343;
    float _1347 = _1337 * _1337;
    float _1349 = fma(_1341, _1341, _1347);
    float _1351 = fma(_1345, _1345, _1349);
    float _1353 = rsqrt(_1351);
    float _1355 = sqrt(_1351);
    float _1357 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1359 = _1341 * _1357;
    float _1361 = _1345 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 * _1361;
    float _1367 = _1363 + _1365;
    float _1369 = sqrt(_1367);
    bool _1371 = _1369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1369 + _1373;
    float _1377 = _1345;
    float _1379 = _1347;
    float _1381 = _1375;
    float _1383 = _1357;
    if (_1371)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1385;
    }
    float _1387 = _1377;
    if (_1371)
    {
        float _1389 = rsqrt(_1367);
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (_1371)
    {
        float _1395 = _1375 * _1387;
        _1381 = _1395;
    }
    float _1397 = _1381;
    if (_1371)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1223 = _1399;
    }
    float _1401 = _1223;
    float _1403 = _1353;
    float _1405 = _1401;
    if (_1371)
    {
        float _1407 = _1401 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1415 = precise::max(0.0, _1413);
    float _1417 = _1331;
    float _1419 = _1415;
    float _1421 = _1413;
    if (_1371)
    {
        float _1423 = _1401 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        _1417 = _1425;
    }
    float _1427 = _1417;
    float _1429 = -_1357;
    float _1431 = -_1415;
    float _1433 = fma(_1337, _1429, _1431);
    if (_1371)
    {
        float _1435 = _1433 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1419 = _1435;
    }
    float _1437 = _1419;
    float _1439 = _1437;
    if (!_1371)
    {
        _1405 = _1363;
    }
    float _1441 = _1405;
    float _1443 = _1411;
    float _1445 = _1441;
    if (_1371)
    {
        float _1447 = fma(_1411, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1443 = _1447;
    }
    float _1449 = _1443;
    float _1451 = _1449;
    if (!_1371)
    {
        _1439 = _1361;
    }
    float _1453 = _1439;
    float _1455 = _1453;
    if (_1371)
    {
        float _1457 = _1427 + (-1.0);
        _1421 = _1457;
    }
    float _1459 = _1421;
    float _1461 = _1459;
    if (_1371)
    {
        float _1463 = _1391 * _1449;
        _1137 = _1463;
    }
    float _1465 = _1137;
    if (!_1371)
    {
        _1393 = _1359;
    }
    float _1467 = _1393;
    float _1469 = _1467;
    if (_1371)
    {
        float _1471 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1471;
    }
    float _1473 = _1383;
    if (_1371)
    {
        float _1475 = _1359 * _1465;
        _1469 = _1475;
    }
    float _1477 = _1469;
    if (!_1371)
    {
        _1451 = _1433;
    }
    float _1479 = _1451;
    float _1481 = _1479;
    if (_1371)
    {
        float _1483 = _1361 * _1465;
        _1455 = _1483;
    }
    float _1485 = _1455;
    if (_1371)
    {
        float _1487 = fma(_1433, _1427, _1473);
        _1481 = _1487;
    }
    float _1489 = _1481;
    if (_1371)
    {
        float _1491 = _1477 * _1477;
        _1445 = _1491;
    }
    float _1493 = _1445;
    if (!_1371)
    {
        _1461 = _1365;
    }
    float _1495 = _1461;
    float _1497 = _1495;
    if (_1371)
    {
        float _1499 = _1485 * _1485;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1505 = fma(_1489, _1489, _1493);
    float _1507 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1503);
    float _1509 = _1505 + _1501;
    float _1511 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1515 = fma(_1355, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1513);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1521 = rsqrt(_1509);
    float _1523 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1525 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1511);
    float _1529 = -_1517;
    float _1531 = _1529 + 1.0;
    float _1533 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1535 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1537 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1539 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1527);
    float _1541 = abs(_1531);
    float _1543 = log2(_1541);
    float _1545 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1547 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1535);
    float _1549 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1537);
    float _1551 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1553 = -_1545;
    float _1555 = fma(_1553, _1519, 1.0);
    float _1557 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1547);
    float _1559 = _1521 * _1477;
    float _1561 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1563 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1565 = _1521 * _1489;
    float _1567 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1569 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1571 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1563);
    float _1573 = _1521 * _1485;
    float _1575 = -_1567;
    float _1577 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1575);
    float _1579 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1581 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1571);
    float _1583 = log2(_1555);
    float _1585 = -_1573;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1577);
    float _1589 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1581);
    float _1593 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1595 = fma(_1587, -0.5, 0.5);
    float _1597 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1589);
    float _1599 = exp2(_1579);
    float _1601 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1593);
    float _1603 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1597);
    float _1605 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1601);
    float _1607 = 1.0 / _1591;
    float _1609 = fma(_1587, 0.5, 0.5);
    float _1611 = _1565 + 1.0;
    float _1613 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1605);
    float _1615 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1603);
    float _1617 = fma(_1609, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1619 = _1583 * 0.693147182464599609375;
    float _1621 = sqrt(_1595);
    float _1623 = fma(_1609, _1617, -0.212114393711090087890625);
    float _1625 = -_1565;
    float _1627 = fma(_1599, _1611, _1625);
    float _1629 = fma(_1609, _1623, 1.570728778839111328125);
    float _1631 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1633 = fma(_1627, 0.5, 0.5);
    float _1635 = _1613 * _1607;
    float _1637 = _1615 * _1607;
    float _1639 = fma(_1635, 0.5, 0.5);
    float _1641 = fma(_1637, -0.5, 0.5);
    float _1643 = _1621 * 0.636619746685028076171875;
    float _1645 = -_1629;
    float _1647 = fma(_1643, _1645, 1.0);
    float3 _4284 = float3(_1639, _1641, _1631);
    float _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4284, float3(0.0), isnan(_4284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4284, float3(0.0), isnan(_4284)), level(0.0)).x;
    float3 _4295 = float3(_1639, _1641, _1631);
    float4 _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4295, float3(0.0), isnan(_4295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4295, float3(0.0), isnan(_4295)), level(0.0)).xyzw;
    float _1654 = _1652.x;
    float _1656 = _1652.y;
    float _1658 = _1652.z;
    float _1660 = _1652.w;
    float2 _4312 = float2(_1647, _1633);
    float3 _1664 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4312, float2(0.0), isnan(_4312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4312, float2(0.0), isnan(_4312)), level(0.0)).xyz;
    float _1666 = _1664.x;
    float _1668 = _1664.y;
    float _1670 = _1664.z;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1674 = _683 + _1672;
    bool _1676 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1678 = isnan(_683);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1690;
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    bool _1698 = _1275 > 0.0;
    bool _1700 = isnan(_1275);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(0.0);
    bool _1706 = _1702 || _1704;
    float _1708 = 1.0 / _1692;
    bool _1710 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1712 = isnan(_683);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    bool _1722 = _1333 <= 0.0;
    bool _1724 = !_1706;
    bool _1726 = _1722 || _1724;
    float _1728 = _1720 * _1696;
    float _1730 = -_1720;
    float _1732 = _1730 + 1.0;
    float _1734 = _1674 * _1708;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1744;
    float _1748 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1750 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1752 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1754 = _1748 * _1728;
    float _1756 = _1750 * _1728;
    float _1758 = _1752 * _1728;
    float _1760 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1688);
    float _1762 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1756);
    float _1764 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1758);
    float _1766 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1754);
    float _1768 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1770 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1762);
    float _1772 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1760);
    float _1774 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1764);
    float _1776 = _1770 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = exp2(_1768);
    float _1780 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1772);
    float _1782 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1766);
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1788 = _1780 + _1591;
    float _1790 = _1275 * _1333;
    float _1792 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1794 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1796 = _1790 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1796 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1804 = -_1778;
    float _1806 = _1804 + 1.0;
    float _1808 = _1788 * 0.5;
    out.m_62.x = _1784;
    out.m_62.y = _1798;
    out.m_62.z = _1800;
    out.m_62.w = _1786;
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _1802;
    float _1812 = -_1810;
    float _1814 = _1812 + 1.0;
    out.gl_Position.x = _1613;
    out.gl_Position.y = _1615;
    out.gl_Position.z = _1780;
    out.gl_Position.w = _1591;
    out.m_64.z = _1808;
    out.m_64.w = _1591;
    float _1816 = _1810 * _1649;
    float _1818 = _1660 * _1814;
    float _1820 = _1660 * _1816;
    float _1822 = _1670 * _1816;
    float _1824 = fma(_1666, _1820, _1654);
    float _1826 = fma(_1668, _1820, _1656);
    float _1828 = fma(_1660, _1822, _1658);
    out.m_66.x = _1824;
    out.m_66.y = _1826;
    out.m_66.z = _1828;
    out.m_66.w = _1818;
    if (!_1726)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1830 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1830;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _675 = false;
    bool _495 = false;
    bool _387 = false;
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
        float _1887 = as_type<float>(_101);
        out.gl_Position.z = _1887;
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
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1956 = as_type<float>(_139);
        out.gl_Position.z = _1956;
    }
    if (_133)
    {
        return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _145 * _143;
    float _169 = 0.0;
    float _171 = _149;
    if (!_159)
    {
        float _173 = _149 * _149;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _181 = _177;
    if (!_159)
    {
        float _183 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = _179 * 6.283185482025146484375;
    float _189 = floor(_179);
    int _191 = as_type<int>(_147) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_147) & 2;
    bool _197 = _195 != 0;
    float _199 = _187 * 0.15915493667125701904296875;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    float _205 = _199 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_197;
    int _211 = _209 ? (-1090519040) : 1056964608;
    float _213 = -_189;
    float _215 = _179 + _213;
    bool _217 = !_193;
    int _219 = _217 ? (-1090519040) : 1056964608;
    bool _221 = !_159;
    float _223 = _185;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _149 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _149);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_159;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _149 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _171 = _277;
    }
    float _279 = _171;
    float _281 = in.m_54.w;
    bool _283 = _215 < 0.5;
    float _285 = float(_283);
    float _287 = in.m_42.x;
    float _289 = in.m_42.y;
    float _291 = in.m_42.z;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _299 = _297 != 0;
    float _301 = -_215;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_207, 0.5, 0.5);
    float _307 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = -_285;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _313 = !_295;
    int _315 = _313 ? 0 : 1;
    float _317 = -_305;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_56.x = as_type<float>(_219);
    out.m_56.y = as_type<float>(_211);
    float _321 = fma(_279, _161, _307);
    bool _323 = !_203;
    int _325 = _323 ? 0 : 1;
    float _327 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_299;
    int _331 = _329 ? 0 : 1;
    float _333 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_315);
    float _337 = fma(_279, _163, _327);
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_279, _165, _333);
    int _343 = abs(_325);
    int _345 = abs(_331);
    float _347 = float(_335);
    float _349 = float(_343);
    float _351 = fma(_337, _281, _289);
    float _353 = abs(_303);
    float _355 = _347 * _353;
    float _357 = fma(_321, _281, _287);
    float _359 = fma(_341, _281, _291);
    float _361 = float(_345);
    float _363 = fma(_349, _319, _355);
    float _365 = abs(_311);
    float _367 = fma(_361, _365, _363);
    bool _369 = !_339;
    float _385;
    if (!_369)
    {
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _373 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_85);
        float _391 = 1.0 / _389;
        float _393 = _119 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _395 + _397;
    float _401 = in.m_54.x;
    float _403 = in.m_54.y;
    bool _405 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = 1.0 / _419;
    float _425 = -_415;
    float _427 = _425 + 1.0;
    float _429 = _399 * _423;
    bool _431 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _433 = isnan(_395);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _441 * _427;
    float _453 = fma(_445, _429, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _455 = fma(_449, _429, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _457 = -_441;
    float _459 = _457 + 1.0;
    float _461 = _453 * _451;
    float _463 = _455 * _451;
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _467 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _469 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].x, _465);
    float _471 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].y, _467);
    float _473 = _469 * _401;
    float _475 = _471 * _403;
    bool _477 = !_421;
    float _493;
    if (!_477)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _481 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_85);
        float _499 = 1.0 / _497;
        float _501 = _119 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = _503 + _505;
    bool _509 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _511 = isnan(_503);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _523 = _503 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _527;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _541 = 1.0 / _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _543;
    float _547 = _507 * _537;
    bool _549 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _551 = isnan(_503);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _561;
    bool _565 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _567 = isnan(_503);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_545, _547, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _579 = fma(_563, _547, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _581 = _575 * _535;
    float _583 = -_575;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = _523 * _541;
    float _593 = _559 * _585;
    float _595 = fma(_589, _547, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _597 = -_559;
    float _599 = _597 + 1.0;
    float _601 = _577 * _593;
    float _603 = _595 * _593;
    float _605 = _579 * _593;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _619 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].x, _603);
    float _621 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].y, _601);
    float _623 = fma(_609, _591, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _625 = fma(_613, _591, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _627 = fma(_617, _591, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _629 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].z, _605);
    float _631 = fma(_623, _581, _619);
    float _633 = fma(_625, _581, _621);
    float _635 = fma(_627, _581, _629);
    float _637 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].x, _631);
    float _639 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].y, _633);
    float _641 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].z, _635);
    float _643 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _651;
    out.m_58.y = _653;
    out.m_58.z = _655;
    out.m_58.w = _647;
    bool _657 = !_539;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _661 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_85);
        float _679 = 1.0 / _677;
        float _681 = _119 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = in.m_49.z;
    float _687 = _141 * 2.0;
    float _689 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _691 = log2(_689);
    float _693 = in.m_49.y;
    float _695 = _367 * _473;
    float _697 = _367 * _475;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_219));
    float _701 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _703 = floor(_687);
    float _705 = _697 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _707 = _691 * _119;
    float _709 = exp2(_707);
    float _711 = _685 * 2.0;
    bool _713 = _703 > 0.0;
    bool _715 = _703 >= 0.0;
    bool _717 = isnan(_703);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = _693 + _685;
    float _727 = floor(_711);
    float _729 = _693 * 2.0;
    int _731 = _723 ? 0 : 1;
    float _733 = _725 + (-1.0);
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _737 = _735 != 0;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _745 = _743 != 0;
    int _747 = ~_731;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    int _759 = _751;
    if (!_713)
    {
        int _761 = ~_731;
        int _763 = _761 + 1;
        _759 = _763;
    }
    int _765 = _759;
    float _767 = floor(_729);
    bool _769 = !_741;
    int _771 = _769 ? 0 : 1;
    float _773 = -_709;
    float _775 = _773 + 1.0;
    bool _777 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(1.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    int _787 = abs(_771);
    bool _789 = _727 > 0.0;
    float _791 = 1.0 / _757;
    bool _793 = _727 >= 0.0;
    bool _795 = isnan(_727);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = in.m_60.x;
    float _805 = in.m_60.y;
    float _807 = in.m_60.z;
    float _809 = float(_765);
    bool _811 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _819 = _815 || _817;
    int _821 = _801 ? 0 : 1;
    float _823 = float(_787);
    float _825 = _819 ? _775 : 0.0;
    bool _827 = !_737;
    int _829 = _827 ? 0 : 1;
    float _831 = _823 * _809;
    bool _833 = _767 > 0.0;
    if (_785)
    {
        float _835 = _825 * _791;
        _123 = _835;
    }
    float _837 = _123;
    bool _839 = _767 >= 0.0;
    bool _841 = isnan(_767);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = _831 * (-2.0);
    int _851 = ~_821;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = _693 + (-0.5);
    int _859 = _855;
    if (!_789)
    {
        int _861 = ~_821;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = fma(_753, _849, _753);
    int _869 = abs(_829);
    bool _871 = !_745;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_849, _805, _805);
    int _877 = _847 ? 0 : 1;
    float _879 = float(_869);
    float _881 = float(_865);
    int _883 = abs(_873);
    float _885 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[196].y, _875);
    int _887 = ~_877;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _141 + _693;
    int _895 = _891;
    if (!_833)
    {
        int _897 = ~_877;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _879 * _881;
    float _905 = fma(_867, _837, _885);
    float _907 = _893 + (-1.0);
    float _909 = float(_883);
    float _911 = _903 * (-2.0);
    float _913 = float(_901);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _917 = _141 + (-0.5);
    float _919 = fma(_911, _803, _803);
    float _921 = _141 + _685;
    float _923 = _909 * _913;
    float _925 = fma(_915, _911, _915);
    float _927 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[196].x, _919);
    float _929 = _921 + (-1.0);
    float _931 = _923 * (-2.0);
    float _933 = fma(_925, _837, _927);
    float _935 = _685 + (-0.5);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _939 = fma(_931, _807, _807);
    float _941 = _905 * 0.15915493667125701904296875;
    float _943 = _933 * 0.15915493667125701904296875;
    float _945 = fma(_937, _931, _937);
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _949 = _941 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_211));
    float _955 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _957 = fma(_945, _837, _947);
    float _959 = _701 * _699;
    float _961 = _705 * _953;
    float _963 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _955);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = _941 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _973 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _975 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _963);
    bool _977 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _985 = _981 || _983;
    float _987 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _971);
    float _989 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _973);
    float _991 = _965 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _987);
    float _997 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _989);
    float _999 = _995 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1001 = _943 * 6.283185482025146484375;
    float _1003 = sin(_1001);
    float _1005 = _943 * 6.283185482025146484375;
    float _1007 = cos(_1005);
    float _1009 = _993 * _961;
    float _1011 = _965 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _1003 * _951;
    float _1017 = _1003 * _969;
    float _1019 = _1003 * _1009;
    float _1021 = _997 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1023 = _1007 * _951;
    float _1025 = _1007 * _969;
    float _1027 = _951 * _993;
    float _1029 = _969 * _993;
    float _1031 = _1007 * _1009;
    float _1033 = fma(_1013, _1025, _1015);
    float _1035 = -_1023;
    float _1037 = fma(_1013, _1017, _1035);
    float _1039 = -_1017;
    float _1041 = fma(_1013, _1023, _1039);
    float _1043 = -_961;
    float _1045 = _1013 * _1043;
    float _1047 = fma(_1033, _959, _1031);
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_1013, _1015, _1025);
    float _1053 = fma(_1029, _959, _1045);
    float _1055 = fma(_1037, _959, _1019);
    float _1057 = fma(_1041, _1049, _1047);
    float _1059 = _975 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1061 = fma(_1027, _1049, _1053);
    float _1063 = fma(_1051, _1049, _1055);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = _999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1071 = _999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1073 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1075 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1069);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1073);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1083 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1077);
    float _1085 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1091 = _1021 + _1085;
    float _1093 = _1059 + _1087;
    float _1095 = 1.0 / _1089;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1093 + _1101;
    float _1105 = _1099 * _1099;
    float _1107 = fma(_1103, _1103, _1105);
    float _1109 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1071);
    float _1111 = sqrt(_1107);
    float _1113 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1109);
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1117 = _1115 + _1089;
    float _1119 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1121 = _1117 * _1095;
    float _1123 = _1121 * 0.5;
    float _1125 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1119);
    float _1127 = _1095;
    float _1129 = _1123;
    float _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1133 = _1107;
    float _1135 = _1061;
    float _1137 = _1027;
    if (_985)
    {
        _1127 = 1.0;
    }
    float _1139 = _1127;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
    bool _1145 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    float _1149 = 1.0 / _1143;
    float _1151 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1153 = _999 + _1151;
    float _1155 = _1151;
    float _1157 = _1139;
    if (!_1145)
    {
        _1129 = _1093;
    }
    float _1159 = _1129;
    float _1161 = _1159;
    if (!_1145)
    {
        _1155 = _1091;
    }
    float _1163 = _1155;
    float _1165 = _1163;
    if (!_1145)
    {
        _1131 = _1153;
    }
    float _1167 = _1131;
    bool _1169 = !_1145;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1111 + _1175;
        float _1179 = rsqrt(_1107);
        float _1181 = _1177 * _1173;
        float _1183 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1185 = _1181 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = _1189 + (-1.0);
        float _1197 = fma(_1193, _1183, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1199 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1201 = _1179 * _1197;
        float _1203 = fma(_1153, _1189, _1199);
        float _1205 = fma(_1103, _1201, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1207 = fma(_1099, _1201, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1171 = _1203;
        _1161 = _1205;
        _1165 = _1207;
    }
    float _1209 = _1171;
    float _1211 = _1161;
    float _1213 = _1165;
    if (_985)
    {
        _1133 = 1.0;
    }
    float _1215 = _1133;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1219 = _1149 * _1217;
    float _1221 = _1215;
    float _1223 = _1219;
    if (!_985)
    {
        float _1225 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1227 = _1225 * 0.15915493667125701904296875;
        float _1229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = _1227 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 0.15915493667125701904296875;
        float _1237 = _1227 * 6.283185482025146484375;
        float _1239 = sin(_1237);
        float _1241 = 1.0 / _1233;
        float _1243 = _1235 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1239 * _1241;
        float _1249 = _1235 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = 1.0 / _1253;
        float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1259 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1257;
        float _1261 = 1.0 / _1259;
        float _1263 = _1251 * _1255;
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = fma(_1219, _1263, _1265);
        float _1269 = _1267 * _1261;
        float _1271 = precise::clamp(_1269, 0.0, 1.0);
        _1135 = _1235;
        _1157 = _1271;
    }
    float _1273 = _1135;
    float _1275 = _1157;
    float _1277 = _1273;
    if (!_985)
    {
        float _1279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1281 = _1279 * 0.15915493667125701904296875;
        float _1283 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1285 = _1281 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = _1283 * 0.15915493667125701904296875;
        float _1291 = _1281 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = 1.0 / _1287;
        float _1297 = _1289 * 6.283185482025146484375;
        float _1299 = cos(_1297);
        float _1301 = _1293 * _1295;
        float _1303 = _1289 * 6.283185482025146484375;
        float _1305 = sin(_1303);
        float _1307 = _1299 * _1301;
        float _1309 = 1.0 / _1307;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1313 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1311;
        float _1315 = 1.0 / _1313;
        float _1317 = _1305 * _1309;
        float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1321 = fma(_1219, _1317, _1319);
        float _1323 = _1321 * _1315;
        float _1325 = precise::clamp(_1323, 0.0, 1.0);
        float _1327 = -_1325;
        float _1329 = _1327 + 1.0;
        _1277 = _1295;
        _1221 = _1329;
    }
    float _1331 = _1277;
    float _1333 = _1221;
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1337 = _1209 + _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1341 = _1211 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1345 = _1213 + _1343;
    float _1347 = _1337 * _1337;
    float _1349 = fma(_1341, _1341, _1347);
    float _1351 = fma(_1345, _1345, _1349);
    float _1353 = rsqrt(_1351);
    float _1355 = sqrt(_1351);
    float _1357 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1359 = _1341 * _1357;
    float _1361 = _1345 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 * _1361;
    float _1367 = _1363 + _1365;
    float _1369 = sqrt(_1367);
    bool _1371 = _1369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1369 + _1373;
    float _1377 = _1345;
    float _1379 = _1347;
    float _1381 = _1375;
    float _1383 = _1357;
    if (_1371)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1385;
    }
    float _1387 = _1377;
    if (_1371)
    {
        float _1389 = rsqrt(_1367);
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (_1371)
    {
        float _1395 = _1375 * _1387;
        _1381 = _1395;
    }
    float _1397 = _1381;
    if (_1371)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1223 = _1399;
    }
    float _1401 = _1223;
    float _1403 = _1353;
    float _1405 = _1401;
    if (_1371)
    {
        float _1407 = _1401 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1415 = precise::max(0.0, _1413);
    float _1417 = _1331;
    float _1419 = _1415;
    float _1421 = _1413;
    if (_1371)
    {
        float _1423 = _1401 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        _1417 = _1425;
    }
    float _1427 = _1417;
    float _1429 = -_1357;
    float _1431 = -_1415;
    float _1433 = fma(_1337, _1429, _1431);
    if (_1371)
    {
        float _1435 = _1433 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1419 = _1435;
    }
    float _1437 = _1419;
    float _1439 = _1437;
    if (!_1371)
    {
        _1405 = _1363;
    }
    float _1441 = _1405;
    float _1443 = _1411;
    float _1445 = _1441;
    if (_1371)
    {
        float _1447 = fma(_1411, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1443 = _1447;
    }
    float _1449 = _1443;
    float _1451 = _1449;
    if (!_1371)
    {
        _1439 = _1361;
    }
    float _1453 = _1439;
    float _1455 = _1453;
    if (_1371)
    {
        float _1457 = _1427 + (-1.0);
        _1421 = _1457;
    }
    float _1459 = _1421;
    float _1461 = _1459;
    if (_1371)
    {
        float _1463 = _1391 * _1449;
        _1137 = _1463;
    }
    float _1465 = _1137;
    if (!_1371)
    {
        _1393 = _1359;
    }
    float _1467 = _1393;
    float _1469 = _1467;
    if (_1371)
    {
        float _1471 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1471;
    }
    float _1473 = _1383;
    if (_1371)
    {
        float _1475 = _1359 * _1465;
        _1469 = _1475;
    }
    float _1477 = _1469;
    if (!_1371)
    {
        _1451 = _1433;
    }
    float _1479 = _1451;
    float _1481 = _1479;
    if (_1371)
    {
        float _1483 = _1361 * _1465;
        _1455 = _1483;
    }
    float _1485 = _1455;
    if (_1371)
    {
        float _1487 = fma(_1433, _1427, _1473);
        _1481 = _1487;
    }
    float _1489 = _1481;
    if (_1371)
    {
        float _1491 = _1477 * _1477;
        _1445 = _1491;
    }
    float _1493 = _1445;
    if (!_1371)
    {
        _1461 = _1365;
    }
    float _1495 = _1461;
    float _1497 = _1495;
    if (_1371)
    {
        float _1499 = _1485 * _1485;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1505 = fma(_1489, _1489, _1493);
    float _1507 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1503);
    float _1509 = _1505 + _1501;
    float _1511 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1515 = fma(_1355, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1513);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1521 = rsqrt(_1509);
    float _1523 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1525 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1511);
    float _1529 = -_1517;
    float _1531 = _1529 + 1.0;
    float _1533 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1535 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1537 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1539 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1527);
    float _1541 = abs(_1531);
    float _1543 = log2(_1541);
    float _1545 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1547 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1535);
    float _1549 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1537);
    float _1551 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1553 = -_1545;
    float _1555 = fma(_1553, _1519, 1.0);
    float _1557 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1547);
    float _1559 = _1521 * _1477;
    float _1561 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1563 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1565 = _1521 * _1489;
    float _1567 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1569 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1571 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1563);
    float _1573 = _1521 * _1485;
    float _1575 = -_1567;
    float _1577 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1575);
    float _1579 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1581 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1571);
    float _1583 = log2(_1555);
    float _1585 = -_1573;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1577);
    float _1589 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1581);
    float _1593 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1595 = fma(_1587, -0.5, 0.5);
    float _1597 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1589);
    float _1599 = exp2(_1579);
    float _1601 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1593);
    float _1603 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1597);
    float _1605 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1601);
    float _1607 = 1.0 / _1591;
    float _1609 = fma(_1587, 0.5, 0.5);
    float _1611 = _1565 + 1.0;
    float _1613 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1605);
    float _1615 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1603);
    float _1617 = fma(_1609, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1619 = _1583 * 0.693147182464599609375;
    float _1621 = sqrt(_1595);
    float _1623 = fma(_1609, _1617, -0.212114393711090087890625);
    float _1625 = -_1565;
    float _1627 = fma(_1599, _1611, _1625);
    float _1629 = fma(_1609, _1623, 1.570728778839111328125);
    float _1631 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1633 = fma(_1627, 0.5, 0.5);
    float _1635 = _1613 * _1607;
    float _1637 = _1615 * _1607;
    float _1639 = fma(_1635, 0.5, 0.5);
    float _1641 = fma(_1637, -0.5, 0.5);
    float _1643 = _1621 * 0.636619746685028076171875;
    float _1645 = -_1629;
    float _1647 = fma(_1643, _1645, 1.0);
    float3 _4284 = float3(_1639, _1641, _1631);
    float _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4284, float3(0.0), isnan(_4284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4284, float3(0.0), isnan(_4284)), level(0.0)).x;
    float3 _4295 = float3(_1639, _1641, _1631);
    float4 _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4295, float3(0.0), isnan(_4295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4295, float3(0.0), isnan(_4295)), level(0.0)).xyzw;
    float _1654 = _1652.x;
    float _1656 = _1652.y;
    float _1658 = _1652.z;
    float _1660 = _1652.w;
    float2 _4312 = float2(_1647, _1633);
    float3 _1664 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4312, float2(0.0), isnan(_4312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4312, float2(0.0), isnan(_4312)), level(0.0)).xyz;
    float _1666 = _1664.x;
    float _1668 = _1664.y;
    float _1670 = _1664.z;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1674 = _683 + _1672;
    bool _1676 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1678 = isnan(_683);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1690;
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    bool _1698 = _1275 > 0.0;
    bool _1700 = isnan(_1275);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(0.0);
    bool _1706 = _1702 || _1704;
    float _1708 = 1.0 / _1692;
    bool _1710 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1712 = isnan(_683);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    bool _1722 = _1333 <= 0.0;
    bool _1724 = !_1706;
    bool _1726 = _1722 || _1724;
    float _1728 = _1720 * _1696;
    float _1730 = -_1720;
    float _1732 = _1730 + 1.0;
    float _1734 = _1674 * _1708;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1744;
    float _1748 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1750 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1752 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1754 = _1748 * _1728;
    float _1756 = _1750 * _1728;
    float _1758 = _1752 * _1728;
    float _1760 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1688);
    float _1762 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1756);
    float _1764 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1758);
    float _1766 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1754);
    float _1768 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1770 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1762);
    float _1772 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1760);
    float _1774 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1764);
    float _1776 = _1770 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = exp2(_1768);
    float _1780 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1772);
    float _1782 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1766);
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1788 = _1780 + _1591;
    float _1790 = _1275 * _1333;
    float _1792 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1794 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1796 = _1790 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1796 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1804 = -_1778;
    float _1806 = _1804 + 1.0;
    float _1808 = _1788 * 0.5;
    out.m_62.x = _1784;
    out.m_62.y = _1798;
    out.m_62.z = _1800;
    out.m_62.w = _1786;
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _1802;
    float _1812 = -_1810;
    float _1814 = _1812 + 1.0;
    out.gl_Position.x = _1613;
    out.gl_Position.y = _1615;
    out.gl_Position.z = _1780;
    out.gl_Position.w = _1591;
    out.m_64.z = _1808;
    out.m_64.w = _1591;
    float _1816 = _1810 * _1649;
    float _1818 = _1660 * _1814;
    float _1820 = _1660 * _1816;
    float _1822 = _1670 * _1816;
    float _1824 = fma(_1666, _1820, _1654);
    float _1826 = fma(_1668, _1820, _1656);
    float _1828 = fma(_1660, _1822, _1658);
    out.m_66.x = _1824;
    out.m_66.y = _1826;
    out.m_66.z = _1828;
    out.m_66.w = _1818;
    if (!_1726)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1830 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1830;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _675 = false;
    bool _495 = false;
    bool _387 = false;
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
        float _1887 = as_type<float>(_101);
        out.gl_Position.z = _1887;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1956 = as_type<float>(_139);
        out.gl_Position.z = _1956;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = _145 * _143;
    float _169 = 0.0;
    float _171 = _149;
    if (!_159)
    {
        float _173 = _149 * _149;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _181 = _177;
    if (!_159)
    {
        float _183 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    float _187 = _179 * 6.283185482025146484375;
    float _189 = floor(_179);
    int _191 = as_type<int>(_147) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_147) & 2;
    bool _197 = _195 != 0;
    float _199 = _187 * 0.15915493667125701904296875;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    float _205 = _199 * 6.283185482025146484375;
    float _207 = cos(_205);
    bool _209 = !_197;
    int _211 = _209 ? (-1090519040) : 1056964608;
    float _213 = -_189;
    float _215 = _179 + _213;
    bool _217 = !_193;
    int _219 = _217 ? (-1090519040) : 1056964608;
    bool _221 = !_159;
    float _223 = _185;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _149 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _149);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_159;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _149 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _171 = _277;
    }
    float _279 = _171;
    float _281 = in.m_54.w;
    bool _283 = _215 < 0.5;
    float _285 = float(_283);
    float _287 = in.m_42.x;
    float _289 = in.m_42.y;
    float _291 = in.m_42.z;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _299 = _297 != 0;
    float _301 = -_215;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_207, 0.5, 0.5);
    float _307 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = -_285;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _313 = !_295;
    int _315 = _313 ? 0 : 1;
    float _317 = -_305;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_56.x = as_type<float>(_219);
    out.m_56.y = as_type<float>(_211);
    float _321 = fma(_279, _161, _307);
    bool _323 = !_203;
    int _325 = _323 ? 0 : 1;
    float _327 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_299;
    int _331 = _329 ? 0 : 1;
    float _333 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_315);
    float _337 = fma(_279, _163, _327);
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _341 = fma(_279, _165, _333);
    int _343 = abs(_325);
    int _345 = abs(_331);
    float _347 = float(_335);
    float _349 = float(_343);
    float _351 = fma(_337, _281, _289);
    float _353 = abs(_303);
    float _355 = _347 * _353;
    float _357 = fma(_321, _281, _287);
    float _359 = fma(_341, _281, _291);
    float _361 = float(_345);
    float _363 = fma(_349, _319, _355);
    float _365 = abs(_311);
    float _367 = fma(_361, _365, _363);
    bool _369 = !_339;
    float _385;
    if (!_369)
    {
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _373 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_85);
        float _391 = 1.0 / _389;
        float _393 = _119 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _395 + _397;
    float _401 = in.m_54.x;
    float _403 = in.m_54.y;
    bool _405 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _407 = isnan(_395);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = 1.0 / _419;
    float _425 = -_415;
    float _427 = _425 + 1.0;
    float _429 = _399 * _423;
    bool _431 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _433 = isnan(_395);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _441 * _427;
    float _453 = fma(_445, _429, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _455 = fma(_449, _429, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _457 = -_441;
    float _459 = _457 + 1.0;
    float _461 = _453 * _451;
    float _463 = _455 * _451;
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _467 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _469 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].x, _465);
    float _471 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[144].y, _467);
    float _473 = _469 * _401;
    float _475 = _471 * _403;
    bool _477 = !_421;
    float _493;
    if (!_477)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _481 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_85);
        float _499 = 1.0 / _497;
        float _501 = _119 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = _503 + _505;
    bool _509 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _511 = isnan(_503);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _523 = _503 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _533 = -_519;
    float _535 = _533 + 1.0;
    float _537 = 1.0 / _527;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _541 = 1.0 / _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _543;
    float _547 = _507 * _537;
    bool _549 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _551 = isnan(_503);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _561;
    bool _565 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _567 = isnan(_503);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_545, _547, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _579 = fma(_563, _547, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _581 = _575 * _535;
    float _583 = -_575;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = _523 * _541;
    float _593 = _559 * _585;
    float _595 = fma(_589, _547, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _597 = -_559;
    float _599 = _597 + 1.0;
    float _601 = _577 * _593;
    float _603 = _595 * _593;
    float _605 = _579 * _593;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _619 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].x, _603);
    float _621 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].y, _601);
    float _623 = fma(_609, _591, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _625 = fma(_613, _591, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _627 = fma(_617, _591, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _629 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].z, _605);
    float _631 = fma(_623, _581, _619);
    float _633 = fma(_625, _581, _621);
    float _635 = fma(_627, _581, _629);
    float _637 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].x, _631);
    float _639 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].y, _633);
    float _641 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[109].z, _635);
    float _643 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _651;
    out.m_58.y = _653;
    out.m_58.z = _655;
    out.m_58.w = _647;
    bool _657 = !_539;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _661 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_85);
        float _679 = 1.0 / _677;
        float _681 = _119 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = in.m_49.z;
    float _687 = _141 * 2.0;
    float _689 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _691 = log2(_689);
    float _693 = in.m_49.y;
    float _695 = _367 * _473;
    float _697 = _367 * _475;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_219));
    float _701 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _703 = floor(_687);
    float _705 = _697 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _707 = _691 * _119;
    float _709 = exp2(_707);
    float _711 = _685 * 2.0;
    bool _713 = _703 > 0.0;
    bool _715 = _703 >= 0.0;
    bool _717 = isnan(_703);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = _693 + _685;
    float _727 = floor(_711);
    float _729 = _693 * 2.0;
    int _731 = _723 ? 0 : 1;
    float _733 = _725 + (-1.0);
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _737 = _735 != 0;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _745 = _743 != 0;
    int _747 = ~_731;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    int _759 = _751;
    if (!_713)
    {
        int _761 = ~_731;
        int _763 = _761 + 1;
        _759 = _763;
    }
    int _765 = _759;
    float _767 = floor(_729);
    bool _769 = !_741;
    int _771 = _769 ? 0 : 1;
    float _773 = -_709;
    float _775 = _773 + 1.0;
    bool _777 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(1.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    int _787 = abs(_771);
    bool _789 = _727 > 0.0;
    float _791 = 1.0 / _757;
    bool _793 = _727 >= 0.0;
    bool _795 = isnan(_727);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = in.m_60.x;
    float _805 = in.m_60.y;
    float _807 = in.m_60.z;
    float _809 = float(_765);
    bool _811 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _819 = _815 || _817;
    int _821 = _801 ? 0 : 1;
    float _823 = float(_787);
    float _825 = _819 ? _775 : 0.0;
    bool _827 = !_737;
    int _829 = _827 ? 0 : 1;
    float _831 = _823 * _809;
    bool _833 = _767 > 0.0;
    if (_785)
    {
        float _835 = _825 * _791;
        _123 = _835;
    }
    float _837 = _123;
    bool _839 = _767 >= 0.0;
    bool _841 = isnan(_767);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = _831 * (-2.0);
    int _851 = ~_821;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = _693 + (-0.5);
    int _859 = _855;
    if (!_789)
    {
        int _861 = ~_821;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = fma(_753, _849, _753);
    int _869 = abs(_829);
    bool _871 = !_745;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_849, _805, _805);
    int _877 = _847 ? 0 : 1;
    float _879 = float(_869);
    float _881 = float(_865);
    int _883 = abs(_873);
    float _885 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[196].y, _875);
    int _887 = ~_877;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _141 + _693;
    int _895 = _891;
    if (!_833)
    {
        int _897 = ~_877;
        int _899 = _897 + 1;
        _895 = _899;
    }
    int _901 = _895;
    float _903 = _879 * _881;
    float _905 = fma(_867, _837, _885);
    float _907 = _893 + (-1.0);
    float _909 = float(_883);
    float _911 = _903 * (-2.0);
    float _913 = float(_901);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _917 = _141 + (-0.5);
    float _919 = fma(_911, _803, _803);
    float _921 = _141 + _685;
    float _923 = _909 * _913;
    float _925 = fma(_915, _911, _915);
    float _927 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[196].x, _919);
    float _929 = _921 + (-1.0);
    float _931 = _923 * (-2.0);
    float _933 = fma(_925, _837, _927);
    float _935 = _685 + (-0.5);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _939 = fma(_931, _807, _807);
    float _941 = _905 * 0.15915493667125701904296875;
    float _943 = _933 * 0.15915493667125701904296875;
    float _945 = fma(_937, _931, _937);
    float _947 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _949 = _941 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_211));
    float _955 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _957 = fma(_945, _837, _947);
    float _959 = _701 * _699;
    float _961 = _705 * _953;
    float _963 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _955);
    float _965 = _957 * 0.15915493667125701904296875;
    float _967 = _941 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _973 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _975 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _963);
    bool _977 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _985 = _981 || _983;
    float _987 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _971);
    float _989 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _973);
    float _991 = _965 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _987);
    float _997 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _989);
    float _999 = _995 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1001 = _943 * 6.283185482025146484375;
    float _1003 = sin(_1001);
    float _1005 = _943 * 6.283185482025146484375;
    float _1007 = cos(_1005);
    float _1009 = _993 * _961;
    float _1011 = _965 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _1003 * _951;
    float _1017 = _1003 * _969;
    float _1019 = _1003 * _1009;
    float _1021 = _997 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1023 = _1007 * _951;
    float _1025 = _1007 * _969;
    float _1027 = _951 * _993;
    float _1029 = _969 * _993;
    float _1031 = _1007 * _1009;
    float _1033 = fma(_1013, _1025, _1015);
    float _1035 = -_1023;
    float _1037 = fma(_1013, _1017, _1035);
    float _1039 = -_1017;
    float _1041 = fma(_1013, _1023, _1039);
    float _1043 = -_961;
    float _1045 = _1013 * _1043;
    float _1047 = fma(_1033, _959, _1031);
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_1013, _1015, _1025);
    float _1053 = fma(_1029, _959, _1045);
    float _1055 = fma(_1037, _959, _1019);
    float _1057 = fma(_1041, _1049, _1047);
    float _1059 = _975 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1061 = fma(_1027, _1049, _1053);
    float _1063 = fma(_1051, _1049, _1055);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = _999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1071 = _999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1073 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1075 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1069);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1073);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1083 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1077);
    float _1085 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1089 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1091 = _1021 + _1085;
    float _1093 = _1059 + _1087;
    float _1095 = 1.0 / _1089;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1099 = _1091 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1093 + _1101;
    float _1105 = _1099 * _1099;
    float _1107 = fma(_1103, _1103, _1105);
    float _1109 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1071);
    float _1111 = sqrt(_1107);
    float _1113 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1109);
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1117 = _1115 + _1089;
    float _1119 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1121 = _1117 * _1095;
    float _1123 = _1121 * 0.5;
    float _1125 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1119);
    float _1127 = _1095;
    float _1129 = _1123;
    float _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1133 = _1107;
    float _1135 = _1061;
    float _1137 = _1027;
    if (_985)
    {
        _1127 = 1.0;
    }
    float _1139 = _1127;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
    bool _1145 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1147 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    float _1149 = 1.0 / _1143;
    float _1151 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1153 = _999 + _1151;
    float _1155 = _1151;
    float _1157 = _1139;
    if (!_1145)
    {
        _1129 = _1093;
    }
    float _1159 = _1129;
    float _1161 = _1159;
    if (!_1145)
    {
        _1155 = _1091;
    }
    float _1163 = _1155;
    float _1165 = _1163;
    if (!_1145)
    {
        _1131 = _1153;
    }
    float _1167 = _1131;
    bool _1169 = !_1145;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1111 + _1175;
        float _1179 = rsqrt(_1107);
        float _1181 = _1177 * _1173;
        float _1183 = _1153 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1185 = _1181 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = _1189 + (-1.0);
        float _1197 = fma(_1193, _1183, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1199 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1201 = _1179 * _1197;
        float _1203 = fma(_1153, _1189, _1199);
        float _1205 = fma(_1103, _1201, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1207 = fma(_1099, _1201, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1171 = _1203;
        _1161 = _1205;
        _1165 = _1207;
    }
    float _1209 = _1171;
    float _1211 = _1161;
    float _1213 = _1165;
    if (_985)
    {
        _1133 = 1.0;
    }
    float _1215 = _1133;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1219 = _1149 * _1217;
    float _1221 = _1215;
    float _1223 = _1219;
    if (!_985)
    {
        float _1225 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1227 = _1225 * 0.15915493667125701904296875;
        float _1229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = _1227 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 0.15915493667125701904296875;
        float _1237 = _1227 * 6.283185482025146484375;
        float _1239 = sin(_1237);
        float _1241 = 1.0 / _1233;
        float _1243 = _1235 * 6.283185482025146484375;
        float _1245 = cos(_1243);
        float _1247 = _1239 * _1241;
        float _1249 = _1235 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = 1.0 / _1253;
        float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1259 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1257;
        float _1261 = 1.0 / _1259;
        float _1263 = _1251 * _1255;
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1267 = fma(_1219, _1263, _1265);
        float _1269 = _1267 * _1261;
        float _1271 = precise::clamp(_1269, 0.0, 1.0);
        _1135 = _1235;
        _1157 = _1271;
    }
    float _1273 = _1135;
    float _1275 = _1157;
    float _1277 = _1273;
    if (!_985)
    {
        float _1279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1281 = _1279 * 0.15915493667125701904296875;
        float _1283 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1285 = _1281 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = _1283 * 0.15915493667125701904296875;
        float _1291 = _1281 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = 1.0 / _1287;
        float _1297 = _1289 * 6.283185482025146484375;
        float _1299 = cos(_1297);
        float _1301 = _1293 * _1295;
        float _1303 = _1289 * 6.283185482025146484375;
        float _1305 = sin(_1303);
        float _1307 = _1299 * _1301;
        float _1309 = 1.0 / _1307;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1313 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1311;
        float _1315 = 1.0 / _1313;
        float _1317 = _1305 * _1309;
        float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1321 = fma(_1219, _1317, _1319);
        float _1323 = _1321 * _1315;
        float _1325 = precise::clamp(_1323, 0.0, 1.0);
        float _1327 = -_1325;
        float _1329 = _1327 + 1.0;
        _1277 = _1295;
        _1221 = _1329;
    }
    float _1331 = _1277;
    float _1333 = _1221;
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1337 = _1209 + _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1341 = _1211 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1345 = _1213 + _1343;
    float _1347 = _1337 * _1337;
    float _1349 = fma(_1341, _1341, _1347);
    float _1351 = fma(_1345, _1345, _1349);
    float _1353 = rsqrt(_1351);
    float _1355 = sqrt(_1351);
    float _1357 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1359 = _1341 * _1357;
    float _1361 = _1345 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 * _1361;
    float _1367 = _1363 + _1365;
    float _1369 = sqrt(_1367);
    bool _1371 = _1369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1369 + _1373;
    float _1377 = _1345;
    float _1379 = _1347;
    float _1381 = _1375;
    float _1383 = _1357;
    if (_1371)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1385;
    }
    float _1387 = _1377;
    if (_1371)
    {
        float _1389 = rsqrt(_1367);
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (_1371)
    {
        float _1395 = _1375 * _1387;
        _1381 = _1395;
    }
    float _1397 = _1381;
    if (_1371)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1223 = _1399;
    }
    float _1401 = _1223;
    float _1403 = _1353;
    float _1405 = _1401;
    if (_1371)
    {
        float _1407 = _1401 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1415 = precise::max(0.0, _1413);
    float _1417 = _1331;
    float _1419 = _1415;
    float _1421 = _1413;
    if (_1371)
    {
        float _1423 = _1401 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        _1417 = _1425;
    }
    float _1427 = _1417;
    float _1429 = -_1357;
    float _1431 = -_1415;
    float _1433 = fma(_1337, _1429, _1431);
    if (_1371)
    {
        float _1435 = _1433 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1419 = _1435;
    }
    float _1437 = _1419;
    float _1439 = _1437;
    if (!_1371)
    {
        _1405 = _1363;
    }
    float _1441 = _1405;
    float _1443 = _1411;
    float _1445 = _1441;
    if (_1371)
    {
        float _1447 = fma(_1411, _1437, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1443 = _1447;
    }
    float _1449 = _1443;
    float _1451 = _1449;
    if (!_1371)
    {
        _1439 = _1361;
    }
    float _1453 = _1439;
    float _1455 = _1453;
    if (_1371)
    {
        float _1457 = _1427 + (-1.0);
        _1421 = _1457;
    }
    float _1459 = _1421;
    float _1461 = _1459;
    if (_1371)
    {
        float _1463 = _1391 * _1449;
        _1137 = _1463;
    }
    float _1465 = _1137;
    if (!_1371)
    {
        _1393 = _1359;
    }
    float _1467 = _1393;
    float _1469 = _1467;
    if (_1371)
    {
        float _1471 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1471;
    }
    float _1473 = _1383;
    if (_1371)
    {
        float _1475 = _1359 * _1465;
        _1469 = _1475;
    }
    float _1477 = _1469;
    if (!_1371)
    {
        _1451 = _1433;
    }
    float _1479 = _1451;
    float _1481 = _1479;
    if (_1371)
    {
        float _1483 = _1361 * _1465;
        _1455 = _1483;
    }
    float _1485 = _1455;
    if (_1371)
    {
        float _1487 = fma(_1433, _1427, _1473);
        _1481 = _1487;
    }
    float _1489 = _1481;
    if (_1371)
    {
        float _1491 = _1477 * _1477;
        _1445 = _1491;
    }
    float _1493 = _1445;
    if (!_1371)
    {
        _1461 = _1365;
    }
    float _1495 = _1461;
    float _1497 = _1495;
    if (_1371)
    {
        float _1499 = _1485 * _1485;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1505 = fma(_1489, _1489, _1493);
    float _1507 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1503);
    float _1509 = _1505 + _1501;
    float _1511 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1515 = fma(_1355, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1513);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1521 = rsqrt(_1509);
    float _1523 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1525 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1511);
    float _1529 = -_1517;
    float _1531 = _1529 + 1.0;
    float _1533 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1535 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1537 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1539 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1527);
    float _1541 = abs(_1531);
    float _1543 = log2(_1541);
    float _1545 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1547 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1535);
    float _1549 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1537);
    float _1551 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1553 = -_1545;
    float _1555 = fma(_1553, _1519, 1.0);
    float _1557 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1547);
    float _1559 = _1521 * _1477;
    float _1561 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1563 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1565 = _1521 * _1489;
    float _1567 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1569 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1571 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1563);
    float _1573 = _1521 * _1485;
    float _1575 = -_1567;
    float _1577 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1575);
    float _1579 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1581 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1571);
    float _1583 = log2(_1555);
    float _1585 = -_1573;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1577);
    float _1589 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1581);
    float _1593 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1595 = fma(_1587, -0.5, 0.5);
    float _1597 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1589);
    float _1599 = exp2(_1579);
    float _1601 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1593);
    float _1603 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1597);
    float _1605 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1601);
    float _1607 = 1.0 / _1591;
    float _1609 = fma(_1587, 0.5, 0.5);
    float _1611 = _1565 + 1.0;
    float _1613 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1605);
    float _1615 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1603);
    float _1617 = fma(_1609, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1619 = _1583 * 0.693147182464599609375;
    float _1621 = sqrt(_1595);
    float _1623 = fma(_1609, _1617, -0.212114393711090087890625);
    float _1625 = -_1565;
    float _1627 = fma(_1599, _1611, _1625);
    float _1629 = fma(_1609, _1623, 1.570728778839111328125);
    float _1631 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1633 = fma(_1627, 0.5, 0.5);
    float _1635 = _1613 * _1607;
    float _1637 = _1615 * _1607;
    float _1639 = fma(_1635, 0.5, 0.5);
    float _1641 = fma(_1637, -0.5, 0.5);
    float _1643 = _1621 * 0.636619746685028076171875;
    float _1645 = -_1629;
    float _1647 = fma(_1643, _1645, 1.0);
    float3 _4284 = float3(_1639, _1641, _1631);
    float _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4284, float3(0.0), isnan(_4284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4284, float3(0.0), isnan(_4284)), level(0.0)).x;
    float3 _4295 = float3(_1639, _1641, _1631);
    float4 _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4295, float3(0.0), isnan(_4295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4295, float3(0.0), isnan(_4295)), level(0.0)).xyzw;
    float _1654 = _1652.x;
    float _1656 = _1652.y;
    float _1658 = _1652.z;
    float _1660 = _1652.w;
    float2 _4312 = float2(_1647, _1633);
    float3 _1664 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4312, float2(0.0), isnan(_4312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4312, float2(0.0), isnan(_4312)), level(0.0)).xyz;
    float _1666 = _1664.x;
    float _1668 = _1664.y;
    float _1670 = _1664.z;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1674 = _683 + _1672;
    bool _1676 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1678 = isnan(_683);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1690;
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    bool _1698 = _1275 > 0.0;
    bool _1700 = isnan(_1275);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(0.0);
    bool _1706 = _1702 || _1704;
    float _1708 = 1.0 / _1692;
    bool _1710 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1712 = isnan(_683);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    bool _1722 = _1333 <= 0.0;
    bool _1724 = !_1706;
    bool _1726 = _1722 || _1724;
    float _1728 = _1720 * _1696;
    float _1730 = -_1720;
    float _1732 = _1730 + 1.0;
    float _1734 = _1674 * _1708;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1744;
    float _1748 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1750 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1752 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1754 = _1748 * _1728;
    float _1756 = _1750 * _1728;
    float _1758 = _1752 * _1728;
    float _1760 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1688);
    float _1762 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1756);
    float _1764 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1758);
    float _1766 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1754);
    float _1768 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1770 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1762);
    float _1772 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1760);
    float _1774 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1764);
    float _1776 = _1770 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = exp2(_1768);
    float _1780 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1772);
    float _1782 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1766);
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1788 = _1780 + _1591;
    float _1790 = _1275 * _1333;
    float _1792 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1794 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1796 = _1790 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1802 = _1796 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1804 = -_1778;
    float _1806 = _1804 + 1.0;
    float _1808 = _1788 * 0.5;
    out.m_62.x = _1784;
    out.m_62.y = _1798;
    out.m_62.z = _1800;
    out.m_62.w = _1786;
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _1802;
    float _1812 = -_1810;
    float _1814 = _1812 + 1.0;
    out.gl_Position.x = _1613;
    out.gl_Position.y = _1615;
    out.gl_Position.z = _1780;
    out.gl_Position.w = _1591;
    out.m_64.z = _1808;
    out.m_64.w = _1591;
    float _1816 = _1810 * _1649;
    float _1818 = _1660 * _1814;
    float _1820 = _1660 * _1816;
    float _1822 = _1670 * _1816;
    float _1824 = fma(_1666, _1820, _1654);
    float _1826 = fma(_1668, _1820, _1656);
    float _1828 = fma(_1660, _1822, _1658);
    out.m_66.x = _1824;
    out.m_66.y = _1826;
    out.m_66.z = _1828;
    out.m_66.w = _1818;
    if (!_1726)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1830 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1830;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

