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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_80 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_50 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3423 = false;
    bool _2792 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_129);
        out.gl_Position.z = _3708;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3777 = as_type<float>(_167);
        out.gl_Position.z = _3777;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    float _223 = in.m_60.z;
    float _225 = in.m_60.w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _233;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _255 = 1.0 / _237;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _217 + _257;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _271 = _219 * 2.0;
    float _273 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = 1.0 / _241;
    float _277 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _279 = _259 * _243;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _217 + _281;
    float _285 = fma(_273, -2.0, _261);
    float _287 = fma(_265, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = floor(_271);
    float _291 = -_253;
    float _293 = fma(_277, 2.0, _291);
    float _295 = _221 * 2.0;
    float _297 = _283 * _255;
    float _299 = _219 + _221;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = _217 + _301;
    float _305 = fma(_269, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _307 = floor(_295);
    float _309 = _299 + (-1.0);
    float _311 = _223 + _221;
    float _313 = _303 * _275;
    float _315 = _223 + _219;
    float _317 = _311 + (-1.0);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _321 = 1.0 / _251;
    bool _323 = _289 >= 0.0;
    bool _325 = isnan(_289);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _335 = as_type<int>(_317);
    if (_247)
    {
        _335 = 0;
    }
    int _337 = _335;
    float _339 = _315 + (-1.0);
    int _341 = _337;
    float _343 = _339;
    if (!_247)
    {
        _341 = 1;
    }
    int _345 = _341;
    float _347 = -_147;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    int _351 = _331 ? 0 : 1;
    float _353 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _355 = _223 * 2.0;
    bool _357 = _307 > 0.0;
    float _359 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _361 = int(_359);
    bool _363 = _307 >= 0.0;
    bool _365 = isnan(_307);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    bool _373 = _345 != 1;
    bool _375 = _289 > 0.0;
    float _377 = _229 * _321;
    int _379 = _371 ? 0 : 1;
    float _381 = floor(_355);
    int _383 = ~_379;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    int _389 = _387;
    float _391 = as_type<float>(_361);
    if (!_357)
    {
        int _393 = ~_379;
        int _395 = _393 + 1;
        _389 = _395;
    }
    int _397 = _389;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _409 = log2(_407);
    float _411 = fma(_401, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _415 = ~_351;
    int _417 = _415 + 1;
    int _419 = _417 + 1;
    int _421 = _419;
    if (!_375)
    {
        int _423 = ~_351;
        int _425 = _423 + 1;
        _421 = _425;
    }
    int _427 = _421;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    bool _433 = _381 > 0.0;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _437 = int(_435);
    bool _439 = _381 >= 0.0;
    bool _441 = isnan(_381);
    bool _443 = _439 || _441;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    float _449 = fma(_431, _313, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _451 = _447 ? 0 : 1;
    if (!_373)
    {
        _343 = _221;
    }
    float _453 = _343;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    int _459 = ~_451;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    float _465 = _453;
    int _467 = _463;
    if (_373)
    {
        _465 = _219;
    }
    float _469 = _465;
    float _471 = fma(_457, _313, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = _469;
    if (!_433)
    {
        int _475 = ~_451;
        int _477 = _475 + 1;
        _467 = _477;
    }
    int _479 = _467;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _491 = _489 != 0;
    float _493 = float(_479);
    float _495 = _409 * _147;
    float _497 = float(_113);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _501 = !_487;
    int _503 = _501 ? 0 : 1;
    bool _505 = !_483;
    int _507 = _505 ? 0 : 1;
    float _509 = exp2(_495);
    bool _511 = !_491;
    int _513 = _511 ? 0 : 1;
    float _515 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[83].z, _499);
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _527 = _525 != 0;
    float _529 = float(_361);
    float _531 = float(_437);
    float _533 = 1.0 / _497;
    if (!_373)
    {
        _391 = _221;
    }
    float _535 = _391;
    float _537 = _535;
    if (_373)
    {
        _537 = _219;
    }
    float _539 = _537;
    bool _541 = !_519;
    float _543 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _545 = 1.0 / _531;
    float _547 = _543;
    if (!_373)
    {
        _473 = _223;
    }
    float _549 = _473;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _553 = _549;
    if (_373)
    {
        _553 = _221;
    }
    float _555 = _553;
    float _557 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _559 = -_509;
    float _561 = _559 + 1.0;
    float _563 = 1.0 / _529;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _567 = 1.0 + _565;
    int _569 = abs(as_type<int>(_543));
    float _571 = _555 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_373)
    {
        _547 = _223;
    }
    float _573 = _547;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _577 = _573;
    if (_373)
    {
        _577 = _221;
    }
    float _579 = _577;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _583 = 1.0 / _567;
    float _585 = -_551;
    float _587 = fma(_557, 2.0, _585);
    float _589 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[83].w, _581);
    float _591 = fma(_571, -2.0, _575);
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = in.m_62.x;
    float _605 = in.m_62.y;
    float _607 = in.m_62.z;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _623 = float(_569);
    float _625 = _533 * _147;
    float _627 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].z, _609);
    float _629 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _621);
    float _631 = _619 ? _561 : 0.0;
    float _633 = _623 * _493;
    bool _635 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _637 = isnan(_217);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _515);
    float _649 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _285);
    float _651 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _589);
    float _653 = _563 * _147;
    float _655 = _545 * _147;
    float _657 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _627);
    float _659 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _629);
    float _661 = -_147;
    float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[81].x, _587);
    float _665 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _591);
    bool _667 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _669 = isnan(_217);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _653;
    if (_601)
    {
        float _681 = _631 * _583;
        _151 = _681;
    }
    float _683 = _151;
    float _685 = _633 * (-2.0);
    bool _687 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _689 = isnan(_217);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_645;
    float _701 = _699 + 1.0;
    float _703 = -_677;
    float _705 = _703 + 1.0;
    float _707 = fma(_319, _685, _319);
    bool _709 = !_523;
    int _711 = _709 ? 0 : 1;
    float _713 = _697 * _701;
    float _715 = -_697;
    float _717 = _715 + 1.0;
    bool _719 = !_527;
    int _721 = _719 ? 0 : 1;
    float _723 = _645 * _705;
    int _725 = abs(_711);
    float _727 = fma(_685, _603, _603);
    bool _729 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _731 = isnan(_217);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    int _741 = abs(_721);
    bool _743 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_217);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _739 * _717;
    float _757 = -_739;
    float _759 = _757 + 1.0;
    float _761 = _219 + (-0.5);
    float _763 = float(_427);
    float _765 = float(_725);
    float _767 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].x, _727);
    float _769 = _753 * _759;
    float _771 = float(_397);
    float _773 = -_753;
    float _775 = _773 + 1.0;
    float _777 = _765 * _763;
    float _779 = float(_741);
    float _781 = fma(_707, _683, _767);
    float _783 = _411 * _769;
    float _785 = _777 * (-2.0);
    float _787 = _287 * _769;
    float _789 = _779 * _771;
    float _791 = _781 * 0.15915493667125701904296875;
    float _793 = fma(_785, _605, _605);
    float _795 = _221 + (-0.5);
    float _797 = fma(_333, _785, _333);
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].y, _783);
    float _801 = _789 * (-2.0);
    float _803 = in.m_64.x;
    float _805 = in.m_64.y;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].y, _793);
    float _809 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _811 = fma(_353, _801, _353);
    float _813 = fma(_801, _607, _607);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _823 = fma(_413, _755, _799);
    float _825 = _223 + (-0.5);
    float _827 = fma(_305, _755, _809);
    float _829 = fma(_817, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _831 = fma(_821, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _833 = fma(_449, _713, _823);
    float _835 = fma(_797, _683, _807);
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[196].z, _813);
    float _839 = fma(_471, _713, _827);
    float _841 = in.m_50.x;
    float _843 = in.m_50.y;
    float _845 = in.m_50.z;
    float _847 = fma(_831, _723, _833);
    float _849 = fma(_811, _683, _837);
    float _851 = fma(_829, _723, _839);
    float _853 = in.m_66.x;
    float _855 = in.m_66.y;
    float _857 = in.m_66.z;
    float _859 = in.m_66.w;
    float _861 = _835 * 0.15915493667125701904296875;
    float _863 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[147].y, _847);
    float _865 = _849 * 0.15915493667125701904296875;
    float _867 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[147].x, _851);
    float _869 = _791 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _863 * _805;
    float _875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _877 = _867 * _803;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _881 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _883 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _885 = _861 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = in.m_68.x;
    float _891 = in.m_68.y;
    float _893 = in.m_68.z;
    float _895 = in.m_68.w;
    float _897 = _881 * _875;
    float _899 = _883 * _879;
    float _901 = _861 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _843 * _855;
    float _907 = fma(_841, _853, _905);
    float _909 = _791 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _871 * _887;
    float _915 = fma(_845, _857, _907);
    float _917 = _865 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _871 * _903;
    float _923 = _865 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = _911 * _887;
    float _929 = _911 * _903;
    float _931 = _871 * _919;
    float _933 = _911 * _919;
    float _935 = _903 * _919;
    float _937 = _887 * _919;
    float _939 = _931 * _897;
    float _941 = fma(_925, _921, _927);
    float _943 = -_913;
    float _945 = fma(_925, _929, _943);
    float _947 = -_929;
    float _949 = fma(_925, _913, _947);
    float _951 = -_897;
    float _953 = _925 * _951;
    float _955 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _957 = fma(_941, _899, _939);
    float _959 = _933 * _897;
    float _961 = fma(_935, _899, _953);
    float _963 = fma(_925, _927, _921);
    float _965 = fma(_949, _955, _957);
    float _967 = _843 * _891;
    float _969 = fma(_945, _899, _959);
    float _971 = fma(_937, _955, _961);
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _975 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _977 = fma(_841, _889, _967);
    float _979 = fma(_963, _955, _969);
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].x, _973);
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].x, _975);
    float _985 = fma(_845, _893, _977);
    float _987 = _915 + _859;
    float _989 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[24].z, _981);
    float _991 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[26].z, _983);
    float _993 = _985 + _895;
    float _995 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1001 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    float _1003 = _987 + _997;
    float _1005 = _993 + _999;
    float _1007 = in.m_70.x;
    float _1009 = in.m_70.y;
    float _1011 = in.m_70.z;
    float _1013 = in.m_70.w;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1019 = _1003 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1023 = _1005 + _1021;
    float _1025 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1027 = _1019 * _1019;
    float _1029 = _1023 * _1023;
    float _1031 = _1027 + _1029;
    float _1033 = sqrt(_1031);
    float _1035 = _843 * _1009;
    float _1037 = fma(_841, _1007, _1035);
    bool _1039 = _1033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = _1033 + _1041;
    float _1045 = fma(_845, _1011, _1037);
    float _1047 = _1045 + _1013;
    float _1049 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1051 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1053 = 0.0;
    float _1055 = _1031;
    float _1057 = _1043;
    float _1059 = _843;
    float _1061 = _1003;
    float _1063 = _1005;
    float _1065 = _1025;
    float _1067 = _1027;
    float _1069 = _1029;
    if (_1039)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1053 = _1071;
    }
    float _1073 = _1053;
    if (_1039)
    {
        float _1075 = rsqrt(_1031);
        _1055 = _1075;
    }
    float _1077 = _1055;
    if (_1039)
    {
        float _1079 = _1043 * _1073;
        _1057 = _1079;
    }
    float _1081 = _1057;
    float _1083 = _1047 + _1025;
    float _1085 = floor(_1049);
    float _1087 = _1081;
    float _1089 = _1083;
    if (_1039)
    {
        float _1091 = _1081 * 0.15915493667125701904296875;
        _1087 = _1091;
    }
    float _1093 = _1087;
    float _1095 = _1093;
    if (_1039)
    {
        float _1097 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1059 = _1097;
    }
    float _1099 = _1059;
    float _1101 = _841;
    float _1103 = _1099;
    if (_1039)
    {
        float _1105 = _1093 * 6.283185482025146484375;
        float _1107 = sin(_1105);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = floor(_1051);
    if (_1039)
    {
        float _1113 = fma(_1109, _1099, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1103 = _1113;
    }
    float _1115 = _1103;
    float _1117 = _1115;
    if (_1039)
    {
        float _1119 = _1077 * _1115;
        _1117 = _1119;
    }
    float _1121 = _1117;
    float _1123 = -_1085;
    float _1125 = _1049 + _1123;
    if (_1039)
    {
        float _1127 = fma(_1019, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1061 = _1127;
    }
    float _1129 = _1061;
    if (_1039)
    {
        float _1131 = fma(_1023, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1063 = _1131;
    }
    float _1133 = _1063;
    float _1135 = -_1111;
    float _1137 = _1051 + _1135;
    float _1139 = fma(_1129, 6.2500002968590706586837768554688e-05, 0.5);
    float _1141 = fma(_1133, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5272 = float2(_1139, _1141);
    float3 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5272, float2(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5272, float2(0.0), isnan(_5272)), level(0.0)).xyz;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float2 _5288 = float2(_1125, _1137);
    float _1153 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5288, float2(0.0), isnan(_5288)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5288, float2(0.0), isnan(_5288)), level(0.0)).x;
    float _1155 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1157 = int(_1155);
    if (_247)
    {
        float _1159 = in.m_60.x;
        _1065 = _1159;
    }
    float _1161 = _1065;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1165 = _1163 != 0;
    float _1167 = -_657;
    float _1169 = _1167 + 1.0;
    int _1171 = abs(_503);
    float _1173 = _1161;
    if (!_247)
    {
        float _1175 = in.m_60.y;
        _1173 = _1175;
    }
    float _1177 = _1173;
    int _1179 = abs(_513);
    float _1181 = -_659;
    float _1183 = _1181 + 1.0;
    float _1185 = trunc(_653);
    int _1187 = int(_1185);
    float _1189 = float(uint(_1157));
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1193 = int(_1191);
    if (_247)
    {
        _679 = 1.0;
    }
    float _1195 = _679;
    float _1197 = _1195;
    if (!_247)
    {
        _1197 = 1.2345600128173828125;
    }
    float _1199 = _1197;
    float _1201 = float(uint(_1187));
    float _1203 = 1.0 / _1189;
    float _1205 = _1199 * _1177;
    int _1207 = ~_1157;
    int _1209 = _1207 + 1;
    float _1211 = float(uint(_1193));
    float _1213 = trunc(_655);
    int _1215 = int(_1213);
    int _1217 = ~_1157;
    int _1219 = _1217 + 1;
    int _1221 = as_type<int>(_1203) + (-2);
    float _1223 = 1.0 / _1211;
    float _1225 = as_type<float>(_1221) * _1201;
    float _1227 = float(uint(_1215));
    float _1229 = floor(_1205);
    float _1231 = float(_1215);
    float _1233 = trunc(_1225);
    float _1235 = precise::max(_1233, 0.0);
    uint _1238 = uint(_1235);
    float _1240 = -_1229;
    float _1242 = _1205 + _1240;
    float _1244 = _1223;
    if (_1039)
    {
        float _1246 = _1093 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        _1095 = _1248;
    }
    float _1250 = _1095;
    int _1252 = _1219 * int(_1238);
    int _1254 = _1252 + _1187;
    float _1256 = float(uint(_1254));
    float _1258 = as_type<float>(_1221) * _1256;
    int _1260 = as_type<int>(_1223) + (-2);
    if (_247)
    {
        _1244 = 1.0;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (!_247)
    {
        _1264 = 7.345489978790283203125;
    }
    float _1266 = _1264;
    float _1268 = trunc(_1258);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    float _1274 = as_type<float>(_1260) * _1227;
    int _1276 = ~_1193;
    int _1278 = _1276 + 1;
    float _1280 = _1266 * _219;
    float _1282 = trunc(_1274);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = int(_1238) + int(_1272);
    float _1290 = floor(_1280);
    float _1292 = float(_1157);
    int _1294 = _1209 * _1288;
    int _1296 = _1294 + _1187;
    float _1298 = float(_1187);
    int _1300 = _1278 * int(_1286);
    int _1302 = _1300 + _1215;
    bool _1304 = _1298 >= _1292;
    bool _1306 = isnan(_1298);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(_1292);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    bool _1316 = uint(_1296) >= uint(_1157);
    float _1318 = float(uint(_1302));
    float _1320 = trunc(_1314);
    int _1322 = int(_1320);
    bool _1324 = !_1316;
    int _1326 = _1324 ? 0 : (-1);
    float _1328 = -_1290;
    float _1330 = _1280 + _1328;
    float _1332 = as_type<float>(_1260) * _1318;
    int _1334 = ~_1288;
    int _1336 = _1334 + _1326;
    int _1338 = _1336 + 1;
    float _1340 = _1330 * _1292;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1344 = _1342 != 0;
    float _1346 = trunc(_1332);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    int _1352 = _1157 * _1338;
    int _1354 = _1352 + _1187;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    float _1372 = _1292 * _625;
    bool _1374 = !_1344;
    int _1376 = _1374 ? 0 : 1;
    bool _1378 = _1157 == 0;
    float _1380 = trunc(_1340);
    int _1382 = int(_1380);
    int _1384 = ~_1322;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    bool _1390 = !_1378;
    int _1392 = _1390 ? _1354 : (-1);
    int _1394 = _1157 + (-1);
    int _1396 = abs(_1376);
    int _1398 = _1392 * _1388;
    int _1400 = int(_1286) + int(_1350);
    float _1402 = trunc(_1372);
    int _1404 = int(_1402);
    int _1406 = ~_1193;
    int _1408 = _1406 + 1;
    int _1410 = _1322 * _1394;
    int _1412 = _1410 + _1398;
    float _1414 = float(_1193);
    int _1416 = _1408 * _1400;
    int _1418 = _1416 + _1215;
    bool _1420 = _1231 >= _1414;
    bool _1422 = isnan(_1231);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(_1414);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = _1242 * _1414;
    bool _1434 = !_1165;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _1412 * _1171;
    bool _1440 = uint(_1418) >= uint(_1193);
    float _1442 = trunc(_1430);
    int _1444 = int(_1442);
    int _1446 = abs(_507);
    float _1448 = _1414 * _625;
    bool _1450 = !_1440;
    int _1452 = _1450 ? 0 : (-1);
    int _1454 = _1404 * _1446;
    int _1456 = _1454 + _1438;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1460 = _1458 != 0;
    float _1462 = trunc(_1432);
    int _1464 = int(_1462);
    int _1466 = ~_1400;
    int _1468 = _1466 + _1452;
    int _1470 = _1468 + 1;
    int _1472 = _1382 * _1396;
    int _1474 = _1472 + _1187;
    bool _1476 = !_1460;
    int _1478 = _1476 ? 0 : 1;
    bool _1480 = _1193 == 0;
    int _1482 = _1193 * _1470;
    int _1484 = _1482 + _1215;
    int _1486 = abs(_1478);
    float _1488 = trunc(_1448);
    int _1490 = int(_1488);
    int _1492 = abs(_1436);
    int _1494 = ~_1444;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = _1474 * _1179;
    int _1502 = _1500 + _1456;
    bool _1504 = !_1480;
    int _1506 = _1504 ? _1484 : (-1);
    int _1508 = _1464 * _1486;
    int _1510 = _1508 + _1215;
    int _1512 = _1193 + (-1);
    int _1514 = _1382 * _1492;
    int _1516 = _1514 + _1502;
    int _1518 = ~_1157;
    int _1520 = _1518 + 1;
    int _1522 = _1506 * _1498;
    bool _1524 = !_1362;
    int _1526 = _1524 ? 0 : 1;
    float _1528 = float(uint(_1516));
    int _1530 = _1444 * _1512;
    int _1532 = _1530 + _1522;
    bool _1534 = !_1358;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = abs(_1526);
    float _1540 = as_type<float>(_1221) * _1528;
    bool _1542 = !_1366;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1536);
    bool _1548 = !_1370;
    int _1550 = _1548 ? 0 : 1;
    float _1552 = trunc(_1540);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = abs(_1544);
    int _1560 = _1532 * _1538;
    int _1562 = abs(_1550);
    int _1564 = _1490 * _1546;
    int _1566 = _1564 + _1560;
    float _1568 = float(uint(_1510));
    int _1570 = ~_1157;
    int _1572 = _1570 + 1;
    int _1574 = _1510 * _1558;
    int _1576 = _1574 + _1566;
    int _1578 = ~_1157;
    int _1580 = _1578 + 1;
    int _1582 = ~_1193;
    int _1584 = _1582 + 1;
    int _1586 = _1464 * _1562;
    int _1588 = _1586 + _1576;
    float _1590 = float(uint(_1474));
    int _1592 = _1580 * int(_1556);
    int _1594 = _1592 + _1516;
    int _1596 = ~_1193;
    int _1598 = _1596 + 1;
    float _1600 = float(uint(_1588));
    float _1602 = as_type<float>(_1221) * _1590;
    float _1604 = float(uint(_1594));
    float _1606 = as_type<float>(_1260) * _1600;
    float _1608 = as_type<float>(_1221) * _1604;
    float _1610 = trunc(_1602);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    float _1616 = as_type<float>(_1260) * _1568;
    float _1618 = trunc(_1606);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    float _1624 = trunc(_1608);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    int _1630 = _1598 * int(_1622);
    int _1632 = _1630 + _1588;
    float _1634 = trunc(_1616);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = float(uint(_1632));
    int _1642 = _1520 * int(_1614);
    int _1644 = _1642 + _1474;
    int _1646 = int(_1556) + int(_1628);
    float _1648 = as_type<float>(_1260) * _1640;
    float _1650 = float(uint(_1644));
    int _1652 = _1572 * _1646;
    int _1654 = _1652 + _1516;
    float _1656 = trunc(_1648);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    float _1662 = as_type<float>(_1221) * _1650;
    bool _1664 = uint(_1654) >= uint(_1157);
    int _1666 = _1584 * int(_1638);
    int _1668 = _1666 + _1510;
    bool _1670 = !_1664;
    int _1672 = _1670 ? 0 : (-1);
    float _1674 = float(uint(_1668));
    int _1676 = ~_1646;
    int _1678 = _1676 + _1672;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1662);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1193;
    int _1690 = _1688 + 1;
    float _1692 = as_type<float>(_1260) * _1674;
    int _1694 = _1157 * _1680;
    int _1696 = _1694 + _1516;
    int _1698 = int(_1622) + int(_1660);
    float _1700 = trunc(_1692);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    int _1706 = ~_1157;
    int _1708 = _1706 + 1;
    int _1710 = _1690 * _1698;
    int _1712 = _1710 + _1588;
    bool _1714 = !_1378;
    int _1716 = _1714 ? _1696 : (-1);
    out.m_72.x = _1147;
    out.m_72.y = _1149;
    out.m_72.z = _1151;
    int _1718 = int(_1614) + int(_1686);
    int _1720 = _1716 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = _1716 & 3;
    bool _1726 = _1724 != 0;
    bool _1728 = uint(_1712) >= uint(_1193);
    int _1730 = _1722 ? 0 : 1;
    bool _1732 = uint(_1724) > 1u;
    bool _1734 = uint(_1724) >= 2u;
    bool _1736 = !_1728;
    int _1738 = _1736 ? 0 : (-1);
    int _1740 = _1734 ? 0 : 1;
    bool _1742 = _1724 != 3;
    bool _1744 = _225 > 0.5;
    int _1746 = _1708 * _1718;
    int _1748 = _1746 + _1474;
    int _1750 = ~_1193;
    int _1752 = _1750 + 1;
    int _1754 = int(_1638) + int(_1704);
    int _1756 = ~_1730;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = ~_1698;
    int _1764 = _1762 + _1738;
    int _1766 = _1764 + 1;
    int _1768 = _1752 * _1754;
    int _1770 = _1768 + _1510;
    int _1772 = _1760;
    if (!_1732)
    {
        int _1774 = ~_1730;
        int _1776 = _1774 + 1;
        _1772 = _1776;
    }
    int _1778 = _1772;
    bool _1780 = uint(_1748) >= uint(_1157);
    int _1782 = _1193 * _1766;
    int _1784 = _1782 + _1588;
    int _1786 = ~_1740;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = !_1780;
    int _1794 = _1792 ? 0 : (-1);
    int _1796 = _1790;
    if (_1742)
    {
        int _1798 = ~_1740;
        int _1800 = _1798 + 1;
        _1796 = _1800;
    }
    int _1802 = _1796;
    bool _1804 = uint(_1770) >= uint(_1193);
    int _1806 = ~_1718;
    int _1808 = _1806 + _1794;
    int _1810 = _1808 + 1;
    float _1812 = -_187;
    int _1814 = _1744 ? as_type<int>(_1812) : as_type<int>(_187);
    bool _1816 = !_1480;
    int _1818 = _1816 ? _1784 : (-1);
    int _1820 = _1157 * _1810;
    int _1822 = _1820 + _1474;
    int _1824 = _1716 >> 31;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1828 = _1826 != 0;
    bool _1830 = !_1804;
    int _1832 = _1830 ? 0 : (-1);
    int _1834 = _1818 >> 31;
    int _1836 = _1824 & 3;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1840 = _1838 != 0;
    bool _1842 = !_1828;
    int _1844 = _1842 ? 0 : 1;
    int _1846 = _1818 & 3;
    bool _1848 = _1846 != 0;
    int _1850 = ~_1754;
    int _1852 = _1850 + _1832;
    int _1854 = _1852 + 1;
    int _1856 = _1834 & 3;
    int _1858 = _1716 + _1836;
    int _1860 = _1193 * _1854;
    int _1862 = _1860 + _1510;
    bool _1864 = !_1840;
    int _1866 = _1864 ? 0 : 1;
    float _1868 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1870 = int(_1868);
    bool _1872 = uint(_1846) > 1u;
    int _1874 = _1818 + _1856;
    int _1876 = _1858 >> 2;
    int _1878 = _1818 & 3;
    bool _1880 = _1878 != 0;
    int _1882 = _1874 >> 2;
    int _1884 = _1876 << 4;
    int _1886 = _1884 + 368;
    int _1888 = _1880 ? 0 : 1;
    bool _1890 = _1724 != 3;
    int _1892 = _1882 << 4;
    int _1894 = _1892 + 512;
    uint _1896 = uint(int(uint(_1886) >> uint(2)));
    uint _1898 = uint(int(uint(int(_1896)) >> uint(2)));
    int _1900 = int(_1896) & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = int(_1896) + 1;
    uint _1906 = uint(int(uint(_1904) >> uint(2)));
    int _1908 = _1904 & 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[int(_1906)][_1908];
    int _1912 = ~_1888;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1916;
    if (!_1872)
    {
        int _1920 = ~_1888;
        int _1922 = _1920 + 1;
        _1918 = _1922;
    }
    int _1924 = _1918;
    bool _1926 = !_1726;
    int _1928 = _1926 ? 0 : 1;
    bool _1930 = _1846 != 3;
    uint _1932 = uint(int(uint(_1894) >> uint(2)));
    uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
    int _1936 = int(_1932) & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = int(_1932) + 1;
    uint _1942 = uint(int(uint(_1940) >> uint(2)));
    int _1944 = _1940 & 3;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[int(_1942)][_1944];
    bool _1948 = uint(_1846) >= 2u;
    bool _1950 = !_1378;
    int _1952 = _1950 ? _1822 : (-1);
    int _1954 = _1948 ? 0 : 1;
    bool _1956 = _1846 != 3;
    bool _1958 = !_1848;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = !_1890;
    int _1964 = _1962 ? 0 : (-1);
    int _1966 = ~_1954;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1974 = _1972 != 0;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1982 = _1980 != 0;
    int _1984 = _1970;
    if (_1930)
    {
        int _1986 = ~_1954;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    int _1992 = _1886 + 8;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    uint _1996 = uint(int(uint(int(_1994)) >> uint(2)));
    int _1998 = int(_1994) & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    int _2002 = int(_1994) + 1;
    uint _2004 = uint(int(uint(_2002) >> uint(2)));
    int _2006 = _2002 & 3;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[int(_2004)][_2006];
    int _2010 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2012 = _2010 != 0;
    int _2014 = abs(_1778);
    int _2016 = abs(_1924);
    bool _2018 = !_1956;
    int _2020 = _2018 ? 0 : (-1);
    int _2022 = _1894 + 8;
    uint _2024 = uint(int(uint(_2022) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    bool _2040 = _219 > 0.5;
    int _2042 = abs(_1928);
    int _2044 = ~_2014;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    bool _2050 = !_1480;
    int _2052 = _2050 ? _1862 : (-1);
    float _2054 = -_183;
    int _2056 = _2040 ? as_type<int>(_2054) : as_type<int>(_183);
    int _2058 = _2048 * as_type<int>(_1910);
    bool _2060 = _221 > 0.5;
    bool _2062 = _223 > 0.5;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2066 = abs(_1960);
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2070 = ~_2016;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2078 = ~_2042;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    float _2084 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = _2074 * as_type<int>(_1946);
    int _2088 = ~_2066;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2082 * as_type<int>(_1902);
    int _2096 = _2094 + _2058;
    int _2098 = abs(_1802);
    float _2100 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2102 = int(_2100);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2110 = _2092 * as_type<int>(_1938);
    int _2112 = _2110 + _2086;
    float _2114 = as_type<float>(_2066);
    if (_1039)
    {
        float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2118 = _1129 + _2116;
        _2114 = _2118;
    }
    float _2120 = _2114;
    int _2122 = abs(_1964);
    out.m_74.x = _2084;
    out.m_74.y = _2106;
    out.m_74.z = _2108;
    out.m_74.w = _2104;
    int _2124 = abs(_1990);
    float _2126 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2128 = abs(_2020);
    if (_1039)
    {
        float _2130 = _2120 * _2120;
        _1067 = _2130;
    }
    float _2132 = _1067;
    int _2134 = ~_2098;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2126);
    bool _2142 = !_1974;
    float _2144 = _2142 ? _187 : as_type<float>(_1814);
    bool _2146 = !_2012;
    float _2148 = _2146 ? _183 : as_type<float>(_2056);
    int _2150 = _2138 * as_type<int>(_2000);
    int _2152 = _2150 + _2096;
    int _2154 = ~_2124;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2162 = float(uint(_1870));
    int _2164 = _2158 * as_type<int>(_2030);
    int _2166 = _2164 + _2112;
    int _2168 = ~_2122;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    float _2174 = -_925;
    float _2176 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2160);
    int _2178 = ~_2128;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    float _2184 = 1.0 / _2162;
    int _2186 = abs(_1844);
    int _2188 = _2172 * as_type<int>(_2008);
    int _2190 = _2188 + _2152;
    float _2192 = float(uint(_2102));
    float _2194 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2196 = ~_2186;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    float _2202 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2204 = _2182 * as_type<int>(_2038);
    int _2206 = _2204 + _2166;
    int _2208 = abs(_1870);
    float _2210 = 1.0 / _2192;
    int _2212 = abs(_1866);
    float _2214 = -_925;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2194);
    float _2218 = -_925;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    int _2222 = _2190 * _2200;
    int _2224 = abs(_2102);
    float _2226 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2228 = float(uint(_2208));
    int _2230 = _1952 * _2186;
    int _2232 = _2230 + _2222;
    int _2234 = ~_2212;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    float _2240 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2242 = float(uint(_2224));
    float _2244 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    float _2246 = 1.0 / _2228;
    int _2248 = _2206 * _2238;
    float _2250 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    int _2252 = as_type<int>(_2184) + (-2);
    float _2254 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2240);
    float _2256 = float(uint(_2232));
    int _2258 = _2052 * _2212;
    int _2260 = _2258 + _2248;
    int _2262 = as_type<int>(_2210) + (-2);
    float _2264 = 1.0 / _2242;
    float _2266 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = as_type<float>(_2252) * _2256;
    int _2270 = abs(_2232);
    float _2272 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2274 = ~_1870;
    int _2276 = _2274 + 1;
    float _2278 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    float _2280 = float(uint(_2260));
    float _2282 = trunc(_2268);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    float _2288 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = as_type<float>(_2262) * _2280;
    int _2292 = as_type<int>(_2246) + (-2);
    float _2294 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    int _2296 = abs(_2260);
    float _2298 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2278);
    float _2300 = float(uint(_2270));
    float _2302 = trunc(_2290);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    int _2308 = as_type<int>(_2264) + (-2);
    float _2310 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = float(uint(_2296));
    float _2314 = as_type<float>(_2292) * _2300;
    float _2316 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2318 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2320 = trunc(_2314);
    float _2322 = precise::max(_2320, 0.0);
    uint _2324 = uint(_2322);
    float _2326 = as_type<float>(_2308) * _2312;
    int _2328 = _2276 * int(_2286);
    int _2330 = _2328 + _2232;
    float _2332 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2334 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2294);
    float _2336 = float(uint(_2330));
    float _2338 = trunc(_2326);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2318);
    int _2346 = ~_2102;
    int _2348 = _2346 + 1;
    int _2350 = ~_2208;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2252) * _2336;
    int _2356 = ~_2224;
    int _2358 = _2356 + 1;
    int _2360 = _2348 * int(_2306);
    int _2362 = _2360 + _2260;
    int _2364 = _2352 * int(_2324);
    int _2366 = _2364 + _2270;
    float _2368 = as_type<float>(_2358);
    float _2370 = _2334;
    if (_1039)
    {
        float _2372 = _1250 + (-1.0);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = float(uint(_2362));
    float _2378 = trunc(_2354);
    float _2380 = precise::max(_2378, 0.0);
    uint _2382 = uint(_2380);
    float _2384 = _2374;
    if (_1039)
    {
        float _2386 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2386;
    }
    float _2388 = _2384;
    int _2390 = _2358 * int(_2342);
    int _2392 = _2390 + _2296;
    float _2394 = float(uint(_2366));
    float _2396 = _2394;
    if (_1039)
    {
        float _2398 = fma(_1083, _1250, _2388);
        _1089 = _2398;
    }
    float _2400 = _1089;
    float _2402 = as_type<float>(_2262) * _2376;
    float _2404 = float(uint(_2392));
    float _2406 = as_type<float>(_2292) * _2394;
    float _2408 = -_187;
    int _2410 = _2060 ? as_type<int>(_2408) : as_type<int>(_187);
    float _2412 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2414 = -_183;
    int _2416 = _2062 ? as_type<int>(_2414) : as_type<int>(_183);
    float _2418 = trunc(_2402);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    bool _2424 = !_1978;
    float _2426 = _2424 ? _187 : as_type<float>(_2410);
    float _2428 = as_type<float>(_2308) * _2404;
    bool _2430 = !_1982;
    float _2432 = _2430 ? _183 : as_type<float>(_2416);
    float _2434 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2436 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2254);
    float _2438 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2440 = _2412 * _2250;
    float _2442 = trunc(_2406);
    float _2444 = precise::max(_2442, 0.0);
    uint _2446 = uint(_2444);
    float _2448 = _2412 * _2226;
    float _2450 = _2412 * _2244;
    if (_1039)
    {
        float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2454 = _1133 + _2452;
        _2396 = _2454;
    }
    float _2456 = _2396;
    float _2458 = fma(_2438, _2434, _2440);
    float _2460 = fma(_2438, _2298, _2448);
    float _2462 = fma(_2438, _2436, _2450);
    if (_1039)
    {
        float _2464 = _2456 * _2456;
        _1069 = _2464;
    }
    float _2466 = _1069;
    float _2468 = trunc(_2428);
    float _2470 = precise::max(_2468, 0.0);
    uint _2472 = uint(_2470);
    int _2474 = int(_2286) + int(_2382);
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2478 = _2400 + _2476;
    int _2480 = ~_1870;
    int _2482 = _2480 + 1;
    out.m_76.x = _2434;
    out.m_76.y = _2298;
    out.m_76.z = _2436;
    int _2484 = ~_2102;
    int _2486 = _2484 + 1;
    float _2488 = fma(_2478, _2478, _2132);
    int _2490 = int(_2306) + int(_2422);
    int _2492 = _2482 * _2474;
    int _2494 = _2492 + _2232;
    int _2496 = ~_2208;
    int _2498 = _2496 + 1;
    int _2500 = int(_2324) + int(_2446);
    float _2502 = _2488 + _2466;
    bool _2504 = uint(_2494) >= uint(_1870);
    int _2506 = _2486 * _2490;
    int _2508 = _2506 + _2260;
    int _2510 = int(_2342) + int(_2472);
    int _2512 = _2498 * _2500;
    int _2514 = _2512 + _2270;
    int _2516 = ~_2224;
    int _2518 = _2516 + 1;
    float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2522 = uint(_2508) >= uint(_2102);
    bool _2524 = !_2504;
    int _2526 = _2524 ? 0 : (-1);
    int _2528 = _2518 * _2510;
    int _2530 = _2528 + _2296;
    bool _2532 = uint(_2514) >= uint(_2208);
    bool _2534 = !_2522;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2540 = ~_2474;
    int _2542 = _2540 + _2526;
    int _2544 = _2542 + 1;
    int _2546 = _2232 ^ _1870;
    int _2548 = ~_2490;
    int _2550 = _2548 + _2536;
    int _2552 = _2550 + 1;
    int _2554 = _1870 * _2544;
    int _2556 = _2554 + _2232;
    bool _2558 = _1870 == 0;
    float _2560 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2562 = !_2532;
    int _2564 = _2562 ? 0 : (-1);
    float _2566 = fma(_2412, _2412, 1.0);
    uint _2568 = uint(int(uint(_2546) >> uint(31)));
    float _2570 = sqrt(_2502);
    bool _2572 = uint(_2530) >= uint(_2224);
    int _2574 = _2260 ^ _2102;
    int _2576 = _2102 * _2552;
    int _2578 = _2576 + _2260;
    bool _2580 = _1870 == 0;
    float _2582 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2584 = ~_2564;
    int _2586 = _2500 + _2584;
    int _2588 = _2586 + 1;
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2592 = ~int(_2568);
    int _2594 = _2592 + 1;
    bool _2596 = !_2558;
    int _2598 = _2596 ? _2556 : (-1);
    bool _2600 = !_2572;
    int _2602 = _2600 ? 0 : (-1);
    uint _2604 = uint(int(uint(_2574) >> uint(31)));
    int _2606 = _2588 ^ _2594;
    float _2608 = float(_2598);
    bool _2610 = _2102 == 0;
    int _2612 = ~_2602;
    int _2614 = _2510 + _2612;
    int _2616 = _2614 + 1;
    int _2618 = ~int(_2604);
    int _2620 = _2618 + 1;
    bool _2622 = _2102 == 0;
    float _2624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2626 = ~_2594;
    int _2628 = _2626 + _2606;
    int _2630 = _2628 + 1;
    float _2632 = fma(_2560, _2608, _349);
    int _2634 = _2616 ^ _2620;
    bool _2636 = !_2610;
    int _2638 = _2636 ? _2578 : (-1);
    bool _2640 = !_2580;
    int _2642 = _2640 ? _2630 : (-1);
    float _2644 = rsqrt(_2566);
    int _2646 = ~_2620;
    int _2648 = _2646 + _2634;
    int _2650 = _2648 + 1;
    float _2652 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2654 = float(_2638);
    float _2656 = _2148 + 0.5;
    float _2658 = float(_2642);
    bool _2660 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2662 = isnan(_2570);
    bool _2664 = _2660 || _2662;
    bool _2666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2668 = _2664 || _2666;
    float _2670 = fma(_2652, _2654, _663);
    bool _2672 = !_2622;
    int _2674 = _2672 ? _2650 : (-1);
    float _2676 = -_649;
    float _2678 = fma(_2582, _2658, _2676);
    float _2680 = fma(_2560, _2656, _2632);
    float _2682 = _2432 + 0.5;
    float _2684 = float(_2674);
    float _2686 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2688 = _2426 + (-0.5);
    float _2690 = _2412 * _2644;
    float _2692 = fma(_2652, _2682, _2670);
    float _2694 = -_665;
    float _2696 = fma(_2686, _2684, _2694);
    float _2698 = -_2582;
    float _2700 = fma(_2698, _2688, _2678);
    float _2702 = -_2332;
    float _2704 = _2690 * _2702;
    float _2706 = -_2334;
    float _2708 = _2690 * _2706;
    float _2710 = _2144 + (-0.5);
    float _2712 = -_2344;
    float _2714 = _2690 * _2712;
    float _2716 = fma(_2644, _2250, _2704);
    float _2718 = fma(_2644, _2226, _2708);
    float _2720 = -_2686;
    float _2722 = fma(_2720, _2710, _2696);
    float _2724 = fma(_2644, _2244, _2714);
    float _2726 = -_647;
    float _2728 = _2726 + 1.0;
    float _2730 = -_651;
    float _2732 = _2730 + 1.0;
    float _2734 = _2332 + _2458;
    float _2736 = -_1169;
    float _2738 = fma(_2148, _2736, _2680);
    float _2740 = -_2728;
    float _2742 = fma(_2432, _2740, _2692);
    float _2744 = fma(_2426, _1183, _2700);
    float _2746 = fma(_2144, _2732, _2722);
    float _2748 = _2334 + _2460;
    float _2750 = _2344 + _2462;
    out.m_78.x = _2716;
    out.m_78.y = _2718;
    out.m_78.z = _2724;
    float _2752 = _2732;
    float _2754 = _2718;
    float _2756 = _2724;
    if (!_2668)
    {
        _2752 = 1.0;
    }
    float _2758 = _2752;
    out.m_80.x = _2738;
    out.m_80.y = _2744;
    out.m_80.z = _2742;
    out.m_80.w = _2746;
    out.m_82.x = _2734;
    out.m_82.y = _2748;
    out.m_82.z = _2750;
    bool _2760 = !_2668;
    float _2762 = _2758;
    if (!_2760)
    {
        bool _2764 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2766 = isnan(_2570);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2772 = _2768 || _2770;
        if (!_2772)
        {
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = _2570 + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2786 = 1.0 / _2780;
            float _2788 = _2776 * _2786;
            float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2762 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2796 = isnan(_2570);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2570 + _2804;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2816 = 1.0 / _2810;
                float _2818 = _2806 * _2816;
                float _2820 = fma(_2818, _2814, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2762 = _2820;
                _2792 = true;
            }
            else
            {
                _2762 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2792 = false;
    float _2822 = _2762;
    float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2826 = _2400 + _2824;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2830 = _1129 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2834 = _1133 + _2832;
    float _2836 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2838 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2840 = fma(_2834, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2844 = _2836 + _2842;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2852 = _2840 + _2850;
    float _2854 = _2844 * _2844;
    float _2856 = fma(_2848, _2848, _2854);
    float _2858 = fma(_2852, _2852, _2856);
    float _2860 = rsqrt(_2858);
    float _2862 = sqrt(_2858);
    float _2864 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2866 = _2848 * _2864;
    float _2868 = _2852 * _2864;
    float _2870 = _2866 * _2866;
    float _2872 = _2868 * _2868;
    float _2874 = _2870 + _2872;
    float _2876 = sqrt(_2874);
    bool _2878 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2876 + _2880;
    float _2884 = _2860;
    float _2886 = _2882;
    float _2888 = _2844;
    float _2890 = _2866;
    if (_2878)
    {
        float _2892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2892;
    }
    float _2894 = _2884;
    if (_2878)
    {
        float _2896 = rsqrt(_2874);
        _2370 = _2896;
    }
    float _2898 = _2370;
    float _2900 = _2898;
    if (_2878)
    {
        float _2902 = _2882 * _2894;
        _2886 = _2902;
    }
    float _2904 = _2886;
    if (_2878)
    {
        float _2906 = _2904 * 0.15915493667125701904296875;
        _2754 = _2906;
    }
    float _2908 = _2754;
    float _2910 = _2894;
    if (_2878)
    {
        float _2912 = _2908 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        _2910 = _2914;
    }
    float _2916 = _2910;
    float _2918 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2920 = precise::max(0.0, _2918);
    float _2922 = _2852;
    float _2924 = _2920;
    if (_2878)
    {
        float _2926 = _2908 * 6.283185482025146484375;
        float _2928 = cos(_2926);
        _2922 = _2928;
    }
    float _2930 = _2922;
    float _2932 = -_2864;
    float _2934 = -_2920;
    float _2936 = fma(_2844, _2932, _2934);
    if (!_2878)
    {
        _2888 = _2868;
    }
    float _2938 = _2888;
    float _2940 = _2938;
    if (_2878)
    {
        float _2942 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2924 = _2942;
    }
    float _2944 = _2924;
    float _2946 = _2916;
    float _2948 = _2944;
    if (_2878)
    {
        float _2950 = fma(_2916, _2944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2756 = _2950;
    }
    float _2952 = _2756;
    float _2954 = _2952;
    if (!_2878)
    {
        _2946 = _2936;
    }
    float _2956 = _2946;
    float _2958 = _2956;
    float _2960 = _2930;
    if (_2878)
    {
        float _2962 = _2930 + (-1.0);
        _2948 = _2962;
    }
    float _2964 = _2948;
    float _2966 = _2964;
    if (_2878)
    {
        float _2968 = _2898 * _2952;
        _2954 = _2968;
    }
    float _2970 = _2954;
    if (_2878)
    {
        float _2972 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2900 = _2972;
    }
    float _2974 = _2900;
    if (_2878)
    {
        float _2976 = _2866 * _2970;
        _2890 = _2976;
    }
    float _2978 = _2890;
    if (!_2878)
    {
        _2966 = _2870;
    }
    float _2980 = _2966;
    float _2982 = _2980;
    if (_2878)
    {
        float _2984 = _2868 * _2970;
        _2940 = _2984;
    }
    float _2986 = _2940;
    if (_2878)
    {
        float _2988 = fma(_2936, _2930, _2974);
        _2958 = _2988;
    }
    float _2990 = _2958;
    if (_2878)
    {
        float _2992 = _2978 * _2978;
        _2982 = _2992;
    }
    float _2994 = _2982;
    if (!_2878)
    {
        _2960 = _2872;
    }
    float _2996 = _2960;
    float _2998 = _2996;
    if (_2878)
    {
        float _3000 = _2986 * _2986;
        _2998 = _3000;
    }
    float _3002 = _2998;
    float _3004 = fma(_2990, _2990, _2994);
    float _3006 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3008 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3010 = _3004 + _3002;
    float _3012 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3006);
    float _3014 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3018 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3016);
    float _3020 = precise::clamp(_3018, 0.0, 1.0);
    float _3022 = rsqrt(_3010);
    float _3024 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3012);
    float _3026 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3028 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3030 = -_3020;
    float _3032 = _3030 + 1.0;
    float _3034 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3036 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3026);
    float _3038 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3028);
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3042 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3008);
    float _3044 = abs(_3032);
    float _3046 = log2(_3044);
    float _3048 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3050 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3036);
    float _3052 = _3038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3054 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3042);
    float _3056 = -_3048;
    float _3058 = fma(_3056, _3040, 1.0);
    float _3060 = _3022 * _2978;
    float _3062 = _3050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3064 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3066 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3068 = _3022 * _2990;
    float _3070 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3072 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3064);
    float _3074 = _3022 * _2986;
    float _3076 = log2(_3058);
    float _3078 = -_3070;
    float _3080 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3078);
    float _3082 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3072);
    float _3084 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3086 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3088 = -_3074;
    float _3090 = fma(_3088, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3080);
    float _3092 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3082);
    float _3094 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3096 = exp2(_3084);
    float _3098 = fma(_3090, -0.5, 0.5);
    float _3100 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3086);
    float _3102 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3094);
    float _3104 = fma(_3090, 0.5, 0.5);
    float _3106 = _3068 + 1.0;
    float _3108 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3100);
    float _3110 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3102);
    float _3112 = 1.0 / _3092;
    float _3114 = fma(_3104, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3116 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3108);
    float _3118 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3110);
    float _3120 = _3076 * 0.693147182464599609375;
    float _3122 = fma(_3104, _3114, -0.212114393711090087890625);
    float _3124 = sqrt(_3098);
    float _3126 = -_3068;
    float _3128 = fma(_3096, _3106, _3126);
    float _3130 = fma(_3104, _3122, 1.570728778839111328125);
    float _3132 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3134 = fma(_3128, 0.5, 0.5);
    float _3136 = _3118 * _3112;
    float _3138 = _3116 * _3112;
    float _3140 = fma(_3136, 0.5, 0.5);
    float _3142 = fma(_3138, -0.5, 0.5);
    float _3144 = _3124 * 0.636619746685028076171875;
    float3 _8243 = float3(_3140, _3142, _3132);
    float _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8243, float3(0.0), isnan(_8243)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8243, float3(0.0), isnan(_8243)), level(0.0)).x;
    float3 _8254 = float3(_3140, _3142, _3132);
    float4 _3149 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8254, float3(0.0), isnan(_8254)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8254, float3(0.0), isnan(_8254)), level(0.0)).xyzw;
    float _3151 = _3149.x;
    float _3153 = _3149.y;
    float _3155 = _3149.z;
    float _3157 = _3149.w;
    float _3159 = -_3130;
    float _3161 = fma(_3144, _3159, 1.0);
    float2 _8275 = float2(_3161, _3134);
    float3 _3163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8275, float2(0.0), isnan(_8275)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8275, float2(0.0), isnan(_8275)), level(0.0)).xyz;
    float _3165 = _3163.x;
    float _3167 = _3163.y;
    float _3169 = _3163.z;
    float _3171 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3173 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3175 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3177 = -_1153;
    float _3179 = _3177 + 1.0;
    float _3181 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3171);
    float _3183 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3173);
    float _3185 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3175);
    float _3187 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3181);
    float _3189 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3183);
    float _3191 = _3187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3193 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3195 = 1.0 / _3191;
    float _3197 = _3193 + _3191;
    bool _3199 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3201 = isnan(_2862);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3207 = _3203 || _3205;
    float _3209 = _3197 * _3195;
    float _3211 = _3209 * 0.5;
    float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3215 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3213);
    float _3217 = in.m_84.x;
    float _3219 = 1.0 / _3215;
    float _3221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3223 = _3219 * _3221;
    float _3225 = abs(_3223);
    float _3227 = log2(_3225);
    bool _3229 = _3223 <= 8000.0;
    bool _3231 = isnan(_3223);
    bool _3233 = _3229 || _3231;
    bool _3235 = isnan(8000.0);
    bool _3237 = _3233 || _3235;
    float _3239 = float(_3237);
    float _3241 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3243 = exp2(_3241);
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3251 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3185);
    float _3253 = fma(_3247, -2.0, 3.0);
    float _3255 = _3247 * _3247;
    float _3257 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3251);
    float _3259 = exp2(_3249);
    float _3261 = _3255 * _3253;
    float _3263 = _3257 + _3092;
    out.gl_Position.x = _3118;
    out.gl_Position.y = _3116;
    out.gl_Position.z = _3257;
    out.gl_Position.w = _3092;
    float _3265 = -_3261;
    float _3267 = _3265 + 1.0;
    float _3269 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3261);
    float _3271 = _3239 * _3269;
    float _3273 = -_3259;
    float _3275 = _3273 + 1.0;
    float _3277 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3279 = _3263 * 0.5;
    float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3283 = _3257;
    float _3285 = _3116;
    float _3287 = _3118;
    float _3289 = _3092;
    float _3291 = _3281;
    float _3293 = _3155;
    if (!_3207)
    {
        _3283 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3295 = _3283;
    float _3297 = _3179 * _3277;
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = _3295;
    float _3303 = _3295;
    if (!_3207)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3305 = _3285;
    float _3307 = _3305;
    float _3309 = _3305;
    if (!_3207)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3311 = _3287;
    float _3313 = -_3299;
    float _3315 = fma(_3313, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3317 = -_3281;
    float _3319 = _3317 + 1.0;
    float _3321 = _3315 * _3217;
    float _3323 = _3311;
    float _3325 = _3311;
    if (!_3207)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3327 = _3289;
    float _3329 = _3321 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.z = _3279;
    out.m_86.w = _3092;
    out.m_88.x = _3329;
    float _3331 = _3281 * _3146;
    float _3333 = _3157 * _3319;
    float _3335 = _3327;
    float _3337 = _3327;
    if (!_3207)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3339 = _3291;
    float _3341 = _3157 * _3331;
    float _3343 = _3169 * _3331;
    float _3345 = fma(_3165, _3341, _3151);
    float _3347 = fma(_3167, _3341, _3153);
    float _3349 = fma(_3157, _3343, _3155);
    float _3351 = _3339;
    float _3353 = _3339;
    if (!_3207)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3355 = _3293;
    out.m_90.x = _3345;
    out.m_90.y = _3347;
    out.m_90.z = _3349;
    out.m_90.w = _3333;
    bool _3357 = !_3207;
    float _3359 = _3355;
    float _3361 = _3355;
    if (!_3357)
    {
        bool _3363 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3365 = isnan(_2862);
        bool _3367 = _3363 || _3365;
        bool _3369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3371 = _3367 || _3369;
        if (!_3371)
        {
            float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3375 = _2862 + _3373;
            float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3377;
            float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3385 = 1.0 / _3379;
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3403 = _3375 * _3385;
            float _3405 = precise::clamp(_3403, 0.0, 1.0);
            float _3407 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3409 = _3407 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3411 = fma(_3405, _3383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3413 = fma(_3405, _3409, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3415 = fma(_3405, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3417 = fma(_3405, _3393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3419 = fma(_3405, _3397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3421 = fma(_3405, _3401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3361 = _3415;
            _3309 = _3419;
            _3353 = _3411;
            _3303 = _3417;
            _3337 = _3413;
            _3325 = _3421;
            _3423 = true;
        }
        else
        {
            bool _3425 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3427 = isnan(_2862);
            bool _3429 = _3425 || _3427;
            bool _3431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3433 = _3429 || _3431;
            if (!_3433)
            {
                _3351 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3435 = _3351;
            _3353 = _3435;
            if (!_3433)
            {
                _3359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3437 = _3359;
            _3361 = _3437;
            if (!_3433)
            {
                _3335 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3439 = _3335;
            _3337 = _3439;
            if (!_3433)
            {
                _3301 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3441 = _3301;
            _3303 = _3441;
            if (!_3433)
            {
                _3307 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3443 = _3307;
            _3309 = _3443;
            if (!_3433)
            {
                _3323 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3445 = _3323;
            bool _3447 = !_3433;
            _3325 = _3445;
            if (!_3447)
            {
                bool _3449 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3451 = isnan(_2862);
                bool _3453 = _3449 || _3451;
                bool _3455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3457 = _3453 || _3455;
                if (!_3457)
                {
                    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3461 = _2862 + _3459;
                    float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3463;
                    float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3471 = 1.0 / _3465;
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3487 = _3485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3489 = _3461 * _3471;
                    float _3491 = precise::clamp(_3489, 0.0, 1.0);
                    float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3497 = fma(_3491, _3469, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3499 = fma(_3491, _3495, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3501 = fma(_3491, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3503 = fma(_3491, _3479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3505 = fma(_3491, _3483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3507 = fma(_3491, _3487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3361 = _3501;
                    _3309 = _3505;
                    _3353 = _3497;
                    _3303 = _3503;
                    _3337 = _3499;
                    _3325 = _3507;
                    _3423 = true;
                }
                else
                {
                    _3361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3309 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3353 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3303 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3337 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3325 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3423 = false;
    float _3509 = _3361;
    float _3511 = _3309;
    float _3513 = _3353;
    float _3515 = _3303;
    float _3517 = _3337;
    float _3519 = _3325;
    float _3521 = fma(_2748, -0.5, 0.5);
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = -_3509;
    float _3527 = _3525 + _3511;
    float _3529 = -_3513;
    float _3531 = _3529 + _3515;
    float _3533 = -_3517;
    float _3535 = _3533 + _3519;
    bool _3537 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3539 = fma(_3523, _3527, _3509);
    float _3541 = fma(_3523, _3531, _3513);
    float _3543 = fma(_3523, _3535, _3517);
    float _3545 = _3539 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3547 = fma(_3541, 0.298911988735198974609375, _3545);
    float _3549 = fma(_3543, 0.114477999508380889892578125, _3547);
    float _3551 = -_3549;
    float _3553 = _3541 + _3551;
    float _3555 = -_3549;
    float _3557 = _3539 + _3555;
    float _3559 = -_3549;
    float _3561 = _3543 + _3559;
    float _3563 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3565 = fma(_3553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    float _3567 = fma(_3557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    float _3569 = fma(_3561, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    out.m_53.x = _3563;
    out.m_94.x = _3565;
    out.m_94.y = _3567;
    out.m_94.z = _3569;
    if (!_3537)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3571 = -_2836;
    float _3573 = _3571 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3575 = -_2838;
    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3579 = -_2840;
    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3583 = _3573 * _3573;
    float _3585 = fma(_3577, _3577, _3583);
    float _3587 = fma(_3581, _3581, _3585);
    float _3589 = sqrt(_3587);
    float _3591 = rsqrt(_3587);
    float _3593 = -_3589;
    float _3595 = _3593 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3597 = _3595 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3599 = precise::clamp(_3597, 0.0, 1.0);
    float _3601 = _3577 * _3591;
    float _3603 = _3573 * _3591;
    float _3605 = abs(_3599);
    float _3607 = log2(_3605);
    float _3609 = _3581 * _3591;
    float _3611 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3613 = _2748 * _3603;
    float _3615 = -_3603;
    float _3617 = -_3611;
    float _3619 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3617);
    float _3621 = fma(_2734, _3601, _3613);
    float _3623 = -_3609;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3619);
    float _3627 = fma(_2750, _3609, _3621);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3633 = _3625 + _3631;
    float _3635 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3637 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = exp2(_3635);
    float _3643 = _3641 * _3639;
    float _3645 = _3629 * _3643;
    float _3647 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3649 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3651 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3647;
    out.m_92.y = _3649;
    out.m_92.z = _3651;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3423 = false;
    bool _2792 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_129);
        out.gl_Position.z = _3708;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3777 = as_type<float>(_167);
        out.gl_Position.z = _3777;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    float _223 = in.m_60.z;
    float _225 = in.m_60.w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _233;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _255 = 1.0 / _237;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _217 + _257;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _271 = _219 * 2.0;
    float _273 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = 1.0 / _241;
    float _277 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _279 = _259 * _243;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _217 + _281;
    float _285 = fma(_273, -2.0, _261);
    float _287 = fma(_265, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = floor(_271);
    float _291 = -_253;
    float _293 = fma(_277, 2.0, _291);
    float _295 = _221 * 2.0;
    float _297 = _283 * _255;
    float _299 = _219 + _221;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = _217 + _301;
    float _305 = fma(_269, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _307 = floor(_295);
    float _309 = _299 + (-1.0);
    float _311 = _223 + _221;
    float _313 = _303 * _275;
    float _315 = _223 + _219;
    float _317 = _311 + (-1.0);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _321 = 1.0 / _251;
    bool _323 = _289 >= 0.0;
    bool _325 = isnan(_289);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _335 = as_type<int>(_317);
    if (_247)
    {
        _335 = 0;
    }
    int _337 = _335;
    float _339 = _315 + (-1.0);
    int _341 = _337;
    float _343 = _339;
    if (!_247)
    {
        _341 = 1;
    }
    int _345 = _341;
    float _347 = -_147;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    int _351 = _331 ? 0 : 1;
    float _353 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _355 = _223 * 2.0;
    bool _357 = _307 > 0.0;
    float _359 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _361 = int(_359);
    bool _363 = _307 >= 0.0;
    bool _365 = isnan(_307);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    bool _373 = _345 != 1;
    bool _375 = _289 > 0.0;
    float _377 = _229 * _321;
    int _379 = _371 ? 0 : 1;
    float _381 = floor(_355);
    int _383 = ~_379;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    int _389 = _387;
    float _391 = as_type<float>(_361);
    if (!_357)
    {
        int _393 = ~_379;
        int _395 = _393 + 1;
        _389 = _395;
    }
    int _397 = _389;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _409 = log2(_407);
    float _411 = fma(_401, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _415 = ~_351;
    int _417 = _415 + 1;
    int _419 = _417 + 1;
    int _421 = _419;
    if (!_375)
    {
        int _423 = ~_351;
        int _425 = _423 + 1;
        _421 = _425;
    }
    int _427 = _421;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    bool _433 = _381 > 0.0;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _437 = int(_435);
    bool _439 = _381 >= 0.0;
    bool _441 = isnan(_381);
    bool _443 = _439 || _441;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    float _449 = fma(_431, _313, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _451 = _447 ? 0 : 1;
    if (!_373)
    {
        _343 = _221;
    }
    float _453 = _343;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    int _459 = ~_451;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    float _465 = _453;
    int _467 = _463;
    if (_373)
    {
        _465 = _219;
    }
    float _469 = _465;
    float _471 = fma(_457, _313, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = _469;
    if (!_433)
    {
        int _475 = ~_451;
        int _477 = _475 + 1;
        _467 = _477;
    }
    int _479 = _467;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _491 = _489 != 0;
    float _493 = float(_479);
    float _495 = _409 * _147;
    float _497 = float(_113);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _501 = !_487;
    int _503 = _501 ? 0 : 1;
    bool _505 = !_483;
    int _507 = _505 ? 0 : 1;
    float _509 = exp2(_495);
    bool _511 = !_491;
    int _513 = _511 ? 0 : 1;
    float _515 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[83].z, _499);
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _527 = _525 != 0;
    float _529 = float(_361);
    float _531 = float(_437);
    float _533 = 1.0 / _497;
    if (!_373)
    {
        _391 = _221;
    }
    float _535 = _391;
    float _537 = _535;
    if (_373)
    {
        _537 = _219;
    }
    float _539 = _537;
    bool _541 = !_519;
    float _543 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _545 = 1.0 / _531;
    float _547 = _543;
    if (!_373)
    {
        _473 = _223;
    }
    float _549 = _473;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _553 = _549;
    if (_373)
    {
        _553 = _221;
    }
    float _555 = _553;
    float _557 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _559 = -_509;
    float _561 = _559 + 1.0;
    float _563 = 1.0 / _529;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _567 = 1.0 + _565;
    int _569 = abs(as_type<int>(_543));
    float _571 = _555 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_373)
    {
        _547 = _223;
    }
    float _573 = _547;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _577 = _573;
    if (_373)
    {
        _577 = _221;
    }
    float _579 = _577;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _583 = 1.0 / _567;
    float _585 = -_551;
    float _587 = fma(_557, 2.0, _585);
    float _589 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[83].w, _581);
    float _591 = fma(_571, -2.0, _575);
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = in.m_62.x;
    float _605 = in.m_62.y;
    float _607 = in.m_62.z;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _623 = float(_569);
    float _625 = _533 * _147;
    float _627 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].z, _609);
    float _629 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _621);
    float _631 = _619 ? _561 : 0.0;
    float _633 = _623 * _493;
    bool _635 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _637 = isnan(_217);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _515);
    float _649 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _285);
    float _651 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _589);
    float _653 = _563 * _147;
    float _655 = _545 * _147;
    float _657 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _627);
    float _659 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _629);
    float _661 = -_147;
    float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[81].x, _587);
    float _665 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _591);
    bool _667 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _669 = isnan(_217);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _653;
    if (_601)
    {
        float _681 = _631 * _583;
        _151 = _681;
    }
    float _683 = _151;
    float _685 = _633 * (-2.0);
    bool _687 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _689 = isnan(_217);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_645;
    float _701 = _699 + 1.0;
    float _703 = -_677;
    float _705 = _703 + 1.0;
    float _707 = fma(_319, _685, _319);
    bool _709 = !_523;
    int _711 = _709 ? 0 : 1;
    float _713 = _697 * _701;
    float _715 = -_697;
    float _717 = _715 + 1.0;
    bool _719 = !_527;
    int _721 = _719 ? 0 : 1;
    float _723 = _645 * _705;
    int _725 = abs(_711);
    float _727 = fma(_685, _603, _603);
    bool _729 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _731 = isnan(_217);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    int _741 = abs(_721);
    bool _743 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_217);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _739 * _717;
    float _757 = -_739;
    float _759 = _757 + 1.0;
    float _761 = _219 + (-0.5);
    float _763 = float(_427);
    float _765 = float(_725);
    float _767 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].x, _727);
    float _769 = _753 * _759;
    float _771 = float(_397);
    float _773 = -_753;
    float _775 = _773 + 1.0;
    float _777 = _765 * _763;
    float _779 = float(_741);
    float _781 = fma(_707, _683, _767);
    float _783 = _411 * _769;
    float _785 = _777 * (-2.0);
    float _787 = _287 * _769;
    float _789 = _779 * _771;
    float _791 = _781 * 0.15915493667125701904296875;
    float _793 = fma(_785, _605, _605);
    float _795 = _221 + (-0.5);
    float _797 = fma(_333, _785, _333);
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].y, _783);
    float _801 = _789 * (-2.0);
    float _803 = in.m_64.x;
    float _805 = in.m_64.y;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].y, _793);
    float _809 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _811 = fma(_353, _801, _353);
    float _813 = fma(_801, _607, _607);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _823 = fma(_413, _755, _799);
    float _825 = _223 + (-0.5);
    float _827 = fma(_305, _755, _809);
    float _829 = fma(_817, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _831 = fma(_821, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _833 = fma(_449, _713, _823);
    float _835 = fma(_797, _683, _807);
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[196].z, _813);
    float _839 = fma(_471, _713, _827);
    float _841 = in.m_50.x;
    float _843 = in.m_50.y;
    float _845 = in.m_50.z;
    float _847 = fma(_831, _723, _833);
    float _849 = fma(_811, _683, _837);
    float _851 = fma(_829, _723, _839);
    float _853 = in.m_66.x;
    float _855 = in.m_66.y;
    float _857 = in.m_66.z;
    float _859 = in.m_66.w;
    float _861 = _835 * 0.15915493667125701904296875;
    float _863 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[147].y, _847);
    float _865 = _849 * 0.15915493667125701904296875;
    float _867 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[147].x, _851);
    float _869 = _791 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _863 * _805;
    float _875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _877 = _867 * _803;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _881 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _883 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _885 = _861 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = in.m_68.x;
    float _891 = in.m_68.y;
    float _893 = in.m_68.z;
    float _895 = in.m_68.w;
    float _897 = _881 * _875;
    float _899 = _883 * _879;
    float _901 = _861 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _843 * _855;
    float _907 = fma(_841, _853, _905);
    float _909 = _791 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _871 * _887;
    float _915 = fma(_845, _857, _907);
    float _917 = _865 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _871 * _903;
    float _923 = _865 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = _911 * _887;
    float _929 = _911 * _903;
    float _931 = _871 * _919;
    float _933 = _911 * _919;
    float _935 = _903 * _919;
    float _937 = _887 * _919;
    float _939 = _931 * _897;
    float _941 = fma(_925, _921, _927);
    float _943 = -_913;
    float _945 = fma(_925, _929, _943);
    float _947 = -_929;
    float _949 = fma(_925, _913, _947);
    float _951 = -_897;
    float _953 = _925 * _951;
    float _955 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _957 = fma(_941, _899, _939);
    float _959 = _933 * _897;
    float _961 = fma(_935, _899, _953);
    float _963 = fma(_925, _927, _921);
    float _965 = fma(_949, _955, _957);
    float _967 = _843 * _891;
    float _969 = fma(_945, _899, _959);
    float _971 = fma(_937, _955, _961);
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _975 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _977 = fma(_841, _889, _967);
    float _979 = fma(_963, _955, _969);
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].x, _973);
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].x, _975);
    float _985 = fma(_845, _893, _977);
    float _987 = _915 + _859;
    float _989 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[24].z, _981);
    float _991 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[26].z, _983);
    float _993 = _985 + _895;
    float _995 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1001 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    float _1003 = _987 + _997;
    float _1005 = _993 + _999;
    float _1007 = in.m_70.x;
    float _1009 = in.m_70.y;
    float _1011 = in.m_70.z;
    float _1013 = in.m_70.w;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1019 = _1003 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1023 = _1005 + _1021;
    float _1025 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1027 = _1019 * _1019;
    float _1029 = _1023 * _1023;
    float _1031 = _1027 + _1029;
    float _1033 = sqrt(_1031);
    float _1035 = _843 * _1009;
    float _1037 = fma(_841, _1007, _1035);
    bool _1039 = _1033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = _1033 + _1041;
    float _1045 = fma(_845, _1011, _1037);
    float _1047 = _1045 + _1013;
    float _1049 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1051 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1053 = 0.0;
    float _1055 = _1031;
    float _1057 = _1043;
    float _1059 = _843;
    float _1061 = _1003;
    float _1063 = _1005;
    float _1065 = _1025;
    float _1067 = _1027;
    float _1069 = _1029;
    if (_1039)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1053 = _1071;
    }
    float _1073 = _1053;
    if (_1039)
    {
        float _1075 = rsqrt(_1031);
        _1055 = _1075;
    }
    float _1077 = _1055;
    if (_1039)
    {
        float _1079 = _1043 * _1073;
        _1057 = _1079;
    }
    float _1081 = _1057;
    float _1083 = _1047 + _1025;
    float _1085 = floor(_1049);
    float _1087 = _1081;
    float _1089 = _1083;
    if (_1039)
    {
        float _1091 = _1081 * 0.15915493667125701904296875;
        _1087 = _1091;
    }
    float _1093 = _1087;
    float _1095 = _1093;
    if (_1039)
    {
        float _1097 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1059 = _1097;
    }
    float _1099 = _1059;
    float _1101 = _841;
    float _1103 = _1099;
    if (_1039)
    {
        float _1105 = _1093 * 6.283185482025146484375;
        float _1107 = sin(_1105);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = floor(_1051);
    if (_1039)
    {
        float _1113 = fma(_1109, _1099, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1103 = _1113;
    }
    float _1115 = _1103;
    float _1117 = _1115;
    if (_1039)
    {
        float _1119 = _1077 * _1115;
        _1117 = _1119;
    }
    float _1121 = _1117;
    float _1123 = -_1085;
    float _1125 = _1049 + _1123;
    if (_1039)
    {
        float _1127 = fma(_1019, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1061 = _1127;
    }
    float _1129 = _1061;
    if (_1039)
    {
        float _1131 = fma(_1023, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1063 = _1131;
    }
    float _1133 = _1063;
    float _1135 = -_1111;
    float _1137 = _1051 + _1135;
    float _1139 = fma(_1129, 6.2500002968590706586837768554688e-05, 0.5);
    float _1141 = fma(_1133, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5272 = float2(_1139, _1141);
    float3 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5272, float2(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5272, float2(0.0), isnan(_5272)), level(0.0)).xyz;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float2 _5288 = float2(_1125, _1137);
    float _1153 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5288, float2(0.0), isnan(_5288)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5288, float2(0.0), isnan(_5288)), level(0.0)).x;
    float _1155 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1157 = int(_1155);
    if (_247)
    {
        float _1159 = in.m_60.x;
        _1065 = _1159;
    }
    float _1161 = _1065;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1165 = _1163 != 0;
    float _1167 = -_657;
    float _1169 = _1167 + 1.0;
    int _1171 = abs(_503);
    float _1173 = _1161;
    if (!_247)
    {
        float _1175 = in.m_60.y;
        _1173 = _1175;
    }
    float _1177 = _1173;
    int _1179 = abs(_513);
    float _1181 = -_659;
    float _1183 = _1181 + 1.0;
    float _1185 = trunc(_653);
    int _1187 = int(_1185);
    float _1189 = float(uint(_1157));
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1193 = int(_1191);
    if (_247)
    {
        _679 = 1.0;
    }
    float _1195 = _679;
    float _1197 = _1195;
    if (!_247)
    {
        _1197 = 1.2345600128173828125;
    }
    float _1199 = _1197;
    float _1201 = float(uint(_1187));
    float _1203 = 1.0 / _1189;
    float _1205 = _1199 * _1177;
    int _1207 = ~_1157;
    int _1209 = _1207 + 1;
    float _1211 = float(uint(_1193));
    float _1213 = trunc(_655);
    int _1215 = int(_1213);
    int _1217 = ~_1157;
    int _1219 = _1217 + 1;
    int _1221 = as_type<int>(_1203) + (-2);
    float _1223 = 1.0 / _1211;
    float _1225 = as_type<float>(_1221) * _1201;
    float _1227 = float(uint(_1215));
    float _1229 = floor(_1205);
    float _1231 = float(_1215);
    float _1233 = trunc(_1225);
    float _1235 = precise::max(_1233, 0.0);
    uint _1238 = uint(_1235);
    float _1240 = -_1229;
    float _1242 = _1205 + _1240;
    float _1244 = _1223;
    if (_1039)
    {
        float _1246 = _1093 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        _1095 = _1248;
    }
    float _1250 = _1095;
    int _1252 = _1219 * int(_1238);
    int _1254 = _1252 + _1187;
    float _1256 = float(uint(_1254));
    float _1258 = as_type<float>(_1221) * _1256;
    int _1260 = as_type<int>(_1223) + (-2);
    if (_247)
    {
        _1244 = 1.0;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (!_247)
    {
        _1264 = 7.345489978790283203125;
    }
    float _1266 = _1264;
    float _1268 = trunc(_1258);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    float _1274 = as_type<float>(_1260) * _1227;
    int _1276 = ~_1193;
    int _1278 = _1276 + 1;
    float _1280 = _1266 * _219;
    float _1282 = trunc(_1274);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = int(_1238) + int(_1272);
    float _1290 = floor(_1280);
    float _1292 = float(_1157);
    int _1294 = _1209 * _1288;
    int _1296 = _1294 + _1187;
    float _1298 = float(_1187);
    int _1300 = _1278 * int(_1286);
    int _1302 = _1300 + _1215;
    bool _1304 = _1298 >= _1292;
    bool _1306 = isnan(_1298);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(_1292);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    bool _1316 = uint(_1296) >= uint(_1157);
    float _1318 = float(uint(_1302));
    float _1320 = trunc(_1314);
    int _1322 = int(_1320);
    bool _1324 = !_1316;
    int _1326 = _1324 ? 0 : (-1);
    float _1328 = -_1290;
    float _1330 = _1280 + _1328;
    float _1332 = as_type<float>(_1260) * _1318;
    int _1334 = ~_1288;
    int _1336 = _1334 + _1326;
    int _1338 = _1336 + 1;
    float _1340 = _1330 * _1292;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1344 = _1342 != 0;
    float _1346 = trunc(_1332);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    int _1352 = _1157 * _1338;
    int _1354 = _1352 + _1187;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    float _1372 = _1292 * _625;
    bool _1374 = !_1344;
    int _1376 = _1374 ? 0 : 1;
    bool _1378 = _1157 == 0;
    float _1380 = trunc(_1340);
    int _1382 = int(_1380);
    int _1384 = ~_1322;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    bool _1390 = !_1378;
    int _1392 = _1390 ? _1354 : (-1);
    int _1394 = _1157 + (-1);
    int _1396 = abs(_1376);
    int _1398 = _1392 * _1388;
    int _1400 = int(_1286) + int(_1350);
    float _1402 = trunc(_1372);
    int _1404 = int(_1402);
    int _1406 = ~_1193;
    int _1408 = _1406 + 1;
    int _1410 = _1322 * _1394;
    int _1412 = _1410 + _1398;
    float _1414 = float(_1193);
    int _1416 = _1408 * _1400;
    int _1418 = _1416 + _1215;
    bool _1420 = _1231 >= _1414;
    bool _1422 = isnan(_1231);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(_1414);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = _1242 * _1414;
    bool _1434 = !_1165;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _1412 * _1171;
    bool _1440 = uint(_1418) >= uint(_1193);
    float _1442 = trunc(_1430);
    int _1444 = int(_1442);
    int _1446 = abs(_507);
    float _1448 = _1414 * _625;
    bool _1450 = !_1440;
    int _1452 = _1450 ? 0 : (-1);
    int _1454 = _1404 * _1446;
    int _1456 = _1454 + _1438;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1460 = _1458 != 0;
    float _1462 = trunc(_1432);
    int _1464 = int(_1462);
    int _1466 = ~_1400;
    int _1468 = _1466 + _1452;
    int _1470 = _1468 + 1;
    int _1472 = _1382 * _1396;
    int _1474 = _1472 + _1187;
    bool _1476 = !_1460;
    int _1478 = _1476 ? 0 : 1;
    bool _1480 = _1193 == 0;
    int _1482 = _1193 * _1470;
    int _1484 = _1482 + _1215;
    int _1486 = abs(_1478);
    float _1488 = trunc(_1448);
    int _1490 = int(_1488);
    int _1492 = abs(_1436);
    int _1494 = ~_1444;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = _1474 * _1179;
    int _1502 = _1500 + _1456;
    bool _1504 = !_1480;
    int _1506 = _1504 ? _1484 : (-1);
    int _1508 = _1464 * _1486;
    int _1510 = _1508 + _1215;
    int _1512 = _1193 + (-1);
    int _1514 = _1382 * _1492;
    int _1516 = _1514 + _1502;
    int _1518 = ~_1157;
    int _1520 = _1518 + 1;
    int _1522 = _1506 * _1498;
    bool _1524 = !_1362;
    int _1526 = _1524 ? 0 : 1;
    float _1528 = float(uint(_1516));
    int _1530 = _1444 * _1512;
    int _1532 = _1530 + _1522;
    bool _1534 = !_1358;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = abs(_1526);
    float _1540 = as_type<float>(_1221) * _1528;
    bool _1542 = !_1366;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1536);
    bool _1548 = !_1370;
    int _1550 = _1548 ? 0 : 1;
    float _1552 = trunc(_1540);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = abs(_1544);
    int _1560 = _1532 * _1538;
    int _1562 = abs(_1550);
    int _1564 = _1490 * _1546;
    int _1566 = _1564 + _1560;
    float _1568 = float(uint(_1510));
    int _1570 = ~_1157;
    int _1572 = _1570 + 1;
    int _1574 = _1510 * _1558;
    int _1576 = _1574 + _1566;
    int _1578 = ~_1157;
    int _1580 = _1578 + 1;
    int _1582 = ~_1193;
    int _1584 = _1582 + 1;
    int _1586 = _1464 * _1562;
    int _1588 = _1586 + _1576;
    float _1590 = float(uint(_1474));
    int _1592 = _1580 * int(_1556);
    int _1594 = _1592 + _1516;
    int _1596 = ~_1193;
    int _1598 = _1596 + 1;
    float _1600 = float(uint(_1588));
    float _1602 = as_type<float>(_1221) * _1590;
    float _1604 = float(uint(_1594));
    float _1606 = as_type<float>(_1260) * _1600;
    float _1608 = as_type<float>(_1221) * _1604;
    float _1610 = trunc(_1602);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    float _1616 = as_type<float>(_1260) * _1568;
    float _1618 = trunc(_1606);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    float _1624 = trunc(_1608);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    int _1630 = _1598 * int(_1622);
    int _1632 = _1630 + _1588;
    float _1634 = trunc(_1616);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = float(uint(_1632));
    int _1642 = _1520 * int(_1614);
    int _1644 = _1642 + _1474;
    int _1646 = int(_1556) + int(_1628);
    float _1648 = as_type<float>(_1260) * _1640;
    float _1650 = float(uint(_1644));
    int _1652 = _1572 * _1646;
    int _1654 = _1652 + _1516;
    float _1656 = trunc(_1648);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    float _1662 = as_type<float>(_1221) * _1650;
    bool _1664 = uint(_1654) >= uint(_1157);
    int _1666 = _1584 * int(_1638);
    int _1668 = _1666 + _1510;
    bool _1670 = !_1664;
    int _1672 = _1670 ? 0 : (-1);
    float _1674 = float(uint(_1668));
    int _1676 = ~_1646;
    int _1678 = _1676 + _1672;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1662);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1193;
    int _1690 = _1688 + 1;
    float _1692 = as_type<float>(_1260) * _1674;
    int _1694 = _1157 * _1680;
    int _1696 = _1694 + _1516;
    int _1698 = int(_1622) + int(_1660);
    float _1700 = trunc(_1692);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    int _1706 = ~_1157;
    int _1708 = _1706 + 1;
    int _1710 = _1690 * _1698;
    int _1712 = _1710 + _1588;
    bool _1714 = !_1378;
    int _1716 = _1714 ? _1696 : (-1);
    out.m_72.x = _1147;
    out.m_72.y = _1149;
    out.m_72.z = _1151;
    int _1718 = int(_1614) + int(_1686);
    int _1720 = _1716 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = _1716 & 3;
    bool _1726 = _1724 != 0;
    bool _1728 = uint(_1712) >= uint(_1193);
    int _1730 = _1722 ? 0 : 1;
    bool _1732 = uint(_1724) > 1u;
    bool _1734 = uint(_1724) >= 2u;
    bool _1736 = !_1728;
    int _1738 = _1736 ? 0 : (-1);
    int _1740 = _1734 ? 0 : 1;
    bool _1742 = _1724 != 3;
    bool _1744 = _225 > 0.5;
    int _1746 = _1708 * _1718;
    int _1748 = _1746 + _1474;
    int _1750 = ~_1193;
    int _1752 = _1750 + 1;
    int _1754 = int(_1638) + int(_1704);
    int _1756 = ~_1730;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = ~_1698;
    int _1764 = _1762 + _1738;
    int _1766 = _1764 + 1;
    int _1768 = _1752 * _1754;
    int _1770 = _1768 + _1510;
    int _1772 = _1760;
    if (!_1732)
    {
        int _1774 = ~_1730;
        int _1776 = _1774 + 1;
        _1772 = _1776;
    }
    int _1778 = _1772;
    bool _1780 = uint(_1748) >= uint(_1157);
    int _1782 = _1193 * _1766;
    int _1784 = _1782 + _1588;
    int _1786 = ~_1740;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = !_1780;
    int _1794 = _1792 ? 0 : (-1);
    int _1796 = _1790;
    if (_1742)
    {
        int _1798 = ~_1740;
        int _1800 = _1798 + 1;
        _1796 = _1800;
    }
    int _1802 = _1796;
    bool _1804 = uint(_1770) >= uint(_1193);
    int _1806 = ~_1718;
    int _1808 = _1806 + _1794;
    int _1810 = _1808 + 1;
    float _1812 = -_187;
    int _1814 = _1744 ? as_type<int>(_1812) : as_type<int>(_187);
    bool _1816 = !_1480;
    int _1818 = _1816 ? _1784 : (-1);
    int _1820 = _1157 * _1810;
    int _1822 = _1820 + _1474;
    int _1824 = _1716 >> 31;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1828 = _1826 != 0;
    bool _1830 = !_1804;
    int _1832 = _1830 ? 0 : (-1);
    int _1834 = _1818 >> 31;
    int _1836 = _1824 & 3;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1840 = _1838 != 0;
    bool _1842 = !_1828;
    int _1844 = _1842 ? 0 : 1;
    int _1846 = _1818 & 3;
    bool _1848 = _1846 != 0;
    int _1850 = ~_1754;
    int _1852 = _1850 + _1832;
    int _1854 = _1852 + 1;
    int _1856 = _1834 & 3;
    int _1858 = _1716 + _1836;
    int _1860 = _1193 * _1854;
    int _1862 = _1860 + _1510;
    bool _1864 = !_1840;
    int _1866 = _1864 ? 0 : 1;
    float _1868 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1870 = int(_1868);
    bool _1872 = uint(_1846) > 1u;
    int _1874 = _1818 + _1856;
    int _1876 = _1858 >> 2;
    int _1878 = _1818 & 3;
    bool _1880 = _1878 != 0;
    int _1882 = _1874 >> 2;
    int _1884 = _1876 << 4;
    int _1886 = _1884 + 368;
    int _1888 = _1880 ? 0 : 1;
    bool _1890 = _1724 != 3;
    int _1892 = _1882 << 4;
    int _1894 = _1892 + 512;
    uint _1896 = uint(int(uint(_1886) >> uint(2)));
    uint _1898 = uint(int(uint(int(_1896)) >> uint(2)));
    int _1900 = int(_1896) & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = int(_1896) + 1;
    uint _1906 = uint(int(uint(_1904) >> uint(2)));
    int _1908 = _1904 & 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[int(_1906)][_1908];
    int _1912 = ~_1888;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1916;
    if (!_1872)
    {
        int _1920 = ~_1888;
        int _1922 = _1920 + 1;
        _1918 = _1922;
    }
    int _1924 = _1918;
    bool _1926 = !_1726;
    int _1928 = _1926 ? 0 : 1;
    bool _1930 = _1846 != 3;
    uint _1932 = uint(int(uint(_1894) >> uint(2)));
    uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
    int _1936 = int(_1932) & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = int(_1932) + 1;
    uint _1942 = uint(int(uint(_1940) >> uint(2)));
    int _1944 = _1940 & 3;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[int(_1942)][_1944];
    bool _1948 = uint(_1846) >= 2u;
    bool _1950 = !_1378;
    int _1952 = _1950 ? _1822 : (-1);
    int _1954 = _1948 ? 0 : 1;
    bool _1956 = _1846 != 3;
    bool _1958 = !_1848;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = !_1890;
    int _1964 = _1962 ? 0 : (-1);
    int _1966 = ~_1954;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1974 = _1972 != 0;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1982 = _1980 != 0;
    int _1984 = _1970;
    if (_1930)
    {
        int _1986 = ~_1954;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    int _1992 = _1886 + 8;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    uint _1996 = uint(int(uint(int(_1994)) >> uint(2)));
    int _1998 = int(_1994) & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    int _2002 = int(_1994) + 1;
    uint _2004 = uint(int(uint(_2002) >> uint(2)));
    int _2006 = _2002 & 3;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[int(_2004)][_2006];
    int _2010 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2012 = _2010 != 0;
    int _2014 = abs(_1778);
    int _2016 = abs(_1924);
    bool _2018 = !_1956;
    int _2020 = _2018 ? 0 : (-1);
    int _2022 = _1894 + 8;
    uint _2024 = uint(int(uint(_2022) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    bool _2040 = _219 > 0.5;
    int _2042 = abs(_1928);
    int _2044 = ~_2014;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    bool _2050 = !_1480;
    int _2052 = _2050 ? _1862 : (-1);
    float _2054 = -_183;
    int _2056 = _2040 ? as_type<int>(_2054) : as_type<int>(_183);
    int _2058 = _2048 * as_type<int>(_1910);
    bool _2060 = _221 > 0.5;
    bool _2062 = _223 > 0.5;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2066 = abs(_1960);
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2070 = ~_2016;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2078 = ~_2042;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    float _2084 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = _2074 * as_type<int>(_1946);
    int _2088 = ~_2066;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2082 * as_type<int>(_1902);
    int _2096 = _2094 + _2058;
    int _2098 = abs(_1802);
    float _2100 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2102 = int(_2100);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2110 = _2092 * as_type<int>(_1938);
    int _2112 = _2110 + _2086;
    float _2114 = as_type<float>(_2066);
    if (_1039)
    {
        float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2118 = _1129 + _2116;
        _2114 = _2118;
    }
    float _2120 = _2114;
    int _2122 = abs(_1964);
    out.m_74.x = _2084;
    out.m_74.y = _2106;
    out.m_74.z = _2108;
    out.m_74.w = _2104;
    int _2124 = abs(_1990);
    float _2126 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2128 = abs(_2020);
    if (_1039)
    {
        float _2130 = _2120 * _2120;
        _1067 = _2130;
    }
    float _2132 = _1067;
    int _2134 = ~_2098;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2126);
    bool _2142 = !_1974;
    float _2144 = _2142 ? _187 : as_type<float>(_1814);
    bool _2146 = !_2012;
    float _2148 = _2146 ? _183 : as_type<float>(_2056);
    int _2150 = _2138 * as_type<int>(_2000);
    int _2152 = _2150 + _2096;
    int _2154 = ~_2124;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2162 = float(uint(_1870));
    int _2164 = _2158 * as_type<int>(_2030);
    int _2166 = _2164 + _2112;
    int _2168 = ~_2122;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    float _2174 = -_925;
    float _2176 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2160);
    int _2178 = ~_2128;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    float _2184 = 1.0 / _2162;
    int _2186 = abs(_1844);
    int _2188 = _2172 * as_type<int>(_2008);
    int _2190 = _2188 + _2152;
    float _2192 = float(uint(_2102));
    float _2194 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2196 = ~_2186;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    float _2202 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2204 = _2182 * as_type<int>(_2038);
    int _2206 = _2204 + _2166;
    int _2208 = abs(_1870);
    float _2210 = 1.0 / _2192;
    int _2212 = abs(_1866);
    float _2214 = -_925;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2194);
    float _2218 = -_925;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    int _2222 = _2190 * _2200;
    int _2224 = abs(_2102);
    float _2226 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2228 = float(uint(_2208));
    int _2230 = _1952 * _2186;
    int _2232 = _2230 + _2222;
    int _2234 = ~_2212;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    float _2240 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2242 = float(uint(_2224));
    float _2244 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    float _2246 = 1.0 / _2228;
    int _2248 = _2206 * _2238;
    float _2250 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    int _2252 = as_type<int>(_2184) + (-2);
    float _2254 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2240);
    float _2256 = float(uint(_2232));
    int _2258 = _2052 * _2212;
    int _2260 = _2258 + _2248;
    int _2262 = as_type<int>(_2210) + (-2);
    float _2264 = 1.0 / _2242;
    float _2266 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = as_type<float>(_2252) * _2256;
    int _2270 = abs(_2232);
    float _2272 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2274 = ~_1870;
    int _2276 = _2274 + 1;
    float _2278 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    float _2280 = float(uint(_2260));
    float _2282 = trunc(_2268);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    float _2288 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = as_type<float>(_2262) * _2280;
    int _2292 = as_type<int>(_2246) + (-2);
    float _2294 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    int _2296 = abs(_2260);
    float _2298 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2278);
    float _2300 = float(uint(_2270));
    float _2302 = trunc(_2290);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    int _2308 = as_type<int>(_2264) + (-2);
    float _2310 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = float(uint(_2296));
    float _2314 = as_type<float>(_2292) * _2300;
    float _2316 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2318 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2320 = trunc(_2314);
    float _2322 = precise::max(_2320, 0.0);
    uint _2324 = uint(_2322);
    float _2326 = as_type<float>(_2308) * _2312;
    int _2328 = _2276 * int(_2286);
    int _2330 = _2328 + _2232;
    float _2332 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2334 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2294);
    float _2336 = float(uint(_2330));
    float _2338 = trunc(_2326);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2318);
    int _2346 = ~_2102;
    int _2348 = _2346 + 1;
    int _2350 = ~_2208;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2252) * _2336;
    int _2356 = ~_2224;
    int _2358 = _2356 + 1;
    int _2360 = _2348 * int(_2306);
    int _2362 = _2360 + _2260;
    int _2364 = _2352 * int(_2324);
    int _2366 = _2364 + _2270;
    float _2368 = as_type<float>(_2358);
    float _2370 = _2334;
    if (_1039)
    {
        float _2372 = _1250 + (-1.0);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = float(uint(_2362));
    float _2378 = trunc(_2354);
    float _2380 = precise::max(_2378, 0.0);
    uint _2382 = uint(_2380);
    float _2384 = _2374;
    if (_1039)
    {
        float _2386 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2386;
    }
    float _2388 = _2384;
    int _2390 = _2358 * int(_2342);
    int _2392 = _2390 + _2296;
    float _2394 = float(uint(_2366));
    float _2396 = _2394;
    if (_1039)
    {
        float _2398 = fma(_1083, _1250, _2388);
        _1089 = _2398;
    }
    float _2400 = _1089;
    float _2402 = as_type<float>(_2262) * _2376;
    float _2404 = float(uint(_2392));
    float _2406 = as_type<float>(_2292) * _2394;
    float _2408 = -_187;
    int _2410 = _2060 ? as_type<int>(_2408) : as_type<int>(_187);
    float _2412 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2414 = -_183;
    int _2416 = _2062 ? as_type<int>(_2414) : as_type<int>(_183);
    float _2418 = trunc(_2402);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    bool _2424 = !_1978;
    float _2426 = _2424 ? _187 : as_type<float>(_2410);
    float _2428 = as_type<float>(_2308) * _2404;
    bool _2430 = !_1982;
    float _2432 = _2430 ? _183 : as_type<float>(_2416);
    float _2434 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2436 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2254);
    float _2438 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2440 = _2412 * _2250;
    float _2442 = trunc(_2406);
    float _2444 = precise::max(_2442, 0.0);
    uint _2446 = uint(_2444);
    float _2448 = _2412 * _2226;
    float _2450 = _2412 * _2244;
    if (_1039)
    {
        float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2454 = _1133 + _2452;
        _2396 = _2454;
    }
    float _2456 = _2396;
    float _2458 = fma(_2438, _2434, _2440);
    float _2460 = fma(_2438, _2298, _2448);
    float _2462 = fma(_2438, _2436, _2450);
    if (_1039)
    {
        float _2464 = _2456 * _2456;
        _1069 = _2464;
    }
    float _2466 = _1069;
    float _2468 = trunc(_2428);
    float _2470 = precise::max(_2468, 0.0);
    uint _2472 = uint(_2470);
    int _2474 = int(_2286) + int(_2382);
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2478 = _2400 + _2476;
    int _2480 = ~_1870;
    int _2482 = _2480 + 1;
    out.m_76.x = _2434;
    out.m_76.y = _2298;
    out.m_76.z = _2436;
    int _2484 = ~_2102;
    int _2486 = _2484 + 1;
    float _2488 = fma(_2478, _2478, _2132);
    int _2490 = int(_2306) + int(_2422);
    int _2492 = _2482 * _2474;
    int _2494 = _2492 + _2232;
    int _2496 = ~_2208;
    int _2498 = _2496 + 1;
    int _2500 = int(_2324) + int(_2446);
    float _2502 = _2488 + _2466;
    bool _2504 = uint(_2494) >= uint(_1870);
    int _2506 = _2486 * _2490;
    int _2508 = _2506 + _2260;
    int _2510 = int(_2342) + int(_2472);
    int _2512 = _2498 * _2500;
    int _2514 = _2512 + _2270;
    int _2516 = ~_2224;
    int _2518 = _2516 + 1;
    float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2522 = uint(_2508) >= uint(_2102);
    bool _2524 = !_2504;
    int _2526 = _2524 ? 0 : (-1);
    int _2528 = _2518 * _2510;
    int _2530 = _2528 + _2296;
    bool _2532 = uint(_2514) >= uint(_2208);
    bool _2534 = !_2522;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2540 = ~_2474;
    int _2542 = _2540 + _2526;
    int _2544 = _2542 + 1;
    int _2546 = _2232 ^ _1870;
    int _2548 = ~_2490;
    int _2550 = _2548 + _2536;
    int _2552 = _2550 + 1;
    int _2554 = _1870 * _2544;
    int _2556 = _2554 + _2232;
    bool _2558 = _1870 == 0;
    float _2560 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2562 = !_2532;
    int _2564 = _2562 ? 0 : (-1);
    float _2566 = fma(_2412, _2412, 1.0);
    uint _2568 = uint(int(uint(_2546) >> uint(31)));
    float _2570 = sqrt(_2502);
    bool _2572 = uint(_2530) >= uint(_2224);
    int _2574 = _2260 ^ _2102;
    int _2576 = _2102 * _2552;
    int _2578 = _2576 + _2260;
    bool _2580 = _1870 == 0;
    float _2582 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2584 = ~_2564;
    int _2586 = _2500 + _2584;
    int _2588 = _2586 + 1;
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2592 = ~int(_2568);
    int _2594 = _2592 + 1;
    bool _2596 = !_2558;
    int _2598 = _2596 ? _2556 : (-1);
    bool _2600 = !_2572;
    int _2602 = _2600 ? 0 : (-1);
    uint _2604 = uint(int(uint(_2574) >> uint(31)));
    int _2606 = _2588 ^ _2594;
    float _2608 = float(_2598);
    bool _2610 = _2102 == 0;
    int _2612 = ~_2602;
    int _2614 = _2510 + _2612;
    int _2616 = _2614 + 1;
    int _2618 = ~int(_2604);
    int _2620 = _2618 + 1;
    bool _2622 = _2102 == 0;
    float _2624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2626 = ~_2594;
    int _2628 = _2626 + _2606;
    int _2630 = _2628 + 1;
    float _2632 = fma(_2560, _2608, _349);
    int _2634 = _2616 ^ _2620;
    bool _2636 = !_2610;
    int _2638 = _2636 ? _2578 : (-1);
    bool _2640 = !_2580;
    int _2642 = _2640 ? _2630 : (-1);
    float _2644 = rsqrt(_2566);
    int _2646 = ~_2620;
    int _2648 = _2646 + _2634;
    int _2650 = _2648 + 1;
    float _2652 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2654 = float(_2638);
    float _2656 = _2148 + 0.5;
    float _2658 = float(_2642);
    bool _2660 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2662 = isnan(_2570);
    bool _2664 = _2660 || _2662;
    bool _2666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2668 = _2664 || _2666;
    float _2670 = fma(_2652, _2654, _663);
    bool _2672 = !_2622;
    int _2674 = _2672 ? _2650 : (-1);
    float _2676 = -_649;
    float _2678 = fma(_2582, _2658, _2676);
    float _2680 = fma(_2560, _2656, _2632);
    float _2682 = _2432 + 0.5;
    float _2684 = float(_2674);
    float _2686 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2688 = _2426 + (-0.5);
    float _2690 = _2412 * _2644;
    float _2692 = fma(_2652, _2682, _2670);
    float _2694 = -_665;
    float _2696 = fma(_2686, _2684, _2694);
    float _2698 = -_2582;
    float _2700 = fma(_2698, _2688, _2678);
    float _2702 = -_2332;
    float _2704 = _2690 * _2702;
    float _2706 = -_2334;
    float _2708 = _2690 * _2706;
    float _2710 = _2144 + (-0.5);
    float _2712 = -_2344;
    float _2714 = _2690 * _2712;
    float _2716 = fma(_2644, _2250, _2704);
    float _2718 = fma(_2644, _2226, _2708);
    float _2720 = -_2686;
    float _2722 = fma(_2720, _2710, _2696);
    float _2724 = fma(_2644, _2244, _2714);
    float _2726 = -_647;
    float _2728 = _2726 + 1.0;
    float _2730 = -_651;
    float _2732 = _2730 + 1.0;
    float _2734 = _2332 + _2458;
    float _2736 = -_1169;
    float _2738 = fma(_2148, _2736, _2680);
    float _2740 = -_2728;
    float _2742 = fma(_2432, _2740, _2692);
    float _2744 = fma(_2426, _1183, _2700);
    float _2746 = fma(_2144, _2732, _2722);
    float _2748 = _2334 + _2460;
    float _2750 = _2344 + _2462;
    out.m_78.x = _2716;
    out.m_78.y = _2718;
    out.m_78.z = _2724;
    float _2752 = _2732;
    float _2754 = _2718;
    float _2756 = _2724;
    if (!_2668)
    {
        _2752 = 1.0;
    }
    float _2758 = _2752;
    out.m_80.x = _2738;
    out.m_80.y = _2744;
    out.m_80.z = _2742;
    out.m_80.w = _2746;
    out.m_82.x = _2734;
    out.m_82.y = _2748;
    out.m_82.z = _2750;
    bool _2760 = !_2668;
    float _2762 = _2758;
    if (!_2760)
    {
        bool _2764 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2766 = isnan(_2570);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2772 = _2768 || _2770;
        if (!_2772)
        {
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = _2570 + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2786 = 1.0 / _2780;
            float _2788 = _2776 * _2786;
            float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2762 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2796 = isnan(_2570);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2570 + _2804;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2816 = 1.0 / _2810;
                float _2818 = _2806 * _2816;
                float _2820 = fma(_2818, _2814, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2762 = _2820;
                _2792 = true;
            }
            else
            {
                _2762 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2792 = false;
    float _2822 = _2762;
    float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2826 = _2400 + _2824;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2830 = _1129 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2834 = _1133 + _2832;
    float _2836 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2838 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2840 = fma(_2834, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2844 = _2836 + _2842;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2852 = _2840 + _2850;
    float _2854 = _2844 * _2844;
    float _2856 = fma(_2848, _2848, _2854);
    float _2858 = fma(_2852, _2852, _2856);
    float _2860 = rsqrt(_2858);
    float _2862 = sqrt(_2858);
    float _2864 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2866 = _2848 * _2864;
    float _2868 = _2852 * _2864;
    float _2870 = _2866 * _2866;
    float _2872 = _2868 * _2868;
    float _2874 = _2870 + _2872;
    float _2876 = sqrt(_2874);
    bool _2878 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2876 + _2880;
    float _2884 = _2860;
    float _2886 = _2882;
    float _2888 = _2844;
    float _2890 = _2866;
    if (_2878)
    {
        float _2892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2892;
    }
    float _2894 = _2884;
    if (_2878)
    {
        float _2896 = rsqrt(_2874);
        _2370 = _2896;
    }
    float _2898 = _2370;
    float _2900 = _2898;
    if (_2878)
    {
        float _2902 = _2882 * _2894;
        _2886 = _2902;
    }
    float _2904 = _2886;
    if (_2878)
    {
        float _2906 = _2904 * 0.15915493667125701904296875;
        _2754 = _2906;
    }
    float _2908 = _2754;
    float _2910 = _2894;
    if (_2878)
    {
        float _2912 = _2908 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        _2910 = _2914;
    }
    float _2916 = _2910;
    float _2918 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2920 = precise::max(0.0, _2918);
    float _2922 = _2852;
    float _2924 = _2920;
    if (_2878)
    {
        float _2926 = _2908 * 6.283185482025146484375;
        float _2928 = cos(_2926);
        _2922 = _2928;
    }
    float _2930 = _2922;
    float _2932 = -_2864;
    float _2934 = -_2920;
    float _2936 = fma(_2844, _2932, _2934);
    if (!_2878)
    {
        _2888 = _2868;
    }
    float _2938 = _2888;
    float _2940 = _2938;
    if (_2878)
    {
        float _2942 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2924 = _2942;
    }
    float _2944 = _2924;
    float _2946 = _2916;
    float _2948 = _2944;
    if (_2878)
    {
        float _2950 = fma(_2916, _2944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2756 = _2950;
    }
    float _2952 = _2756;
    float _2954 = _2952;
    if (!_2878)
    {
        _2946 = _2936;
    }
    float _2956 = _2946;
    float _2958 = _2956;
    float _2960 = _2930;
    if (_2878)
    {
        float _2962 = _2930 + (-1.0);
        _2948 = _2962;
    }
    float _2964 = _2948;
    float _2966 = _2964;
    if (_2878)
    {
        float _2968 = _2898 * _2952;
        _2954 = _2968;
    }
    float _2970 = _2954;
    if (_2878)
    {
        float _2972 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2900 = _2972;
    }
    float _2974 = _2900;
    if (_2878)
    {
        float _2976 = _2866 * _2970;
        _2890 = _2976;
    }
    float _2978 = _2890;
    if (!_2878)
    {
        _2966 = _2870;
    }
    float _2980 = _2966;
    float _2982 = _2980;
    if (_2878)
    {
        float _2984 = _2868 * _2970;
        _2940 = _2984;
    }
    float _2986 = _2940;
    if (_2878)
    {
        float _2988 = fma(_2936, _2930, _2974);
        _2958 = _2988;
    }
    float _2990 = _2958;
    if (_2878)
    {
        float _2992 = _2978 * _2978;
        _2982 = _2992;
    }
    float _2994 = _2982;
    if (!_2878)
    {
        _2960 = _2872;
    }
    float _2996 = _2960;
    float _2998 = _2996;
    if (_2878)
    {
        float _3000 = _2986 * _2986;
        _2998 = _3000;
    }
    float _3002 = _2998;
    float _3004 = fma(_2990, _2990, _2994);
    float _3006 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3008 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3010 = _3004 + _3002;
    float _3012 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3006);
    float _3014 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3018 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3016);
    float _3020 = precise::clamp(_3018, 0.0, 1.0);
    float _3022 = rsqrt(_3010);
    float _3024 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3012);
    float _3026 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3028 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3030 = -_3020;
    float _3032 = _3030 + 1.0;
    float _3034 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3036 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3026);
    float _3038 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3028);
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3042 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3008);
    float _3044 = abs(_3032);
    float _3046 = log2(_3044);
    float _3048 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3050 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3036);
    float _3052 = _3038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3054 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3042);
    float _3056 = -_3048;
    float _3058 = fma(_3056, _3040, 1.0);
    float _3060 = _3022 * _2978;
    float _3062 = _3050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3064 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3066 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3068 = _3022 * _2990;
    float _3070 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3072 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3064);
    float _3074 = _3022 * _2986;
    float _3076 = log2(_3058);
    float _3078 = -_3070;
    float _3080 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3078);
    float _3082 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3072);
    float _3084 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3086 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3088 = -_3074;
    float _3090 = fma(_3088, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3080);
    float _3092 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3082);
    float _3094 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3096 = exp2(_3084);
    float _3098 = fma(_3090, -0.5, 0.5);
    float _3100 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3086);
    float _3102 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3094);
    float _3104 = fma(_3090, 0.5, 0.5);
    float _3106 = _3068 + 1.0;
    float _3108 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3100);
    float _3110 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3102);
    float _3112 = 1.0 / _3092;
    float _3114 = fma(_3104, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3116 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3108);
    float _3118 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3110);
    float _3120 = _3076 * 0.693147182464599609375;
    float _3122 = fma(_3104, _3114, -0.212114393711090087890625);
    float _3124 = sqrt(_3098);
    float _3126 = -_3068;
    float _3128 = fma(_3096, _3106, _3126);
    float _3130 = fma(_3104, _3122, 1.570728778839111328125);
    float _3132 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3134 = fma(_3128, 0.5, 0.5);
    float _3136 = _3118 * _3112;
    float _3138 = _3116 * _3112;
    float _3140 = fma(_3136, 0.5, 0.5);
    float _3142 = fma(_3138, -0.5, 0.5);
    float _3144 = _3124 * 0.636619746685028076171875;
    float3 _8243 = float3(_3140, _3142, _3132);
    float _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8243, float3(0.0), isnan(_8243)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8243, float3(0.0), isnan(_8243)), level(0.0)).x;
    float3 _8254 = float3(_3140, _3142, _3132);
    float4 _3149 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8254, float3(0.0), isnan(_8254)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8254, float3(0.0), isnan(_8254)), level(0.0)).xyzw;
    float _3151 = _3149.x;
    float _3153 = _3149.y;
    float _3155 = _3149.z;
    float _3157 = _3149.w;
    float _3159 = -_3130;
    float _3161 = fma(_3144, _3159, 1.0);
    float2 _8275 = float2(_3161, _3134);
    float3 _3163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8275, float2(0.0), isnan(_8275)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8275, float2(0.0), isnan(_8275)), level(0.0)).xyz;
    float _3165 = _3163.x;
    float _3167 = _3163.y;
    float _3169 = _3163.z;
    float _3171 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3173 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3175 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3177 = -_1153;
    float _3179 = _3177 + 1.0;
    float _3181 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3171);
    float _3183 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3173);
    float _3185 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3175);
    float _3187 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3181);
    float _3189 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3183);
    float _3191 = _3187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3193 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3195 = 1.0 / _3191;
    float _3197 = _3193 + _3191;
    bool _3199 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3201 = isnan(_2862);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3207 = _3203 || _3205;
    float _3209 = _3197 * _3195;
    float _3211 = _3209 * 0.5;
    float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3215 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3213);
    float _3217 = in.m_84.x;
    float _3219 = 1.0 / _3215;
    float _3221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3223 = _3219 * _3221;
    float _3225 = abs(_3223);
    float _3227 = log2(_3225);
    bool _3229 = _3223 <= 8000.0;
    bool _3231 = isnan(_3223);
    bool _3233 = _3229 || _3231;
    bool _3235 = isnan(8000.0);
    bool _3237 = _3233 || _3235;
    float _3239 = float(_3237);
    float _3241 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3243 = exp2(_3241);
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3251 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3185);
    float _3253 = fma(_3247, -2.0, 3.0);
    float _3255 = _3247 * _3247;
    float _3257 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3251);
    float _3259 = exp2(_3249);
    float _3261 = _3255 * _3253;
    float _3263 = _3257 + _3092;
    out.gl_Position.x = _3118;
    out.gl_Position.y = _3116;
    out.gl_Position.z = _3257;
    out.gl_Position.w = _3092;
    float _3265 = -_3261;
    float _3267 = _3265 + 1.0;
    float _3269 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3261);
    float _3271 = _3239 * _3269;
    float _3273 = -_3259;
    float _3275 = _3273 + 1.0;
    float _3277 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3279 = _3263 * 0.5;
    float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3283 = _3257;
    float _3285 = _3116;
    float _3287 = _3118;
    float _3289 = _3092;
    float _3291 = _3281;
    float _3293 = _3155;
    if (!_3207)
    {
        _3283 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3295 = _3283;
    float _3297 = _3179 * _3277;
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = _3295;
    float _3303 = _3295;
    if (!_3207)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3305 = _3285;
    float _3307 = _3305;
    float _3309 = _3305;
    if (!_3207)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3311 = _3287;
    float _3313 = -_3299;
    float _3315 = fma(_3313, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3317 = -_3281;
    float _3319 = _3317 + 1.0;
    float _3321 = _3315 * _3217;
    float _3323 = _3311;
    float _3325 = _3311;
    if (!_3207)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3327 = _3289;
    float _3329 = _3321 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.z = _3279;
    out.m_86.w = _3092;
    out.m_88.x = _3329;
    float _3331 = _3281 * _3146;
    float _3333 = _3157 * _3319;
    float _3335 = _3327;
    float _3337 = _3327;
    if (!_3207)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3339 = _3291;
    float _3341 = _3157 * _3331;
    float _3343 = _3169 * _3331;
    float _3345 = fma(_3165, _3341, _3151);
    float _3347 = fma(_3167, _3341, _3153);
    float _3349 = fma(_3157, _3343, _3155);
    float _3351 = _3339;
    float _3353 = _3339;
    if (!_3207)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3355 = _3293;
    out.m_90.x = _3345;
    out.m_90.y = _3347;
    out.m_90.z = _3349;
    out.m_90.w = _3333;
    bool _3357 = !_3207;
    float _3359 = _3355;
    float _3361 = _3355;
    if (!_3357)
    {
        bool _3363 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3365 = isnan(_2862);
        bool _3367 = _3363 || _3365;
        bool _3369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3371 = _3367 || _3369;
        if (!_3371)
        {
            float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3375 = _2862 + _3373;
            float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3377;
            float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3385 = 1.0 / _3379;
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3403 = _3375 * _3385;
            float _3405 = precise::clamp(_3403, 0.0, 1.0);
            float _3407 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3409 = _3407 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3411 = fma(_3405, _3383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3413 = fma(_3405, _3409, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3415 = fma(_3405, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3417 = fma(_3405, _3393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3419 = fma(_3405, _3397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3421 = fma(_3405, _3401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3361 = _3415;
            _3309 = _3419;
            _3353 = _3411;
            _3303 = _3417;
            _3337 = _3413;
            _3325 = _3421;
            _3423 = true;
        }
        else
        {
            bool _3425 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3427 = isnan(_2862);
            bool _3429 = _3425 || _3427;
            bool _3431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3433 = _3429 || _3431;
            if (!_3433)
            {
                _3351 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3435 = _3351;
            _3353 = _3435;
            if (!_3433)
            {
                _3359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3437 = _3359;
            _3361 = _3437;
            if (!_3433)
            {
                _3335 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3439 = _3335;
            _3337 = _3439;
            if (!_3433)
            {
                _3301 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3441 = _3301;
            _3303 = _3441;
            if (!_3433)
            {
                _3307 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3443 = _3307;
            _3309 = _3443;
            if (!_3433)
            {
                _3323 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3445 = _3323;
            bool _3447 = !_3433;
            _3325 = _3445;
            if (!_3447)
            {
                bool _3449 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3451 = isnan(_2862);
                bool _3453 = _3449 || _3451;
                bool _3455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3457 = _3453 || _3455;
                if (!_3457)
                {
                    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3461 = _2862 + _3459;
                    float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3463;
                    float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3471 = 1.0 / _3465;
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3487 = _3485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3489 = _3461 * _3471;
                    float _3491 = precise::clamp(_3489, 0.0, 1.0);
                    float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3497 = fma(_3491, _3469, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3499 = fma(_3491, _3495, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3501 = fma(_3491, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3503 = fma(_3491, _3479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3505 = fma(_3491, _3483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3507 = fma(_3491, _3487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3361 = _3501;
                    _3309 = _3505;
                    _3353 = _3497;
                    _3303 = _3503;
                    _3337 = _3499;
                    _3325 = _3507;
                    _3423 = true;
                }
                else
                {
                    _3361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3309 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3353 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3303 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3337 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3325 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3423 = false;
    float _3509 = _3361;
    float _3511 = _3309;
    float _3513 = _3353;
    float _3515 = _3303;
    float _3517 = _3337;
    float _3519 = _3325;
    float _3521 = fma(_2748, -0.5, 0.5);
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = -_3509;
    float _3527 = _3525 + _3511;
    float _3529 = -_3513;
    float _3531 = _3529 + _3515;
    float _3533 = -_3517;
    float _3535 = _3533 + _3519;
    bool _3537 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3539 = fma(_3523, _3527, _3509);
    float _3541 = fma(_3523, _3531, _3513);
    float _3543 = fma(_3523, _3535, _3517);
    float _3545 = _3539 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3547 = fma(_3541, 0.298911988735198974609375, _3545);
    float _3549 = fma(_3543, 0.114477999508380889892578125, _3547);
    float _3551 = -_3549;
    float _3553 = _3541 + _3551;
    float _3555 = -_3549;
    float _3557 = _3539 + _3555;
    float _3559 = -_3549;
    float _3561 = _3543 + _3559;
    float _3563 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3565 = fma(_3553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    float _3567 = fma(_3557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    float _3569 = fma(_3561, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    out.m_53.x = _3563;
    out.m_94.x = _3565;
    out.m_94.y = _3567;
    out.m_94.z = _3569;
    if (!_3537)
    {
        return out;
    }
    float _3571 = -_2836;
    float _3573 = _3571 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3575 = -_2838;
    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3579 = -_2840;
    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3583 = _3573 * _3573;
    float _3585 = fma(_3577, _3577, _3583);
    float _3587 = fma(_3581, _3581, _3585);
    float _3589 = sqrt(_3587);
    float _3591 = rsqrt(_3587);
    float _3593 = -_3589;
    float _3595 = _3593 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3597 = _3595 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3599 = precise::clamp(_3597, 0.0, 1.0);
    float _3601 = _3577 * _3591;
    float _3603 = _3573 * _3591;
    float _3605 = abs(_3599);
    float _3607 = log2(_3605);
    float _3609 = _3581 * _3591;
    float _3611 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3613 = _2748 * _3603;
    float _3615 = -_3603;
    float _3617 = -_3611;
    float _3619 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3617);
    float _3621 = fma(_2734, _3601, _3613);
    float _3623 = -_3609;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3619);
    float _3627 = fma(_2750, _3609, _3621);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3633 = _3625 + _3631;
    float _3635 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3637 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = exp2(_3635);
    float _3643 = _3641 * _3639;
    float _3645 = _3629 * _3643;
    float _3647 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3649 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3651 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3647;
    out.m_92.y = _3649;
    out.m_92.z = _3651;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3423 = false;
    bool _2792 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_129);
        out.gl_Position.z = _3708;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3777 = as_type<float>(_167);
        out.gl_Position.z = _3777;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_60.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    float _223 = in.m_60.z;
    float _225 = in.m_60.w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _233;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _255 = 1.0 / _237;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _217 + _257;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _271 = _219 * 2.0;
    float _273 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = 1.0 / _241;
    float _277 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _279 = _259 * _243;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _217 + _281;
    float _285 = fma(_273, -2.0, _261);
    float _287 = fma(_265, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = floor(_271);
    float _291 = -_253;
    float _293 = fma(_277, 2.0, _291);
    float _295 = _221 * 2.0;
    float _297 = _283 * _255;
    float _299 = _219 + _221;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = _217 + _301;
    float _305 = fma(_269, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _307 = floor(_295);
    float _309 = _299 + (-1.0);
    float _311 = _223 + _221;
    float _313 = _303 * _275;
    float _315 = _223 + _219;
    float _317 = _311 + (-1.0);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _321 = 1.0 / _251;
    bool _323 = _289 >= 0.0;
    bool _325 = isnan(_289);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _335 = as_type<int>(_317);
    if (_247)
    {
        _335 = 0;
    }
    int _337 = _335;
    float _339 = _315 + (-1.0);
    int _341 = _337;
    float _343 = _339;
    if (!_247)
    {
        _341 = 1;
    }
    int _345 = _341;
    float _347 = -_147;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _293);
    int _351 = _331 ? 0 : 1;
    float _353 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _355 = _223 * 2.0;
    bool _357 = _307 > 0.0;
    float _359 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _361 = int(_359);
    bool _363 = _307 >= 0.0;
    bool _365 = isnan(_307);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    bool _373 = _345 != 1;
    bool _375 = _289 > 0.0;
    float _377 = _229 * _321;
    int _379 = _371 ? 0 : 1;
    float _381 = floor(_355);
    int _383 = ~_379;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    int _389 = _387;
    float _391 = as_type<float>(_361);
    if (!_357)
    {
        int _393 = ~_379;
        int _395 = _393 + 1;
        _389 = _395;
    }
    int _397 = _389;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _409 = log2(_407);
    float _411 = fma(_401, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _413 = fma(_405, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _415 = ~_351;
    int _417 = _415 + 1;
    int _419 = _417 + 1;
    int _421 = _419;
    if (!_375)
    {
        int _423 = ~_351;
        int _425 = _423 + 1;
        _421 = _425;
    }
    int _427 = _421;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    bool _433 = _381 > 0.0;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _437 = int(_435);
    bool _439 = _381 >= 0.0;
    bool _441 = isnan(_381);
    bool _443 = _439 || _441;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    float _449 = fma(_431, _313, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _451 = _447 ? 0 : 1;
    if (!_373)
    {
        _343 = _221;
    }
    float _453 = _343;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    int _459 = ~_451;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    float _465 = _453;
    int _467 = _463;
    if (_373)
    {
        _465 = _219;
    }
    float _469 = _465;
    float _471 = fma(_457, _313, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = _469;
    if (!_433)
    {
        int _475 = ~_451;
        int _477 = _475 + 1;
        _467 = _477;
    }
    int _479 = _467;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _491 = _489 != 0;
    float _493 = float(_479);
    float _495 = _409 * _147;
    float _497 = float(_113);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _501 = !_487;
    int _503 = _501 ? 0 : 1;
    bool _505 = !_483;
    int _507 = _505 ? 0 : 1;
    float _509 = exp2(_495);
    bool _511 = !_491;
    int _513 = _511 ? 0 : 1;
    float _515 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[83].z, _499);
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _527 = _525 != 0;
    float _529 = float(_361);
    float _531 = float(_437);
    float _533 = 1.0 / _497;
    if (!_373)
    {
        _391 = _221;
    }
    float _535 = _391;
    float _537 = _535;
    if (_373)
    {
        _537 = _219;
    }
    float _539 = _537;
    bool _541 = !_519;
    float _543 = _541 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _545 = 1.0 / _531;
    float _547 = _543;
    if (!_373)
    {
        _473 = _223;
    }
    float _549 = _473;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _553 = _549;
    if (_373)
    {
        _553 = _221;
    }
    float _555 = _553;
    float _557 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _559 = -_509;
    float _561 = _559 + 1.0;
    float _563 = 1.0 / _529;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _567 = 1.0 + _565;
    int _569 = abs(as_type<int>(_543));
    float _571 = _555 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_373)
    {
        _547 = _223;
    }
    float _573 = _547;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _577 = _573;
    if (_373)
    {
        _577 = _221;
    }
    float _579 = _577;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _583 = 1.0 / _567;
    float _585 = -_551;
    float _587 = fma(_557, 2.0, _585);
    float _589 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[83].w, _581);
    float _591 = fma(_571, -2.0, _575);
    bool _593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    float _603 = in.m_62.x;
    float _605 = in.m_62.y;
    float _607 = in.m_62.z;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _611 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _619 = _615 || _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _623 = float(_569);
    float _625 = _533 * _147;
    float _627 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].z, _609);
    float _629 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _621);
    float _631 = _619 ? _561 : 0.0;
    float _633 = _623 * _493;
    bool _635 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _637 = isnan(_217);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _515);
    float _649 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _285);
    float _651 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _589);
    float _653 = _563 * _147;
    float _655 = _545 * _147;
    float _657 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _627);
    float _659 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _629);
    float _661 = -_147;
    float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[81].x, _587);
    float _665 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _591);
    bool _667 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _669 = isnan(_217);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _653;
    if (_601)
    {
        float _681 = _631 * _583;
        _151 = _681;
    }
    float _683 = _151;
    float _685 = _633 * (-2.0);
    bool _687 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _689 = isnan(_217);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_645;
    float _701 = _699 + 1.0;
    float _703 = -_677;
    float _705 = _703 + 1.0;
    float _707 = fma(_319, _685, _319);
    bool _709 = !_523;
    int _711 = _709 ? 0 : 1;
    float _713 = _697 * _701;
    float _715 = -_697;
    float _717 = _715 + 1.0;
    bool _719 = !_527;
    int _721 = _719 ? 0 : 1;
    float _723 = _645 * _705;
    int _725 = abs(_711);
    float _727 = fma(_685, _603, _603);
    bool _729 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _731 = isnan(_217);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    int _741 = abs(_721);
    bool _743 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _745 = isnan(_217);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _739 * _717;
    float _757 = -_739;
    float _759 = _757 + 1.0;
    float _761 = _219 + (-0.5);
    float _763 = float(_427);
    float _765 = float(_725);
    float _767 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].x, _727);
    float _769 = _753 * _759;
    float _771 = float(_397);
    float _773 = -_753;
    float _775 = _773 + 1.0;
    float _777 = _765 * _763;
    float _779 = float(_741);
    float _781 = fma(_707, _683, _767);
    float _783 = _411 * _769;
    float _785 = _777 * (-2.0);
    float _787 = _287 * _769;
    float _789 = _779 * _771;
    float _791 = _781 * 0.15915493667125701904296875;
    float _793 = fma(_785, _605, _605);
    float _795 = _221 + (-0.5);
    float _797 = fma(_333, _785, _333);
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].y, _783);
    float _801 = _789 * (-2.0);
    float _803 = in.m_64.x;
    float _805 = in.m_64.y;
    float _807 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[196].y, _793);
    float _809 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _811 = fma(_353, _801, _353);
    float _813 = fma(_801, _607, _607);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _823 = fma(_413, _755, _799);
    float _825 = _223 + (-0.5);
    float _827 = fma(_305, _755, _809);
    float _829 = fma(_817, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _831 = fma(_821, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _833 = fma(_449, _713, _823);
    float _835 = fma(_797, _683, _807);
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[196].z, _813);
    float _839 = fma(_471, _713, _827);
    float _841 = in.m_50.x;
    float _843 = in.m_50.y;
    float _845 = in.m_50.z;
    float _847 = fma(_831, _723, _833);
    float _849 = fma(_811, _683, _837);
    float _851 = fma(_829, _723, _839);
    float _853 = in.m_66.x;
    float _855 = in.m_66.y;
    float _857 = in.m_66.z;
    float _859 = in.m_66.w;
    float _861 = _835 * 0.15915493667125701904296875;
    float _863 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[147].y, _847);
    float _865 = _849 * 0.15915493667125701904296875;
    float _867 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[147].x, _851);
    float _869 = _791 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _863 * _805;
    float _875 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _877 = _867 * _803;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _881 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _883 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _885 = _861 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = in.m_68.x;
    float _891 = in.m_68.y;
    float _893 = in.m_68.z;
    float _895 = in.m_68.w;
    float _897 = _881 * _875;
    float _899 = _883 * _879;
    float _901 = _861 * 6.283185482025146484375;
    float _903 = cos(_901);
    float _905 = _843 * _855;
    float _907 = fma(_841, _853, _905);
    float _909 = _791 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _871 * _887;
    float _915 = fma(_845, _857, _907);
    float _917 = _865 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _871 * _903;
    float _923 = _865 * 6.283185482025146484375;
    float _925 = sin(_923);
    float _927 = _911 * _887;
    float _929 = _911 * _903;
    float _931 = _871 * _919;
    float _933 = _911 * _919;
    float _935 = _903 * _919;
    float _937 = _887 * _919;
    float _939 = _931 * _897;
    float _941 = fma(_925, _921, _927);
    float _943 = -_913;
    float _945 = fma(_925, _929, _943);
    float _947 = -_929;
    float _949 = fma(_925, _913, _947);
    float _951 = -_897;
    float _953 = _925 * _951;
    float _955 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _957 = fma(_941, _899, _939);
    float _959 = _933 * _897;
    float _961 = fma(_935, _899, _953);
    float _963 = fma(_925, _927, _921);
    float _965 = fma(_949, _955, _957);
    float _967 = _843 * _891;
    float _969 = fma(_945, _899, _959);
    float _971 = fma(_937, _955, _961);
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _975 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _977 = fma(_841, _889, _967);
    float _979 = fma(_963, _955, _969);
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].x, _973);
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].x, _975);
    float _985 = fma(_845, _893, _977);
    float _987 = _915 + _859;
    float _989 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[24].z, _981);
    float _991 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[26].z, _983);
    float _993 = _985 + _895;
    float _995 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _999 = _991 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1001 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    float _1003 = _987 + _997;
    float _1005 = _993 + _999;
    float _1007 = in.m_70.x;
    float _1009 = in.m_70.y;
    float _1011 = in.m_70.z;
    float _1013 = in.m_70.w;
    float _1015 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1019 = _1003 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1023 = _1005 + _1021;
    float _1025 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1027 = _1019 * _1019;
    float _1029 = _1023 * _1023;
    float _1031 = _1027 + _1029;
    float _1033 = sqrt(_1031);
    float _1035 = _843 * _1009;
    float _1037 = fma(_841, _1007, _1035);
    bool _1039 = _1033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1043 = _1033 + _1041;
    float _1045 = fma(_845, _1011, _1037);
    float _1047 = _1045 + _1013;
    float _1049 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1051 = fma(_993, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1053 = 0.0;
    float _1055 = _1031;
    float _1057 = _1043;
    float _1059 = _843;
    float _1061 = _1003;
    float _1063 = _1005;
    float _1065 = _1025;
    float _1067 = _1027;
    float _1069 = _1029;
    if (_1039)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1053 = _1071;
    }
    float _1073 = _1053;
    if (_1039)
    {
        float _1075 = rsqrt(_1031);
        _1055 = _1075;
    }
    float _1077 = _1055;
    if (_1039)
    {
        float _1079 = _1043 * _1073;
        _1057 = _1079;
    }
    float _1081 = _1057;
    float _1083 = _1047 + _1025;
    float _1085 = floor(_1049);
    float _1087 = _1081;
    float _1089 = _1083;
    if (_1039)
    {
        float _1091 = _1081 * 0.15915493667125701904296875;
        _1087 = _1091;
    }
    float _1093 = _1087;
    float _1095 = _1093;
    if (_1039)
    {
        float _1097 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1059 = _1097;
    }
    float _1099 = _1059;
    float _1101 = _841;
    float _1103 = _1099;
    if (_1039)
    {
        float _1105 = _1093 * 6.283185482025146484375;
        float _1107 = sin(_1105);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = floor(_1051);
    if (_1039)
    {
        float _1113 = fma(_1109, _1099, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1103 = _1113;
    }
    float _1115 = _1103;
    float _1117 = _1115;
    if (_1039)
    {
        float _1119 = _1077 * _1115;
        _1117 = _1119;
    }
    float _1121 = _1117;
    float _1123 = -_1085;
    float _1125 = _1049 + _1123;
    if (_1039)
    {
        float _1127 = fma(_1019, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1061 = _1127;
    }
    float _1129 = _1061;
    if (_1039)
    {
        float _1131 = fma(_1023, _1121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1063 = _1131;
    }
    float _1133 = _1063;
    float _1135 = -_1111;
    float _1137 = _1051 + _1135;
    float _1139 = fma(_1129, 6.2500002968590706586837768554688e-05, 0.5);
    float _1141 = fma(_1133, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5272 = float2(_1139, _1141);
    float3 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5272, float2(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5272, float2(0.0), isnan(_5272)), level(0.0)).xyz;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float2 _5288 = float2(_1125, _1137);
    float _1153 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5288, float2(0.0), isnan(_5288)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5288, float2(0.0), isnan(_5288)), level(0.0)).x;
    float _1155 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1157 = int(_1155);
    if (_247)
    {
        float _1159 = in.m_60.x;
        _1065 = _1159;
    }
    float _1161 = _1065;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1165 = _1163 != 0;
    float _1167 = -_657;
    float _1169 = _1167 + 1.0;
    int _1171 = abs(_503);
    float _1173 = _1161;
    if (!_247)
    {
        float _1175 = in.m_60.y;
        _1173 = _1175;
    }
    float _1177 = _1173;
    int _1179 = abs(_513);
    float _1181 = -_659;
    float _1183 = _1181 + 1.0;
    float _1185 = trunc(_653);
    int _1187 = int(_1185);
    float _1189 = float(uint(_1157));
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1193 = int(_1191);
    if (_247)
    {
        _679 = 1.0;
    }
    float _1195 = _679;
    float _1197 = _1195;
    if (!_247)
    {
        _1197 = 1.2345600128173828125;
    }
    float _1199 = _1197;
    float _1201 = float(uint(_1187));
    float _1203 = 1.0 / _1189;
    float _1205 = _1199 * _1177;
    int _1207 = ~_1157;
    int _1209 = _1207 + 1;
    float _1211 = float(uint(_1193));
    float _1213 = trunc(_655);
    int _1215 = int(_1213);
    int _1217 = ~_1157;
    int _1219 = _1217 + 1;
    int _1221 = as_type<int>(_1203) + (-2);
    float _1223 = 1.0 / _1211;
    float _1225 = as_type<float>(_1221) * _1201;
    float _1227 = float(uint(_1215));
    float _1229 = floor(_1205);
    float _1231 = float(_1215);
    float _1233 = trunc(_1225);
    float _1235 = precise::max(_1233, 0.0);
    uint _1238 = uint(_1235);
    float _1240 = -_1229;
    float _1242 = _1205 + _1240;
    float _1244 = _1223;
    if (_1039)
    {
        float _1246 = _1093 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        _1095 = _1248;
    }
    float _1250 = _1095;
    int _1252 = _1219 * int(_1238);
    int _1254 = _1252 + _1187;
    float _1256 = float(uint(_1254));
    float _1258 = as_type<float>(_1221) * _1256;
    int _1260 = as_type<int>(_1223) + (-2);
    if (_247)
    {
        _1244 = 1.0;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (!_247)
    {
        _1264 = 7.345489978790283203125;
    }
    float _1266 = _1264;
    float _1268 = trunc(_1258);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    float _1274 = as_type<float>(_1260) * _1227;
    int _1276 = ~_1193;
    int _1278 = _1276 + 1;
    float _1280 = _1266 * _219;
    float _1282 = trunc(_1274);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = int(_1238) + int(_1272);
    float _1290 = floor(_1280);
    float _1292 = float(_1157);
    int _1294 = _1209 * _1288;
    int _1296 = _1294 + _1187;
    float _1298 = float(_1187);
    int _1300 = _1278 * int(_1286);
    int _1302 = _1300 + _1215;
    bool _1304 = _1298 >= _1292;
    bool _1306 = isnan(_1298);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(_1292);
    bool _1312 = _1308 || _1310;
    float _1314 = float(_1312);
    bool _1316 = uint(_1296) >= uint(_1157);
    float _1318 = float(uint(_1302));
    float _1320 = trunc(_1314);
    int _1322 = int(_1320);
    bool _1324 = !_1316;
    int _1326 = _1324 ? 0 : (-1);
    float _1328 = -_1290;
    float _1330 = _1280 + _1328;
    float _1332 = as_type<float>(_1260) * _1318;
    int _1334 = ~_1288;
    int _1336 = _1334 + _1326;
    int _1338 = _1336 + 1;
    float _1340 = _1330 * _1292;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1344 = _1342 != 0;
    float _1346 = trunc(_1332);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    int _1352 = _1157 * _1338;
    int _1354 = _1352 + _1187;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    float _1372 = _1292 * _625;
    bool _1374 = !_1344;
    int _1376 = _1374 ? 0 : 1;
    bool _1378 = _1157 == 0;
    float _1380 = trunc(_1340);
    int _1382 = int(_1380);
    int _1384 = ~_1322;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    bool _1390 = !_1378;
    int _1392 = _1390 ? _1354 : (-1);
    int _1394 = _1157 + (-1);
    int _1396 = abs(_1376);
    int _1398 = _1392 * _1388;
    int _1400 = int(_1286) + int(_1350);
    float _1402 = trunc(_1372);
    int _1404 = int(_1402);
    int _1406 = ~_1193;
    int _1408 = _1406 + 1;
    int _1410 = _1322 * _1394;
    int _1412 = _1410 + _1398;
    float _1414 = float(_1193);
    int _1416 = _1408 * _1400;
    int _1418 = _1416 + _1215;
    bool _1420 = _1231 >= _1414;
    bool _1422 = isnan(_1231);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(_1414);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = _1242 * _1414;
    bool _1434 = !_1165;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _1412 * _1171;
    bool _1440 = uint(_1418) >= uint(_1193);
    float _1442 = trunc(_1430);
    int _1444 = int(_1442);
    int _1446 = abs(_507);
    float _1448 = _1414 * _625;
    bool _1450 = !_1440;
    int _1452 = _1450 ? 0 : (-1);
    int _1454 = _1404 * _1446;
    int _1456 = _1454 + _1438;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1460 = _1458 != 0;
    float _1462 = trunc(_1432);
    int _1464 = int(_1462);
    int _1466 = ~_1400;
    int _1468 = _1466 + _1452;
    int _1470 = _1468 + 1;
    int _1472 = _1382 * _1396;
    int _1474 = _1472 + _1187;
    bool _1476 = !_1460;
    int _1478 = _1476 ? 0 : 1;
    bool _1480 = _1193 == 0;
    int _1482 = _1193 * _1470;
    int _1484 = _1482 + _1215;
    int _1486 = abs(_1478);
    float _1488 = trunc(_1448);
    int _1490 = int(_1488);
    int _1492 = abs(_1436);
    int _1494 = ~_1444;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    int _1500 = _1474 * _1179;
    int _1502 = _1500 + _1456;
    bool _1504 = !_1480;
    int _1506 = _1504 ? _1484 : (-1);
    int _1508 = _1464 * _1486;
    int _1510 = _1508 + _1215;
    int _1512 = _1193 + (-1);
    int _1514 = _1382 * _1492;
    int _1516 = _1514 + _1502;
    int _1518 = ~_1157;
    int _1520 = _1518 + 1;
    int _1522 = _1506 * _1498;
    bool _1524 = !_1362;
    int _1526 = _1524 ? 0 : 1;
    float _1528 = float(uint(_1516));
    int _1530 = _1444 * _1512;
    int _1532 = _1530 + _1522;
    bool _1534 = !_1358;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = abs(_1526);
    float _1540 = as_type<float>(_1221) * _1528;
    bool _1542 = !_1366;
    int _1544 = _1542 ? 0 : 1;
    int _1546 = abs(_1536);
    bool _1548 = !_1370;
    int _1550 = _1548 ? 0 : 1;
    float _1552 = trunc(_1540);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    int _1558 = abs(_1544);
    int _1560 = _1532 * _1538;
    int _1562 = abs(_1550);
    int _1564 = _1490 * _1546;
    int _1566 = _1564 + _1560;
    float _1568 = float(uint(_1510));
    int _1570 = ~_1157;
    int _1572 = _1570 + 1;
    int _1574 = _1510 * _1558;
    int _1576 = _1574 + _1566;
    int _1578 = ~_1157;
    int _1580 = _1578 + 1;
    int _1582 = ~_1193;
    int _1584 = _1582 + 1;
    int _1586 = _1464 * _1562;
    int _1588 = _1586 + _1576;
    float _1590 = float(uint(_1474));
    int _1592 = _1580 * int(_1556);
    int _1594 = _1592 + _1516;
    int _1596 = ~_1193;
    int _1598 = _1596 + 1;
    float _1600 = float(uint(_1588));
    float _1602 = as_type<float>(_1221) * _1590;
    float _1604 = float(uint(_1594));
    float _1606 = as_type<float>(_1260) * _1600;
    float _1608 = as_type<float>(_1221) * _1604;
    float _1610 = trunc(_1602);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    float _1616 = as_type<float>(_1260) * _1568;
    float _1618 = trunc(_1606);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    float _1624 = trunc(_1608);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    int _1630 = _1598 * int(_1622);
    int _1632 = _1630 + _1588;
    float _1634 = trunc(_1616);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = float(uint(_1632));
    int _1642 = _1520 * int(_1614);
    int _1644 = _1642 + _1474;
    int _1646 = int(_1556) + int(_1628);
    float _1648 = as_type<float>(_1260) * _1640;
    float _1650 = float(uint(_1644));
    int _1652 = _1572 * _1646;
    int _1654 = _1652 + _1516;
    float _1656 = trunc(_1648);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    float _1662 = as_type<float>(_1221) * _1650;
    bool _1664 = uint(_1654) >= uint(_1157);
    int _1666 = _1584 * int(_1638);
    int _1668 = _1666 + _1510;
    bool _1670 = !_1664;
    int _1672 = _1670 ? 0 : (-1);
    float _1674 = float(uint(_1668));
    int _1676 = ~_1646;
    int _1678 = _1676 + _1672;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1662);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1193;
    int _1690 = _1688 + 1;
    float _1692 = as_type<float>(_1260) * _1674;
    int _1694 = _1157 * _1680;
    int _1696 = _1694 + _1516;
    int _1698 = int(_1622) + int(_1660);
    float _1700 = trunc(_1692);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    int _1706 = ~_1157;
    int _1708 = _1706 + 1;
    int _1710 = _1690 * _1698;
    int _1712 = _1710 + _1588;
    bool _1714 = !_1378;
    int _1716 = _1714 ? _1696 : (-1);
    out.m_72.x = _1147;
    out.m_72.y = _1149;
    out.m_72.z = _1151;
    int _1718 = int(_1614) + int(_1686);
    int _1720 = _1716 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = _1716 & 3;
    bool _1726 = _1724 != 0;
    bool _1728 = uint(_1712) >= uint(_1193);
    int _1730 = _1722 ? 0 : 1;
    bool _1732 = uint(_1724) > 1u;
    bool _1734 = uint(_1724) >= 2u;
    bool _1736 = !_1728;
    int _1738 = _1736 ? 0 : (-1);
    int _1740 = _1734 ? 0 : 1;
    bool _1742 = _1724 != 3;
    bool _1744 = _225 > 0.5;
    int _1746 = _1708 * _1718;
    int _1748 = _1746 + _1474;
    int _1750 = ~_1193;
    int _1752 = _1750 + 1;
    int _1754 = int(_1638) + int(_1704);
    int _1756 = ~_1730;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = ~_1698;
    int _1764 = _1762 + _1738;
    int _1766 = _1764 + 1;
    int _1768 = _1752 * _1754;
    int _1770 = _1768 + _1510;
    int _1772 = _1760;
    if (!_1732)
    {
        int _1774 = ~_1730;
        int _1776 = _1774 + 1;
        _1772 = _1776;
    }
    int _1778 = _1772;
    bool _1780 = uint(_1748) >= uint(_1157);
    int _1782 = _1193 * _1766;
    int _1784 = _1782 + _1588;
    int _1786 = ~_1740;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = !_1780;
    int _1794 = _1792 ? 0 : (-1);
    int _1796 = _1790;
    if (_1742)
    {
        int _1798 = ~_1740;
        int _1800 = _1798 + 1;
        _1796 = _1800;
    }
    int _1802 = _1796;
    bool _1804 = uint(_1770) >= uint(_1193);
    int _1806 = ~_1718;
    int _1808 = _1806 + _1794;
    int _1810 = _1808 + 1;
    float _1812 = -_187;
    int _1814 = _1744 ? as_type<int>(_1812) : as_type<int>(_187);
    bool _1816 = !_1480;
    int _1818 = _1816 ? _1784 : (-1);
    int _1820 = _1157 * _1810;
    int _1822 = _1820 + _1474;
    int _1824 = _1716 >> 31;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1828 = _1826 != 0;
    bool _1830 = !_1804;
    int _1832 = _1830 ? 0 : (-1);
    int _1834 = _1818 >> 31;
    int _1836 = _1824 & 3;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1840 = _1838 != 0;
    bool _1842 = !_1828;
    int _1844 = _1842 ? 0 : 1;
    int _1846 = _1818 & 3;
    bool _1848 = _1846 != 0;
    int _1850 = ~_1754;
    int _1852 = _1850 + _1832;
    int _1854 = _1852 + 1;
    int _1856 = _1834 & 3;
    int _1858 = _1716 + _1836;
    int _1860 = _1193 * _1854;
    int _1862 = _1860 + _1510;
    bool _1864 = !_1840;
    int _1866 = _1864 ? 0 : 1;
    float _1868 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1870 = int(_1868);
    bool _1872 = uint(_1846) > 1u;
    int _1874 = _1818 + _1856;
    int _1876 = _1858 >> 2;
    int _1878 = _1818 & 3;
    bool _1880 = _1878 != 0;
    int _1882 = _1874 >> 2;
    int _1884 = _1876 << 4;
    int _1886 = _1884 + 368;
    int _1888 = _1880 ? 0 : 1;
    bool _1890 = _1724 != 3;
    int _1892 = _1882 << 4;
    int _1894 = _1892 + 512;
    uint _1896 = uint(int(uint(_1886) >> uint(2)));
    uint _1898 = uint(int(uint(int(_1896)) >> uint(2)));
    int _1900 = int(_1896) & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = int(_1896) + 1;
    uint _1906 = uint(int(uint(_1904) >> uint(2)));
    int _1908 = _1904 & 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[int(_1906)][_1908];
    int _1912 = ~_1888;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1916;
    if (!_1872)
    {
        int _1920 = ~_1888;
        int _1922 = _1920 + 1;
        _1918 = _1922;
    }
    int _1924 = _1918;
    bool _1926 = !_1726;
    int _1928 = _1926 ? 0 : 1;
    bool _1930 = _1846 != 3;
    uint _1932 = uint(int(uint(_1894) >> uint(2)));
    uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
    int _1936 = int(_1932) & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = int(_1932) + 1;
    uint _1942 = uint(int(uint(_1940) >> uint(2)));
    int _1944 = _1940 & 3;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[int(_1942)][_1944];
    bool _1948 = uint(_1846) >= 2u;
    bool _1950 = !_1378;
    int _1952 = _1950 ? _1822 : (-1);
    int _1954 = _1948 ? 0 : 1;
    bool _1956 = _1846 != 3;
    bool _1958 = !_1848;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = !_1890;
    int _1964 = _1962 ? 0 : (-1);
    int _1966 = ~_1954;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1974 = _1972 != 0;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1982 = _1980 != 0;
    int _1984 = _1970;
    if (_1930)
    {
        int _1986 = ~_1954;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    int _1992 = _1886 + 8;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    uint _1996 = uint(int(uint(int(_1994)) >> uint(2)));
    int _1998 = int(_1994) & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    int _2002 = int(_1994) + 1;
    uint _2004 = uint(int(uint(_2002) >> uint(2)));
    int _2006 = _2002 & 3;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[int(_2004)][_2006];
    int _2010 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2012 = _2010 != 0;
    int _2014 = abs(_1778);
    int _2016 = abs(_1924);
    bool _2018 = !_1956;
    int _2020 = _2018 ? 0 : (-1);
    int _2022 = _1894 + 8;
    uint _2024 = uint(int(uint(_2022) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    bool _2040 = _219 > 0.5;
    int _2042 = abs(_1928);
    int _2044 = ~_2014;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    bool _2050 = !_1480;
    int _2052 = _2050 ? _1862 : (-1);
    float _2054 = -_183;
    int _2056 = _2040 ? as_type<int>(_2054) : as_type<int>(_183);
    int _2058 = _2048 * as_type<int>(_1910);
    bool _2060 = _221 > 0.5;
    bool _2062 = _223 > 0.5;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2066 = abs(_1960);
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2070 = ~_2016;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2078 = ~_2042;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    float _2084 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = _2074 * as_type<int>(_1946);
    int _2088 = ~_2066;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2082 * as_type<int>(_1902);
    int _2096 = _2094 + _2058;
    int _2098 = abs(_1802);
    float _2100 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2102 = int(_2100);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2110 = _2092 * as_type<int>(_1938);
    int _2112 = _2110 + _2086;
    float _2114 = as_type<float>(_2066);
    if (_1039)
    {
        float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2118 = _1129 + _2116;
        _2114 = _2118;
    }
    float _2120 = _2114;
    int _2122 = abs(_1964);
    out.m_74.x = _2084;
    out.m_74.y = _2106;
    out.m_74.z = _2108;
    out.m_74.w = _2104;
    int _2124 = abs(_1990);
    float _2126 = _941 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2128 = abs(_2020);
    if (_1039)
    {
        float _2130 = _2120 * _2120;
        _1067 = _2130;
    }
    float _2132 = _1067;
    int _2134 = ~_2098;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2126);
    bool _2142 = !_1974;
    float _2144 = _2142 ? _187 : as_type<float>(_1814);
    bool _2146 = !_2012;
    float _2148 = _2146 ? _183 : as_type<float>(_2056);
    int _2150 = _2138 * as_type<int>(_2000);
    int _2152 = _2150 + _2096;
    int _2154 = ~_2124;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2162 = float(uint(_1870));
    int _2164 = _2158 * as_type<int>(_2030);
    int _2166 = _2164 + _2112;
    int _2168 = ~_2122;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    float _2174 = -_925;
    float _2176 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2160);
    int _2178 = ~_2128;
    int _2180 = _2178 + 1;
    int _2182 = _2180 + 1;
    float _2184 = 1.0 / _2162;
    int _2186 = abs(_1844);
    int _2188 = _2172 * as_type<int>(_2008);
    int _2190 = _2188 + _2152;
    float _2192 = float(uint(_2102));
    float _2194 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2196 = ~_2186;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    float _2202 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2204 = _2182 * as_type<int>(_2038);
    int _2206 = _2204 + _2166;
    int _2208 = abs(_1870);
    float _2210 = 1.0 / _2192;
    int _2212 = abs(_1866);
    float _2214 = -_925;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2194);
    float _2218 = -_925;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    int _2222 = _2190 * _2200;
    int _2224 = abs(_2102);
    float _2226 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2228 = float(uint(_2208));
    int _2230 = _1952 * _2186;
    int _2232 = _2230 + _2222;
    int _2234 = ~_2212;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    float _2240 = _941 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2242 = float(uint(_2224));
    float _2244 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    float _2246 = 1.0 / _2228;
    int _2248 = _2206 * _2238;
    float _2250 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    int _2252 = as_type<int>(_2184) + (-2);
    float _2254 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2240);
    float _2256 = float(uint(_2232));
    int _2258 = _2052 * _2212;
    int _2260 = _2258 + _2248;
    int _2262 = as_type<int>(_2210) + (-2);
    float _2264 = 1.0 / _2242;
    float _2266 = _941 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2268 = as_type<float>(_2252) * _2256;
    int _2270 = abs(_2232);
    float _2272 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2274 = ~_1870;
    int _2276 = _2274 + 1;
    float _2278 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    float _2280 = float(uint(_2260));
    float _2282 = trunc(_2268);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    float _2288 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = as_type<float>(_2262) * _2280;
    int _2292 = as_type<int>(_2246) + (-2);
    float _2294 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    int _2296 = abs(_2260);
    float _2298 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2278);
    float _2300 = float(uint(_2270));
    float _2302 = trunc(_2290);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    int _2308 = as_type<int>(_2264) + (-2);
    float _2310 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = float(uint(_2296));
    float _2314 = as_type<float>(_2292) * _2300;
    float _2316 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2318 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2272);
    float _2320 = trunc(_2314);
    float _2322 = precise::max(_2320, 0.0);
    uint _2324 = uint(_2322);
    float _2326 = as_type<float>(_2308) * _2312;
    int _2328 = _2276 * int(_2286);
    int _2330 = _2328 + _2232;
    float _2332 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2334 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2294);
    float _2336 = float(uint(_2330));
    float _2338 = trunc(_2326);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2318);
    int _2346 = ~_2102;
    int _2348 = _2346 + 1;
    int _2350 = ~_2208;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2252) * _2336;
    int _2356 = ~_2224;
    int _2358 = _2356 + 1;
    int _2360 = _2348 * int(_2306);
    int _2362 = _2360 + _2260;
    int _2364 = _2352 * int(_2324);
    int _2366 = _2364 + _2270;
    float _2368 = as_type<float>(_2358);
    float _2370 = _2334;
    if (_1039)
    {
        float _2372 = _1250 + (-1.0);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = float(uint(_2362));
    float _2378 = trunc(_2354);
    float _2380 = precise::max(_2378, 0.0);
    uint _2382 = uint(_2380);
    float _2384 = _2374;
    if (_1039)
    {
        float _2386 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2384 = _2386;
    }
    float _2388 = _2384;
    int _2390 = _2358 * int(_2342);
    int _2392 = _2390 + _2296;
    float _2394 = float(uint(_2366));
    float _2396 = _2394;
    if (_1039)
    {
        float _2398 = fma(_1083, _1250, _2388);
        _1089 = _2398;
    }
    float _2400 = _1089;
    float _2402 = as_type<float>(_2262) * _2376;
    float _2404 = float(uint(_2392));
    float _2406 = as_type<float>(_2292) * _2394;
    float _2408 = -_187;
    int _2410 = _2060 ? as_type<int>(_2408) : as_type<int>(_187);
    float _2412 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2414 = -_183;
    int _2416 = _2062 ? as_type<int>(_2414) : as_type<int>(_183);
    float _2418 = trunc(_2402);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    bool _2424 = !_1978;
    float _2426 = _2424 ? _187 : as_type<float>(_2410);
    float _2428 = as_type<float>(_2308) * _2404;
    bool _2430 = !_1982;
    float _2432 = _2430 ? _183 : as_type<float>(_2416);
    float _2434 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2436 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2254);
    float _2438 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2440 = _2412 * _2250;
    float _2442 = trunc(_2406);
    float _2444 = precise::max(_2442, 0.0);
    uint _2446 = uint(_2444);
    float _2448 = _2412 * _2226;
    float _2450 = _2412 * _2244;
    if (_1039)
    {
        float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2454 = _1133 + _2452;
        _2396 = _2454;
    }
    float _2456 = _2396;
    float _2458 = fma(_2438, _2434, _2440);
    float _2460 = fma(_2438, _2298, _2448);
    float _2462 = fma(_2438, _2436, _2450);
    if (_1039)
    {
        float _2464 = _2456 * _2456;
        _1069 = _2464;
    }
    float _2466 = _1069;
    float _2468 = trunc(_2428);
    float _2470 = precise::max(_2468, 0.0);
    uint _2472 = uint(_2470);
    int _2474 = int(_2286) + int(_2382);
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2478 = _2400 + _2476;
    int _2480 = ~_1870;
    int _2482 = _2480 + 1;
    out.m_76.x = _2434;
    out.m_76.y = _2298;
    out.m_76.z = _2436;
    int _2484 = ~_2102;
    int _2486 = _2484 + 1;
    float _2488 = fma(_2478, _2478, _2132);
    int _2490 = int(_2306) + int(_2422);
    int _2492 = _2482 * _2474;
    int _2494 = _2492 + _2232;
    int _2496 = ~_2208;
    int _2498 = _2496 + 1;
    int _2500 = int(_2324) + int(_2446);
    float _2502 = _2488 + _2466;
    bool _2504 = uint(_2494) >= uint(_1870);
    int _2506 = _2486 * _2490;
    int _2508 = _2506 + _2260;
    int _2510 = int(_2342) + int(_2472);
    int _2512 = _2498 * _2500;
    int _2514 = _2512 + _2270;
    int _2516 = ~_2224;
    int _2518 = _2516 + 1;
    float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2522 = uint(_2508) >= uint(_2102);
    bool _2524 = !_2504;
    int _2526 = _2524 ? 0 : (-1);
    int _2528 = _2518 * _2510;
    int _2530 = _2528 + _2296;
    bool _2532 = uint(_2514) >= uint(_2208);
    bool _2534 = !_2522;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2540 = ~_2474;
    int _2542 = _2540 + _2526;
    int _2544 = _2542 + 1;
    int _2546 = _2232 ^ _1870;
    int _2548 = ~_2490;
    int _2550 = _2548 + _2536;
    int _2552 = _2550 + 1;
    int _2554 = _1870 * _2544;
    int _2556 = _2554 + _2232;
    bool _2558 = _1870 == 0;
    float _2560 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2562 = !_2532;
    int _2564 = _2562 ? 0 : (-1);
    float _2566 = fma(_2412, _2412, 1.0);
    uint _2568 = uint(int(uint(_2546) >> uint(31)));
    float _2570 = sqrt(_2502);
    bool _2572 = uint(_2530) >= uint(_2224);
    int _2574 = _2260 ^ _2102;
    int _2576 = _2102 * _2552;
    int _2578 = _2576 + _2260;
    bool _2580 = _1870 == 0;
    float _2582 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2584 = ~_2564;
    int _2586 = _2500 + _2584;
    int _2588 = _2586 + 1;
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2592 = ~int(_2568);
    int _2594 = _2592 + 1;
    bool _2596 = !_2558;
    int _2598 = _2596 ? _2556 : (-1);
    bool _2600 = !_2572;
    int _2602 = _2600 ? 0 : (-1);
    uint _2604 = uint(int(uint(_2574) >> uint(31)));
    int _2606 = _2588 ^ _2594;
    float _2608 = float(_2598);
    bool _2610 = _2102 == 0;
    int _2612 = ~_2602;
    int _2614 = _2510 + _2612;
    int _2616 = _2614 + 1;
    int _2618 = ~int(_2604);
    int _2620 = _2618 + 1;
    bool _2622 = _2102 == 0;
    float _2624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2626 = ~_2594;
    int _2628 = _2626 + _2606;
    int _2630 = _2628 + 1;
    float _2632 = fma(_2560, _2608, _349);
    int _2634 = _2616 ^ _2620;
    bool _2636 = !_2610;
    int _2638 = _2636 ? _2578 : (-1);
    bool _2640 = !_2580;
    int _2642 = _2640 ? _2630 : (-1);
    float _2644 = rsqrt(_2566);
    int _2646 = ~_2620;
    int _2648 = _2646 + _2634;
    int _2650 = _2648 + 1;
    float _2652 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2654 = float(_2638);
    float _2656 = _2148 + 0.5;
    float _2658 = float(_2642);
    bool _2660 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2662 = isnan(_2570);
    bool _2664 = _2660 || _2662;
    bool _2666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2668 = _2664 || _2666;
    float _2670 = fma(_2652, _2654, _663);
    bool _2672 = !_2622;
    int _2674 = _2672 ? _2650 : (-1);
    float _2676 = -_649;
    float _2678 = fma(_2582, _2658, _2676);
    float _2680 = fma(_2560, _2656, _2632);
    float _2682 = _2432 + 0.5;
    float _2684 = float(_2674);
    float _2686 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2688 = _2426 + (-0.5);
    float _2690 = _2412 * _2644;
    float _2692 = fma(_2652, _2682, _2670);
    float _2694 = -_665;
    float _2696 = fma(_2686, _2684, _2694);
    float _2698 = -_2582;
    float _2700 = fma(_2698, _2688, _2678);
    float _2702 = -_2332;
    float _2704 = _2690 * _2702;
    float _2706 = -_2334;
    float _2708 = _2690 * _2706;
    float _2710 = _2144 + (-0.5);
    float _2712 = -_2344;
    float _2714 = _2690 * _2712;
    float _2716 = fma(_2644, _2250, _2704);
    float _2718 = fma(_2644, _2226, _2708);
    float _2720 = -_2686;
    float _2722 = fma(_2720, _2710, _2696);
    float _2724 = fma(_2644, _2244, _2714);
    float _2726 = -_647;
    float _2728 = _2726 + 1.0;
    float _2730 = -_651;
    float _2732 = _2730 + 1.0;
    float _2734 = _2332 + _2458;
    float _2736 = -_1169;
    float _2738 = fma(_2148, _2736, _2680);
    float _2740 = -_2728;
    float _2742 = fma(_2432, _2740, _2692);
    float _2744 = fma(_2426, _1183, _2700);
    float _2746 = fma(_2144, _2732, _2722);
    float _2748 = _2334 + _2460;
    float _2750 = _2344 + _2462;
    out.m_78.x = _2716;
    out.m_78.y = _2718;
    out.m_78.z = _2724;
    float _2752 = _2732;
    float _2754 = _2718;
    float _2756 = _2724;
    if (!_2668)
    {
        _2752 = 1.0;
    }
    float _2758 = _2752;
    out.m_80.x = _2738;
    out.m_80.y = _2744;
    out.m_80.z = _2742;
    out.m_80.w = _2746;
    out.m_82.x = _2734;
    out.m_82.y = _2748;
    out.m_82.z = _2750;
    bool _2760 = !_2668;
    float _2762 = _2758;
    if (!_2760)
    {
        bool _2764 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2766 = isnan(_2570);
        bool _2768 = _2764 || _2766;
        bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2772 = _2768 || _2770;
        if (!_2772)
        {
            float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2776 = _2570 + _2774;
            float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2780 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2778;
            float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2786 = 1.0 / _2780;
            float _2788 = _2776 * _2786;
            float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2762 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2570 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2796 = isnan(_2570);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                float _2804 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2806 = _2570 + _2804;
                float _2808 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2810 = _2808 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2812 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2814 = _2812 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2816 = 1.0 / _2810;
                float _2818 = _2806 * _2816;
                float _2820 = fma(_2818, _2814, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2762 = _2820;
                _2792 = true;
            }
            else
            {
                _2762 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2792 = false;
    float _2822 = _2762;
    float _2824 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2826 = _2400 + _2824;
    float _2828 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2830 = _1129 + _2828;
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2834 = _1133 + _2832;
    float _2836 = fma(_2826, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2838 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2840 = fma(_2834, _2822, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2844 = _2836 + _2842;
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2852 = _2840 + _2850;
    float _2854 = _2844 * _2844;
    float _2856 = fma(_2848, _2848, _2854);
    float _2858 = fma(_2852, _2852, _2856);
    float _2860 = rsqrt(_2858);
    float _2862 = sqrt(_2858);
    float _2864 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2866 = _2848 * _2864;
    float _2868 = _2852 * _2864;
    float _2870 = _2866 * _2866;
    float _2872 = _2868 * _2868;
    float _2874 = _2870 + _2872;
    float _2876 = sqrt(_2874);
    bool _2878 = _2876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2876 + _2880;
    float _2884 = _2860;
    float _2886 = _2882;
    float _2888 = _2844;
    float _2890 = _2866;
    if (_2878)
    {
        float _2892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2892;
    }
    float _2894 = _2884;
    if (_2878)
    {
        float _2896 = rsqrt(_2874);
        _2370 = _2896;
    }
    float _2898 = _2370;
    float _2900 = _2898;
    if (_2878)
    {
        float _2902 = _2882 * _2894;
        _2886 = _2902;
    }
    float _2904 = _2886;
    if (_2878)
    {
        float _2906 = _2904 * 0.15915493667125701904296875;
        _2754 = _2906;
    }
    float _2908 = _2754;
    float _2910 = _2894;
    if (_2878)
    {
        float _2912 = _2908 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        _2910 = _2914;
    }
    float _2916 = _2910;
    float _2918 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2920 = precise::max(0.0, _2918);
    float _2922 = _2852;
    float _2924 = _2920;
    if (_2878)
    {
        float _2926 = _2908 * 6.283185482025146484375;
        float _2928 = cos(_2926);
        _2922 = _2928;
    }
    float _2930 = _2922;
    float _2932 = -_2864;
    float _2934 = -_2920;
    float _2936 = fma(_2844, _2932, _2934);
    if (!_2878)
    {
        _2888 = _2868;
    }
    float _2938 = _2888;
    float _2940 = _2938;
    if (_2878)
    {
        float _2942 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2924 = _2942;
    }
    float _2944 = _2924;
    float _2946 = _2916;
    float _2948 = _2944;
    if (_2878)
    {
        float _2950 = fma(_2916, _2944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2756 = _2950;
    }
    float _2952 = _2756;
    float _2954 = _2952;
    if (!_2878)
    {
        _2946 = _2936;
    }
    float _2956 = _2946;
    float _2958 = _2956;
    float _2960 = _2930;
    if (_2878)
    {
        float _2962 = _2930 + (-1.0);
        _2948 = _2962;
    }
    float _2964 = _2948;
    float _2966 = _2964;
    if (_2878)
    {
        float _2968 = _2898 * _2952;
        _2954 = _2968;
    }
    float _2970 = _2954;
    if (_2878)
    {
        float _2972 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2900 = _2972;
    }
    float _2974 = _2900;
    if (_2878)
    {
        float _2976 = _2866 * _2970;
        _2890 = _2976;
    }
    float _2978 = _2890;
    if (!_2878)
    {
        _2966 = _2870;
    }
    float _2980 = _2966;
    float _2982 = _2980;
    if (_2878)
    {
        float _2984 = _2868 * _2970;
        _2940 = _2984;
    }
    float _2986 = _2940;
    if (_2878)
    {
        float _2988 = fma(_2936, _2930, _2974);
        _2958 = _2988;
    }
    float _2990 = _2958;
    if (_2878)
    {
        float _2992 = _2978 * _2978;
        _2982 = _2992;
    }
    float _2994 = _2982;
    if (!_2878)
    {
        _2960 = _2872;
    }
    float _2996 = _2960;
    float _2998 = _2996;
    if (_2878)
    {
        float _3000 = _2986 * _2986;
        _2998 = _3000;
    }
    float _3002 = _2998;
    float _3004 = fma(_2990, _2990, _2994);
    float _3006 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3008 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3010 = _3004 + _3002;
    float _3012 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3006);
    float _3014 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3018 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3016);
    float _3020 = precise::clamp(_3018, 0.0, 1.0);
    float _3022 = rsqrt(_3010);
    float _3024 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3012);
    float _3026 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3028 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3030 = -_3020;
    float _3032 = _3030 + 1.0;
    float _3034 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3036 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3026);
    float _3038 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3028);
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3042 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3008);
    float _3044 = abs(_3032);
    float _3046 = log2(_3044);
    float _3048 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3050 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3036);
    float _3052 = _3038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3054 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3042);
    float _3056 = -_3048;
    float _3058 = fma(_3056, _3040, 1.0);
    float _3060 = _3022 * _2978;
    float _3062 = _3050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3064 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3066 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3068 = _3022 * _2990;
    float _3070 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3072 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3064);
    float _3074 = _3022 * _2986;
    float _3076 = log2(_3058);
    float _3078 = -_3070;
    float _3080 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3078);
    float _3082 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3072);
    float _3084 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3086 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3088 = -_3074;
    float _3090 = fma(_3088, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3080);
    float _3092 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3082);
    float _3094 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3096 = exp2(_3084);
    float _3098 = fma(_3090, -0.5, 0.5);
    float _3100 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3086);
    float _3102 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3094);
    float _3104 = fma(_3090, 0.5, 0.5);
    float _3106 = _3068 + 1.0;
    float _3108 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3100);
    float _3110 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3102);
    float _3112 = 1.0 / _3092;
    float _3114 = fma(_3104, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3116 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3108);
    float _3118 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3110);
    float _3120 = _3076 * 0.693147182464599609375;
    float _3122 = fma(_3104, _3114, -0.212114393711090087890625);
    float _3124 = sqrt(_3098);
    float _3126 = -_3068;
    float _3128 = fma(_3096, _3106, _3126);
    float _3130 = fma(_3104, _3122, 1.570728778839111328125);
    float _3132 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3134 = fma(_3128, 0.5, 0.5);
    float _3136 = _3118 * _3112;
    float _3138 = _3116 * _3112;
    float _3140 = fma(_3136, 0.5, 0.5);
    float _3142 = fma(_3138, -0.5, 0.5);
    float _3144 = _3124 * 0.636619746685028076171875;
    float3 _8243 = float3(_3140, _3142, _3132);
    float _3146 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8243, float3(0.0), isnan(_8243)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8243, float3(0.0), isnan(_8243)), level(0.0)).x;
    float3 _8254 = float3(_3140, _3142, _3132);
    float4 _3149 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8254, float3(0.0), isnan(_8254)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8254, float3(0.0), isnan(_8254)), level(0.0)).xyzw;
    float _3151 = _3149.x;
    float _3153 = _3149.y;
    float _3155 = _3149.z;
    float _3157 = _3149.w;
    float _3159 = -_3130;
    float _3161 = fma(_3144, _3159, 1.0);
    float2 _8275 = float2(_3161, _3134);
    float3 _3163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8275, float2(0.0), isnan(_8275)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8275, float2(0.0), isnan(_8275)), level(0.0)).xyz;
    float _3165 = _3163.x;
    float _3167 = _3163.y;
    float _3169 = _3163.z;
    float _3171 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3173 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3175 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3177 = -_1153;
    float _3179 = _3177 + 1.0;
    float _3181 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3171);
    float _3183 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3173);
    float _3185 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3175);
    float _3187 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3181);
    float _3189 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3183);
    float _3191 = _3187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3193 = _3189 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3195 = 1.0 / _3191;
    float _3197 = _3193 + _3191;
    bool _3199 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3201 = isnan(_2862);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3207 = _3203 || _3205;
    float _3209 = _3197 * _3195;
    float _3211 = _3209 * 0.5;
    float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3215 = fma(_3211, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3213);
    float _3217 = in.m_84.x;
    float _3219 = 1.0 / _3215;
    float _3221 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3223 = _3219 * _3221;
    float _3225 = abs(_3223);
    float _3227 = log2(_3225);
    bool _3229 = _3223 <= 8000.0;
    bool _3231 = isnan(_3223);
    bool _3233 = _3229 || _3231;
    bool _3235 = isnan(8000.0);
    bool _3237 = _3233 || _3235;
    float _3239 = float(_3237);
    float _3241 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3243 = exp2(_3241);
    float _3245 = fma(_3243, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3251 = fma(_3034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3185);
    float _3253 = fma(_3247, -2.0, 3.0);
    float _3255 = _3247 * _3247;
    float _3257 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3251);
    float _3259 = exp2(_3249);
    float _3261 = _3255 * _3253;
    float _3263 = _3257 + _3092;
    out.gl_Position.x = _3118;
    out.gl_Position.y = _3116;
    out.gl_Position.z = _3257;
    out.gl_Position.w = _3092;
    float _3265 = -_3261;
    float _3267 = _3265 + 1.0;
    float _3269 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3261);
    float _3271 = _3239 * _3269;
    float _3273 = -_3259;
    float _3275 = _3273 + 1.0;
    float _3277 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3279 = _3263 * 0.5;
    float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3283 = _3257;
    float _3285 = _3116;
    float _3287 = _3118;
    float _3289 = _3092;
    float _3291 = _3281;
    float _3293 = _3155;
    if (!_3207)
    {
        _3283 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3295 = _3283;
    float _3297 = _3179 * _3277;
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = _3295;
    float _3303 = _3295;
    if (!_3207)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3305 = _3285;
    float _3307 = _3305;
    float _3309 = _3305;
    if (!_3207)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3311 = _3287;
    float _3313 = -_3299;
    float _3315 = fma(_3313, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3317 = -_3281;
    float _3319 = _3317 + 1.0;
    float _3321 = _3315 * _3217;
    float _3323 = _3311;
    float _3325 = _3311;
    if (!_3207)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3327 = _3289;
    float _3329 = _3321 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.z = _3279;
    out.m_86.w = _3092;
    out.m_88.x = _3329;
    float _3331 = _3281 * _3146;
    float _3333 = _3157 * _3319;
    float _3335 = _3327;
    float _3337 = _3327;
    if (!_3207)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3339 = _3291;
    float _3341 = _3157 * _3331;
    float _3343 = _3169 * _3331;
    float _3345 = fma(_3165, _3341, _3151);
    float _3347 = fma(_3167, _3341, _3153);
    float _3349 = fma(_3157, _3343, _3155);
    float _3351 = _3339;
    float _3353 = _3339;
    if (!_3207)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3355 = _3293;
    out.m_90.x = _3345;
    out.m_90.y = _3347;
    out.m_90.z = _3349;
    out.m_90.w = _3333;
    bool _3357 = !_3207;
    float _3359 = _3355;
    float _3361 = _3355;
    if (!_3357)
    {
        bool _3363 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3365 = isnan(_2862);
        bool _3367 = _3363 || _3365;
        bool _3369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3371 = _3367 || _3369;
        if (!_3371)
        {
            float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3375 = _2862 + _3373;
            float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3377;
            float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3385 = 1.0 / _3379;
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3403 = _3375 * _3385;
            float _3405 = precise::clamp(_3403, 0.0, 1.0);
            float _3407 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3409 = _3407 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3411 = fma(_3405, _3383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3413 = fma(_3405, _3409, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3415 = fma(_3405, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3417 = fma(_3405, _3393, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3419 = fma(_3405, _3397, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3421 = fma(_3405, _3401, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3361 = _3415;
            _3309 = _3419;
            _3353 = _3411;
            _3303 = _3417;
            _3337 = _3413;
            _3325 = _3421;
            _3423 = true;
        }
        else
        {
            bool _3425 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3427 = isnan(_2862);
            bool _3429 = _3425 || _3427;
            bool _3431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3433 = _3429 || _3431;
            if (!_3433)
            {
                _3351 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3435 = _3351;
            _3353 = _3435;
            if (!_3433)
            {
                _3359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3437 = _3359;
            _3361 = _3437;
            if (!_3433)
            {
                _3335 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3439 = _3335;
            _3337 = _3439;
            if (!_3433)
            {
                _3301 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3441 = _3301;
            _3303 = _3441;
            if (!_3433)
            {
                _3307 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3443 = _3307;
            _3309 = _3443;
            if (!_3433)
            {
                _3323 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3445 = _3323;
            bool _3447 = !_3433;
            _3325 = _3445;
            if (!_3447)
            {
                bool _3449 = _2862 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3451 = isnan(_2862);
                bool _3453 = _3449 || _3451;
                bool _3455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3457 = _3453 || _3455;
                if (!_3457)
                {
                    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3461 = _2862 + _3459;
                    float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3465 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3463;
                    float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3471 = 1.0 / _3465;
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3477 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3485 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3487 = _3485 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3489 = _3461 * _3471;
                    float _3491 = precise::clamp(_3489, 0.0, 1.0);
                    float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3497 = fma(_3491, _3469, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3499 = fma(_3491, _3495, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3501 = fma(_3491, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3503 = fma(_3491, _3479, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3505 = fma(_3491, _3483, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3507 = fma(_3491, _3487, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3361 = _3501;
                    _3309 = _3505;
                    _3353 = _3497;
                    _3303 = _3503;
                    _3337 = _3499;
                    _3325 = _3507;
                    _3423 = true;
                }
                else
                {
                    _3361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3309 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3353 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3303 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3337 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3325 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3423 = false;
    float _3509 = _3361;
    float _3511 = _3309;
    float _3513 = _3353;
    float _3515 = _3303;
    float _3517 = _3337;
    float _3519 = _3325;
    float _3521 = fma(_2748, -0.5, 0.5);
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = -_3509;
    float _3527 = _3525 + _3511;
    float _3529 = -_3513;
    float _3531 = _3529 + _3515;
    float _3533 = -_3517;
    float _3535 = _3533 + _3519;
    bool _3537 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3539 = fma(_3523, _3527, _3509);
    float _3541 = fma(_3523, _3531, _3513);
    float _3543 = fma(_3523, _3535, _3517);
    float _3545 = _3539 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3547 = fma(_3541, 0.298911988735198974609375, _3545);
    float _3549 = fma(_3543, 0.114477999508380889892578125, _3547);
    float _3551 = -_3549;
    float _3553 = _3541 + _3551;
    float _3555 = -_3549;
    float _3557 = _3539 + _3555;
    float _3559 = -_3549;
    float _3561 = _3543 + _3559;
    float _3563 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3565 = fma(_3553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    float _3567 = fma(_3557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    float _3569 = fma(_3561, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3549);
    out.m_53.x = _3563;
    out.m_94.x = _3565;
    out.m_94.y = _3567;
    out.m_94.z = _3569;
    if (!_3537)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3571 = -_2836;
    float _3573 = _3571 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3575 = -_2838;
    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3579 = -_2840;
    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3583 = _3573 * _3573;
    float _3585 = fma(_3577, _3577, _3583);
    float _3587 = fma(_3581, _3581, _3585);
    float _3589 = sqrt(_3587);
    float _3591 = rsqrt(_3587);
    float _3593 = -_3589;
    float _3595 = _3593 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3597 = _3595 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3599 = precise::clamp(_3597, 0.0, 1.0);
    float _3601 = _3577 * _3591;
    float _3603 = _3573 * _3591;
    float _3605 = abs(_3599);
    float _3607 = log2(_3605);
    float _3609 = _3581 * _3591;
    float _3611 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3613 = _2748 * _3603;
    float _3615 = -_3603;
    float _3617 = -_3611;
    float _3619 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3617);
    float _3621 = fma(_2734, _3601, _3613);
    float _3623 = -_3609;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3619);
    float _3627 = fma(_2750, _3609, _3621);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3633 = _3625 + _3631;
    float _3635 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3637 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = exp2(_3635);
    float _3643 = _3641 * _3639;
    float _3645 = _3629 * _3643;
    float _3647 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3649 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3651 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3647;
    out.m_92.y = _3649;
    out.m_92.z = _3651;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

