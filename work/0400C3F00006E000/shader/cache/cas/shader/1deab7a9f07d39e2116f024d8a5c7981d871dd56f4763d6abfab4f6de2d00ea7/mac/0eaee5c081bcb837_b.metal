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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_90 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_82 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _801 = false;
    bool _665 = false;
    bool _449 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4300 = as_type<float>(_127);
        out.gl_Position.z = _4300;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    float _131 = float(_113);
    float _133 = 1.0 / _131;
    float _135 = -_129;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_129);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = _137 * _133;
    bool _151 = _137 >= _131;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    out.m_51.x = _149;
    float _157 = _129;
    float _159 = _149;
    float _161 = _137;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    int _165 = 0;
    if (_155)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4373 = as_type<float>(_169);
        out.gl_Position.z = _4373;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    float _179 = in.m_58.x;
    float _181 = in.m_58.y;
    float _183 = in.m_58.z;
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_173, _191, _221);
    float _227 = fma(_177, _183, _219);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _225);
    bool _233 = !_205;
    float _251;
    if (!_233)
    {
        float _235 = in.m_64.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _149;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = _255 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    bool _277 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_255);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = -_287;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _271;
    float _299 = 1.0 / _275;
    float _301 = _259 * _289;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _255 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = _305 * _297;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = fma(_309, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = fma(_315, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _325 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_255);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _263 * _299;
    bool _339 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _341 = isnan(_255);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    bool _351 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_255);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _349 * _295;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = -_361;
    float _375 = _373 + 1.0;
    float _377 = _361 * _371;
    float _379 = fma(_365, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = _335 * _375;
    float _385 = in.m_66.x;
    float _387 = in.m_66.y;
    float _389 = -_335;
    float _391 = _389 + 1.0;
    float _393 = _317 * _383;
    float _395 = _323 * _383;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_379, _377, _405);
    float _415 = fma(_381, _377, _407);
    float _417 = fma(_409, _367, _413);
    float _419 = fma(_411, _367, _415);
    float _421 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    float _425 = _421 * _385;
    float _427 = _423 * _387;
    bool _429 = !_291;
    float _447;
    if (!_429)
    {
        float _431 = in.m_64.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _149;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _451 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _451 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _477 = 1.0 / _467;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _481 = 1.0 / _471;
    bool _483 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _485 = isnan(_451);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = 1.0 / _475;
    bool _497 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _499 = isnan(_451);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _455 * _477;
    bool _511 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _513 = isnan(_451);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -_507;
    float _525 = _523 + 1.0;
    float _527 = _459 * _481;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _529;
    float _533 = _521 * _525;
    float _535 = -_521;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _543 = fma(_531, _527, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _545 = _493 * _537;
    float _547 = _463 * _495;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _553;
    float _557 = -_493;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = fma(_555, _527, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _569 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _571 = isnan(_451);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = fma(_563, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _587 = fma(_541, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _589 = _579 * _559;
    float _591 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = -_579;
    float _595 = _593 + 1.0;
    float _597 = _565 * _589;
    float _599 = _543 * _589;
    float _601 = _567 * _589;
    float _603 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].y, _597);
    float _605 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].x, _599);
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].z, _601);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _617;
    float _621 = fma(_591, _545, _605);
    float _623 = fma(_611, _509, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _625 = fma(_615, _509, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _627 = fma(_619, _509, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _629 = fma(_585, _545, _603);
    float _631 = fma(_587, _545, _607);
    float _633 = fma(_623, _533, _621);
    float _635 = fma(_627, _533, _629);
    float _637 = fma(_625, _533, _631);
    float _639 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].x, _633);
    float _641 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].y, _635);
    float _643 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].z, _637);
    bool _645 = !_479;
    float _663;
    if (!_645)
    {
        float _647 = in.m_64.x;
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _651 = _647 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        _663 = _149;
    }
    _665 = false;
    float _667 = _663;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _671 = _667 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _677 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_667);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _693 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _695 = isnan(_667);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    bool _709 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _711 = isnan(_667);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _675;
    float _723 = -_687;
    float _725 = _723 + 1.0;
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _729 = _703 * _725;
    float _731 = -_703;
    float _733 = _731 + 1.0;
    float _735 = 1.0 / _691;
    float _737 = _707 * _721;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _743 = fma(_737, _671, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = -_719;
    float _747 = _745 + 1.0;
    float _749 = _743 * _729;
    float _751 = _741 * _735;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _755 = _667 + _753;
    float _757 = _687 * _747;
    float _759 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _749);
    float _761 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = fma(_751, _755, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = fma(_763, _757, _759);
    float _771 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _773 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[117].x, _769);
    float _777 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _767;
    out.m_68.y = _777;
    out.m_68.z = _773;
    out.m_68.w = _779;
    bool _781 = !_727;
    float _799;
    if (!_781)
    {
        float _783 = in.m_64.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        _799 = _149;
    }
    _801 = false;
    float _803 = _799;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _807 = _803 + _805;
    bool _809 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _811 = isnan(_803);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _823 = _803 + _821;
    bool _825 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _827 = isnan(_803);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _845 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _847 = isnan(_803);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -_819;
    float _859 = _857 + 1.0;
    float _861 = 1.0 / _843;
    float _863 = _855 * _859;
    float _865 = -_855;
    float _867 = _865 + 1.0;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _869;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _875 = 1.0 / _839;
    float _877 = _835 * _867;
    float _879 = -_835;
    float _881 = _879 + 1.0;
    float _883 = _823 * _861;
    float _885 = _807 * _875;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _891;
    float _895 = fma(_871, _885, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = fma(_889, _885, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _899 = fma(_893, _885, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _901 = _895 * _877;
    float _903 = _897 * _877;
    float _905 = _899 * _877;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _919 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].x, _901);
    float _921 = fma(_909, _883, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _923 = fma(_913, _883, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _925 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].y, _903);
    float _927 = fma(_917, _883, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _929 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].z, _905);
    float _931 = fma(_921, _863, _919);
    float _933 = fma(_923, _863, _925);
    float _935 = fma(_927, _863, _929);
    float _937 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].x, _931);
    float _939 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].y, _933);
    float _941 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].z, _935);
    bool _943 = !_873;
    float _945 = _863;
    if (!_943)
    {
        float _947 = in.m_64.x;
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _951 = _947 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _953 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _955 = _953 * _949;
        float _957 = floor(_955);
        float _959 = -_957;
        float _961 = _955 + _959;
        _159 = _961;
    }
    float _963 = _159;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _967 = int(_965);
    float _969 = _133 * _137;
    float _971 = in.m_60.w;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    bool _977 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _979 = isnan(_963);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _991 = int(_989);
    float _993 = in.m_62.w;
    float _995 = float(_967);
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _999 = int(_997);
    if (_975)
    {
        float _1001 = in.m_64.x;
        _945 = _1001;
    }
    float _1003 = _945;
    float _1005 = 0.0;
    if (_975)
    {
        _1005 = 1.0;
    }
    float _1007 = _1005;
    float _1009 = _1007;
    if (!_975)
    {
        _1009 = 1.2345600128173828125;
    }
    float _1011 = _1009;
    float _1013 = _1003;
    if (!_975)
    {
        float _1015 = in.m_64.y;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = float(_991);
    float _1021 = 1.0 / _995;
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1025 = int(_1023);
    float _1027 = float(uint(_999));
    int _1029 = ~_999;
    int _1031 = _1029 + 1;
    float _1033 = float(_999);
    float _1035 = 1.0 / _1019;
    float _1037 = _1021 * _137;
    float _1039 = in.m_64.x;
    float _1041 = in.m_64.y;
    float _1043 = in.m_64.z;
    float _1045 = in.m_64.w;
    float _1047 = _1011 * _1017;
    float _1049 = 1.0 / _1027;
    float _1051 = float(uint(_1025));
    int _1053 = ~_1025;
    int _1055 = _1053 + 1;
    float _1057 = _1019;
    if (_975)
    {
        _1057 = 1.0;
    }
    float _1059 = _1057;
    float _1061 = _1059;
    if (!_975)
    {
        _1061 = 7.345489978790283203125;
    }
    float _1063 = _1061;
    float _1065 = trunc(_1037);
    int _1067 = int(_1065);
    float _1069 = _1035 * _137;
    float _1071 = float(_1025);
    float _1073 = 1.0 / _1051;
    int _1075 = as_type<int>(_1049) + (-2);
    float _1077 = _1063 * _1039;
    bool _1079 = _1045 > 0.5;
    float _1081 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1083 = _1041 > 0.5;
    float _1085 = _1043 + _1041;
    float _1087 = trunc(_1069);
    int _1089 = int(_1087);
    float _1091 = float(uint(_1067));
    float _1093 = -_213;
    int _1095 = _1079 ? as_type<int>(_1093) : as_type<int>(_213);
    float _1097 = _1085 + (-1.0);
    float _1099 = as_type<float>(_1075) * _1091;
    int _1101 = as_type<int>(_1073) + (-2);
    float _1103 = floor(_1077);
    float _1105 = float(uint(_1089));
    float _1107 = trunc(_1099);
    float _1109 = precise::max(_1107, 0.0);
    uint _1112 = uint(_1109);
    float _1114 = as_type<float>(_1101) * _1105;
    float _1116 = trunc(_1114);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    int _1122 = _1031 * int(_1112);
    int _1124 = _1122 + _1067;
    float _1126 = floor(_1047);
    float _1128 = float(uint(_1124));
    int _1130 = _1055 * int(_1120);
    int _1132 = _1130 + _1089;
    float _1134 = as_type<float>(_1075) * _1128;
    float _1136 = float(uint(_1132));
    float _1138 = trunc(_1134);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = -_1103;
    float _1146 = _1077 + _1144;
    int _1148 = ~_999;
    int _1150 = _1148 + 1;
    float _1152 = -_1126;
    float _1154 = _1047 + _1152;
    float _1156 = as_type<float>(_1101) * _1136;
    float _1158 = -_209;
    int _1160 = _1083 ? as_type<int>(_1158) : as_type<int>(_209);
    float _1162 = _1154 * _1071;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1174 = _1172 != 0;
    float _1176 = trunc(_1156);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = _1043 > 0.5;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1186 = _1184 != 0;
    int _1188 = int(_1112) + int(_1142);
    float _1190 = trunc(_1162);
    int _1192 = int(_1190);
    float _1194 = -_213;
    int _1196 = _1182 ? as_type<int>(_1194) : as_type<int>(_213);
    int _1198 = ~_1025;
    int _1200 = _1198 + 1;
    int _1202 = _1150 * _1188;
    int _1204 = _1202 + _1067;
    bool _1206 = !_1170;
    float _1208 = _1206 ? _209 : as_type<float>(_1160);
    bool _1210 = !_1174;
    float _1212 = _1210 ? _213 : as_type<float>(_1196);
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1224 = _1222 != 0;
    int _1226 = int(_1120) + int(_1180);
    bool _1228 = !_1186;
    int _1230 = _1228 ? 0 : 1;
    bool _1232 = uint(_1204) >= uint(_999);
    float _1234 = float(_1067);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1238 = _1236 != 0;
    int _1240 = _1200 * _1226;
    int _1242 = _1240 + _1089;
    bool _1244 = _1234 >= _1033;
    bool _1246 = isnan(_1234);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1033);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    bool _1256 = !_1238;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = trunc(_1254);
    int _1262 = int(_1260);
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1266 = _1264 != 0;
    bool _1268 = uint(_1242) >= uint(_1025);
    float _1270 = _1146 * _1033;
    bool _1272 = !_1232;
    int _1274 = _1272 ? 0 : (-1);
    bool _1276 = !_1166;
    float _1278 = _1276 ? _213 : as_type<float>(_1095);
    bool _1280 = !_1266;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = _1033 * _969;
    bool _1286 = !_1268;
    int _1288 = _1286 ? 0 : (-1);
    float _1290 = trunc(_1270);
    int _1292 = int(_1290);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1308 = _1306 != 0;
    float _1310 = _1071 * _969;
    int _1312 = ~_1188;
    int _1314 = _1312 + _1274;
    int _1316 = _1314 + 1;
    int _1318 = ~_1262;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    bool _1324 = !_1300;
    int _1326 = _1324 ? 0 : 1;
    int _1328 = _999 * _1316;
    int _1330 = _1328 + _1067;
    bool _1332 = _999 == 0;
    float _1334 = trunc(_1284);
    int _1336 = int(_1334);
    int _1338 = _999 + (-1);
    bool _1340 = !_1332;
    int _1342 = _1340 ? _1330 : (-1);
    bool _1344 = !_1220;
    int _1346 = _1344 ? 0 : 1;
    bool _1348 = !_1216;
    int _1350 = _1348 ? 0 : 1;
    int _1352 = _1342 * _1322;
    float _1354 = float(_1089);
    float _1356 = trunc(_1310);
    int _1358 = int(_1356);
    int _1360 = abs(_1350);
    int _1362 = _1262 * _1338;
    int _1364 = _1362 + _1352;
    int _1366 = abs(_1346);
    int _1368 = abs(_1282);
    bool _1370 = _1354 >= _1071;
    bool _1372 = isnan(_1354);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(_1071);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    int _1382 = ~_1226;
    int _1384 = _1382 + _1288;
    int _1386 = _1384 + 1;
    int _1388 = abs(_1230);
    float _1390 = trunc(_1380);
    int _1392 = int(_1390);
    int _1394 = _1364 * _1366;
    bool _1396 = !_1224;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = _1192 * _1368;
    int _1402 = _1400 + _1089;
    int _1404 = ~_1025;
    int _1406 = _1404 + 1;
    int _1408 = _1025 * _1386;
    int _1410 = _1408 + _1089;
    bool _1412 = !_1296;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _1336 * _1360;
    int _1418 = _1416 + _1394;
    bool _1420 = _1025 == 0;
    int _1422 = _1292 * _1388;
    int _1424 = _1422 + _1067;
    int _1426 = abs(_1398);
    float _1428 = _1039 * 2.0;
    int _1430 = abs(_1258);
    bool _1432 = !_1420;
    int _1434 = _1432 ? _1410 : (-1);
    int _1436 = _1424 * _1426;
    int _1438 = _1436 + _1418;
    float _1440 = floor(_1428);
    int _1442 = abs(_1326);
    int _1444 = ~_1392;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1292 * _1430;
    int _1452 = _1450 + _1438;
    int _1454 = _1025 + (-1);
    int _1456 = _1434 * _1448;
    float _1458 = float(uint(_1452));
    int _1460 = abs(_1414);
    int _1462 = _1392 * _1454;
    int _1464 = _1462 + _1456;
    bool _1466 = !_1304;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = as_type<float>(_1075) * _1458;
    int _1472 = _1464 * _1442;
    bool _1474 = !_1308;
    int _1476 = _1474 ? 0 : 1;
    int _1478 = abs(_1468);
    float _1480 = trunc(_1470);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    int _1486 = _1358 * _1460;
    int _1488 = _1486 + _1472;
    int _1490 = abs(_1476);
    float _1492 = float(uint(_1424));
    int _1494 = _1402 * _1478;
    int _1496 = _1494 + _1488;
    int _1498 = ~_999;
    int _1500 = _1498 + 1;
    float _1502 = float(uint(_1402));
    int _1504 = _1192 * _1490;
    int _1506 = _1504 + _1496;
    float _1508 = as_type<float>(_1075) * _1492;
    bool _1510 = _1043 > 0.5;
    float _1512 = as_type<float>(_1101) * _1502;
    float _1514 = float(uint(_1506));
    int _1516 = _1500 * int(_1484);
    int _1518 = _1516 + _1452;
    float _1520 = trunc(_1508);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    float _1526 = as_type<float>(_1101) * _1514;
    float _1528 = float(uint(_1518));
    int _1530 = ~_999;
    int _1532 = _1530 + 1;
    float _1534 = trunc(_1526);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = as_type<float>(_1075) * _1528;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    int _1548 = _1532 * int(_1524);
    int _1550 = _1548 + _1424;
    float _1552 = float(uint(_1550));
    float _1554 = trunc(_1512);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = ~_999;
    int _1562 = _1560 + 1;
    float _1564 = as_type<float>(_1075) * _1552;
    int _1566 = _1406 * int(_1538);
    int _1568 = _1566 + _1506;
    int _1570 = int(_1484) + int(_1546);
    float _1572 = float(uint(_1568));
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    int _1580 = _1562 * _1570;
    int _1582 = _1580 + _1452;
    float _1584 = as_type<float>(_1101) * _1572;
    bool _1586 = uint(_1582) >= uint(_999);
    int _1588 = _1406 * int(_1558);
    int _1590 = _1588 + _1402;
    float _1592 = trunc(_1584);
    float _1594 = precise::max(_1592, 0.0);
    uint _1596 = uint(_1594);
    bool _1598 = !_1586;
    int _1600 = _1598 ? 0 : (-1);
    float _1602 = float(uint(_1590));
    int _1604 = ~_1570;
    int _1606 = _1604 + _1600;
    int _1608 = _1606 + 1;
    int _1610 = int(_1524) + int(_1578);
    float _1612 = as_type<float>(_1101) * _1602;
    int _1614 = ~_999;
    int _1616 = _1614 + 1;
    int _1618 = _999 * _1608;
    int _1620 = _1618 + _1452;
    int _1622 = ~_1025;
    int _1624 = _1622 + 1;
    bool _1626 = !_1332;
    int _1628 = _1626 ? _1620 : (-1);
    int _1630 = int(_1538) + int(_1596);
    int _1632 = _1616 * _1610;
    int _1634 = _1632 + _1424;
    int _1636 = _1628 & 3;
    bool _1638 = _1636 != 0;
    float _1640 = trunc(_1612);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    int _1646 = _1628 & 3;
    bool _1648 = _1646 != 0;
    int _1650 = _1624 * _1630;
    int _1652 = _1650 + _1506;
    bool _1654 = uint(_1636) >= 2u;
    int _1656 = _1648 ? 0 : 1;
    bool _1658 = uint(_1634) >= uint(_999);
    int _1660 = _1654 ? 0 : 1;
    bool _1662 = uint(_1652) >= uint(_1025);
    bool _1664 = !_1658;
    int _1666 = _1664 ? 0 : (-1);
    bool _1668 = !_1662;
    int _1670 = _1668 ? 0 : (-1);
    bool _1672 = _1636 != 3;
    bool _1674 = uint(_1636) > 1u;
    int _1676 = ~_1630;
    int _1678 = _1676 + _1670;
    int _1680 = _1678 + 1;
    float _1682 = -_209;
    int _1684 = _1510 ? as_type<int>(_1682) : as_type<int>(_209);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1688 = _1686 != 0;
    int _1690 = _1025 * _1680;
    int _1692 = _1690 + _1506;
    int _1694 = ~_1660;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    int _1700 = ~_1610;
    int _1702 = _1700 + _1666;
    int _1704 = _1702 + 1;
    int _1706 = _1698;
    int _1708 = _1660;
    int _1710 = _1424;
    float _1712 = _1380;
    float _1714 = as_type<float>(_1368);
    float _1716 = as_type<float>(_1358);
    if (_1672)
    {
        int _1718 = ~_1660;
        int _1720 = _1718 + 1;
        _1706 = _1720;
    }
    int _1722 = _1706;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1726 = _1724 != 0;
    int _1728 = _999 * _1704;
    int _1730 = _1728 + _1424;
    int _1732 = int(_1558) + int(_1644);
    bool _1734 = !_1420;
    int _1736 = _1734 ? _1692 : (-1);
    float _1738 = in.m_44.x;
    float _1740 = in.m_44.y;
    float _1742 = in.m_44.z;
    int _1744 = ~_1656;
    int _1746 = _1744 + 1;
    int _1748 = _1746 + 1;
    int _1750 = _1748;
    if (!_1674)
    {
        int _1752 = ~_1656;
        int _1754 = _1752 + 1;
        _1750 = _1754;
    }
    int _1756 = _1750;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1760 = _1758 != 0;
    bool _1762 = !_1726;
    int _1764 = _1762 ? 0 : 1;
    int _1766 = _1736 & 3;
    bool _1768 = _1766 != 0;
    if (_1688)
    {
        _1708 = 0;
    }
    int _1770 = _1708;
    int _1772 = _1770;
    if (_1688)
    {
        _1710 = 0;
    }
    int _1774 = _1710;
    bool _1776 = !_1760;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = _1774;
    if (!_1688)
    {
        _1772 = 1;
    }
    int _1782 = _1772;
    if (!_1688)
    {
        _1780 = 2;
    }
    int _1784 = _1780;
    int _1786 = _1736 & 3;
    bool _1788 = _1786 != 0;
    bool _1790 = !_1332;
    int _1792 = _1790 ? _1730 : (-1);
    float _1794 = _181 * _1740;
    bool _1796 = uint(_1766) > 1u;
    float _1798 = _187 * _1740;
    bool _1800 = _1766 != 3;
    float _1802 = _193 * _1740;
    int _1804 = ~_1025;
    int _1806 = _1804 + 1;
    float _1808 = fma(_179, _1738, _1794);
    int _1810 = _1788 ? 0 : 1;
    float _1812 = fma(_185, _1738, _1798);
    bool _1814 = uint(_1766) >= 2u;
    int _1816 = _1806 * _1732;
    int _1818 = _1816 + _1402;
    int _1820 = ~_1810;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    float _1826 = fma(_191, _1738, _1802);
    int _1828 = _1814 ? 0 : 1;
    float _1830 = _1041 * 2.0;
    bool _1832 = _1782 != 1;
    float _1834 = fma(_189, _1742, _1812);
    int _1836 = ~_1828;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    float _1842 = fma(_183, _1742, _1808);
    int _1844 = _1824;
    int _1846 = _1840;
    float _1848 = as_type<float>(_1784);
    if (!_1796)
    {
        int _1850 = ~_1810;
        int _1852 = _1850 + 1;
        _1844 = _1852;
    }
    int _1854 = _1844;
    float _1856 = floor(_1830);
    bool _1858 = uint(_1818) >= uint(_1025);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1860;
    if (_1800)
    {
        int _1864 = ~_1828;
        int _1866 = _1864 + 1;
        _1846 = _1866;
    }
    int _1868 = _1846;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1874 = _1834 + _971;
    bool _1876 = _1039 > 0.5;
    bool _1878 = !_1858;
    int _1880 = _1878 ? 0 : (-1);
    int _1882 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1884 = _1882 != 0;
    float _1886 = -_209;
    float _1888 = _1876 ? _1886 : _209;
    bool _1890 = !_1884;
    float _1892 = _1890 ? _209 : _1888;
    bool _1894 = _1784 != 2;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1900 = 1.0 / _1898;
    float _1902 = 2.8025969286496341418474591665798e-45;
    float _1904 = _1888;
    if (!_1832)
    {
        _1848 = _1043;
    }
    float _1906 = _1848;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1912 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1914 = _1912 != 0;
    float _1916 = _1906;
    if (!_1832)
    {
        _1902 = _1041;
    }
    float _1918 = _1902;
    float _1920 = _1918;
    if (_1894)
    {
        _1712 = _1039;
    }
    float _1922 = _1712;
    float _1924 = _1922;
    if (_1894)
    {
        _1714 = _1041;
    }
    float _1926 = _1714;
    float _1928 = _1926;
    if (!_1894)
    {
        _1924 = _1043;
    }
    float _1930 = _1924;
    if (!_1894)
    {
        _1928 = _1039;
    }
    float _1932 = _1928;
    bool _1934 = _1440 >= 0.0;
    bool _1936 = isnan(_1440);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan(0.0);
    bool _1942 = _1938 || _1940;
    float _1944 = _1862 * _1900;
    if (!_1832)
    {
        _1904 = _1918;
    }
    float _1946 = _1904;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1950 = _1942 ? 0 : 1;
    bool _1952 = _1440 > 0.0;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1956 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1958 = ~_1950;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    float _1964 = _1946;
    int _1966 = _1962;
    if (!_1832)
    {
        _1716 = _1043;
    }
    float _1968 = _1716;
    float _1970 = -_1954;
    float _1972 = fma(_1956, 2.0, _1970);
    float _1974 = _1968;
    if (_1832)
    {
        _1964 = _1039;
    }
    float _1976 = _1964;
    float _1978 = 1.0 / _1910;
    if (_1832)
    {
        _1920 = _1039;
    }
    float _1980 = _1920;
    float _1982 = -_137;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1972);
    if (_1832)
    {
        _1916 = _1041;
    }
    float _1986 = _1916;
    if (!_1952)
    {
        int _1988 = ~_1950;
        int _1990 = _1988 + 1;
        _1966 = _1990;
    }
    int _1992 = _1966;
    float _1994 = fma(_195, _1742, _1826);
    bool _1996 = _1856 >= 0.0;
    bool _1998 = isnan(_1856);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan(0.0);
    bool _2004 = _2000 || _2002;
    if (_1832)
    {
        _1974 = _1041;
    }
    float _2006 = _1974;
    float _2008 = _1994 + _993;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2012 = _2010 != 0;
    int _2014 = _2004 ? 0 : 1;
    float _2016 = _1872 * _1978;
    bool _2018 = _1856 > 0.0;
    float _2020 = _1039 + _1041;
    bool _2022 = !_1638;
    int _2024 = _2022 ? 0 : 1;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2028 = _1636 != 3;
    float _2030 = _2020 + (-1.0);
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2034 = _963 + _2032;
    float _2036 = fma(_1081, -2.0, _2026);
    bool _2038 = !_1768;
    int _2040 = _2038 ? 0 : 1;
    float _2042 = fma(_1944, _2034, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2044 = _1628 >> 31;
    float _2046 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2036);
    bool _2048 = _1766 != 3;
    int _2050 = ~_2014;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = _2054;
    if (!_2018)
    {
        int _2058 = ~_2014;
        int _2060 = _2058 + 1;
        _2056 = _2060;
    }
    int _2062 = _2056;
    bool _2064 = !_2028;
    int _2066 = _2064 ? 0 : (-1);
    int _2068 = _2044 & 3;
    int _2070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2072 = _2070 != 0;
    int _2074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2076 = _2074 != 0;
    int _2078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2080 = _2078 != 0;
    float _2082 = _1043 * 2.0;
    int _2084 = _1736 >> 31;
    int _2086 = _1628 + _2068;
    int _2088 = _2084 & 3;
    float _2090 = floor(_2082);
    bool _2092 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2094 = isnan(_963);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2100 = _2096 || _2098;
    float _2102 = float(_2100);
    int _2104 = _1736 + _2088;
    int _2106 = _2086 >> 2;
    float _2108 = -_2102;
    float _2110 = _2108 + 1.0;
    bool _2112 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2114 = isnan(_963);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2120 = _2116 || _2118;
    float _2122 = float(_2120);
    float _2124 = in.m_58.w;
    int _2126 = _2104 >> 2;
    float _2128 = _2122 * _2110;
    int _2130 = _2106 << 4;
    int _2132 = _2130 + 368;
    float _2134 = -_2122;
    float _2136 = _2134 + 1.0;
    int _2138 = _2126 << 4;
    int _2140 = _2138 + 512;
    float _2142 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _2144 = uint(int(uint(_2132) >> uint(2)));
    uint _2146 = uint(int(uint(int(_2144)) >> uint(2)));
    int _2148 = int(_2144) & 3;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[int(_2146)][_2148];
    int _2152 = int(_2144) + 1;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    int _2156 = _2152 & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2162 = _963 + _2160;
    bool _2164 = !_2048;
    int _2166 = _2164 ? 0 : (-1);
    float _2168 = _987 * _2136;
    bool _2170 = _2090 >= 0.0;
    bool _2172 = isnan(_2090);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = fma(_2016, _2162, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2182 = -_987;
    float _2184 = _2182 + 1.0;
    float _2186 = _2042 * _2168;
    uint _2188 = uint(int(uint(_2140) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2178 ? 0 : 1;
    bool _2206 = _2090 > 0.0;
    float _2208 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2186);
    float _2210 = _1842 + _2124;
    int _2212 = _2132 + 8;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    uint _2216 = uint(int(uint(int(_2214)) >> uint(2)));
    int _2218 = int(_2214) & 3;
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[int(_2216)][_2218];
    int _2222 = int(_2214) + 1;
    uint _2224 = uint(int(uint(_2222) >> uint(2)));
    int _2226 = _2222 & 3;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[int(_2224)][_2226];
    int _2230 = ~_2204;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    float _2236 = fma(_2180, _2128, _2208);
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2240 = abs(_1756);
    float _2242 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2244 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2236);
    int _2246 = _2140 + 8;
    uint _2248 = uint(int(uint(_2246) >> uint(2)));
    uint _2250 = uint(int(uint(int(_2248)) >> uint(2)));
    int _2252 = int(_2248) & 3;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[int(_2250)][_2252];
    int _2256 = int(_2248) + 1;
    uint _2258 = uint(int(uint(_2256) >> uint(2)));
    int _2260 = _2256 & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = _2234;
    if (!_2206)
    {
        int _2266 = ~_2204;
        int _2268 = _2266 + 1;
        _2264 = _2268;
    }
    int _2270 = _2264;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2274 = -_2238;
    float _2276 = fma(_2242, 2.0, _2274);
    int _2278 = abs(_1854);
    float _2280 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2272);
    int _2282 = ~_2240;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2290 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2292 = int(_2290);
    int _2294 = abs(_2024);
    float _2296 = -_137;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2276);
    float _2300 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2288);
    int _2302 = abs(_2040);
    float _2304 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2280);
    int _2306 = abs(_1722);
    float _2308 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2300);
    int _2310 = abs(_1868);
    float _2312 = -_2304;
    float _2314 = _2312 + 1.0;
    int _2316 = ~_2278;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    float _2322 = -_2308;
    float _2324 = _2322 + 1.0;
    int _2326 = ~_2294;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = ~_2302;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    int _2338 = _2286 * as_type<int>(_2158);
    int _2340 = _2330 * as_type<int>(_2150);
    int _2342 = _2340 + _2338;
    int _2344 = ~_2306;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = ~_1732;
    int _2352 = _2350 + _1880;
    int _2354 = _2352 + 1;
    int _2356 = _2320 * as_type<int>(_2202);
    int _2358 = ~_2310;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2366 = int(_2364);
    int _2368 = abs(_2292);
    int _2370 = _2336 * as_type<int>(_2194);
    int _2372 = _2370 + _2356;
    int _2374 = abs(_1764);
    int _2376 = _1025 * _2354;
    int _2378 = _2376 + _1402;
    float _2380 = float(uint(_2368));
    int _2382 = _2348 * as_type<int>(_2220);
    int _2384 = _2382 + _2342;
    float _2386 = float(uint(_2292));
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2390 = abs(_1778);
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2394 = _2008 + _2392;
    bool _2396 = !_2076;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = float(_2270);
    int _2402 = _2362 * as_type<int>(_2254);
    int _2404 = _2402 + _2372;
    int _2406 = abs(_2066);
    float _2408 = 1.0 / _2386;
    int _2410 = ~_2390;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    int _2416 = ~_2406;
    int _2418 = _2416 + 1;
    int _2420 = _2418 + 1;
    int _2422 = abs(_2166);
    float _2424 = float(uint(_2366));
    int _2426 = _2420 * as_type<int>(_2228);
    int _2428 = _2426 + _2384;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2438 = _1874 + _2436;
    int _2440 = ~_2366;
    int _2442 = _2440 + 1;
    int _2444 = _2428 * _2414;
    float _2446 = 1.0 / _2424;
    int _2448 = _2434 * as_type<int>(_2262);
    int _2450 = _2448 + _2404;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2210 + _2452;
    int _2456 = _1792 * _2390;
    int _2458 = _2456 + _2444;
    bool _2460 = !_1420;
    int _2462 = _2460 ? _2378 : (-1);
    float _2464 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2466 = as_type<int>(_2408) + (-2);
    float _2468 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2470 = float(uint(_2458));
    float _2472 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2464);
    int _2474 = abs(_2366);
    float _2476 = _2438 * _2438;
    float _2478 = 1.0 / _2380;
    float _2480 = as_type<float>(_2466) * _2470;
    float _2482 = float(uint(_2474));
    float _2484 = fma(_2394, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2472);
    int _2486 = ~_2374;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = fma(_2454, _2454, _2476);
    int _2494 = as_type<int>(_2446) + (-2);
    float _2496 = _939 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2498 = trunc(_2480);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = fma(_2394, _2394, _2492);
    int _2506 = _2450 * _2490;
    float _2508 = _941 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2510 = ~_2292;
    int _2512 = _2510 + 1;
    float _2514 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2516 = _2484 >= 0.0;
    int _2518 = _2462 * _2374;
    int _2520 = _2518 + _2506;
    float _2522 = 1.0 / _2482;
    int _2524 = abs(_2458);
    float _2526 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2528 = as_type<int>(_2478) + (-2);
    float _2530 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2532 = float(uint(_2520));
    float _2534 = _2526 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2536 = float(uint(_2524));
    float _2538 = sqrt(_2504);
    int _2540 = _2512 * int(_2502);
    int _2542 = _2540 + _2458;
    float _2544 = as_type<float>(_2494) * _2532;
    float _2546 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2548 = as_type<float>(_2528) * _2536;
    float _2550 = _2508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2552 = float(uint(_2542));
    if (_2516)
    {
        out.m_47.x = 0.0;
    }
    float _2554 = rsqrt(_2504);
    int _2556 = as_type<int>(_2522) + (-2);
    float _2558 = as_type<float>(_2466) * _2552;
    out.m_70.x = _2514;
    out.m_70.y = _2546;
    out.m_70.z = _2550;
    out.m_70.w = _2530;
    int _2560 = ~_2368;
    int _2562 = _2560 + 1;
    int _2564 = ~_2474;
    int _2566 = _2564 + 1;
    float _2568 = _2538 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2570 = abs(_2520);
    float _2572 = trunc(_2544);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2580 = _1041 > 0.5;
    float _2582 = float(uint(_2570));
    float _2584 = precise::min(_2534, _2568);
    float _2586 = _2438 * _2554;
    float _2588 = trunc(_2548);
    float _2590 = precise::max(_2588, 0.0);
    uint _2592 = uint(_2590);
    float _2594 = as_type<float>(_2556) * _2582;
    float _2596 = _2454 * _2554;
    float _2598 = _2586 * _2584;
    float _2600 = _1208 + 0.5;
    float _2602 = _2596 * _2584;
    float _2604 = -_2598;
    float _2606 = _2438 + _2604;
    float _2608 = trunc(_2594);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    int _2614 = _2442 * int(_2576);
    int _2616 = _2614 + _2520;
    float _2618 = -_2602;
    float _2620 = _2454 + _2618;
    float _2622 = _2606 * _2606;
    float _2624 = fma(_2578, _2600, _2298);
    out.m_72.w = _2584;
    float _2626 = float(uint(_2616));
    float _2628 = trunc(_2558);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    int _2634 = _2562 * int(_2592);
    int _2636 = _2634 + _2524;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2640 = ~_2292;
    int _2642 = _2640 + 1;
    float _2644 = as_type<float>(_2494) * _2626;
    float _2646 = float(uint(_2636));
    int _2648 = _2566 * int(_2612);
    int _2650 = _2648 + _2570;
    float _2652 = fma(_2620, _2620, _2622);
    float _2654 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2656 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2658 = as_type<float>(_2528) * _2646;
    float _2660 = float(uint(_2650));
    float _2662 = -_2638;
    float _2664 = fma(_2654, 2.0, _2662);
    float _2666 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2668 = int(_2502) + int(_2632);
    float _2670 = _2394 * _2554;
    float _2672 = trunc(_2644);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    float _2678 = as_type<float>(_2556) * _2660;
    float _2680 = _2670 * _2584;
    int _2682 = _2642 * _2668;
    int _2684 = _2682 + _2458;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2688 = -_2680;
    float _2690 = _2394 + _2688;
    float _2692 = trunc(_2678);
    float _2694 = precise::max(_2692, 0.0);
    uint _2696 = uint(_2694);
    float _2698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2700 = uint(_2684) >= uint(_2292);
    float _2702 = fma(_2690, _2690, _2652);
    float _2704 = fma(_1948, -2.0, _2686);
    float _2706 = fma(_2656, -2.0, _2698);
    int _2708 = abs(_2398);
    float _2710 = trunc(_2658);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    int _2716 = int(_2576) + int(_2676);
    int _2718 = ~_2366;
    int _2720 = _2718 + 1;
    int _2722 = ~_2474;
    int _2724 = _2722 + 1;
    float _2726 = sqrt(_2702);
    int _2728 = ~_2368;
    int _2730 = _2728 + 1;
    int _2732 = int(_2612) + int(_2696);
    int _2734 = _2720 * _2716;
    int _2736 = _2734 + _2520;
    int _2738 = int(_2592) + int(_2714);
    float _2740 = float(_1992);
    float _2742 = float(_2708);
    bool _2744 = !_2700;
    int _2746 = _2744 ? 0 : (-1);
    float _2748 = _2554 * _2726;
    bool _2750 = uint(_2736) >= uint(_2366);
    int _2752 = _2724 * _2732;
    int _2754 = _2752 + _2570;
    int _2756 = ~_2668;
    int _2758 = _2756 + _2746;
    int _2760 = _2758 + 1;
    float _2762 = _2526 * _2748;
    int _2764 = _2730 * _2738;
    int _2766 = _2764 + _2524;
    float _2768 = _2742 * _2740;
    bool _2770 = !_2750;
    int _2772 = _2770 ? 0 : (-1);
    float _2774 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2776 = !_2072;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2782 = uint(_2766) >= uint(_2368);
    float _2784 = _2586 * _2774;
    int _2786 = ~_2716;
    int _2788 = _2786 + _2772;
    int _2790 = _2788 + 1;
    int _2792 = _2292 * _2760;
    int _2794 = _2792 + _2458;
    float _2796 = _2596 * _2774;
    float _2798 = _2670 * _2774;
    int _2800 = _2458 ^ _2292;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2804 = !_2782;
    float _2806 = _2804 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2808 = -_2784;
    float _2810 = _2438 + _2808;
    bool _2812 = uint(_2754) >= uint(_2474);
    float _2814 = -_2796;
    float _2816 = _2454 + _2814;
    uint _2818 = uint(int(uint(_2800) >> uint(31)));
    float _2820 = _2810 * _2810;
    bool _2822 = !_2812;
    int _2824 = _2822 ? 0 : (-1);
    float _2826 = -_2798;
    float _2828 = _2394 + _2826;
    bool _2830 = _2292 == 0;
    float _2832 = fma(_2816, _2816, _2820);
    int _2834 = ~as_type<int>(_2806);
    int _2836 = _2738 + _2834;
    int _2838 = _2836 + 1;
    int _2840 = _2366 * _2790;
    int _2842 = _2840 + _2520;
    int _2844 = ~int(_2818);
    int _2846 = _2844 + 1;
    float _2848 = fma(_2828, _2828, _2832);
    bool _2850 = !_2830;
    int _2852 = _2850 ? _2794 : (-1);
    float _2854 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2856 = _2366 == 0;
    float _2858 = _1212 + (-0.5);
    int _2860 = _2838 ^ _2846;
    float _2862 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2704);
    int _2864 = abs(_2778);
    float _2866 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2868 = !_2856;
    int _2870 = _2868 ? _2842 : (-1);
    float _2872 = -_2854;
    float _2874 = -_2862;
    float _2876 = fma(_2872, _2858, _2874);
    int _2878 = ~_2846;
    int _2880 = _2878 + _2860;
    int _2882 = _2880 + 1;
    float _2884 = sqrt(_2848);
    bool _2886 = _2292 == 0;
    int _2888 = _2520 ^ _2366;
    float _2890 = float(_2864);
    float _2892 = _2806;
    float _2894 = _2602;
    if (_2516)
    {
        _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2896 = _2892;
    float _2898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2900 = !_2886;
    int _2902 = _2900 ? _2882 : (-1);
    float _2904 = _2890 * _2400;
    bool _2906 = _2366 == 0;
    uint _2908 = uint(int(uint(_2888) >> uint(31)));
    int _2910 = as_type<int>(_2896);
    if (_2516)
    {
        float _2912 = _2896 * 5.0;
        _2910 = as_type<int>(_2912);
    }
    int _2914 = _2910;
    int _2916 = ~_2824;
    int _2918 = _2732 + _2916;
    int _2920 = _2918 + 1;
    float _2922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2924 = ~int(_2908);
    int _2926 = _2924 + 1;
    float _2928 = _2554 * _2884;
    if (_2516)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8431 = as_type<float>(_2914);
        out.gl_Position.z = _8431;
    }
    float _2930 = float(_2852);
    int _2932 = _2920 ^ _2926;
    float _2934 = _2762 * _2928;
    float _2936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2938 = _2898 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2940 = fma(_2866, _2930, _1984);
    float _2942 = -_213;
    int _2944 = _2580 ? as_type<int>(_2942) : as_type<int>(_213);
    out.m_74.x = _2934;
    float _2946 = float(_2902);
    float _2948 = float(_2870);
    float _2950 = -_137;
    float _2952 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2664);
    int _2954 = ~_2926;
    int _2956 = _2954 + _2932;
    int _2958 = _2956 + 1;
    float _2960 = _1892 + 0.5;
    bool _2962 = !_1914;
    float _2964 = _2962 ? _213 : as_type<float>(_2944);
    float _2966 = fma(_2938, _2948, _2952);
    bool _2968 = !_2012;
    float _2970 = _2968 ? _209 : as_type<float>(_1684);
    float _2972 = fma(_2866, _2960, _2940);
    bool _2974 = !_2906;
    int _2976 = _2974 ? _2958 : (-1);
    float _2978 = _2922 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2980 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2982 = _2970 + 0.5;
    float _2984 = float(_2976);
    float _2986 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2706);
    float _2988 = -_2046;
    float _2990 = fma(_2980, _2946, _2988);
    float _2992 = fma(_2938, _2982, _2966);
    float _2994 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2996 = log2(_2994);
    float _2998 = _2964 + (-0.5);
    float _3000 = -_2986;
    float _3002 = fma(_2978, _2984, _3000);
    float _3004 = _1278 + (-0.5);
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3008 = -_2980;
    float _3010 = fma(_3008, _2998, _2990);
    float _3012 = -_2978;
    float _3014 = fma(_3012, _3004, _3002);
    float _3016 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3006);
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3020 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3016);
    bool _3022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3024 = isnan(0.0);
    bool _3026 = _3022 || _3024;
    bool _3028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3030 = _3026 || _3028;
    float _3032 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3018);
    float _3034 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3036 = -_3020;
    float _3038 = _3036 + 1.0;
    float _3040 = _2996 * _137;
    float _3042 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3032);
    float _3044 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3034);
    float _3046 = -_3038;
    float _3048 = fma(_1208, _3046, _2624);
    float _3050 = -_3042;
    float _3052 = _3050 + 1.0;
    float _3054 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3044);
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3058 = exp2(_3040);
    float _3060 = -_3052;
    float _3062 = fma(_1892, _3060, _2972);
    float _3064 = -_3054;
    float _3066 = _3064 + 1.0;
    float _3068 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3056);
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3072 = 1.0 + _3070;
    bool _3074 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3076 = isnan(1.0);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3082 = _3078 || _3080;
    float _3084 = fma(_1212, _3066, _2876);
    float _3086 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3068);
    float _3088 = 1.0 / _3072;
    float _3090 = in.m_76.x;
    float _3092 = in.m_76.y;
    float _3094 = in.m_76.z;
    float _3096 = -_3086;
    float _3098 = _3096 + 1.0;
    float _3100 = -_2314;
    float _3102 = fma(_2970, _3100, _2992);
    out.m_78.x = _3048;
    out.m_78.y = _3084;
    float _3104 = fma(_2964, _3098, _3010);
    float _3106 = -_3058;
    float _3108 = _3106 + 1.0;
    float _3110 = fma(_1278, _2324, _3014);
    bool _3112 = !_2080;
    int _3114 = _3112 ? 0 : 1;
    float _3116 = _3030 ? _3108 : 0.0;
    out.m_80.x = _3062;
    out.m_80.y = _3104;
    out.m_80.z = _3102;
    out.m_80.w = _3110;
    if (_3082)
    {
        float _3118 = _3116 * _3088;
        _161 = _3118;
    }
    float _3120 = _161;
    float _3122 = _3094;
    if (_2516)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3124 = _2904 * (-2.0);
    float _3126 = -_2784;
    float _3128 = _1874 + _3126;
    float _3130 = _1039 + (-0.5);
    float _3132 = -_2796;
    float _3134 = _2210 + _3132;
    float _3136 = fma(_3124, _3090, _3090);
    float _3138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3140 = _3128 + _3138;
    float _3142 = fma(_2142, _3124, _2142);
    float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3146 = _3134 + _3144;
    float _3148 = fma(_3130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3136);
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3152 = -_2798;
    float _3154 = _2008 + _3152;
    float _3156 = _2768 * (-2.0);
    float _3158 = fma(_3142, _3120, _3148);
    float _3160 = fma(_3146, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3150);
    float _3162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3164 = _3154 + _3162;
    int _3166 = abs(_3114);
    float _3168 = fma(_2666, _3156, _2666);
    float _3170 = fma(_3156, _3092, _3092);
    float _3172 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3160);
    float _3174 = _3158 * 0.15915493667125701904296875;
    float _3176 = float(_2062);
    float _3178 = _1041 + (-0.5);
    float _3180 = float(_3166);
    float _3182 = _1043 + _1039;
    bool _3184 = _3172 >= 0.0;
    float _3186 = fma(_3178, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3170);
    float _3188 = _3180 * _3176;
    float _3190 = _3182 + (-1.0);
    float _3192 = fma(_3168, _3120, _3186);
    float _3194 = _1043 + (-0.5);
    float _3196 = _3188 * (-2.0);
    float _3198 = fma(_3190, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3200 = _3192 * 0.15915493667125701904296875;
    float _3202 = _3174 * 6.283185482025146484375;
    float _3204 = sin(_3202);
    float _3206 = fma(_3196, _3094, _3094);
    float _3208 = fma(_3198, _3196, _3198);
    int _3210 = as_type<int>(_3194);
    if (_3184)
    {
        _3122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3212 = _3122;
    if (_3184)
    {
        out.m_47.x = 0.0;
    }
    float _3214 = fma(_3194, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3206);
    float _3216 = _3200 * 6.283185482025146484375;
    float _3218 = sin(_3216);
    float _3220 = fma(_3208, _3120, _3214);
    if (_3184)
    {
        float _3222 = _3212 * 5.0;
        _3210 = as_type<int>(_3222);
    }
    int _3224 = _3210;
    if (_3184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8923 = as_type<float>(_3224);
        out.gl_Position.z = _8923;
    }
    float _3226 = _3200 * 6.283185482025146484375;
    float _3228 = cos(_3226);
    float _3230 = _3174 * 6.283185482025146484375;
    float _3232 = cos(_3230);
    float _3234 = _3220 * 0.15915493667125701904296875;
    if (_3184)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3236 = _3234 * 6.283185482025146484375;
    float _3238 = cos(_3236);
    float _3240 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3242 = _2748 * _2928;
    float _3244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _3246 = _3232 * _3218;
    float _3248 = _3204 * _3218;
    float _3250 = _3240 * _3242;
    float _3252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _3254 = _3234 * 6.283185482025146484375;
    float _3256 = sin(_3254);
    float _3258 = _3204 * _3228;
    float _3260 = _3250 * _3244;
    float _3262 = _3232 * _3228;
    float _3264 = _2934 * _3252;
    float _3266 = _3242 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3268 = _3266 * 0.5;
    float _3270 = _3232 * _3238;
    float _3272 = _3204 * _3238;
    float _3274 = _3228 * _3238;
    float _3276 = _3218 * _3238;
    float _3278 = _3270 * _3260;
    float _3280 = fma(_3256, _3262, _3248);
    float _3282 = -_3258;
    float _3284 = fma(_3256, _3246, _3282);
    float _3286 = -_3260;
    float _3288 = _3256 * _3286;
    float _3290 = -_3246;
    float _3292 = fma(_3256, _3258, _3290);
    float _3294 = fma(_3280, _3264, _3278);
    float _3296 = _3272 * _3260;
    float _3298 = fma(_3274, _3264, _3288);
    float _3300 = fma(_3256, _3248, _3262);
    float _3302 = fma(_3284, _3268, _3294);
    float _3304 = fma(_3292, _3264, _3296);
    float _3306 = fma(_3276, _3268, _3298);
    float _3308 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3310 = fma(_3300, _3268, _3304);
    float _3312 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3314 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3308);
    float _3316 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3312);
    float _3318 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3314);
    float _3320 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3316);
    float _3322 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3324 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3326 = _2008 + _3322;
    float _3328 = _2210 + _3324;
    float _3330 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3334 = _3326 + _3332;
    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3338 = _3328 + _3336;
    float _3340 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3330);
    float _3342 = _3334 * _3334;
    float _3344 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3340);
    float _3346 = fma(_3338, _3338, _3342);
    float _3348 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3350 = sqrt(_3346);
    float _3352 = _1874 + _3348;
    bool _3354 = _3350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3356 = _3330;
    float _3358 = _3328;
    float _3360 = _3326;
    if (!_3354)
    {
        _3356 = _3352;
    }
    float _3362 = _3356;
    bool _3364 = !_3354;
    float _3366 = _3362;
    if (!_3364)
    {
        float _3368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3372 = _3350 + _3370;
        float _3374 = rsqrt(_3346);
        float _3376 = _3372 * _3368;
        float _3378 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3380 = _3376 * 0.15915493667125701904296875;
        float _3382 = _3380 * 6.283185482025146484375;
        float _3384 = sin(_3382);
        float _3386 = _3380 * 6.283185482025146484375;
        float _3388 = cos(_3386);
        float _3390 = fma(_3384, _3378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3392 = _3374 * _3390;
        float _3394 = _3388 + (-1.0);
        float _3396 = fma(_3338, _3392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3398 = fma(_3334, _3392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3400 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3402 = fma(_3352, _3388, _3400);
        _3366 = _3402;
        _3358 = _3396;
        _3360 = _3398;
    }
    float _3404 = _3366;
    float _3406 = _3358;
    float _3408 = _3360;
    float _3410 = -_1874;
    float _3412 = _3410 + _3404;
    float _3414 = -_2210;
    float _3416 = _3414 + _3406;
    float _3418 = -_2008;
    float _3420 = _3418 + _3408;
    float _3422 = -_2598;
    float _3424 = _1874 + _3422;
    float _3426 = _3412 * _3412;
    float _3428 = -_2602;
    float _3430 = _2210 + _3428;
    float _3432 = -_2680;
    float _3434 = _2008 + _3432;
    float _3436 = -_2784;
    float _3438 = _3436 + _3424;
    float _3440 = fma(_3416, _3416, _3426);
    float _3442 = -_2598;
    float _3444 = _3442 + _3404;
    float _3446 = -_2798;
    float _3448 = _3446 + _3434;
    float _3450 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3452 = fma(_3420, _3420, _3440);
    float _3454 = -_2796;
    float _3456 = _3454 + _3430;
    float _3458 = -_2680;
    float _3460 = _3458 + _3408;
    float _3462 = sqrt(_3452);
    float _3464 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3450);
    float _3466 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3468 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3470 = isnan(0.5);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3476 = _3472 || _3474;
    float _3478 = fma(_3448, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3464);
    float _3480 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3466);
    bool _3482 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3484 = isnan(0.5);
    bool _3486 = _3482 || _3484;
    bool _3488 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3490 = _3486 || _3488;
    float _3492 = _3478 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3494 = fma(_3448, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3480);
    float _3496 = -_2602;
    float _3498 = _3496 + _3406;
    float _3500 = 1.0 / _3492;
    float _3502 = _3494 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3504 = _3462 > 0.0;
    float _3506 = _3502 + _3492;
    float _3508 = _3502;
    float _3510 = _3462;
    float _3512 = _3498;
    float _3514 = _3430;
    if (!_3504)
    {
        _3508 = _3444;
    }
    float _3516 = _3508;
    float _3518 = _3516;
    float _3520 = _3516;
    if (!_3504)
    {
        _3510 = _3460;
    }
    float _3522 = _3510;
    bool _3524 = !_3504;
    float _3526 = _3522;
    float _3528 = _3522;
    if (!_3524)
    {
        float _3530 = _229 * _229;
        float _3532 = rsqrt(_3452);
        float _3534 = fma(_227, _227, _3530);
        float _3536 = fma(_231, _231, _3534);
        float _3538 = sqrt(_3536);
        float _3540 = _3416 * _3532;
        float _3542 = _3412 * _3532;
        float _3544 = _3420 * _3532;
        bool _3546 = _3538 > 0.0;
        _2894 = _3542;
        if (!_3546)
        {
            _3518 = _3444;
        }
        float _3548 = _3518;
        _3520 = _3548;
        if (!_3546)
        {
            _3526 = _3460;
        }
        float _3550 = _3526;
        bool _3552 = !_3546;
        _3528 = _3550;
        if (!_3552)
        {
            float _3554 = rsqrt(_3536);
            float _3556 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3558 = _229 * _3554;
            float _3560 = _227 * _3554;
            float _3562 = _3542 * _3558;
            float _3564 = _231 * _3554;
            float _3566 = fma(_3540, _3560, _3562);
            float _3568 = _3556 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3570 = fma(_3544, _3564, _3566);
            float _3572 = _3570 * _3568;
            float _3574 = fma(_227, _3572, _3498);
            float _3576 = fma(_229, _3572, _3444);
            float _3578 = fma(_231, _3572, _3460);
            _3512 = _3574;
            _3520 = _3576;
            _3528 = _3578;
            _2894 = _3566;
        }
    }
    float _3580 = _3512;
    float _3582 = _3520;
    float _3584 = _3528;
    float _3586 = _2894;
    float _3588 = -_2796;
    float _3590 = _3588 + _3580;
    float _3592 = -_2784;
    float _3594 = _3592 + _3582;
    float _3596 = -_2798;
    float _3598 = _3596 + _3584;
    float _3600 = _3506 * _3500;
    float _3602 = _3600 * 0.5;
    float _3604 = _3586;
    float _3606 = _3594;
    float _3608 = _3590;
    float _3610 = _3598;
    if (_3490)
    {
        _3604 = 1.0;
    }
    float _3612 = _3604;
    float _3614 = _3612;
    if (!_3476)
    {
        float _3616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3618 = _3438 + _3616;
        float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3622 = _3456 + _3620;
        float _3624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3626 = -_3434;
        float _3628 = _3626 + _3584;
        float _3630 = _3618 * _3618;
        float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3634 = _3448 + _3632;
        float _3636 = -_3430;
        float _3638 = _3636 + _3580;
        float _3640 = fma(_3622, _3622, _3630);
        float _3642 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3644 = fma(_3634, _3634, _3640);
        float _3646 = sqrt(_3644);
        float _3648 = 1.0 / _2928;
        float _3650 = _3642 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3652 = precise::min(_3646, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3654 = _3652 * _3624;
        float _3656 = _3654 * _3648;
        float _3658 = -_3424;
        float _3660 = _3658 + _3582;
        float _3662 = _3650 * _3656;
        float _3664 = _3628 * _3656;
        float _3666 = fma(_3660, _3662, _3438);
        float _3668 = fma(_3638, _3662, _3456);
        float _3670 = fma(_3650, _3664, _3448);
        _3606 = _3666;
        _3608 = _3668;
        _3610 = _3670;
    }
    float _3672 = _3606;
    float _3674 = _3608;
    float _3676 = _3610;
    if (!_3490)
    {
        float _3678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3680 = _3678 * 0.15915493667125701904296875;
        float _3682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3684 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3686 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3684);
        float _3688 = _3680 * 6.283185482025146484375;
        float _3690 = cos(_3688);
        float _3692 = _3682 * 0.15915493667125701904296875;
        float _3694 = _3680 * 6.283185482025146484375;
        float _3696 = sin(_3694);
        float _3698 = 1.0 / _3690;
        float _3700 = _3692 * 6.283185482025146484375;
        float _3702 = cos(_3700);
        float _3704 = _3696 * _3698;
        float _3706 = _3692 * 6.283185482025146484375;
        float _3708 = sin(_3706);
        float _3710 = _3702 * _3704;
        float _3712 = 1.0 / _3686;
        float _3714 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3716 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3714;
        float _3718 = 1.0 / _3710;
        float _3720 = 1.0 / _3716;
        float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3724 = _3712 * _3722;
        float _3726 = _3708 * _3718;
        float _3728 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3730 = fma(_3726, _3724, _3728);
        float _3732 = _3730 * _3720;
        float _3734 = precise::clamp(_3732, 0.0, 1.0);
        _3514 = _3724;
        _3614 = _3734;
    }
    float _3736 = _3514;
    float _3738 = _3614;
    float _3740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3742 = _3672 + _3740;
    float _3744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3746 = _3674 + _3744;
    float _3748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3750 = _3676 + _3748;
    float _3752 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3754 = _3742 * _3742;
    float _3756 = fma(_3746, _3746, _3754);
    float _3758 = fma(_3750, _3750, _3756);
    float _3760 = rsqrt(_3758);
    float _3762 = sqrt(_3758);
    float _3764 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3766 = _3746 * _3764;
    float _3768 = _3750 * _3764;
    float _3770 = _3766 * _3766;
    float _3772 = _3768 * _3768;
    float _3774 = _3770 + _3772;
    float _3776 = sqrt(_3774);
    bool _3778 = _3776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3782 = _3776 + _3780;
    float _3784 = _3750;
    float _3786 = _3774;
    float _3788 = _3782;
    float _3790 = _3736;
    float _3792 = _3764;
    if (_3778)
    {
        float _3794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3784 = _3794;
    }
    float _3796 = _3784;
    if (_3778)
    {
        float _3798 = rsqrt(_3774);
        _3786 = _3798;
    }
    float _3800 = _3786;
    float _3802 = _3800;
    if (_3778)
    {
        float _3804 = _3782 * _3796;
        _3788 = _3804;
    }
    float _3806 = _3788;
    if (_3778)
    {
        float _3808 = _3806 * 0.15915493667125701904296875;
        _3790 = _3808;
    }
    float _3810 = _3790;
    float _3812 = _3796;
    float _3814 = _3810;
    if (_3778)
    {
        float _3816 = _3810 * 6.283185482025146484375;
        float _3818 = sin(_3816);
        _3812 = _3818;
    }
    float _3820 = _3812;
    float _3822 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3824 = precise::max(0.0, _3822);
    float _3826 = _3754;
    float _3828 = _3824;
    if (_3778)
    {
        float _3830 = _3810 * 6.283185482025146484375;
        float _3832 = cos(_3830);
        _3826 = _3832;
    }
    float _3834 = _3826;
    float _3836 = -_3764;
    float _3838 = -_3824;
    float _3840 = fma(_3742, _3836, _3838);
    float _3842 = _3840;
    if (_3778)
    {
        float _3844 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3828 = _3844;
    }
    float _3846 = _3828;
    float _3848 = _3820;
    float _3850 = _3846;
    if (_3778)
    {
        float _3852 = fma(_3820, _3846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3848 = _3852;
    }
    float _3854 = _3848;
    float _3856 = _3854;
    float _3858 = _3834;
    if (_3778)
    {
        float _3860 = _3834 + (-1.0);
        _3850 = _3860;
    }
    float _3862 = _3850;
    float _3864 = _3862;
    if (_3778)
    {
        float _3866 = _3800 * _3854;
        _3792 = _3866;
    }
    float _3868 = _3792;
    if (!_3778)
    {
        _3856 = _3766;
    }
    float _3870 = _3856;
    float _3872 = _3870;
    if (_3778)
    {
        float _3874 = _3862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3814 = _3874;
    }
    float _3876 = _3814;
    if (_3778)
    {
        float _3878 = _3766 * _3868;
        _3872 = _3878;
    }
    float _3880 = _3872;
    if (!_3778)
    {
        _3864 = _3768;
    }
    float _3882 = _3864;
    float _3884 = _3882;
    if (_3778)
    {
        float _3886 = _3768 * _3868;
        _3884 = _3886;
    }
    float _3888 = _3884;
    if (!_3778)
    {
        _3802 = _3770;
    }
    float _3890 = _3802;
    float _3892 = _3890;
    if (_3778)
    {
        float _3894 = fma(_3840, _3834, _3876);
        _3842 = _3894;
    }
    float _3896 = _3842;
    if (_3778)
    {
        float _3898 = _3880 * _3880;
        _3892 = _3898;
    }
    float _3900 = _3892;
    if (!_3778)
    {
        _3858 = _3772;
    }
    float _3902 = _3858;
    float _3904 = _3902;
    if (_3778)
    {
        float _3906 = _3888 * _3888;
        _3904 = _3906;
    }
    float _3908 = _3904;
    float _3910 = fma(_3896, _3896, _3900);
    float _3912 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3914 = _3910 + _3908;
    float _3916 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3912);
    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3920 = fma(_3762, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3918);
    float _3922 = precise::clamp(_3920, 0.0, 1.0);
    float _3924 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3926 = rsqrt(_3914);
    float _3928 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3916);
    float _3930 = -_3922;
    float _3932 = _3930 + 1.0;
    float _3934 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3936 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3924);
    float _3938 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3940 = _3928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3942 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3934);
    float _3944 = abs(_3932);
    float _3946 = log2(_3944);
    float _3948 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3936);
    float _3950 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3938);
    float _3952 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3942);
    float _3954 = _3940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3956 = _3948 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3958 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3950);
    float _3960 = _3952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3962 = _3926 * _3880;
    float _3964 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3966 = _3926 * _3896;
    float _3968 = _3926 * _3888;
    float _3970 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3972 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3964);
    float _3974 = -_3954;
    float _3976 = fma(_3974, _3752, 1.0);
    float _3978 = _3958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3980 = -_3970;
    float _3982 = fma(_3966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3980);
    float _3984 = _3946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3986 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3972);
    float _3988 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3990 = -_3968;
    float _3992 = fma(_3990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3982);
    float _3994 = log2(_3976);
    float _3996 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3986);
    float _3998 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4000 = fma(_3992, -0.5, 0.5);
    float _4002 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3988);
    float _4004 = fma(_3992, 0.5, 0.5);
    float _4006 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3998);
    float _4008 = _3966 + 1.0;
    float _4010 = exp2(_3984);
    float _4012 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4002);
    float _4014 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4006);
    float _4016 = fma(_4004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4018 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4012);
    float _4020 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4014);
    float _4022 = fma(_4004, _4016, -0.212114393711090087890625);
    float _4024 = 1.0 / _3996;
    float _4026 = fma(_4004, _4022, 1.570728778839111328125);
    float _4028 = sqrt(_4000);
    float _4030 = -_3966;
    float _4032 = fma(_4010, _4008, _4030);
    float _4034 = _3994 * 0.693147182464599609375;
    float _4036 = fma(_4032, 0.5, 0.5);
    float _4038 = _4020 * _4024;
    float _4040 = _4018 * _4024;
    float _4042 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4044 = fma(_4038, 0.5, 0.5);
    float _4046 = fma(_4040, -0.5, 0.5);
    float _4048 = _4028 * 0.636619746685028076171875;
    float _4050 = -_4026;
    float _4052 = fma(_4048, _4050, 1.0);
    float3 _10227 = float3(_4044, _4046, _4042);
    float _4054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10227, float3(0.0), isnan(_10227)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10227, float3(0.0), isnan(_10227)), level(0.0)).x;
    float3 _10238 = float3(_4044, _4046, _4042);
    float4 _4057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10238, float3(0.0), isnan(_10238)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10238, float3(0.0), isnan(_10238)), level(0.0)).xyzw;
    float _4059 = _4057.x;
    float _4061 = _4057.y;
    float _4063 = _4057.z;
    float _4065 = _4057.w;
    float2 _10255 = float2(_4052, _4036);
    float3 _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10255, float2(0.0), isnan(_10255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10255, float2(0.0), isnan(_10255)), level(0.0)).xyz;
    float _4071 = _4069.x;
    float _4073 = _4069.y;
    float _4075 = _4069.z;
    float _4077 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4079 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4081 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4083 = _3946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4085 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4087 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4089 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4091 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4093 = -_3256;
    float _4095 = fma(_4093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4079);
    float _4097 = -_3256;
    float _4099 = fma(_4097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4077);
    float _4101 = -_3256;
    float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4081);
    float _4105 = fma(_4085, _4085, 1.0);
    float _4107 = exp2(_4083);
    float _4109 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4087);
    float _4111 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4089);
    float _4113 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4091);
    float _4115 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4117 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4119 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4121 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4123 = rsqrt(_4105);
    float _4125 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4099);
    float _4127 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4115);
    float _4129 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4095);
    float _4131 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4103);
    float _4133 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4117);
    float _4135 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4119);
    float _4137 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4121);
    float _4139 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4109);
    float _4141 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4143 = _4085 * _4125;
    float _4145 = -_4107;
    float _4147 = _4145 + 1.0;
    float _4149 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4127);
    float _4151 = _4085 * _4129;
    float _4153 = _4085 * _4131;
    float _4155 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4133);
    float _4157 = _4085 * _4123;
    float _4159 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4137);
    float _4161 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4111);
    float _4163 = fma(_4141, _4139, _4143);
    float _4165 = _4147 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4167 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4135);
    float _4169 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4113);
    float _4171 = -_4149;
    float _4173 = _4157 * _4171;
    float _4175 = -_4155;
    float _4177 = _4157 * _4175;
    float _4179 = fma(_4141, _4161, _4151);
    float _4181 = -_4159;
    float _4183 = _4157 * _4181;
    float _4185 = _4149 + _4163;
    float _4187 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4167);
    float _4189 = fma(_4141, _4169, _4153);
    bool _4191 = _3738 > 0.0;
    bool _4193 = isnan(_3738);
    bool _4195 = _4191 || _4193;
    bool _4197 = isnan(0.0);
    bool _4199 = _4195 || _4197;
    float _4201 = fma(_4123, _4129, _4177);
    out.m_82.x = _3456;
    out.m_82.y = _3438;
    out.m_82.z = _3448;
    float _4203 = fma(_4123, _4125, _4173);
    float _4205 = fma(_4123, _4131, _4183);
    float _4207 = _4155 + _4179;
    float _4209 = _3738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4211 = _4187 + _3996;
    float _4213 = _4020 + _3996;
    float _4215 = _3996 * 0.5;
    out.m_84.x = _3674;
    out.m_84.y = _3672;
    out.m_84.z = _3676;
    float _4217 = _4159 + _4189;
    float _4219 = _4211 * 0.5;
    float _4221 = -_4165;
    float _4223 = _4221 + 1.0;
    float _4225 = _4213 * 0.5;
    float _4227 = fma(_4018, -0.5, _4215);
    float _4229 = _4209 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_86.x = _4139;
    out.m_86.y = _4161;
    out.m_86.z = _4169;
    out.m_88.x = _4203;
    out.m_88.y = _4201;
    out.m_88.z = _4205;
    out.m_90.x = _4185;
    out.m_90.y = _4207;
    out.m_90.z = _4217;
    out.gl_Position.x = _4020;
    out.gl_Position.y = _4018;
    out.gl_Position.z = _4187;
    out.gl_Position.w = _3996;
    out.m_92.x = _4225;
    out.m_92.y = _4227;
    out.m_92.z = _4219;
    out.m_92.w = _3996;
    out.m_47.x = _4229;
    float _4231 = _4165 * _4054;
    float _4233 = _4065 * _4223;
    float _4235 = _4065 * _4231;
    float _4237 = _4075 * _4231;
    float _4239 = fma(_4071, _4235, _4059);
    float _4241 = fma(_4073, _4235, _4061);
    float _4243 = fma(_4065, _4237, _4063);
    out.m_94.x = _4239;
    out.m_94.y = _4241;
    out.m_94.z = _4243;
    out.m_94.w = _4233;
    if (_4199)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4245 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4245;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _801 = false;
    bool _665 = false;
    bool _449 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4300 = as_type<float>(_127);
        out.gl_Position.z = _4300;
    }
    if (!_117)
    {
        return out;
    }
    float _129 = in.m_49.w;
    float _131 = float(_113);
    float _133 = 1.0 / _131;
    float _135 = -_129;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_129);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = _137 * _133;
    bool _151 = _137 >= _131;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    out.m_51.x = _149;
    float _157 = _129;
    float _159 = _149;
    float _161 = _137;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    int _165 = 0;
    if (_155)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4373 = as_type<float>(_169);
        out.gl_Position.z = _4373;
    }
    if (_155)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    float _179 = in.m_58.x;
    float _181 = in.m_58.y;
    float _183 = in.m_58.z;
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_173, _191, _221);
    float _227 = fma(_177, _183, _219);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _225);
    bool _233 = !_205;
    float _251;
    if (!_233)
    {
        float _235 = in.m_64.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _149;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = _255 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    bool _277 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_255);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = -_287;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _271;
    float _299 = 1.0 / _275;
    float _301 = _259 * _289;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _255 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = _305 * _297;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = fma(_309, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = fma(_315, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _325 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_255);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _263 * _299;
    bool _339 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _341 = isnan(_255);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    bool _351 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_255);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _349 * _295;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = -_361;
    float _375 = _373 + 1.0;
    float _377 = _361 * _371;
    float _379 = fma(_365, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = _335 * _375;
    float _385 = in.m_66.x;
    float _387 = in.m_66.y;
    float _389 = -_335;
    float _391 = _389 + 1.0;
    float _393 = _317 * _383;
    float _395 = _323 * _383;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_379, _377, _405);
    float _415 = fma(_381, _377, _407);
    float _417 = fma(_409, _367, _413);
    float _419 = fma(_411, _367, _415);
    float _421 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    float _425 = _421 * _385;
    float _427 = _423 * _387;
    bool _429 = !_291;
    float _447;
    if (!_429)
    {
        float _431 = in.m_64.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _149;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _451 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _451 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _477 = 1.0 / _467;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _481 = 1.0 / _471;
    bool _483 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _485 = isnan(_451);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = 1.0 / _475;
    bool _497 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _499 = isnan(_451);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _455 * _477;
    bool _511 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _513 = isnan(_451);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -_507;
    float _525 = _523 + 1.0;
    float _527 = _459 * _481;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _529;
    float _533 = _521 * _525;
    float _535 = -_521;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _543 = fma(_531, _527, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _545 = _493 * _537;
    float _547 = _463 * _495;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _553;
    float _557 = -_493;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = fma(_555, _527, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _569 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _571 = isnan(_451);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = fma(_563, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _587 = fma(_541, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _589 = _579 * _559;
    float _591 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = -_579;
    float _595 = _593 + 1.0;
    float _597 = _565 * _589;
    float _599 = _543 * _589;
    float _601 = _567 * _589;
    float _603 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].y, _597);
    float _605 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].x, _599);
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].z, _601);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _617;
    float _621 = fma(_591, _545, _605);
    float _623 = fma(_611, _509, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _625 = fma(_615, _509, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _627 = fma(_619, _509, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _629 = fma(_585, _545, _603);
    float _631 = fma(_587, _545, _607);
    float _633 = fma(_623, _533, _621);
    float _635 = fma(_627, _533, _629);
    float _637 = fma(_625, _533, _631);
    float _639 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].x, _633);
    float _641 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].y, _635);
    float _643 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].z, _637);
    bool _645 = !_479;
    float _663;
    if (!_645)
    {
        float _647 = in.m_64.x;
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _651 = _647 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        _663 = _149;
    }
    _665 = false;
    float _667 = _663;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _671 = _667 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _677 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_667);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _693 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _695 = isnan(_667);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    bool _709 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _711 = isnan(_667);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _675;
    float _723 = -_687;
    float _725 = _723 + 1.0;
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _729 = _703 * _725;
    float _731 = -_703;
    float _733 = _731 + 1.0;
    float _735 = 1.0 / _691;
    float _737 = _707 * _721;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _743 = fma(_737, _671, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = -_719;
    float _747 = _745 + 1.0;
    float _749 = _743 * _729;
    float _751 = _741 * _735;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _755 = _667 + _753;
    float _757 = _687 * _747;
    float _759 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _749);
    float _761 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = fma(_751, _755, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = fma(_763, _757, _759);
    float _771 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _773 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[117].x, _769);
    float _777 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _767;
    out.m_68.y = _777;
    out.m_68.z = _773;
    out.m_68.w = _779;
    bool _781 = !_727;
    float _799;
    if (!_781)
    {
        float _783 = in.m_64.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        _799 = _149;
    }
    _801 = false;
    float _803 = _799;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _807 = _803 + _805;
    bool _809 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _811 = isnan(_803);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _823 = _803 + _821;
    bool _825 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _827 = isnan(_803);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _845 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _847 = isnan(_803);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -_819;
    float _859 = _857 + 1.0;
    float _861 = 1.0 / _843;
    float _863 = _855 * _859;
    float _865 = -_855;
    float _867 = _865 + 1.0;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _869;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _875 = 1.0 / _839;
    float _877 = _835 * _867;
    float _879 = -_835;
    float _881 = _879 + 1.0;
    float _883 = _823 * _861;
    float _885 = _807 * _875;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _891;
    float _895 = fma(_871, _885, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = fma(_889, _885, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _899 = fma(_893, _885, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _901 = _895 * _877;
    float _903 = _897 * _877;
    float _905 = _899 * _877;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _919 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].x, _901);
    float _921 = fma(_909, _883, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _923 = fma(_913, _883, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _925 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].y, _903);
    float _927 = fma(_917, _883, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _929 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].z, _905);
    float _931 = fma(_921, _863, _919);
    float _933 = fma(_923, _863, _925);
    float _935 = fma(_927, _863, _929);
    float _937 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].x, _931);
    float _939 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].y, _933);
    float _941 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].z, _935);
    bool _943 = !_873;
    float _945 = _863;
    if (!_943)
    {
        float _947 = in.m_64.x;
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _951 = _947 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _953 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _955 = _953 * _949;
        float _957 = floor(_955);
        float _959 = -_957;
        float _961 = _955 + _959;
        _159 = _961;
    }
    float _963 = _159;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _967 = int(_965);
    float _969 = _133 * _137;
    float _971 = in.m_60.w;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    bool _977 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _979 = isnan(_963);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _991 = int(_989);
    float _993 = in.m_62.w;
    float _995 = float(_967);
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _999 = int(_997);
    if (_975)
    {
        float _1001 = in.m_64.x;
        _945 = _1001;
    }
    float _1003 = _945;
    float _1005 = 0.0;
    if (_975)
    {
        _1005 = 1.0;
    }
    float _1007 = _1005;
    float _1009 = _1007;
    if (!_975)
    {
        _1009 = 1.2345600128173828125;
    }
    float _1011 = _1009;
    float _1013 = _1003;
    if (!_975)
    {
        float _1015 = in.m_64.y;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = float(_991);
    float _1021 = 1.0 / _995;
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1025 = int(_1023);
    float _1027 = float(uint(_999));
    int _1029 = ~_999;
    int _1031 = _1029 + 1;
    float _1033 = float(_999);
    float _1035 = 1.0 / _1019;
    float _1037 = _1021 * _137;
    float _1039 = in.m_64.x;
    float _1041 = in.m_64.y;
    float _1043 = in.m_64.z;
    float _1045 = in.m_64.w;
    float _1047 = _1011 * _1017;
    float _1049 = 1.0 / _1027;
    float _1051 = float(uint(_1025));
    int _1053 = ~_1025;
    int _1055 = _1053 + 1;
    float _1057 = _1019;
    if (_975)
    {
        _1057 = 1.0;
    }
    float _1059 = _1057;
    float _1061 = _1059;
    if (!_975)
    {
        _1061 = 7.345489978790283203125;
    }
    float _1063 = _1061;
    float _1065 = trunc(_1037);
    int _1067 = int(_1065);
    float _1069 = _1035 * _137;
    float _1071 = float(_1025);
    float _1073 = 1.0 / _1051;
    int _1075 = as_type<int>(_1049) + (-2);
    float _1077 = _1063 * _1039;
    bool _1079 = _1045 > 0.5;
    float _1081 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1083 = _1041 > 0.5;
    float _1085 = _1043 + _1041;
    float _1087 = trunc(_1069);
    int _1089 = int(_1087);
    float _1091 = float(uint(_1067));
    float _1093 = -_213;
    int _1095 = _1079 ? as_type<int>(_1093) : as_type<int>(_213);
    float _1097 = _1085 + (-1.0);
    float _1099 = as_type<float>(_1075) * _1091;
    int _1101 = as_type<int>(_1073) + (-2);
    float _1103 = floor(_1077);
    float _1105 = float(uint(_1089));
    float _1107 = trunc(_1099);
    float _1109 = precise::max(_1107, 0.0);
    uint _1112 = uint(_1109);
    float _1114 = as_type<float>(_1101) * _1105;
    float _1116 = trunc(_1114);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    int _1122 = _1031 * int(_1112);
    int _1124 = _1122 + _1067;
    float _1126 = floor(_1047);
    float _1128 = float(uint(_1124));
    int _1130 = _1055 * int(_1120);
    int _1132 = _1130 + _1089;
    float _1134 = as_type<float>(_1075) * _1128;
    float _1136 = float(uint(_1132));
    float _1138 = trunc(_1134);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = -_1103;
    float _1146 = _1077 + _1144;
    int _1148 = ~_999;
    int _1150 = _1148 + 1;
    float _1152 = -_1126;
    float _1154 = _1047 + _1152;
    float _1156 = as_type<float>(_1101) * _1136;
    float _1158 = -_209;
    int _1160 = _1083 ? as_type<int>(_1158) : as_type<int>(_209);
    float _1162 = _1154 * _1071;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1174 = _1172 != 0;
    float _1176 = trunc(_1156);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = _1043 > 0.5;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1186 = _1184 != 0;
    int _1188 = int(_1112) + int(_1142);
    float _1190 = trunc(_1162);
    int _1192 = int(_1190);
    float _1194 = -_213;
    int _1196 = _1182 ? as_type<int>(_1194) : as_type<int>(_213);
    int _1198 = ~_1025;
    int _1200 = _1198 + 1;
    int _1202 = _1150 * _1188;
    int _1204 = _1202 + _1067;
    bool _1206 = !_1170;
    float _1208 = _1206 ? _209 : as_type<float>(_1160);
    bool _1210 = !_1174;
    float _1212 = _1210 ? _213 : as_type<float>(_1196);
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1224 = _1222 != 0;
    int _1226 = int(_1120) + int(_1180);
    bool _1228 = !_1186;
    int _1230 = _1228 ? 0 : 1;
    bool _1232 = uint(_1204) >= uint(_999);
    float _1234 = float(_1067);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1238 = _1236 != 0;
    int _1240 = _1200 * _1226;
    int _1242 = _1240 + _1089;
    bool _1244 = _1234 >= _1033;
    bool _1246 = isnan(_1234);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1033);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    bool _1256 = !_1238;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = trunc(_1254);
    int _1262 = int(_1260);
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1266 = _1264 != 0;
    bool _1268 = uint(_1242) >= uint(_1025);
    float _1270 = _1146 * _1033;
    bool _1272 = !_1232;
    int _1274 = _1272 ? 0 : (-1);
    bool _1276 = !_1166;
    float _1278 = _1276 ? _213 : as_type<float>(_1095);
    bool _1280 = !_1266;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = _1033 * _969;
    bool _1286 = !_1268;
    int _1288 = _1286 ? 0 : (-1);
    float _1290 = trunc(_1270);
    int _1292 = int(_1290);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1308 = _1306 != 0;
    float _1310 = _1071 * _969;
    int _1312 = ~_1188;
    int _1314 = _1312 + _1274;
    int _1316 = _1314 + 1;
    int _1318 = ~_1262;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    bool _1324 = !_1300;
    int _1326 = _1324 ? 0 : 1;
    int _1328 = _999 * _1316;
    int _1330 = _1328 + _1067;
    bool _1332 = _999 == 0;
    float _1334 = trunc(_1284);
    int _1336 = int(_1334);
    int _1338 = _999 + (-1);
    bool _1340 = !_1332;
    int _1342 = _1340 ? _1330 : (-1);
    bool _1344 = !_1220;
    int _1346 = _1344 ? 0 : 1;
    bool _1348 = !_1216;
    int _1350 = _1348 ? 0 : 1;
    int _1352 = _1342 * _1322;
    float _1354 = float(_1089);
    float _1356 = trunc(_1310);
    int _1358 = int(_1356);
    int _1360 = abs(_1350);
    int _1362 = _1262 * _1338;
    int _1364 = _1362 + _1352;
    int _1366 = abs(_1346);
    int _1368 = abs(_1282);
    bool _1370 = _1354 >= _1071;
    bool _1372 = isnan(_1354);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(_1071);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    int _1382 = ~_1226;
    int _1384 = _1382 + _1288;
    int _1386 = _1384 + 1;
    int _1388 = abs(_1230);
    float _1390 = trunc(_1380);
    int _1392 = int(_1390);
    int _1394 = _1364 * _1366;
    bool _1396 = !_1224;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = _1192 * _1368;
    int _1402 = _1400 + _1089;
    int _1404 = ~_1025;
    int _1406 = _1404 + 1;
    int _1408 = _1025 * _1386;
    int _1410 = _1408 + _1089;
    bool _1412 = !_1296;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _1336 * _1360;
    int _1418 = _1416 + _1394;
    bool _1420 = _1025 == 0;
    int _1422 = _1292 * _1388;
    int _1424 = _1422 + _1067;
    int _1426 = abs(_1398);
    float _1428 = _1039 * 2.0;
    int _1430 = abs(_1258);
    bool _1432 = !_1420;
    int _1434 = _1432 ? _1410 : (-1);
    int _1436 = _1424 * _1426;
    int _1438 = _1436 + _1418;
    float _1440 = floor(_1428);
    int _1442 = abs(_1326);
    int _1444 = ~_1392;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1292 * _1430;
    int _1452 = _1450 + _1438;
    int _1454 = _1025 + (-1);
    int _1456 = _1434 * _1448;
    float _1458 = float(uint(_1452));
    int _1460 = abs(_1414);
    int _1462 = _1392 * _1454;
    int _1464 = _1462 + _1456;
    bool _1466 = !_1304;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = as_type<float>(_1075) * _1458;
    int _1472 = _1464 * _1442;
    bool _1474 = !_1308;
    int _1476 = _1474 ? 0 : 1;
    int _1478 = abs(_1468);
    float _1480 = trunc(_1470);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    int _1486 = _1358 * _1460;
    int _1488 = _1486 + _1472;
    int _1490 = abs(_1476);
    float _1492 = float(uint(_1424));
    int _1494 = _1402 * _1478;
    int _1496 = _1494 + _1488;
    int _1498 = ~_999;
    int _1500 = _1498 + 1;
    float _1502 = float(uint(_1402));
    int _1504 = _1192 * _1490;
    int _1506 = _1504 + _1496;
    float _1508 = as_type<float>(_1075) * _1492;
    bool _1510 = _1043 > 0.5;
    float _1512 = as_type<float>(_1101) * _1502;
    float _1514 = float(uint(_1506));
    int _1516 = _1500 * int(_1484);
    int _1518 = _1516 + _1452;
    float _1520 = trunc(_1508);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    float _1526 = as_type<float>(_1101) * _1514;
    float _1528 = float(uint(_1518));
    int _1530 = ~_999;
    int _1532 = _1530 + 1;
    float _1534 = trunc(_1526);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = as_type<float>(_1075) * _1528;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    int _1548 = _1532 * int(_1524);
    int _1550 = _1548 + _1424;
    float _1552 = float(uint(_1550));
    float _1554 = trunc(_1512);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = ~_999;
    int _1562 = _1560 + 1;
    float _1564 = as_type<float>(_1075) * _1552;
    int _1566 = _1406 * int(_1538);
    int _1568 = _1566 + _1506;
    int _1570 = int(_1484) + int(_1546);
    float _1572 = float(uint(_1568));
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    int _1580 = _1562 * _1570;
    int _1582 = _1580 + _1452;
    float _1584 = as_type<float>(_1101) * _1572;
    bool _1586 = uint(_1582) >= uint(_999);
    int _1588 = _1406 * int(_1558);
    int _1590 = _1588 + _1402;
    float _1592 = trunc(_1584);
    float _1594 = precise::max(_1592, 0.0);
    uint _1596 = uint(_1594);
    bool _1598 = !_1586;
    int _1600 = _1598 ? 0 : (-1);
    float _1602 = float(uint(_1590));
    int _1604 = ~_1570;
    int _1606 = _1604 + _1600;
    int _1608 = _1606 + 1;
    int _1610 = int(_1524) + int(_1578);
    float _1612 = as_type<float>(_1101) * _1602;
    int _1614 = ~_999;
    int _1616 = _1614 + 1;
    int _1618 = _999 * _1608;
    int _1620 = _1618 + _1452;
    int _1622 = ~_1025;
    int _1624 = _1622 + 1;
    bool _1626 = !_1332;
    int _1628 = _1626 ? _1620 : (-1);
    int _1630 = int(_1538) + int(_1596);
    int _1632 = _1616 * _1610;
    int _1634 = _1632 + _1424;
    int _1636 = _1628 & 3;
    bool _1638 = _1636 != 0;
    float _1640 = trunc(_1612);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    int _1646 = _1628 & 3;
    bool _1648 = _1646 != 0;
    int _1650 = _1624 * _1630;
    int _1652 = _1650 + _1506;
    bool _1654 = uint(_1636) >= 2u;
    int _1656 = _1648 ? 0 : 1;
    bool _1658 = uint(_1634) >= uint(_999);
    int _1660 = _1654 ? 0 : 1;
    bool _1662 = uint(_1652) >= uint(_1025);
    bool _1664 = !_1658;
    int _1666 = _1664 ? 0 : (-1);
    bool _1668 = !_1662;
    int _1670 = _1668 ? 0 : (-1);
    bool _1672 = _1636 != 3;
    bool _1674 = uint(_1636) > 1u;
    int _1676 = ~_1630;
    int _1678 = _1676 + _1670;
    int _1680 = _1678 + 1;
    float _1682 = -_209;
    int _1684 = _1510 ? as_type<int>(_1682) : as_type<int>(_209);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1688 = _1686 != 0;
    int _1690 = _1025 * _1680;
    int _1692 = _1690 + _1506;
    int _1694 = ~_1660;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    int _1700 = ~_1610;
    int _1702 = _1700 + _1666;
    int _1704 = _1702 + 1;
    int _1706 = _1698;
    int _1708 = _1660;
    int _1710 = _1424;
    float _1712 = _1380;
    float _1714 = as_type<float>(_1368);
    float _1716 = as_type<float>(_1358);
    if (_1672)
    {
        int _1718 = ~_1660;
        int _1720 = _1718 + 1;
        _1706 = _1720;
    }
    int _1722 = _1706;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1726 = _1724 != 0;
    int _1728 = _999 * _1704;
    int _1730 = _1728 + _1424;
    int _1732 = int(_1558) + int(_1644);
    bool _1734 = !_1420;
    int _1736 = _1734 ? _1692 : (-1);
    float _1738 = in.m_44.x;
    float _1740 = in.m_44.y;
    float _1742 = in.m_44.z;
    int _1744 = ~_1656;
    int _1746 = _1744 + 1;
    int _1748 = _1746 + 1;
    int _1750 = _1748;
    if (!_1674)
    {
        int _1752 = ~_1656;
        int _1754 = _1752 + 1;
        _1750 = _1754;
    }
    int _1756 = _1750;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1760 = _1758 != 0;
    bool _1762 = !_1726;
    int _1764 = _1762 ? 0 : 1;
    int _1766 = _1736 & 3;
    bool _1768 = _1766 != 0;
    if (_1688)
    {
        _1708 = 0;
    }
    int _1770 = _1708;
    int _1772 = _1770;
    if (_1688)
    {
        _1710 = 0;
    }
    int _1774 = _1710;
    bool _1776 = !_1760;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = _1774;
    if (!_1688)
    {
        _1772 = 1;
    }
    int _1782 = _1772;
    if (!_1688)
    {
        _1780 = 2;
    }
    int _1784 = _1780;
    int _1786 = _1736 & 3;
    bool _1788 = _1786 != 0;
    bool _1790 = !_1332;
    int _1792 = _1790 ? _1730 : (-1);
    float _1794 = _181 * _1740;
    bool _1796 = uint(_1766) > 1u;
    float _1798 = _187 * _1740;
    bool _1800 = _1766 != 3;
    float _1802 = _193 * _1740;
    int _1804 = ~_1025;
    int _1806 = _1804 + 1;
    float _1808 = fma(_179, _1738, _1794);
    int _1810 = _1788 ? 0 : 1;
    float _1812 = fma(_185, _1738, _1798);
    bool _1814 = uint(_1766) >= 2u;
    int _1816 = _1806 * _1732;
    int _1818 = _1816 + _1402;
    int _1820 = ~_1810;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    float _1826 = fma(_191, _1738, _1802);
    int _1828 = _1814 ? 0 : 1;
    float _1830 = _1041 * 2.0;
    bool _1832 = _1782 != 1;
    float _1834 = fma(_189, _1742, _1812);
    int _1836 = ~_1828;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    float _1842 = fma(_183, _1742, _1808);
    int _1844 = _1824;
    int _1846 = _1840;
    float _1848 = as_type<float>(_1784);
    if (!_1796)
    {
        int _1850 = ~_1810;
        int _1852 = _1850 + 1;
        _1844 = _1852;
    }
    int _1854 = _1844;
    float _1856 = floor(_1830);
    bool _1858 = uint(_1818) >= uint(_1025);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1860;
    if (_1800)
    {
        int _1864 = ~_1828;
        int _1866 = _1864 + 1;
        _1846 = _1866;
    }
    int _1868 = _1846;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1874 = _1834 + _971;
    bool _1876 = _1039 > 0.5;
    bool _1878 = !_1858;
    int _1880 = _1878 ? 0 : (-1);
    int _1882 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1884 = _1882 != 0;
    float _1886 = -_209;
    float _1888 = _1876 ? _1886 : _209;
    bool _1890 = !_1884;
    float _1892 = _1890 ? _209 : _1888;
    bool _1894 = _1784 != 2;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1900 = 1.0 / _1898;
    float _1902 = 2.8025969286496341418474591665798e-45;
    float _1904 = _1888;
    if (!_1832)
    {
        _1848 = _1043;
    }
    float _1906 = _1848;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1912 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1914 = _1912 != 0;
    float _1916 = _1906;
    if (!_1832)
    {
        _1902 = _1041;
    }
    float _1918 = _1902;
    float _1920 = _1918;
    if (_1894)
    {
        _1712 = _1039;
    }
    float _1922 = _1712;
    float _1924 = _1922;
    if (_1894)
    {
        _1714 = _1041;
    }
    float _1926 = _1714;
    float _1928 = _1926;
    if (!_1894)
    {
        _1924 = _1043;
    }
    float _1930 = _1924;
    if (!_1894)
    {
        _1928 = _1039;
    }
    float _1932 = _1928;
    bool _1934 = _1440 >= 0.0;
    bool _1936 = isnan(_1440);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan(0.0);
    bool _1942 = _1938 || _1940;
    float _1944 = _1862 * _1900;
    if (!_1832)
    {
        _1904 = _1918;
    }
    float _1946 = _1904;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1950 = _1942 ? 0 : 1;
    bool _1952 = _1440 > 0.0;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1956 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1958 = ~_1950;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    float _1964 = _1946;
    int _1966 = _1962;
    if (!_1832)
    {
        _1716 = _1043;
    }
    float _1968 = _1716;
    float _1970 = -_1954;
    float _1972 = fma(_1956, 2.0, _1970);
    float _1974 = _1968;
    if (_1832)
    {
        _1964 = _1039;
    }
    float _1976 = _1964;
    float _1978 = 1.0 / _1910;
    if (_1832)
    {
        _1920 = _1039;
    }
    float _1980 = _1920;
    float _1982 = -_137;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1972);
    if (_1832)
    {
        _1916 = _1041;
    }
    float _1986 = _1916;
    if (!_1952)
    {
        int _1988 = ~_1950;
        int _1990 = _1988 + 1;
        _1966 = _1990;
    }
    int _1992 = _1966;
    float _1994 = fma(_195, _1742, _1826);
    bool _1996 = _1856 >= 0.0;
    bool _1998 = isnan(_1856);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan(0.0);
    bool _2004 = _2000 || _2002;
    if (_1832)
    {
        _1974 = _1041;
    }
    float _2006 = _1974;
    float _2008 = _1994 + _993;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2012 = _2010 != 0;
    int _2014 = _2004 ? 0 : 1;
    float _2016 = _1872 * _1978;
    bool _2018 = _1856 > 0.0;
    float _2020 = _1039 + _1041;
    bool _2022 = !_1638;
    int _2024 = _2022 ? 0 : 1;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2028 = _1636 != 3;
    float _2030 = _2020 + (-1.0);
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2034 = _963 + _2032;
    float _2036 = fma(_1081, -2.0, _2026);
    bool _2038 = !_1768;
    int _2040 = _2038 ? 0 : 1;
    float _2042 = fma(_1944, _2034, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2044 = _1628 >> 31;
    float _2046 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2036);
    bool _2048 = _1766 != 3;
    int _2050 = ~_2014;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = _2054;
    if (!_2018)
    {
        int _2058 = ~_2014;
        int _2060 = _2058 + 1;
        _2056 = _2060;
    }
    int _2062 = _2056;
    bool _2064 = !_2028;
    int _2066 = _2064 ? 0 : (-1);
    int _2068 = _2044 & 3;
    int _2070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2072 = _2070 != 0;
    int _2074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2076 = _2074 != 0;
    int _2078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2080 = _2078 != 0;
    float _2082 = _1043 * 2.0;
    int _2084 = _1736 >> 31;
    int _2086 = _1628 + _2068;
    int _2088 = _2084 & 3;
    float _2090 = floor(_2082);
    bool _2092 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2094 = isnan(_963);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2100 = _2096 || _2098;
    float _2102 = float(_2100);
    int _2104 = _1736 + _2088;
    int _2106 = _2086 >> 2;
    float _2108 = -_2102;
    float _2110 = _2108 + 1.0;
    bool _2112 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2114 = isnan(_963);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2120 = _2116 || _2118;
    float _2122 = float(_2120);
    float _2124 = in.m_58.w;
    int _2126 = _2104 >> 2;
    float _2128 = _2122 * _2110;
    int _2130 = _2106 << 4;
    int _2132 = _2130 + 368;
    float _2134 = -_2122;
    float _2136 = _2134 + 1.0;
    int _2138 = _2126 << 4;
    int _2140 = _2138 + 512;
    float _2142 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _2144 = uint(int(uint(_2132) >> uint(2)));
    uint _2146 = uint(int(uint(int(_2144)) >> uint(2)));
    int _2148 = int(_2144) & 3;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[int(_2146)][_2148];
    int _2152 = int(_2144) + 1;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    int _2156 = _2152 & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2162 = _963 + _2160;
    bool _2164 = !_2048;
    int _2166 = _2164 ? 0 : (-1);
    float _2168 = _987 * _2136;
    bool _2170 = _2090 >= 0.0;
    bool _2172 = isnan(_2090);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = fma(_2016, _2162, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2182 = -_987;
    float _2184 = _2182 + 1.0;
    float _2186 = _2042 * _2168;
    uint _2188 = uint(int(uint(_2140) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2178 ? 0 : 1;
    bool _2206 = _2090 > 0.0;
    float _2208 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2186);
    float _2210 = _1842 + _2124;
    int _2212 = _2132 + 8;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    uint _2216 = uint(int(uint(int(_2214)) >> uint(2)));
    int _2218 = int(_2214) & 3;
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[int(_2216)][_2218];
    int _2222 = int(_2214) + 1;
    uint _2224 = uint(int(uint(_2222) >> uint(2)));
    int _2226 = _2222 & 3;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[int(_2224)][_2226];
    int _2230 = ~_2204;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    float _2236 = fma(_2180, _2128, _2208);
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2240 = abs(_1756);
    float _2242 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2244 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2236);
    int _2246 = _2140 + 8;
    uint _2248 = uint(int(uint(_2246) >> uint(2)));
    uint _2250 = uint(int(uint(int(_2248)) >> uint(2)));
    int _2252 = int(_2248) & 3;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[int(_2250)][_2252];
    int _2256 = int(_2248) + 1;
    uint _2258 = uint(int(uint(_2256) >> uint(2)));
    int _2260 = _2256 & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = _2234;
    if (!_2206)
    {
        int _2266 = ~_2204;
        int _2268 = _2266 + 1;
        _2264 = _2268;
    }
    int _2270 = _2264;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2274 = -_2238;
    float _2276 = fma(_2242, 2.0, _2274);
    int _2278 = abs(_1854);
    float _2280 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2272);
    int _2282 = ~_2240;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2290 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2292 = int(_2290);
    int _2294 = abs(_2024);
    float _2296 = -_137;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2276);
    float _2300 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2288);
    int _2302 = abs(_2040);
    float _2304 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2280);
    int _2306 = abs(_1722);
    float _2308 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2300);
    int _2310 = abs(_1868);
    float _2312 = -_2304;
    float _2314 = _2312 + 1.0;
    int _2316 = ~_2278;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    float _2322 = -_2308;
    float _2324 = _2322 + 1.0;
    int _2326 = ~_2294;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = ~_2302;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    int _2338 = _2286 * as_type<int>(_2158);
    int _2340 = _2330 * as_type<int>(_2150);
    int _2342 = _2340 + _2338;
    int _2344 = ~_2306;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = ~_1732;
    int _2352 = _2350 + _1880;
    int _2354 = _2352 + 1;
    int _2356 = _2320 * as_type<int>(_2202);
    int _2358 = ~_2310;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2366 = int(_2364);
    int _2368 = abs(_2292);
    int _2370 = _2336 * as_type<int>(_2194);
    int _2372 = _2370 + _2356;
    int _2374 = abs(_1764);
    int _2376 = _1025 * _2354;
    int _2378 = _2376 + _1402;
    float _2380 = float(uint(_2368));
    int _2382 = _2348 * as_type<int>(_2220);
    int _2384 = _2382 + _2342;
    float _2386 = float(uint(_2292));
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2390 = abs(_1778);
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2394 = _2008 + _2392;
    bool _2396 = !_2076;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = float(_2270);
    int _2402 = _2362 * as_type<int>(_2254);
    int _2404 = _2402 + _2372;
    int _2406 = abs(_2066);
    float _2408 = 1.0 / _2386;
    int _2410 = ~_2390;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    int _2416 = ~_2406;
    int _2418 = _2416 + 1;
    int _2420 = _2418 + 1;
    int _2422 = abs(_2166);
    float _2424 = float(uint(_2366));
    int _2426 = _2420 * as_type<int>(_2228);
    int _2428 = _2426 + _2384;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2438 = _1874 + _2436;
    int _2440 = ~_2366;
    int _2442 = _2440 + 1;
    int _2444 = _2428 * _2414;
    float _2446 = 1.0 / _2424;
    int _2448 = _2434 * as_type<int>(_2262);
    int _2450 = _2448 + _2404;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2210 + _2452;
    int _2456 = _1792 * _2390;
    int _2458 = _2456 + _2444;
    bool _2460 = !_1420;
    int _2462 = _2460 ? _2378 : (-1);
    float _2464 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2466 = as_type<int>(_2408) + (-2);
    float _2468 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2470 = float(uint(_2458));
    float _2472 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2464);
    int _2474 = abs(_2366);
    float _2476 = _2438 * _2438;
    float _2478 = 1.0 / _2380;
    float _2480 = as_type<float>(_2466) * _2470;
    float _2482 = float(uint(_2474));
    float _2484 = fma(_2394, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2472);
    int _2486 = ~_2374;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = fma(_2454, _2454, _2476);
    int _2494 = as_type<int>(_2446) + (-2);
    float _2496 = _939 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2498 = trunc(_2480);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = fma(_2394, _2394, _2492);
    int _2506 = _2450 * _2490;
    float _2508 = _941 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2510 = ~_2292;
    int _2512 = _2510 + 1;
    float _2514 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2516 = _2484 >= 0.0;
    int _2518 = _2462 * _2374;
    int _2520 = _2518 + _2506;
    float _2522 = 1.0 / _2482;
    int _2524 = abs(_2458);
    float _2526 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2528 = as_type<int>(_2478) + (-2);
    float _2530 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2532 = float(uint(_2520));
    float _2534 = _2526 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2536 = float(uint(_2524));
    float _2538 = sqrt(_2504);
    int _2540 = _2512 * int(_2502);
    int _2542 = _2540 + _2458;
    float _2544 = as_type<float>(_2494) * _2532;
    float _2546 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2548 = as_type<float>(_2528) * _2536;
    float _2550 = _2508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2552 = float(uint(_2542));
    if (_2516)
    {
        out.m_47.x = 0.0;
    }
    float _2554 = rsqrt(_2504);
    int _2556 = as_type<int>(_2522) + (-2);
    float _2558 = as_type<float>(_2466) * _2552;
    out.m_70.x = _2514;
    out.m_70.y = _2546;
    out.m_70.z = _2550;
    out.m_70.w = _2530;
    int _2560 = ~_2368;
    int _2562 = _2560 + 1;
    int _2564 = ~_2474;
    int _2566 = _2564 + 1;
    float _2568 = _2538 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2570 = abs(_2520);
    float _2572 = trunc(_2544);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2580 = _1041 > 0.5;
    float _2582 = float(uint(_2570));
    float _2584 = precise::min(_2534, _2568);
    float _2586 = _2438 * _2554;
    float _2588 = trunc(_2548);
    float _2590 = precise::max(_2588, 0.0);
    uint _2592 = uint(_2590);
    float _2594 = as_type<float>(_2556) * _2582;
    float _2596 = _2454 * _2554;
    float _2598 = _2586 * _2584;
    float _2600 = _1208 + 0.5;
    float _2602 = _2596 * _2584;
    float _2604 = -_2598;
    float _2606 = _2438 + _2604;
    float _2608 = trunc(_2594);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    int _2614 = _2442 * int(_2576);
    int _2616 = _2614 + _2520;
    float _2618 = -_2602;
    float _2620 = _2454 + _2618;
    float _2622 = _2606 * _2606;
    float _2624 = fma(_2578, _2600, _2298);
    out.m_72.w = _2584;
    float _2626 = float(uint(_2616));
    float _2628 = trunc(_2558);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    int _2634 = _2562 * int(_2592);
    int _2636 = _2634 + _2524;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2640 = ~_2292;
    int _2642 = _2640 + 1;
    float _2644 = as_type<float>(_2494) * _2626;
    float _2646 = float(uint(_2636));
    int _2648 = _2566 * int(_2612);
    int _2650 = _2648 + _2570;
    float _2652 = fma(_2620, _2620, _2622);
    float _2654 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2656 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2658 = as_type<float>(_2528) * _2646;
    float _2660 = float(uint(_2650));
    float _2662 = -_2638;
    float _2664 = fma(_2654, 2.0, _2662);
    float _2666 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2668 = int(_2502) + int(_2632);
    float _2670 = _2394 * _2554;
    float _2672 = trunc(_2644);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    float _2678 = as_type<float>(_2556) * _2660;
    float _2680 = _2670 * _2584;
    int _2682 = _2642 * _2668;
    int _2684 = _2682 + _2458;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2688 = -_2680;
    float _2690 = _2394 + _2688;
    float _2692 = trunc(_2678);
    float _2694 = precise::max(_2692, 0.0);
    uint _2696 = uint(_2694);
    float _2698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2700 = uint(_2684) >= uint(_2292);
    float _2702 = fma(_2690, _2690, _2652);
    float _2704 = fma(_1948, -2.0, _2686);
    float _2706 = fma(_2656, -2.0, _2698);
    int _2708 = abs(_2398);
    float _2710 = trunc(_2658);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    int _2716 = int(_2576) + int(_2676);
    int _2718 = ~_2366;
    int _2720 = _2718 + 1;
    int _2722 = ~_2474;
    int _2724 = _2722 + 1;
    float _2726 = sqrt(_2702);
    int _2728 = ~_2368;
    int _2730 = _2728 + 1;
    int _2732 = int(_2612) + int(_2696);
    int _2734 = _2720 * _2716;
    int _2736 = _2734 + _2520;
    int _2738 = int(_2592) + int(_2714);
    float _2740 = float(_1992);
    float _2742 = float(_2708);
    bool _2744 = !_2700;
    int _2746 = _2744 ? 0 : (-1);
    float _2748 = _2554 * _2726;
    bool _2750 = uint(_2736) >= uint(_2366);
    int _2752 = _2724 * _2732;
    int _2754 = _2752 + _2570;
    int _2756 = ~_2668;
    int _2758 = _2756 + _2746;
    int _2760 = _2758 + 1;
    float _2762 = _2526 * _2748;
    int _2764 = _2730 * _2738;
    int _2766 = _2764 + _2524;
    float _2768 = _2742 * _2740;
    bool _2770 = !_2750;
    int _2772 = _2770 ? 0 : (-1);
    float _2774 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2776 = !_2072;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2782 = uint(_2766) >= uint(_2368);
    float _2784 = _2586 * _2774;
    int _2786 = ~_2716;
    int _2788 = _2786 + _2772;
    int _2790 = _2788 + 1;
    int _2792 = _2292 * _2760;
    int _2794 = _2792 + _2458;
    float _2796 = _2596 * _2774;
    float _2798 = _2670 * _2774;
    int _2800 = _2458 ^ _2292;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2804 = !_2782;
    float _2806 = _2804 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2808 = -_2784;
    float _2810 = _2438 + _2808;
    bool _2812 = uint(_2754) >= uint(_2474);
    float _2814 = -_2796;
    float _2816 = _2454 + _2814;
    uint _2818 = uint(int(uint(_2800) >> uint(31)));
    float _2820 = _2810 * _2810;
    bool _2822 = !_2812;
    int _2824 = _2822 ? 0 : (-1);
    float _2826 = -_2798;
    float _2828 = _2394 + _2826;
    bool _2830 = _2292 == 0;
    float _2832 = fma(_2816, _2816, _2820);
    int _2834 = ~as_type<int>(_2806);
    int _2836 = _2738 + _2834;
    int _2838 = _2836 + 1;
    int _2840 = _2366 * _2790;
    int _2842 = _2840 + _2520;
    int _2844 = ~int(_2818);
    int _2846 = _2844 + 1;
    float _2848 = fma(_2828, _2828, _2832);
    bool _2850 = !_2830;
    int _2852 = _2850 ? _2794 : (-1);
    float _2854 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2856 = _2366 == 0;
    float _2858 = _1212 + (-0.5);
    int _2860 = _2838 ^ _2846;
    float _2862 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2704);
    int _2864 = abs(_2778);
    float _2866 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2868 = !_2856;
    int _2870 = _2868 ? _2842 : (-1);
    float _2872 = -_2854;
    float _2874 = -_2862;
    float _2876 = fma(_2872, _2858, _2874);
    int _2878 = ~_2846;
    int _2880 = _2878 + _2860;
    int _2882 = _2880 + 1;
    float _2884 = sqrt(_2848);
    bool _2886 = _2292 == 0;
    int _2888 = _2520 ^ _2366;
    float _2890 = float(_2864);
    float _2892 = _2806;
    float _2894 = _2602;
    if (_2516)
    {
        _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2896 = _2892;
    float _2898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2900 = !_2886;
    int _2902 = _2900 ? _2882 : (-1);
    float _2904 = _2890 * _2400;
    bool _2906 = _2366 == 0;
    uint _2908 = uint(int(uint(_2888) >> uint(31)));
    int _2910 = as_type<int>(_2896);
    if (_2516)
    {
        float _2912 = _2896 * 5.0;
        _2910 = as_type<int>(_2912);
    }
    int _2914 = _2910;
    int _2916 = ~_2824;
    int _2918 = _2732 + _2916;
    int _2920 = _2918 + 1;
    float _2922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2924 = ~int(_2908);
    int _2926 = _2924 + 1;
    float _2928 = _2554 * _2884;
    if (_2516)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8431 = as_type<float>(_2914);
        out.gl_Position.z = _8431;
    }
    float _2930 = float(_2852);
    int _2932 = _2920 ^ _2926;
    float _2934 = _2762 * _2928;
    float _2936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2938 = _2898 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2940 = fma(_2866, _2930, _1984);
    float _2942 = -_213;
    int _2944 = _2580 ? as_type<int>(_2942) : as_type<int>(_213);
    out.m_74.x = _2934;
    float _2946 = float(_2902);
    float _2948 = float(_2870);
    float _2950 = -_137;
    float _2952 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2664);
    int _2954 = ~_2926;
    int _2956 = _2954 + _2932;
    int _2958 = _2956 + 1;
    float _2960 = _1892 + 0.5;
    bool _2962 = !_1914;
    float _2964 = _2962 ? _213 : as_type<float>(_2944);
    float _2966 = fma(_2938, _2948, _2952);
    bool _2968 = !_2012;
    float _2970 = _2968 ? _209 : as_type<float>(_1684);
    float _2972 = fma(_2866, _2960, _2940);
    bool _2974 = !_2906;
    int _2976 = _2974 ? _2958 : (-1);
    float _2978 = _2922 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2980 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2982 = _2970 + 0.5;
    float _2984 = float(_2976);
    float _2986 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2706);
    float _2988 = -_2046;
    float _2990 = fma(_2980, _2946, _2988);
    float _2992 = fma(_2938, _2982, _2966);
    float _2994 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2996 = log2(_2994);
    float _2998 = _2964 + (-0.5);
    float _3000 = -_2986;
    float _3002 = fma(_2978, _2984, _3000);
    float _3004 = _1278 + (-0.5);
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3008 = -_2980;
    float _3010 = fma(_3008, _2998, _2990);
    float _3012 = -_2978;
    float _3014 = fma(_3012, _3004, _3002);
    float _3016 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3006);
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3020 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3016);
    bool _3022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3024 = isnan(0.0);
    bool _3026 = _3022 || _3024;
    bool _3028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3030 = _3026 || _3028;
    float _3032 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3018);
    float _3034 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3036 = -_3020;
    float _3038 = _3036 + 1.0;
    float _3040 = _2996 * _137;
    float _3042 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3032);
    float _3044 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3034);
    float _3046 = -_3038;
    float _3048 = fma(_1208, _3046, _2624);
    float _3050 = -_3042;
    float _3052 = _3050 + 1.0;
    float _3054 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3044);
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3058 = exp2(_3040);
    float _3060 = -_3052;
    float _3062 = fma(_1892, _3060, _2972);
    float _3064 = -_3054;
    float _3066 = _3064 + 1.0;
    float _3068 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3056);
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3072 = 1.0 + _3070;
    bool _3074 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3076 = isnan(1.0);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3082 = _3078 || _3080;
    float _3084 = fma(_1212, _3066, _2876);
    float _3086 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3068);
    float _3088 = 1.0 / _3072;
    float _3090 = in.m_76.x;
    float _3092 = in.m_76.y;
    float _3094 = in.m_76.z;
    float _3096 = -_3086;
    float _3098 = _3096 + 1.0;
    float _3100 = -_2314;
    float _3102 = fma(_2970, _3100, _2992);
    out.m_78.x = _3048;
    out.m_78.y = _3084;
    float _3104 = fma(_2964, _3098, _3010);
    float _3106 = -_3058;
    float _3108 = _3106 + 1.0;
    float _3110 = fma(_1278, _2324, _3014);
    bool _3112 = !_2080;
    int _3114 = _3112 ? 0 : 1;
    float _3116 = _3030 ? _3108 : 0.0;
    out.m_80.x = _3062;
    out.m_80.y = _3104;
    out.m_80.z = _3102;
    out.m_80.w = _3110;
    if (_3082)
    {
        float _3118 = _3116 * _3088;
        _161 = _3118;
    }
    float _3120 = _161;
    float _3122 = _3094;
    if (_2516)
    {
        return out;
    }
    float _3124 = _2904 * (-2.0);
    float _3126 = -_2784;
    float _3128 = _1874 + _3126;
    float _3130 = _1039 + (-0.5);
    float _3132 = -_2796;
    float _3134 = _2210 + _3132;
    float _3136 = fma(_3124, _3090, _3090);
    float _3138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3140 = _3128 + _3138;
    float _3142 = fma(_2142, _3124, _2142);
    float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3146 = _3134 + _3144;
    float _3148 = fma(_3130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3136);
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3152 = -_2798;
    float _3154 = _2008 + _3152;
    float _3156 = _2768 * (-2.0);
    float _3158 = fma(_3142, _3120, _3148);
    float _3160 = fma(_3146, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3150);
    float _3162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3164 = _3154 + _3162;
    int _3166 = abs(_3114);
    float _3168 = fma(_2666, _3156, _2666);
    float _3170 = fma(_3156, _3092, _3092);
    float _3172 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3160);
    float _3174 = _3158 * 0.15915493667125701904296875;
    float _3176 = float(_2062);
    float _3178 = _1041 + (-0.5);
    float _3180 = float(_3166);
    float _3182 = _1043 + _1039;
    bool _3184 = _3172 >= 0.0;
    float _3186 = fma(_3178, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3170);
    float _3188 = _3180 * _3176;
    float _3190 = _3182 + (-1.0);
    float _3192 = fma(_3168, _3120, _3186);
    float _3194 = _1043 + (-0.5);
    float _3196 = _3188 * (-2.0);
    float _3198 = fma(_3190, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3200 = _3192 * 0.15915493667125701904296875;
    float _3202 = _3174 * 6.283185482025146484375;
    float _3204 = sin(_3202);
    float _3206 = fma(_3196, _3094, _3094);
    float _3208 = fma(_3198, _3196, _3198);
    int _3210 = as_type<int>(_3194);
    if (_3184)
    {
        _3122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3212 = _3122;
    if (_3184)
    {
        out.m_47.x = 0.0;
    }
    float _3214 = fma(_3194, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3206);
    float _3216 = _3200 * 6.283185482025146484375;
    float _3218 = sin(_3216);
    float _3220 = fma(_3208, _3120, _3214);
    if (_3184)
    {
        float _3222 = _3212 * 5.0;
        _3210 = as_type<int>(_3222);
    }
    int _3224 = _3210;
    if (_3184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8923 = as_type<float>(_3224);
        out.gl_Position.z = _8923;
    }
    float _3226 = _3200 * 6.283185482025146484375;
    float _3228 = cos(_3226);
    float _3230 = _3174 * 6.283185482025146484375;
    float _3232 = cos(_3230);
    float _3234 = _3220 * 0.15915493667125701904296875;
    if (_3184)
    {
        return out;
    }
    float _3236 = _3234 * 6.283185482025146484375;
    float _3238 = cos(_3236);
    float _3240 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3242 = _2748 * _2928;
    float _3244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _3246 = _3232 * _3218;
    float _3248 = _3204 * _3218;
    float _3250 = _3240 * _3242;
    float _3252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _3254 = _3234 * 6.283185482025146484375;
    float _3256 = sin(_3254);
    float _3258 = _3204 * _3228;
    float _3260 = _3250 * _3244;
    float _3262 = _3232 * _3228;
    float _3264 = _2934 * _3252;
    float _3266 = _3242 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3268 = _3266 * 0.5;
    float _3270 = _3232 * _3238;
    float _3272 = _3204 * _3238;
    float _3274 = _3228 * _3238;
    float _3276 = _3218 * _3238;
    float _3278 = _3270 * _3260;
    float _3280 = fma(_3256, _3262, _3248);
    float _3282 = -_3258;
    float _3284 = fma(_3256, _3246, _3282);
    float _3286 = -_3260;
    float _3288 = _3256 * _3286;
    float _3290 = -_3246;
    float _3292 = fma(_3256, _3258, _3290);
    float _3294 = fma(_3280, _3264, _3278);
    float _3296 = _3272 * _3260;
    float _3298 = fma(_3274, _3264, _3288);
    float _3300 = fma(_3256, _3248, _3262);
    float _3302 = fma(_3284, _3268, _3294);
    float _3304 = fma(_3292, _3264, _3296);
    float _3306 = fma(_3276, _3268, _3298);
    float _3308 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3310 = fma(_3300, _3268, _3304);
    float _3312 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3314 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3308);
    float _3316 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3312);
    float _3318 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3314);
    float _3320 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3316);
    float _3322 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3324 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3326 = _2008 + _3322;
    float _3328 = _2210 + _3324;
    float _3330 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3334 = _3326 + _3332;
    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3338 = _3328 + _3336;
    float _3340 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3330);
    float _3342 = _3334 * _3334;
    float _3344 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3340);
    float _3346 = fma(_3338, _3338, _3342);
    float _3348 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3350 = sqrt(_3346);
    float _3352 = _1874 + _3348;
    bool _3354 = _3350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3356 = _3330;
    float _3358 = _3328;
    float _3360 = _3326;
    if (!_3354)
    {
        _3356 = _3352;
    }
    float _3362 = _3356;
    bool _3364 = !_3354;
    float _3366 = _3362;
    if (!_3364)
    {
        float _3368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3372 = _3350 + _3370;
        float _3374 = rsqrt(_3346);
        float _3376 = _3372 * _3368;
        float _3378 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3380 = _3376 * 0.15915493667125701904296875;
        float _3382 = _3380 * 6.283185482025146484375;
        float _3384 = sin(_3382);
        float _3386 = _3380 * 6.283185482025146484375;
        float _3388 = cos(_3386);
        float _3390 = fma(_3384, _3378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3392 = _3374 * _3390;
        float _3394 = _3388 + (-1.0);
        float _3396 = fma(_3338, _3392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3398 = fma(_3334, _3392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3400 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3402 = fma(_3352, _3388, _3400);
        _3366 = _3402;
        _3358 = _3396;
        _3360 = _3398;
    }
    float _3404 = _3366;
    float _3406 = _3358;
    float _3408 = _3360;
    float _3410 = -_1874;
    float _3412 = _3410 + _3404;
    float _3414 = -_2210;
    float _3416 = _3414 + _3406;
    float _3418 = -_2008;
    float _3420 = _3418 + _3408;
    float _3422 = -_2598;
    float _3424 = _1874 + _3422;
    float _3426 = _3412 * _3412;
    float _3428 = -_2602;
    float _3430 = _2210 + _3428;
    float _3432 = -_2680;
    float _3434 = _2008 + _3432;
    float _3436 = -_2784;
    float _3438 = _3436 + _3424;
    float _3440 = fma(_3416, _3416, _3426);
    float _3442 = -_2598;
    float _3444 = _3442 + _3404;
    float _3446 = -_2798;
    float _3448 = _3446 + _3434;
    float _3450 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3452 = fma(_3420, _3420, _3440);
    float _3454 = -_2796;
    float _3456 = _3454 + _3430;
    float _3458 = -_2680;
    float _3460 = _3458 + _3408;
    float _3462 = sqrt(_3452);
    float _3464 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3450);
    float _3466 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3468 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3470 = isnan(0.5);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3476 = _3472 || _3474;
    float _3478 = fma(_3448, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3464);
    float _3480 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3466);
    bool _3482 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3484 = isnan(0.5);
    bool _3486 = _3482 || _3484;
    bool _3488 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3490 = _3486 || _3488;
    float _3492 = _3478 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3494 = fma(_3448, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3480);
    float _3496 = -_2602;
    float _3498 = _3496 + _3406;
    float _3500 = 1.0 / _3492;
    float _3502 = _3494 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3504 = _3462 > 0.0;
    float _3506 = _3502 + _3492;
    float _3508 = _3502;
    float _3510 = _3462;
    float _3512 = _3498;
    float _3514 = _3430;
    if (!_3504)
    {
        _3508 = _3444;
    }
    float _3516 = _3508;
    float _3518 = _3516;
    float _3520 = _3516;
    if (!_3504)
    {
        _3510 = _3460;
    }
    float _3522 = _3510;
    bool _3524 = !_3504;
    float _3526 = _3522;
    float _3528 = _3522;
    if (!_3524)
    {
        float _3530 = _229 * _229;
        float _3532 = rsqrt(_3452);
        float _3534 = fma(_227, _227, _3530);
        float _3536 = fma(_231, _231, _3534);
        float _3538 = sqrt(_3536);
        float _3540 = _3416 * _3532;
        float _3542 = _3412 * _3532;
        float _3544 = _3420 * _3532;
        bool _3546 = _3538 > 0.0;
        _2894 = _3542;
        if (!_3546)
        {
            _3518 = _3444;
        }
        float _3548 = _3518;
        _3520 = _3548;
        if (!_3546)
        {
            _3526 = _3460;
        }
        float _3550 = _3526;
        bool _3552 = !_3546;
        _3528 = _3550;
        if (!_3552)
        {
            float _3554 = rsqrt(_3536);
            float _3556 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3558 = _229 * _3554;
            float _3560 = _227 * _3554;
            float _3562 = _3542 * _3558;
            float _3564 = _231 * _3554;
            float _3566 = fma(_3540, _3560, _3562);
            float _3568 = _3556 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3570 = fma(_3544, _3564, _3566);
            float _3572 = _3570 * _3568;
            float _3574 = fma(_227, _3572, _3498);
            float _3576 = fma(_229, _3572, _3444);
            float _3578 = fma(_231, _3572, _3460);
            _3512 = _3574;
            _3520 = _3576;
            _3528 = _3578;
            _2894 = _3566;
        }
    }
    float _3580 = _3512;
    float _3582 = _3520;
    float _3584 = _3528;
    float _3586 = _2894;
    float _3588 = -_2796;
    float _3590 = _3588 + _3580;
    float _3592 = -_2784;
    float _3594 = _3592 + _3582;
    float _3596 = -_2798;
    float _3598 = _3596 + _3584;
    float _3600 = _3506 * _3500;
    float _3602 = _3600 * 0.5;
    float _3604 = _3586;
    float _3606 = _3594;
    float _3608 = _3590;
    float _3610 = _3598;
    if (_3490)
    {
        _3604 = 1.0;
    }
    float _3612 = _3604;
    float _3614 = _3612;
    if (!_3476)
    {
        float _3616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3618 = _3438 + _3616;
        float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3622 = _3456 + _3620;
        float _3624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3626 = -_3434;
        float _3628 = _3626 + _3584;
        float _3630 = _3618 * _3618;
        float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3634 = _3448 + _3632;
        float _3636 = -_3430;
        float _3638 = _3636 + _3580;
        float _3640 = fma(_3622, _3622, _3630);
        float _3642 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3644 = fma(_3634, _3634, _3640);
        float _3646 = sqrt(_3644);
        float _3648 = 1.0 / _2928;
        float _3650 = _3642 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3652 = precise::min(_3646, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3654 = _3652 * _3624;
        float _3656 = _3654 * _3648;
        float _3658 = -_3424;
        float _3660 = _3658 + _3582;
        float _3662 = _3650 * _3656;
        float _3664 = _3628 * _3656;
        float _3666 = fma(_3660, _3662, _3438);
        float _3668 = fma(_3638, _3662, _3456);
        float _3670 = fma(_3650, _3664, _3448);
        _3606 = _3666;
        _3608 = _3668;
        _3610 = _3670;
    }
    float _3672 = _3606;
    float _3674 = _3608;
    float _3676 = _3610;
    if (!_3490)
    {
        float _3678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3680 = _3678 * 0.15915493667125701904296875;
        float _3682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3684 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3686 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3684);
        float _3688 = _3680 * 6.283185482025146484375;
        float _3690 = cos(_3688);
        float _3692 = _3682 * 0.15915493667125701904296875;
        float _3694 = _3680 * 6.283185482025146484375;
        float _3696 = sin(_3694);
        float _3698 = 1.0 / _3690;
        float _3700 = _3692 * 6.283185482025146484375;
        float _3702 = cos(_3700);
        float _3704 = _3696 * _3698;
        float _3706 = _3692 * 6.283185482025146484375;
        float _3708 = sin(_3706);
        float _3710 = _3702 * _3704;
        float _3712 = 1.0 / _3686;
        float _3714 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3716 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3714;
        float _3718 = 1.0 / _3710;
        float _3720 = 1.0 / _3716;
        float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3724 = _3712 * _3722;
        float _3726 = _3708 * _3718;
        float _3728 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3730 = fma(_3726, _3724, _3728);
        float _3732 = _3730 * _3720;
        float _3734 = precise::clamp(_3732, 0.0, 1.0);
        _3514 = _3724;
        _3614 = _3734;
    }
    float _3736 = _3514;
    float _3738 = _3614;
    float _3740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3742 = _3672 + _3740;
    float _3744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3746 = _3674 + _3744;
    float _3748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3750 = _3676 + _3748;
    float _3752 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3754 = _3742 * _3742;
    float _3756 = fma(_3746, _3746, _3754);
    float _3758 = fma(_3750, _3750, _3756);
    float _3760 = rsqrt(_3758);
    float _3762 = sqrt(_3758);
    float _3764 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3766 = _3746 * _3764;
    float _3768 = _3750 * _3764;
    float _3770 = _3766 * _3766;
    float _3772 = _3768 * _3768;
    float _3774 = _3770 + _3772;
    float _3776 = sqrt(_3774);
    bool _3778 = _3776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3782 = _3776 + _3780;
    float _3784 = _3750;
    float _3786 = _3774;
    float _3788 = _3782;
    float _3790 = _3736;
    float _3792 = _3764;
    if (_3778)
    {
        float _3794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3784 = _3794;
    }
    float _3796 = _3784;
    if (_3778)
    {
        float _3798 = rsqrt(_3774);
        _3786 = _3798;
    }
    float _3800 = _3786;
    float _3802 = _3800;
    if (_3778)
    {
        float _3804 = _3782 * _3796;
        _3788 = _3804;
    }
    float _3806 = _3788;
    if (_3778)
    {
        float _3808 = _3806 * 0.15915493667125701904296875;
        _3790 = _3808;
    }
    float _3810 = _3790;
    float _3812 = _3796;
    float _3814 = _3810;
    if (_3778)
    {
        float _3816 = _3810 * 6.283185482025146484375;
        float _3818 = sin(_3816);
        _3812 = _3818;
    }
    float _3820 = _3812;
    float _3822 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3824 = precise::max(0.0, _3822);
    float _3826 = _3754;
    float _3828 = _3824;
    if (_3778)
    {
        float _3830 = _3810 * 6.283185482025146484375;
        float _3832 = cos(_3830);
        _3826 = _3832;
    }
    float _3834 = _3826;
    float _3836 = -_3764;
    float _3838 = -_3824;
    float _3840 = fma(_3742, _3836, _3838);
    float _3842 = _3840;
    if (_3778)
    {
        float _3844 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3828 = _3844;
    }
    float _3846 = _3828;
    float _3848 = _3820;
    float _3850 = _3846;
    if (_3778)
    {
        float _3852 = fma(_3820, _3846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3848 = _3852;
    }
    float _3854 = _3848;
    float _3856 = _3854;
    float _3858 = _3834;
    if (_3778)
    {
        float _3860 = _3834 + (-1.0);
        _3850 = _3860;
    }
    float _3862 = _3850;
    float _3864 = _3862;
    if (_3778)
    {
        float _3866 = _3800 * _3854;
        _3792 = _3866;
    }
    float _3868 = _3792;
    if (!_3778)
    {
        _3856 = _3766;
    }
    float _3870 = _3856;
    float _3872 = _3870;
    if (_3778)
    {
        float _3874 = _3862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3814 = _3874;
    }
    float _3876 = _3814;
    if (_3778)
    {
        float _3878 = _3766 * _3868;
        _3872 = _3878;
    }
    float _3880 = _3872;
    if (!_3778)
    {
        _3864 = _3768;
    }
    float _3882 = _3864;
    float _3884 = _3882;
    if (_3778)
    {
        float _3886 = _3768 * _3868;
        _3884 = _3886;
    }
    float _3888 = _3884;
    if (!_3778)
    {
        _3802 = _3770;
    }
    float _3890 = _3802;
    float _3892 = _3890;
    if (_3778)
    {
        float _3894 = fma(_3840, _3834, _3876);
        _3842 = _3894;
    }
    float _3896 = _3842;
    if (_3778)
    {
        float _3898 = _3880 * _3880;
        _3892 = _3898;
    }
    float _3900 = _3892;
    if (!_3778)
    {
        _3858 = _3772;
    }
    float _3902 = _3858;
    float _3904 = _3902;
    if (_3778)
    {
        float _3906 = _3888 * _3888;
        _3904 = _3906;
    }
    float _3908 = _3904;
    float _3910 = fma(_3896, _3896, _3900);
    float _3912 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3914 = _3910 + _3908;
    float _3916 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3912);
    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3920 = fma(_3762, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3918);
    float _3922 = precise::clamp(_3920, 0.0, 1.0);
    float _3924 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3926 = rsqrt(_3914);
    float _3928 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3916);
    float _3930 = -_3922;
    float _3932 = _3930 + 1.0;
    float _3934 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3936 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3924);
    float _3938 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3940 = _3928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3942 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3934);
    float _3944 = abs(_3932);
    float _3946 = log2(_3944);
    float _3948 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3936);
    float _3950 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3938);
    float _3952 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3942);
    float _3954 = _3940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3956 = _3948 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3958 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3950);
    float _3960 = _3952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3962 = _3926 * _3880;
    float _3964 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3966 = _3926 * _3896;
    float _3968 = _3926 * _3888;
    float _3970 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3972 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3964);
    float _3974 = -_3954;
    float _3976 = fma(_3974, _3752, 1.0);
    float _3978 = _3958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3980 = -_3970;
    float _3982 = fma(_3966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3980);
    float _3984 = _3946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3986 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3972);
    float _3988 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3990 = -_3968;
    float _3992 = fma(_3990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3982);
    float _3994 = log2(_3976);
    float _3996 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3986);
    float _3998 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4000 = fma(_3992, -0.5, 0.5);
    float _4002 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3988);
    float _4004 = fma(_3992, 0.5, 0.5);
    float _4006 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3998);
    float _4008 = _3966 + 1.0;
    float _4010 = exp2(_3984);
    float _4012 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4002);
    float _4014 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4006);
    float _4016 = fma(_4004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4018 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4012);
    float _4020 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4014);
    float _4022 = fma(_4004, _4016, -0.212114393711090087890625);
    float _4024 = 1.0 / _3996;
    float _4026 = fma(_4004, _4022, 1.570728778839111328125);
    float _4028 = sqrt(_4000);
    float _4030 = -_3966;
    float _4032 = fma(_4010, _4008, _4030);
    float _4034 = _3994 * 0.693147182464599609375;
    float _4036 = fma(_4032, 0.5, 0.5);
    float _4038 = _4020 * _4024;
    float _4040 = _4018 * _4024;
    float _4042 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4044 = fma(_4038, 0.5, 0.5);
    float _4046 = fma(_4040, -0.5, 0.5);
    float _4048 = _4028 * 0.636619746685028076171875;
    float _4050 = -_4026;
    float _4052 = fma(_4048, _4050, 1.0);
    float3 _10227 = float3(_4044, _4046, _4042);
    float _4054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10227, float3(0.0), isnan(_10227)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10227, float3(0.0), isnan(_10227)), level(0.0)).x;
    float3 _10238 = float3(_4044, _4046, _4042);
    float4 _4057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10238, float3(0.0), isnan(_10238)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10238, float3(0.0), isnan(_10238)), level(0.0)).xyzw;
    float _4059 = _4057.x;
    float _4061 = _4057.y;
    float _4063 = _4057.z;
    float _4065 = _4057.w;
    float2 _10255 = float2(_4052, _4036);
    float3 _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10255, float2(0.0), isnan(_10255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10255, float2(0.0), isnan(_10255)), level(0.0)).xyz;
    float _4071 = _4069.x;
    float _4073 = _4069.y;
    float _4075 = _4069.z;
    float _4077 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4079 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4081 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4083 = _3946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4085 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4087 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4089 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4091 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4093 = -_3256;
    float _4095 = fma(_4093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4079);
    float _4097 = -_3256;
    float _4099 = fma(_4097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4077);
    float _4101 = -_3256;
    float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4081);
    float _4105 = fma(_4085, _4085, 1.0);
    float _4107 = exp2(_4083);
    float _4109 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4087);
    float _4111 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4089);
    float _4113 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4091);
    float _4115 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4117 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4119 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4121 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4123 = rsqrt(_4105);
    float _4125 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4099);
    float _4127 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4115);
    float _4129 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4095);
    float _4131 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4103);
    float _4133 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4117);
    float _4135 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4119);
    float _4137 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4121);
    float _4139 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4109);
    float _4141 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4143 = _4085 * _4125;
    float _4145 = -_4107;
    float _4147 = _4145 + 1.0;
    float _4149 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4127);
    float _4151 = _4085 * _4129;
    float _4153 = _4085 * _4131;
    float _4155 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4133);
    float _4157 = _4085 * _4123;
    float _4159 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4137);
    float _4161 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4111);
    float _4163 = fma(_4141, _4139, _4143);
    float _4165 = _4147 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4167 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4135);
    float _4169 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4113);
    float _4171 = -_4149;
    float _4173 = _4157 * _4171;
    float _4175 = -_4155;
    float _4177 = _4157 * _4175;
    float _4179 = fma(_4141, _4161, _4151);
    float _4181 = -_4159;
    float _4183 = _4157 * _4181;
    float _4185 = _4149 + _4163;
    float _4187 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4167);
    float _4189 = fma(_4141, _4169, _4153);
    bool _4191 = _3738 > 0.0;
    bool _4193 = isnan(_3738);
    bool _4195 = _4191 || _4193;
    bool _4197 = isnan(0.0);
    bool _4199 = _4195 || _4197;
    float _4201 = fma(_4123, _4129, _4177);
    out.m_82.x = _3456;
    out.m_82.y = _3438;
    out.m_82.z = _3448;
    float _4203 = fma(_4123, _4125, _4173);
    float _4205 = fma(_4123, _4131, _4183);
    float _4207 = _4155 + _4179;
    float _4209 = _3738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4211 = _4187 + _3996;
    float _4213 = _4020 + _3996;
    float _4215 = _3996 * 0.5;
    out.m_84.x = _3674;
    out.m_84.y = _3672;
    out.m_84.z = _3676;
    float _4217 = _4159 + _4189;
    float _4219 = _4211 * 0.5;
    float _4221 = -_4165;
    float _4223 = _4221 + 1.0;
    float _4225 = _4213 * 0.5;
    float _4227 = fma(_4018, -0.5, _4215);
    float _4229 = _4209 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_86.x = _4139;
    out.m_86.y = _4161;
    out.m_86.z = _4169;
    out.m_88.x = _4203;
    out.m_88.y = _4201;
    out.m_88.z = _4205;
    out.m_90.x = _4185;
    out.m_90.y = _4207;
    out.m_90.z = _4217;
    out.gl_Position.x = _4020;
    out.gl_Position.y = _4018;
    out.gl_Position.z = _4187;
    out.gl_Position.w = _3996;
    out.m_92.x = _4225;
    out.m_92.y = _4227;
    out.m_92.z = _4219;
    out.m_92.w = _3996;
    out.m_47.x = _4229;
    float _4231 = _4165 * _4054;
    float _4233 = _4065 * _4223;
    float _4235 = _4065 * _4231;
    float _4237 = _4075 * _4231;
    float _4239 = fma(_4071, _4235, _4059);
    float _4241 = fma(_4073, _4235, _4061);
    float _4243 = fma(_4065, _4237, _4063);
    out.m_94.x = _4239;
    out.m_94.y = _4241;
    out.m_94.z = _4243;
    out.m_94.w = _4233;
    if (_4199)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4245 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4245;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _801 = false;
    bool _665 = false;
    bool _449 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4300 = as_type<float>(_127);
        out.gl_Position.z = _4300;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    float _131 = float(_113);
    float _133 = 1.0 / _131;
    float _135 = -_129;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_129);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = _137 * _133;
    bool _151 = _137 >= _131;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    out.m_51.x = _149;
    float _157 = _129;
    float _159 = _149;
    float _161 = _137;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    int _165 = 0;
    if (_155)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4373 = as_type<float>(_169);
        out.gl_Position.z = _4373;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    float _179 = in.m_58.x;
    float _181 = in.m_58.y;
    float _183 = in.m_58.z;
    float _185 = in.m_60.x;
    float _187 = in.m_60.y;
    float _189 = in.m_60.z;
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _207 = !_199;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _175 * _181;
    float _217 = _175 * _187;
    float _219 = fma(_173, _179, _215);
    float _221 = _175 * _193;
    float _223 = fma(_173, _185, _217);
    float _225 = fma(_173, _191, _221);
    float _227 = fma(_177, _183, _219);
    float _229 = fma(_177, _189, _223);
    float _231 = fma(_177, _195, _225);
    bool _233 = !_205;
    float _251;
    if (!_233)
    {
        float _235 = in.m_64.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _149;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = _255 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    bool _277 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _279 = isnan(_255);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = -_287;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _271;
    float _299 = 1.0 / _275;
    float _301 = _259 * _289;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _255 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = _305 * _297;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = fma(_309, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = fma(_315, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _325 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_255);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _263 * _299;
    bool _339 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _341 = isnan(_255);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    bool _351 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_255);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = _349 * _295;
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = -_361;
    float _375 = _373 + 1.0;
    float _377 = _361 * _371;
    float _379 = fma(_365, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _383 = _335 * _375;
    float _385 = in.m_66.x;
    float _387 = in.m_66.y;
    float _389 = -_335;
    float _391 = _389 + 1.0;
    float _393 = _317 * _383;
    float _395 = _323 * _383;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _401;
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _409 = fma(_399, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _411 = fma(_403, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _413 = fma(_379, _377, _405);
    float _415 = fma(_381, _377, _407);
    float _417 = fma(_409, _367, _413);
    float _419 = fma(_411, _367, _415);
    float _421 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].x, _417);
    float _423 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[146].y, _419);
    float _425 = _421 * _385;
    float _427 = _423 * _387;
    bool _429 = !_291;
    float _447;
    if (!_429)
    {
        float _431 = in.m_64.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _149;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _451 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _451 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _477 = 1.0 / _467;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _481 = 1.0 / _471;
    bool _483 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _485 = isnan(_451);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = 1.0 / _475;
    bool _497 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _499 = isnan(_451);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _455 * _477;
    bool _511 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _513 = isnan(_451);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -_507;
    float _525 = _523 + 1.0;
    float _527 = _459 * _481;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _529;
    float _533 = _521 * _525;
    float _535 = -_521;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _543 = fma(_531, _527, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _545 = _493 * _537;
    float _547 = _463 * _495;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _553;
    float _557 = -_493;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _565 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = fma(_555, _527, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _569 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _571 = isnan(_451);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = fma(_563, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _587 = fma(_541, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _589 = _579 * _559;
    float _591 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = -_579;
    float _595 = _593 + 1.0;
    float _597 = _565 * _589;
    float _599 = _543 * _589;
    float _601 = _567 * _589;
    float _603 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].y, _597);
    float _605 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].x, _599);
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[107].z, _601);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _617;
    float _621 = fma(_591, _545, _605);
    float _623 = fma(_611, _509, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _625 = fma(_615, _509, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _627 = fma(_619, _509, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _629 = fma(_585, _545, _603);
    float _631 = fma(_587, _545, _607);
    float _633 = fma(_623, _533, _621);
    float _635 = fma(_627, _533, _629);
    float _637 = fma(_625, _533, _631);
    float _639 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].x, _633);
    float _641 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].y, _635);
    float _643 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[110].z, _637);
    bool _645 = !_479;
    float _663;
    if (!_645)
    {
        float _647 = in.m_64.x;
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _651 = _647 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        _663 = _149;
    }
    _665 = false;
    float _667 = _663;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _671 = _667 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _677 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_667);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _693 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _695 = isnan(_667);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    bool _709 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _711 = isnan(_667);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _675;
    float _723 = -_687;
    float _725 = _723 + 1.0;
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _729 = _703 * _725;
    float _731 = -_703;
    float _733 = _731 + 1.0;
    float _735 = 1.0 / _691;
    float _737 = _707 * _721;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _743 = fma(_737, _671, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _745 = -_719;
    float _747 = _745 + 1.0;
    float _749 = _743 * _729;
    float _751 = _741 * _735;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _755 = _667 + _753;
    float _757 = _687 * _747;
    float _759 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _749);
    float _761 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _763 = fma(_751, _755, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _767 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = fma(_763, _757, _759);
    float _771 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _773 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[117].x, _769);
    float _777 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _767;
    out.m_68.y = _777;
    out.m_68.z = _773;
    out.m_68.w = _779;
    bool _781 = !_727;
    float _799;
    if (!_781)
    {
        float _783 = in.m_64.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        _799 = _149;
    }
    _801 = false;
    float _803 = _799;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _807 = _803 + _805;
    bool _809 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _811 = isnan(_803);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _823 = _803 + _821;
    bool _825 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _827 = isnan(_803);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _845 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _847 = isnan(_803);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -_819;
    float _859 = _857 + 1.0;
    float _861 = 1.0 / _843;
    float _863 = _855 * _859;
    float _865 = -_855;
    float _867 = _865 + 1.0;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _869;
    bool _873 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _875 = 1.0 / _839;
    float _877 = _835 * _867;
    float _879 = -_835;
    float _881 = _879 + 1.0;
    float _883 = _823 * _861;
    float _885 = _807 * _875;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _891;
    float _895 = fma(_871, _885, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _897 = fma(_889, _885, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _899 = fma(_893, _885, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _901 = _895 * _877;
    float _903 = _897 * _877;
    float _905 = _899 * _877;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _919 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].x, _901);
    float _921 = fma(_909, _883, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _923 = fma(_913, _883, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _925 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].y, _903);
    float _927 = fma(_917, _883, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _929 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[123].z, _905);
    float _931 = fma(_921, _863, _919);
    float _933 = fma(_923, _863, _925);
    float _935 = fma(_927, _863, _929);
    float _937 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].x, _931);
    float _939 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].y, _933);
    float _941 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[125].z, _935);
    bool _943 = !_873;
    float _945 = _863;
    if (!_943)
    {
        float _947 = in.m_64.x;
        float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _951 = _947 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _953 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _955 = _953 * _949;
        float _957 = floor(_955);
        float _959 = -_957;
        float _961 = _955 + _959;
        _159 = _961;
    }
    float _963 = _159;
    float _965 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _967 = int(_965);
    float _969 = _133 * _137;
    float _971 = in.m_60.w;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    bool _977 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _979 = isnan(_963);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _991 = int(_989);
    float _993 = in.m_62.w;
    float _995 = float(_967);
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _999 = int(_997);
    if (_975)
    {
        float _1001 = in.m_64.x;
        _945 = _1001;
    }
    float _1003 = _945;
    float _1005 = 0.0;
    if (_975)
    {
        _1005 = 1.0;
    }
    float _1007 = _1005;
    float _1009 = _1007;
    if (!_975)
    {
        _1009 = 1.2345600128173828125;
    }
    float _1011 = _1009;
    float _1013 = _1003;
    if (!_975)
    {
        float _1015 = in.m_64.y;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = float(_991);
    float _1021 = 1.0 / _995;
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1025 = int(_1023);
    float _1027 = float(uint(_999));
    int _1029 = ~_999;
    int _1031 = _1029 + 1;
    float _1033 = float(_999);
    float _1035 = 1.0 / _1019;
    float _1037 = _1021 * _137;
    float _1039 = in.m_64.x;
    float _1041 = in.m_64.y;
    float _1043 = in.m_64.z;
    float _1045 = in.m_64.w;
    float _1047 = _1011 * _1017;
    float _1049 = 1.0 / _1027;
    float _1051 = float(uint(_1025));
    int _1053 = ~_1025;
    int _1055 = _1053 + 1;
    float _1057 = _1019;
    if (_975)
    {
        _1057 = 1.0;
    }
    float _1059 = _1057;
    float _1061 = _1059;
    if (!_975)
    {
        _1061 = 7.345489978790283203125;
    }
    float _1063 = _1061;
    float _1065 = trunc(_1037);
    int _1067 = int(_1065);
    float _1069 = _1035 * _137;
    float _1071 = float(_1025);
    float _1073 = 1.0 / _1051;
    int _1075 = as_type<int>(_1049) + (-2);
    float _1077 = _1063 * _1039;
    bool _1079 = _1045 > 0.5;
    float _1081 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1083 = _1041 > 0.5;
    float _1085 = _1043 + _1041;
    float _1087 = trunc(_1069);
    int _1089 = int(_1087);
    float _1091 = float(uint(_1067));
    float _1093 = -_213;
    int _1095 = _1079 ? as_type<int>(_1093) : as_type<int>(_213);
    float _1097 = _1085 + (-1.0);
    float _1099 = as_type<float>(_1075) * _1091;
    int _1101 = as_type<int>(_1073) + (-2);
    float _1103 = floor(_1077);
    float _1105 = float(uint(_1089));
    float _1107 = trunc(_1099);
    float _1109 = precise::max(_1107, 0.0);
    uint _1112 = uint(_1109);
    float _1114 = as_type<float>(_1101) * _1105;
    float _1116 = trunc(_1114);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    int _1122 = _1031 * int(_1112);
    int _1124 = _1122 + _1067;
    float _1126 = floor(_1047);
    float _1128 = float(uint(_1124));
    int _1130 = _1055 * int(_1120);
    int _1132 = _1130 + _1089;
    float _1134 = as_type<float>(_1075) * _1128;
    float _1136 = float(uint(_1132));
    float _1138 = trunc(_1134);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = -_1103;
    float _1146 = _1077 + _1144;
    int _1148 = ~_999;
    int _1150 = _1148 + 1;
    float _1152 = -_1126;
    float _1154 = _1047 + _1152;
    float _1156 = as_type<float>(_1101) * _1136;
    float _1158 = -_209;
    int _1160 = _1083 ? as_type<int>(_1158) : as_type<int>(_209);
    float _1162 = _1154 * _1071;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1174 = _1172 != 0;
    float _1176 = trunc(_1156);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = _1043 > 0.5;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1186 = _1184 != 0;
    int _1188 = int(_1112) + int(_1142);
    float _1190 = trunc(_1162);
    int _1192 = int(_1190);
    float _1194 = -_213;
    int _1196 = _1182 ? as_type<int>(_1194) : as_type<int>(_213);
    int _1198 = ~_1025;
    int _1200 = _1198 + 1;
    int _1202 = _1150 * _1188;
    int _1204 = _1202 + _1067;
    bool _1206 = !_1170;
    float _1208 = _1206 ? _209 : as_type<float>(_1160);
    bool _1210 = !_1174;
    float _1212 = _1210 ? _213 : as_type<float>(_1196);
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1224 = _1222 != 0;
    int _1226 = int(_1120) + int(_1180);
    bool _1228 = !_1186;
    int _1230 = _1228 ? 0 : 1;
    bool _1232 = uint(_1204) >= uint(_999);
    float _1234 = float(_1067);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1238 = _1236 != 0;
    int _1240 = _1200 * _1226;
    int _1242 = _1240 + _1089;
    bool _1244 = _1234 >= _1033;
    bool _1246 = isnan(_1234);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1033);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    bool _1256 = !_1238;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = trunc(_1254);
    int _1262 = int(_1260);
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1266 = _1264 != 0;
    bool _1268 = uint(_1242) >= uint(_1025);
    float _1270 = _1146 * _1033;
    bool _1272 = !_1232;
    int _1274 = _1272 ? 0 : (-1);
    bool _1276 = !_1166;
    float _1278 = _1276 ? _213 : as_type<float>(_1095);
    bool _1280 = !_1266;
    int _1282 = _1280 ? 0 : 1;
    float _1284 = _1033 * _969;
    bool _1286 = !_1268;
    int _1288 = _1286 ? 0 : (-1);
    float _1290 = trunc(_1270);
    int _1292 = int(_1290);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1308 = _1306 != 0;
    float _1310 = _1071 * _969;
    int _1312 = ~_1188;
    int _1314 = _1312 + _1274;
    int _1316 = _1314 + 1;
    int _1318 = ~_1262;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    bool _1324 = !_1300;
    int _1326 = _1324 ? 0 : 1;
    int _1328 = _999 * _1316;
    int _1330 = _1328 + _1067;
    bool _1332 = _999 == 0;
    float _1334 = trunc(_1284);
    int _1336 = int(_1334);
    int _1338 = _999 + (-1);
    bool _1340 = !_1332;
    int _1342 = _1340 ? _1330 : (-1);
    bool _1344 = !_1220;
    int _1346 = _1344 ? 0 : 1;
    bool _1348 = !_1216;
    int _1350 = _1348 ? 0 : 1;
    int _1352 = _1342 * _1322;
    float _1354 = float(_1089);
    float _1356 = trunc(_1310);
    int _1358 = int(_1356);
    int _1360 = abs(_1350);
    int _1362 = _1262 * _1338;
    int _1364 = _1362 + _1352;
    int _1366 = abs(_1346);
    int _1368 = abs(_1282);
    bool _1370 = _1354 >= _1071;
    bool _1372 = isnan(_1354);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(_1071);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    int _1382 = ~_1226;
    int _1384 = _1382 + _1288;
    int _1386 = _1384 + 1;
    int _1388 = abs(_1230);
    float _1390 = trunc(_1380);
    int _1392 = int(_1390);
    int _1394 = _1364 * _1366;
    bool _1396 = !_1224;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = _1192 * _1368;
    int _1402 = _1400 + _1089;
    int _1404 = ~_1025;
    int _1406 = _1404 + 1;
    int _1408 = _1025 * _1386;
    int _1410 = _1408 + _1089;
    bool _1412 = !_1296;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _1336 * _1360;
    int _1418 = _1416 + _1394;
    bool _1420 = _1025 == 0;
    int _1422 = _1292 * _1388;
    int _1424 = _1422 + _1067;
    int _1426 = abs(_1398);
    float _1428 = _1039 * 2.0;
    int _1430 = abs(_1258);
    bool _1432 = !_1420;
    int _1434 = _1432 ? _1410 : (-1);
    int _1436 = _1424 * _1426;
    int _1438 = _1436 + _1418;
    float _1440 = floor(_1428);
    int _1442 = abs(_1326);
    int _1444 = ~_1392;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    int _1450 = _1292 * _1430;
    int _1452 = _1450 + _1438;
    int _1454 = _1025 + (-1);
    int _1456 = _1434 * _1448;
    float _1458 = float(uint(_1452));
    int _1460 = abs(_1414);
    int _1462 = _1392 * _1454;
    int _1464 = _1462 + _1456;
    bool _1466 = !_1304;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = as_type<float>(_1075) * _1458;
    int _1472 = _1464 * _1442;
    bool _1474 = !_1308;
    int _1476 = _1474 ? 0 : 1;
    int _1478 = abs(_1468);
    float _1480 = trunc(_1470);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    int _1486 = _1358 * _1460;
    int _1488 = _1486 + _1472;
    int _1490 = abs(_1476);
    float _1492 = float(uint(_1424));
    int _1494 = _1402 * _1478;
    int _1496 = _1494 + _1488;
    int _1498 = ~_999;
    int _1500 = _1498 + 1;
    float _1502 = float(uint(_1402));
    int _1504 = _1192 * _1490;
    int _1506 = _1504 + _1496;
    float _1508 = as_type<float>(_1075) * _1492;
    bool _1510 = _1043 > 0.5;
    float _1512 = as_type<float>(_1101) * _1502;
    float _1514 = float(uint(_1506));
    int _1516 = _1500 * int(_1484);
    int _1518 = _1516 + _1452;
    float _1520 = trunc(_1508);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    float _1526 = as_type<float>(_1101) * _1514;
    float _1528 = float(uint(_1518));
    int _1530 = ~_999;
    int _1532 = _1530 + 1;
    float _1534 = trunc(_1526);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = as_type<float>(_1075) * _1528;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    int _1548 = _1532 * int(_1524);
    int _1550 = _1548 + _1424;
    float _1552 = float(uint(_1550));
    float _1554 = trunc(_1512);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = ~_999;
    int _1562 = _1560 + 1;
    float _1564 = as_type<float>(_1075) * _1552;
    int _1566 = _1406 * int(_1538);
    int _1568 = _1566 + _1506;
    int _1570 = int(_1484) + int(_1546);
    float _1572 = float(uint(_1568));
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    int _1580 = _1562 * _1570;
    int _1582 = _1580 + _1452;
    float _1584 = as_type<float>(_1101) * _1572;
    bool _1586 = uint(_1582) >= uint(_999);
    int _1588 = _1406 * int(_1558);
    int _1590 = _1588 + _1402;
    float _1592 = trunc(_1584);
    float _1594 = precise::max(_1592, 0.0);
    uint _1596 = uint(_1594);
    bool _1598 = !_1586;
    int _1600 = _1598 ? 0 : (-1);
    float _1602 = float(uint(_1590));
    int _1604 = ~_1570;
    int _1606 = _1604 + _1600;
    int _1608 = _1606 + 1;
    int _1610 = int(_1524) + int(_1578);
    float _1612 = as_type<float>(_1101) * _1602;
    int _1614 = ~_999;
    int _1616 = _1614 + 1;
    int _1618 = _999 * _1608;
    int _1620 = _1618 + _1452;
    int _1622 = ~_1025;
    int _1624 = _1622 + 1;
    bool _1626 = !_1332;
    int _1628 = _1626 ? _1620 : (-1);
    int _1630 = int(_1538) + int(_1596);
    int _1632 = _1616 * _1610;
    int _1634 = _1632 + _1424;
    int _1636 = _1628 & 3;
    bool _1638 = _1636 != 0;
    float _1640 = trunc(_1612);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    int _1646 = _1628 & 3;
    bool _1648 = _1646 != 0;
    int _1650 = _1624 * _1630;
    int _1652 = _1650 + _1506;
    bool _1654 = uint(_1636) >= 2u;
    int _1656 = _1648 ? 0 : 1;
    bool _1658 = uint(_1634) >= uint(_999);
    int _1660 = _1654 ? 0 : 1;
    bool _1662 = uint(_1652) >= uint(_1025);
    bool _1664 = !_1658;
    int _1666 = _1664 ? 0 : (-1);
    bool _1668 = !_1662;
    int _1670 = _1668 ? 0 : (-1);
    bool _1672 = _1636 != 3;
    bool _1674 = uint(_1636) > 1u;
    int _1676 = ~_1630;
    int _1678 = _1676 + _1670;
    int _1680 = _1678 + 1;
    float _1682 = -_209;
    int _1684 = _1510 ? as_type<int>(_1682) : as_type<int>(_209);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1688 = _1686 != 0;
    int _1690 = _1025 * _1680;
    int _1692 = _1690 + _1506;
    int _1694 = ~_1660;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    int _1700 = ~_1610;
    int _1702 = _1700 + _1666;
    int _1704 = _1702 + 1;
    int _1706 = _1698;
    int _1708 = _1660;
    int _1710 = _1424;
    float _1712 = _1380;
    float _1714 = as_type<float>(_1368);
    float _1716 = as_type<float>(_1358);
    if (_1672)
    {
        int _1718 = ~_1660;
        int _1720 = _1718 + 1;
        _1706 = _1720;
    }
    int _1722 = _1706;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1726 = _1724 != 0;
    int _1728 = _999 * _1704;
    int _1730 = _1728 + _1424;
    int _1732 = int(_1558) + int(_1644);
    bool _1734 = !_1420;
    int _1736 = _1734 ? _1692 : (-1);
    float _1738 = in.m_44.x;
    float _1740 = in.m_44.y;
    float _1742 = in.m_44.z;
    int _1744 = ~_1656;
    int _1746 = _1744 + 1;
    int _1748 = _1746 + 1;
    int _1750 = _1748;
    if (!_1674)
    {
        int _1752 = ~_1656;
        int _1754 = _1752 + 1;
        _1750 = _1754;
    }
    int _1756 = _1750;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1760 = _1758 != 0;
    bool _1762 = !_1726;
    int _1764 = _1762 ? 0 : 1;
    int _1766 = _1736 & 3;
    bool _1768 = _1766 != 0;
    if (_1688)
    {
        _1708 = 0;
    }
    int _1770 = _1708;
    int _1772 = _1770;
    if (_1688)
    {
        _1710 = 0;
    }
    int _1774 = _1710;
    bool _1776 = !_1760;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = _1774;
    if (!_1688)
    {
        _1772 = 1;
    }
    int _1782 = _1772;
    if (!_1688)
    {
        _1780 = 2;
    }
    int _1784 = _1780;
    int _1786 = _1736 & 3;
    bool _1788 = _1786 != 0;
    bool _1790 = !_1332;
    int _1792 = _1790 ? _1730 : (-1);
    float _1794 = _181 * _1740;
    bool _1796 = uint(_1766) > 1u;
    float _1798 = _187 * _1740;
    bool _1800 = _1766 != 3;
    float _1802 = _193 * _1740;
    int _1804 = ~_1025;
    int _1806 = _1804 + 1;
    float _1808 = fma(_179, _1738, _1794);
    int _1810 = _1788 ? 0 : 1;
    float _1812 = fma(_185, _1738, _1798);
    bool _1814 = uint(_1766) >= 2u;
    int _1816 = _1806 * _1732;
    int _1818 = _1816 + _1402;
    int _1820 = ~_1810;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    float _1826 = fma(_191, _1738, _1802);
    int _1828 = _1814 ? 0 : 1;
    float _1830 = _1041 * 2.0;
    bool _1832 = _1782 != 1;
    float _1834 = fma(_189, _1742, _1812);
    int _1836 = ~_1828;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    float _1842 = fma(_183, _1742, _1808);
    int _1844 = _1824;
    int _1846 = _1840;
    float _1848 = as_type<float>(_1784);
    if (!_1796)
    {
        int _1850 = ~_1810;
        int _1852 = _1850 + 1;
        _1844 = _1852;
    }
    int _1854 = _1844;
    float _1856 = floor(_1830);
    bool _1858 = uint(_1818) >= uint(_1025);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1860;
    if (_1800)
    {
        int _1864 = ~_1828;
        int _1866 = _1864 + 1;
        _1846 = _1866;
    }
    int _1868 = _1846;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1874 = _1834 + _971;
    bool _1876 = _1039 > 0.5;
    bool _1878 = !_1858;
    int _1880 = _1878 ? 0 : (-1);
    int _1882 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1884 = _1882 != 0;
    float _1886 = -_209;
    float _1888 = _1876 ? _1886 : _209;
    bool _1890 = !_1884;
    float _1892 = _1890 ? _209 : _1888;
    bool _1894 = _1784 != 2;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1900 = 1.0 / _1898;
    float _1902 = 2.8025969286496341418474591665798e-45;
    float _1904 = _1888;
    if (!_1832)
    {
        _1848 = _1043;
    }
    float _1906 = _1848;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1912 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1914 = _1912 != 0;
    float _1916 = _1906;
    if (!_1832)
    {
        _1902 = _1041;
    }
    float _1918 = _1902;
    float _1920 = _1918;
    if (_1894)
    {
        _1712 = _1039;
    }
    float _1922 = _1712;
    float _1924 = _1922;
    if (_1894)
    {
        _1714 = _1041;
    }
    float _1926 = _1714;
    float _1928 = _1926;
    if (!_1894)
    {
        _1924 = _1043;
    }
    float _1930 = _1924;
    if (!_1894)
    {
        _1928 = _1039;
    }
    float _1932 = _1928;
    bool _1934 = _1440 >= 0.0;
    bool _1936 = isnan(_1440);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan(0.0);
    bool _1942 = _1938 || _1940;
    float _1944 = _1862 * _1900;
    if (!_1832)
    {
        _1904 = _1918;
    }
    float _1946 = _1904;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1950 = _1942 ? 0 : 1;
    bool _1952 = _1440 > 0.0;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1956 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1958 = ~_1950;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    float _1964 = _1946;
    int _1966 = _1962;
    if (!_1832)
    {
        _1716 = _1043;
    }
    float _1968 = _1716;
    float _1970 = -_1954;
    float _1972 = fma(_1956, 2.0, _1970);
    float _1974 = _1968;
    if (_1832)
    {
        _1964 = _1039;
    }
    float _1976 = _1964;
    float _1978 = 1.0 / _1910;
    if (_1832)
    {
        _1920 = _1039;
    }
    float _1980 = _1920;
    float _1982 = -_137;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1972);
    if (_1832)
    {
        _1916 = _1041;
    }
    float _1986 = _1916;
    if (!_1952)
    {
        int _1988 = ~_1950;
        int _1990 = _1988 + 1;
        _1966 = _1990;
    }
    int _1992 = _1966;
    float _1994 = fma(_195, _1742, _1826);
    bool _1996 = _1856 >= 0.0;
    bool _1998 = isnan(_1856);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan(0.0);
    bool _2004 = _2000 || _2002;
    if (_1832)
    {
        _1974 = _1041;
    }
    float _2006 = _1974;
    float _2008 = _1994 + _993;
    int _2010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2012 = _2010 != 0;
    int _2014 = _2004 ? 0 : 1;
    float _2016 = _1872 * _1978;
    bool _2018 = _1856 > 0.0;
    float _2020 = _1039 + _1041;
    bool _2022 = !_1638;
    int _2024 = _2022 ? 0 : 1;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2028 = _1636 != 3;
    float _2030 = _2020 + (-1.0);
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2034 = _963 + _2032;
    float _2036 = fma(_1081, -2.0, _2026);
    bool _2038 = !_1768;
    int _2040 = _2038 ? 0 : 1;
    float _2042 = fma(_1944, _2034, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2044 = _1628 >> 31;
    float _2046 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2036);
    bool _2048 = _1766 != 3;
    int _2050 = ~_2014;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = _2054;
    if (!_2018)
    {
        int _2058 = ~_2014;
        int _2060 = _2058 + 1;
        _2056 = _2060;
    }
    int _2062 = _2056;
    bool _2064 = !_2028;
    int _2066 = _2064 ? 0 : (-1);
    int _2068 = _2044 & 3;
    int _2070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2072 = _2070 != 0;
    int _2074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2076 = _2074 != 0;
    int _2078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2080 = _2078 != 0;
    float _2082 = _1043 * 2.0;
    int _2084 = _1736 >> 31;
    int _2086 = _1628 + _2068;
    int _2088 = _2084 & 3;
    float _2090 = floor(_2082);
    bool _2092 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2094 = isnan(_963);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2100 = _2096 || _2098;
    float _2102 = float(_2100);
    int _2104 = _1736 + _2088;
    int _2106 = _2086 >> 2;
    float _2108 = -_2102;
    float _2110 = _2108 + 1.0;
    bool _2112 = _963 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2114 = isnan(_963);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2120 = _2116 || _2118;
    float _2122 = float(_2120);
    float _2124 = in.m_58.w;
    int _2126 = _2104 >> 2;
    float _2128 = _2122 * _2110;
    int _2130 = _2106 << 4;
    int _2132 = _2130 + 368;
    float _2134 = -_2122;
    float _2136 = _2134 + 1.0;
    int _2138 = _2126 << 4;
    int _2140 = _2138 + 512;
    float _2142 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _2144 = uint(int(uint(_2132) >> uint(2)));
    uint _2146 = uint(int(uint(int(_2144)) >> uint(2)));
    int _2148 = int(_2144) & 3;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[int(_2146)][_2148];
    int _2152 = int(_2144) + 1;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    int _2156 = _2152 & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2162 = _963 + _2160;
    bool _2164 = !_2048;
    int _2166 = _2164 ? 0 : (-1);
    float _2168 = _987 * _2136;
    bool _2170 = _2090 >= 0.0;
    bool _2172 = isnan(_2090);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = fma(_2016, _2162, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2182 = -_987;
    float _2184 = _2182 + 1.0;
    float _2186 = _2042 * _2168;
    uint _2188 = uint(int(uint(_2140) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2178 ? 0 : 1;
    bool _2206 = _2090 > 0.0;
    float _2208 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2186);
    float _2210 = _1842 + _2124;
    int _2212 = _2132 + 8;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    uint _2216 = uint(int(uint(int(_2214)) >> uint(2)));
    int _2218 = int(_2214) & 3;
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[int(_2216)][_2218];
    int _2222 = int(_2214) + 1;
    uint _2224 = uint(int(uint(_2222) >> uint(2)));
    int _2226 = _2222 & 3;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[int(_2224)][_2226];
    int _2230 = ~_2204;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    float _2236 = fma(_2180, _2128, _2208);
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2240 = abs(_1756);
    float _2242 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2244 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2236);
    int _2246 = _2140 + 8;
    uint _2248 = uint(int(uint(_2246) >> uint(2)));
    uint _2250 = uint(int(uint(int(_2248)) >> uint(2)));
    int _2252 = int(_2248) & 3;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[int(_2250)][_2252];
    int _2256 = int(_2248) + 1;
    uint _2258 = uint(int(uint(_2256) >> uint(2)));
    int _2260 = _2256 & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = _2234;
    if (!_2206)
    {
        int _2266 = ~_2204;
        int _2268 = _2266 + 1;
        _2264 = _2268;
    }
    int _2270 = _2264;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2274 = -_2238;
    float _2276 = fma(_2242, 2.0, _2274);
    int _2278 = abs(_1854);
    float _2280 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2272);
    int _2282 = ~_2240;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2290 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2292 = int(_2290);
    int _2294 = abs(_2024);
    float _2296 = -_137;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2276);
    float _2300 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2288);
    int _2302 = abs(_2040);
    float _2304 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2280);
    int _2306 = abs(_1722);
    float _2308 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2300);
    int _2310 = abs(_1868);
    float _2312 = -_2304;
    float _2314 = _2312 + 1.0;
    int _2316 = ~_2278;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    float _2322 = -_2308;
    float _2324 = _2322 + 1.0;
    int _2326 = ~_2294;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    int _2332 = ~_2302;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    int _2338 = _2286 * as_type<int>(_2158);
    int _2340 = _2330 * as_type<int>(_2150);
    int _2342 = _2340 + _2338;
    int _2344 = ~_2306;
    int _2346 = _2344 + 1;
    int _2348 = _2346 + 1;
    int _2350 = ~_1732;
    int _2352 = _2350 + _1880;
    int _2354 = _2352 + 1;
    int _2356 = _2320 * as_type<int>(_2202);
    int _2358 = ~_2310;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2366 = int(_2364);
    int _2368 = abs(_2292);
    int _2370 = _2336 * as_type<int>(_2194);
    int _2372 = _2370 + _2356;
    int _2374 = abs(_1764);
    int _2376 = _1025 * _2354;
    int _2378 = _2376 + _1402;
    float _2380 = float(uint(_2368));
    int _2382 = _2348 * as_type<int>(_2220);
    int _2384 = _2382 + _2342;
    float _2386 = float(uint(_2292));
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2390 = abs(_1778);
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2394 = _2008 + _2392;
    bool _2396 = !_2076;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = float(_2270);
    int _2402 = _2362 * as_type<int>(_2254);
    int _2404 = _2402 + _2372;
    int _2406 = abs(_2066);
    float _2408 = 1.0 / _2386;
    int _2410 = ~_2390;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    int _2416 = ~_2406;
    int _2418 = _2416 + 1;
    int _2420 = _2418 + 1;
    int _2422 = abs(_2166);
    float _2424 = float(uint(_2366));
    int _2426 = _2420 * as_type<int>(_2228);
    int _2428 = _2426 + _2384;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2438 = _1874 + _2436;
    int _2440 = ~_2366;
    int _2442 = _2440 + 1;
    int _2444 = _2428 * _2414;
    float _2446 = 1.0 / _2424;
    int _2448 = _2434 * as_type<int>(_2262);
    int _2450 = _2448 + _2404;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2454 = _2210 + _2452;
    int _2456 = _1792 * _2390;
    int _2458 = _2456 + _2444;
    bool _2460 = !_1420;
    int _2462 = _2460 ? _2378 : (-1);
    float _2464 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2466 = as_type<int>(_2408) + (-2);
    float _2468 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2470 = float(uint(_2458));
    float _2472 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2464);
    int _2474 = abs(_2366);
    float _2476 = _2438 * _2438;
    float _2478 = 1.0 / _2380;
    float _2480 = as_type<float>(_2466) * _2470;
    float _2482 = float(uint(_2474));
    float _2484 = fma(_2394, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2472);
    int _2486 = ~_2374;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = fma(_2454, _2454, _2476);
    int _2494 = as_type<int>(_2446) + (-2);
    float _2496 = _939 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2498 = trunc(_2480);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = fma(_2394, _2394, _2492);
    int _2506 = _2450 * _2490;
    float _2508 = _941 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2510 = ~_2292;
    int _2512 = _2510 + 1;
    float _2514 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2516 = _2484 >= 0.0;
    int _2518 = _2462 * _2374;
    int _2520 = _2518 + _2506;
    float _2522 = 1.0 / _2482;
    int _2524 = abs(_2458);
    float _2526 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2528 = as_type<int>(_2478) + (-2);
    float _2530 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2532 = float(uint(_2520));
    float _2534 = _2526 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2536 = float(uint(_2524));
    float _2538 = sqrt(_2504);
    int _2540 = _2512 * int(_2502);
    int _2542 = _2540 + _2458;
    float _2544 = as_type<float>(_2494) * _2532;
    float _2546 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2548 = as_type<float>(_2528) * _2536;
    float _2550 = _2508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2552 = float(uint(_2542));
    if (_2516)
    {
        out.m_47.x = 0.0;
    }
    float _2554 = rsqrt(_2504);
    int _2556 = as_type<int>(_2522) + (-2);
    float _2558 = as_type<float>(_2466) * _2552;
    out.m_70.x = _2514;
    out.m_70.y = _2546;
    out.m_70.z = _2550;
    out.m_70.w = _2530;
    int _2560 = ~_2368;
    int _2562 = _2560 + 1;
    int _2564 = ~_2474;
    int _2566 = _2564 + 1;
    float _2568 = _2538 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2570 = abs(_2520);
    float _2572 = trunc(_2544);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2580 = _1041 > 0.5;
    float _2582 = float(uint(_2570));
    float _2584 = precise::min(_2534, _2568);
    float _2586 = _2438 * _2554;
    float _2588 = trunc(_2548);
    float _2590 = precise::max(_2588, 0.0);
    uint _2592 = uint(_2590);
    float _2594 = as_type<float>(_2556) * _2582;
    float _2596 = _2454 * _2554;
    float _2598 = _2586 * _2584;
    float _2600 = _1208 + 0.5;
    float _2602 = _2596 * _2584;
    float _2604 = -_2598;
    float _2606 = _2438 + _2604;
    float _2608 = trunc(_2594);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    int _2614 = _2442 * int(_2576);
    int _2616 = _2614 + _2520;
    float _2618 = -_2602;
    float _2620 = _2454 + _2618;
    float _2622 = _2606 * _2606;
    float _2624 = fma(_2578, _2600, _2298);
    out.m_72.w = _2584;
    float _2626 = float(uint(_2616));
    float _2628 = trunc(_2558);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    int _2634 = _2562 * int(_2592);
    int _2636 = _2634 + _2524;
    float _2638 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2640 = ~_2292;
    int _2642 = _2640 + 1;
    float _2644 = as_type<float>(_2494) * _2626;
    float _2646 = float(uint(_2636));
    int _2648 = _2566 * int(_2612);
    int _2650 = _2648 + _2570;
    float _2652 = fma(_2620, _2620, _2622);
    float _2654 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2656 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2658 = as_type<float>(_2528) * _2646;
    float _2660 = float(uint(_2650));
    float _2662 = -_2638;
    float _2664 = fma(_2654, 2.0, _2662);
    float _2666 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2668 = int(_2502) + int(_2632);
    float _2670 = _2394 * _2554;
    float _2672 = trunc(_2644);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    float _2678 = as_type<float>(_2556) * _2660;
    float _2680 = _2670 * _2584;
    int _2682 = _2642 * _2668;
    int _2684 = _2682 + _2458;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2688 = -_2680;
    float _2690 = _2394 + _2688;
    float _2692 = trunc(_2678);
    float _2694 = precise::max(_2692, 0.0);
    uint _2696 = uint(_2694);
    float _2698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2700 = uint(_2684) >= uint(_2292);
    float _2702 = fma(_2690, _2690, _2652);
    float _2704 = fma(_1948, -2.0, _2686);
    float _2706 = fma(_2656, -2.0, _2698);
    int _2708 = abs(_2398);
    float _2710 = trunc(_2658);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    int _2716 = int(_2576) + int(_2676);
    int _2718 = ~_2366;
    int _2720 = _2718 + 1;
    int _2722 = ~_2474;
    int _2724 = _2722 + 1;
    float _2726 = sqrt(_2702);
    int _2728 = ~_2368;
    int _2730 = _2728 + 1;
    int _2732 = int(_2612) + int(_2696);
    int _2734 = _2720 * _2716;
    int _2736 = _2734 + _2520;
    int _2738 = int(_2592) + int(_2714);
    float _2740 = float(_1992);
    float _2742 = float(_2708);
    bool _2744 = !_2700;
    int _2746 = _2744 ? 0 : (-1);
    float _2748 = _2554 * _2726;
    bool _2750 = uint(_2736) >= uint(_2366);
    int _2752 = _2724 * _2732;
    int _2754 = _2752 + _2570;
    int _2756 = ~_2668;
    int _2758 = _2756 + _2746;
    int _2760 = _2758 + 1;
    float _2762 = _2526 * _2748;
    int _2764 = _2730 * _2738;
    int _2766 = _2764 + _2524;
    float _2768 = _2742 * _2740;
    bool _2770 = !_2750;
    int _2772 = _2770 ? 0 : (-1);
    float _2774 = _2762 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2776 = !_2072;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2782 = uint(_2766) >= uint(_2368);
    float _2784 = _2586 * _2774;
    int _2786 = ~_2716;
    int _2788 = _2786 + _2772;
    int _2790 = _2788 + 1;
    int _2792 = _2292 * _2760;
    int _2794 = _2792 + _2458;
    float _2796 = _2596 * _2774;
    float _2798 = _2670 * _2774;
    int _2800 = _2458 ^ _2292;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2804 = !_2782;
    float _2806 = _2804 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2808 = -_2784;
    float _2810 = _2438 + _2808;
    bool _2812 = uint(_2754) >= uint(_2474);
    float _2814 = -_2796;
    float _2816 = _2454 + _2814;
    uint _2818 = uint(int(uint(_2800) >> uint(31)));
    float _2820 = _2810 * _2810;
    bool _2822 = !_2812;
    int _2824 = _2822 ? 0 : (-1);
    float _2826 = -_2798;
    float _2828 = _2394 + _2826;
    bool _2830 = _2292 == 0;
    float _2832 = fma(_2816, _2816, _2820);
    int _2834 = ~as_type<int>(_2806);
    int _2836 = _2738 + _2834;
    int _2838 = _2836 + 1;
    int _2840 = _2366 * _2790;
    int _2842 = _2840 + _2520;
    int _2844 = ~int(_2818);
    int _2846 = _2844 + 1;
    float _2848 = fma(_2828, _2828, _2832);
    bool _2850 = !_2830;
    int _2852 = _2850 ? _2794 : (-1);
    float _2854 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2856 = _2366 == 0;
    float _2858 = _1212 + (-0.5);
    int _2860 = _2838 ^ _2846;
    float _2862 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2704);
    int _2864 = abs(_2778);
    float _2866 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2868 = !_2856;
    int _2870 = _2868 ? _2842 : (-1);
    float _2872 = -_2854;
    float _2874 = -_2862;
    float _2876 = fma(_2872, _2858, _2874);
    int _2878 = ~_2846;
    int _2880 = _2878 + _2860;
    int _2882 = _2880 + 1;
    float _2884 = sqrt(_2848);
    bool _2886 = _2292 == 0;
    int _2888 = _2520 ^ _2366;
    float _2890 = float(_2864);
    float _2892 = _2806;
    float _2894 = _2602;
    if (_2516)
    {
        _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2896 = _2892;
    float _2898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2900 = !_2886;
    int _2902 = _2900 ? _2882 : (-1);
    float _2904 = _2890 * _2400;
    bool _2906 = _2366 == 0;
    uint _2908 = uint(int(uint(_2888) >> uint(31)));
    int _2910 = as_type<int>(_2896);
    if (_2516)
    {
        float _2912 = _2896 * 5.0;
        _2910 = as_type<int>(_2912);
    }
    int _2914 = _2910;
    int _2916 = ~_2824;
    int _2918 = _2732 + _2916;
    int _2920 = _2918 + 1;
    float _2922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2924 = ~int(_2908);
    int _2926 = _2924 + 1;
    float _2928 = _2554 * _2884;
    if (_2516)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8431 = as_type<float>(_2914);
        out.gl_Position.z = _8431;
    }
    float _2930 = float(_2852);
    int _2932 = _2920 ^ _2926;
    float _2934 = _2762 * _2928;
    float _2936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2938 = _2898 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2940 = fma(_2866, _2930, _1984);
    float _2942 = -_213;
    int _2944 = _2580 ? as_type<int>(_2942) : as_type<int>(_213);
    out.m_74.x = _2934;
    float _2946 = float(_2902);
    float _2948 = float(_2870);
    float _2950 = -_137;
    float _2952 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2664);
    int _2954 = ~_2926;
    int _2956 = _2954 + _2932;
    int _2958 = _2956 + 1;
    float _2960 = _1892 + 0.5;
    bool _2962 = !_1914;
    float _2964 = _2962 ? _213 : as_type<float>(_2944);
    float _2966 = fma(_2938, _2948, _2952);
    bool _2968 = !_2012;
    float _2970 = _2968 ? _209 : as_type<float>(_1684);
    float _2972 = fma(_2866, _2960, _2940);
    bool _2974 = !_2906;
    int _2976 = _2974 ? _2958 : (-1);
    float _2978 = _2922 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2980 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2982 = _2970 + 0.5;
    float _2984 = float(_2976);
    float _2986 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2706);
    float _2988 = -_2046;
    float _2990 = fma(_2980, _2946, _2988);
    float _2992 = fma(_2938, _2982, _2966);
    float _2994 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2996 = log2(_2994);
    float _2998 = _2964 + (-0.5);
    float _3000 = -_2986;
    float _3002 = fma(_2978, _2984, _3000);
    float _3004 = _1278 + (-0.5);
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3008 = -_2980;
    float _3010 = fma(_3008, _2998, _2990);
    float _3012 = -_2978;
    float _3014 = fma(_3012, _3004, _3002);
    float _3016 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3006);
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3020 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3016);
    bool _3022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3024 = isnan(0.0);
    bool _3026 = _3022 || _3024;
    bool _3028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3030 = _3026 || _3028;
    float _3032 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3018);
    float _3034 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3036 = -_3020;
    float _3038 = _3036 + 1.0;
    float _3040 = _2996 * _137;
    float _3042 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3032);
    float _3044 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3034);
    float _3046 = -_3038;
    float _3048 = fma(_1208, _3046, _2624);
    float _3050 = -_3042;
    float _3052 = _3050 + 1.0;
    float _3054 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3044);
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3058 = exp2(_3040);
    float _3060 = -_3052;
    float _3062 = fma(_1892, _3060, _2972);
    float _3064 = -_3054;
    float _3066 = _3064 + 1.0;
    float _3068 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3056);
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3072 = 1.0 + _3070;
    bool _3074 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3076 = isnan(1.0);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3082 = _3078 || _3080;
    float _3084 = fma(_1212, _3066, _2876);
    float _3086 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3068);
    float _3088 = 1.0 / _3072;
    float _3090 = in.m_76.x;
    float _3092 = in.m_76.y;
    float _3094 = in.m_76.z;
    float _3096 = -_3086;
    float _3098 = _3096 + 1.0;
    float _3100 = -_2314;
    float _3102 = fma(_2970, _3100, _2992);
    out.m_78.x = _3048;
    out.m_78.y = _3084;
    float _3104 = fma(_2964, _3098, _3010);
    float _3106 = -_3058;
    float _3108 = _3106 + 1.0;
    float _3110 = fma(_1278, _2324, _3014);
    bool _3112 = !_2080;
    int _3114 = _3112 ? 0 : 1;
    float _3116 = _3030 ? _3108 : 0.0;
    out.m_80.x = _3062;
    out.m_80.y = _3104;
    out.m_80.z = _3102;
    out.m_80.w = _3110;
    if (_3082)
    {
        float _3118 = _3116 * _3088;
        _161 = _3118;
    }
    float _3120 = _161;
    float _3122 = _3094;
    if (_2516)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3124 = _2904 * (-2.0);
    float _3126 = -_2784;
    float _3128 = _1874 + _3126;
    float _3130 = _1039 + (-0.5);
    float _3132 = -_2796;
    float _3134 = _2210 + _3132;
    float _3136 = fma(_3124, _3090, _3090);
    float _3138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3140 = _3128 + _3138;
    float _3142 = fma(_2142, _3124, _2142);
    float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3146 = _3134 + _3144;
    float _3148 = fma(_3130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3136);
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3152 = -_2798;
    float _3154 = _2008 + _3152;
    float _3156 = _2768 * (-2.0);
    float _3158 = fma(_3142, _3120, _3148);
    float _3160 = fma(_3146, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3150);
    float _3162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3164 = _3154 + _3162;
    int _3166 = abs(_3114);
    float _3168 = fma(_2666, _3156, _2666);
    float _3170 = fma(_3156, _3092, _3092);
    float _3172 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3160);
    float _3174 = _3158 * 0.15915493667125701904296875;
    float _3176 = float(_2062);
    float _3178 = _1041 + (-0.5);
    float _3180 = float(_3166);
    float _3182 = _1043 + _1039;
    bool _3184 = _3172 >= 0.0;
    float _3186 = fma(_3178, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3170);
    float _3188 = _3180 * _3176;
    float _3190 = _3182 + (-1.0);
    float _3192 = fma(_3168, _3120, _3186);
    float _3194 = _1043 + (-0.5);
    float _3196 = _3188 * (-2.0);
    float _3198 = fma(_3190, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3200 = _3192 * 0.15915493667125701904296875;
    float _3202 = _3174 * 6.283185482025146484375;
    float _3204 = sin(_3202);
    float _3206 = fma(_3196, _3094, _3094);
    float _3208 = fma(_3198, _3196, _3198);
    int _3210 = as_type<int>(_3194);
    if (_3184)
    {
        _3122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3212 = _3122;
    if (_3184)
    {
        out.m_47.x = 0.0;
    }
    float _3214 = fma(_3194, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3206);
    float _3216 = _3200 * 6.283185482025146484375;
    float _3218 = sin(_3216);
    float _3220 = fma(_3208, _3120, _3214);
    if (_3184)
    {
        float _3222 = _3212 * 5.0;
        _3210 = as_type<int>(_3222);
    }
    int _3224 = _3210;
    if (_3184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8923 = as_type<float>(_3224);
        out.gl_Position.z = _8923;
    }
    float _3226 = _3200 * 6.283185482025146484375;
    float _3228 = cos(_3226);
    float _3230 = _3174 * 6.283185482025146484375;
    float _3232 = cos(_3230);
    float _3234 = _3220 * 0.15915493667125701904296875;
    if (_3184)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3236 = _3234 * 6.283185482025146484375;
    float _3238 = cos(_3236);
    float _3240 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3242 = _2748 * _2928;
    float _3244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _3246 = _3232 * _3218;
    float _3248 = _3204 * _3218;
    float _3250 = _3240 * _3242;
    float _3252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _3254 = _3234 * 6.283185482025146484375;
    float _3256 = sin(_3254);
    float _3258 = _3204 * _3228;
    float _3260 = _3250 * _3244;
    float _3262 = _3232 * _3228;
    float _3264 = _2934 * _3252;
    float _3266 = _3242 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3268 = _3266 * 0.5;
    float _3270 = _3232 * _3238;
    float _3272 = _3204 * _3238;
    float _3274 = _3228 * _3238;
    float _3276 = _3218 * _3238;
    float _3278 = _3270 * _3260;
    float _3280 = fma(_3256, _3262, _3248);
    float _3282 = -_3258;
    float _3284 = fma(_3256, _3246, _3282);
    float _3286 = -_3260;
    float _3288 = _3256 * _3286;
    float _3290 = -_3246;
    float _3292 = fma(_3256, _3258, _3290);
    float _3294 = fma(_3280, _3264, _3278);
    float _3296 = _3272 * _3260;
    float _3298 = fma(_3274, _3264, _3288);
    float _3300 = fma(_3256, _3248, _3262);
    float _3302 = fma(_3284, _3268, _3294);
    float _3304 = fma(_3292, _3264, _3296);
    float _3306 = fma(_3276, _3268, _3298);
    float _3308 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3310 = fma(_3300, _3268, _3304);
    float _3312 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3314 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3308);
    float _3316 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3312);
    float _3318 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3314);
    float _3320 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3316);
    float _3322 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3324 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3326 = _2008 + _3322;
    float _3328 = _2210 + _3324;
    float _3330 = _3302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3334 = _3326 + _3332;
    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3338 = _3328 + _3336;
    float _3340 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3330);
    float _3342 = _3334 * _3334;
    float _3344 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3340);
    float _3346 = fma(_3338, _3338, _3342);
    float _3348 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3350 = sqrt(_3346);
    float _3352 = _1874 + _3348;
    bool _3354 = _3350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3356 = _3330;
    float _3358 = _3328;
    float _3360 = _3326;
    if (!_3354)
    {
        _3356 = _3352;
    }
    float _3362 = _3356;
    bool _3364 = !_3354;
    float _3366 = _3362;
    if (!_3364)
    {
        float _3368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3372 = _3350 + _3370;
        float _3374 = rsqrt(_3346);
        float _3376 = _3372 * _3368;
        float _3378 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3380 = _3376 * 0.15915493667125701904296875;
        float _3382 = _3380 * 6.283185482025146484375;
        float _3384 = sin(_3382);
        float _3386 = _3380 * 6.283185482025146484375;
        float _3388 = cos(_3386);
        float _3390 = fma(_3384, _3378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3392 = _3374 * _3390;
        float _3394 = _3388 + (-1.0);
        float _3396 = fma(_3338, _3392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3398 = fma(_3334, _3392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3400 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3402 = fma(_3352, _3388, _3400);
        _3366 = _3402;
        _3358 = _3396;
        _3360 = _3398;
    }
    float _3404 = _3366;
    float _3406 = _3358;
    float _3408 = _3360;
    float _3410 = -_1874;
    float _3412 = _3410 + _3404;
    float _3414 = -_2210;
    float _3416 = _3414 + _3406;
    float _3418 = -_2008;
    float _3420 = _3418 + _3408;
    float _3422 = -_2598;
    float _3424 = _1874 + _3422;
    float _3426 = _3412 * _3412;
    float _3428 = -_2602;
    float _3430 = _2210 + _3428;
    float _3432 = -_2680;
    float _3434 = _2008 + _3432;
    float _3436 = -_2784;
    float _3438 = _3436 + _3424;
    float _3440 = fma(_3416, _3416, _3426);
    float _3442 = -_2598;
    float _3444 = _3442 + _3404;
    float _3446 = -_2798;
    float _3448 = _3446 + _3434;
    float _3450 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3452 = fma(_3420, _3420, _3440);
    float _3454 = -_2796;
    float _3456 = _3454 + _3430;
    float _3458 = -_2680;
    float _3460 = _3458 + _3408;
    float _3462 = sqrt(_3452);
    float _3464 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3450);
    float _3466 = _3438 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3468 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3470 = isnan(0.5);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3476 = _3472 || _3474;
    float _3478 = fma(_3448, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3464);
    float _3480 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3466);
    bool _3482 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3484 = isnan(0.5);
    bool _3486 = _3482 || _3484;
    bool _3488 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3490 = _3486 || _3488;
    float _3492 = _3478 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3494 = fma(_3448, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3480);
    float _3496 = -_2602;
    float _3498 = _3496 + _3406;
    float _3500 = 1.0 / _3492;
    float _3502 = _3494 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3504 = _3462 > 0.0;
    float _3506 = _3502 + _3492;
    float _3508 = _3502;
    float _3510 = _3462;
    float _3512 = _3498;
    float _3514 = _3430;
    if (!_3504)
    {
        _3508 = _3444;
    }
    float _3516 = _3508;
    float _3518 = _3516;
    float _3520 = _3516;
    if (!_3504)
    {
        _3510 = _3460;
    }
    float _3522 = _3510;
    bool _3524 = !_3504;
    float _3526 = _3522;
    float _3528 = _3522;
    if (!_3524)
    {
        float _3530 = _229 * _229;
        float _3532 = rsqrt(_3452);
        float _3534 = fma(_227, _227, _3530);
        float _3536 = fma(_231, _231, _3534);
        float _3538 = sqrt(_3536);
        float _3540 = _3416 * _3532;
        float _3542 = _3412 * _3532;
        float _3544 = _3420 * _3532;
        bool _3546 = _3538 > 0.0;
        _2894 = _3542;
        if (!_3546)
        {
            _3518 = _3444;
        }
        float _3548 = _3518;
        _3520 = _3548;
        if (!_3546)
        {
            _3526 = _3460;
        }
        float _3550 = _3526;
        bool _3552 = !_3546;
        _3528 = _3550;
        if (!_3552)
        {
            float _3554 = rsqrt(_3536);
            float _3556 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3558 = _229 * _3554;
            float _3560 = _227 * _3554;
            float _3562 = _3542 * _3558;
            float _3564 = _231 * _3554;
            float _3566 = fma(_3540, _3560, _3562);
            float _3568 = _3556 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3570 = fma(_3544, _3564, _3566);
            float _3572 = _3570 * _3568;
            float _3574 = fma(_227, _3572, _3498);
            float _3576 = fma(_229, _3572, _3444);
            float _3578 = fma(_231, _3572, _3460);
            _3512 = _3574;
            _3520 = _3576;
            _3528 = _3578;
            _2894 = _3566;
        }
    }
    float _3580 = _3512;
    float _3582 = _3520;
    float _3584 = _3528;
    float _3586 = _2894;
    float _3588 = -_2796;
    float _3590 = _3588 + _3580;
    float _3592 = -_2784;
    float _3594 = _3592 + _3582;
    float _3596 = -_2798;
    float _3598 = _3596 + _3584;
    float _3600 = _3506 * _3500;
    float _3602 = _3600 * 0.5;
    float _3604 = _3586;
    float _3606 = _3594;
    float _3608 = _3590;
    float _3610 = _3598;
    if (_3490)
    {
        _3604 = 1.0;
    }
    float _3612 = _3604;
    float _3614 = _3612;
    if (!_3476)
    {
        float _3616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3618 = _3438 + _3616;
        float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3622 = _3456 + _3620;
        float _3624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3626 = -_3434;
        float _3628 = _3626 + _3584;
        float _3630 = _3618 * _3618;
        float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3634 = _3448 + _3632;
        float _3636 = -_3430;
        float _3638 = _3636 + _3580;
        float _3640 = fma(_3622, _3622, _3630);
        float _3642 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3644 = fma(_3634, _3634, _3640);
        float _3646 = sqrt(_3644);
        float _3648 = 1.0 / _2928;
        float _3650 = _3642 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3652 = precise::min(_3646, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3654 = _3652 * _3624;
        float _3656 = _3654 * _3648;
        float _3658 = -_3424;
        float _3660 = _3658 + _3582;
        float _3662 = _3650 * _3656;
        float _3664 = _3628 * _3656;
        float _3666 = fma(_3660, _3662, _3438);
        float _3668 = fma(_3638, _3662, _3456);
        float _3670 = fma(_3650, _3664, _3448);
        _3606 = _3666;
        _3608 = _3668;
        _3610 = _3670;
    }
    float _3672 = _3606;
    float _3674 = _3608;
    float _3676 = _3610;
    if (!_3490)
    {
        float _3678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3680 = _3678 * 0.15915493667125701904296875;
        float _3682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3684 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3686 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3684);
        float _3688 = _3680 * 6.283185482025146484375;
        float _3690 = cos(_3688);
        float _3692 = _3682 * 0.15915493667125701904296875;
        float _3694 = _3680 * 6.283185482025146484375;
        float _3696 = sin(_3694);
        float _3698 = 1.0 / _3690;
        float _3700 = _3692 * 6.283185482025146484375;
        float _3702 = cos(_3700);
        float _3704 = _3696 * _3698;
        float _3706 = _3692 * 6.283185482025146484375;
        float _3708 = sin(_3706);
        float _3710 = _3702 * _3704;
        float _3712 = 1.0 / _3686;
        float _3714 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3716 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3714;
        float _3718 = 1.0 / _3710;
        float _3720 = 1.0 / _3716;
        float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3724 = _3712 * _3722;
        float _3726 = _3708 * _3718;
        float _3728 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3730 = fma(_3726, _3724, _3728);
        float _3732 = _3730 * _3720;
        float _3734 = precise::clamp(_3732, 0.0, 1.0);
        _3514 = _3724;
        _3614 = _3734;
    }
    float _3736 = _3514;
    float _3738 = _3614;
    float _3740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3742 = _3672 + _3740;
    float _3744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3746 = _3674 + _3744;
    float _3748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3750 = _3676 + _3748;
    float _3752 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3754 = _3742 * _3742;
    float _3756 = fma(_3746, _3746, _3754);
    float _3758 = fma(_3750, _3750, _3756);
    float _3760 = rsqrt(_3758);
    float _3762 = sqrt(_3758);
    float _3764 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3766 = _3746 * _3764;
    float _3768 = _3750 * _3764;
    float _3770 = _3766 * _3766;
    float _3772 = _3768 * _3768;
    float _3774 = _3770 + _3772;
    float _3776 = sqrt(_3774);
    bool _3778 = _3776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3782 = _3776 + _3780;
    float _3784 = _3750;
    float _3786 = _3774;
    float _3788 = _3782;
    float _3790 = _3736;
    float _3792 = _3764;
    if (_3778)
    {
        float _3794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3784 = _3794;
    }
    float _3796 = _3784;
    if (_3778)
    {
        float _3798 = rsqrt(_3774);
        _3786 = _3798;
    }
    float _3800 = _3786;
    float _3802 = _3800;
    if (_3778)
    {
        float _3804 = _3782 * _3796;
        _3788 = _3804;
    }
    float _3806 = _3788;
    if (_3778)
    {
        float _3808 = _3806 * 0.15915493667125701904296875;
        _3790 = _3808;
    }
    float _3810 = _3790;
    float _3812 = _3796;
    float _3814 = _3810;
    if (_3778)
    {
        float _3816 = _3810 * 6.283185482025146484375;
        float _3818 = sin(_3816);
        _3812 = _3818;
    }
    float _3820 = _3812;
    float _3822 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3824 = precise::max(0.0, _3822);
    float _3826 = _3754;
    float _3828 = _3824;
    if (_3778)
    {
        float _3830 = _3810 * 6.283185482025146484375;
        float _3832 = cos(_3830);
        _3826 = _3832;
    }
    float _3834 = _3826;
    float _3836 = -_3764;
    float _3838 = -_3824;
    float _3840 = fma(_3742, _3836, _3838);
    float _3842 = _3840;
    if (_3778)
    {
        float _3844 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3828 = _3844;
    }
    float _3846 = _3828;
    float _3848 = _3820;
    float _3850 = _3846;
    if (_3778)
    {
        float _3852 = fma(_3820, _3846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3848 = _3852;
    }
    float _3854 = _3848;
    float _3856 = _3854;
    float _3858 = _3834;
    if (_3778)
    {
        float _3860 = _3834 + (-1.0);
        _3850 = _3860;
    }
    float _3862 = _3850;
    float _3864 = _3862;
    if (_3778)
    {
        float _3866 = _3800 * _3854;
        _3792 = _3866;
    }
    float _3868 = _3792;
    if (!_3778)
    {
        _3856 = _3766;
    }
    float _3870 = _3856;
    float _3872 = _3870;
    if (_3778)
    {
        float _3874 = _3862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3814 = _3874;
    }
    float _3876 = _3814;
    if (_3778)
    {
        float _3878 = _3766 * _3868;
        _3872 = _3878;
    }
    float _3880 = _3872;
    if (!_3778)
    {
        _3864 = _3768;
    }
    float _3882 = _3864;
    float _3884 = _3882;
    if (_3778)
    {
        float _3886 = _3768 * _3868;
        _3884 = _3886;
    }
    float _3888 = _3884;
    if (!_3778)
    {
        _3802 = _3770;
    }
    float _3890 = _3802;
    float _3892 = _3890;
    if (_3778)
    {
        float _3894 = fma(_3840, _3834, _3876);
        _3842 = _3894;
    }
    float _3896 = _3842;
    if (_3778)
    {
        float _3898 = _3880 * _3880;
        _3892 = _3898;
    }
    float _3900 = _3892;
    if (!_3778)
    {
        _3858 = _3772;
    }
    float _3902 = _3858;
    float _3904 = _3902;
    if (_3778)
    {
        float _3906 = _3888 * _3888;
        _3904 = _3906;
    }
    float _3908 = _3904;
    float _3910 = fma(_3896, _3896, _3900);
    float _3912 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3914 = _3910 + _3908;
    float _3916 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3912);
    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3920 = fma(_3762, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3918);
    float _3922 = precise::clamp(_3920, 0.0, 1.0);
    float _3924 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3926 = rsqrt(_3914);
    float _3928 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3916);
    float _3930 = -_3922;
    float _3932 = _3930 + 1.0;
    float _3934 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3936 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3924);
    float _3938 = _3672 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3940 = _3928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3942 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3934);
    float _3944 = abs(_3932);
    float _3946 = log2(_3944);
    float _3948 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3936);
    float _3950 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3938);
    float _3952 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3942);
    float _3954 = _3940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3956 = _3948 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3958 = fma(_3676, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3950);
    float _3960 = _3952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3962 = _3926 * _3880;
    float _3964 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3966 = _3926 * _3896;
    float _3968 = _3926 * _3888;
    float _3970 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3972 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3964);
    float _3974 = -_3954;
    float _3976 = fma(_3974, _3752, 1.0);
    float _3978 = _3958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3980 = -_3970;
    float _3982 = fma(_3966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3980);
    float _3984 = _3946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3986 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3972);
    float _3988 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3990 = -_3968;
    float _3992 = fma(_3990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3982);
    float _3994 = log2(_3976);
    float _3996 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3986);
    float _3998 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4000 = fma(_3992, -0.5, 0.5);
    float _4002 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3988);
    float _4004 = fma(_3992, 0.5, 0.5);
    float _4006 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3998);
    float _4008 = _3966 + 1.0;
    float _4010 = exp2(_3984);
    float _4012 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4002);
    float _4014 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4006);
    float _4016 = fma(_4004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4018 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4012);
    float _4020 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4014);
    float _4022 = fma(_4004, _4016, -0.212114393711090087890625);
    float _4024 = 1.0 / _3996;
    float _4026 = fma(_4004, _4022, 1.570728778839111328125);
    float _4028 = sqrt(_4000);
    float _4030 = -_3966;
    float _4032 = fma(_4010, _4008, _4030);
    float _4034 = _3994 * 0.693147182464599609375;
    float _4036 = fma(_4032, 0.5, 0.5);
    float _4038 = _4020 * _4024;
    float _4040 = _4018 * _4024;
    float _4042 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4044 = fma(_4038, 0.5, 0.5);
    float _4046 = fma(_4040, -0.5, 0.5);
    float _4048 = _4028 * 0.636619746685028076171875;
    float _4050 = -_4026;
    float _4052 = fma(_4048, _4050, 1.0);
    float3 _10227 = float3(_4044, _4046, _4042);
    float _4054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10227, float3(0.0), isnan(_10227)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10227, float3(0.0), isnan(_10227)), level(0.0)).x;
    float3 _10238 = float3(_4044, _4046, _4042);
    float4 _4057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10238, float3(0.0), isnan(_10238)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10238, float3(0.0), isnan(_10238)), level(0.0)).xyzw;
    float _4059 = _4057.x;
    float _4061 = _4057.y;
    float _4063 = _4057.z;
    float _4065 = _4057.w;
    float2 _10255 = float2(_4052, _4036);
    float3 _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10255, float2(0.0), isnan(_10255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10255, float2(0.0), isnan(_10255)), level(0.0)).xyz;
    float _4071 = _4069.x;
    float _4073 = _4069.y;
    float _4075 = _4069.z;
    float _4077 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4079 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4081 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4083 = _3946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4085 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4087 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4089 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4091 = _3280 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4093 = -_3256;
    float _4095 = fma(_4093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4079);
    float _4097 = -_3256;
    float _4099 = fma(_4097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4077);
    float _4101 = -_3256;
    float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4081);
    float _4105 = fma(_4085, _4085, 1.0);
    float _4107 = exp2(_4083);
    float _4109 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4087);
    float _4111 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4089);
    float _4113 = fma(_3274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4091);
    float _4115 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4117 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4119 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4121 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4123 = rsqrt(_4105);
    float _4125 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4099);
    float _4127 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4115);
    float _4129 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4095);
    float _4131 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4103);
    float _4133 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4117);
    float _4135 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4119);
    float _4137 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4121);
    float _4139 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4109);
    float _4141 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4143 = _4085 * _4125;
    float _4145 = -_4107;
    float _4147 = _4145 + 1.0;
    float _4149 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4127);
    float _4151 = _4085 * _4129;
    float _4153 = _4085 * _4131;
    float _4155 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4133);
    float _4157 = _4085 * _4123;
    float _4159 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4137);
    float _4161 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4111);
    float _4163 = fma(_4141, _4139, _4143);
    float _4165 = _4147 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4167 = fma(_3940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4135);
    float _4169 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4113);
    float _4171 = -_4149;
    float _4173 = _4157 * _4171;
    float _4175 = -_4155;
    float _4177 = _4157 * _4175;
    float _4179 = fma(_4141, _4161, _4151);
    float _4181 = -_4159;
    float _4183 = _4157 * _4181;
    float _4185 = _4149 + _4163;
    float _4187 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4167);
    float _4189 = fma(_4141, _4169, _4153);
    bool _4191 = _3738 > 0.0;
    bool _4193 = isnan(_3738);
    bool _4195 = _4191 || _4193;
    bool _4197 = isnan(0.0);
    bool _4199 = _4195 || _4197;
    float _4201 = fma(_4123, _4129, _4177);
    out.m_82.x = _3456;
    out.m_82.y = _3438;
    out.m_82.z = _3448;
    float _4203 = fma(_4123, _4125, _4173);
    float _4205 = fma(_4123, _4131, _4183);
    float _4207 = _4155 + _4179;
    float _4209 = _3738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4211 = _4187 + _3996;
    float _4213 = _4020 + _3996;
    float _4215 = _3996 * 0.5;
    out.m_84.x = _3674;
    out.m_84.y = _3672;
    out.m_84.z = _3676;
    float _4217 = _4159 + _4189;
    float _4219 = _4211 * 0.5;
    float _4221 = -_4165;
    float _4223 = _4221 + 1.0;
    float _4225 = _4213 * 0.5;
    float _4227 = fma(_4018, -0.5, _4215);
    float _4229 = _4209 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_86.x = _4139;
    out.m_86.y = _4161;
    out.m_86.z = _4169;
    out.m_88.x = _4203;
    out.m_88.y = _4201;
    out.m_88.z = _4205;
    out.m_90.x = _4185;
    out.m_90.y = _4207;
    out.m_90.z = _4217;
    out.gl_Position.x = _4020;
    out.gl_Position.y = _4018;
    out.gl_Position.z = _4187;
    out.gl_Position.w = _3996;
    out.m_92.x = _4225;
    out.m_92.y = _4227;
    out.m_92.z = _4219;
    out.m_92.w = _3996;
    out.m_47.x = _4229;
    float _4231 = _4165 * _4054;
    float _4233 = _4065 * _4223;
    float _4235 = _4065 * _4231;
    float _4237 = _4075 * _4231;
    float _4239 = fma(_4071, _4235, _4059);
    float _4241 = fma(_4073, _4235, _4061);
    float _4243 = fma(_4065, _4237, _4063);
    out.m_94.x = _4239;
    out.m_94.y = _4241;
    out.m_94.z = _4243;
    out.m_94.w = _4233;
    if (_4199)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4245 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4245;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

