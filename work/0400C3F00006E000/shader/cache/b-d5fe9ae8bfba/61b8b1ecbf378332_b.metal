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
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2708 = false;
    bool _581 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3006 = as_type<float>(_123);
        out.gl_Position.z = _3006;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_109);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3076 = as_type<float>(_163);
        out.gl_Position.z = _3076;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_179;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_175;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_181;
    float _227;
    if (!_209)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _141 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _237 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    float _263 = 1.0 / _253;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _261;
    bool _269 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_237);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _257;
    float _283 = _241 * _263;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _245 * _267;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_279;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -_309;
    float _319 = _317 + 1.0;
    float _321 = _249 * _281;
    float _323 = -_295;
    float _325 = _323 + 1.0;
    bool _327 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_237);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _279 * _325;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_341, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _337 * _319;
    float _361 = fma(_351, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_345, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_355, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = _357 * _359;
    float _373 = _361 * _359;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_363, _315, _379);
    float _391 = fma(_383, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _315, _385);
    float _395 = fma(_387, _347, _389);
    float _397 = fma(_391, _347, _393);
    float _399 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_265;
    float _421;
    if (!_403)
    {
        float _405 = in.m_60.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_109);
        float _427 = 1.0 / _425;
        float _429 = _141 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _437 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = isnan(_431);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _455 = isnan(_431);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = 1.0 / _435;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = -_447;
    float _473 = _471 + 1.0;
    bool _475 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_431);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    bool _487 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _489 = 1.0 / _451;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _495 = _469 * _465;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _431 + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _431 + _501;
    float _505 = fma(_495, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = _463 * _473;
    float _509 = -_463;
    float _511 = _509 + 1.0;
    float _513 = _493 * _489;
    float _515 = -_485;
    float _517 = _515 + 1.0;
    float _519 = _505 * _507;
    float _521 = fma(_513, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _523 = _447 * _517;
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _527 = fma(_521, _523, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _527);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _543 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = in.m_62.x;
    float _547 = in.m_62.y;
    out.m_64.x = _537;
    out.m_64.y = _539;
    out.m_64.z = _543;
    out.m_64.w = _541;
    float _549 = _401 * _547;
    float _551 = _399 * _545;
    bool _553 = !_487;
    float _577;
    float _579;
    if (!_553)
    {
        float _555 = in.m_60.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _559 = float(_109);
        float _561 = 1.0 / _559;
        float _563 = _555 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _565 = _141 * _561;
        float _567 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _569 = _567 * _557;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _565;
        _579 = _575;
        _581 = true;
    }
    else
    {
        float _583 = float(_109);
        float _585 = 1.0 / _583;
        float _587 = _141 * _585;
        _577 = _587;
        _579 = _587;
    }
    _581 = false;
    float _589 = _577;
    float _591 = _579;
    float _593 = in.m_60.x;
    float _595 = in.m_60.y;
    float _597 = in.m_60.z;
    float _599 = in.m_60.w;
    float _601 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _603 = log2(_601);
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _607 = _605 != 0;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _611 = _603 * _141;
    float _613 = _597 * 2.0;
    float _615 = _593 * 2.0;
    float _617 = _595 + _593;
    float _619 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _621 = floor(_613);
    float _623 = _617 + (-1.0);
    float _625 = -_609;
    float _627 = fma(_619, 2.0, _625);
    float _629 = _619;
    if (!_607)
    {
        _629 = _595;
    }
    float _631 = _629;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _635 = _595 * 2.0;
    float _637 = _631;
    if (_607)
    {
        _637 = _593;
    }
    float _639 = _637;
    float _641 = floor(_615);
    float _643 = -_141;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _649 = _621 > 0.0;
    float _651 = floor(_635);
    bool _653 = _621 >= 0.0;
    bool _655 = isnan(_621);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _665 = _595 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _667 = _661 ? 0 : 1;
    bool _669 = _641 > 0.0;
    float _671 = fma(_665, -2.0, _663);
    bool _673 = _641 >= 0.0;
    bool _675 = isnan(_641);
    bool _677 = _673 || _675;
    bool _679 = isnan(0.0);
    bool _681 = _677 || _679;
    bool _683 = _595 > 0.5;
    float _685 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _671);
    int _687 = ~_667;
    int _689 = _687 + 1;
    int _691 = _689 + 1;
    int _693 = _691;
    float _695 = _663;
    if (!_649)
    {
        int _697 = ~_667;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _709 = _707 != 0;
    bool _711 = _597 > 0.5;
    float _713 = -_207;
    float _715 = _683 ? _713 : _207;
    float _717 = -_191;
    int _719 = _711 ? as_type<int>(_717) : as_type<int>(_191);
    bool _721 = !_705;
    float _723 = _721 ? _207 : _715;
    float _725 = _715;
    if (!_607)
    {
        _695 = _597;
    }
    float _727 = _695;
    float _729 = _727;
    if (!_607)
    {
        _725 = _597;
    }
    float _731 = _725;
    bool _733 = !_709;
    float _735 = _733 ? _191 : as_type<float>(_719);
    float _737 = _731;
    if (_607)
    {
        _729 = _595;
    }
    float _739 = _729;
    if (_607)
    {
        _737 = _595;
    }
    float _741 = _737;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _753 = _751 != 0;
    float _755 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[83].w, _647);
    int _757 = _681 ? 0 : 1;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _761 = _651 > 0.0;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _765 = !_745;
    int _767 = _765 ? 0 : 1;
    bool _769 = _651 >= 0.0;
    bool _771 = isnan(_651);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _781 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[83].z, _759);
    float _783 = _639 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _785 = _777 ? 0 : 1;
    float _787 = _739 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _789 = -_779;
    float _791 = fma(_783, 2.0, _789);
    int _793 = ~_785;
    int _795 = _793 + 1;
    int _797 = _795 + 1;
    float _799 = exp2(_611);
    int _801 = abs(_767);
    float _803 = fma(_787, -2.0, _763);
    int _805 = _797;
    if (!_761)
    {
        int _807 = ~_785;
        int _809 = _807 + 1;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = -_141;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[81].x, _791);
    float _817 = in.m_66.x;
    float _819 = in.m_66.y;
    float _821 = in.m_66.z;
    float _823 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _803);
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = float(_701);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = float(_801);
    float _845 = 1.0 / _837;
    float _847 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    int _849 = ~_757;
    int _851 = _849 + 1;
    int _853 = _851 + 1;
    float _855 = -_799;
    float _857 = _855 + 1.0;
    int _859 = _853;
    if (!_669)
    {
        int _861 = ~_757;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = _843 * _839;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _871 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _879 = _875 || _877;
    float _881 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _847);
    bool _883 = !_749;
    int _885 = _883 ? 0 : 1;
    float _887 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _781);
    float _889 = _867 * (-2.0);
    float _891 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _893 = _879 ? _857 : 0.0;
    float _895 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _755);
    int _897 = abs(_885);
    float _899 = _593 + (-0.5);
    float _901 = fma(_889, _817, _817);
    float _903 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    bool _905 = !_753;
    int _907 = _905 ? 0 : 1;
    if (_833)
    {
        float _909 = _893 * _845;
        _145 = _909;
    }
    float _911 = _145;
    float _913 = float(_865);
    float _915 = fma(_633, _889, _633);
    float _917 = float(_897);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[196].x, _901);
    int _921 = abs(_907);
    float _923 = _595 + _597;
    float _925 = _917 * _913;
    float _927 = fma(_915, _911, _919);
    float _929 = float(_811);
    float _931 = _923 + (-1.0);
    float _933 = float(_921);
    float _935 = _925 * (-2.0);
    float _937 = _595 + (-0.5);
    float _939 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _941 = _597 + _593;
    float _943 = _933 * _929;
    float _945 = fma(_935, _819, _819);
    float _947 = _597 + (-0.5);
    float _949 = _941 + (-1.0);
    float _951 = _943 * (-2.0);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].y, _945);
    float _955 = fma(_939, _935, _939);
    float _957 = _927 * 0.15915493667125701904296875;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    bool _961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _963 = isnan(0.5);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _969 = _965 || _967;
    float _971 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _973 = fma(_951, _821, _821);
    float _975 = fma(_955, _911, _953);
    float _977 = _957 * 6.283185482025146484375;
    float _979 = cos(_977);
    float _981 = fma(_971, _951, _971);
    float _983 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[196].z, _973);
    float _985 = _975 * 0.15915493667125701904296875;
    float _987 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _989 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _991 = fma(_981, _911, _983);
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _995 = _985 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = in.m_48.x;
    float _1001 = in.m_48.y;
    float _1003 = in.m_48.z;
    float _1005 = _991 * 0.15915493667125701904296875;
    float _1007 = _987 * _993;
    float _1009 = _989 * _959;
    float _1011 = _985 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = _957 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = _979 * _997;
    float _1021 = _1005 * 6.283185482025146484375;
    float _1023 = cos(_1021);
    float _1025 = _979 * _1013;
    float _1027 = _1005 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _1017 * _997;
    float _1033 = _1017 * _1013;
    float _1035 = _979 * _1023;
    float _1037 = _1017 * _1023;
    float _1039 = _1013 * _1023;
    float _1041 = _997 * _1023;
    float _1043 = _1035 * _1009;
    float _1045 = _1037 * _1009;
    float _1047 = fma(_1029, _1025, _1031);
    float _1049 = -_1019;
    float _1051 = fma(_1029, _1033, _1049);
    float _1053 = -_1033;
    float _1055 = fma(_1029, _1019, _1053);
    float _1057 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1059 = -_1009;
    float _1061 = _1029 * _1059;
    float _1063 = fma(_1047, _1007, _1043);
    float _1065 = fma(_1029, _1031, _1025);
    float _1067 = fma(_1051, _1007, _1045);
    float _1069 = fma(_1039, _1007, _1061);
    float _1071 = fma(_1055, _1057, _1063);
    float _1073 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1075 = fma(_1065, _1057, _1067);
    float _1077 = fma(_1041, _1057, _1069);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1083 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1073);
    float _1085 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1087 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1089 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1081);
    float _1091 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1083);
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1085);
    float _1095 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1097 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1089);
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1107 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = _1099 + _1103;
    float _1113 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1107);
    float _1115 = _1105 + _1109;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1119 = _1111 + _1117;
    float _1121 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1113);
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1125 = _1115 + _1123;
    float _1127 = _1119 * _1119;
    float _1129 = fma(_1125, _1125, _1127);
    float _1131 = sqrt(_1129);
    bool _1133 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _1131 + _1135;
    float _1139 = _1103;
    float _1141 = _1137;
    float _1143 = _1121;
    float _1145 = _1071;
    float _1147 = _1115;
    float _1149 = _1111;
    if (_1133)
    {
        float _1151 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1139 = _1151;
    }
    float _1153 = _1139;
    if (_1133)
    {
        float _1155 = _1137 * _1153;
        _1141 = _1155;
    }
    float _1157 = _1141;
    float _1159 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = 0.0;
    if (_1133)
    {
        float _1163 = _1157 * 0.15915493667125701904296875;
        _1161 = _1163;
    }
    float _1165 = _1161;
    float _1167 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1169 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1171 = _985;
    float _1173 = _1165;
    if (_1133)
    {
        float _1175 = _1165 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1171 = _1177;
    }
    float _1179 = _1171;
    float _1181 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1167);
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1187 = _1159;
    float _1189 = _1183;
    float _1191 = _1185;
    if (_1133)
    {
        float _1193 = _1165 * 6.283185482025146484375;
        float _1195 = sin(_1193);
        _1187 = _1195;
    }
    float _1197 = _1187;
    float _1199 = _1169 + _1183;
    float _1201 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1185);
    float _1203 = _1199;
    if (_1133)
    {
        float _1205 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1205;
    }
    float _1207 = _1143;
    float _1209 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1201);
    float _1211 = _1075;
    float _1213 = _1207;
    if (_1133)
    {
        float _1215 = rsqrt(_1129);
        _1211 = _1215;
    }
    float _1217 = _1211;
    if (_1133)
    {
        float _1219 = _1179 + (-1.0);
        _1189 = _1219;
    }
    float _1221 = _1189;
    float _1223 = _1221;
    if (_969)
    {
        _1173 = 1.0;
    }
    float _1225 = _1173;
    float _1227 = _1225;
    if (_1133)
    {
        float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1229;
    }
    float _1231 = _1191;
    if (!_1133)
    {
        _1223 = _1111;
    }
    float _1233 = _1223;
    float _1235 = _1233;
    if (_1133)
    {
        float _1237 = fma(_1197, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1145 = _1237;
    }
    float _1239 = _1145;
    if (_1133)
    {
        float _1241 = fma(_1199, _1179, _1231);
        _1203 = _1241;
    }
    float _1243 = _1203;
    float _1245 = _1243;
    if (!_1133)
    {
        _1213 = _1115;
    }
    float _1247 = _1213;
    float _1249 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1251 = -_1169;
    float _1253 = _1251 + _1243;
    float _1255 = _1217;
    float _1257 = _1247;
    if (_1133)
    {
        float _1259 = _1217 * _1239;
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1265 = _1253 * _1253;
    if (_1133)
    {
        float _1267 = fma(_1125, _1261, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1257 = _1267;
    }
    float _1269 = _1257;
    if (_1133)
    {
        float _1271 = fma(_1119, _1261, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1235 = _1271;
    }
    float _1273 = _1235;
    float _1275 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1249);
    float _1277 = 1.0 / _1263;
    float _1279 = -_1105;
    float _1281 = _1279 + _1269;
    float _1283 = -_1099;
    float _1285 = _1283 + _1273;
    float _1287 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1275);
    float _1289 = fma(_1281, _1281, _1265);
    float _1291 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1293 = fma(_1285, _1285, _1289);
    float _1295 = _1291 + _1263;
    float _1297 = sqrt(_1293);
    float _1299 = _1295 * _1277;
    float _1301 = _1299 * 0.5;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1305 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1303);
    float _1307 = 1.0 / _1305;
    bool _1309 = _1297 > 0.0;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1313 = _1307 * _1311;
    float _1315 = _1293;
    float _1317 = _1277;
    float _1319 = _1285;
    if (!_1309)
    {
        _1147 = _1269;
    }
    float _1321 = _1147;
    float _1323 = _1321;
    float _1325 = _1321;
    if (!_1309)
    {
        _1149 = _1273;
    }
    float _1327 = _1149;
    bool _1329 = !_1309;
    float _1331 = _1327;
    float _1333 = _1327;
    if (!_1329)
    {
        float _1335 = _199 * _199;
        float _1337 = fma(_201, _201, _1335);
        float _1339 = fma(_203, _203, _1337);
        float _1341 = rsqrt(_1293);
        float _1343 = sqrt(_1339);
        float _1345 = _1281 * _1341;
        float _1347 = _1253 * _1341;
        float _1349 = _1285 * _1341;
        bool _1351 = _1343 > 0.0;
        _1317 = _1343;
        _1319 = _1349;
        if (!_1351)
        {
            _1323 = _1269;
        }
        float _1353 = _1323;
        _1325 = _1353;
        if (!_1351)
        {
            _1331 = _1273;
        }
        float _1355 = _1331;
        bool _1357 = !_1351;
        _1333 = _1355;
        if (!_1357)
        {
            float _1359 = rsqrt(_1339);
            float _1361 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1363 = _199 * _1359;
            float _1365 = _201 * _1359;
            float _1367 = _1347 * _1363;
            float _1369 = _203 * _1359;
            float _1371 = fma(_1345, _1365, _1367);
            float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1375 = fma(_1349, _1369, _1371);
            float _1377 = _1375 * _1373;
            float _1379 = fma(_199, _1377, _1243);
            float _1381 = fma(_201, _1377, _1269);
            float _1383 = fma(_203, _1377, _1273);
            _1245 = _1379;
            _1325 = _1381;
            _1333 = _1383;
            _1315 = _1361;
            _1317 = _1369;
        }
    }
    float _1385 = _1245;
    float _1387 = _1325;
    float _1389 = _1333;
    float _1391 = _1315;
    float _1393 = _1317;
    float _1395 = _1319;
    float _1397 = _1391;
    float _1399 = _1393;
    float _1401 = _1395;
    if (!_969)
    {
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1409 = _1405 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1407 * 0.15915493667125701904296875;
        float _1415 = _1405 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = 1.0 / _1411;
        float _1421 = _1413 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        float _1425 = _1417 * _1419;
        float _1427 = _1413 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1431;
        float _1435 = _1423 * _1425;
        float _1437 = 1.0 / _1435;
        float _1439 = 1.0 / _1433;
        float _1441 = _1429 * _1437;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1445 = fma(_1313, _1441, _1443);
        float _1447 = _1445 * _1439;
        float _1449 = precise::clamp(_1447, 0.0, 1.0);
        _1397 = _1405;
        _1399 = _1413;
        _1227 = _1449;
    }
    float _1451 = _1397;
    float _1453 = _1399;
    float _1455 = _1227;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1459 = _1385 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1463 = _1387 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1467 = _1389 + _1465;
    float _1469 = fma(_1269, 6.2500002968590706586837768554688e-05, 0.5);
    float _1471 = _1459 * _1459;
    float _1473 = fma(_1273, 6.2500002968590706586837768554688e-05, 0.5);
    float _1475 = fma(_1463, _1463, _1471);
    float _1477 = fma(_1467, _1467, _1475);
    float _1479 = rsqrt(_1477);
    float _1481 = sqrt(_1477);
    float _1483 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1485 = _1463 * _1483;
    float _1487 = _1467 * _1483;
    float _1489 = _1485 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 + _1491;
    float _1495 = sqrt(_1493);
    bool _1497 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = _1495 + _1499;
    float _1503 = _1467;
    float _1505 = _1453;
    float _1507 = _1501;
    float _1509 = _1451;
    float _1511 = _1459;
    if (_1497)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1513;
    }
    float _1515 = _1503;
    if (_1497)
    {
        float _1517 = rsqrt(_1493);
        _1505 = _1517;
    }
    float _1519 = _1505;
    float _1521 = _1519;
    if (_1497)
    {
        float _1523 = _1501 * _1515;
        _1507 = _1523;
    }
    float _1525 = _1507;
    if (_1497)
    {
        float _1527 = _1525 * 0.15915493667125701904296875;
        _1509 = _1527;
    }
    float _1529 = _1509;
    float _1531 = _1479;
    if (_1497)
    {
        float _1533 = _1529 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        _1531 = _1535;
    }
    float _1537 = _1531;
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1541 = precise::max(0.0, _1539);
    float _1543 = _1475;
    float _1545 = _1541;
    float _1547 = _1539;
    if (_1497)
    {
        float _1549 = _1529 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        _1543 = _1551;
    }
    float _1553 = _1543;
    float _1555 = -_1483;
    float _1557 = -_1541;
    float _1559 = fma(_1459, _1555, _1557);
    if (!_1497)
    {
        _1545 = _1485;
    }
    float _1561 = _1545;
    float _1563 = _1561;
    if (_1497)
    {
        float _1565 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1547 = _1565;
    }
    float _1567 = _1547;
    float _1569 = _1537;
    float _1571 = _1567;
    if (_1497)
    {
        float _1573 = fma(_1537, _1567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1511 = _1573;
    }
    float _1575 = _1511;
    float _1577 = _1575;
    if (!_1497)
    {
        _1569 = _1489;
    }
    float _1579 = _1569;
    float _1581 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1583 = _1579;
    float _1585 = _1553;
    if (_1497)
    {
        float _1587 = _1553 + (-1.0);
        _1571 = _1587;
    }
    float _1589 = _1571;
    float _1591 = _1589;
    if (_1497)
    {
        float _1593 = _1519 * _1575;
        _1401 = _1593;
    }
    float _1595 = _1401;
    if (!_1497)
    {
        _1577 = _1559;
    }
    float _1597 = _1577;
    float _1599 = floor(_1581);
    float _1601 = _1597;
    if (_1497)
    {
        float _1603 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1603;
    }
    float _1605 = _1521;
    if (_1497)
    {
        float _1607 = _1485 * _1595;
        _1563 = _1607;
    }
    float _1609 = _1563;
    if (!_1497)
    {
        _1591 = _1487;
    }
    float _1611 = _1591;
    float _1613 = _1611;
    if (_1497)
    {
        float _1615 = _1487 * _1595;
        _1613 = _1615;
    }
    float _1617 = _1613;
    if (_1497)
    {
        float _1619 = fma(_1559, _1553, _1605);
        _1601 = _1619;
    }
    float _1621 = _1601;
    if (_1497)
    {
        float _1623 = _1609 * _1609;
        _1583 = _1623;
    }
    float _1625 = _1583;
    if (!_1497)
    {
        _1585 = _1491;
    }
    float _1627 = _1585;
    float _1629 = _1627;
    if (_1497)
    {
        float _1631 = _1617 * _1617;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = fma(_1621, _1621, _1625);
    float _1637 = _1635 + _1633;
    float _1639 = fma(_1105, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1641 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1645 = fma(_1481, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1643);
    float _1647 = precise::clamp(_1645, 0.0, 1.0);
    float _1649 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1651 = floor(_1639);
    float _1653 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = -_1599;
    float _1661 = _1581 + _1659;
    float _1663 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1653);
    float _1665 = rsqrt(_1637);
    float _1667 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = abs(_1657);
    float _1671 = log2(_1669);
    float _1673 = -_1651;
    float _1675 = _1639 + _1673;
    float _1677 = _1665 * _1609;
    float _1679 = _1665 * _1621;
    float _1681 = _1665 * _1617;
    float _1683 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1689 = _1679 + 1.0;
    float _1691 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1683);
    float _1693 = -_1685;
    float _1695 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1693);
    float _1697 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1699 = -_1687;
    float _1701 = fma(_1699, _1649, 1.0);
    float _1703 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1691);
    float _1705 = -_1681;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1695);
    float _1709 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1697);
    float _1711 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1713 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1709);
    float _1719 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1711);
    float _1721 = fma(_1707, 0.5, 0.5);
    float _1723 = sqrt(_1715);
    float _1725 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1727 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1729 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1719);
    float _1731 = fma(_1721, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1733 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1727);
    float _1735 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1737 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1739 = log2(_1701);
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1733);
    float _1743 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1745 = fma(_1721, _1731, -0.212114393711090087890625);
    float _1747 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1741);
    float _1749 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1751 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1743);
    float _1753 = exp2(_1737);
    float2 _5596 = float2(_1675, _1661);
    float _1755 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5596, float2(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5596, float2(0.0), isnan(_5596)), level(0.0)).x;
    float _1757 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1749);
    float _1759 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1761 = fma(_1721, _1745, 1.570728778839111328125);
    float _1763 = _1723 * 0.636619746685028076171875;
    float _1765 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1757);
    float _1767 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1759);
    float _1769 = 1.0 / _1747;
    float _1771 = _1739 * 0.693147182464599609375;
    float _1773 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1765);
    float _1775 = -_1761;
    float _1777 = fma(_1763, _1775, 1.0);
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = -_1679;
    float _1783 = fma(_1753, _1689, _1781);
    float _1785 = fma(_1783, 0.5, 0.5);
    float _1787 = _1773 * _1769;
    float _1789 = _1767 * _1769;
    float _1791 = fma(_1787, 0.5, 0.5);
    float _1793 = fma(_1789, -0.5, 0.5);
    float3 _5671 = float3(_1791, _1793, _1779);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).x;
    float3 _5682 = float3(_1791, _1793, _1779);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5682, float3(0.0), isnan(_5682)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5682, float3(0.0), isnan(_5682)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5698 = float2(_1777, _1785);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5698, float2(0.0), isnan(_5698)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5698, float2(0.0), isnan(_5698)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float2 _5712 = float2(_1469, _1473);
    float3 _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5712, float2(0.0), isnan(_5712)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5712, float2(0.0), isnan(_5712)), level(0.0)).xyz;
    float _1820 = _1818.x;
    float _1822 = _1818.y;
    float _1824 = _1818.z;
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1828 = _723 + 0.5;
    float _1830 = -_735;
    float _1832 = _1830 + 0.5;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1836 = _1834 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1838 = _599 > 0.5;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1848 = 1.0 / _1836;
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1854 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1856 = _593 > 0.5;
    float _1858 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1862 = _1860 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1864 = 1.0 / _1846;
    float _1866 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1870 = _1868 != 0;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1874 = _1872 != 0;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1878 = _1876 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1882 = _1880 != 0;
    float _1884 = 1.0 / _1842;
    float _1886 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1866);
    bool _1888 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1890 = isnan(_589);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1886);
    float _1902 = 1.0 / _1852;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1912 = 1.0 / _1906;
    float _1914 = -_207;
    int _1916 = _1856 ? as_type<int>(_1914) : as_type<int>(_207);
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1920 = _1918 != 0;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1926 = !_1870;
    float _1928 = _1926 ? _207 : as_type<float>(_1916);
    float _1930 = 1.0 / _1878;
    float _1932 = _1928 + 0.5;
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1942 = 1.0 / _1862;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1944;
    float _1948 = _1936 * _1884;
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1954 = _1940 * _1848;
    float _1956 = 1.0 / _1910;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1962 = 1.0 / _1924;
    float _1964 = _1946 * _1864;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1966;
    bool _1970 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1972 = isnan(_589);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    float _1982 = _1968 * _1902;
    float _1984 = 1.0 / _1960;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1986;
    float _1990 = _1952 * _1912;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1996;
    float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2004 = _1988 * _1942;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2008 = _591 + _2006;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2012 = _591 + _2010;
    float _2014 = _1994 * _1930;
    float _2016 = _2002 * _1962;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2020 = _591 + _2018;
    float _2022 = fma(_1948, _2012, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2024 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2026 = isnan(_589);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2036;
    float _2040 = fma(_1954, _2008, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2042 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2044 = isnan(_589);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    float _2054 = fma(_1964, _2020, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2058 = _589 + _2056;
    float _2060 = _2038 * _1984;
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2064 = _589 + _2062;
    float _2066 = -_2034;
    float _2068 = _2066 + 1.0;
    bool _2070 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2072 = isnan(_589);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2078 = _2074 || _2076;
    float _2080 = float(_2078);
    float _2082 = -_2052;
    float _2084 = _2082 + 1.0;
    float _2086 = fma(_1982, _2058, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2088 = fma(_1990, _2064, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2090 = _2052 * _2068;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2094 = _589 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2098 = _589 + _2096;
    float _2100 = _2080 * _2084;
    float _2102 = -_2080;
    float _2104 = _2102 + 1.0;
    bool _2106 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2108 = isnan(_589);
    bool _2110 = _2106 || _2108;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2114 = _2110 || _2112;
    float _2116 = float(_2114);
    float _2118 = fma(_2004, _2094, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2120 = fma(_2014, _2098, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2122 = _1980 * _2104;
    float _2124 = -_1980;
    float _2126 = _2124 + 1.0;
    float _2128 = _1998 * _1956;
    bool _2130 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2132 = isnan(_589);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2138 = _2134 || _2136;
    float _2140 = float(_2138);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2144 = _589 + _2142;
    float _2146 = -_2116;
    float _2148 = _2146 + 1.0;
    float _2150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2152 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2154 = isnan(_591);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_2128, _2144, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _2166 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2168 = isnan(_589);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    float _2178 = _2140 * _2148;
    float _2180 = -_2140;
    float _2182 = _2180 + 1.0;
    float _2184 = -_2162;
    float _2186 = _2184 + 1.0;
    float _2188 = _2116 * _2126;
    float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2192 = _589 + _2190;
    float _2194 = _2176 * _2182;
    float _2196 = -_2176;
    float _2198 = _2196 + 1.0;
    bool _2200 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2202 = isnan(_591);
    bool _2204 = _2200 || _2202;
    bool _2206 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2208 = _2204 || _2206;
    float _2210 = float(_2208);
    float _2212 = fma(_2016, _2192, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2216 = _589 + _2214;
    float _2218 = _1898 * _2198;
    float _2220 = -_1898;
    float _2222 = _2220 + 1.0;
    float _2224 = -_2210;
    float _2226 = _2224 + 1.0;
    float _2228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2230 = _2086 * _2218;
    bool _2232 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2234 = isnan(_591);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    float _2244 = _2162 * _2226;
    bool _2246 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2248 = isnan(_591);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2230);
    float _2260 = -_191;
    int _2262 = _683 ? as_type<int>(_2260) : as_type<int>(_191);
    float _2264 = _2242 * _2186;
    float _2266 = -_2242;
    float _2268 = _2266 + 1.0;
    float _2270 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2272 = fma(_2088, _2194, _2258);
    float _2274 = -_207;
    int _2276 = _711 ? as_type<int>(_2274) : as_type<int>(_207);
    float _2278 = _2256 * _2268;
    float _2280 = -_2256;
    float _2282 = _2280 + 1.0;
    bool _2284 = !_1874;
    float _2286 = _2284 ? _191 : as_type<float>(_2262);
    float _2288 = fma(_2060, _2216, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2290 = _2022 * _2278;
    float _2292 = fma(_2118, _2178, _2272);
    bool _2294 = !_1920;
    float _2296 = _2294 ? _207 : as_type<float>(_2276);
    float _2298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2300 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2290);
    float _2302 = _2286 + (-0.5);
    float _2304 = fma(_2120, _2188, _2292);
    float _2306 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2308 = fma(_2040, _2264, _2300);
    float _2310 = _2296 + 0.5;
    float _2312 = -_1858;
    float _2314 = -_685;
    float _2316 = fma(_2312, _2302, _2314);
    float _2318 = -_191;
    int _2320 = _1838 ? as_type<int>(_2318) : as_type<int>(_191);
    float _2322 = fma(_2054, _2244, _2308);
    float _2324 = fma(_2306, _2310, _815);
    float _2326 = abs(_1313);
    float _2328 = log2(_2326);
    float _2330 = fma(_2164, _2122, _2304);
    float _2332 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2334 = !_1882;
    float _2336 = _2334 ? _191 : as_type<float>(_2320);
    float _2338 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2322);
    float _2340 = fma(_2212, _2100, _2330);
    float _2342 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2344 = -_887;
    float _2346 = _2344 + 1.0;
    float _2348 = _2336 + (-0.5);
    float _2350 = fma(_2288, _2090, _2340);
    float _2352 = -_903;
    float _2354 = _2352 + 1.0;
    float _2356 = -_881;
    float _2358 = _2356 + 1.0;
    float _2360 = fma(_2270, _1932, _645);
    float _2362 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2364 = -_2342;
    float _2366 = -_823;
    float _2368 = fma(_2364, _2348, _2366);
    float _2370 = -_895;
    float _2372 = _2370 + 1.0;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2380 = exp2(_2362);
    float _2382 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2384 = -_2358;
    float _2386 = fma(_1928, _2384, _2360);
    float _2388 = fma(_2286, _2354, _2316);
    float _2390 = -_2346;
    float _2392 = fma(_2296, _2390, _2324);
    float _2394 = fma(_2336, _2372, _2368);
    float _2396 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2350);
    float _2400 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2402 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2404 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2406 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2410 = _2338 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _2386;
    out.m_68.y = _2388;
    out.m_68.z = _2392;
    out.m_68.w = _2394;
    float _2412 = -_1029;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2400);
    float _2416 = -_1029;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2402);
    float _2420 = -_1029;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2404);
    float _2424 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2426 = precise::clamp(_2424, 0.0, 1.0);
    out.m_70.x = _2396;
    out.m_70.y = _2406;
    out.m_70.z = _2408;
    out.m_70.w = _2410;
    float _2428 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2414);
    float _2430 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2418);
    float _2432 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2422);
    float _2434 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2436 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2438 = exp2(_1854);
    float _2440 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2442 = _1313 <= 8000.0;
    bool _2444 = isnan(_1313);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan(8000.0);
    bool _2450 = _2446 || _2448;
    float _2452 = float(_2450);
    float _2454 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2456 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2458 = _2440 * _2428;
    float _2460 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2454);
    float _2462 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2464 = fma(_2426, -2.0, 3.0);
    float _2466 = _2426 * _2426;
    float _2468 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2470 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2456);
    float _2472 = in.m_72.x;
    float _2474 = _2466 * _2464;
    float _2476 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2468);
    float _2478 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2460);
    float _2480 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2482 = -_2474;
    float _2484 = _2482 + 1.0;
    float _2486 = _2440 * _2430;
    float _2488 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2470);
    float _2490 = _2440 * _2432;
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2474);
    float _2494 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2496 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2434);
    float _2498 = fma(_2480, _2478, _2458);
    float _2500 = _2452 * _2492;
    float _2502 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1900);
    float _2504 = _1747 * 0.5;
    float _2506 = fma(_2480, _2488, _2486);
    float _2508 = fma(_2480, _2494, _2490);
    float _2510 = -_2438;
    float _2512 = _2510 + 1.0;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2516 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2496);
    float _2518 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2520 = _2502 + _1747;
    float _2522 = _1773 + _1747;
    float _2524 = fma(_1767, -0.5, _2504);
    float _2526 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2528 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2530 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2462);
    float _2532 = _2520 * 0.5;
    float _2534 = -_1755;
    float _2536 = _2534 + 1.0;
    float _2538 = _2522 * 0.5;
    float _2540 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2542 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2530);
    float _2544 = _2536 * _2518;
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    out.gl_Position.x = _1773;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _2502;
    out.gl_Position.w = _1747;
    float _2548 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2540);
    float _2550 = _2542 + _2498;
    float _2552 = -_2546;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_74.x = _2538;
    out.m_74.y = _2524;
    out.m_74.z = _2532;
    out.m_74.w = _1747;
    float _2556 = _2332 * _2514;
    float _2558 = _2516 + _2506;
    float _2560 = _2554 * _2472;
    float _2562 = _2382 * _2528;
    float _2564 = _2548 + _2508;
    out.m_76.x = _2398;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2568 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2570 = isnan(_1481);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2576 = _2572 || _2574;
    float _2578 = -_2526;
    float _2580 = _2578 + 1.0;
    out.m_78.x = _2556;
    out.m_78.y = _2562;
    out.m_80.x = _2566;
    out.m_82.x = _2550;
    out.m_82.y = _2558;
    out.m_82.z = _2564;
    float _2582 = _1747;
    float _2584 = _2502;
    float _2586 = _1767;
    float _2588 = _2580;
    float _2590 = _2560;
    float _2592 = _1820;
    if (!_2576)
    {
        _2582 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2594 = _2582;
    float _2596 = _2526 * _1795;
    float _2598 = _1806 * _2580;
    float _2600 = _2594;
    float _2602 = _2594;
    if (!_2576)
    {
        _2584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2604 = _2584;
    float _2606 = _1806 * _2596;
    float _2608 = _1816 * _2596;
    out.m_84.x = _1820;
    out.m_84.y = _1822;
    out.m_84.z = _1824;
    float _2610 = _2604;
    float _2612 = _2604;
    if (!_2576)
    {
        _2586 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2614 = _2586;
    float _2616 = fma(_1812, _2606, _1800);
    float _2618 = fma(_1814, _2606, _1802);
    float _2620 = fma(_1806, _2608, _1804);
    float _2622 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2624 = _2614;
    float _2626 = _2614;
    if (!_2576)
    {
        _2588 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2628 = _2588;
    float _2630 = _2628;
    float _2632 = _2628;
    if (!_2576)
    {
        _2590 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2634 = _2590;
    out.m_86.x = _2616;
    out.m_86.y = _2618;
    out.m_86.z = _2620;
    out.m_86.w = _2598;
    float _2636 = _2634;
    float _2638 = _2634;
    if (!_2576)
    {
        _2592 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2640 = _2592;
    bool _2642 = !_2576;
    float _2644 = _2640;
    float _2646 = _2640;
    if (!_2642)
    {
        bool _2648 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2650 = isnan(_1481);
        bool _2652 = _2648 || _2650;
        bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2656 = _2652 || _2654;
        if (!_2656)
        {
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2660 = _1481 + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2664 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2662;
            float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2670 = 1.0 / _2664;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2688 = _2660 * _2670;
            float _2690 = precise::clamp(_2688, 0.0, 1.0);
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2696 = fma(_2690, _2668, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2698 = fma(_2690, _2694, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2700 = fma(_2690, _2674, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2702 = fma(_2690, _2678, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2704 = fma(_2690, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2706 = fma(_2690, _2686, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2612 = _2700;
            _2638 = _2704;
            _2602 = _2696;
            _2632 = _2702;
            _2626 = _2698;
            _2646 = _2706;
            _2708 = true;
        }
        else
        {
            bool _2710 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2712 = isnan(_1481);
            bool _2714 = _2710 || _2712;
            bool _2716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2718 = _2714 || _2716;
            if (!_2718)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2720 = _2600;
            _2602 = _2720;
            if (!_2718)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2722 = _2610;
            _2612 = _2722;
            if (!_2718)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2724 = _2624;
            _2626 = _2724;
            if (!_2718)
            {
                _2630 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2726 = _2630;
            _2632 = _2726;
            if (!_2718)
            {
                _2636 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2728 = _2636;
            _2638 = _2728;
            if (!_2718)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2730 = _2644;
            bool _2732 = !_2718;
            _2646 = _2730;
            if (!_2732)
            {
                bool _2734 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2736 = isnan(_1481);
                bool _2738 = _2734 || _2736;
                bool _2740 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2742 = _2738 || _2740;
                if (!_2742)
                {
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2746 = _1481 + _2744;
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2748;
                    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2756 = 1.0 / _2750;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2774 = _2746 * _2756;
                    float _2776 = precise::clamp(_2774, 0.0, 1.0);
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2782 = fma(_2776, _2754, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2784 = fma(_2776, _2780, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2786 = fma(_2776, _2760, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2788 = fma(_2776, _2764, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2790 = fma(_2776, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2792 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2612 = _2786;
                    _2638 = _2790;
                    _2602 = _2782;
                    _2632 = _2788;
                    _2626 = _2784;
                    _2646 = _2792;
                    _2708 = true;
                }
                else
                {
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2638 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2632 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2708 = false;
    float _2794 = _2612;
    float _2796 = _2638;
    float _2798 = _2602;
    float _2800 = _2632;
    float _2802 = _2626;
    float _2804 = _2646;
    float _2806 = fma(_2558, -0.5, 0.5);
    float _2808 = precise::clamp(_2806, 0.0, 1.0);
    float _2810 = -_2794;
    float _2812 = _2810 + _2796;
    float _2814 = _2622 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2816 = -_2798;
    float _2818 = _2816 + _2800;
    float _2820 = fma(_2808, _2812, _2794);
    out.m_88.x = 0.0;
    float _2822 = -_2802;
    float _2824 = _2822 + _2804;
    float _2826 = fma(_2808, _2818, _2798);
    float _2828 = _2820 * 0.586610972881317138671875;
    out.m_51.x = _2814;
    bool _2830 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2832 = fma(_2808, _2824, _2802);
    float _2834 = fma(_2826, 0.298911988735198974609375, _2828);
    bool _2836 = _1455 > 0.0;
    bool _2838 = isnan(_1455);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan(0.0);
    bool _2844 = _2840 || _2842;
    float _2846 = fma(_2832, 0.114477999508380889892578125, _2834);
    float _2848 = -_2846;
    float _2850 = _2820 + _2848;
    float _2852 = -_2846;
    float _2854 = _2826 + _2852;
    float _2856 = -_2846;
    float _2858 = _2832 + _2856;
    float _2860 = fma(_2850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    float _2862 = fma(_2854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    float _2864 = fma(_2858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    bool _2866 = !_2830;
    if (!_2866)
    {
        float _2868 = -_1385;
        float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2872 = -_1387;
        float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2876 = -_1389;
        float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2880 = _2870 * _2870;
        float _2882 = fma(_2874, _2874, _2880);
        float _2884 = fma(_2878, _2878, _2882);
        float _2886 = sqrt(_2884);
        float _2888 = rsqrt(_2884);
        float _2890 = -_2886;
        float _2892 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2894 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2896 = precise::clamp(_2894, 0.0, 1.0);
        float _2898 = _2874 * _2888;
        float _2900 = _2870 * _2888;
        float _2902 = abs(_2896);
        float _2904 = log2(_2902);
        float _2906 = _2878 * _2888;
        float _2908 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2910 = _2558 * _2900;
        float _2912 = -_2900;
        float _2914 = -_2908;
        float _2916 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2914);
        float _2918 = fma(_2550, _2898, _2910);
        float _2920 = -_2906;
        float _2922 = fma(_2920, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2916);
        float _2924 = fma(_2564, _2906, _2918);
        float _2926 = precise::clamp(_2924, 0.0, 1.0);
        float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2930 = _2922 + _2928;
        float _2932 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2934 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = exp2(_2932);
        float _2940 = _2938 * _2936;
        float _2942 = _2926 * _2940;
        float _2944 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2946 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2948 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2944;
        out.m_88.y = _2946;
        out.m_88.z = _2948;
    }
    out.m_90.x = _2862;
    out.m_90.y = _2860;
    out.m_90.z = _2864;
    if (_2844)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2950 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2950;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2708 = false;
    bool _581 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3006 = as_type<float>(_123);
        out.gl_Position.z = _3006;
    }
    if (!_113)
    {
        return out;
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_109);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3076 = as_type<float>(_163);
        out.gl_Position.z = _3076;
    }
    if (_155)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_179;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_175;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_181;
    float _227;
    if (!_209)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _141 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _237 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    float _263 = 1.0 / _253;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _261;
    bool _269 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_237);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _257;
    float _283 = _241 * _263;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _245 * _267;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_279;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -_309;
    float _319 = _317 + 1.0;
    float _321 = _249 * _281;
    float _323 = -_295;
    float _325 = _323 + 1.0;
    bool _327 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_237);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _279 * _325;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_341, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _337 * _319;
    float _361 = fma(_351, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_345, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_355, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = _357 * _359;
    float _373 = _361 * _359;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_363, _315, _379);
    float _391 = fma(_383, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _315, _385);
    float _395 = fma(_387, _347, _389);
    float _397 = fma(_391, _347, _393);
    float _399 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_265;
    float _421;
    if (!_403)
    {
        float _405 = in.m_60.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_109);
        float _427 = 1.0 / _425;
        float _429 = _141 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _437 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = isnan(_431);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _455 = isnan(_431);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = 1.0 / _435;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = -_447;
    float _473 = _471 + 1.0;
    bool _475 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_431);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    bool _487 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _489 = 1.0 / _451;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _495 = _469 * _465;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _431 + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _431 + _501;
    float _505 = fma(_495, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = _463 * _473;
    float _509 = -_463;
    float _511 = _509 + 1.0;
    float _513 = _493 * _489;
    float _515 = -_485;
    float _517 = _515 + 1.0;
    float _519 = _505 * _507;
    float _521 = fma(_513, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _523 = _447 * _517;
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _527 = fma(_521, _523, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _527);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _543 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = in.m_62.x;
    float _547 = in.m_62.y;
    out.m_64.x = _537;
    out.m_64.y = _539;
    out.m_64.z = _543;
    out.m_64.w = _541;
    float _549 = _401 * _547;
    float _551 = _399 * _545;
    bool _553 = !_487;
    float _577;
    float _579;
    if (!_553)
    {
        float _555 = in.m_60.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _559 = float(_109);
        float _561 = 1.0 / _559;
        float _563 = _555 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _565 = _141 * _561;
        float _567 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _569 = _567 * _557;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _565;
        _579 = _575;
        _581 = true;
    }
    else
    {
        float _583 = float(_109);
        float _585 = 1.0 / _583;
        float _587 = _141 * _585;
        _577 = _587;
        _579 = _587;
    }
    _581 = false;
    float _589 = _577;
    float _591 = _579;
    float _593 = in.m_60.x;
    float _595 = in.m_60.y;
    float _597 = in.m_60.z;
    float _599 = in.m_60.w;
    float _601 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _603 = log2(_601);
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _607 = _605 != 0;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _611 = _603 * _141;
    float _613 = _597 * 2.0;
    float _615 = _593 * 2.0;
    float _617 = _595 + _593;
    float _619 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _621 = floor(_613);
    float _623 = _617 + (-1.0);
    float _625 = -_609;
    float _627 = fma(_619, 2.0, _625);
    float _629 = _619;
    if (!_607)
    {
        _629 = _595;
    }
    float _631 = _629;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _635 = _595 * 2.0;
    float _637 = _631;
    if (_607)
    {
        _637 = _593;
    }
    float _639 = _637;
    float _641 = floor(_615);
    float _643 = -_141;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _649 = _621 > 0.0;
    float _651 = floor(_635);
    bool _653 = _621 >= 0.0;
    bool _655 = isnan(_621);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _665 = _595 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _667 = _661 ? 0 : 1;
    bool _669 = _641 > 0.0;
    float _671 = fma(_665, -2.0, _663);
    bool _673 = _641 >= 0.0;
    bool _675 = isnan(_641);
    bool _677 = _673 || _675;
    bool _679 = isnan(0.0);
    bool _681 = _677 || _679;
    bool _683 = _595 > 0.5;
    float _685 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _671);
    int _687 = ~_667;
    int _689 = _687 + 1;
    int _691 = _689 + 1;
    int _693 = _691;
    float _695 = _663;
    if (!_649)
    {
        int _697 = ~_667;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _709 = _707 != 0;
    bool _711 = _597 > 0.5;
    float _713 = -_207;
    float _715 = _683 ? _713 : _207;
    float _717 = -_191;
    int _719 = _711 ? as_type<int>(_717) : as_type<int>(_191);
    bool _721 = !_705;
    float _723 = _721 ? _207 : _715;
    float _725 = _715;
    if (!_607)
    {
        _695 = _597;
    }
    float _727 = _695;
    float _729 = _727;
    if (!_607)
    {
        _725 = _597;
    }
    float _731 = _725;
    bool _733 = !_709;
    float _735 = _733 ? _191 : as_type<float>(_719);
    float _737 = _731;
    if (_607)
    {
        _729 = _595;
    }
    float _739 = _729;
    if (_607)
    {
        _737 = _595;
    }
    float _741 = _737;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _753 = _751 != 0;
    float _755 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[83].w, _647);
    int _757 = _681 ? 0 : 1;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _761 = _651 > 0.0;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _765 = !_745;
    int _767 = _765 ? 0 : 1;
    bool _769 = _651 >= 0.0;
    bool _771 = isnan(_651);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _781 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[83].z, _759);
    float _783 = _639 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _785 = _777 ? 0 : 1;
    float _787 = _739 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _789 = -_779;
    float _791 = fma(_783, 2.0, _789);
    int _793 = ~_785;
    int _795 = _793 + 1;
    int _797 = _795 + 1;
    float _799 = exp2(_611);
    int _801 = abs(_767);
    float _803 = fma(_787, -2.0, _763);
    int _805 = _797;
    if (!_761)
    {
        int _807 = ~_785;
        int _809 = _807 + 1;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = -_141;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[81].x, _791);
    float _817 = in.m_66.x;
    float _819 = in.m_66.y;
    float _821 = in.m_66.z;
    float _823 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _803);
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = float(_701);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = float(_801);
    float _845 = 1.0 / _837;
    float _847 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    int _849 = ~_757;
    int _851 = _849 + 1;
    int _853 = _851 + 1;
    float _855 = -_799;
    float _857 = _855 + 1.0;
    int _859 = _853;
    if (!_669)
    {
        int _861 = ~_757;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = _843 * _839;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _871 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _879 = _875 || _877;
    float _881 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _847);
    bool _883 = !_749;
    int _885 = _883 ? 0 : 1;
    float _887 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _781);
    float _889 = _867 * (-2.0);
    float _891 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _893 = _879 ? _857 : 0.0;
    float _895 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _755);
    int _897 = abs(_885);
    float _899 = _593 + (-0.5);
    float _901 = fma(_889, _817, _817);
    float _903 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    bool _905 = !_753;
    int _907 = _905 ? 0 : 1;
    if (_833)
    {
        float _909 = _893 * _845;
        _145 = _909;
    }
    float _911 = _145;
    float _913 = float(_865);
    float _915 = fma(_633, _889, _633);
    float _917 = float(_897);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[196].x, _901);
    int _921 = abs(_907);
    float _923 = _595 + _597;
    float _925 = _917 * _913;
    float _927 = fma(_915, _911, _919);
    float _929 = float(_811);
    float _931 = _923 + (-1.0);
    float _933 = float(_921);
    float _935 = _925 * (-2.0);
    float _937 = _595 + (-0.5);
    float _939 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _941 = _597 + _593;
    float _943 = _933 * _929;
    float _945 = fma(_935, _819, _819);
    float _947 = _597 + (-0.5);
    float _949 = _941 + (-1.0);
    float _951 = _943 * (-2.0);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].y, _945);
    float _955 = fma(_939, _935, _939);
    float _957 = _927 * 0.15915493667125701904296875;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    bool _961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _963 = isnan(0.5);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _969 = _965 || _967;
    float _971 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _973 = fma(_951, _821, _821);
    float _975 = fma(_955, _911, _953);
    float _977 = _957 * 6.283185482025146484375;
    float _979 = cos(_977);
    float _981 = fma(_971, _951, _971);
    float _983 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[196].z, _973);
    float _985 = _975 * 0.15915493667125701904296875;
    float _987 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _989 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _991 = fma(_981, _911, _983);
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _995 = _985 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = in.m_48.x;
    float _1001 = in.m_48.y;
    float _1003 = in.m_48.z;
    float _1005 = _991 * 0.15915493667125701904296875;
    float _1007 = _987 * _993;
    float _1009 = _989 * _959;
    float _1011 = _985 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = _957 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = _979 * _997;
    float _1021 = _1005 * 6.283185482025146484375;
    float _1023 = cos(_1021);
    float _1025 = _979 * _1013;
    float _1027 = _1005 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _1017 * _997;
    float _1033 = _1017 * _1013;
    float _1035 = _979 * _1023;
    float _1037 = _1017 * _1023;
    float _1039 = _1013 * _1023;
    float _1041 = _997 * _1023;
    float _1043 = _1035 * _1009;
    float _1045 = _1037 * _1009;
    float _1047 = fma(_1029, _1025, _1031);
    float _1049 = -_1019;
    float _1051 = fma(_1029, _1033, _1049);
    float _1053 = -_1033;
    float _1055 = fma(_1029, _1019, _1053);
    float _1057 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1059 = -_1009;
    float _1061 = _1029 * _1059;
    float _1063 = fma(_1047, _1007, _1043);
    float _1065 = fma(_1029, _1031, _1025);
    float _1067 = fma(_1051, _1007, _1045);
    float _1069 = fma(_1039, _1007, _1061);
    float _1071 = fma(_1055, _1057, _1063);
    float _1073 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1075 = fma(_1065, _1057, _1067);
    float _1077 = fma(_1041, _1057, _1069);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1083 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1073);
    float _1085 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1087 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1089 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1081);
    float _1091 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1083);
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1085);
    float _1095 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1097 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1089);
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1107 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = _1099 + _1103;
    float _1113 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1107);
    float _1115 = _1105 + _1109;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1119 = _1111 + _1117;
    float _1121 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1113);
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1125 = _1115 + _1123;
    float _1127 = _1119 * _1119;
    float _1129 = fma(_1125, _1125, _1127);
    float _1131 = sqrt(_1129);
    bool _1133 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _1131 + _1135;
    float _1139 = _1103;
    float _1141 = _1137;
    float _1143 = _1121;
    float _1145 = _1071;
    float _1147 = _1115;
    float _1149 = _1111;
    if (_1133)
    {
        float _1151 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1139 = _1151;
    }
    float _1153 = _1139;
    if (_1133)
    {
        float _1155 = _1137 * _1153;
        _1141 = _1155;
    }
    float _1157 = _1141;
    float _1159 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = 0.0;
    if (_1133)
    {
        float _1163 = _1157 * 0.15915493667125701904296875;
        _1161 = _1163;
    }
    float _1165 = _1161;
    float _1167 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1169 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1171 = _985;
    float _1173 = _1165;
    if (_1133)
    {
        float _1175 = _1165 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1171 = _1177;
    }
    float _1179 = _1171;
    float _1181 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1167);
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1187 = _1159;
    float _1189 = _1183;
    float _1191 = _1185;
    if (_1133)
    {
        float _1193 = _1165 * 6.283185482025146484375;
        float _1195 = sin(_1193);
        _1187 = _1195;
    }
    float _1197 = _1187;
    float _1199 = _1169 + _1183;
    float _1201 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1185);
    float _1203 = _1199;
    if (_1133)
    {
        float _1205 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1205;
    }
    float _1207 = _1143;
    float _1209 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1201);
    float _1211 = _1075;
    float _1213 = _1207;
    if (_1133)
    {
        float _1215 = rsqrt(_1129);
        _1211 = _1215;
    }
    float _1217 = _1211;
    if (_1133)
    {
        float _1219 = _1179 + (-1.0);
        _1189 = _1219;
    }
    float _1221 = _1189;
    float _1223 = _1221;
    if (_969)
    {
        _1173 = 1.0;
    }
    float _1225 = _1173;
    float _1227 = _1225;
    if (_1133)
    {
        float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1229;
    }
    float _1231 = _1191;
    if (!_1133)
    {
        _1223 = _1111;
    }
    float _1233 = _1223;
    float _1235 = _1233;
    if (_1133)
    {
        float _1237 = fma(_1197, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1145 = _1237;
    }
    float _1239 = _1145;
    if (_1133)
    {
        float _1241 = fma(_1199, _1179, _1231);
        _1203 = _1241;
    }
    float _1243 = _1203;
    float _1245 = _1243;
    if (!_1133)
    {
        _1213 = _1115;
    }
    float _1247 = _1213;
    float _1249 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1251 = -_1169;
    float _1253 = _1251 + _1243;
    float _1255 = _1217;
    float _1257 = _1247;
    if (_1133)
    {
        float _1259 = _1217 * _1239;
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1265 = _1253 * _1253;
    if (_1133)
    {
        float _1267 = fma(_1125, _1261, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1257 = _1267;
    }
    float _1269 = _1257;
    if (_1133)
    {
        float _1271 = fma(_1119, _1261, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1235 = _1271;
    }
    float _1273 = _1235;
    float _1275 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1249);
    float _1277 = 1.0 / _1263;
    float _1279 = -_1105;
    float _1281 = _1279 + _1269;
    float _1283 = -_1099;
    float _1285 = _1283 + _1273;
    float _1287 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1275);
    float _1289 = fma(_1281, _1281, _1265);
    float _1291 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1293 = fma(_1285, _1285, _1289);
    float _1295 = _1291 + _1263;
    float _1297 = sqrt(_1293);
    float _1299 = _1295 * _1277;
    float _1301 = _1299 * 0.5;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1305 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1303);
    float _1307 = 1.0 / _1305;
    bool _1309 = _1297 > 0.0;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1313 = _1307 * _1311;
    float _1315 = _1293;
    float _1317 = _1277;
    float _1319 = _1285;
    if (!_1309)
    {
        _1147 = _1269;
    }
    float _1321 = _1147;
    float _1323 = _1321;
    float _1325 = _1321;
    if (!_1309)
    {
        _1149 = _1273;
    }
    float _1327 = _1149;
    bool _1329 = !_1309;
    float _1331 = _1327;
    float _1333 = _1327;
    if (!_1329)
    {
        float _1335 = _199 * _199;
        float _1337 = fma(_201, _201, _1335);
        float _1339 = fma(_203, _203, _1337);
        float _1341 = rsqrt(_1293);
        float _1343 = sqrt(_1339);
        float _1345 = _1281 * _1341;
        float _1347 = _1253 * _1341;
        float _1349 = _1285 * _1341;
        bool _1351 = _1343 > 0.0;
        _1317 = _1343;
        _1319 = _1349;
        if (!_1351)
        {
            _1323 = _1269;
        }
        float _1353 = _1323;
        _1325 = _1353;
        if (!_1351)
        {
            _1331 = _1273;
        }
        float _1355 = _1331;
        bool _1357 = !_1351;
        _1333 = _1355;
        if (!_1357)
        {
            float _1359 = rsqrt(_1339);
            float _1361 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1363 = _199 * _1359;
            float _1365 = _201 * _1359;
            float _1367 = _1347 * _1363;
            float _1369 = _203 * _1359;
            float _1371 = fma(_1345, _1365, _1367);
            float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1375 = fma(_1349, _1369, _1371);
            float _1377 = _1375 * _1373;
            float _1379 = fma(_199, _1377, _1243);
            float _1381 = fma(_201, _1377, _1269);
            float _1383 = fma(_203, _1377, _1273);
            _1245 = _1379;
            _1325 = _1381;
            _1333 = _1383;
            _1315 = _1361;
            _1317 = _1369;
        }
    }
    float _1385 = _1245;
    float _1387 = _1325;
    float _1389 = _1333;
    float _1391 = _1315;
    float _1393 = _1317;
    float _1395 = _1319;
    float _1397 = _1391;
    float _1399 = _1393;
    float _1401 = _1395;
    if (!_969)
    {
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1409 = _1405 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1407 * 0.15915493667125701904296875;
        float _1415 = _1405 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = 1.0 / _1411;
        float _1421 = _1413 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        float _1425 = _1417 * _1419;
        float _1427 = _1413 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1431;
        float _1435 = _1423 * _1425;
        float _1437 = 1.0 / _1435;
        float _1439 = 1.0 / _1433;
        float _1441 = _1429 * _1437;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1445 = fma(_1313, _1441, _1443);
        float _1447 = _1445 * _1439;
        float _1449 = precise::clamp(_1447, 0.0, 1.0);
        _1397 = _1405;
        _1399 = _1413;
        _1227 = _1449;
    }
    float _1451 = _1397;
    float _1453 = _1399;
    float _1455 = _1227;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1459 = _1385 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1463 = _1387 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1467 = _1389 + _1465;
    float _1469 = fma(_1269, 6.2500002968590706586837768554688e-05, 0.5);
    float _1471 = _1459 * _1459;
    float _1473 = fma(_1273, 6.2500002968590706586837768554688e-05, 0.5);
    float _1475 = fma(_1463, _1463, _1471);
    float _1477 = fma(_1467, _1467, _1475);
    float _1479 = rsqrt(_1477);
    float _1481 = sqrt(_1477);
    float _1483 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1485 = _1463 * _1483;
    float _1487 = _1467 * _1483;
    float _1489 = _1485 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 + _1491;
    float _1495 = sqrt(_1493);
    bool _1497 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = _1495 + _1499;
    float _1503 = _1467;
    float _1505 = _1453;
    float _1507 = _1501;
    float _1509 = _1451;
    float _1511 = _1459;
    if (_1497)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1513;
    }
    float _1515 = _1503;
    if (_1497)
    {
        float _1517 = rsqrt(_1493);
        _1505 = _1517;
    }
    float _1519 = _1505;
    float _1521 = _1519;
    if (_1497)
    {
        float _1523 = _1501 * _1515;
        _1507 = _1523;
    }
    float _1525 = _1507;
    if (_1497)
    {
        float _1527 = _1525 * 0.15915493667125701904296875;
        _1509 = _1527;
    }
    float _1529 = _1509;
    float _1531 = _1479;
    if (_1497)
    {
        float _1533 = _1529 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        _1531 = _1535;
    }
    float _1537 = _1531;
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1541 = precise::max(0.0, _1539);
    float _1543 = _1475;
    float _1545 = _1541;
    float _1547 = _1539;
    if (_1497)
    {
        float _1549 = _1529 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        _1543 = _1551;
    }
    float _1553 = _1543;
    float _1555 = -_1483;
    float _1557 = -_1541;
    float _1559 = fma(_1459, _1555, _1557);
    if (!_1497)
    {
        _1545 = _1485;
    }
    float _1561 = _1545;
    float _1563 = _1561;
    if (_1497)
    {
        float _1565 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1547 = _1565;
    }
    float _1567 = _1547;
    float _1569 = _1537;
    float _1571 = _1567;
    if (_1497)
    {
        float _1573 = fma(_1537, _1567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1511 = _1573;
    }
    float _1575 = _1511;
    float _1577 = _1575;
    if (!_1497)
    {
        _1569 = _1489;
    }
    float _1579 = _1569;
    float _1581 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1583 = _1579;
    float _1585 = _1553;
    if (_1497)
    {
        float _1587 = _1553 + (-1.0);
        _1571 = _1587;
    }
    float _1589 = _1571;
    float _1591 = _1589;
    if (_1497)
    {
        float _1593 = _1519 * _1575;
        _1401 = _1593;
    }
    float _1595 = _1401;
    if (!_1497)
    {
        _1577 = _1559;
    }
    float _1597 = _1577;
    float _1599 = floor(_1581);
    float _1601 = _1597;
    if (_1497)
    {
        float _1603 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1603;
    }
    float _1605 = _1521;
    if (_1497)
    {
        float _1607 = _1485 * _1595;
        _1563 = _1607;
    }
    float _1609 = _1563;
    if (!_1497)
    {
        _1591 = _1487;
    }
    float _1611 = _1591;
    float _1613 = _1611;
    if (_1497)
    {
        float _1615 = _1487 * _1595;
        _1613 = _1615;
    }
    float _1617 = _1613;
    if (_1497)
    {
        float _1619 = fma(_1559, _1553, _1605);
        _1601 = _1619;
    }
    float _1621 = _1601;
    if (_1497)
    {
        float _1623 = _1609 * _1609;
        _1583 = _1623;
    }
    float _1625 = _1583;
    if (!_1497)
    {
        _1585 = _1491;
    }
    float _1627 = _1585;
    float _1629 = _1627;
    if (_1497)
    {
        float _1631 = _1617 * _1617;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = fma(_1621, _1621, _1625);
    float _1637 = _1635 + _1633;
    float _1639 = fma(_1105, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1641 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1645 = fma(_1481, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1643);
    float _1647 = precise::clamp(_1645, 0.0, 1.0);
    float _1649 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1651 = floor(_1639);
    float _1653 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = -_1599;
    float _1661 = _1581 + _1659;
    float _1663 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1653);
    float _1665 = rsqrt(_1637);
    float _1667 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = abs(_1657);
    float _1671 = log2(_1669);
    float _1673 = -_1651;
    float _1675 = _1639 + _1673;
    float _1677 = _1665 * _1609;
    float _1679 = _1665 * _1621;
    float _1681 = _1665 * _1617;
    float _1683 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1689 = _1679 + 1.0;
    float _1691 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1683);
    float _1693 = -_1685;
    float _1695 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1693);
    float _1697 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1699 = -_1687;
    float _1701 = fma(_1699, _1649, 1.0);
    float _1703 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1691);
    float _1705 = -_1681;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1695);
    float _1709 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1697);
    float _1711 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1713 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1709);
    float _1719 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1711);
    float _1721 = fma(_1707, 0.5, 0.5);
    float _1723 = sqrt(_1715);
    float _1725 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1727 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1729 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1719);
    float _1731 = fma(_1721, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1733 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1727);
    float _1735 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1737 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1739 = log2(_1701);
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1733);
    float _1743 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1745 = fma(_1721, _1731, -0.212114393711090087890625);
    float _1747 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1741);
    float _1749 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1751 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1743);
    float _1753 = exp2(_1737);
    float2 _5596 = float2(_1675, _1661);
    float _1755 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5596, float2(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5596, float2(0.0), isnan(_5596)), level(0.0)).x;
    float _1757 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1749);
    float _1759 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1761 = fma(_1721, _1745, 1.570728778839111328125);
    float _1763 = _1723 * 0.636619746685028076171875;
    float _1765 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1757);
    float _1767 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1759);
    float _1769 = 1.0 / _1747;
    float _1771 = _1739 * 0.693147182464599609375;
    float _1773 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1765);
    float _1775 = -_1761;
    float _1777 = fma(_1763, _1775, 1.0);
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = -_1679;
    float _1783 = fma(_1753, _1689, _1781);
    float _1785 = fma(_1783, 0.5, 0.5);
    float _1787 = _1773 * _1769;
    float _1789 = _1767 * _1769;
    float _1791 = fma(_1787, 0.5, 0.5);
    float _1793 = fma(_1789, -0.5, 0.5);
    float3 _5671 = float3(_1791, _1793, _1779);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).x;
    float3 _5682 = float3(_1791, _1793, _1779);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5682, float3(0.0), isnan(_5682)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5682, float3(0.0), isnan(_5682)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5698 = float2(_1777, _1785);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5698, float2(0.0), isnan(_5698)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5698, float2(0.0), isnan(_5698)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float2 _5712 = float2(_1469, _1473);
    float3 _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5712, float2(0.0), isnan(_5712)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5712, float2(0.0), isnan(_5712)), level(0.0)).xyz;
    float _1820 = _1818.x;
    float _1822 = _1818.y;
    float _1824 = _1818.z;
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1828 = _723 + 0.5;
    float _1830 = -_735;
    float _1832 = _1830 + 0.5;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1836 = _1834 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1838 = _599 > 0.5;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1848 = 1.0 / _1836;
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1854 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1856 = _593 > 0.5;
    float _1858 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1862 = _1860 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1864 = 1.0 / _1846;
    float _1866 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1870 = _1868 != 0;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1874 = _1872 != 0;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1878 = _1876 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1882 = _1880 != 0;
    float _1884 = 1.0 / _1842;
    float _1886 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1866);
    bool _1888 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1890 = isnan(_589);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1886);
    float _1902 = 1.0 / _1852;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1912 = 1.0 / _1906;
    float _1914 = -_207;
    int _1916 = _1856 ? as_type<int>(_1914) : as_type<int>(_207);
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1920 = _1918 != 0;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1926 = !_1870;
    float _1928 = _1926 ? _207 : as_type<float>(_1916);
    float _1930 = 1.0 / _1878;
    float _1932 = _1928 + 0.5;
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1942 = 1.0 / _1862;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1944;
    float _1948 = _1936 * _1884;
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1954 = _1940 * _1848;
    float _1956 = 1.0 / _1910;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1962 = 1.0 / _1924;
    float _1964 = _1946 * _1864;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1966;
    bool _1970 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1972 = isnan(_589);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    float _1982 = _1968 * _1902;
    float _1984 = 1.0 / _1960;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1986;
    float _1990 = _1952 * _1912;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1996;
    float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2004 = _1988 * _1942;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2008 = _591 + _2006;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2012 = _591 + _2010;
    float _2014 = _1994 * _1930;
    float _2016 = _2002 * _1962;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2020 = _591 + _2018;
    float _2022 = fma(_1948, _2012, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2024 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2026 = isnan(_589);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2036;
    float _2040 = fma(_1954, _2008, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2042 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2044 = isnan(_589);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    float _2054 = fma(_1964, _2020, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2058 = _589 + _2056;
    float _2060 = _2038 * _1984;
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2064 = _589 + _2062;
    float _2066 = -_2034;
    float _2068 = _2066 + 1.0;
    bool _2070 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2072 = isnan(_589);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2078 = _2074 || _2076;
    float _2080 = float(_2078);
    float _2082 = -_2052;
    float _2084 = _2082 + 1.0;
    float _2086 = fma(_1982, _2058, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2088 = fma(_1990, _2064, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2090 = _2052 * _2068;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2094 = _589 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2098 = _589 + _2096;
    float _2100 = _2080 * _2084;
    float _2102 = -_2080;
    float _2104 = _2102 + 1.0;
    bool _2106 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2108 = isnan(_589);
    bool _2110 = _2106 || _2108;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2114 = _2110 || _2112;
    float _2116 = float(_2114);
    float _2118 = fma(_2004, _2094, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2120 = fma(_2014, _2098, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2122 = _1980 * _2104;
    float _2124 = -_1980;
    float _2126 = _2124 + 1.0;
    float _2128 = _1998 * _1956;
    bool _2130 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2132 = isnan(_589);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2138 = _2134 || _2136;
    float _2140 = float(_2138);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2144 = _589 + _2142;
    float _2146 = -_2116;
    float _2148 = _2146 + 1.0;
    float _2150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2152 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2154 = isnan(_591);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_2128, _2144, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _2166 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2168 = isnan(_589);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    float _2178 = _2140 * _2148;
    float _2180 = -_2140;
    float _2182 = _2180 + 1.0;
    float _2184 = -_2162;
    float _2186 = _2184 + 1.0;
    float _2188 = _2116 * _2126;
    float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2192 = _589 + _2190;
    float _2194 = _2176 * _2182;
    float _2196 = -_2176;
    float _2198 = _2196 + 1.0;
    bool _2200 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2202 = isnan(_591);
    bool _2204 = _2200 || _2202;
    bool _2206 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2208 = _2204 || _2206;
    float _2210 = float(_2208);
    float _2212 = fma(_2016, _2192, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2216 = _589 + _2214;
    float _2218 = _1898 * _2198;
    float _2220 = -_1898;
    float _2222 = _2220 + 1.0;
    float _2224 = -_2210;
    float _2226 = _2224 + 1.0;
    float _2228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2230 = _2086 * _2218;
    bool _2232 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2234 = isnan(_591);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    float _2244 = _2162 * _2226;
    bool _2246 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2248 = isnan(_591);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2230);
    float _2260 = -_191;
    int _2262 = _683 ? as_type<int>(_2260) : as_type<int>(_191);
    float _2264 = _2242 * _2186;
    float _2266 = -_2242;
    float _2268 = _2266 + 1.0;
    float _2270 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2272 = fma(_2088, _2194, _2258);
    float _2274 = -_207;
    int _2276 = _711 ? as_type<int>(_2274) : as_type<int>(_207);
    float _2278 = _2256 * _2268;
    float _2280 = -_2256;
    float _2282 = _2280 + 1.0;
    bool _2284 = !_1874;
    float _2286 = _2284 ? _191 : as_type<float>(_2262);
    float _2288 = fma(_2060, _2216, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2290 = _2022 * _2278;
    float _2292 = fma(_2118, _2178, _2272);
    bool _2294 = !_1920;
    float _2296 = _2294 ? _207 : as_type<float>(_2276);
    float _2298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2300 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2290);
    float _2302 = _2286 + (-0.5);
    float _2304 = fma(_2120, _2188, _2292);
    float _2306 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2308 = fma(_2040, _2264, _2300);
    float _2310 = _2296 + 0.5;
    float _2312 = -_1858;
    float _2314 = -_685;
    float _2316 = fma(_2312, _2302, _2314);
    float _2318 = -_191;
    int _2320 = _1838 ? as_type<int>(_2318) : as_type<int>(_191);
    float _2322 = fma(_2054, _2244, _2308);
    float _2324 = fma(_2306, _2310, _815);
    float _2326 = abs(_1313);
    float _2328 = log2(_2326);
    float _2330 = fma(_2164, _2122, _2304);
    float _2332 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2334 = !_1882;
    float _2336 = _2334 ? _191 : as_type<float>(_2320);
    float _2338 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2322);
    float _2340 = fma(_2212, _2100, _2330);
    float _2342 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2344 = -_887;
    float _2346 = _2344 + 1.0;
    float _2348 = _2336 + (-0.5);
    float _2350 = fma(_2288, _2090, _2340);
    float _2352 = -_903;
    float _2354 = _2352 + 1.0;
    float _2356 = -_881;
    float _2358 = _2356 + 1.0;
    float _2360 = fma(_2270, _1932, _645);
    float _2362 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2364 = -_2342;
    float _2366 = -_823;
    float _2368 = fma(_2364, _2348, _2366);
    float _2370 = -_895;
    float _2372 = _2370 + 1.0;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2380 = exp2(_2362);
    float _2382 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2384 = -_2358;
    float _2386 = fma(_1928, _2384, _2360);
    float _2388 = fma(_2286, _2354, _2316);
    float _2390 = -_2346;
    float _2392 = fma(_2296, _2390, _2324);
    float _2394 = fma(_2336, _2372, _2368);
    float _2396 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2350);
    float _2400 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2402 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2404 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2406 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2410 = _2338 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _2386;
    out.m_68.y = _2388;
    out.m_68.z = _2392;
    out.m_68.w = _2394;
    float _2412 = -_1029;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2400);
    float _2416 = -_1029;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2402);
    float _2420 = -_1029;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2404);
    float _2424 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2426 = precise::clamp(_2424, 0.0, 1.0);
    out.m_70.x = _2396;
    out.m_70.y = _2406;
    out.m_70.z = _2408;
    out.m_70.w = _2410;
    float _2428 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2414);
    float _2430 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2418);
    float _2432 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2422);
    float _2434 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2436 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2438 = exp2(_1854);
    float _2440 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2442 = _1313 <= 8000.0;
    bool _2444 = isnan(_1313);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan(8000.0);
    bool _2450 = _2446 || _2448;
    float _2452 = float(_2450);
    float _2454 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2456 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2458 = _2440 * _2428;
    float _2460 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2454);
    float _2462 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2464 = fma(_2426, -2.0, 3.0);
    float _2466 = _2426 * _2426;
    float _2468 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2470 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2456);
    float _2472 = in.m_72.x;
    float _2474 = _2466 * _2464;
    float _2476 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2468);
    float _2478 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2460);
    float _2480 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2482 = -_2474;
    float _2484 = _2482 + 1.0;
    float _2486 = _2440 * _2430;
    float _2488 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2470);
    float _2490 = _2440 * _2432;
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2474);
    float _2494 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2496 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2434);
    float _2498 = fma(_2480, _2478, _2458);
    float _2500 = _2452 * _2492;
    float _2502 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1900);
    float _2504 = _1747 * 0.5;
    float _2506 = fma(_2480, _2488, _2486);
    float _2508 = fma(_2480, _2494, _2490);
    float _2510 = -_2438;
    float _2512 = _2510 + 1.0;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2516 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2496);
    float _2518 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2520 = _2502 + _1747;
    float _2522 = _1773 + _1747;
    float _2524 = fma(_1767, -0.5, _2504);
    float _2526 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2528 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2530 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2462);
    float _2532 = _2520 * 0.5;
    float _2534 = -_1755;
    float _2536 = _2534 + 1.0;
    float _2538 = _2522 * 0.5;
    float _2540 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2542 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2530);
    float _2544 = _2536 * _2518;
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    out.gl_Position.x = _1773;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _2502;
    out.gl_Position.w = _1747;
    float _2548 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2540);
    float _2550 = _2542 + _2498;
    float _2552 = -_2546;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_74.x = _2538;
    out.m_74.y = _2524;
    out.m_74.z = _2532;
    out.m_74.w = _1747;
    float _2556 = _2332 * _2514;
    float _2558 = _2516 + _2506;
    float _2560 = _2554 * _2472;
    float _2562 = _2382 * _2528;
    float _2564 = _2548 + _2508;
    out.m_76.x = _2398;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2568 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2570 = isnan(_1481);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2576 = _2572 || _2574;
    float _2578 = -_2526;
    float _2580 = _2578 + 1.0;
    out.m_78.x = _2556;
    out.m_78.y = _2562;
    out.m_80.x = _2566;
    out.m_82.x = _2550;
    out.m_82.y = _2558;
    out.m_82.z = _2564;
    float _2582 = _1747;
    float _2584 = _2502;
    float _2586 = _1767;
    float _2588 = _2580;
    float _2590 = _2560;
    float _2592 = _1820;
    if (!_2576)
    {
        _2582 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2594 = _2582;
    float _2596 = _2526 * _1795;
    float _2598 = _1806 * _2580;
    float _2600 = _2594;
    float _2602 = _2594;
    if (!_2576)
    {
        _2584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2604 = _2584;
    float _2606 = _1806 * _2596;
    float _2608 = _1816 * _2596;
    out.m_84.x = _1820;
    out.m_84.y = _1822;
    out.m_84.z = _1824;
    float _2610 = _2604;
    float _2612 = _2604;
    if (!_2576)
    {
        _2586 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2614 = _2586;
    float _2616 = fma(_1812, _2606, _1800);
    float _2618 = fma(_1814, _2606, _1802);
    float _2620 = fma(_1806, _2608, _1804);
    float _2622 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2624 = _2614;
    float _2626 = _2614;
    if (!_2576)
    {
        _2588 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2628 = _2588;
    float _2630 = _2628;
    float _2632 = _2628;
    if (!_2576)
    {
        _2590 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2634 = _2590;
    out.m_86.x = _2616;
    out.m_86.y = _2618;
    out.m_86.z = _2620;
    out.m_86.w = _2598;
    float _2636 = _2634;
    float _2638 = _2634;
    if (!_2576)
    {
        _2592 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2640 = _2592;
    bool _2642 = !_2576;
    float _2644 = _2640;
    float _2646 = _2640;
    if (!_2642)
    {
        bool _2648 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2650 = isnan(_1481);
        bool _2652 = _2648 || _2650;
        bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2656 = _2652 || _2654;
        if (!_2656)
        {
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2660 = _1481 + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2664 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2662;
            float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2670 = 1.0 / _2664;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2688 = _2660 * _2670;
            float _2690 = precise::clamp(_2688, 0.0, 1.0);
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2696 = fma(_2690, _2668, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2698 = fma(_2690, _2694, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2700 = fma(_2690, _2674, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2702 = fma(_2690, _2678, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2704 = fma(_2690, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2706 = fma(_2690, _2686, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2612 = _2700;
            _2638 = _2704;
            _2602 = _2696;
            _2632 = _2702;
            _2626 = _2698;
            _2646 = _2706;
            _2708 = true;
        }
        else
        {
            bool _2710 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2712 = isnan(_1481);
            bool _2714 = _2710 || _2712;
            bool _2716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2718 = _2714 || _2716;
            if (!_2718)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2720 = _2600;
            _2602 = _2720;
            if (!_2718)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2722 = _2610;
            _2612 = _2722;
            if (!_2718)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2724 = _2624;
            _2626 = _2724;
            if (!_2718)
            {
                _2630 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2726 = _2630;
            _2632 = _2726;
            if (!_2718)
            {
                _2636 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2728 = _2636;
            _2638 = _2728;
            if (!_2718)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2730 = _2644;
            bool _2732 = !_2718;
            _2646 = _2730;
            if (!_2732)
            {
                bool _2734 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2736 = isnan(_1481);
                bool _2738 = _2734 || _2736;
                bool _2740 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2742 = _2738 || _2740;
                if (!_2742)
                {
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2746 = _1481 + _2744;
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2748;
                    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2756 = 1.0 / _2750;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2774 = _2746 * _2756;
                    float _2776 = precise::clamp(_2774, 0.0, 1.0);
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2782 = fma(_2776, _2754, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2784 = fma(_2776, _2780, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2786 = fma(_2776, _2760, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2788 = fma(_2776, _2764, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2790 = fma(_2776, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2792 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2612 = _2786;
                    _2638 = _2790;
                    _2602 = _2782;
                    _2632 = _2788;
                    _2626 = _2784;
                    _2646 = _2792;
                    _2708 = true;
                }
                else
                {
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2638 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2632 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2708 = false;
    float _2794 = _2612;
    float _2796 = _2638;
    float _2798 = _2602;
    float _2800 = _2632;
    float _2802 = _2626;
    float _2804 = _2646;
    float _2806 = fma(_2558, -0.5, 0.5);
    float _2808 = precise::clamp(_2806, 0.0, 1.0);
    float _2810 = -_2794;
    float _2812 = _2810 + _2796;
    float _2814 = _2622 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2816 = -_2798;
    float _2818 = _2816 + _2800;
    float _2820 = fma(_2808, _2812, _2794);
    out.m_88.x = 0.0;
    float _2822 = -_2802;
    float _2824 = _2822 + _2804;
    float _2826 = fma(_2808, _2818, _2798);
    float _2828 = _2820 * 0.586610972881317138671875;
    out.m_51.x = _2814;
    bool _2830 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2832 = fma(_2808, _2824, _2802);
    float _2834 = fma(_2826, 0.298911988735198974609375, _2828);
    bool _2836 = _1455 > 0.0;
    bool _2838 = isnan(_1455);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan(0.0);
    bool _2844 = _2840 || _2842;
    float _2846 = fma(_2832, 0.114477999508380889892578125, _2834);
    float _2848 = -_2846;
    float _2850 = _2820 + _2848;
    float _2852 = -_2846;
    float _2854 = _2826 + _2852;
    float _2856 = -_2846;
    float _2858 = _2832 + _2856;
    float _2860 = fma(_2850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    float _2862 = fma(_2854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    float _2864 = fma(_2858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    bool _2866 = !_2830;
    if (!_2866)
    {
        float _2868 = -_1385;
        float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2872 = -_1387;
        float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2876 = -_1389;
        float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2880 = _2870 * _2870;
        float _2882 = fma(_2874, _2874, _2880);
        float _2884 = fma(_2878, _2878, _2882);
        float _2886 = sqrt(_2884);
        float _2888 = rsqrt(_2884);
        float _2890 = -_2886;
        float _2892 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2894 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2896 = precise::clamp(_2894, 0.0, 1.0);
        float _2898 = _2874 * _2888;
        float _2900 = _2870 * _2888;
        float _2902 = abs(_2896);
        float _2904 = log2(_2902);
        float _2906 = _2878 * _2888;
        float _2908 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2910 = _2558 * _2900;
        float _2912 = -_2900;
        float _2914 = -_2908;
        float _2916 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2914);
        float _2918 = fma(_2550, _2898, _2910);
        float _2920 = -_2906;
        float _2922 = fma(_2920, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2916);
        float _2924 = fma(_2564, _2906, _2918);
        float _2926 = precise::clamp(_2924, 0.0, 1.0);
        float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2930 = _2922 + _2928;
        float _2932 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2934 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = exp2(_2932);
        float _2940 = _2938 * _2936;
        float _2942 = _2926 * _2940;
        float _2944 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2946 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2948 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2944;
        out.m_88.y = _2946;
        out.m_88.z = _2948;
    }
    out.m_90.x = _2862;
    out.m_90.y = _2860;
    out.m_90.z = _2864;
    if (_2844)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2950 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2950;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2708 = false;
    bool _581 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3006 = as_type<float>(_123);
        out.gl_Position.z = _3006;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_109);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3076 = as_type<float>(_163);
        out.gl_Position.z = _3076;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_179;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_175;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_181;
    float _227;
    if (!_209)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_109);
        float _233 = 1.0 / _231;
        float _235 = _141 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _237 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    float _263 = 1.0 / _253;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _261;
    bool _269 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_237);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _257;
    float _283 = _241 * _263;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _245 * _267;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_279;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -_309;
    float _319 = _317 + 1.0;
    float _321 = _249 * _281;
    float _323 = -_295;
    float _325 = _323 + 1.0;
    bool _327 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_237);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = _279 * _325;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_341, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _337 * _319;
    float _361 = fma(_351, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_345, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_355, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_337;
    float _369 = _367 + 1.0;
    float _371 = _357 * _359;
    float _373 = _361 * _359;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_363, _315, _379);
    float _391 = fma(_383, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _315, _385);
    float _395 = fma(_387, _347, _389);
    float _397 = fma(_391, _347, _393);
    float _399 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_265;
    float _421;
    if (!_403)
    {
        float _405 = in.m_60.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_109);
        float _427 = 1.0 / _425;
        float _429 = _141 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _437 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = isnan(_431);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _455 = isnan(_431);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = 1.0 / _435;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = -_447;
    float _473 = _471 + 1.0;
    bool _475 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_431);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    bool _487 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _489 = 1.0 / _451;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _495 = _469 * _465;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _431 + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _431 + _501;
    float _505 = fma(_495, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = _463 * _473;
    float _509 = -_463;
    float _511 = _509 + 1.0;
    float _513 = _493 * _489;
    float _515 = -_485;
    float _517 = _515 + 1.0;
    float _519 = _505 * _507;
    float _521 = fma(_513, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _523 = _447 * _517;
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _527 = fma(_521, _523, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _527);
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _543 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = in.m_62.x;
    float _547 = in.m_62.y;
    out.m_64.x = _537;
    out.m_64.y = _539;
    out.m_64.z = _543;
    out.m_64.w = _541;
    float _549 = _401 * _547;
    float _551 = _399 * _545;
    bool _553 = !_487;
    float _577;
    float _579;
    if (!_553)
    {
        float _555 = in.m_60.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _559 = float(_109);
        float _561 = 1.0 / _559;
        float _563 = _555 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _565 = _141 * _561;
        float _567 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _569 = _567 * _557;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _565;
        _579 = _575;
        _581 = true;
    }
    else
    {
        float _583 = float(_109);
        float _585 = 1.0 / _583;
        float _587 = _141 * _585;
        _577 = _587;
        _579 = _587;
    }
    _581 = false;
    float _589 = _577;
    float _591 = _579;
    float _593 = in.m_60.x;
    float _595 = in.m_60.y;
    float _597 = in.m_60.z;
    float _599 = in.m_60.w;
    float _601 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _603 = log2(_601);
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _607 = _605 != 0;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _611 = _603 * _141;
    float _613 = _597 * 2.0;
    float _615 = _593 * 2.0;
    float _617 = _595 + _593;
    float _619 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _621 = floor(_613);
    float _623 = _617 + (-1.0);
    float _625 = -_609;
    float _627 = fma(_619, 2.0, _625);
    float _629 = _619;
    if (!_607)
    {
        _629 = _595;
    }
    float _631 = _629;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _635 = _595 * 2.0;
    float _637 = _631;
    if (_607)
    {
        _637 = _593;
    }
    float _639 = _637;
    float _641 = floor(_615);
    float _643 = -_141;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[76].x, _627);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _649 = _621 > 0.0;
    float _651 = floor(_635);
    bool _653 = _621 >= 0.0;
    bool _655 = isnan(_621);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _665 = _595 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _667 = _661 ? 0 : 1;
    bool _669 = _641 > 0.0;
    float _671 = fma(_665, -2.0, _663);
    bool _673 = _641 >= 0.0;
    bool _675 = isnan(_641);
    bool _677 = _673 || _675;
    bool _679 = isnan(0.0);
    bool _681 = _677 || _679;
    bool _683 = _595 > 0.5;
    float _685 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _671);
    int _687 = ~_667;
    int _689 = _687 + 1;
    int _691 = _689 + 1;
    int _693 = _691;
    float _695 = _663;
    if (!_649)
    {
        int _697 = ~_667;
        int _699 = _697 + 1;
        _693 = _699;
    }
    int _701 = _693;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _709 = _707 != 0;
    bool _711 = _597 > 0.5;
    float _713 = -_207;
    float _715 = _683 ? _713 : _207;
    float _717 = -_191;
    int _719 = _711 ? as_type<int>(_717) : as_type<int>(_191);
    bool _721 = !_705;
    float _723 = _721 ? _207 : _715;
    float _725 = _715;
    if (!_607)
    {
        _695 = _597;
    }
    float _727 = _695;
    float _729 = _727;
    if (!_607)
    {
        _725 = _597;
    }
    float _731 = _725;
    bool _733 = !_709;
    float _735 = _733 ? _191 : as_type<float>(_719);
    float _737 = _731;
    if (_607)
    {
        _729 = _595;
    }
    float _739 = _729;
    if (_607)
    {
        _737 = _595;
    }
    float _741 = _737;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _753 = _751 != 0;
    float _755 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[83].w, _647);
    int _757 = _681 ? 0 : 1;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _761 = _651 > 0.0;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _765 = !_745;
    int _767 = _765 ? 0 : 1;
    bool _769 = _651 >= 0.0;
    bool _771 = isnan(_651);
    bool _773 = _769 || _771;
    bool _775 = isnan(0.0);
    bool _777 = _773 || _775;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _781 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[83].z, _759);
    float _783 = _639 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _785 = _777 ? 0 : 1;
    float _787 = _739 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _789 = -_779;
    float _791 = fma(_783, 2.0, _789);
    int _793 = ~_785;
    int _795 = _793 + 1;
    int _797 = _795 + 1;
    float _799 = exp2(_611);
    int _801 = abs(_767);
    float _803 = fma(_787, -2.0, _763);
    int _805 = _797;
    if (!_761)
    {
        int _807 = ~_785;
        int _809 = _807 + 1;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = -_141;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[81].x, _791);
    float _817 = in.m_66.x;
    float _819 = in.m_66.y;
    float _821 = in.m_66.z;
    float _823 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _803);
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = float(_701);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = float(_801);
    float _845 = 1.0 / _837;
    float _847 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    int _849 = ~_757;
    int _851 = _849 + 1;
    int _853 = _851 + 1;
    float _855 = -_799;
    float _857 = _855 + 1.0;
    int _859 = _853;
    if (!_669)
    {
        int _861 = ~_757;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = _843 * _839;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _871 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _879 = _875 || _877;
    float _881 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _847);
    bool _883 = !_749;
    int _885 = _883 ? 0 : 1;
    float _887 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _781);
    float _889 = _867 * (-2.0);
    float _891 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _893 = _879 ? _857 : 0.0;
    float _895 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _755);
    int _897 = abs(_885);
    float _899 = _593 + (-0.5);
    float _901 = fma(_889, _817, _817);
    float _903 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    bool _905 = !_753;
    int _907 = _905 ? 0 : 1;
    if (_833)
    {
        float _909 = _893 * _845;
        _145 = _909;
    }
    float _911 = _145;
    float _913 = float(_865);
    float _915 = fma(_633, _889, _633);
    float _917 = float(_897);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[196].x, _901);
    int _921 = abs(_907);
    float _923 = _595 + _597;
    float _925 = _917 * _913;
    float _927 = fma(_915, _911, _919);
    float _929 = float(_811);
    float _931 = _923 + (-1.0);
    float _933 = float(_921);
    float _935 = _925 * (-2.0);
    float _937 = _595 + (-0.5);
    float _939 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _941 = _597 + _593;
    float _943 = _933 * _929;
    float _945 = fma(_935, _819, _819);
    float _947 = _597 + (-0.5);
    float _949 = _941 + (-1.0);
    float _951 = _943 * (-2.0);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].y, _945);
    float _955 = fma(_939, _935, _939);
    float _957 = _927 * 0.15915493667125701904296875;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    bool _961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _963 = isnan(0.5);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _969 = _965 || _967;
    float _971 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _973 = fma(_951, _821, _821);
    float _975 = fma(_955, _911, _953);
    float _977 = _957 * 6.283185482025146484375;
    float _979 = cos(_977);
    float _981 = fma(_971, _951, _971);
    float _983 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[196].z, _973);
    float _985 = _975 * 0.15915493667125701904296875;
    float _987 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _989 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _991 = fma(_981, _911, _983);
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _995 = _985 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = in.m_48.x;
    float _1001 = in.m_48.y;
    float _1003 = in.m_48.z;
    float _1005 = _991 * 0.15915493667125701904296875;
    float _1007 = _987 * _993;
    float _1009 = _989 * _959;
    float _1011 = _985 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = _957 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = _979 * _997;
    float _1021 = _1005 * 6.283185482025146484375;
    float _1023 = cos(_1021);
    float _1025 = _979 * _1013;
    float _1027 = _1005 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _1017 * _997;
    float _1033 = _1017 * _1013;
    float _1035 = _979 * _1023;
    float _1037 = _1017 * _1023;
    float _1039 = _1013 * _1023;
    float _1041 = _997 * _1023;
    float _1043 = _1035 * _1009;
    float _1045 = _1037 * _1009;
    float _1047 = fma(_1029, _1025, _1031);
    float _1049 = -_1019;
    float _1051 = fma(_1029, _1033, _1049);
    float _1053 = -_1033;
    float _1055 = fma(_1029, _1019, _1053);
    float _1057 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1059 = -_1009;
    float _1061 = _1029 * _1059;
    float _1063 = fma(_1047, _1007, _1043);
    float _1065 = fma(_1029, _1031, _1025);
    float _1067 = fma(_1051, _1007, _1045);
    float _1069 = fma(_1039, _1007, _1061);
    float _1071 = fma(_1055, _1057, _1063);
    float _1073 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1075 = fma(_1065, _1057, _1067);
    float _1077 = fma(_1041, _1057, _1069);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1083 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1073);
    float _1085 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1087 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1089 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1081);
    float _1091 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1083);
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1085);
    float _1095 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1097 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1089);
    float _1099 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1101 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1107 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1111 = _1099 + _1103;
    float _1113 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1107);
    float _1115 = _1105 + _1109;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1119 = _1111 + _1117;
    float _1121 = fma(_1003, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1113);
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1125 = _1115 + _1123;
    float _1127 = _1119 * _1119;
    float _1129 = fma(_1125, _1125, _1127);
    float _1131 = sqrt(_1129);
    bool _1133 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _1131 + _1135;
    float _1139 = _1103;
    float _1141 = _1137;
    float _1143 = _1121;
    float _1145 = _1071;
    float _1147 = _1115;
    float _1149 = _1111;
    if (_1133)
    {
        float _1151 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1139 = _1151;
    }
    float _1153 = _1139;
    if (_1133)
    {
        float _1155 = _1137 * _1153;
        _1141 = _1155;
    }
    float _1157 = _1141;
    float _1159 = _1071 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1161 = 0.0;
    if (_1133)
    {
        float _1163 = _1157 * 0.15915493667125701904296875;
        _1161 = _1163;
    }
    float _1165 = _1161;
    float _1167 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1159);
    float _1169 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1171 = _985;
    float _1173 = _1165;
    if (_1133)
    {
        float _1175 = _1165 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1171 = _1177;
    }
    float _1179 = _1171;
    float _1181 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1167);
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1187 = _1159;
    float _1189 = _1183;
    float _1191 = _1185;
    if (_1133)
    {
        float _1193 = _1165 * 6.283185482025146484375;
        float _1195 = sin(_1193);
        _1187 = _1195;
    }
    float _1197 = _1187;
    float _1199 = _1169 + _1183;
    float _1201 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1185);
    float _1203 = _1199;
    if (_1133)
    {
        float _1205 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1205;
    }
    float _1207 = _1143;
    float _1209 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1201);
    float _1211 = _1075;
    float _1213 = _1207;
    if (_1133)
    {
        float _1215 = rsqrt(_1129);
        _1211 = _1215;
    }
    float _1217 = _1211;
    if (_1133)
    {
        float _1219 = _1179 + (-1.0);
        _1189 = _1219;
    }
    float _1221 = _1189;
    float _1223 = _1221;
    if (_969)
    {
        _1173 = 1.0;
    }
    float _1225 = _1173;
    float _1227 = _1225;
    if (_1133)
    {
        float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1191 = _1229;
    }
    float _1231 = _1191;
    if (!_1133)
    {
        _1223 = _1111;
    }
    float _1233 = _1223;
    float _1235 = _1233;
    if (_1133)
    {
        float _1237 = fma(_1197, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1145 = _1237;
    }
    float _1239 = _1145;
    if (_1133)
    {
        float _1241 = fma(_1199, _1179, _1231);
        _1203 = _1241;
    }
    float _1243 = _1203;
    float _1245 = _1243;
    if (!_1133)
    {
        _1213 = _1115;
    }
    float _1247 = _1213;
    float _1249 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1251 = -_1169;
    float _1253 = _1251 + _1243;
    float _1255 = _1217;
    float _1257 = _1247;
    if (_1133)
    {
        float _1259 = _1217 * _1239;
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1265 = _1253 * _1253;
    if (_1133)
    {
        float _1267 = fma(_1125, _1261, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1257 = _1267;
    }
    float _1269 = _1257;
    if (_1133)
    {
        float _1271 = fma(_1119, _1261, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1235 = _1271;
    }
    float _1273 = _1235;
    float _1275 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1249);
    float _1277 = 1.0 / _1263;
    float _1279 = -_1105;
    float _1281 = _1279 + _1269;
    float _1283 = -_1099;
    float _1285 = _1283 + _1273;
    float _1287 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1275);
    float _1289 = fma(_1281, _1281, _1265);
    float _1291 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1293 = fma(_1285, _1285, _1289);
    float _1295 = _1291 + _1263;
    float _1297 = sqrt(_1293);
    float _1299 = _1295 * _1277;
    float _1301 = _1299 * 0.5;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1305 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1303);
    float _1307 = 1.0 / _1305;
    bool _1309 = _1297 > 0.0;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1313 = _1307 * _1311;
    float _1315 = _1293;
    float _1317 = _1277;
    float _1319 = _1285;
    if (!_1309)
    {
        _1147 = _1269;
    }
    float _1321 = _1147;
    float _1323 = _1321;
    float _1325 = _1321;
    if (!_1309)
    {
        _1149 = _1273;
    }
    float _1327 = _1149;
    bool _1329 = !_1309;
    float _1331 = _1327;
    float _1333 = _1327;
    if (!_1329)
    {
        float _1335 = _199 * _199;
        float _1337 = fma(_201, _201, _1335);
        float _1339 = fma(_203, _203, _1337);
        float _1341 = rsqrt(_1293);
        float _1343 = sqrt(_1339);
        float _1345 = _1281 * _1341;
        float _1347 = _1253 * _1341;
        float _1349 = _1285 * _1341;
        bool _1351 = _1343 > 0.0;
        _1317 = _1343;
        _1319 = _1349;
        if (!_1351)
        {
            _1323 = _1269;
        }
        float _1353 = _1323;
        _1325 = _1353;
        if (!_1351)
        {
            _1331 = _1273;
        }
        float _1355 = _1331;
        bool _1357 = !_1351;
        _1333 = _1355;
        if (!_1357)
        {
            float _1359 = rsqrt(_1339);
            float _1361 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1363 = _199 * _1359;
            float _1365 = _201 * _1359;
            float _1367 = _1347 * _1363;
            float _1369 = _203 * _1359;
            float _1371 = fma(_1345, _1365, _1367);
            float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1375 = fma(_1349, _1369, _1371);
            float _1377 = _1375 * _1373;
            float _1379 = fma(_199, _1377, _1243);
            float _1381 = fma(_201, _1377, _1269);
            float _1383 = fma(_203, _1377, _1273);
            _1245 = _1379;
            _1325 = _1381;
            _1333 = _1383;
            _1315 = _1361;
            _1317 = _1369;
        }
    }
    float _1385 = _1245;
    float _1387 = _1325;
    float _1389 = _1333;
    float _1391 = _1315;
    float _1393 = _1317;
    float _1395 = _1319;
    float _1397 = _1391;
    float _1399 = _1393;
    float _1401 = _1395;
    if (!_969)
    {
        float _1403 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1409 = _1405 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1407 * 0.15915493667125701904296875;
        float _1415 = _1405 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = 1.0 / _1411;
        float _1421 = _1413 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        float _1425 = _1417 * _1419;
        float _1427 = _1413 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1431;
        float _1435 = _1423 * _1425;
        float _1437 = 1.0 / _1435;
        float _1439 = 1.0 / _1433;
        float _1441 = _1429 * _1437;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1445 = fma(_1313, _1441, _1443);
        float _1447 = _1445 * _1439;
        float _1449 = precise::clamp(_1447, 0.0, 1.0);
        _1397 = _1405;
        _1399 = _1413;
        _1227 = _1449;
    }
    float _1451 = _1397;
    float _1453 = _1399;
    float _1455 = _1227;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1459 = _1385 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1463 = _1387 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1467 = _1389 + _1465;
    float _1469 = fma(_1269, 6.2500002968590706586837768554688e-05, 0.5);
    float _1471 = _1459 * _1459;
    float _1473 = fma(_1273, 6.2500002968590706586837768554688e-05, 0.5);
    float _1475 = fma(_1463, _1463, _1471);
    float _1477 = fma(_1467, _1467, _1475);
    float _1479 = rsqrt(_1477);
    float _1481 = sqrt(_1477);
    float _1483 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1485 = _1463 * _1483;
    float _1487 = _1467 * _1483;
    float _1489 = _1485 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 + _1491;
    float _1495 = sqrt(_1493);
    bool _1497 = _1495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = _1495 + _1499;
    float _1503 = _1467;
    float _1505 = _1453;
    float _1507 = _1501;
    float _1509 = _1451;
    float _1511 = _1459;
    if (_1497)
    {
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1513;
    }
    float _1515 = _1503;
    if (_1497)
    {
        float _1517 = rsqrt(_1493);
        _1505 = _1517;
    }
    float _1519 = _1505;
    float _1521 = _1519;
    if (_1497)
    {
        float _1523 = _1501 * _1515;
        _1507 = _1523;
    }
    float _1525 = _1507;
    if (_1497)
    {
        float _1527 = _1525 * 0.15915493667125701904296875;
        _1509 = _1527;
    }
    float _1529 = _1509;
    float _1531 = _1479;
    if (_1497)
    {
        float _1533 = _1529 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        _1531 = _1535;
    }
    float _1537 = _1531;
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1541 = precise::max(0.0, _1539);
    float _1543 = _1475;
    float _1545 = _1541;
    float _1547 = _1539;
    if (_1497)
    {
        float _1549 = _1529 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        _1543 = _1551;
    }
    float _1553 = _1543;
    float _1555 = -_1483;
    float _1557 = -_1541;
    float _1559 = fma(_1459, _1555, _1557);
    if (!_1497)
    {
        _1545 = _1485;
    }
    float _1561 = _1545;
    float _1563 = _1561;
    if (_1497)
    {
        float _1565 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1547 = _1565;
    }
    float _1567 = _1547;
    float _1569 = _1537;
    float _1571 = _1567;
    if (_1497)
    {
        float _1573 = fma(_1537, _1567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1511 = _1573;
    }
    float _1575 = _1511;
    float _1577 = _1575;
    if (!_1497)
    {
        _1569 = _1489;
    }
    float _1579 = _1569;
    float _1581 = fma(_1099, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1583 = _1579;
    float _1585 = _1553;
    if (_1497)
    {
        float _1587 = _1553 + (-1.0);
        _1571 = _1587;
    }
    float _1589 = _1571;
    float _1591 = _1589;
    if (_1497)
    {
        float _1593 = _1519 * _1575;
        _1401 = _1593;
    }
    float _1595 = _1401;
    if (!_1497)
    {
        _1577 = _1559;
    }
    float _1597 = _1577;
    float _1599 = floor(_1581);
    float _1601 = _1597;
    if (_1497)
    {
        float _1603 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1603;
    }
    float _1605 = _1521;
    if (_1497)
    {
        float _1607 = _1485 * _1595;
        _1563 = _1607;
    }
    float _1609 = _1563;
    if (!_1497)
    {
        _1591 = _1487;
    }
    float _1611 = _1591;
    float _1613 = _1611;
    if (_1497)
    {
        float _1615 = _1487 * _1595;
        _1613 = _1615;
    }
    float _1617 = _1613;
    if (_1497)
    {
        float _1619 = fma(_1559, _1553, _1605);
        _1601 = _1619;
    }
    float _1621 = _1601;
    if (_1497)
    {
        float _1623 = _1609 * _1609;
        _1583 = _1623;
    }
    float _1625 = _1583;
    if (!_1497)
    {
        _1585 = _1491;
    }
    float _1627 = _1585;
    float _1629 = _1627;
    if (_1497)
    {
        float _1631 = _1617 * _1617;
        _1629 = _1631;
    }
    float _1633 = _1629;
    float _1635 = fma(_1621, _1621, _1625);
    float _1637 = _1635 + _1633;
    float _1639 = fma(_1105, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1641 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1645 = fma(_1481, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1643);
    float _1647 = precise::clamp(_1645, 0.0, 1.0);
    float _1649 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1651 = floor(_1639);
    float _1653 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = -_1599;
    float _1661 = _1581 + _1659;
    float _1663 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1653);
    float _1665 = rsqrt(_1637);
    float _1667 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1669 = abs(_1657);
    float _1671 = log2(_1669);
    float _1673 = -_1651;
    float _1675 = _1639 + _1673;
    float _1677 = _1665 * _1609;
    float _1679 = _1665 * _1621;
    float _1681 = _1665 * _1617;
    float _1683 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1685 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1689 = _1679 + 1.0;
    float _1691 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1683);
    float _1693 = -_1685;
    float _1695 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1693);
    float _1697 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1699 = -_1687;
    float _1701 = fma(_1699, _1649, 1.0);
    float _1703 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1691);
    float _1705 = -_1681;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1695);
    float _1709 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1697);
    float _1711 = _1385 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1713 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1709);
    float _1719 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1711);
    float _1721 = fma(_1707, 0.5, 0.5);
    float _1723 = sqrt(_1715);
    float _1725 = _1717 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1727 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1729 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1719);
    float _1731 = fma(_1721, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1733 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1727);
    float _1735 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1737 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1739 = log2(_1701);
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1733);
    float _1743 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1745 = fma(_1721, _1731, -0.212114393711090087890625);
    float _1747 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1741);
    float _1749 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1751 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1743);
    float _1753 = exp2(_1737);
    float2 _5596 = float2(_1675, _1661);
    float _1755 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5596, float2(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5596, float2(0.0), isnan(_5596)), level(0.0)).x;
    float _1757 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1749);
    float _1759 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1761 = fma(_1721, _1745, 1.570728778839111328125);
    float _1763 = _1723 * 0.636619746685028076171875;
    float _1765 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1757);
    float _1767 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1759);
    float _1769 = 1.0 / _1747;
    float _1771 = _1739 * 0.693147182464599609375;
    float _1773 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1765);
    float _1775 = -_1761;
    float _1777 = fma(_1763, _1775, 1.0);
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = -_1679;
    float _1783 = fma(_1753, _1689, _1781);
    float _1785 = fma(_1783, 0.5, 0.5);
    float _1787 = _1773 * _1769;
    float _1789 = _1767 * _1769;
    float _1791 = fma(_1787, 0.5, 0.5);
    float _1793 = fma(_1789, -0.5, 0.5);
    float3 _5671 = float3(_1791, _1793, _1779);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).x;
    float3 _5682 = float3(_1791, _1793, _1779);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5682, float3(0.0), isnan(_5682)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5682, float3(0.0), isnan(_5682)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5698 = float2(_1777, _1785);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5698, float2(0.0), isnan(_5698)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5698, float2(0.0), isnan(_5698)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float2 _5712 = float2(_1469, _1473);
    float3 _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5712, float2(0.0), isnan(_5712)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5712, float2(0.0), isnan(_5712)), level(0.0)).xyz;
    float _1820 = _1818.x;
    float _1822 = _1818.y;
    float _1824 = _1818.z;
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1828 = _723 + 0.5;
    float _1830 = -_735;
    float _1832 = _1830 + 0.5;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1836 = _1834 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1838 = _599 > 0.5;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1848 = 1.0 / _1836;
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1854 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1856 = _593 > 0.5;
    float _1858 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1862 = _1860 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1864 = 1.0 / _1846;
    float _1866 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1870 = _1868 != 0;
    int _1872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1874 = _1872 != 0;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1878 = _1876 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1882 = _1880 != 0;
    float _1884 = 1.0 / _1842;
    float _1886 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1866);
    bool _1888 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1890 = isnan(_589);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1886);
    float _1902 = 1.0 / _1852;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1912 = 1.0 / _1906;
    float _1914 = -_207;
    int _1916 = _1856 ? as_type<int>(_1914) : as_type<int>(_207);
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1920 = _1918 != 0;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1926 = !_1870;
    float _1928 = _1926 ? _207 : as_type<float>(_1916);
    float _1930 = 1.0 / _1878;
    float _1932 = _1928 + 0.5;
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1942 = 1.0 / _1862;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1944;
    float _1948 = _1936 * _1884;
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1954 = _1940 * _1848;
    float _1956 = 1.0 / _1910;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1962 = 1.0 / _1924;
    float _1964 = _1946 * _1864;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1966;
    bool _1970 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1972 = isnan(_589);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    float _1982 = _1968 * _1902;
    float _1984 = 1.0 / _1960;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1986;
    float _1990 = _1952 * _1912;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1994 = _1992 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1996;
    float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2004 = _1988 * _1942;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2008 = _591 + _2006;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2012 = _591 + _2010;
    float _2014 = _1994 * _1930;
    float _2016 = _2002 * _1962;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2020 = _591 + _2018;
    float _2022 = fma(_1948, _2012, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2024 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2026 = isnan(_589);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2036;
    float _2040 = fma(_1954, _2008, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2042 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2044 = isnan(_589);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    float _2054 = fma(_1964, _2020, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2058 = _589 + _2056;
    float _2060 = _2038 * _1984;
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2064 = _589 + _2062;
    float _2066 = -_2034;
    float _2068 = _2066 + 1.0;
    bool _2070 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2072 = isnan(_589);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2078 = _2074 || _2076;
    float _2080 = float(_2078);
    float _2082 = -_2052;
    float _2084 = _2082 + 1.0;
    float _2086 = fma(_1982, _2058, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2088 = fma(_1990, _2064, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2090 = _2052 * _2068;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2094 = _589 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2098 = _589 + _2096;
    float _2100 = _2080 * _2084;
    float _2102 = -_2080;
    float _2104 = _2102 + 1.0;
    bool _2106 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2108 = isnan(_589);
    bool _2110 = _2106 || _2108;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2114 = _2110 || _2112;
    float _2116 = float(_2114);
    float _2118 = fma(_2004, _2094, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2120 = fma(_2014, _2098, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2122 = _1980 * _2104;
    float _2124 = -_1980;
    float _2126 = _2124 + 1.0;
    float _2128 = _1998 * _1956;
    bool _2130 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2132 = isnan(_589);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2138 = _2134 || _2136;
    float _2140 = float(_2138);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2144 = _589 + _2142;
    float _2146 = -_2116;
    float _2148 = _2146 + 1.0;
    float _2150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2152 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2154 = isnan(_591);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_2128, _2144, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _2166 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2168 = isnan(_589);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    float _2178 = _2140 * _2148;
    float _2180 = -_2140;
    float _2182 = _2180 + 1.0;
    float _2184 = -_2162;
    float _2186 = _2184 + 1.0;
    float _2188 = _2116 * _2126;
    float _2190 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2192 = _589 + _2190;
    float _2194 = _2176 * _2182;
    float _2196 = -_2176;
    float _2198 = _2196 + 1.0;
    bool _2200 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2202 = isnan(_591);
    bool _2204 = _2200 || _2202;
    bool _2206 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2208 = _2204 || _2206;
    float _2210 = float(_2208);
    float _2212 = fma(_2016, _2192, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2216 = _589 + _2214;
    float _2218 = _1898 * _2198;
    float _2220 = -_1898;
    float _2222 = _2220 + 1.0;
    float _2224 = -_2210;
    float _2226 = _2224 + 1.0;
    float _2228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2230 = _2086 * _2218;
    bool _2232 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2234 = isnan(_591);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    float _2244 = _2162 * _2226;
    bool _2246 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2248 = isnan(_591);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2230);
    float _2260 = -_191;
    int _2262 = _683 ? as_type<int>(_2260) : as_type<int>(_191);
    float _2264 = _2242 * _2186;
    float _2266 = -_2242;
    float _2268 = _2266 + 1.0;
    float _2270 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2272 = fma(_2088, _2194, _2258);
    float _2274 = -_207;
    int _2276 = _711 ? as_type<int>(_2274) : as_type<int>(_207);
    float _2278 = _2256 * _2268;
    float _2280 = -_2256;
    float _2282 = _2280 + 1.0;
    bool _2284 = !_1874;
    float _2286 = _2284 ? _191 : as_type<float>(_2262);
    float _2288 = fma(_2060, _2216, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2290 = _2022 * _2278;
    float _2292 = fma(_2118, _2178, _2272);
    bool _2294 = !_1920;
    float _2296 = _2294 ? _207 : as_type<float>(_2276);
    float _2298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2300 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2290);
    float _2302 = _2286 + (-0.5);
    float _2304 = fma(_2120, _2188, _2292);
    float _2306 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2308 = fma(_2040, _2264, _2300);
    float _2310 = _2296 + 0.5;
    float _2312 = -_1858;
    float _2314 = -_685;
    float _2316 = fma(_2312, _2302, _2314);
    float _2318 = -_191;
    int _2320 = _1838 ? as_type<int>(_2318) : as_type<int>(_191);
    float _2322 = fma(_2054, _2244, _2308);
    float _2324 = fma(_2306, _2310, _815);
    float _2326 = abs(_1313);
    float _2328 = log2(_2326);
    float _2330 = fma(_2164, _2122, _2304);
    float _2332 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2334 = !_1882;
    float _2336 = _2334 ? _191 : as_type<float>(_2320);
    float _2338 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2322);
    float _2340 = fma(_2212, _2100, _2330);
    float _2342 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2344 = -_887;
    float _2346 = _2344 + 1.0;
    float _2348 = _2336 + (-0.5);
    float _2350 = fma(_2288, _2090, _2340);
    float _2352 = -_903;
    float _2354 = _2352 + 1.0;
    float _2356 = -_881;
    float _2358 = _2356 + 1.0;
    float _2360 = fma(_2270, _1932, _645);
    float _2362 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2364 = -_2342;
    float _2366 = -_823;
    float _2368 = fma(_2364, _2348, _2366);
    float _2370 = -_895;
    float _2372 = _2370 + 1.0;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2380 = exp2(_2362);
    float _2382 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2384 = -_2358;
    float _2386 = fma(_1928, _2384, _2360);
    float _2388 = fma(_2286, _2354, _2316);
    float _2390 = -_2346;
    float _2392 = fma(_2296, _2390, _2324);
    float _2394 = fma(_2336, _2372, _2368);
    float _2396 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2350);
    float _2400 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2402 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2404 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2406 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2410 = _2338 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _2386;
    out.m_68.y = _2388;
    out.m_68.z = _2392;
    out.m_68.w = _2394;
    float _2412 = -_1029;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2400);
    float _2416 = -_1029;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2402);
    float _2420 = -_1029;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2404);
    float _2424 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2426 = precise::clamp(_2424, 0.0, 1.0);
    out.m_70.x = _2396;
    out.m_70.y = _2406;
    out.m_70.z = _2408;
    out.m_70.w = _2410;
    float _2428 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2414);
    float _2430 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2418);
    float _2432 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2422);
    float _2434 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2436 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2438 = exp2(_1854);
    float _2440 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2442 = _1313 <= 8000.0;
    bool _2444 = isnan(_1313);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan(8000.0);
    bool _2450 = _2446 || _2448;
    float _2452 = float(_2450);
    float _2454 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2456 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2458 = _2440 * _2428;
    float _2460 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2454);
    float _2462 = _1055 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2464 = fma(_2426, -2.0, 3.0);
    float _2466 = _2426 * _2426;
    float _2468 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2470 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2456);
    float _2472 = in.m_72.x;
    float _2474 = _2466 * _2464;
    float _2476 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2468);
    float _2478 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2460);
    float _2480 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2482 = -_2474;
    float _2484 = _2482 + 1.0;
    float _2486 = _2440 * _2430;
    float _2488 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2470);
    float _2490 = _2440 * _2432;
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2474);
    float _2494 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2496 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2434);
    float _2498 = fma(_2480, _2478, _2458);
    float _2500 = _2452 * _2492;
    float _2502 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1900);
    float _2504 = _1747 * 0.5;
    float _2506 = fma(_2480, _2488, _2486);
    float _2508 = fma(_2480, _2494, _2490);
    float _2510 = -_2438;
    float _2512 = _2510 + 1.0;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2516 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2496);
    float _2518 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2520 = _2502 + _1747;
    float _2522 = _1773 + _1747;
    float _2524 = fma(_1767, -0.5, _2504);
    float _2526 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2528 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2530 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2462);
    float _2532 = _2520 * 0.5;
    float _2534 = -_1755;
    float _2536 = _2534 + 1.0;
    float _2538 = _2522 * 0.5;
    float _2540 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2436);
    float _2542 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2530);
    float _2544 = _2536 * _2518;
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    out.gl_Position.x = _1773;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _2502;
    out.gl_Position.w = _1747;
    float _2548 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2540);
    float _2550 = _2542 + _2498;
    float _2552 = -_2546;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_74.x = _2538;
    out.m_74.y = _2524;
    out.m_74.z = _2532;
    out.m_74.w = _1747;
    float _2556 = _2332 * _2514;
    float _2558 = _2516 + _2506;
    float _2560 = _2554 * _2472;
    float _2562 = _2382 * _2528;
    float _2564 = _2548 + _2508;
    out.m_76.x = _2398;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2568 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2570 = isnan(_1481);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2576 = _2572 || _2574;
    float _2578 = -_2526;
    float _2580 = _2578 + 1.0;
    out.m_78.x = _2556;
    out.m_78.y = _2562;
    out.m_80.x = _2566;
    out.m_82.x = _2550;
    out.m_82.y = _2558;
    out.m_82.z = _2564;
    float _2582 = _1747;
    float _2584 = _2502;
    float _2586 = _1767;
    float _2588 = _2580;
    float _2590 = _2560;
    float _2592 = _1820;
    if (!_2576)
    {
        _2582 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2594 = _2582;
    float _2596 = _2526 * _1795;
    float _2598 = _1806 * _2580;
    float _2600 = _2594;
    float _2602 = _2594;
    if (!_2576)
    {
        _2584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2604 = _2584;
    float _2606 = _1806 * _2596;
    float _2608 = _1816 * _2596;
    out.m_84.x = _1820;
    out.m_84.y = _1822;
    out.m_84.z = _1824;
    float _2610 = _2604;
    float _2612 = _2604;
    if (!_2576)
    {
        _2586 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2614 = _2586;
    float _2616 = fma(_1812, _2606, _1800);
    float _2618 = fma(_1814, _2606, _1802);
    float _2620 = fma(_1806, _2608, _1804);
    float _2622 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2624 = _2614;
    float _2626 = _2614;
    if (!_2576)
    {
        _2588 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2628 = _2588;
    float _2630 = _2628;
    float _2632 = _2628;
    if (!_2576)
    {
        _2590 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2634 = _2590;
    out.m_86.x = _2616;
    out.m_86.y = _2618;
    out.m_86.z = _2620;
    out.m_86.w = _2598;
    float _2636 = _2634;
    float _2638 = _2634;
    if (!_2576)
    {
        _2592 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2640 = _2592;
    bool _2642 = !_2576;
    float _2644 = _2640;
    float _2646 = _2640;
    if (!_2642)
    {
        bool _2648 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2650 = isnan(_1481);
        bool _2652 = _2648 || _2650;
        bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2656 = _2652 || _2654;
        if (!_2656)
        {
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2660 = _1481 + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2664 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2662;
            float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2670 = 1.0 / _2664;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2688 = _2660 * _2670;
            float _2690 = precise::clamp(_2688, 0.0, 1.0);
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2696 = fma(_2690, _2668, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2698 = fma(_2690, _2694, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2700 = fma(_2690, _2674, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2702 = fma(_2690, _2678, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2704 = fma(_2690, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2706 = fma(_2690, _2686, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2612 = _2700;
            _2638 = _2704;
            _2602 = _2696;
            _2632 = _2702;
            _2626 = _2698;
            _2646 = _2706;
            _2708 = true;
        }
        else
        {
            bool _2710 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2712 = isnan(_1481);
            bool _2714 = _2710 || _2712;
            bool _2716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2718 = _2714 || _2716;
            if (!_2718)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2720 = _2600;
            _2602 = _2720;
            if (!_2718)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2722 = _2610;
            _2612 = _2722;
            if (!_2718)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2724 = _2624;
            _2626 = _2724;
            if (!_2718)
            {
                _2630 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2726 = _2630;
            _2632 = _2726;
            if (!_2718)
            {
                _2636 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2728 = _2636;
            _2638 = _2728;
            if (!_2718)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2730 = _2644;
            bool _2732 = !_2718;
            _2646 = _2730;
            if (!_2732)
            {
                bool _2734 = _1481 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2736 = isnan(_1481);
                bool _2738 = _2734 || _2736;
                bool _2740 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2742 = _2738 || _2740;
                if (!_2742)
                {
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2746 = _1481 + _2744;
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2748;
                    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2756 = 1.0 / _2750;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2774 = _2746 * _2756;
                    float _2776 = precise::clamp(_2774, 0.0, 1.0);
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2782 = fma(_2776, _2754, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2784 = fma(_2776, _2780, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2786 = fma(_2776, _2760, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2788 = fma(_2776, _2764, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2790 = fma(_2776, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2792 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2612 = _2786;
                    _2638 = _2790;
                    _2602 = _2782;
                    _2632 = _2788;
                    _2626 = _2784;
                    _2646 = _2792;
                    _2708 = true;
                }
                else
                {
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2638 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2632 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2708 = false;
    float _2794 = _2612;
    float _2796 = _2638;
    float _2798 = _2602;
    float _2800 = _2632;
    float _2802 = _2626;
    float _2804 = _2646;
    float _2806 = fma(_2558, -0.5, 0.5);
    float _2808 = precise::clamp(_2806, 0.0, 1.0);
    float _2810 = -_2794;
    float _2812 = _2810 + _2796;
    float _2814 = _2622 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2816 = -_2798;
    float _2818 = _2816 + _2800;
    float _2820 = fma(_2808, _2812, _2794);
    out.m_88.x = 0.0;
    float _2822 = -_2802;
    float _2824 = _2822 + _2804;
    float _2826 = fma(_2808, _2818, _2798);
    float _2828 = _2820 * 0.586610972881317138671875;
    out.m_51.x = _2814;
    bool _2830 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2832 = fma(_2808, _2824, _2802);
    float _2834 = fma(_2826, 0.298911988735198974609375, _2828);
    bool _2836 = _1455 > 0.0;
    bool _2838 = isnan(_1455);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan(0.0);
    bool _2844 = _2840 || _2842;
    float _2846 = fma(_2832, 0.114477999508380889892578125, _2834);
    float _2848 = -_2846;
    float _2850 = _2820 + _2848;
    float _2852 = -_2846;
    float _2854 = _2826 + _2852;
    float _2856 = -_2846;
    float _2858 = _2832 + _2856;
    float _2860 = fma(_2850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    float _2862 = fma(_2854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    float _2864 = fma(_2858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2846);
    bool _2866 = !_2830;
    if (!_2866)
    {
        float _2868 = -_1385;
        float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2872 = -_1387;
        float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2876 = -_1389;
        float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2880 = _2870 * _2870;
        float _2882 = fma(_2874, _2874, _2880);
        float _2884 = fma(_2878, _2878, _2882);
        float _2886 = sqrt(_2884);
        float _2888 = rsqrt(_2884);
        float _2890 = -_2886;
        float _2892 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2894 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2896 = precise::clamp(_2894, 0.0, 1.0);
        float _2898 = _2874 * _2888;
        float _2900 = _2870 * _2888;
        float _2902 = abs(_2896);
        float _2904 = log2(_2902);
        float _2906 = _2878 * _2888;
        float _2908 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2910 = _2558 * _2900;
        float _2912 = -_2900;
        float _2914 = -_2908;
        float _2916 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2914);
        float _2918 = fma(_2550, _2898, _2910);
        float _2920 = -_2906;
        float _2922 = fma(_2920, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2916);
        float _2924 = fma(_2564, _2906, _2918);
        float _2926 = precise::clamp(_2924, 0.0, 1.0);
        float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2930 = _2922 + _2928;
        float _2932 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2934 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = exp2(_2932);
        float _2940 = _2938 * _2936;
        float _2942 = _2926 * _2940;
        float _2944 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2946 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2948 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _2944;
        out.m_88.y = _2946;
        out.m_88.z = _2948;
    }
    out.m_90.x = _2862;
    out.m_90.y = _2860;
    out.m_90.z = _2864;
    if (_2844)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2950 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2950;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

