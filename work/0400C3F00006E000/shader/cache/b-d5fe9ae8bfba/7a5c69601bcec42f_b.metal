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
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4211 = false;
    bool _791 = false;
    bool _611 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4512 = as_type<float>(_125);
        out.gl_Position.z = _4512;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4582 = as_type<float>(_163);
        out.gl_Position.z = _4582;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _227;
    if (!_209)
    {
        float _211 = in.m_58.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_107);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
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
    bool _263 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_237);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _257;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = 1.0 / _253;
    float _281 = 1.0 / _261;
    float _283 = _249 * _275;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _241 * _279;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_273;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = _245 * _281;
    bool _323 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_237);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _333 * _337;
    float _353 = -_333;
    float _355 = _353 + 1.0;
    float _357 = fma(_341, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = _295 * _355;
    float _363 = -_295;
    float _365 = _363 + 1.0;
    float _367 = fma(_319, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = _357 * _361;
    float _371 = _359 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = fma(_349, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _385 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _387 = fma(_375, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_381, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_367, _351, _383);
    float _393 = fma(_377, _351, _385);
    float _395 = fma(_387, _315, _391);
    float _397 = fma(_389, _315, _393);
    float _399 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_277;
    float _421;
    if (!_403)
    {
        float _405 = in.m_58.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_107);
        float _427 = 1.0 / _425;
        float _429 = _143 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_60.x;
    float _435 = in.m_60.y;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _445 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = isnan(_431);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _461 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _463 = isnan(_431);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _439;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = -_455;
    float _481 = _479 + 1.0;
    bool _483 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_431);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _497 = 1.0 / _443;
    float _499 = _401 * _435;
    float _501 = _399 * _433;
    float _503 = 1.0 / _459;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _509 = _477 * _473;
    float _511 = _471 * _481;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _431 + _513;
    float _517 = -_471;
    float _519 = _517 + 1.0;
    float _521 = fma(_509, _515, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _523 = _493 * _519;
    float _525 = _507 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = _431 + _527;
    bool _531 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _533 = isnan(_431);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _543;
    float _547 = _521 * _523;
    float _549 = -_493;
    float _551 = _549 + 1.0;
    float _553 = fma(_525, _529, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _555 = _545 * _503;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _431 + _561;
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[115].x, _547);
    float _567 = _455 * _559;
    float _569 = fma(_555, _563, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _571 = fma(_553, _511, _565);
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _575 = fma(_569, _567, _571);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _579 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _583 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[118].x, _575);
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _591 = !_495;
    float _609;
    if (!_591)
    {
        float _593 = in.m_58.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_107);
        float _615 = 1.0 / _613;
        float _617 = _143 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _623 = _619 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _629 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _631 = isnan(_619);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _649 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _627;
    float _663 = -_639;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _667;
    bool _671 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_619);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _659 * _665;
    float _685 = -_659;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _691 = 1.0 / _643;
    float _693 = _681 * _687;
    float _695 = -_681;
    float _697 = _695 + 1.0;
    float _699 = 1.0 / _647;
    float _701 = _669 * _661;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _707 = fma(_701, _623, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _709 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _711 = isnan(_619);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _705 * _691;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _729 = _619 + _727;
    float _731 = _707 * _693;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _739 = _619 + _737;
    float _741 = fma(_721, _729, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _743 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[131].x, _731);
    float _745 = _725 * _699;
    float _747 = _639 * _735;
    float _749 = fma(_741, _683, _743);
    float _751 = fma(_745, _739, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _753 = fma(_751, _747, _749);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[134].x, _753);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _761 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _771 = !_689;
    float _789;
    if (!_771)
    {
        float _773 = in.m_58.x;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _777 = _773 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[14].x, _143);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_107);
        float _795 = 1.0 / _793;
        float _797 = _143 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = in.m_58.z;
    float _807 = in.m_58.w;
    float _809 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _811 = log2(_809);
    float _813 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _823 = 1.0 / _817;
    float _825 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = 1.0 / _821;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _837 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = 1.0 / _831;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _845 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _845);
    float _853 = 1.0 / _835;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _855;
    float _859 = fma(_837, -2.0, _849);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _865 = _857 * _823;
    float _867 = _803 * 2.0;
    float _869 = 1.0 / _843;
    float _871 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _873 = _863 * _827;
    float _875 = -_847;
    float _877 = fma(_871, 2.0, _875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _883 = floor(_867);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _889 = _801 * 2.0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _899 = _811 * _143;
    float _901 = floor(_889);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _903;
    float _907 = _897 * _839;
    float _909 = _893 * _853;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _919 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _859);
    float _921 = 1.0 / _887;
    float _923 = _805 * 2.0;
    bool _925 = _883 >= 0.0;
    bool _927 = isnan(_883);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = _913 * _869;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _939 = _799 + _937;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _943 = _901 >= 0.0;
    bool _945 = isnan(_901);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = _801 + _803;
    bool _955 = _901 > 0.0;
    float _957 = floor(_923);
    bool _959 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _961 = isnan(_799);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _953 + (-1.0);
    float _973 = fma(_909, _939, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _975 = _905 * _921;
    float _977 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _979 = _805 + _803;
    float _981 = 1.0 / _881;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _985 = _979 + (-1.0);
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _989 = _951 ? 0 : 1;
    float _991 = _805 + _801;
    bool _993 = _883 > 0.0;
    float _995 = -_969;
    float _997 = _995 + 1.0;
    int _999 = ~_989;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    float _1005 = _991 + (-1.0);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1009 = _1007 != 0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1017 = _1015 != 0;
    float _1019 = exp2(_899);
    int _1021 = _1003;
    int _1023 = as_type<int>(_921);
    float _1025 = _865;
    if (!_955)
    {
        int _1027 = ~_989;
        int _1029 = _1027 + 1;
        _1021 = _1029;
    }
    int _1031 = _1021;
    float _1033 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1035 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1037 = isnan(_799);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _917 * _981;
    bool _1049 = !_1013;
    int _1051 = _1049 ? 0 : 1;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1055 = _1053 != 0;
    float _1057 = _1045 * _997;
    bool _1059 = _957 > 0.0;
    float _1061 = -_1045;
    float _1063 = _1061 + 1.0;
    bool _1065 = _957 >= 0.0;
    bool _1067 = isnan(_957);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    bool _1075 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1077 = isnan(_799);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -_1019;
    float _1089 = _1087 + 1.0;
    bool _1091 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1093 = isnan(_799);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1085 * _1063;
    float _1105 = -_1085;
    float _1107 = _1105 + 1.0;
    if (_1055)
    {
        _1023 = 0;
    }
    int _1109 = _1023;
    float _1111 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    int _1113 = _1109;
    if (!_1055)
    {
        _1113 = 1;
    }
    int _1115 = _1113;
    float _1117 = -_1101;
    float _1119 = _1117 + 1.0;
    int _1121 = _1073 ? 0 : 1;
    float _1123 = _1101 * _1107;
    bool _1125 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1127 = isnan(_799);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = sqrt(_1111);
    bool _1139 = _1115 != 1;
    bool _1141 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1143 = isnan(_799);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = _1135 * _1119;
    bool _1155 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1157 = isnan(_799);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -_1135;
    float _1169 = _1167 + 1.0;
    bool _1171 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1173 = isnan(_799);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = -_1151;
    float _1185 = _1183 + 1.0;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1189 = _799 + _1187;
    float _1191 = -_1165;
    float _1193 = _1191 + 1.0;
    float _1195 = _1151 * _1169;
    float _1197 = _1165 * _1185;
    float _1199 = fma(_865, _1189, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1201 = _1181 * _1193;
    float _1203 = _1199;
    if (!_1139)
    {
        _1025 = _803;
    }
    float _1205 = _1025;
    float _1207 = -_1181;
    float _1209 = _1207 + 1.0;
    float _1211 = _1205;
    if (_1139)
    {
        _1211 = _801;
    }
    float _1213 = _1211;
    float _1215 = _1199 * _1201;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1219 = _799 + _1217;
    int _1221 = ~_1121;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    float _1227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1229 = int(_1227);
    float _1231 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1215);
    float _1233 = float(_107);
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[83].z, _983);
    int _1237 = _1225;
    float _1239 = _1213;
    if (!_1059)
    {
        int _1241 = ~_1121;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    float _1247 = fma(_873, _1219, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1139)
    {
        _115 = _805;
    }
    float _1249 = _115;
    float _1251 = _1137 * 50.0;
    float _1253 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1255 = int(_1253);
    float _1257 = _1249;
    if (!_1139)
    {
        _1203 = _803;
    }
    float _1259 = _1203;
    float _1261 = fma(_1247, _1197, _1231);
    float _1263 = _1259;
    if (!_1139)
    {
        _1239 = _805;
    }
    float _1265 = _1239;
    bool _1267 = !_1009;
    int _1269 = _1267 ? 0 : 1;
    float _1271 = fma(_973, _1195, _1261);
    float _1273 = _1265;
    if (_1139)
    {
        _1257 = _803;
    }
    float _1275 = _1257;
    float _1277 = 1.0 / _1233;
    bool _1279 = !_1017;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[83].w, _941);
    if (_1139)
    {
        _1263 = _801;
    }
    float _1285 = _1263;
    if (_1139)
    {
        _1273 = _803;
    }
    float _1287 = _1273;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1293 = _1291 != 0;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1301 = _1299 != 0;
    float _1303 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1307 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1309 = isnan(0.0);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1315 = _1311 || _1313;
    float _1317 = -_1289;
    float _1319 = fma(_1303, 2.0, _1317);
    bool _1321 = !_1293;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1327 = _1315 ? _1089 : 0.0;
    int _1329 = abs(_1323);
    float _1331 = fma(_1305, -2.0, _1325);
    float _1333 = float(_1229);
    float _1335 = in.m_62.x;
    float _1337 = in.m_62.y;
    float _1339 = in.m_62.z;
    float _1341 = float(_1255);
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1355 = 1.0 + _1353;
    float _1357 = 1.0 / _1333;
    float _1359 = float(_1329);
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1363 = float(_1245);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1367 = 1.0 / _1341;
    float _1369 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1361);
    float _1371 = _1359 * _1363;
    float _1373 = -_143;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _877);
    float _1377 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1365);
    float _1379 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1369);
    float _1381 = -_143;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1319);
    float _1385 = _1371 * (-2.0);
    float _1387 = 1.0 / _1355;
    float _1389 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1235);
    float _1391 = _1277 * _143;
    float _1393 = _1357 * _143;
    float _1395 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1377);
    float _1397 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1283);
    float _1399 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1331);
    float _1401 = _801 + (-0.5);
    float _1403 = _1367 * _143;
    bool _1405 = !_1297;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = _933 ? 0 : 1;
    int _1411 = abs(_1407);
    float _1413 = fma(_1385, _1335, _1335);
    int _1415 = ~_1409;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    int _1421 = _1419;
    float _1423 = _1277;
    float _1425 = _1403;
    if (_1351)
    {
        float _1427 = _1327 * _1387;
        _145 = _1427;
    }
    float _1429 = _145;
    float _1431 = float(_1031);
    float _1433 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1413);
    float _1435 = float(_1411);
    float _1437 = fma(_977, _1385, _977);
    bool _1439 = !_1301;
    int _1441 = _1439 ? 0 : 1;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1445 = _799 + _1443;
    if (!_993)
    {
        int _1447 = ~_1409;
        int _1449 = _1447 + 1;
        _1421 = _1449;
    }
    int _1451 = _1421;
    float _1453 = _1435 * _1431;
    float _1455 = fma(_1437, _1429, _1433);
    int _1457 = abs(_1441);
    float _1459 = _803 + (-0.5);
    float _1461 = _1453 * (-2.0);
    float _1463 = float(_1451);
    float _1465 = fma(_907, _1445, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1467 = float(_1457);
    float _1469 = fma(_1461, _1337, _1337);
    float _1471 = fma(_987, _1461, _987);
    float _1473 = fma(_1465, _1153, _1271);
    float _1475 = _1455 * 0.15915493667125701904296875;
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1469);
    float _1479 = _1467 * _1463;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1483 = _799 + _1481;
    float _1485 = _1475 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = fma(_1471, _1429, _1477);
    float _1491 = _1479 * (-2.0);
    float _1493 = fma(_935, _1483, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1495 = _1489 * 0.15915493667125701904296875;
    float _1497 = fma(_1491, _1339, _1339);
    float _1499 = _805 + (-0.5);
    float _1501 = fma(_1033, _1491, _1033);
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1505 = _799 + _1503;
    float _1507 = fma(_1493, _1123, _1473);
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1497);
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1513 = _799 + _1511;
    float _1515 = fma(_1047, _1505, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1517 = _1475 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = fma(_1501, _1429, _1509);
    float _1523 = fma(_975, _1513, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1525 = fma(_1515, _1103, _1507);
    float _1527 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1529 = _1521 * 0.15915493667125701904296875;
    float _1531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1533 = fma(_1523, _1057, _1525);
    float _1535 = _1495 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = _813 * _1527;
    float _1541 = _825 * _1531;
    float _1543 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1533);
    float _1545 = in.m_46.x;
    float _1547 = in.m_46.y;
    float _1549 = in.m_46.z;
    float _1551 = _1543 * _1251;
    float _1553 = _1495 * 6.283185482025146484375;
    float _1555 = cos(_1553);
    float _1557 = _1529 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1487 * _1537;
    float _1563 = _1519 * _1537;
    float _1565 = _1529 * 6.283185482025146484375;
    float _1567 = sin(_1565);
    float _1569 = _1519 * _1555;
    float _1571 = _1487 * _1555;
    float _1573 = _1519 * _1559;
    float _1575 = _1487 * _1559;
    float _1577 = _1555 * _1559;
    float _1579 = _1537 * _1559;
    float _1581 = _1575 * _1541;
    float _1583 = fma(_1567, _1569, _1561);
    float _1585 = fma(_1567, _1561, _1569);
    float _1587 = _1573 * _1541;
    float _1589 = -_1563;
    float _1591 = fma(_1567, _1571, _1589);
    float _1593 = -_1571;
    float _1595 = fma(_1567, _1563, _1593);
    float _1597 = -_1541;
    float _1599 = _1567 * _1597;
    float _1601 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1603 = fma(_1583, _1539, _1587);
    float _1605 = fma(_1591, _1539, _1581);
    float _1607 = fma(_1577, _1539, _1599);
    float _1609 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1611 = fma(_1595, _1601, _1603);
    float _1613 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1615 = fma(_1579, _1601, _1607);
    float _1617 = fma(_1585, _1601, _1605);
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1621 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1623 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1613);
    float _1625 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1627 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1619);
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1621);
    float _1631 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1609);
    float _1633 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1623);
    float _1635 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1627);
    float _1637 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1625);
    float _1639 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1629);
    float _1641 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1631);
    float _1643 = _1633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1645 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1647 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1637);
    float _1649 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1653 = _1643 + _1645;
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1657 = _1649 * _1649;
    float _1659 = _1651 + _1649;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1653 + _1661;
    float _1665 = _1645 * _1645;
    float _1667 = fma(_1655, _1655, _1657);
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1659 + _1669;
    float _1673 = _1663 * _1663;
    float _1675 = _1551 * _1551;
    float _1677 = _1665 + _1667;
    float _1679 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1681 = fma(_1671, _1671, _1673);
    float _1683 = rsqrt(_1675);
    float _1685 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1679);
    float _1687 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1685);
    float _1689 = rsqrt(_1677);
    float _1691 = sqrt(_1681);
    float _1693 = _1551 * _1683;
    float _1695 = _1687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1697 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1699 = sqrt(_1675);
    float _1701 = _1655 * _1689;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1697);
    float _1705 = _1693 * _1701;
    float _1707 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    bool _1709 = _1691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1711 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1715 = _1713 != 0;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1727 = _1725 != 0;
    float _1729 = _1705 * _1699;
    bool _1731 = !_1719;
    int _1733 = _1731 ? 0 : 1;
    bool _1735 = !_1715;
    int _1737 = _1735 ? 0 : 1;
    float _1739 = fma(_1693, _1729, _1655);
    float _1741 = _1699;
    float _1743 = _1655;
    float _1745 = _1739;
    float _1747 = _1677;
    float _1749 = _1707;
    float _1751 = _1697;
    float _1753 = _1549;
    if (!_1709)
    {
        _1741 = _1657;
    }
    float _1755 = _1741;
    bool _1757 = !_1723;
    int _1759 = _1757 ? 0 : 1;
    float _1761 = _1695 + _1739;
    bool _1763 = !_1727;
    int _1765 = _1763 ? 0 : 1;
    float _1767 = _1755;
    if (!_1709)
    {
        _1743 = _1665;
    }
    float _1769 = _1743;
    float _1771 = _1769;
    if (!_1709)
    {
        _1745 = _1645;
    }
    float _1773 = _1745;
    float _1775 = _1773;
    if (!_1709)
    {
        _1747 = _1649;
    }
    float _1777 = _1747;
    float _1779 = _1777;
    if (!_1709)
    {
        _1749 = _1659;
    }
    float _1781 = _1749;
    float _1783 = _1781;
    if (!_1709)
    {
        _1751 = _1653;
    }
    float _1785 = _1751;
    float _1787 = _1785;
    if (!_1709)
    {
        _1753 = _1761;
    }
    float _1789 = _1753;
    bool _1791 = !_1709;
    float _1793 = _1789;
    if (!_1791)
    {
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1799 = _1691 + _1797;
        float _1801 = rsqrt(_1681);
        float _1803 = _1799 * _1795;
        float _1805 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1807 = _1803 * 0.15915493667125701904296875;
        float _1809 = _1807 * 6.283185482025146484375;
        float _1811 = sin(_1809);
        float _1813 = _1807 * 6.283185482025146484375;
        float _1815 = cos(_1813);
        float _1817 = fma(_1811, _1805, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1819 = _1801 * _1817;
        float _1821 = fma(_1671, _1819, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1823 = _1815 + (-1.0);
        float _1825 = fma(_1663, _1819, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1827 = -_1651;
        float _1829 = _1827 + _1821;
        float _1831 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1833 = -_1643;
        float _1835 = _1833 + _1825;
        float _1837 = _1829 * _1829;
        float _1839 = fma(_1761, _1815, _1831);
        float _1841 = _1835 * _1835;
        _1793 = _1839;
        _1767 = _1837;
        _1771 = _1841;
        _1783 = _1821;
        _1787 = _1825;
        _1779 = _1829;
        _1775 = _1835;
    }
    float _1843 = _1793;
    float _1845 = _1767;
    float _1847 = _1771;
    float _1849 = _1783;
    float _1851 = _1787;
    float _1853 = _1779;
    float _1855 = _1775;
    float _1857 = -_1695;
    float _1859 = _1857 + _1843;
    float _1861 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1863 = 1.0 / _1711;
    float _1865 = fma(_1859, _1859, _1845);
    float _1867 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1861);
    bool _1869 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1871 = isnan(0.5);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1877 = _1873 || _1875;
    float _1879 = _1865 + _1847;
    float _1881 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1867);
    float _1883 = sqrt(_1879);
    float _1885 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    float _1897 = _1885 + _1711;
    float _1899 = _1897 * _1863;
    float _1901 = _1899 * 0.5;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1903);
    bool _1907 = _1883 > 0.0;
    float _1909 = 1.0 / _1905;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1913 = _1883;
    float _1915 = _1901;
    float _1917 = _1855;
    float _1919 = _1851;
    float _1921 = _1849;
    float _1923 = _1843;
    if (!_1907)
    {
        _1911 = _1849;
    }
    float _1925 = _1911;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1907)
    {
        _1913 = _1843;
    }
    float _1931 = _1913;
    float _1933 = _1931;
    if (!_1907)
    {
        _1915 = _1851;
    }
    float _1935 = _1915;
    bool _1937 = !_1907;
    float _1939 = _1935;
    if (!_1937)
    {
        float _1941 = _205 * _205;
        float _1943 = fma(_203, _203, _1941);
        float _1945 = fma(_207, _207, _1943);
        float _1947 = rsqrt(_1879);
        float _1949 = sqrt(_1945);
        float _1951 = _1947 * _1853;
        float _1953 = _1859 * _1947;
        float _1955 = _1947 * _1855;
        bool _1957 = _1949 > 0.0;
        float _1959 = _1947;
        float _1961 = _1949;
        _1917 = _1955;
        if (!_1957)
        {
            _1927 = _1849;
        }
        float _1963 = _1927;
        _1929 = _1963;
        if (!_1957)
        {
            _1959 = _1843;
        }
        float _1965 = _1959;
        _1933 = _1965;
        if (!_1957)
        {
            _1961 = _1851;
        }
        float _1967 = _1961;
        bool _1969 = !_1957;
        _1939 = _1967;
        if (!_1969)
        {
            float _1971 = rsqrt(_1945);
            float _1973 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1975 = _205 * _1971;
            float _1977 = _203 * _1971;
            float _1979 = _207 * _1971;
            float _1981 = _1953 * _1975;
            float _1983 = fma(_1951, _1977, _1981);
            float _1985 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1987 = fma(_1955, _1979, _1983);
            float _1989 = _1987 * _1985;
            float _1991 = fma(_203, _1989, _1849);
            float _1993 = fma(_205, _1989, _1843);
            float _1995 = fma(_207, _1989, _1851);
            _1929 = _1991;
            _1933 = _1993;
            _1939 = _1995;
        }
    }
    float _1997 = _1929;
    float _1999 = _1933;
    float _2001 = _1939;
    float _2003 = _1917;
    float _2005 = _2003;
    float _2007 = _2001;
    float _2009 = _1997;
    if (_1895)
    {
        _2005 = 1.0;
    }
    float _2011 = _2005;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = _1909 * _2013;
    float _2017 = _2011;
    if (_1877)
    {
        _1919 = _1997;
    }
    float _2019 = _1919;
    float _2021 = _2019;
    if (_1877)
    {
        _1921 = _1999;
    }
    float _2023 = _1921;
    float _2025 = _2023;
    if (_1877)
    {
        _1923 = _2001;
    }
    float _2027 = _1923;
    float _2029 = _2027;
    if (!_1877)
    {
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2033 = _1695 + _2031;
        float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2037 = _1651 + _2035;
        float _2039 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2041 = -_1695;
        float _2043 = _2041 + _1999;
        float _2045 = _2033 * _2033;
        float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2049 = _1643 + _2047;
        float _2051 = -_1643;
        float _2053 = _2051 + _2001;
        float _2055 = fma(_2037, _2037, _2045);
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2059 = fma(_2049, _2049, _2055);
        float _2061 = sqrt(_2059);
        float _2063 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = precise::min(_2061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2067 = _2065 * _2057;
        float _2069 = _2063 * _2067;
        float _2071 = -_1651;
        float _2073 = _2071 + _1997;
        float _2075 = fma(_2043, _2069, _1695);
        float _2077 = fma(_2073, _2069, _1651);
        float _2079 = fma(_2053, _2069, _1643);
        _2025 = _2075;
        _2021 = _2077;
        _2029 = _2079;
        _2007 = _2053;
    }
    float _2081 = _2025;
    float _2083 = _2021;
    float _2085 = _2029;
    float _2087 = _2007;
    float _2089 = _2087;
    if (!_1895)
    {
        float _2091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2097 = _2093 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        float _2101 = _2095 * 0.15915493667125701904296875;
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = 1.0 / _2099;
        float _2109 = _2101 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = _2105 * _2107;
        float _2115 = _2101 * 6.283185482025146484375;
        float _2117 = sin(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = 1.0 / _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2125 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2123;
        float _2127 = 1.0 / _2125;
        float _2129 = _2117 * _2121;
        float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2133 = fma(_2015, _2129, _2131);
        float _2135 = _2133 * _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        _2009 = _2093;
        _2089 = _2101;
        _2017 = _2137;
    }
    float _2139 = _2009;
    float _2141 = _2089;
    float _2143 = _2017;
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2147 = _2081 + _2145;
    float _2149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2151 = _2083 + _2149;
    float _2153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2155 = _2085 + _2153;
    float _2157 = _2147 * _2147;
    float _2159 = fma(_2151, _2151, _2157);
    float _2161 = fma(_1651, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2165 = fma(_2155, _2155, _2159);
    float _2167 = rsqrt(_2165);
    float _2169 = sqrt(_2165);
    float _2171 = _2167 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2173 = _2151 * _2171;
    float _2175 = _2155 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 * _2175;
    float _2181 = _2177 + _2179;
    float _2183 = sqrt(_2181);
    bool _2185 = _2183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2189 = _2183 + _2187;
    float _2191 = _2155;
    float _2193 = _2181;
    float _2195 = _2189;
    float _2197 = _2139;
    float _2199 = _2147;
    float _2201 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2185)
    {
        float _2203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2191 = _2203;
    }
    float _2205 = _2191;
    if (_2185)
    {
        float _2207 = rsqrt(_2181);
        _2193 = _2207;
    }
    float _2209 = _2193;
    float _2211 = _2209;
    if (_2185)
    {
        float _2213 = _2189 * _2205;
        _2195 = _2213;
    }
    float _2215 = _2195;
    if (_2185)
    {
        float _2217 = _2215 * 0.15915493667125701904296875;
        _2197 = _2217;
    }
    float _2219 = _2197;
    float _2221 = _2167;
    float _2223 = _2219;
    if (_2185)
    {
        float _2225 = _2219 * 6.283185482025146484375;
        float _2227 = sin(_2225);
        _2221 = _2227;
    }
    float _2229 = _2221;
    float _2231 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2233 = precise::max(0.0, _2231);
    float _2235 = _2141;
    float _2237 = _2233;
    float _2239 = _2231;
    if (_2185)
    {
        float _2241 = _2219 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        _2235 = _2243;
    }
    float _2245 = _2235;
    float _2247 = -_2171;
    float _2249 = -_2233;
    float _2251 = fma(_2147, _2247, _2249);
    if (!_2185)
    {
        _2199 = _2173;
    }
    float _2253 = _2199;
    float _2255 = _2253;
    if (_2185)
    {
        float _2257 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2257;
    }
    float _2259 = _2237;
    float _2261 = _2229;
    if (_2185)
    {
        float _2263 = fma(_2229, _2259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2261 = _2263;
    }
    float _2265 = _2261;
    float _2267 = floor(_2161);
    float _2269 = _2265;
    float _2271 = _2245;
    if (_2185)
    {
        float _2273 = _2245 + (-1.0);
        _2239 = _2273;
    }
    float _2275 = _2239;
    float _2277 = _2275;
    if (_2185)
    {
        float _2279 = _2209 * _2265;
        _2201 = _2279;
    }
    float _2281 = _2201;
    if (!_2185)
    {
        _2269 = _2251;
    }
    float _2283 = _2269;
    float _2285 = _2283;
    if (_2185)
    {
        float _2287 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2287;
    }
    float _2289 = _2223;
    if (_2185)
    {
        float _2291 = _2173 * _2281;
        _2255 = _2291;
    }
    float _2293 = _2255;
    if (!_2185)
    {
        _2277 = _2175;
    }
    float _2295 = _2277;
    float _2297 = _2295;
    if (_2185)
    {
        float _2299 = _2175 * _2281;
        _2297 = _2299;
    }
    float _2301 = _2297;
    if (!_2185)
    {
        _2211 = _2177;
    }
    float _2303 = _2211;
    float _2305 = _2303;
    if (_2185)
    {
        float _2307 = fma(_2251, _2245, _2289);
        _2285 = _2307;
    }
    float _2309 = _2285;
    if (_2185)
    {
        float _2311 = _2293 * _2293;
        _2305 = _2311;
    }
    float _2313 = _2305;
    float _2315 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2185)
    {
        _2271 = _2179;
    }
    float _2317 = _2271;
    float _2319 = _2317;
    if (_2185)
    {
        float _2321 = _2301 * _2301;
        _2319 = _2321;
    }
    float _2323 = _2319;
    float _2325 = fma(_2309, _2309, _2313);
    float _2327 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2329 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2331 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2315);
    float _2333 = _2325 + _2323;
    float _2335 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2329);
    float _2337 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2339 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2331);
    float _2341 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2343 = rsqrt(_2333);
    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2347 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2345);
    float _2349 = precise::clamp(_2347, 0.0, 1.0);
    float _2351 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2335);
    float _2353 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2337);
    float _2355 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2357 = -_2349;
    float _2359 = _2357 + 1.0;
    float _2361 = _2351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2363 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2341);
    float _2365 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2353);
    float _2367 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2369 = floor(_2327);
    float _2371 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2363);
    float _2373 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2375 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2367);
    float _2377 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2379 = _2343 * _2293;
    float _2381 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2375);
    float _2383 = abs(_2359);
    float _2385 = log2(_2383);
    float _2387 = _2343 * _2301;
    float _2389 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2391 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2381);
    float _2393 = _2343 * _2309;
    float _2395 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2397 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2399 = -_2389;
    float _2401 = fma(_2393, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2399);
    float _2403 = -_2395;
    float _2405 = fma(_2403, _2163, 1.0);
    float _2407 = 1.0 / _2391;
    float _2409 = -_2369;
    float _2411 = _2327 + _2409;
    float _2413 = -_2387;
    float _2415 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2401);
    float _2417 = -_2267;
    float _2419 = _2161 + _2417;
    float _2421 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2423 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2397);
    float _2425 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2427 = fma(_2415, -0.5, 0.5);
    float _2429 = log2(_2405);
    float _2431 = fma(_2415, 0.5, 0.5);
    float _2433 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2421);
    float _2435 = _2393 + 1.0;
    float _2437 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2423);
    float _2439 = fma(_2431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2441 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2433);
    float _2443 = exp2(_2425);
    float _2445 = fma(_2431, _2439, -0.212114393711090087890625);
    float _2447 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2441);
    float _2449 = fma(_2431, _2445, 1.570728778839111328125);
    float _2451 = _2447 * _2407;
    float _2453 = sqrt(_2427);
    float _2455 = _2429 * 0.693147182464599609375;
    float _2457 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2459 = fma(_2451, 0.5, 0.5);
    float _2461 = -_2393;
    float _2463 = fma(_2443, _2435, _2461);
    float _2465 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2437);
    float _2467 = fma(_2463, 0.5, 0.5);
    float _2469 = _2465 * _2407;
    float _2471 = _2453 * 0.636619746685028076171875;
    float _2473 = fma(_2469, -0.5, 0.5);
    float _2475 = -_2449;
    float _2477 = fma(_2471, _2475, 1.0);
    float2 _8205 = float2(_2419, _2411);
    float _2479 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8205, float2(0.0), isnan(_8205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8205, float2(0.0), isnan(_8205)), level(0.0)).x;
    float3 _8216 = float3(_2459, _2473, _2457);
    float _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8216, float3(0.0), isnan(_8216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8216, float3(0.0), isnan(_8216)), level(0.0)).x;
    float3 _8227 = float3(_2459, _2473, _2457);
    float4 _2484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8227, float3(0.0), isnan(_8227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8227, float3(0.0), isnan(_8227)), level(0.0)).xyzw;
    float _2486 = _2484.x;
    float _2488 = _2484.y;
    float _2490 = _2484.z;
    float _2492 = _2484.w;
    float2 _8243 = float2(_2477, _2467);
    float3 _2496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8243, float2(0.0), isnan(_8243)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8243, float2(0.0), isnan(_8243)), level(0.0)).xyz;
    float _2498 = _2496.x;
    float _2500 = _2496.y;
    float _2502 = _2496.z;
    float _2504 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2506 = int(_2504);
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2510 = _2508 != 0;
    out.m_64.x = _585;
    out.m_64.y = _579;
    out.m_64.z = _587;
    out.m_64.w = _589;
    int _2512 = abs(_1733);
    float _2514 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2516 = abs(_1051);
    out.m_66.x = _763;
    out.m_66.y = _765;
    out.m_66.z = _767;
    out.m_66.w = _769;
    int _2518 = abs(_1737);
    float _2520 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2522 = int(_2520);
    int _2524 = abs(_1765);
    float _2526 = -_1379;
    float _2528 = _2526 + 1.0;
    float _2530 = -_1397;
    float _2532 = _2530 + 1.0;
    out.m_68.x = _2083;
    out.m_68.y = _2081;
    out.m_68.z = _2085;
    float _2534 = 0.0;
    float _2536 = _2532;
    if (_2510)
    {
        _2534 = 1.0;
    }
    float _2538 = _2534;
    float _2540 = float(uint(_2506));
    float _2542 = trunc(_1393);
    int _2544 = int(_2542);
    float _2546 = _2538;
    if (_2510)
    {
        float _2548 = in.m_58.x;
        _1423 = _2548;
    }
    float _2550 = _1423;
    if (!_2510)
    {
        _2546 = 7.345489978790283203125;
    }
    float _2552 = _2546;
    float _2554 = _2550;
    if (!_2510)
    {
        float _2556 = in.m_58.y;
        _2554 = _2556;
    }
    float _2558 = _2554;
    float _2560 = float(uint(_2522));
    float _2562 = 1.0 / _2540;
    int _2564 = ~_2522;
    int _2566 = _2564 + 1;
    float _2568 = _2552 * _801;
    bool _2570 = _2522 == 0;
    float _2572 = 1.0 / _2560;
    float _2574 = trunc(_1403);
    int _2576 = int(_2574);
    int _2578 = as_type<int>(_2562) + (-2);
    float _2580 = float(uint(_2544));
    float _2582 = as_type<float>(_2578) * _2580;
    int _2584 = as_type<int>(_2572) + (-2);
    float _2586 = floor(_2568);
    if (_2510)
    {
        _1425 = 1.0;
    }
    float _2588 = _1425;
    float _2590 = _2588;
    if (!_2510)
    {
        _2590 = 1.2345600128173828125;
    }
    float _2592 = _2590;
    int _2594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2596 = _2594 != 0;
    float _2598 = float(uint(_2576));
    float _2600 = trunc(_2582);
    float _2602 = precise::max(_2600, 0.0);
    uint _2605 = uint(_2602);
    float _2607 = _2558 * _2592;
    float _2609 = as_type<float>(_2584) * _2598;
    int _2611 = ~_2506;
    int _2613 = _2611 + 1;
    float _2615 = floor(_2607);
    float _2617 = -_2586;
    float _2619 = _2568 + _2617;
    float _2621 = trunc(_2609);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    int _2627 = _2613 * int(_2605);
    int _2629 = _2627 + _2544;
    float _2631 = float(uint(_2629));
    float _2633 = -_2615;
    float _2635 = _2607 + _2633;
    float _2637 = exp2(_2514);
    float _2639 = as_type<float>(_2578) * _2631;
    int _2641 = _2566 * int(_2625);
    int _2643 = _2641 + _2576;
    float _2645 = trunc(_2639);
    float _2647 = precise::max(_2645, 0.0);
    uint _2649 = uint(_2647);
    float _2651 = float(uint(_2643));
    float _2653 = float(_2544);
    float _2655 = -_2637;
    float _2657 = _2655 + 1.0;
    float _2659 = as_type<float>(_2584) * _2651;
    float _2661 = float(_2506);
    int _2663 = ~_2522;
    int _2665 = _2663 + 1;
    float _2667 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2669 = _2653 >= _2661;
    bool _2671 = isnan(_2653);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan(_2661);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = trunc(_2659);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2605) + int(_2649);
    float _2689 = _2619 * _2661;
    int _2691 = ~_2506;
    int _2693 = _2691 + 1;
    float _2695 = _2661 * _1391;
    float _2697 = float(_2522);
    float _2699 = float(_2576);
    int _2701 = _2693 * _2687;
    int _2703 = _2701 + _2544;
    float _2705 = trunc(_2679);
    int _2707 = int(_2705);
    float _2709 = _2697 * _1391;
    bool _2711 = _2699 >= _2697;
    bool _2713 = isnan(_2699);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan(_2697);
    bool _2719 = _2715 || _2717;
    float _2721 = float(_2719);
    float _2723 = _2635 * _2697;
    bool _2725 = uint(_2703) >= uint(_2506);
    int _2727 = int(_2625) + int(_2685);
    float _2729 = trunc(_2689);
    int _2731 = int(_2729);
    bool _2733 = !_2725;
    int _2735 = _2733 ? 0 : (-1);
    int _2737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2739 = _2737 != 0;
    int _2741 = _2665 * _2727;
    int _2743 = _2741 + _2576;
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2747 = _2745 != 0;
    int _2749 = ~_2687;
    int _2751 = _2749 + _2735;
    int _2753 = _2751 + 1;
    float _2755 = trunc(_2695);
    int _2757 = int(_2755);
    bool _2759 = uint(_2743) >= uint(_2522);
    bool _2761 = !_2739;
    int _2763 = _2761 ? 0 : 1;
    int _2765 = _2506 * _2753;
    int _2767 = _2765 + _2544;
    bool _2769 = !_2747;
    int _2771 = _2769 ? 0 : 1;
    int _2773 = abs(_2763);
    float _2775 = trunc(_2721);
    int _2777 = int(_2775);
    bool _2779 = !_2759;
    int _2781 = _2779 ? 0 : (-1);
    bool _2783 = _2506 == 0;
    int _2785 = _2731 * _2773;
    int _2787 = _2785 + _2544;
    int _2789 = abs(_2771);
    int _2791 = ~_2727;
    int _2793 = _2791 + _2781;
    int _2795 = _2793 + 1;
    float _2797 = trunc(_2723);
    int _2799 = int(_2797);
    int _2801 = ~_2707;
    int _2803 = _2801 + 1;
    int _2805 = _2803 + 1;
    bool _2807 = !_2783;
    int _2809 = _2807 ? _2767 : (-1);
    int _2811 = _2522 * _2795;
    int _2813 = _2811 + _2576;
    int _2815 = _2522 + (-1);
    bool _2817 = _807 > 0.5;
    int _2819 = _2809 * _2805;
    int _2821 = _2506 + (-1);
    float _2823 = trunc(_2709);
    int _2825 = int(_2823);
    int _2827 = ~_2777;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    bool _2833 = !_2570;
    int _2835 = _2833 ? _2813 : (-1);
    int _2837 = _2707 * _2821;
    int _2839 = _2837 + _2819;
    int _2841 = abs(_1269);
    int _2843 = _2799 * _2789;
    int _2845 = _2843 + _2576;
    int _2847 = _2835 * _2831;
    int _2849 = abs(_1281);
    int _2851 = _2839 * _2516;
    int _2853 = _2777 * _2815;
    int _2855 = _2853 + _2847;
    bool _2857 = !_2596;
    int _2859 = _2857 ? 0 : 1;
    int _2861 = _2757 * _2841;
    int _2863 = _2861 + _2851;
    int _2865 = abs(_1759);
    int _2867 = _2855 * _2512;
    int _2869 = _2787 * _2849;
    int _2871 = _2869 + _2863;
    int _2873 = abs(_2859);
    int _2875 = _2825 * _2518;
    int _2877 = _2875 + _2867;
    int _2879 = ~_2522;
    int _2881 = _2879 + 1;
    int _2883 = _2731 * _2873;
    int _2885 = _2883 + _2871;
    int _2887 = _2845 * _2865;
    int _2889 = _2887 + _2877;
    int _2891 = ~_2506;
    int _2893 = _2891 + 1;
    float _2895 = float(uint(_2885));
    int _2897 = _2799 * _2524;
    int _2899 = _2897 + _2889;
    float _2901 = float(uint(_2845));
    int _2903 = ~_2506;
    int _2905 = _2903 + 1;
    float _2907 = as_type<float>(_2578) * _2895;
    float _2909 = float(uint(_2899));
    float _2911 = as_type<float>(_2584) * _2901;
    int _2913 = ~_2522;
    int _2915 = _2913 + 1;
    int _2917 = ~_2522;
    int _2919 = _2917 + 1;
    float _2921 = trunc(_2907);
    float _2923 = precise::max(_2921, 0.0);
    uint _2925 = uint(_2923);
    float _2927 = as_type<float>(_2584) * _2909;
    float _2929 = float(uint(_2787));
    float _2931 = as_type<float>(_2578) * _2929;
    float _2933 = trunc(_2927);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    int _2939 = _2893 * int(_2925);
    int _2941 = _2939 + _2885;
    float _2943 = trunc(_2931);
    float _2945 = precise::max(_2943, 0.0);
    uint _2947 = uint(_2945);
    float _2949 = float(uint(_2941));
    int _2951 = _2881 * int(_2937);
    int _2953 = _2951 + _2899;
    float _2955 = trunc(_2911);
    float _2957 = precise::max(_2955, 0.0);
    uint _2959 = uint(_2957);
    float _2961 = as_type<float>(_2578) * _2949;
    float _2963 = float(uint(_2953));
    float _2965 = trunc(_2961);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    float _2971 = as_type<float>(_2584) * _2963;
    int _2973 = _2905 * int(_2947);
    int _2975 = _2973 + _2787;
    float _2977 = float(uint(_2975));
    float _2979 = trunc(_2971);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    int _2985 = _2915 * int(_2959);
    int _2987 = _2985 + _2845;
    float _2989 = as_type<float>(_2578) * _2977;
    int _2991 = ~_2506;
    int _2993 = _2991 + 1;
    int _2995 = int(_2925) + int(_2969);
    float _2997 = trunc(_2989);
    float _2999 = precise::max(_2997, 0.0);
    uint _3001 = uint(_2999);
    int _3003 = _2993 * _2995;
    int _3005 = _3003 + _2885;
    int _3007 = int(_2937) + int(_2983);
    float _3009 = float(uint(_2987));
    bool _3011 = uint(_3005) >= uint(_2506);
    int _3013 = _2919 * _3007;
    int _3015 = _3013 + _2899;
    int _3017 = ~_2506;
    int _3019 = _3017 + 1;
    float _3021 = as_type<float>(_2584) * _3009;
    bool _3023 = !_3011;
    int _3025 = _3023 ? 0 : (-1);
    bool _3027 = uint(_3015) >= uint(_2522);
    int _3029 = ~_2995;
    int _3031 = _3029 + _3025;
    int _3033 = _3031 + 1;
    float _3035 = trunc(_3021);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    bool _3041 = !_3027;
    int _3043 = _3041 ? 0 : (-1);
    int _3045 = int(_2947) + int(_3001);
    int _3047 = _2506 * _3033;
    int _3049 = _3047 + _2885;
    int _3051 = ~_3007;
    int _3053 = _3051 + _3043;
    int _3055 = _3053 + 1;
    int _3057 = _3019 * _3045;
    int _3059 = _3057 + _2787;
    bool _3061 = !_2783;
    int _3063 = _3061 ? _3049 : (-1);
    int _3065 = _2522 * _3055;
    int _3067 = _3065 + _2899;
    int _3069 = _3063 >> 31;
    bool _3071 = !_2570;
    int _3073 = _3071 ? _3067 : (-1);
    bool _3075 = uint(_3059) >= uint(_2506);
    int _3077 = _3073 >> 31;
    int _3079 = _3063 & 3;
    bool _3081 = _3079 != 0;
    float _3083 = -_2479;
    float _3085 = _3083 + 1.0;
    int _3087 = _3077 & 3;
    float _3089 = _2667 * _2481;
    int _3091 = _3069 & 3;
    float _3093 = -_2667;
    float _3095 = _3093 + 1.0;
    bool _3097 = !_3075;
    int _3099 = _3097 ? 0 : (-1);
    int _3101 = _3063 & 3;
    bool _3103 = _3101 != 0;
    bool _3105 = _3079 != 3;
    int _3107 = _3073 + _3087;
    int _3109 = _3063 + _3091;
    int _3111 = _3103 ? 0 : 1;
    bool _3113 = uint(_3079) >= 2u;
    int _3115 = _3107 >> 2;
    bool _3117 = uint(_3079) > 1u;
    int _3119 = ~_3045;
    int _3121 = _3119 + _3099;
    int _3123 = _3121 + 1;
    int _3125 = _3109 >> 2;
    int _3127 = _3113 ? 0 : 1;
    int _3129 = _2506 * _3123;
    int _3131 = _3129 + _2787;
    int _3133 = _3115 << 4;
    int _3135 = _3133 + 512;
    int _3137 = _3125 << 4;
    int _3139 = _3137 + 368;
    int _3141 = ~_3127;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    uint _3147 = uint(int(uint(_3135) >> uint(2)));
    uint _3149 = uint(int(uint(int(_3147)) >> uint(2)));
    int _3151 = int(_3147) & 3;
    float _3153 = (*spvDescriptorSet0.vp_c9)._m0[int(_3149)][_3151];
    int _3155 = int(_3147) + 1;
    uint _3157 = uint(int(uint(_3155) >> uint(2)));
    int _3159 = _3155 & 3;
    float _3161 = (*spvDescriptorSet0.vp_c9)._m0[int(_3157)][_3159];
    int _3163 = _3145;
    if (_3105)
    {
        int _3165 = ~_3127;
        int _3167 = _3165 + 1;
        _3163 = _3167;
    }
    int _3169 = _3163;
    int _3171 = int(_2959) + int(_3039);
    int _3173 = ~_2522;
    int _3175 = _3173 + 1;
    int _3177 = ~_3111;
    int _3179 = _3177 + 1;
    int _3181 = _3179 + 1;
    uint _3183 = uint(int(uint(_3139) >> uint(2)));
    uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
    int _3187 = int(_3183) & 3;
    float _3189 = (*spvDescriptorSet0.vp_c9)._m0[int(_3185)][_3187];
    int _3191 = int(_3183) + 1;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    int _3195 = _3191 & 3;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[int(_3193)][_3195];
    int _3199 = _3181;
    if (!_3117)
    {
        int _3201 = ~_3111;
        int _3203 = _3201 + 1;
        _3199 = _3203;
    }
    int _3205 = _3199;
    int _3207 = _3175 * _3171;
    int _3209 = _3207 + _2845;
    int _3211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3213 = _3211 != 0;
    bool _3215 = !_2783;
    int _3217 = _3215 ? _3131 : (-1);
    int _3219 = _3073 & 3;
    bool _3221 = _3219 != 0;
    int _3223 = _3073 & 3;
    bool _3225 = _3223 != 0;
    bool _3227 = !_3081;
    int _3229 = _3227 ? 0 : 1;
    bool _3231 = !_3213;
    int _3233 = _3231 ? 0 : 1;
    int _3235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3237 = _3235 != 0;
    bool _3239 = _3079 != 3;
    bool _3241 = uint(_3209) >= uint(_2522);
    int _3243 = _3135 + 8;
    uint _3245 = uint(int(uint(_3243) >> uint(2)));
    uint _3247 = uint(int(uint(int(_3245)) >> uint(2)));
    int _3249 = int(_3245) & 3;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[int(_3247)][_3249];
    int _3253 = int(_3245) + 1;
    uint _3255 = uint(int(uint(_3253) >> uint(2)));
    int _3257 = _3253 & 3;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[int(_3255)][_3257];
    bool _3261 = !_3237;
    int _3263 = _3261 ? 0 : 1;
    bool _3265 = uint(_3223) > 1u;
    int _3267 = _3221 ? 0 : 1;
    bool _3269 = !_3239;
    int _3271 = _3269 ? 0 : (-1);
    int _3273 = _3139 + 8;
    uint _3275 = uint(int(uint(_3273) >> uint(2)));
    uint _3277 = uint(int(uint(int(_3275)) >> uint(2)));
    int _3279 = int(_3275) & 3;
    float _3281 = (*spvDescriptorSet0.vp_c9)._m0[int(_3277)][_3279];
    int _3283 = int(_3275) + 1;
    uint _3285 = uint(int(uint(_3283) >> uint(2)));
    int _3287 = _3283 & 3;
    float _3289 = (*spvDescriptorSet0.vp_c9)._m0[int(_3285)][_3287];
    bool _3291 = !_3225;
    int _3293 = _3291 ? 0 : 1;
    bool _3295 = uint(_3223) >= 2u;
    bool _3297 = _3223 != 3;
    bool _3299 = _3223 != 3;
    int _3301 = ~_3267;
    int _3303 = _3301 + 1;
    int _3305 = _3303 + 1;
    int _3307 = _3305;
    if (!_3265)
    {
        int _3309 = ~_3267;
        int _3311 = _3309 + 1;
        _3307 = _3311;
    }
    int _3313 = _3307;
    int _3315 = _3295 ? 0 : 1;
    bool _3317 = !_3297;
    int _3319 = _3317 ? 0 : (-1);
    int _3321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3323 = _3321 != 0;
    int _3325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3327 = _3325 != 0;
    int _3329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3331 = _3329 != 0;
    bool _3333 = !_3241;
    int _3335 = _3333 ? 0 : (-1);
    bool _3337 = _801 > 0.5;
    int _3339 = abs(_3205);
    int _3341 = ~_3171;
    int _3343 = _3341 + _3335;
    int _3345 = _3343 + 1;
    float _3347 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3349 = int(_3347);
    int _3351 = abs(_3313);
    int _3353 = ~_3315;
    int _3355 = _3353 + 1;
    int _3357 = _3355 + 1;
    int _3359 = _3357;
    if (_3299)
    {
        int _3361 = ~_3315;
        int _3363 = _3361 + 1;
        _3359 = _3363;
    }
    int _3365 = _3359;
    int _3367 = abs(_3229);
    int _3369 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3371 = _3369 != 0;
    int _3373 = abs(_3293);
    int _3375 = ~_3351;
    int _3377 = _3375 + 1;
    int _3379 = _3377 + 1;
    int _3381 = _2522 * _3345;
    int _3383 = _3381 + _2845;
    int _3385 = ~_3339;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    int _3391 = _3379 * as_type<int>(_3161);
    int _3393 = _3389 * as_type<int>(_3197);
    int _3395 = abs(_3169);
    float _3397 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3399 = int(_3397);
    int _3401 = abs(_3365);
    int _3403 = ~_3367;
    int _3405 = _3403 + 1;
    int _3407 = _3405 + 1;
    int _3409 = ~_3373;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = _3407 * as_type<int>(_3189);
    int _3417 = _3415 + _3393;
    int _3419 = _3413 * as_type<int>(_3153);
    int _3421 = _3419 + _3391;
    int _3423 = ~_3395;
    int _3425 = _3423 + 1;
    int _3427 = _3425 + 1;
    int _3429 = ~_3401;
    int _3431 = _3429 + 1;
    int _3433 = _3431 + 1;
    float _3435 = float(uint(_3349));
    int _3437 = _3427 * as_type<int>(_3281);
    int _3439 = _3437 + _3417;
    bool _3441 = !_2570;
    int _3443 = _3441 ? _3383 : (-1);
    int _3445 = _3433 * as_type<int>(_3251);
    int _3447 = _3445 + _3421;
    int _3449 = abs(_3271);
    float _3451 = abs(_2015);
    float _3453 = log2(_3451);
    int _3455 = abs(_3319);
    int _3457 = ~_3449;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    bool _3463 = _803 > 0.5;
    int _3465 = abs(_3349);
    float _3467 = 1.0 / _3435;
    float _3469 = float(uint(_3399));
    int _3471 = _3461 * as_type<int>(_3289);
    int _3473 = _3471 + _3439;
    int _3475 = ~_3455;
    int _3477 = _3475 + 1;
    int _3479 = _3477 + 1;
    int _3481 = abs(_3233);
    float _3483 = float(uint(_3465));
    float _3485 = 1.0 / _3469;
    int _3487 = abs(_3263);
    int _3489 = _3479 * as_type<int>(_3259);
    int _3491 = _3489 + _3447;
    int _3493 = ~_3481;
    int _3495 = _3493 + 1;
    int _3497 = _3495 + 1;
    float _3499 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3501 = ~_3487;
    int _3503 = _3501 + 1;
    int _3505 = _3503 + 1;
    float _3507 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3509 = abs(_3399);
    float _3511 = 1.0 / _3483;
    int _3513 = _3491 * _3497;
    float _3515 = -_191;
    int _3517 = _3337 ? as_type<int>(_3515) : as_type<int>(_191);
    int _3519 = _3473 * _3505;
    float _3521 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3523 = _805 > 0.5;
    int _3525 = _3443 * _3481;
    int _3527 = _3525 + _3513;
    int _3529 = as_type<int>(_3467) + (-2);
    int _3531 = _3217 * _3487;
    int _3533 = _3531 + _3519;
    float _3535 = exp2(_3499);
    float _3537 = float(uint(_3509));
    float _3539 = -_1567;
    float _3541 = fma(_3539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3507);
    float _3543 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3545 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3547 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3541);
    int _3549 = as_type<int>(_3511) + (-2);
    float _3551 = 1.0 / _3537;
    float _3553 = -_1567;
    float _3555 = fma(_3553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3521);
    float _3557 = float(uint(_3533));
    float _3559 = -_1567;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3543);
    int _3563 = ~_3399;
    int _3565 = _3563 + 1;
    float _3567 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3555);
    float _3569 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3545);
    float _3571 = as_type<float>(_3529) * _3557;
    int _3573 = as_type<int>(_3485) + (-2);
    float _3575 = fma(_3535, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = float(uint(_3527));
    float _3581 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3561);
    int _3583 = abs(_3533);
    float _3585 = trunc(_3571);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    int _3591 = ~_3349;
    int _3593 = _3591 + 1;
    float _3595 = as_type<float>(_3573) * _3579;
    float _3597 = float(uint(_3583));
    float _3599 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3601 = as_type<int>(_3551) + (-2);
    float _3603 = as_type<float>(_3549) * _3597;
    float _3605 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3607 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3609 = trunc(_3595);
    float _3611 = precise::max(_3609, 0.0);
    uint _3613 = uint(_3611);
    float _3615 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3599);
    float _3617 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3605);
    float _3619 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3607);
    float _3621 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3623 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3625 = ~_3465;
    int _3627 = _3625 + 1;
    float _3629 = trunc(_3603);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = abs(_3527);
    float _3637 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3621);
    float _3639 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3623);
    int _3641 = _3593 * int(_3589);
    int _3643 = _3641 + _3533;
    float _3645 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3615);
    int _3647 = _3565 * int(_3613);
    int _3649 = _3647 + _3527;
    float _3651 = float(uint(_3635));
    float _3653 = float(uint(_3643));
    float _3655 = float(uint(_3649));
    float _3657 = as_type<float>(_3601) * _3651;
    bool _3659 = !_3371;
    float _3661 = _3659 ? _191 : as_type<float>(_3517);
    int _3663 = _3627 * int(_3633);
    int _3665 = _3663 + _3583;
    float _3667 = as_type<float>(_3529) * _3653;
    float _3669 = as_type<float>(_3573) * _3655;
    float _3671 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3617);
    float _3673 = trunc(_3657);
    float _3675 = precise::max(_3673, 0.0);
    uint _3677 = uint(_3675);
    float _3679 = float(uint(_3665));
    float _3681 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3569);
    float _3683 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3619);
    int _3685 = ~_3509;
    int _3687 = _3685 + 1;
    float _3689 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3691 = as_type<float>(_3549) * _3679;
    float _3693 = -_191;
    int _3695 = _3523 ? as_type<int>(_3693) : as_type<int>(_191);
    float _3697 = trunc(_3667);
    float _3699 = precise::max(_3697, 0.0);
    uint _3701 = uint(_3699);
    float _3703 = -_201;
    int _3705 = _3463 ? as_type<int>(_3703) : as_type<int>(_201);
    out.m_70.x = _3671;
    out.m_70.y = _3681;
    out.m_70.z = _3683;
    bool _3707 = !_3331;
    float _3709 = _3707 ? _191 : as_type<float>(_3695);
    float _3711 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3713 = -_201;
    int _3715 = _2817 ? as_type<int>(_3713) : as_type<int>(_201);
    bool _3717 = !_3327;
    float _3719 = _3717 ? _201 : as_type<float>(_3705);
    int _3721 = _3687 * int(_3677);
    int _3723 = _3721 + _3635;
    float _3725 = trunc(_3669);
    float _3727 = precise::max(_3725, 0.0);
    uint _3729 = uint(_3727);
    bool _3731 = !_3323;
    float _3733 = _3731 ? _201 : as_type<float>(_3715);
    float _3735 = fma(_3577, -2.0, 3.0);
    float _3737 = _3577 * _3577;
    float _3739 = float(uint(_3723));
    float _3741 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3637);
    float _3743 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3639);
    float _3745 = _3689 * _3567;
    float _3747 = trunc(_3691);
    float _3749 = precise::max(_3747, 0.0);
    uint _3751 = uint(_3749);
    float _3753 = as_type<float>(_3601) * _3739;
    float _3755 = _3689 * _3581;
    float _3757 = _3737 * _3735;
    float _3759 = fma(_3711, _3671, _3745);
    int _3761 = ~_3349;
    int _3763 = _3761 + 1;
    float _3765 = fma(_3711, _3683, _3755);
    int _3767 = int(_3589) + int(_3701);
    float _3769 = trunc(_3753);
    float _3771 = precise::max(_3769, 0.0);
    uint _3773 = uint(_3771);
    float _3775 = _3689 * _3547;
    float _3777 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3779 = int(_3613) + int(_3729);
    int _3781 = _3763 * _3767;
    int _3783 = _3781 + _3533;
    int _3785 = ~_3399;
    int _3787 = _3785 + 1;
    float _3789 = fma(_3711, _3681, _3775);
    int _3791 = ~_3465;
    int _3793 = _3791 + 1;
    float _3795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3797 = int(_3633) + int(_3751);
    int _3799 = _3787 * _3779;
    int _3801 = _3799 + _3527;
    int _3803 = ~_3509;
    int _3805 = _3803 + 1;
    float _3807 = -_3757;
    float _3809 = _3807 + 1.0;
    bool _3811 = uint(_3783) >= uint(_3349);
    int _3813 = _3793 * _3797;
    int _3815 = _3813 + _3583;
    float _3817 = fma(_3809, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    int _3819 = int(_3677) + int(_3773);
    float _3821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3823 = uint(_3801) >= uint(_3399);
    float _3825 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3777);
    bool _3827 = !_3811;
    int _3829 = _3827 ? 0 : (-1);
    int _3831 = _3805 * _3819;
    int _3833 = _3831 + _3635;
    bool _3835 = uint(_3815) >= uint(_3465);
    float _3837 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3825);
    bool _3839 = !_3823;
    int _3841 = _3839 ? 0 : (-1);
    int _3843 = ~_3767;
    int _3845 = _3843 + _3829;
    int _3847 = _3845 + 1;
    int _3849 = _3533 ^ _3349;
    int _3851 = ~_3779;
    int _3853 = _3851 + _3841;
    int _3855 = _3853 + 1;
    int _3857 = _3349 * _3847;
    int _3859 = _3857 + _3533;
    bool _3861 = uint(_3833) >= uint(_3509);
    float _3863 = _3821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3865 = _3349 == 0;
    int _3867 = _3399 * _3855;
    int _3869 = _3867 + _3527;
    bool _3871 = _3349 == 0;
    int _3873 = _3527 ^ _3399;
    float _3875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3877 = !_3835;
    int _3879 = _3877 ? 0 : (-1);
    uint _3881 = uint(int(uint(_3849) >> uint(31)));
    bool _3883 = _3399 == 0;
    bool _3885 = _3399 == 0;
    bool _3887 = !_3861;
    int _3889 = _3887 ? 0 : (-1);
    uint _3891 = uint(int(uint(_3873) >> uint(31)));
    int _3893 = ~_3879;
    int _3895 = _3797 + _3893;
    int _3897 = _3895 + 1;
    float _3899 = fma(_3689, _3689, 1.0);
    int _3901 = ~int(_3881);
    int _3903 = _3901 + 1;
    float _3905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3907 = ~_3889;
    int _3909 = _3819 + _3907;
    int _3911 = _3909 + 1;
    int _3913 = ~int(_3891);
    int _3915 = _3913 + 1;
    bool _3917 = !_3865;
    int _3919 = _3917 ? _3859 : (-1);
    int _3921 = _3897 ^ _3903;
    float _3923 = rsqrt(_3899);
    int _3925 = _3911 ^ _3915;
    float _3927 = float(_3919);
    int _3929 = ~_3903;
    int _3931 = _3929 + _3921;
    int _3933 = _3931 + 1;
    bool _3935 = !_3883;
    int _3937 = _3935 ? _3869 : (-1);
    float _3939 = fma(_3863, _3927, _1375);
    int _3941 = ~_3915;
    int _3943 = _3941 + _3925;
    int _3945 = _3943 + 1;
    float _3947 = _3875 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3949 = float(_3937);
    float _3951 = _3661 + 0.5;
    bool _3953 = !_3871;
    int _3955 = _3953 ? _3933 : (-1);
    float _3957 = _3795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3959 = _2015 <= 8000.0;
    bool _3961 = isnan(_2015);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan(8000.0);
    bool _3967 = _3963 || _3965;
    float _3969 = float(_3967);
    float _3971 = fma(_3863, _3951, _3939);
    float _3973 = float(_3955);
    float _3975 = fma(_3947, _3949, _1383);
    float _3977 = _3709 + 0.5;
    bool _3979 = !_3885;
    int _3981 = _3979 ? _3945 : (-1);
    float _3983 = _3905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3985 = -_919;
    float _3987 = fma(_3957, _3973, _3985);
    float _3989 = fma(_3947, _3977, _3975);
    float _3991 = _3689 * _3923;
    float _3993 = float(_3981);
    float _3995 = _3719 + (-0.5);
    float _3997 = _3969 * _3817;
    float _3999 = -_3743;
    float _4001 = _3991 * _3999;
    float _4003 = _2502 * _3089;
    float _4005 = -_3957;
    float _4007 = fma(_4005, _3995, _3987);
    float _4009 = -_1399;
    float _4011 = fma(_3983, _3993, _4009);
    float _4013 = -_3645;
    float _4015 = _3991 * _4013;
    float _4017 = -_3741;
    float _4019 = _3991 * _4017;
    float _4021 = fma(_3923, _3581, _4001);
    float _4023 = fma(_3719, _2528, _4007);
    float _4025 = _3733 + (-0.5);
    float _4027 = in.m_72.x;
    float _4029 = fma(_3923, _3547, _4019);
    float _4031 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4033 = -_3983;
    float _4035 = fma(_4033, _4025, _4011);
    float _4037 = fma(_3923, _3567, _4015);
    float _4039 = -_1395;
    float _4041 = _4039 + 1.0;
    float _4043 = _3085 * _4031;
    float _4045 = precise::clamp(_4043, 0.0, 1.0);
    float _4047 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3837);
    float _4049 = -_1389;
    float _4051 = _4049 + 1.0;
    out.m_74.x = _4037;
    out.m_74.y = _4029;
    out.m_74.z = _4021;
    float _4053 = -_4041;
    float _4055 = fma(_3661, _4053, _3971);
    float _4057 = _4047 + _2391;
    float _4059 = fma(_3733, _2532, _4035);
    float _4061 = -_4051;
    float _4063 = fma(_3709, _4061, _3989);
    float _4065 = _3645 + _3759;
    float _4067 = _4057 * 0.5;
    float _4069 = _3741 + _3789;
    float _4071 = _3743 + _3765;
    float _4073 = fma(_2492, _4003, _2490);
    out.m_76.x = _4055;
    out.m_76.y = _4023;
    out.m_76.z = _4063;
    out.m_76.w = _4059;
    float _4075 = _2492 * _3089;
    bool _4077 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4079 = isnan(_2169);
    bool _4081 = _4077 || _4079;
    bool _4083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4085 = _4081 || _4083;
    out.m_78.z = _4067;
    out.m_78.w = _2391;
    float _4087 = -_4045;
    float _4089 = fma(_4087, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4091 = fma(_2498, _4075, _2486);
    float _4093 = fma(_2500, _4075, _2488);
    out.m_80.x = _4065;
    out.m_80.y = _4069;
    out.m_80.z = _4071;
    float _4095 = _4089 * _4027;
    float _4097 = _2492 * _3095;
    out.gl_Position.x = _2447;
    out.gl_Position.y = _2465;
    out.gl_Position.z = _4047;
    out.gl_Position.w = _2391;
    float _4099 = _4095 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4101 = _4057;
    float _4103 = _4021;
    float _4105 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4107 = _4075;
    float _4109 = _2447;
    if (!_4085)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4111 = _2536;
    out.m_82.x = _4091;
    out.m_82.y = _4093;
    out.m_82.z = _4073;
    out.m_82.w = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4085)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4117 = _4101;
    float _4119 = _4117;
    float _4121 = _4117;
    if (!_4085)
    {
        _4103 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4123 = _4103;
    out.m_84.x = _4099;
    float _4125 = _4123;
    float _4127 = _4123;
    if (!_4085)
    {
        _4105 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4129 = _4105;
    float _4131 = _4129;
    float _4133 = _4129;
    if (!_4085)
    {
        _4107 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4135 = _4107;
    float _4137 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4139 = _4135;
    float _4141 = _4135;
    if (!_4085)
    {
        _4109 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4143 = _4109;
    bool _4145 = !_4085;
    float _4147 = _4143;
    float _4149 = _4143;
    if (!_4145)
    {
        bool _4151 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4153 = isnan(_2169);
        bool _4155 = _4151 || _4153;
        bool _4157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4159 = _4155 || _4157;
        if (!_4159)
        {
            float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4163 = _2169 + _4161;
            float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4165;
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4173 = 1.0 / _4167;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4191 = _4163 * _4173;
            float _4193 = precise::clamp(_4191, 0.0, 1.0);
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4199 = fma(_4193, _4171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4201 = fma(_4193, _4197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4203 = fma(_4193, _4177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4205 = fma(_4193, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4207 = fma(_4193, _4185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4209 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4149 = _4203;
            _4133 = _4207;
            _4115 = _4199;
            _4127 = _4205;
            _4121 = _4201;
            _4141 = _4209;
            _4211 = true;
        }
        else
        {
            bool _4213 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4215 = isnan(_2169);
            bool _4217 = _4213 || _4215;
            bool _4219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4221 = _4217 || _4219;
            if (!_4221)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4223 = _4113;
            _4115 = _4223;
            if (!_4221)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4225 = _4147;
            _4149 = _4225;
            if (!_4221)
            {
                _4119 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4227 = _4119;
            _4121 = _4227;
            if (!_4221)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4229 = _4125;
            _4127 = _4229;
            if (!_4221)
            {
                _4131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4231 = _4131;
            _4133 = _4231;
            if (!_4221)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4233 = _4139;
            bool _4235 = !_4221;
            _4141 = _4233;
            if (!_4235)
            {
                bool _4237 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4239 = isnan(_2169);
                bool _4241 = _4237 || _4239;
                bool _4243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4245 = _4241 || _4243;
                if (!_4245)
                {
                    float _4247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4249 = _2169 + _4247;
                    float _4251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4251;
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4257 = _4255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4259 = 1.0 / _4253;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4277 = _4249 * _4259;
                    float _4279 = precise::clamp(_4277, 0.0, 1.0);
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4285 = fma(_4279, _4257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4287 = fma(_4279, _4283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4289 = fma(_4279, _4263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4291 = fma(_4279, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4293 = fma(_4279, _4271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4295 = fma(_4279, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4149 = _4289;
                    _4133 = _4293;
                    _4115 = _4285;
                    _4127 = _4291;
                    _4121 = _4287;
                    _4141 = _4295;
                    _4211 = true;
                }
                else
                {
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4121 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4211 = false;
    float _4297 = _4149;
    float _4299 = _4133;
    float _4301 = _4115;
    float _4303 = _4127;
    float _4305 = _4121;
    float _4307 = _4141;
    float _4309 = fma(_4069, -0.5, 0.5);
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = -_4297;
    float _4315 = _4313 + _4299;
    float _4317 = _4137 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4319 = -_4301;
    float _4321 = _4319 + _4303;
    float _4323 = fma(_4311, _4315, _4297);
    out.m_86.x = 0.0;
    float _4325 = -_4305;
    float _4327 = _4325 + _4307;
    float _4329 = fma(_4311, _4321, _4301);
    float _4331 = _4323 * 0.586610972881317138671875;
    out.m_49.x = _4317;
    bool _4333 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4335 = fma(_4311, _4327, _4305);
    float _4337 = fma(_4329, 0.298911988735198974609375, _4331);
    bool _4339 = _2143 > 0.0;
    bool _4341 = isnan(_2143);
    bool _4343 = _4339 || _4341;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    float _4349 = fma(_4335, 0.114477999508380889892578125, _4337);
    float _4351 = -_4349;
    float _4353 = _4329 + _4351;
    float _4355 = -_4349;
    float _4357 = _4323 + _4355;
    float _4359 = -_4349;
    float _4361 = _4335 + _4359;
    float _4363 = fma(_4353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    float _4365 = fma(_4357, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    float _4367 = fma(_4361, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    bool _4369 = !_4333;
    if (!_4369)
    {
        float _4371 = -_2081;
        float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4375 = -_2083;
        float _4377 = _4375 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4379 = -_2085;
        float _4381 = _4379 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4383 = _4373 * _4373;
        float _4385 = fma(_4377, _4377, _4383);
        float _4387 = fma(_4381, _4381, _4385);
        float _4389 = sqrt(_4387);
        float _4391 = rsqrt(_4387);
        float _4393 = -_4389;
        float _4395 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4397 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4399 = precise::clamp(_4397, 0.0, 1.0);
        float _4401 = _4377 * _4391;
        float _4403 = _4373 * _4391;
        float _4405 = abs(_4399);
        float _4407 = log2(_4405);
        float _4409 = _4381 * _4391;
        float _4411 = _4401 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4413 = _4069 * _4403;
        float _4415 = -_4403;
        float _4417 = -_4411;
        float _4419 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4417);
        float _4421 = fma(_4065, _4401, _4413);
        float _4423 = -_4409;
        float _4425 = fma(_4423, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4419);
        float _4427 = fma(_4071, _4409, _4421);
        float _4429 = precise::clamp(_4427, 0.0, 1.0);
        float _4431 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4433 = _4425 + _4431;
        float _4435 = _4407 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4437 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4439 = precise::clamp(_4437, 0.0, 1.0);
        float _4441 = exp2(_4435);
        float _4443 = _4441 * _4439;
        float _4445 = _4429 * _4443;
        float _4447 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4449 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4451 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _4447;
        out.m_86.y = _4449;
        out.m_86.z = _4451;
    }
    out.m_88.x = _4363;
    out.m_88.y = _4365;
    out.m_88.z = _4367;
    if (_4347)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _4453 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4453;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4211 = false;
    bool _791 = false;
    bool _611 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4512 = as_type<float>(_125);
        out.gl_Position.z = _4512;
    }
    if (!_111)
    {
        return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4582 = as_type<float>(_163);
        out.gl_Position.z = _4582;
    }
    if (_155)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _227;
    if (!_209)
    {
        float _211 = in.m_58.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_107);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
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
    bool _263 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_237);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _257;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = 1.0 / _253;
    float _281 = 1.0 / _261;
    float _283 = _249 * _275;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _241 * _279;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_273;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = _245 * _281;
    bool _323 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_237);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _333 * _337;
    float _353 = -_333;
    float _355 = _353 + 1.0;
    float _357 = fma(_341, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = _295 * _355;
    float _363 = -_295;
    float _365 = _363 + 1.0;
    float _367 = fma(_319, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = _357 * _361;
    float _371 = _359 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = fma(_349, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _385 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _387 = fma(_375, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_381, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_367, _351, _383);
    float _393 = fma(_377, _351, _385);
    float _395 = fma(_387, _315, _391);
    float _397 = fma(_389, _315, _393);
    float _399 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_277;
    float _421;
    if (!_403)
    {
        float _405 = in.m_58.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_107);
        float _427 = 1.0 / _425;
        float _429 = _143 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_60.x;
    float _435 = in.m_60.y;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _445 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = isnan(_431);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _461 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _463 = isnan(_431);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _439;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = -_455;
    float _481 = _479 + 1.0;
    bool _483 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_431);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _497 = 1.0 / _443;
    float _499 = _401 * _435;
    float _501 = _399 * _433;
    float _503 = 1.0 / _459;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _509 = _477 * _473;
    float _511 = _471 * _481;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _431 + _513;
    float _517 = -_471;
    float _519 = _517 + 1.0;
    float _521 = fma(_509, _515, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _523 = _493 * _519;
    float _525 = _507 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = _431 + _527;
    bool _531 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _533 = isnan(_431);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _543;
    float _547 = _521 * _523;
    float _549 = -_493;
    float _551 = _549 + 1.0;
    float _553 = fma(_525, _529, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _555 = _545 * _503;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _431 + _561;
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[115].x, _547);
    float _567 = _455 * _559;
    float _569 = fma(_555, _563, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _571 = fma(_553, _511, _565);
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _575 = fma(_569, _567, _571);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _579 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _583 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[118].x, _575);
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _591 = !_495;
    float _609;
    if (!_591)
    {
        float _593 = in.m_58.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_107);
        float _615 = 1.0 / _613;
        float _617 = _143 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _623 = _619 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _629 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _631 = isnan(_619);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _649 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _627;
    float _663 = -_639;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _667;
    bool _671 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_619);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _659 * _665;
    float _685 = -_659;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _691 = 1.0 / _643;
    float _693 = _681 * _687;
    float _695 = -_681;
    float _697 = _695 + 1.0;
    float _699 = 1.0 / _647;
    float _701 = _669 * _661;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _707 = fma(_701, _623, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _709 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _711 = isnan(_619);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _705 * _691;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _729 = _619 + _727;
    float _731 = _707 * _693;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _739 = _619 + _737;
    float _741 = fma(_721, _729, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _743 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[131].x, _731);
    float _745 = _725 * _699;
    float _747 = _639 * _735;
    float _749 = fma(_741, _683, _743);
    float _751 = fma(_745, _739, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _753 = fma(_751, _747, _749);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[134].x, _753);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _761 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _771 = !_689;
    float _789;
    if (!_771)
    {
        float _773 = in.m_58.x;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _777 = _773 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[14].x, _143);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_107);
        float _795 = 1.0 / _793;
        float _797 = _143 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = in.m_58.z;
    float _807 = in.m_58.w;
    float _809 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _811 = log2(_809);
    float _813 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _823 = 1.0 / _817;
    float _825 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = 1.0 / _821;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _837 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = 1.0 / _831;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _845 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _845);
    float _853 = 1.0 / _835;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _855;
    float _859 = fma(_837, -2.0, _849);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _865 = _857 * _823;
    float _867 = _803 * 2.0;
    float _869 = 1.0 / _843;
    float _871 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _873 = _863 * _827;
    float _875 = -_847;
    float _877 = fma(_871, 2.0, _875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _883 = floor(_867);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _889 = _801 * 2.0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _899 = _811 * _143;
    float _901 = floor(_889);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _903;
    float _907 = _897 * _839;
    float _909 = _893 * _853;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _919 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _859);
    float _921 = 1.0 / _887;
    float _923 = _805 * 2.0;
    bool _925 = _883 >= 0.0;
    bool _927 = isnan(_883);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = _913 * _869;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _939 = _799 + _937;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _943 = _901 >= 0.0;
    bool _945 = isnan(_901);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = _801 + _803;
    bool _955 = _901 > 0.0;
    float _957 = floor(_923);
    bool _959 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _961 = isnan(_799);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _953 + (-1.0);
    float _973 = fma(_909, _939, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _975 = _905 * _921;
    float _977 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _979 = _805 + _803;
    float _981 = 1.0 / _881;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _985 = _979 + (-1.0);
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _989 = _951 ? 0 : 1;
    float _991 = _805 + _801;
    bool _993 = _883 > 0.0;
    float _995 = -_969;
    float _997 = _995 + 1.0;
    int _999 = ~_989;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    float _1005 = _991 + (-1.0);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1009 = _1007 != 0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1017 = _1015 != 0;
    float _1019 = exp2(_899);
    int _1021 = _1003;
    int _1023 = as_type<int>(_921);
    float _1025 = _865;
    if (!_955)
    {
        int _1027 = ~_989;
        int _1029 = _1027 + 1;
        _1021 = _1029;
    }
    int _1031 = _1021;
    float _1033 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1035 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1037 = isnan(_799);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _917 * _981;
    bool _1049 = !_1013;
    int _1051 = _1049 ? 0 : 1;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1055 = _1053 != 0;
    float _1057 = _1045 * _997;
    bool _1059 = _957 > 0.0;
    float _1061 = -_1045;
    float _1063 = _1061 + 1.0;
    bool _1065 = _957 >= 0.0;
    bool _1067 = isnan(_957);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    bool _1075 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1077 = isnan(_799);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -_1019;
    float _1089 = _1087 + 1.0;
    bool _1091 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1093 = isnan(_799);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1085 * _1063;
    float _1105 = -_1085;
    float _1107 = _1105 + 1.0;
    if (_1055)
    {
        _1023 = 0;
    }
    int _1109 = _1023;
    float _1111 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    int _1113 = _1109;
    if (!_1055)
    {
        _1113 = 1;
    }
    int _1115 = _1113;
    float _1117 = -_1101;
    float _1119 = _1117 + 1.0;
    int _1121 = _1073 ? 0 : 1;
    float _1123 = _1101 * _1107;
    bool _1125 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1127 = isnan(_799);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = sqrt(_1111);
    bool _1139 = _1115 != 1;
    bool _1141 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1143 = isnan(_799);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = _1135 * _1119;
    bool _1155 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1157 = isnan(_799);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -_1135;
    float _1169 = _1167 + 1.0;
    bool _1171 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1173 = isnan(_799);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = -_1151;
    float _1185 = _1183 + 1.0;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1189 = _799 + _1187;
    float _1191 = -_1165;
    float _1193 = _1191 + 1.0;
    float _1195 = _1151 * _1169;
    float _1197 = _1165 * _1185;
    float _1199 = fma(_865, _1189, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1201 = _1181 * _1193;
    float _1203 = _1199;
    if (!_1139)
    {
        _1025 = _803;
    }
    float _1205 = _1025;
    float _1207 = -_1181;
    float _1209 = _1207 + 1.0;
    float _1211 = _1205;
    if (_1139)
    {
        _1211 = _801;
    }
    float _1213 = _1211;
    float _1215 = _1199 * _1201;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1219 = _799 + _1217;
    int _1221 = ~_1121;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    float _1227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1229 = int(_1227);
    float _1231 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1215);
    float _1233 = float(_107);
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[83].z, _983);
    int _1237 = _1225;
    float _1239 = _1213;
    if (!_1059)
    {
        int _1241 = ~_1121;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    float _1247 = fma(_873, _1219, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1139)
    {
        _115 = _805;
    }
    float _1249 = _115;
    float _1251 = _1137 * 50.0;
    float _1253 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1255 = int(_1253);
    float _1257 = _1249;
    if (!_1139)
    {
        _1203 = _803;
    }
    float _1259 = _1203;
    float _1261 = fma(_1247, _1197, _1231);
    float _1263 = _1259;
    if (!_1139)
    {
        _1239 = _805;
    }
    float _1265 = _1239;
    bool _1267 = !_1009;
    int _1269 = _1267 ? 0 : 1;
    float _1271 = fma(_973, _1195, _1261);
    float _1273 = _1265;
    if (_1139)
    {
        _1257 = _803;
    }
    float _1275 = _1257;
    float _1277 = 1.0 / _1233;
    bool _1279 = !_1017;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[83].w, _941);
    if (_1139)
    {
        _1263 = _801;
    }
    float _1285 = _1263;
    if (_1139)
    {
        _1273 = _803;
    }
    float _1287 = _1273;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1293 = _1291 != 0;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1301 = _1299 != 0;
    float _1303 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1307 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1309 = isnan(0.0);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1315 = _1311 || _1313;
    float _1317 = -_1289;
    float _1319 = fma(_1303, 2.0, _1317);
    bool _1321 = !_1293;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1327 = _1315 ? _1089 : 0.0;
    int _1329 = abs(_1323);
    float _1331 = fma(_1305, -2.0, _1325);
    float _1333 = float(_1229);
    float _1335 = in.m_62.x;
    float _1337 = in.m_62.y;
    float _1339 = in.m_62.z;
    float _1341 = float(_1255);
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1355 = 1.0 + _1353;
    float _1357 = 1.0 / _1333;
    float _1359 = float(_1329);
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1363 = float(_1245);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1367 = 1.0 / _1341;
    float _1369 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1361);
    float _1371 = _1359 * _1363;
    float _1373 = -_143;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _877);
    float _1377 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1365);
    float _1379 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1369);
    float _1381 = -_143;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1319);
    float _1385 = _1371 * (-2.0);
    float _1387 = 1.0 / _1355;
    float _1389 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1235);
    float _1391 = _1277 * _143;
    float _1393 = _1357 * _143;
    float _1395 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1377);
    float _1397 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1283);
    float _1399 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1331);
    float _1401 = _801 + (-0.5);
    float _1403 = _1367 * _143;
    bool _1405 = !_1297;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = _933 ? 0 : 1;
    int _1411 = abs(_1407);
    float _1413 = fma(_1385, _1335, _1335);
    int _1415 = ~_1409;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    int _1421 = _1419;
    float _1423 = _1277;
    float _1425 = _1403;
    if (_1351)
    {
        float _1427 = _1327 * _1387;
        _145 = _1427;
    }
    float _1429 = _145;
    float _1431 = float(_1031);
    float _1433 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1413);
    float _1435 = float(_1411);
    float _1437 = fma(_977, _1385, _977);
    bool _1439 = !_1301;
    int _1441 = _1439 ? 0 : 1;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1445 = _799 + _1443;
    if (!_993)
    {
        int _1447 = ~_1409;
        int _1449 = _1447 + 1;
        _1421 = _1449;
    }
    int _1451 = _1421;
    float _1453 = _1435 * _1431;
    float _1455 = fma(_1437, _1429, _1433);
    int _1457 = abs(_1441);
    float _1459 = _803 + (-0.5);
    float _1461 = _1453 * (-2.0);
    float _1463 = float(_1451);
    float _1465 = fma(_907, _1445, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1467 = float(_1457);
    float _1469 = fma(_1461, _1337, _1337);
    float _1471 = fma(_987, _1461, _987);
    float _1473 = fma(_1465, _1153, _1271);
    float _1475 = _1455 * 0.15915493667125701904296875;
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1469);
    float _1479 = _1467 * _1463;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1483 = _799 + _1481;
    float _1485 = _1475 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = fma(_1471, _1429, _1477);
    float _1491 = _1479 * (-2.0);
    float _1493 = fma(_935, _1483, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1495 = _1489 * 0.15915493667125701904296875;
    float _1497 = fma(_1491, _1339, _1339);
    float _1499 = _805 + (-0.5);
    float _1501 = fma(_1033, _1491, _1033);
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1505 = _799 + _1503;
    float _1507 = fma(_1493, _1123, _1473);
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1497);
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1513 = _799 + _1511;
    float _1515 = fma(_1047, _1505, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1517 = _1475 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = fma(_1501, _1429, _1509);
    float _1523 = fma(_975, _1513, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1525 = fma(_1515, _1103, _1507);
    float _1527 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1529 = _1521 * 0.15915493667125701904296875;
    float _1531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1533 = fma(_1523, _1057, _1525);
    float _1535 = _1495 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = _813 * _1527;
    float _1541 = _825 * _1531;
    float _1543 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1533);
    float _1545 = in.m_46.x;
    float _1547 = in.m_46.y;
    float _1549 = in.m_46.z;
    float _1551 = _1543 * _1251;
    float _1553 = _1495 * 6.283185482025146484375;
    float _1555 = cos(_1553);
    float _1557 = _1529 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1487 * _1537;
    float _1563 = _1519 * _1537;
    float _1565 = _1529 * 6.283185482025146484375;
    float _1567 = sin(_1565);
    float _1569 = _1519 * _1555;
    float _1571 = _1487 * _1555;
    float _1573 = _1519 * _1559;
    float _1575 = _1487 * _1559;
    float _1577 = _1555 * _1559;
    float _1579 = _1537 * _1559;
    float _1581 = _1575 * _1541;
    float _1583 = fma(_1567, _1569, _1561);
    float _1585 = fma(_1567, _1561, _1569);
    float _1587 = _1573 * _1541;
    float _1589 = -_1563;
    float _1591 = fma(_1567, _1571, _1589);
    float _1593 = -_1571;
    float _1595 = fma(_1567, _1563, _1593);
    float _1597 = -_1541;
    float _1599 = _1567 * _1597;
    float _1601 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1603 = fma(_1583, _1539, _1587);
    float _1605 = fma(_1591, _1539, _1581);
    float _1607 = fma(_1577, _1539, _1599);
    float _1609 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1611 = fma(_1595, _1601, _1603);
    float _1613 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1615 = fma(_1579, _1601, _1607);
    float _1617 = fma(_1585, _1601, _1605);
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1621 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1623 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1613);
    float _1625 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1627 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1619);
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1621);
    float _1631 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1609);
    float _1633 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1623);
    float _1635 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1627);
    float _1637 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1625);
    float _1639 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1629);
    float _1641 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1631);
    float _1643 = _1633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1645 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1647 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1637);
    float _1649 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1653 = _1643 + _1645;
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1657 = _1649 * _1649;
    float _1659 = _1651 + _1649;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1653 + _1661;
    float _1665 = _1645 * _1645;
    float _1667 = fma(_1655, _1655, _1657);
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1659 + _1669;
    float _1673 = _1663 * _1663;
    float _1675 = _1551 * _1551;
    float _1677 = _1665 + _1667;
    float _1679 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1681 = fma(_1671, _1671, _1673);
    float _1683 = rsqrt(_1675);
    float _1685 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1679);
    float _1687 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1685);
    float _1689 = rsqrt(_1677);
    float _1691 = sqrt(_1681);
    float _1693 = _1551 * _1683;
    float _1695 = _1687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1697 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1699 = sqrt(_1675);
    float _1701 = _1655 * _1689;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1697);
    float _1705 = _1693 * _1701;
    float _1707 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    bool _1709 = _1691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1711 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1715 = _1713 != 0;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1727 = _1725 != 0;
    float _1729 = _1705 * _1699;
    bool _1731 = !_1719;
    int _1733 = _1731 ? 0 : 1;
    bool _1735 = !_1715;
    int _1737 = _1735 ? 0 : 1;
    float _1739 = fma(_1693, _1729, _1655);
    float _1741 = _1699;
    float _1743 = _1655;
    float _1745 = _1739;
    float _1747 = _1677;
    float _1749 = _1707;
    float _1751 = _1697;
    float _1753 = _1549;
    if (!_1709)
    {
        _1741 = _1657;
    }
    float _1755 = _1741;
    bool _1757 = !_1723;
    int _1759 = _1757 ? 0 : 1;
    float _1761 = _1695 + _1739;
    bool _1763 = !_1727;
    int _1765 = _1763 ? 0 : 1;
    float _1767 = _1755;
    if (!_1709)
    {
        _1743 = _1665;
    }
    float _1769 = _1743;
    float _1771 = _1769;
    if (!_1709)
    {
        _1745 = _1645;
    }
    float _1773 = _1745;
    float _1775 = _1773;
    if (!_1709)
    {
        _1747 = _1649;
    }
    float _1777 = _1747;
    float _1779 = _1777;
    if (!_1709)
    {
        _1749 = _1659;
    }
    float _1781 = _1749;
    float _1783 = _1781;
    if (!_1709)
    {
        _1751 = _1653;
    }
    float _1785 = _1751;
    float _1787 = _1785;
    if (!_1709)
    {
        _1753 = _1761;
    }
    float _1789 = _1753;
    bool _1791 = !_1709;
    float _1793 = _1789;
    if (!_1791)
    {
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1799 = _1691 + _1797;
        float _1801 = rsqrt(_1681);
        float _1803 = _1799 * _1795;
        float _1805 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1807 = _1803 * 0.15915493667125701904296875;
        float _1809 = _1807 * 6.283185482025146484375;
        float _1811 = sin(_1809);
        float _1813 = _1807 * 6.283185482025146484375;
        float _1815 = cos(_1813);
        float _1817 = fma(_1811, _1805, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1819 = _1801 * _1817;
        float _1821 = fma(_1671, _1819, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1823 = _1815 + (-1.0);
        float _1825 = fma(_1663, _1819, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1827 = -_1651;
        float _1829 = _1827 + _1821;
        float _1831 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1833 = -_1643;
        float _1835 = _1833 + _1825;
        float _1837 = _1829 * _1829;
        float _1839 = fma(_1761, _1815, _1831);
        float _1841 = _1835 * _1835;
        _1793 = _1839;
        _1767 = _1837;
        _1771 = _1841;
        _1783 = _1821;
        _1787 = _1825;
        _1779 = _1829;
        _1775 = _1835;
    }
    float _1843 = _1793;
    float _1845 = _1767;
    float _1847 = _1771;
    float _1849 = _1783;
    float _1851 = _1787;
    float _1853 = _1779;
    float _1855 = _1775;
    float _1857 = -_1695;
    float _1859 = _1857 + _1843;
    float _1861 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1863 = 1.0 / _1711;
    float _1865 = fma(_1859, _1859, _1845);
    float _1867 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1861);
    bool _1869 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1871 = isnan(0.5);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1877 = _1873 || _1875;
    float _1879 = _1865 + _1847;
    float _1881 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1867);
    float _1883 = sqrt(_1879);
    float _1885 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    float _1897 = _1885 + _1711;
    float _1899 = _1897 * _1863;
    float _1901 = _1899 * 0.5;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1903);
    bool _1907 = _1883 > 0.0;
    float _1909 = 1.0 / _1905;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1913 = _1883;
    float _1915 = _1901;
    float _1917 = _1855;
    float _1919 = _1851;
    float _1921 = _1849;
    float _1923 = _1843;
    if (!_1907)
    {
        _1911 = _1849;
    }
    float _1925 = _1911;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1907)
    {
        _1913 = _1843;
    }
    float _1931 = _1913;
    float _1933 = _1931;
    if (!_1907)
    {
        _1915 = _1851;
    }
    float _1935 = _1915;
    bool _1937 = !_1907;
    float _1939 = _1935;
    if (!_1937)
    {
        float _1941 = _205 * _205;
        float _1943 = fma(_203, _203, _1941);
        float _1945 = fma(_207, _207, _1943);
        float _1947 = rsqrt(_1879);
        float _1949 = sqrt(_1945);
        float _1951 = _1947 * _1853;
        float _1953 = _1859 * _1947;
        float _1955 = _1947 * _1855;
        bool _1957 = _1949 > 0.0;
        float _1959 = _1947;
        float _1961 = _1949;
        _1917 = _1955;
        if (!_1957)
        {
            _1927 = _1849;
        }
        float _1963 = _1927;
        _1929 = _1963;
        if (!_1957)
        {
            _1959 = _1843;
        }
        float _1965 = _1959;
        _1933 = _1965;
        if (!_1957)
        {
            _1961 = _1851;
        }
        float _1967 = _1961;
        bool _1969 = !_1957;
        _1939 = _1967;
        if (!_1969)
        {
            float _1971 = rsqrt(_1945);
            float _1973 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1975 = _205 * _1971;
            float _1977 = _203 * _1971;
            float _1979 = _207 * _1971;
            float _1981 = _1953 * _1975;
            float _1983 = fma(_1951, _1977, _1981);
            float _1985 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1987 = fma(_1955, _1979, _1983);
            float _1989 = _1987 * _1985;
            float _1991 = fma(_203, _1989, _1849);
            float _1993 = fma(_205, _1989, _1843);
            float _1995 = fma(_207, _1989, _1851);
            _1929 = _1991;
            _1933 = _1993;
            _1939 = _1995;
        }
    }
    float _1997 = _1929;
    float _1999 = _1933;
    float _2001 = _1939;
    float _2003 = _1917;
    float _2005 = _2003;
    float _2007 = _2001;
    float _2009 = _1997;
    if (_1895)
    {
        _2005 = 1.0;
    }
    float _2011 = _2005;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = _1909 * _2013;
    float _2017 = _2011;
    if (_1877)
    {
        _1919 = _1997;
    }
    float _2019 = _1919;
    float _2021 = _2019;
    if (_1877)
    {
        _1921 = _1999;
    }
    float _2023 = _1921;
    float _2025 = _2023;
    if (_1877)
    {
        _1923 = _2001;
    }
    float _2027 = _1923;
    float _2029 = _2027;
    if (!_1877)
    {
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2033 = _1695 + _2031;
        float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2037 = _1651 + _2035;
        float _2039 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2041 = -_1695;
        float _2043 = _2041 + _1999;
        float _2045 = _2033 * _2033;
        float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2049 = _1643 + _2047;
        float _2051 = -_1643;
        float _2053 = _2051 + _2001;
        float _2055 = fma(_2037, _2037, _2045);
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2059 = fma(_2049, _2049, _2055);
        float _2061 = sqrt(_2059);
        float _2063 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = precise::min(_2061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2067 = _2065 * _2057;
        float _2069 = _2063 * _2067;
        float _2071 = -_1651;
        float _2073 = _2071 + _1997;
        float _2075 = fma(_2043, _2069, _1695);
        float _2077 = fma(_2073, _2069, _1651);
        float _2079 = fma(_2053, _2069, _1643);
        _2025 = _2075;
        _2021 = _2077;
        _2029 = _2079;
        _2007 = _2053;
    }
    float _2081 = _2025;
    float _2083 = _2021;
    float _2085 = _2029;
    float _2087 = _2007;
    float _2089 = _2087;
    if (!_1895)
    {
        float _2091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2097 = _2093 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        float _2101 = _2095 * 0.15915493667125701904296875;
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = 1.0 / _2099;
        float _2109 = _2101 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = _2105 * _2107;
        float _2115 = _2101 * 6.283185482025146484375;
        float _2117 = sin(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = 1.0 / _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2125 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2123;
        float _2127 = 1.0 / _2125;
        float _2129 = _2117 * _2121;
        float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2133 = fma(_2015, _2129, _2131);
        float _2135 = _2133 * _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        _2009 = _2093;
        _2089 = _2101;
        _2017 = _2137;
    }
    float _2139 = _2009;
    float _2141 = _2089;
    float _2143 = _2017;
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2147 = _2081 + _2145;
    float _2149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2151 = _2083 + _2149;
    float _2153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2155 = _2085 + _2153;
    float _2157 = _2147 * _2147;
    float _2159 = fma(_2151, _2151, _2157);
    float _2161 = fma(_1651, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2165 = fma(_2155, _2155, _2159);
    float _2167 = rsqrt(_2165);
    float _2169 = sqrt(_2165);
    float _2171 = _2167 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2173 = _2151 * _2171;
    float _2175 = _2155 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 * _2175;
    float _2181 = _2177 + _2179;
    float _2183 = sqrt(_2181);
    bool _2185 = _2183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2189 = _2183 + _2187;
    float _2191 = _2155;
    float _2193 = _2181;
    float _2195 = _2189;
    float _2197 = _2139;
    float _2199 = _2147;
    float _2201 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2185)
    {
        float _2203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2191 = _2203;
    }
    float _2205 = _2191;
    if (_2185)
    {
        float _2207 = rsqrt(_2181);
        _2193 = _2207;
    }
    float _2209 = _2193;
    float _2211 = _2209;
    if (_2185)
    {
        float _2213 = _2189 * _2205;
        _2195 = _2213;
    }
    float _2215 = _2195;
    if (_2185)
    {
        float _2217 = _2215 * 0.15915493667125701904296875;
        _2197 = _2217;
    }
    float _2219 = _2197;
    float _2221 = _2167;
    float _2223 = _2219;
    if (_2185)
    {
        float _2225 = _2219 * 6.283185482025146484375;
        float _2227 = sin(_2225);
        _2221 = _2227;
    }
    float _2229 = _2221;
    float _2231 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2233 = precise::max(0.0, _2231);
    float _2235 = _2141;
    float _2237 = _2233;
    float _2239 = _2231;
    if (_2185)
    {
        float _2241 = _2219 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        _2235 = _2243;
    }
    float _2245 = _2235;
    float _2247 = -_2171;
    float _2249 = -_2233;
    float _2251 = fma(_2147, _2247, _2249);
    if (!_2185)
    {
        _2199 = _2173;
    }
    float _2253 = _2199;
    float _2255 = _2253;
    if (_2185)
    {
        float _2257 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2257;
    }
    float _2259 = _2237;
    float _2261 = _2229;
    if (_2185)
    {
        float _2263 = fma(_2229, _2259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2261 = _2263;
    }
    float _2265 = _2261;
    float _2267 = floor(_2161);
    float _2269 = _2265;
    float _2271 = _2245;
    if (_2185)
    {
        float _2273 = _2245 + (-1.0);
        _2239 = _2273;
    }
    float _2275 = _2239;
    float _2277 = _2275;
    if (_2185)
    {
        float _2279 = _2209 * _2265;
        _2201 = _2279;
    }
    float _2281 = _2201;
    if (!_2185)
    {
        _2269 = _2251;
    }
    float _2283 = _2269;
    float _2285 = _2283;
    if (_2185)
    {
        float _2287 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2287;
    }
    float _2289 = _2223;
    if (_2185)
    {
        float _2291 = _2173 * _2281;
        _2255 = _2291;
    }
    float _2293 = _2255;
    if (!_2185)
    {
        _2277 = _2175;
    }
    float _2295 = _2277;
    float _2297 = _2295;
    if (_2185)
    {
        float _2299 = _2175 * _2281;
        _2297 = _2299;
    }
    float _2301 = _2297;
    if (!_2185)
    {
        _2211 = _2177;
    }
    float _2303 = _2211;
    float _2305 = _2303;
    if (_2185)
    {
        float _2307 = fma(_2251, _2245, _2289);
        _2285 = _2307;
    }
    float _2309 = _2285;
    if (_2185)
    {
        float _2311 = _2293 * _2293;
        _2305 = _2311;
    }
    float _2313 = _2305;
    float _2315 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2185)
    {
        _2271 = _2179;
    }
    float _2317 = _2271;
    float _2319 = _2317;
    if (_2185)
    {
        float _2321 = _2301 * _2301;
        _2319 = _2321;
    }
    float _2323 = _2319;
    float _2325 = fma(_2309, _2309, _2313);
    float _2327 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2329 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2331 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2315);
    float _2333 = _2325 + _2323;
    float _2335 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2329);
    float _2337 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2339 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2331);
    float _2341 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2343 = rsqrt(_2333);
    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2347 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2345);
    float _2349 = precise::clamp(_2347, 0.0, 1.0);
    float _2351 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2335);
    float _2353 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2337);
    float _2355 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2357 = -_2349;
    float _2359 = _2357 + 1.0;
    float _2361 = _2351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2363 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2341);
    float _2365 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2353);
    float _2367 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2369 = floor(_2327);
    float _2371 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2363);
    float _2373 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2375 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2367);
    float _2377 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2379 = _2343 * _2293;
    float _2381 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2375);
    float _2383 = abs(_2359);
    float _2385 = log2(_2383);
    float _2387 = _2343 * _2301;
    float _2389 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2391 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2381);
    float _2393 = _2343 * _2309;
    float _2395 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2397 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2399 = -_2389;
    float _2401 = fma(_2393, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2399);
    float _2403 = -_2395;
    float _2405 = fma(_2403, _2163, 1.0);
    float _2407 = 1.0 / _2391;
    float _2409 = -_2369;
    float _2411 = _2327 + _2409;
    float _2413 = -_2387;
    float _2415 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2401);
    float _2417 = -_2267;
    float _2419 = _2161 + _2417;
    float _2421 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2423 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2397);
    float _2425 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2427 = fma(_2415, -0.5, 0.5);
    float _2429 = log2(_2405);
    float _2431 = fma(_2415, 0.5, 0.5);
    float _2433 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2421);
    float _2435 = _2393 + 1.0;
    float _2437 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2423);
    float _2439 = fma(_2431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2441 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2433);
    float _2443 = exp2(_2425);
    float _2445 = fma(_2431, _2439, -0.212114393711090087890625);
    float _2447 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2441);
    float _2449 = fma(_2431, _2445, 1.570728778839111328125);
    float _2451 = _2447 * _2407;
    float _2453 = sqrt(_2427);
    float _2455 = _2429 * 0.693147182464599609375;
    float _2457 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2459 = fma(_2451, 0.5, 0.5);
    float _2461 = -_2393;
    float _2463 = fma(_2443, _2435, _2461);
    float _2465 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2437);
    float _2467 = fma(_2463, 0.5, 0.5);
    float _2469 = _2465 * _2407;
    float _2471 = _2453 * 0.636619746685028076171875;
    float _2473 = fma(_2469, -0.5, 0.5);
    float _2475 = -_2449;
    float _2477 = fma(_2471, _2475, 1.0);
    float2 _8205 = float2(_2419, _2411);
    float _2479 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8205, float2(0.0), isnan(_8205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8205, float2(0.0), isnan(_8205)), level(0.0)).x;
    float3 _8216 = float3(_2459, _2473, _2457);
    float _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8216, float3(0.0), isnan(_8216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8216, float3(0.0), isnan(_8216)), level(0.0)).x;
    float3 _8227 = float3(_2459, _2473, _2457);
    float4 _2484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8227, float3(0.0), isnan(_8227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8227, float3(0.0), isnan(_8227)), level(0.0)).xyzw;
    float _2486 = _2484.x;
    float _2488 = _2484.y;
    float _2490 = _2484.z;
    float _2492 = _2484.w;
    float2 _8243 = float2(_2477, _2467);
    float3 _2496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8243, float2(0.0), isnan(_8243)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8243, float2(0.0), isnan(_8243)), level(0.0)).xyz;
    float _2498 = _2496.x;
    float _2500 = _2496.y;
    float _2502 = _2496.z;
    float _2504 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2506 = int(_2504);
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2510 = _2508 != 0;
    out.m_64.x = _585;
    out.m_64.y = _579;
    out.m_64.z = _587;
    out.m_64.w = _589;
    int _2512 = abs(_1733);
    float _2514 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2516 = abs(_1051);
    out.m_66.x = _763;
    out.m_66.y = _765;
    out.m_66.z = _767;
    out.m_66.w = _769;
    int _2518 = abs(_1737);
    float _2520 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2522 = int(_2520);
    int _2524 = abs(_1765);
    float _2526 = -_1379;
    float _2528 = _2526 + 1.0;
    float _2530 = -_1397;
    float _2532 = _2530 + 1.0;
    out.m_68.x = _2083;
    out.m_68.y = _2081;
    out.m_68.z = _2085;
    float _2534 = 0.0;
    float _2536 = _2532;
    if (_2510)
    {
        _2534 = 1.0;
    }
    float _2538 = _2534;
    float _2540 = float(uint(_2506));
    float _2542 = trunc(_1393);
    int _2544 = int(_2542);
    float _2546 = _2538;
    if (_2510)
    {
        float _2548 = in.m_58.x;
        _1423 = _2548;
    }
    float _2550 = _1423;
    if (!_2510)
    {
        _2546 = 7.345489978790283203125;
    }
    float _2552 = _2546;
    float _2554 = _2550;
    if (!_2510)
    {
        float _2556 = in.m_58.y;
        _2554 = _2556;
    }
    float _2558 = _2554;
    float _2560 = float(uint(_2522));
    float _2562 = 1.0 / _2540;
    int _2564 = ~_2522;
    int _2566 = _2564 + 1;
    float _2568 = _2552 * _801;
    bool _2570 = _2522 == 0;
    float _2572 = 1.0 / _2560;
    float _2574 = trunc(_1403);
    int _2576 = int(_2574);
    int _2578 = as_type<int>(_2562) + (-2);
    float _2580 = float(uint(_2544));
    float _2582 = as_type<float>(_2578) * _2580;
    int _2584 = as_type<int>(_2572) + (-2);
    float _2586 = floor(_2568);
    if (_2510)
    {
        _1425 = 1.0;
    }
    float _2588 = _1425;
    float _2590 = _2588;
    if (!_2510)
    {
        _2590 = 1.2345600128173828125;
    }
    float _2592 = _2590;
    int _2594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2596 = _2594 != 0;
    float _2598 = float(uint(_2576));
    float _2600 = trunc(_2582);
    float _2602 = precise::max(_2600, 0.0);
    uint _2605 = uint(_2602);
    float _2607 = _2558 * _2592;
    float _2609 = as_type<float>(_2584) * _2598;
    int _2611 = ~_2506;
    int _2613 = _2611 + 1;
    float _2615 = floor(_2607);
    float _2617 = -_2586;
    float _2619 = _2568 + _2617;
    float _2621 = trunc(_2609);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    int _2627 = _2613 * int(_2605);
    int _2629 = _2627 + _2544;
    float _2631 = float(uint(_2629));
    float _2633 = -_2615;
    float _2635 = _2607 + _2633;
    float _2637 = exp2(_2514);
    float _2639 = as_type<float>(_2578) * _2631;
    int _2641 = _2566 * int(_2625);
    int _2643 = _2641 + _2576;
    float _2645 = trunc(_2639);
    float _2647 = precise::max(_2645, 0.0);
    uint _2649 = uint(_2647);
    float _2651 = float(uint(_2643));
    float _2653 = float(_2544);
    float _2655 = -_2637;
    float _2657 = _2655 + 1.0;
    float _2659 = as_type<float>(_2584) * _2651;
    float _2661 = float(_2506);
    int _2663 = ~_2522;
    int _2665 = _2663 + 1;
    float _2667 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2669 = _2653 >= _2661;
    bool _2671 = isnan(_2653);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan(_2661);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = trunc(_2659);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2605) + int(_2649);
    float _2689 = _2619 * _2661;
    int _2691 = ~_2506;
    int _2693 = _2691 + 1;
    float _2695 = _2661 * _1391;
    float _2697 = float(_2522);
    float _2699 = float(_2576);
    int _2701 = _2693 * _2687;
    int _2703 = _2701 + _2544;
    float _2705 = trunc(_2679);
    int _2707 = int(_2705);
    float _2709 = _2697 * _1391;
    bool _2711 = _2699 >= _2697;
    bool _2713 = isnan(_2699);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan(_2697);
    bool _2719 = _2715 || _2717;
    float _2721 = float(_2719);
    float _2723 = _2635 * _2697;
    bool _2725 = uint(_2703) >= uint(_2506);
    int _2727 = int(_2625) + int(_2685);
    float _2729 = trunc(_2689);
    int _2731 = int(_2729);
    bool _2733 = !_2725;
    int _2735 = _2733 ? 0 : (-1);
    int _2737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2739 = _2737 != 0;
    int _2741 = _2665 * _2727;
    int _2743 = _2741 + _2576;
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2747 = _2745 != 0;
    int _2749 = ~_2687;
    int _2751 = _2749 + _2735;
    int _2753 = _2751 + 1;
    float _2755 = trunc(_2695);
    int _2757 = int(_2755);
    bool _2759 = uint(_2743) >= uint(_2522);
    bool _2761 = !_2739;
    int _2763 = _2761 ? 0 : 1;
    int _2765 = _2506 * _2753;
    int _2767 = _2765 + _2544;
    bool _2769 = !_2747;
    int _2771 = _2769 ? 0 : 1;
    int _2773 = abs(_2763);
    float _2775 = trunc(_2721);
    int _2777 = int(_2775);
    bool _2779 = !_2759;
    int _2781 = _2779 ? 0 : (-1);
    bool _2783 = _2506 == 0;
    int _2785 = _2731 * _2773;
    int _2787 = _2785 + _2544;
    int _2789 = abs(_2771);
    int _2791 = ~_2727;
    int _2793 = _2791 + _2781;
    int _2795 = _2793 + 1;
    float _2797 = trunc(_2723);
    int _2799 = int(_2797);
    int _2801 = ~_2707;
    int _2803 = _2801 + 1;
    int _2805 = _2803 + 1;
    bool _2807 = !_2783;
    int _2809 = _2807 ? _2767 : (-1);
    int _2811 = _2522 * _2795;
    int _2813 = _2811 + _2576;
    int _2815 = _2522 + (-1);
    bool _2817 = _807 > 0.5;
    int _2819 = _2809 * _2805;
    int _2821 = _2506 + (-1);
    float _2823 = trunc(_2709);
    int _2825 = int(_2823);
    int _2827 = ~_2777;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    bool _2833 = !_2570;
    int _2835 = _2833 ? _2813 : (-1);
    int _2837 = _2707 * _2821;
    int _2839 = _2837 + _2819;
    int _2841 = abs(_1269);
    int _2843 = _2799 * _2789;
    int _2845 = _2843 + _2576;
    int _2847 = _2835 * _2831;
    int _2849 = abs(_1281);
    int _2851 = _2839 * _2516;
    int _2853 = _2777 * _2815;
    int _2855 = _2853 + _2847;
    bool _2857 = !_2596;
    int _2859 = _2857 ? 0 : 1;
    int _2861 = _2757 * _2841;
    int _2863 = _2861 + _2851;
    int _2865 = abs(_1759);
    int _2867 = _2855 * _2512;
    int _2869 = _2787 * _2849;
    int _2871 = _2869 + _2863;
    int _2873 = abs(_2859);
    int _2875 = _2825 * _2518;
    int _2877 = _2875 + _2867;
    int _2879 = ~_2522;
    int _2881 = _2879 + 1;
    int _2883 = _2731 * _2873;
    int _2885 = _2883 + _2871;
    int _2887 = _2845 * _2865;
    int _2889 = _2887 + _2877;
    int _2891 = ~_2506;
    int _2893 = _2891 + 1;
    float _2895 = float(uint(_2885));
    int _2897 = _2799 * _2524;
    int _2899 = _2897 + _2889;
    float _2901 = float(uint(_2845));
    int _2903 = ~_2506;
    int _2905 = _2903 + 1;
    float _2907 = as_type<float>(_2578) * _2895;
    float _2909 = float(uint(_2899));
    float _2911 = as_type<float>(_2584) * _2901;
    int _2913 = ~_2522;
    int _2915 = _2913 + 1;
    int _2917 = ~_2522;
    int _2919 = _2917 + 1;
    float _2921 = trunc(_2907);
    float _2923 = precise::max(_2921, 0.0);
    uint _2925 = uint(_2923);
    float _2927 = as_type<float>(_2584) * _2909;
    float _2929 = float(uint(_2787));
    float _2931 = as_type<float>(_2578) * _2929;
    float _2933 = trunc(_2927);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    int _2939 = _2893 * int(_2925);
    int _2941 = _2939 + _2885;
    float _2943 = trunc(_2931);
    float _2945 = precise::max(_2943, 0.0);
    uint _2947 = uint(_2945);
    float _2949 = float(uint(_2941));
    int _2951 = _2881 * int(_2937);
    int _2953 = _2951 + _2899;
    float _2955 = trunc(_2911);
    float _2957 = precise::max(_2955, 0.0);
    uint _2959 = uint(_2957);
    float _2961 = as_type<float>(_2578) * _2949;
    float _2963 = float(uint(_2953));
    float _2965 = trunc(_2961);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    float _2971 = as_type<float>(_2584) * _2963;
    int _2973 = _2905 * int(_2947);
    int _2975 = _2973 + _2787;
    float _2977 = float(uint(_2975));
    float _2979 = trunc(_2971);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    int _2985 = _2915 * int(_2959);
    int _2987 = _2985 + _2845;
    float _2989 = as_type<float>(_2578) * _2977;
    int _2991 = ~_2506;
    int _2993 = _2991 + 1;
    int _2995 = int(_2925) + int(_2969);
    float _2997 = trunc(_2989);
    float _2999 = precise::max(_2997, 0.0);
    uint _3001 = uint(_2999);
    int _3003 = _2993 * _2995;
    int _3005 = _3003 + _2885;
    int _3007 = int(_2937) + int(_2983);
    float _3009 = float(uint(_2987));
    bool _3011 = uint(_3005) >= uint(_2506);
    int _3013 = _2919 * _3007;
    int _3015 = _3013 + _2899;
    int _3017 = ~_2506;
    int _3019 = _3017 + 1;
    float _3021 = as_type<float>(_2584) * _3009;
    bool _3023 = !_3011;
    int _3025 = _3023 ? 0 : (-1);
    bool _3027 = uint(_3015) >= uint(_2522);
    int _3029 = ~_2995;
    int _3031 = _3029 + _3025;
    int _3033 = _3031 + 1;
    float _3035 = trunc(_3021);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    bool _3041 = !_3027;
    int _3043 = _3041 ? 0 : (-1);
    int _3045 = int(_2947) + int(_3001);
    int _3047 = _2506 * _3033;
    int _3049 = _3047 + _2885;
    int _3051 = ~_3007;
    int _3053 = _3051 + _3043;
    int _3055 = _3053 + 1;
    int _3057 = _3019 * _3045;
    int _3059 = _3057 + _2787;
    bool _3061 = !_2783;
    int _3063 = _3061 ? _3049 : (-1);
    int _3065 = _2522 * _3055;
    int _3067 = _3065 + _2899;
    int _3069 = _3063 >> 31;
    bool _3071 = !_2570;
    int _3073 = _3071 ? _3067 : (-1);
    bool _3075 = uint(_3059) >= uint(_2506);
    int _3077 = _3073 >> 31;
    int _3079 = _3063 & 3;
    bool _3081 = _3079 != 0;
    float _3083 = -_2479;
    float _3085 = _3083 + 1.0;
    int _3087 = _3077 & 3;
    float _3089 = _2667 * _2481;
    int _3091 = _3069 & 3;
    float _3093 = -_2667;
    float _3095 = _3093 + 1.0;
    bool _3097 = !_3075;
    int _3099 = _3097 ? 0 : (-1);
    int _3101 = _3063 & 3;
    bool _3103 = _3101 != 0;
    bool _3105 = _3079 != 3;
    int _3107 = _3073 + _3087;
    int _3109 = _3063 + _3091;
    int _3111 = _3103 ? 0 : 1;
    bool _3113 = uint(_3079) >= 2u;
    int _3115 = _3107 >> 2;
    bool _3117 = uint(_3079) > 1u;
    int _3119 = ~_3045;
    int _3121 = _3119 + _3099;
    int _3123 = _3121 + 1;
    int _3125 = _3109 >> 2;
    int _3127 = _3113 ? 0 : 1;
    int _3129 = _2506 * _3123;
    int _3131 = _3129 + _2787;
    int _3133 = _3115 << 4;
    int _3135 = _3133 + 512;
    int _3137 = _3125 << 4;
    int _3139 = _3137 + 368;
    int _3141 = ~_3127;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    uint _3147 = uint(int(uint(_3135) >> uint(2)));
    uint _3149 = uint(int(uint(int(_3147)) >> uint(2)));
    int _3151 = int(_3147) & 3;
    float _3153 = (*spvDescriptorSet0.vp_c9)._m0[int(_3149)][_3151];
    int _3155 = int(_3147) + 1;
    uint _3157 = uint(int(uint(_3155) >> uint(2)));
    int _3159 = _3155 & 3;
    float _3161 = (*spvDescriptorSet0.vp_c9)._m0[int(_3157)][_3159];
    int _3163 = _3145;
    if (_3105)
    {
        int _3165 = ~_3127;
        int _3167 = _3165 + 1;
        _3163 = _3167;
    }
    int _3169 = _3163;
    int _3171 = int(_2959) + int(_3039);
    int _3173 = ~_2522;
    int _3175 = _3173 + 1;
    int _3177 = ~_3111;
    int _3179 = _3177 + 1;
    int _3181 = _3179 + 1;
    uint _3183 = uint(int(uint(_3139) >> uint(2)));
    uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
    int _3187 = int(_3183) & 3;
    float _3189 = (*spvDescriptorSet0.vp_c9)._m0[int(_3185)][_3187];
    int _3191 = int(_3183) + 1;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    int _3195 = _3191 & 3;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[int(_3193)][_3195];
    int _3199 = _3181;
    if (!_3117)
    {
        int _3201 = ~_3111;
        int _3203 = _3201 + 1;
        _3199 = _3203;
    }
    int _3205 = _3199;
    int _3207 = _3175 * _3171;
    int _3209 = _3207 + _2845;
    int _3211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3213 = _3211 != 0;
    bool _3215 = !_2783;
    int _3217 = _3215 ? _3131 : (-1);
    int _3219 = _3073 & 3;
    bool _3221 = _3219 != 0;
    int _3223 = _3073 & 3;
    bool _3225 = _3223 != 0;
    bool _3227 = !_3081;
    int _3229 = _3227 ? 0 : 1;
    bool _3231 = !_3213;
    int _3233 = _3231 ? 0 : 1;
    int _3235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3237 = _3235 != 0;
    bool _3239 = _3079 != 3;
    bool _3241 = uint(_3209) >= uint(_2522);
    int _3243 = _3135 + 8;
    uint _3245 = uint(int(uint(_3243) >> uint(2)));
    uint _3247 = uint(int(uint(int(_3245)) >> uint(2)));
    int _3249 = int(_3245) & 3;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[int(_3247)][_3249];
    int _3253 = int(_3245) + 1;
    uint _3255 = uint(int(uint(_3253) >> uint(2)));
    int _3257 = _3253 & 3;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[int(_3255)][_3257];
    bool _3261 = !_3237;
    int _3263 = _3261 ? 0 : 1;
    bool _3265 = uint(_3223) > 1u;
    int _3267 = _3221 ? 0 : 1;
    bool _3269 = !_3239;
    int _3271 = _3269 ? 0 : (-1);
    int _3273 = _3139 + 8;
    uint _3275 = uint(int(uint(_3273) >> uint(2)));
    uint _3277 = uint(int(uint(int(_3275)) >> uint(2)));
    int _3279 = int(_3275) & 3;
    float _3281 = (*spvDescriptorSet0.vp_c9)._m0[int(_3277)][_3279];
    int _3283 = int(_3275) + 1;
    uint _3285 = uint(int(uint(_3283) >> uint(2)));
    int _3287 = _3283 & 3;
    float _3289 = (*spvDescriptorSet0.vp_c9)._m0[int(_3285)][_3287];
    bool _3291 = !_3225;
    int _3293 = _3291 ? 0 : 1;
    bool _3295 = uint(_3223) >= 2u;
    bool _3297 = _3223 != 3;
    bool _3299 = _3223 != 3;
    int _3301 = ~_3267;
    int _3303 = _3301 + 1;
    int _3305 = _3303 + 1;
    int _3307 = _3305;
    if (!_3265)
    {
        int _3309 = ~_3267;
        int _3311 = _3309 + 1;
        _3307 = _3311;
    }
    int _3313 = _3307;
    int _3315 = _3295 ? 0 : 1;
    bool _3317 = !_3297;
    int _3319 = _3317 ? 0 : (-1);
    int _3321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3323 = _3321 != 0;
    int _3325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3327 = _3325 != 0;
    int _3329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3331 = _3329 != 0;
    bool _3333 = !_3241;
    int _3335 = _3333 ? 0 : (-1);
    bool _3337 = _801 > 0.5;
    int _3339 = abs(_3205);
    int _3341 = ~_3171;
    int _3343 = _3341 + _3335;
    int _3345 = _3343 + 1;
    float _3347 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3349 = int(_3347);
    int _3351 = abs(_3313);
    int _3353 = ~_3315;
    int _3355 = _3353 + 1;
    int _3357 = _3355 + 1;
    int _3359 = _3357;
    if (_3299)
    {
        int _3361 = ~_3315;
        int _3363 = _3361 + 1;
        _3359 = _3363;
    }
    int _3365 = _3359;
    int _3367 = abs(_3229);
    int _3369 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3371 = _3369 != 0;
    int _3373 = abs(_3293);
    int _3375 = ~_3351;
    int _3377 = _3375 + 1;
    int _3379 = _3377 + 1;
    int _3381 = _2522 * _3345;
    int _3383 = _3381 + _2845;
    int _3385 = ~_3339;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    int _3391 = _3379 * as_type<int>(_3161);
    int _3393 = _3389 * as_type<int>(_3197);
    int _3395 = abs(_3169);
    float _3397 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3399 = int(_3397);
    int _3401 = abs(_3365);
    int _3403 = ~_3367;
    int _3405 = _3403 + 1;
    int _3407 = _3405 + 1;
    int _3409 = ~_3373;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = _3407 * as_type<int>(_3189);
    int _3417 = _3415 + _3393;
    int _3419 = _3413 * as_type<int>(_3153);
    int _3421 = _3419 + _3391;
    int _3423 = ~_3395;
    int _3425 = _3423 + 1;
    int _3427 = _3425 + 1;
    int _3429 = ~_3401;
    int _3431 = _3429 + 1;
    int _3433 = _3431 + 1;
    float _3435 = float(uint(_3349));
    int _3437 = _3427 * as_type<int>(_3281);
    int _3439 = _3437 + _3417;
    bool _3441 = !_2570;
    int _3443 = _3441 ? _3383 : (-1);
    int _3445 = _3433 * as_type<int>(_3251);
    int _3447 = _3445 + _3421;
    int _3449 = abs(_3271);
    float _3451 = abs(_2015);
    float _3453 = log2(_3451);
    int _3455 = abs(_3319);
    int _3457 = ~_3449;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    bool _3463 = _803 > 0.5;
    int _3465 = abs(_3349);
    float _3467 = 1.0 / _3435;
    float _3469 = float(uint(_3399));
    int _3471 = _3461 * as_type<int>(_3289);
    int _3473 = _3471 + _3439;
    int _3475 = ~_3455;
    int _3477 = _3475 + 1;
    int _3479 = _3477 + 1;
    int _3481 = abs(_3233);
    float _3483 = float(uint(_3465));
    float _3485 = 1.0 / _3469;
    int _3487 = abs(_3263);
    int _3489 = _3479 * as_type<int>(_3259);
    int _3491 = _3489 + _3447;
    int _3493 = ~_3481;
    int _3495 = _3493 + 1;
    int _3497 = _3495 + 1;
    float _3499 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3501 = ~_3487;
    int _3503 = _3501 + 1;
    int _3505 = _3503 + 1;
    float _3507 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3509 = abs(_3399);
    float _3511 = 1.0 / _3483;
    int _3513 = _3491 * _3497;
    float _3515 = -_191;
    int _3517 = _3337 ? as_type<int>(_3515) : as_type<int>(_191);
    int _3519 = _3473 * _3505;
    float _3521 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3523 = _805 > 0.5;
    int _3525 = _3443 * _3481;
    int _3527 = _3525 + _3513;
    int _3529 = as_type<int>(_3467) + (-2);
    int _3531 = _3217 * _3487;
    int _3533 = _3531 + _3519;
    float _3535 = exp2(_3499);
    float _3537 = float(uint(_3509));
    float _3539 = -_1567;
    float _3541 = fma(_3539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3507);
    float _3543 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3545 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3547 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3541);
    int _3549 = as_type<int>(_3511) + (-2);
    float _3551 = 1.0 / _3537;
    float _3553 = -_1567;
    float _3555 = fma(_3553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3521);
    float _3557 = float(uint(_3533));
    float _3559 = -_1567;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3543);
    int _3563 = ~_3399;
    int _3565 = _3563 + 1;
    float _3567 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3555);
    float _3569 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3545);
    float _3571 = as_type<float>(_3529) * _3557;
    int _3573 = as_type<int>(_3485) + (-2);
    float _3575 = fma(_3535, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = float(uint(_3527));
    float _3581 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3561);
    int _3583 = abs(_3533);
    float _3585 = trunc(_3571);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    int _3591 = ~_3349;
    int _3593 = _3591 + 1;
    float _3595 = as_type<float>(_3573) * _3579;
    float _3597 = float(uint(_3583));
    float _3599 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3601 = as_type<int>(_3551) + (-2);
    float _3603 = as_type<float>(_3549) * _3597;
    float _3605 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3607 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3609 = trunc(_3595);
    float _3611 = precise::max(_3609, 0.0);
    uint _3613 = uint(_3611);
    float _3615 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3599);
    float _3617 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3605);
    float _3619 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3607);
    float _3621 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3623 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3625 = ~_3465;
    int _3627 = _3625 + 1;
    float _3629 = trunc(_3603);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = abs(_3527);
    float _3637 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3621);
    float _3639 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3623);
    int _3641 = _3593 * int(_3589);
    int _3643 = _3641 + _3533;
    float _3645 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3615);
    int _3647 = _3565 * int(_3613);
    int _3649 = _3647 + _3527;
    float _3651 = float(uint(_3635));
    float _3653 = float(uint(_3643));
    float _3655 = float(uint(_3649));
    float _3657 = as_type<float>(_3601) * _3651;
    bool _3659 = !_3371;
    float _3661 = _3659 ? _191 : as_type<float>(_3517);
    int _3663 = _3627 * int(_3633);
    int _3665 = _3663 + _3583;
    float _3667 = as_type<float>(_3529) * _3653;
    float _3669 = as_type<float>(_3573) * _3655;
    float _3671 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3617);
    float _3673 = trunc(_3657);
    float _3675 = precise::max(_3673, 0.0);
    uint _3677 = uint(_3675);
    float _3679 = float(uint(_3665));
    float _3681 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3569);
    float _3683 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3619);
    int _3685 = ~_3509;
    int _3687 = _3685 + 1;
    float _3689 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3691 = as_type<float>(_3549) * _3679;
    float _3693 = -_191;
    int _3695 = _3523 ? as_type<int>(_3693) : as_type<int>(_191);
    float _3697 = trunc(_3667);
    float _3699 = precise::max(_3697, 0.0);
    uint _3701 = uint(_3699);
    float _3703 = -_201;
    int _3705 = _3463 ? as_type<int>(_3703) : as_type<int>(_201);
    out.m_70.x = _3671;
    out.m_70.y = _3681;
    out.m_70.z = _3683;
    bool _3707 = !_3331;
    float _3709 = _3707 ? _191 : as_type<float>(_3695);
    float _3711 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3713 = -_201;
    int _3715 = _2817 ? as_type<int>(_3713) : as_type<int>(_201);
    bool _3717 = !_3327;
    float _3719 = _3717 ? _201 : as_type<float>(_3705);
    int _3721 = _3687 * int(_3677);
    int _3723 = _3721 + _3635;
    float _3725 = trunc(_3669);
    float _3727 = precise::max(_3725, 0.0);
    uint _3729 = uint(_3727);
    bool _3731 = !_3323;
    float _3733 = _3731 ? _201 : as_type<float>(_3715);
    float _3735 = fma(_3577, -2.0, 3.0);
    float _3737 = _3577 * _3577;
    float _3739 = float(uint(_3723));
    float _3741 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3637);
    float _3743 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3639);
    float _3745 = _3689 * _3567;
    float _3747 = trunc(_3691);
    float _3749 = precise::max(_3747, 0.0);
    uint _3751 = uint(_3749);
    float _3753 = as_type<float>(_3601) * _3739;
    float _3755 = _3689 * _3581;
    float _3757 = _3737 * _3735;
    float _3759 = fma(_3711, _3671, _3745);
    int _3761 = ~_3349;
    int _3763 = _3761 + 1;
    float _3765 = fma(_3711, _3683, _3755);
    int _3767 = int(_3589) + int(_3701);
    float _3769 = trunc(_3753);
    float _3771 = precise::max(_3769, 0.0);
    uint _3773 = uint(_3771);
    float _3775 = _3689 * _3547;
    float _3777 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3779 = int(_3613) + int(_3729);
    int _3781 = _3763 * _3767;
    int _3783 = _3781 + _3533;
    int _3785 = ~_3399;
    int _3787 = _3785 + 1;
    float _3789 = fma(_3711, _3681, _3775);
    int _3791 = ~_3465;
    int _3793 = _3791 + 1;
    float _3795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3797 = int(_3633) + int(_3751);
    int _3799 = _3787 * _3779;
    int _3801 = _3799 + _3527;
    int _3803 = ~_3509;
    int _3805 = _3803 + 1;
    float _3807 = -_3757;
    float _3809 = _3807 + 1.0;
    bool _3811 = uint(_3783) >= uint(_3349);
    int _3813 = _3793 * _3797;
    int _3815 = _3813 + _3583;
    float _3817 = fma(_3809, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    int _3819 = int(_3677) + int(_3773);
    float _3821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3823 = uint(_3801) >= uint(_3399);
    float _3825 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3777);
    bool _3827 = !_3811;
    int _3829 = _3827 ? 0 : (-1);
    int _3831 = _3805 * _3819;
    int _3833 = _3831 + _3635;
    bool _3835 = uint(_3815) >= uint(_3465);
    float _3837 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3825);
    bool _3839 = !_3823;
    int _3841 = _3839 ? 0 : (-1);
    int _3843 = ~_3767;
    int _3845 = _3843 + _3829;
    int _3847 = _3845 + 1;
    int _3849 = _3533 ^ _3349;
    int _3851 = ~_3779;
    int _3853 = _3851 + _3841;
    int _3855 = _3853 + 1;
    int _3857 = _3349 * _3847;
    int _3859 = _3857 + _3533;
    bool _3861 = uint(_3833) >= uint(_3509);
    float _3863 = _3821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3865 = _3349 == 0;
    int _3867 = _3399 * _3855;
    int _3869 = _3867 + _3527;
    bool _3871 = _3349 == 0;
    int _3873 = _3527 ^ _3399;
    float _3875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3877 = !_3835;
    int _3879 = _3877 ? 0 : (-1);
    uint _3881 = uint(int(uint(_3849) >> uint(31)));
    bool _3883 = _3399 == 0;
    bool _3885 = _3399 == 0;
    bool _3887 = !_3861;
    int _3889 = _3887 ? 0 : (-1);
    uint _3891 = uint(int(uint(_3873) >> uint(31)));
    int _3893 = ~_3879;
    int _3895 = _3797 + _3893;
    int _3897 = _3895 + 1;
    float _3899 = fma(_3689, _3689, 1.0);
    int _3901 = ~int(_3881);
    int _3903 = _3901 + 1;
    float _3905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3907 = ~_3889;
    int _3909 = _3819 + _3907;
    int _3911 = _3909 + 1;
    int _3913 = ~int(_3891);
    int _3915 = _3913 + 1;
    bool _3917 = !_3865;
    int _3919 = _3917 ? _3859 : (-1);
    int _3921 = _3897 ^ _3903;
    float _3923 = rsqrt(_3899);
    int _3925 = _3911 ^ _3915;
    float _3927 = float(_3919);
    int _3929 = ~_3903;
    int _3931 = _3929 + _3921;
    int _3933 = _3931 + 1;
    bool _3935 = !_3883;
    int _3937 = _3935 ? _3869 : (-1);
    float _3939 = fma(_3863, _3927, _1375);
    int _3941 = ~_3915;
    int _3943 = _3941 + _3925;
    int _3945 = _3943 + 1;
    float _3947 = _3875 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3949 = float(_3937);
    float _3951 = _3661 + 0.5;
    bool _3953 = !_3871;
    int _3955 = _3953 ? _3933 : (-1);
    float _3957 = _3795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3959 = _2015 <= 8000.0;
    bool _3961 = isnan(_2015);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan(8000.0);
    bool _3967 = _3963 || _3965;
    float _3969 = float(_3967);
    float _3971 = fma(_3863, _3951, _3939);
    float _3973 = float(_3955);
    float _3975 = fma(_3947, _3949, _1383);
    float _3977 = _3709 + 0.5;
    bool _3979 = !_3885;
    int _3981 = _3979 ? _3945 : (-1);
    float _3983 = _3905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3985 = -_919;
    float _3987 = fma(_3957, _3973, _3985);
    float _3989 = fma(_3947, _3977, _3975);
    float _3991 = _3689 * _3923;
    float _3993 = float(_3981);
    float _3995 = _3719 + (-0.5);
    float _3997 = _3969 * _3817;
    float _3999 = -_3743;
    float _4001 = _3991 * _3999;
    float _4003 = _2502 * _3089;
    float _4005 = -_3957;
    float _4007 = fma(_4005, _3995, _3987);
    float _4009 = -_1399;
    float _4011 = fma(_3983, _3993, _4009);
    float _4013 = -_3645;
    float _4015 = _3991 * _4013;
    float _4017 = -_3741;
    float _4019 = _3991 * _4017;
    float _4021 = fma(_3923, _3581, _4001);
    float _4023 = fma(_3719, _2528, _4007);
    float _4025 = _3733 + (-0.5);
    float _4027 = in.m_72.x;
    float _4029 = fma(_3923, _3547, _4019);
    float _4031 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4033 = -_3983;
    float _4035 = fma(_4033, _4025, _4011);
    float _4037 = fma(_3923, _3567, _4015);
    float _4039 = -_1395;
    float _4041 = _4039 + 1.0;
    float _4043 = _3085 * _4031;
    float _4045 = precise::clamp(_4043, 0.0, 1.0);
    float _4047 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3837);
    float _4049 = -_1389;
    float _4051 = _4049 + 1.0;
    out.m_74.x = _4037;
    out.m_74.y = _4029;
    out.m_74.z = _4021;
    float _4053 = -_4041;
    float _4055 = fma(_3661, _4053, _3971);
    float _4057 = _4047 + _2391;
    float _4059 = fma(_3733, _2532, _4035);
    float _4061 = -_4051;
    float _4063 = fma(_3709, _4061, _3989);
    float _4065 = _3645 + _3759;
    float _4067 = _4057 * 0.5;
    float _4069 = _3741 + _3789;
    float _4071 = _3743 + _3765;
    float _4073 = fma(_2492, _4003, _2490);
    out.m_76.x = _4055;
    out.m_76.y = _4023;
    out.m_76.z = _4063;
    out.m_76.w = _4059;
    float _4075 = _2492 * _3089;
    bool _4077 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4079 = isnan(_2169);
    bool _4081 = _4077 || _4079;
    bool _4083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4085 = _4081 || _4083;
    out.m_78.z = _4067;
    out.m_78.w = _2391;
    float _4087 = -_4045;
    float _4089 = fma(_4087, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4091 = fma(_2498, _4075, _2486);
    float _4093 = fma(_2500, _4075, _2488);
    out.m_80.x = _4065;
    out.m_80.y = _4069;
    out.m_80.z = _4071;
    float _4095 = _4089 * _4027;
    float _4097 = _2492 * _3095;
    out.gl_Position.x = _2447;
    out.gl_Position.y = _2465;
    out.gl_Position.z = _4047;
    out.gl_Position.w = _2391;
    float _4099 = _4095 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4101 = _4057;
    float _4103 = _4021;
    float _4105 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4107 = _4075;
    float _4109 = _2447;
    if (!_4085)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4111 = _2536;
    out.m_82.x = _4091;
    out.m_82.y = _4093;
    out.m_82.z = _4073;
    out.m_82.w = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4085)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4117 = _4101;
    float _4119 = _4117;
    float _4121 = _4117;
    if (!_4085)
    {
        _4103 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4123 = _4103;
    out.m_84.x = _4099;
    float _4125 = _4123;
    float _4127 = _4123;
    if (!_4085)
    {
        _4105 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4129 = _4105;
    float _4131 = _4129;
    float _4133 = _4129;
    if (!_4085)
    {
        _4107 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4135 = _4107;
    float _4137 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4139 = _4135;
    float _4141 = _4135;
    if (!_4085)
    {
        _4109 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4143 = _4109;
    bool _4145 = !_4085;
    float _4147 = _4143;
    float _4149 = _4143;
    if (!_4145)
    {
        bool _4151 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4153 = isnan(_2169);
        bool _4155 = _4151 || _4153;
        bool _4157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4159 = _4155 || _4157;
        if (!_4159)
        {
            float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4163 = _2169 + _4161;
            float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4165;
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4173 = 1.0 / _4167;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4191 = _4163 * _4173;
            float _4193 = precise::clamp(_4191, 0.0, 1.0);
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4199 = fma(_4193, _4171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4201 = fma(_4193, _4197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4203 = fma(_4193, _4177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4205 = fma(_4193, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4207 = fma(_4193, _4185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4209 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4149 = _4203;
            _4133 = _4207;
            _4115 = _4199;
            _4127 = _4205;
            _4121 = _4201;
            _4141 = _4209;
            _4211 = true;
        }
        else
        {
            bool _4213 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4215 = isnan(_2169);
            bool _4217 = _4213 || _4215;
            bool _4219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4221 = _4217 || _4219;
            if (!_4221)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4223 = _4113;
            _4115 = _4223;
            if (!_4221)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4225 = _4147;
            _4149 = _4225;
            if (!_4221)
            {
                _4119 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4227 = _4119;
            _4121 = _4227;
            if (!_4221)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4229 = _4125;
            _4127 = _4229;
            if (!_4221)
            {
                _4131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4231 = _4131;
            _4133 = _4231;
            if (!_4221)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4233 = _4139;
            bool _4235 = !_4221;
            _4141 = _4233;
            if (!_4235)
            {
                bool _4237 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4239 = isnan(_2169);
                bool _4241 = _4237 || _4239;
                bool _4243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4245 = _4241 || _4243;
                if (!_4245)
                {
                    float _4247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4249 = _2169 + _4247;
                    float _4251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4251;
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4257 = _4255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4259 = 1.0 / _4253;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4277 = _4249 * _4259;
                    float _4279 = precise::clamp(_4277, 0.0, 1.0);
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4285 = fma(_4279, _4257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4287 = fma(_4279, _4283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4289 = fma(_4279, _4263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4291 = fma(_4279, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4293 = fma(_4279, _4271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4295 = fma(_4279, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4149 = _4289;
                    _4133 = _4293;
                    _4115 = _4285;
                    _4127 = _4291;
                    _4121 = _4287;
                    _4141 = _4295;
                    _4211 = true;
                }
                else
                {
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4121 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4211 = false;
    float _4297 = _4149;
    float _4299 = _4133;
    float _4301 = _4115;
    float _4303 = _4127;
    float _4305 = _4121;
    float _4307 = _4141;
    float _4309 = fma(_4069, -0.5, 0.5);
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = -_4297;
    float _4315 = _4313 + _4299;
    float _4317 = _4137 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4319 = -_4301;
    float _4321 = _4319 + _4303;
    float _4323 = fma(_4311, _4315, _4297);
    out.m_86.x = 0.0;
    float _4325 = -_4305;
    float _4327 = _4325 + _4307;
    float _4329 = fma(_4311, _4321, _4301);
    float _4331 = _4323 * 0.586610972881317138671875;
    out.m_49.x = _4317;
    bool _4333 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4335 = fma(_4311, _4327, _4305);
    float _4337 = fma(_4329, 0.298911988735198974609375, _4331);
    bool _4339 = _2143 > 0.0;
    bool _4341 = isnan(_2143);
    bool _4343 = _4339 || _4341;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    float _4349 = fma(_4335, 0.114477999508380889892578125, _4337);
    float _4351 = -_4349;
    float _4353 = _4329 + _4351;
    float _4355 = -_4349;
    float _4357 = _4323 + _4355;
    float _4359 = -_4349;
    float _4361 = _4335 + _4359;
    float _4363 = fma(_4353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    float _4365 = fma(_4357, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    float _4367 = fma(_4361, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    bool _4369 = !_4333;
    if (!_4369)
    {
        float _4371 = -_2081;
        float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4375 = -_2083;
        float _4377 = _4375 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4379 = -_2085;
        float _4381 = _4379 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4383 = _4373 * _4373;
        float _4385 = fma(_4377, _4377, _4383);
        float _4387 = fma(_4381, _4381, _4385);
        float _4389 = sqrt(_4387);
        float _4391 = rsqrt(_4387);
        float _4393 = -_4389;
        float _4395 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4397 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4399 = precise::clamp(_4397, 0.0, 1.0);
        float _4401 = _4377 * _4391;
        float _4403 = _4373 * _4391;
        float _4405 = abs(_4399);
        float _4407 = log2(_4405);
        float _4409 = _4381 * _4391;
        float _4411 = _4401 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4413 = _4069 * _4403;
        float _4415 = -_4403;
        float _4417 = -_4411;
        float _4419 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4417);
        float _4421 = fma(_4065, _4401, _4413);
        float _4423 = -_4409;
        float _4425 = fma(_4423, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4419);
        float _4427 = fma(_4071, _4409, _4421);
        float _4429 = precise::clamp(_4427, 0.0, 1.0);
        float _4431 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4433 = _4425 + _4431;
        float _4435 = _4407 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4437 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4439 = precise::clamp(_4437, 0.0, 1.0);
        float _4441 = exp2(_4435);
        float _4443 = _4441 * _4439;
        float _4445 = _4429 * _4443;
        float _4447 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4449 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4451 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _4447;
        out.m_86.y = _4449;
        out.m_86.z = _4451;
    }
    out.m_88.x = _4363;
    out.m_88.y = _4365;
    out.m_88.z = _4367;
    if (_4347)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _4453 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4453;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4211 = false;
    bool _791 = false;
    bool _611 = false;
    bool _423 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4512 = as_type<float>(_125);
        out.gl_Position.z = _4512;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4582 = as_type<float>(_163);
        out.gl_Position.z = _4582;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _227;
    if (!_209)
    {
        float _211 = in.m_58.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_107);
        float _233 = 1.0 / _231;
        float _235 = _143 * _233;
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
    bool _263 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_237);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _257;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _279 = 1.0 / _253;
    float _281 = 1.0 / _261;
    float _283 = _249 * _275;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _241 * _279;
    bool _299 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_237);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -_273;
    float _313 = _311 + 1.0;
    float _315 = _309 * _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = _245 * _281;
    bool _323 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_237);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _333 * _337;
    float _353 = -_333;
    float _355 = _353 + 1.0;
    float _357 = fma(_341, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = _295 * _355;
    float _363 = -_295;
    float _365 = _363 + 1.0;
    float _367 = fma(_319, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = _357 * _361;
    float _371 = _359 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = fma(_349, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _379;
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _385 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _387 = fma(_375, _321, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_381, _321, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _391 = fma(_367, _351, _383);
    float _393 = fma(_377, _351, _385);
    float _395 = fma(_387, _315, _391);
    float _397 = fma(_389, _315, _393);
    float _399 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_277;
    float _421;
    if (!_403)
    {
        float _405 = in.m_58.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_107);
        float _427 = 1.0 / _425;
        float _429 = _143 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_60.x;
    float _435 = in.m_60.y;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _445 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = isnan(_431);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _461 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _463 = isnan(_431);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = 1.0 / _439;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = -_455;
    float _481 = _479 + 1.0;
    bool _483 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_431);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _497 = 1.0 / _443;
    float _499 = _401 * _435;
    float _501 = _399 * _433;
    float _503 = 1.0 / _459;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _509 = _477 * _473;
    float _511 = _471 * _481;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _431 + _513;
    float _517 = -_471;
    float _519 = _517 + 1.0;
    float _521 = fma(_509, _515, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _523 = _493 * _519;
    float _525 = _507 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _529 = _431 + _527;
    bool _531 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _533 = isnan(_431);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _543;
    float _547 = _521 * _523;
    float _549 = -_493;
    float _551 = _549 + 1.0;
    float _553 = fma(_525, _529, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _555 = _545 * _503;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _431 + _561;
    float _565 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[115].x, _547);
    float _567 = _455 * _559;
    float _569 = fma(_555, _563, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _571 = fma(_553, _511, _565);
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _575 = fma(_569, _567, _571);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _579 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _583 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[118].x, _575);
    float _585 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _591 = !_495;
    float _609;
    if (!_591)
    {
        float _593 = in.m_58.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].w, _143);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_107);
        float _615 = 1.0 / _613;
        float _617 = _143 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _623 = _619 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _629 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _631 = isnan(_619);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _649 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _651 = isnan(_619);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _627;
    float _663 = -_639;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _667;
    bool _671 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_619);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = _659 * _665;
    float _685 = -_659;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _691 = 1.0 / _643;
    float _693 = _681 * _687;
    float _695 = -_681;
    float _697 = _695 + 1.0;
    float _699 = 1.0 / _647;
    float _701 = _669 * _661;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _707 = fma(_701, _623, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _709 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _711 = isnan(_619);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _705 * _691;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _729 = _619 + _727;
    float _731 = _707 * _693;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _739 = _619 + _737;
    float _741 = fma(_721, _729, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _743 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[131].x, _731);
    float _745 = _725 * _699;
    float _747 = _639 * _735;
    float _749 = fma(_741, _683, _743);
    float _751 = fma(_745, _739, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _753 = fma(_751, _747, _749);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[134].x, _753);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _761 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _771 = !_689;
    float _789;
    if (!_771)
    {
        float _773 = in.m_58.x;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _777 = _773 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[14].x, _143);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_107);
        float _795 = 1.0 / _793;
        float _797 = _143 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = in.m_58.z;
    float _807 = in.m_58.w;
    float _809 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _811 = log2(_809);
    float _813 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _823 = 1.0 / _817;
    float _825 = _499 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = 1.0 / _821;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _837 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = 1.0 / _831;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _845 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _845);
    float _853 = 1.0 / _835;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _855;
    float _859 = fma(_837, -2.0, _849);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _865 = _857 * _823;
    float _867 = _803 * 2.0;
    float _869 = 1.0 / _843;
    float _871 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _873 = _863 * _827;
    float _875 = -_847;
    float _877 = fma(_871, 2.0, _875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _883 = floor(_867);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _889 = _801 * 2.0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _899 = _811 * _143;
    float _901 = floor(_889);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _903;
    float _907 = _897 * _839;
    float _909 = _893 * _853;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _919 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _859);
    float _921 = 1.0 / _887;
    float _923 = _805 * 2.0;
    bool _925 = _883 >= 0.0;
    bool _927 = isnan(_883);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = _913 * _869;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _939 = _799 + _937;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _943 = _901 >= 0.0;
    bool _945 = isnan(_901);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = _801 + _803;
    bool _955 = _901 > 0.0;
    float _957 = floor(_923);
    bool _959 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _961 = isnan(_799);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _953 + (-1.0);
    float _973 = fma(_909, _939, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _975 = _905 * _921;
    float _977 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _979 = _805 + _803;
    float _981 = 1.0 / _881;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _985 = _979 + (-1.0);
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _989 = _951 ? 0 : 1;
    float _991 = _805 + _801;
    bool _993 = _883 > 0.0;
    float _995 = -_969;
    float _997 = _995 + 1.0;
    int _999 = ~_989;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    float _1005 = _991 + (-1.0);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1009 = _1007 != 0;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1017 = _1015 != 0;
    float _1019 = exp2(_899);
    int _1021 = _1003;
    int _1023 = as_type<int>(_921);
    float _1025 = _865;
    if (!_955)
    {
        int _1027 = ~_989;
        int _1029 = _1027 + 1;
        _1021 = _1029;
    }
    int _1031 = _1021;
    float _1033 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1035 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1037 = isnan(_799);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = _917 * _981;
    bool _1049 = !_1013;
    int _1051 = _1049 ? 0 : 1;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1055 = _1053 != 0;
    float _1057 = _1045 * _997;
    bool _1059 = _957 > 0.0;
    float _1061 = -_1045;
    float _1063 = _1061 + 1.0;
    bool _1065 = _957 >= 0.0;
    bool _1067 = isnan(_957);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    bool _1075 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1077 = isnan(_799);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = -_1019;
    float _1089 = _1087 + 1.0;
    bool _1091 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1093 = isnan(_799);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1085 * _1063;
    float _1105 = -_1085;
    float _1107 = _1105 + 1.0;
    if (_1055)
    {
        _1023 = 0;
    }
    int _1109 = _1023;
    float _1111 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    int _1113 = _1109;
    if (!_1055)
    {
        _1113 = 1;
    }
    int _1115 = _1113;
    float _1117 = -_1101;
    float _1119 = _1117 + 1.0;
    int _1121 = _1073 ? 0 : 1;
    float _1123 = _1101 * _1107;
    bool _1125 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1127 = isnan(_799);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = sqrt(_1111);
    bool _1139 = _1115 != 1;
    bool _1141 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1143 = isnan(_799);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = _1135 * _1119;
    bool _1155 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1157 = isnan(_799);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -_1135;
    float _1169 = _1167 + 1.0;
    bool _1171 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1173 = isnan(_799);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = -_1151;
    float _1185 = _1183 + 1.0;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1189 = _799 + _1187;
    float _1191 = -_1165;
    float _1193 = _1191 + 1.0;
    float _1195 = _1151 * _1169;
    float _1197 = _1165 * _1185;
    float _1199 = fma(_865, _1189, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1201 = _1181 * _1193;
    float _1203 = _1199;
    if (!_1139)
    {
        _1025 = _803;
    }
    float _1205 = _1025;
    float _1207 = -_1181;
    float _1209 = _1207 + 1.0;
    float _1211 = _1205;
    if (_1139)
    {
        _1211 = _801;
    }
    float _1213 = _1211;
    float _1215 = _1199 * _1201;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1219 = _799 + _1217;
    int _1221 = ~_1121;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    float _1227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1229 = int(_1227);
    float _1231 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1215);
    float _1233 = float(_107);
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[83].z, _983);
    int _1237 = _1225;
    float _1239 = _1213;
    if (!_1059)
    {
        int _1241 = ~_1121;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    float _1247 = fma(_873, _1219, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1139)
    {
        _115 = _805;
    }
    float _1249 = _115;
    float _1251 = _1137 * 50.0;
    float _1253 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1255 = int(_1253);
    float _1257 = _1249;
    if (!_1139)
    {
        _1203 = _803;
    }
    float _1259 = _1203;
    float _1261 = fma(_1247, _1197, _1231);
    float _1263 = _1259;
    if (!_1139)
    {
        _1239 = _805;
    }
    float _1265 = _1239;
    bool _1267 = !_1009;
    int _1269 = _1267 ? 0 : 1;
    float _1271 = fma(_973, _1195, _1261);
    float _1273 = _1265;
    if (_1139)
    {
        _1257 = _803;
    }
    float _1275 = _1257;
    float _1277 = 1.0 / _1233;
    bool _1279 = !_1017;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[83].w, _941);
    if (_1139)
    {
        _1263 = _801;
    }
    float _1285 = _1263;
    if (_1139)
    {
        _1273 = _803;
    }
    float _1287 = _1273;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1293 = _1291 != 0;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1301 = _1299 != 0;
    float _1303 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1307 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1309 = isnan(0.0);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1315 = _1311 || _1313;
    float _1317 = -_1289;
    float _1319 = fma(_1303, 2.0, _1317);
    bool _1321 = !_1293;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1327 = _1315 ? _1089 : 0.0;
    int _1329 = abs(_1323);
    float _1331 = fma(_1305, -2.0, _1325);
    float _1333 = float(_1229);
    float _1335 = in.m_62.x;
    float _1337 = in.m_62.y;
    float _1339 = in.m_62.z;
    float _1341 = float(_1255);
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1355 = 1.0 + _1353;
    float _1357 = 1.0 / _1333;
    float _1359 = float(_1329);
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1363 = float(_1245);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1367 = 1.0 / _1341;
    float _1369 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1361);
    float _1371 = _1359 * _1363;
    float _1373 = -_143;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _877);
    float _1377 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1365);
    float _1379 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1369);
    float _1381 = -_143;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1319);
    float _1385 = _1371 * (-2.0);
    float _1387 = 1.0 / _1355;
    float _1389 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1235);
    float _1391 = _1277 * _143;
    float _1393 = _1357 * _143;
    float _1395 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1377);
    float _1397 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1283);
    float _1399 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1331);
    float _1401 = _801 + (-0.5);
    float _1403 = _1367 * _143;
    bool _1405 = !_1297;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = _933 ? 0 : 1;
    int _1411 = abs(_1407);
    float _1413 = fma(_1385, _1335, _1335);
    int _1415 = ~_1409;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    int _1421 = _1419;
    float _1423 = _1277;
    float _1425 = _1403;
    if (_1351)
    {
        float _1427 = _1327 * _1387;
        _145 = _1427;
    }
    float _1429 = _145;
    float _1431 = float(_1031);
    float _1433 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1413);
    float _1435 = float(_1411);
    float _1437 = fma(_977, _1385, _977);
    bool _1439 = !_1301;
    int _1441 = _1439 ? 0 : 1;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1445 = _799 + _1443;
    if (!_993)
    {
        int _1447 = ~_1409;
        int _1449 = _1447 + 1;
        _1421 = _1449;
    }
    int _1451 = _1421;
    float _1453 = _1435 * _1431;
    float _1455 = fma(_1437, _1429, _1433);
    int _1457 = abs(_1441);
    float _1459 = _803 + (-0.5);
    float _1461 = _1453 * (-2.0);
    float _1463 = float(_1451);
    float _1465 = fma(_907, _1445, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1467 = float(_1457);
    float _1469 = fma(_1461, _1337, _1337);
    float _1471 = fma(_987, _1461, _987);
    float _1473 = fma(_1465, _1153, _1271);
    float _1475 = _1455 * 0.15915493667125701904296875;
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1469);
    float _1479 = _1467 * _1463;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1483 = _799 + _1481;
    float _1485 = _1475 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = fma(_1471, _1429, _1477);
    float _1491 = _1479 * (-2.0);
    float _1493 = fma(_935, _1483, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1495 = _1489 * 0.15915493667125701904296875;
    float _1497 = fma(_1491, _1339, _1339);
    float _1499 = _805 + (-0.5);
    float _1501 = fma(_1033, _1491, _1033);
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1505 = _799 + _1503;
    float _1507 = fma(_1493, _1123, _1473);
    float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1497);
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1513 = _799 + _1511;
    float _1515 = fma(_1047, _1505, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1517 = _1475 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = fma(_1501, _1429, _1509);
    float _1523 = fma(_975, _1513, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1525 = fma(_1515, _1103, _1507);
    float _1527 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1529 = _1521 * 0.15915493667125701904296875;
    float _1531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1533 = fma(_1523, _1057, _1525);
    float _1535 = _1495 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = _813 * _1527;
    float _1541 = _825 * _1531;
    float _1543 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1533);
    float _1545 = in.m_46.x;
    float _1547 = in.m_46.y;
    float _1549 = in.m_46.z;
    float _1551 = _1543 * _1251;
    float _1553 = _1495 * 6.283185482025146484375;
    float _1555 = cos(_1553);
    float _1557 = _1529 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1487 * _1537;
    float _1563 = _1519 * _1537;
    float _1565 = _1529 * 6.283185482025146484375;
    float _1567 = sin(_1565);
    float _1569 = _1519 * _1555;
    float _1571 = _1487 * _1555;
    float _1573 = _1519 * _1559;
    float _1575 = _1487 * _1559;
    float _1577 = _1555 * _1559;
    float _1579 = _1537 * _1559;
    float _1581 = _1575 * _1541;
    float _1583 = fma(_1567, _1569, _1561);
    float _1585 = fma(_1567, _1561, _1569);
    float _1587 = _1573 * _1541;
    float _1589 = -_1563;
    float _1591 = fma(_1567, _1571, _1589);
    float _1593 = -_1571;
    float _1595 = fma(_1567, _1563, _1593);
    float _1597 = -_1541;
    float _1599 = _1567 * _1597;
    float _1601 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1603 = fma(_1583, _1539, _1587);
    float _1605 = fma(_1591, _1539, _1581);
    float _1607 = fma(_1577, _1539, _1599);
    float _1609 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1611 = fma(_1595, _1601, _1603);
    float _1613 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1615 = fma(_1579, _1601, _1607);
    float _1617 = fma(_1585, _1601, _1605);
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1621 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1623 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1613);
    float _1625 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1627 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1619);
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1621);
    float _1631 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1609);
    float _1633 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1623);
    float _1635 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1627);
    float _1637 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1625);
    float _1639 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1629);
    float _1641 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1631);
    float _1643 = _1633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1645 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1647 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1637);
    float _1649 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1653 = _1643 + _1645;
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1657 = _1649 * _1649;
    float _1659 = _1651 + _1649;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1653 + _1661;
    float _1665 = _1645 * _1645;
    float _1667 = fma(_1655, _1655, _1657);
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1659 + _1669;
    float _1673 = _1663 * _1663;
    float _1675 = _1551 * _1551;
    float _1677 = _1665 + _1667;
    float _1679 = _1547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1681 = fma(_1671, _1671, _1673);
    float _1683 = rsqrt(_1675);
    float _1685 = fma(_1545, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1679);
    float _1687 = fma(_1549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1685);
    float _1689 = rsqrt(_1677);
    float _1691 = sqrt(_1681);
    float _1693 = _1551 * _1683;
    float _1695 = _1687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1697 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1699 = sqrt(_1675);
    float _1701 = _1655 * _1689;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1697);
    float _1705 = _1693 * _1701;
    float _1707 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    bool _1709 = _1691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1711 = _1707 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1715 = _1713 != 0;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1727 = _1725 != 0;
    float _1729 = _1705 * _1699;
    bool _1731 = !_1719;
    int _1733 = _1731 ? 0 : 1;
    bool _1735 = !_1715;
    int _1737 = _1735 ? 0 : 1;
    float _1739 = fma(_1693, _1729, _1655);
    float _1741 = _1699;
    float _1743 = _1655;
    float _1745 = _1739;
    float _1747 = _1677;
    float _1749 = _1707;
    float _1751 = _1697;
    float _1753 = _1549;
    if (!_1709)
    {
        _1741 = _1657;
    }
    float _1755 = _1741;
    bool _1757 = !_1723;
    int _1759 = _1757 ? 0 : 1;
    float _1761 = _1695 + _1739;
    bool _1763 = !_1727;
    int _1765 = _1763 ? 0 : 1;
    float _1767 = _1755;
    if (!_1709)
    {
        _1743 = _1665;
    }
    float _1769 = _1743;
    float _1771 = _1769;
    if (!_1709)
    {
        _1745 = _1645;
    }
    float _1773 = _1745;
    float _1775 = _1773;
    if (!_1709)
    {
        _1747 = _1649;
    }
    float _1777 = _1747;
    float _1779 = _1777;
    if (!_1709)
    {
        _1749 = _1659;
    }
    float _1781 = _1749;
    float _1783 = _1781;
    if (!_1709)
    {
        _1751 = _1653;
    }
    float _1785 = _1751;
    float _1787 = _1785;
    if (!_1709)
    {
        _1753 = _1761;
    }
    float _1789 = _1753;
    bool _1791 = !_1709;
    float _1793 = _1789;
    if (!_1791)
    {
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1799 = _1691 + _1797;
        float _1801 = rsqrt(_1681);
        float _1803 = _1799 * _1795;
        float _1805 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1807 = _1803 * 0.15915493667125701904296875;
        float _1809 = _1807 * 6.283185482025146484375;
        float _1811 = sin(_1809);
        float _1813 = _1807 * 6.283185482025146484375;
        float _1815 = cos(_1813);
        float _1817 = fma(_1811, _1805, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1819 = _1801 * _1817;
        float _1821 = fma(_1671, _1819, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1823 = _1815 + (-1.0);
        float _1825 = fma(_1663, _1819, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1827 = -_1651;
        float _1829 = _1827 + _1821;
        float _1831 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1833 = -_1643;
        float _1835 = _1833 + _1825;
        float _1837 = _1829 * _1829;
        float _1839 = fma(_1761, _1815, _1831);
        float _1841 = _1835 * _1835;
        _1793 = _1839;
        _1767 = _1837;
        _1771 = _1841;
        _1783 = _1821;
        _1787 = _1825;
        _1779 = _1829;
        _1775 = _1835;
    }
    float _1843 = _1793;
    float _1845 = _1767;
    float _1847 = _1771;
    float _1849 = _1783;
    float _1851 = _1787;
    float _1853 = _1779;
    float _1855 = _1775;
    float _1857 = -_1695;
    float _1859 = _1857 + _1843;
    float _1861 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1863 = 1.0 / _1711;
    float _1865 = fma(_1859, _1859, _1845);
    float _1867 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1861);
    bool _1869 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1871 = isnan(0.5);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1877 = _1873 || _1875;
    float _1879 = _1865 + _1847;
    float _1881 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1867);
    float _1883 = sqrt(_1879);
    float _1885 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    float _1897 = _1885 + _1711;
    float _1899 = _1897 * _1863;
    float _1901 = _1899 * 0.5;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1903);
    bool _1907 = _1883 > 0.0;
    float _1909 = 1.0 / _1905;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1913 = _1883;
    float _1915 = _1901;
    float _1917 = _1855;
    float _1919 = _1851;
    float _1921 = _1849;
    float _1923 = _1843;
    if (!_1907)
    {
        _1911 = _1849;
    }
    float _1925 = _1911;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1907)
    {
        _1913 = _1843;
    }
    float _1931 = _1913;
    float _1933 = _1931;
    if (!_1907)
    {
        _1915 = _1851;
    }
    float _1935 = _1915;
    bool _1937 = !_1907;
    float _1939 = _1935;
    if (!_1937)
    {
        float _1941 = _205 * _205;
        float _1943 = fma(_203, _203, _1941);
        float _1945 = fma(_207, _207, _1943);
        float _1947 = rsqrt(_1879);
        float _1949 = sqrt(_1945);
        float _1951 = _1947 * _1853;
        float _1953 = _1859 * _1947;
        float _1955 = _1947 * _1855;
        bool _1957 = _1949 > 0.0;
        float _1959 = _1947;
        float _1961 = _1949;
        _1917 = _1955;
        if (!_1957)
        {
            _1927 = _1849;
        }
        float _1963 = _1927;
        _1929 = _1963;
        if (!_1957)
        {
            _1959 = _1843;
        }
        float _1965 = _1959;
        _1933 = _1965;
        if (!_1957)
        {
            _1961 = _1851;
        }
        float _1967 = _1961;
        bool _1969 = !_1957;
        _1939 = _1967;
        if (!_1969)
        {
            float _1971 = rsqrt(_1945);
            float _1973 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1975 = _205 * _1971;
            float _1977 = _203 * _1971;
            float _1979 = _207 * _1971;
            float _1981 = _1953 * _1975;
            float _1983 = fma(_1951, _1977, _1981);
            float _1985 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1987 = fma(_1955, _1979, _1983);
            float _1989 = _1987 * _1985;
            float _1991 = fma(_203, _1989, _1849);
            float _1993 = fma(_205, _1989, _1843);
            float _1995 = fma(_207, _1989, _1851);
            _1929 = _1991;
            _1933 = _1993;
            _1939 = _1995;
        }
    }
    float _1997 = _1929;
    float _1999 = _1933;
    float _2001 = _1939;
    float _2003 = _1917;
    float _2005 = _2003;
    float _2007 = _2001;
    float _2009 = _1997;
    if (_1895)
    {
        _2005 = 1.0;
    }
    float _2011 = _2005;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = _1909 * _2013;
    float _2017 = _2011;
    if (_1877)
    {
        _1919 = _1997;
    }
    float _2019 = _1919;
    float _2021 = _2019;
    if (_1877)
    {
        _1921 = _1999;
    }
    float _2023 = _1921;
    float _2025 = _2023;
    if (_1877)
    {
        _1923 = _2001;
    }
    float _2027 = _1923;
    float _2029 = _2027;
    if (!_1877)
    {
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2033 = _1695 + _2031;
        float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2037 = _1651 + _2035;
        float _2039 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2041 = -_1695;
        float _2043 = _2041 + _1999;
        float _2045 = _2033 * _2033;
        float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2049 = _1643 + _2047;
        float _2051 = -_1643;
        float _2053 = _2051 + _2001;
        float _2055 = fma(_2037, _2037, _2045);
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2059 = fma(_2049, _2049, _2055);
        float _2061 = sqrt(_2059);
        float _2063 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = precise::min(_2061, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2067 = _2065 * _2057;
        float _2069 = _2063 * _2067;
        float _2071 = -_1651;
        float _2073 = _2071 + _1997;
        float _2075 = fma(_2043, _2069, _1695);
        float _2077 = fma(_2073, _2069, _1651);
        float _2079 = fma(_2053, _2069, _1643);
        _2025 = _2075;
        _2021 = _2077;
        _2029 = _2079;
        _2007 = _2053;
    }
    float _2081 = _2025;
    float _2083 = _2021;
    float _2085 = _2029;
    float _2087 = _2007;
    float _2089 = _2087;
    if (!_1895)
    {
        float _2091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2097 = _2093 * 6.283185482025146484375;
        float _2099 = cos(_2097);
        float _2101 = _2095 * 0.15915493667125701904296875;
        float _2103 = _2093 * 6.283185482025146484375;
        float _2105 = sin(_2103);
        float _2107 = 1.0 / _2099;
        float _2109 = _2101 * 6.283185482025146484375;
        float _2111 = cos(_2109);
        float _2113 = _2105 * _2107;
        float _2115 = _2101 * 6.283185482025146484375;
        float _2117 = sin(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = 1.0 / _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2125 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2123;
        float _2127 = 1.0 / _2125;
        float _2129 = _2117 * _2121;
        float _2131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2133 = fma(_2015, _2129, _2131);
        float _2135 = _2133 * _2127;
        float _2137 = precise::clamp(_2135, 0.0, 1.0);
        _2009 = _2093;
        _2089 = _2101;
        _2017 = _2137;
    }
    float _2139 = _2009;
    float _2141 = _2089;
    float _2143 = _2017;
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2147 = _2081 + _2145;
    float _2149 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2151 = _2083 + _2149;
    float _2153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2155 = _2085 + _2153;
    float _2157 = _2147 * _2147;
    float _2159 = fma(_2151, _2151, _2157);
    float _2161 = fma(_1651, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2165 = fma(_2155, _2155, _2159);
    float _2167 = rsqrt(_2165);
    float _2169 = sqrt(_2165);
    float _2171 = _2167 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2173 = _2151 * _2171;
    float _2175 = _2155 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 * _2175;
    float _2181 = _2177 + _2179;
    float _2183 = sqrt(_2181);
    bool _2185 = _2183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2189 = _2183 + _2187;
    float _2191 = _2155;
    float _2193 = _2181;
    float _2195 = _2189;
    float _2197 = _2139;
    float _2199 = _2147;
    float _2201 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2185)
    {
        float _2203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2191 = _2203;
    }
    float _2205 = _2191;
    if (_2185)
    {
        float _2207 = rsqrt(_2181);
        _2193 = _2207;
    }
    float _2209 = _2193;
    float _2211 = _2209;
    if (_2185)
    {
        float _2213 = _2189 * _2205;
        _2195 = _2213;
    }
    float _2215 = _2195;
    if (_2185)
    {
        float _2217 = _2215 * 0.15915493667125701904296875;
        _2197 = _2217;
    }
    float _2219 = _2197;
    float _2221 = _2167;
    float _2223 = _2219;
    if (_2185)
    {
        float _2225 = _2219 * 6.283185482025146484375;
        float _2227 = sin(_2225);
        _2221 = _2227;
    }
    float _2229 = _2221;
    float _2231 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2233 = precise::max(0.0, _2231);
    float _2235 = _2141;
    float _2237 = _2233;
    float _2239 = _2231;
    if (_2185)
    {
        float _2241 = _2219 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        _2235 = _2243;
    }
    float _2245 = _2235;
    float _2247 = -_2171;
    float _2249 = -_2233;
    float _2251 = fma(_2147, _2247, _2249);
    if (!_2185)
    {
        _2199 = _2173;
    }
    float _2253 = _2199;
    float _2255 = _2253;
    if (_2185)
    {
        float _2257 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2257;
    }
    float _2259 = _2237;
    float _2261 = _2229;
    if (_2185)
    {
        float _2263 = fma(_2229, _2259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2261 = _2263;
    }
    float _2265 = _2261;
    float _2267 = floor(_2161);
    float _2269 = _2265;
    float _2271 = _2245;
    if (_2185)
    {
        float _2273 = _2245 + (-1.0);
        _2239 = _2273;
    }
    float _2275 = _2239;
    float _2277 = _2275;
    if (_2185)
    {
        float _2279 = _2209 * _2265;
        _2201 = _2279;
    }
    float _2281 = _2201;
    if (!_2185)
    {
        _2269 = _2251;
    }
    float _2283 = _2269;
    float _2285 = _2283;
    if (_2185)
    {
        float _2287 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2287;
    }
    float _2289 = _2223;
    if (_2185)
    {
        float _2291 = _2173 * _2281;
        _2255 = _2291;
    }
    float _2293 = _2255;
    if (!_2185)
    {
        _2277 = _2175;
    }
    float _2295 = _2277;
    float _2297 = _2295;
    if (_2185)
    {
        float _2299 = _2175 * _2281;
        _2297 = _2299;
    }
    float _2301 = _2297;
    if (!_2185)
    {
        _2211 = _2177;
    }
    float _2303 = _2211;
    float _2305 = _2303;
    if (_2185)
    {
        float _2307 = fma(_2251, _2245, _2289);
        _2285 = _2307;
    }
    float _2309 = _2285;
    if (_2185)
    {
        float _2311 = _2293 * _2293;
        _2305 = _2311;
    }
    float _2313 = _2305;
    float _2315 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2185)
    {
        _2271 = _2179;
    }
    float _2317 = _2271;
    float _2319 = _2317;
    if (_2185)
    {
        float _2321 = _2301 * _2301;
        _2319 = _2321;
    }
    float _2323 = _2319;
    float _2325 = fma(_2309, _2309, _2313);
    float _2327 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2329 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2331 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2315);
    float _2333 = _2325 + _2323;
    float _2335 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2329);
    float _2337 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2339 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2331);
    float _2341 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2343 = rsqrt(_2333);
    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2347 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2345);
    float _2349 = precise::clamp(_2347, 0.0, 1.0);
    float _2351 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2335);
    float _2353 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2337);
    float _2355 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2357 = -_2349;
    float _2359 = _2357 + 1.0;
    float _2361 = _2351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2363 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2341);
    float _2365 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2353);
    float _2367 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2369 = floor(_2327);
    float _2371 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2363);
    float _2373 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2375 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2367);
    float _2377 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2379 = _2343 * _2293;
    float _2381 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2375);
    float _2383 = abs(_2359);
    float _2385 = log2(_2383);
    float _2387 = _2343 * _2301;
    float _2389 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2391 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2381);
    float _2393 = _2343 * _2309;
    float _2395 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2397 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2399 = -_2389;
    float _2401 = fma(_2393, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2399);
    float _2403 = -_2395;
    float _2405 = fma(_2403, _2163, 1.0);
    float _2407 = 1.0 / _2391;
    float _2409 = -_2369;
    float _2411 = _2327 + _2409;
    float _2413 = -_2387;
    float _2415 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2401);
    float _2417 = -_2267;
    float _2419 = _2161 + _2417;
    float _2421 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2423 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2397);
    float _2425 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2427 = fma(_2415, -0.5, 0.5);
    float _2429 = log2(_2405);
    float _2431 = fma(_2415, 0.5, 0.5);
    float _2433 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2421);
    float _2435 = _2393 + 1.0;
    float _2437 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2423);
    float _2439 = fma(_2431, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2441 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2433);
    float _2443 = exp2(_2425);
    float _2445 = fma(_2431, _2439, -0.212114393711090087890625);
    float _2447 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2441);
    float _2449 = fma(_2431, _2445, 1.570728778839111328125);
    float _2451 = _2447 * _2407;
    float _2453 = sqrt(_2427);
    float _2455 = _2429 * 0.693147182464599609375;
    float _2457 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2459 = fma(_2451, 0.5, 0.5);
    float _2461 = -_2393;
    float _2463 = fma(_2443, _2435, _2461);
    float _2465 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2437);
    float _2467 = fma(_2463, 0.5, 0.5);
    float _2469 = _2465 * _2407;
    float _2471 = _2453 * 0.636619746685028076171875;
    float _2473 = fma(_2469, -0.5, 0.5);
    float _2475 = -_2449;
    float _2477 = fma(_2471, _2475, 1.0);
    float2 _8205 = float2(_2419, _2411);
    float _2479 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8205, float2(0.0), isnan(_8205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8205, float2(0.0), isnan(_8205)), level(0.0)).x;
    float3 _8216 = float3(_2459, _2473, _2457);
    float _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8216, float3(0.0), isnan(_8216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8216, float3(0.0), isnan(_8216)), level(0.0)).x;
    float3 _8227 = float3(_2459, _2473, _2457);
    float4 _2484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8227, float3(0.0), isnan(_8227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8227, float3(0.0), isnan(_8227)), level(0.0)).xyzw;
    float _2486 = _2484.x;
    float _2488 = _2484.y;
    float _2490 = _2484.z;
    float _2492 = _2484.w;
    float2 _8243 = float2(_2477, _2467);
    float3 _2496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8243, float2(0.0), isnan(_8243)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8243, float2(0.0), isnan(_8243)), level(0.0)).xyz;
    float _2498 = _2496.x;
    float _2500 = _2496.y;
    float _2502 = _2496.z;
    float _2504 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2506 = int(_2504);
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2510 = _2508 != 0;
    out.m_64.x = _585;
    out.m_64.y = _579;
    out.m_64.z = _587;
    out.m_64.w = _589;
    int _2512 = abs(_1733);
    float _2514 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2516 = abs(_1051);
    out.m_66.x = _763;
    out.m_66.y = _765;
    out.m_66.z = _767;
    out.m_66.w = _769;
    int _2518 = abs(_1737);
    float _2520 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2522 = int(_2520);
    int _2524 = abs(_1765);
    float _2526 = -_1379;
    float _2528 = _2526 + 1.0;
    float _2530 = -_1397;
    float _2532 = _2530 + 1.0;
    out.m_68.x = _2083;
    out.m_68.y = _2081;
    out.m_68.z = _2085;
    float _2534 = 0.0;
    float _2536 = _2532;
    if (_2510)
    {
        _2534 = 1.0;
    }
    float _2538 = _2534;
    float _2540 = float(uint(_2506));
    float _2542 = trunc(_1393);
    int _2544 = int(_2542);
    float _2546 = _2538;
    if (_2510)
    {
        float _2548 = in.m_58.x;
        _1423 = _2548;
    }
    float _2550 = _1423;
    if (!_2510)
    {
        _2546 = 7.345489978790283203125;
    }
    float _2552 = _2546;
    float _2554 = _2550;
    if (!_2510)
    {
        float _2556 = in.m_58.y;
        _2554 = _2556;
    }
    float _2558 = _2554;
    float _2560 = float(uint(_2522));
    float _2562 = 1.0 / _2540;
    int _2564 = ~_2522;
    int _2566 = _2564 + 1;
    float _2568 = _2552 * _801;
    bool _2570 = _2522 == 0;
    float _2572 = 1.0 / _2560;
    float _2574 = trunc(_1403);
    int _2576 = int(_2574);
    int _2578 = as_type<int>(_2562) + (-2);
    float _2580 = float(uint(_2544));
    float _2582 = as_type<float>(_2578) * _2580;
    int _2584 = as_type<int>(_2572) + (-2);
    float _2586 = floor(_2568);
    if (_2510)
    {
        _1425 = 1.0;
    }
    float _2588 = _1425;
    float _2590 = _2588;
    if (!_2510)
    {
        _2590 = 1.2345600128173828125;
    }
    float _2592 = _2590;
    int _2594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2596 = _2594 != 0;
    float _2598 = float(uint(_2576));
    float _2600 = trunc(_2582);
    float _2602 = precise::max(_2600, 0.0);
    uint _2605 = uint(_2602);
    float _2607 = _2558 * _2592;
    float _2609 = as_type<float>(_2584) * _2598;
    int _2611 = ~_2506;
    int _2613 = _2611 + 1;
    float _2615 = floor(_2607);
    float _2617 = -_2586;
    float _2619 = _2568 + _2617;
    float _2621 = trunc(_2609);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    int _2627 = _2613 * int(_2605);
    int _2629 = _2627 + _2544;
    float _2631 = float(uint(_2629));
    float _2633 = -_2615;
    float _2635 = _2607 + _2633;
    float _2637 = exp2(_2514);
    float _2639 = as_type<float>(_2578) * _2631;
    int _2641 = _2566 * int(_2625);
    int _2643 = _2641 + _2576;
    float _2645 = trunc(_2639);
    float _2647 = precise::max(_2645, 0.0);
    uint _2649 = uint(_2647);
    float _2651 = float(uint(_2643));
    float _2653 = float(_2544);
    float _2655 = -_2637;
    float _2657 = _2655 + 1.0;
    float _2659 = as_type<float>(_2584) * _2651;
    float _2661 = float(_2506);
    int _2663 = ~_2522;
    int _2665 = _2663 + 1;
    float _2667 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2669 = _2653 >= _2661;
    bool _2671 = isnan(_2653);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan(_2661);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    float _2681 = trunc(_2659);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2605) + int(_2649);
    float _2689 = _2619 * _2661;
    int _2691 = ~_2506;
    int _2693 = _2691 + 1;
    float _2695 = _2661 * _1391;
    float _2697 = float(_2522);
    float _2699 = float(_2576);
    int _2701 = _2693 * _2687;
    int _2703 = _2701 + _2544;
    float _2705 = trunc(_2679);
    int _2707 = int(_2705);
    float _2709 = _2697 * _1391;
    bool _2711 = _2699 >= _2697;
    bool _2713 = isnan(_2699);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan(_2697);
    bool _2719 = _2715 || _2717;
    float _2721 = float(_2719);
    float _2723 = _2635 * _2697;
    bool _2725 = uint(_2703) >= uint(_2506);
    int _2727 = int(_2625) + int(_2685);
    float _2729 = trunc(_2689);
    int _2731 = int(_2729);
    bool _2733 = !_2725;
    int _2735 = _2733 ? 0 : (-1);
    int _2737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2739 = _2737 != 0;
    int _2741 = _2665 * _2727;
    int _2743 = _2741 + _2576;
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2747 = _2745 != 0;
    int _2749 = ~_2687;
    int _2751 = _2749 + _2735;
    int _2753 = _2751 + 1;
    float _2755 = trunc(_2695);
    int _2757 = int(_2755);
    bool _2759 = uint(_2743) >= uint(_2522);
    bool _2761 = !_2739;
    int _2763 = _2761 ? 0 : 1;
    int _2765 = _2506 * _2753;
    int _2767 = _2765 + _2544;
    bool _2769 = !_2747;
    int _2771 = _2769 ? 0 : 1;
    int _2773 = abs(_2763);
    float _2775 = trunc(_2721);
    int _2777 = int(_2775);
    bool _2779 = !_2759;
    int _2781 = _2779 ? 0 : (-1);
    bool _2783 = _2506 == 0;
    int _2785 = _2731 * _2773;
    int _2787 = _2785 + _2544;
    int _2789 = abs(_2771);
    int _2791 = ~_2727;
    int _2793 = _2791 + _2781;
    int _2795 = _2793 + 1;
    float _2797 = trunc(_2723);
    int _2799 = int(_2797);
    int _2801 = ~_2707;
    int _2803 = _2801 + 1;
    int _2805 = _2803 + 1;
    bool _2807 = !_2783;
    int _2809 = _2807 ? _2767 : (-1);
    int _2811 = _2522 * _2795;
    int _2813 = _2811 + _2576;
    int _2815 = _2522 + (-1);
    bool _2817 = _807 > 0.5;
    int _2819 = _2809 * _2805;
    int _2821 = _2506 + (-1);
    float _2823 = trunc(_2709);
    int _2825 = int(_2823);
    int _2827 = ~_2777;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    bool _2833 = !_2570;
    int _2835 = _2833 ? _2813 : (-1);
    int _2837 = _2707 * _2821;
    int _2839 = _2837 + _2819;
    int _2841 = abs(_1269);
    int _2843 = _2799 * _2789;
    int _2845 = _2843 + _2576;
    int _2847 = _2835 * _2831;
    int _2849 = abs(_1281);
    int _2851 = _2839 * _2516;
    int _2853 = _2777 * _2815;
    int _2855 = _2853 + _2847;
    bool _2857 = !_2596;
    int _2859 = _2857 ? 0 : 1;
    int _2861 = _2757 * _2841;
    int _2863 = _2861 + _2851;
    int _2865 = abs(_1759);
    int _2867 = _2855 * _2512;
    int _2869 = _2787 * _2849;
    int _2871 = _2869 + _2863;
    int _2873 = abs(_2859);
    int _2875 = _2825 * _2518;
    int _2877 = _2875 + _2867;
    int _2879 = ~_2522;
    int _2881 = _2879 + 1;
    int _2883 = _2731 * _2873;
    int _2885 = _2883 + _2871;
    int _2887 = _2845 * _2865;
    int _2889 = _2887 + _2877;
    int _2891 = ~_2506;
    int _2893 = _2891 + 1;
    float _2895 = float(uint(_2885));
    int _2897 = _2799 * _2524;
    int _2899 = _2897 + _2889;
    float _2901 = float(uint(_2845));
    int _2903 = ~_2506;
    int _2905 = _2903 + 1;
    float _2907 = as_type<float>(_2578) * _2895;
    float _2909 = float(uint(_2899));
    float _2911 = as_type<float>(_2584) * _2901;
    int _2913 = ~_2522;
    int _2915 = _2913 + 1;
    int _2917 = ~_2522;
    int _2919 = _2917 + 1;
    float _2921 = trunc(_2907);
    float _2923 = precise::max(_2921, 0.0);
    uint _2925 = uint(_2923);
    float _2927 = as_type<float>(_2584) * _2909;
    float _2929 = float(uint(_2787));
    float _2931 = as_type<float>(_2578) * _2929;
    float _2933 = trunc(_2927);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    int _2939 = _2893 * int(_2925);
    int _2941 = _2939 + _2885;
    float _2943 = trunc(_2931);
    float _2945 = precise::max(_2943, 0.0);
    uint _2947 = uint(_2945);
    float _2949 = float(uint(_2941));
    int _2951 = _2881 * int(_2937);
    int _2953 = _2951 + _2899;
    float _2955 = trunc(_2911);
    float _2957 = precise::max(_2955, 0.0);
    uint _2959 = uint(_2957);
    float _2961 = as_type<float>(_2578) * _2949;
    float _2963 = float(uint(_2953));
    float _2965 = trunc(_2961);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    float _2971 = as_type<float>(_2584) * _2963;
    int _2973 = _2905 * int(_2947);
    int _2975 = _2973 + _2787;
    float _2977 = float(uint(_2975));
    float _2979 = trunc(_2971);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    int _2985 = _2915 * int(_2959);
    int _2987 = _2985 + _2845;
    float _2989 = as_type<float>(_2578) * _2977;
    int _2991 = ~_2506;
    int _2993 = _2991 + 1;
    int _2995 = int(_2925) + int(_2969);
    float _2997 = trunc(_2989);
    float _2999 = precise::max(_2997, 0.0);
    uint _3001 = uint(_2999);
    int _3003 = _2993 * _2995;
    int _3005 = _3003 + _2885;
    int _3007 = int(_2937) + int(_2983);
    float _3009 = float(uint(_2987));
    bool _3011 = uint(_3005) >= uint(_2506);
    int _3013 = _2919 * _3007;
    int _3015 = _3013 + _2899;
    int _3017 = ~_2506;
    int _3019 = _3017 + 1;
    float _3021 = as_type<float>(_2584) * _3009;
    bool _3023 = !_3011;
    int _3025 = _3023 ? 0 : (-1);
    bool _3027 = uint(_3015) >= uint(_2522);
    int _3029 = ~_2995;
    int _3031 = _3029 + _3025;
    int _3033 = _3031 + 1;
    float _3035 = trunc(_3021);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    bool _3041 = !_3027;
    int _3043 = _3041 ? 0 : (-1);
    int _3045 = int(_2947) + int(_3001);
    int _3047 = _2506 * _3033;
    int _3049 = _3047 + _2885;
    int _3051 = ~_3007;
    int _3053 = _3051 + _3043;
    int _3055 = _3053 + 1;
    int _3057 = _3019 * _3045;
    int _3059 = _3057 + _2787;
    bool _3061 = !_2783;
    int _3063 = _3061 ? _3049 : (-1);
    int _3065 = _2522 * _3055;
    int _3067 = _3065 + _2899;
    int _3069 = _3063 >> 31;
    bool _3071 = !_2570;
    int _3073 = _3071 ? _3067 : (-1);
    bool _3075 = uint(_3059) >= uint(_2506);
    int _3077 = _3073 >> 31;
    int _3079 = _3063 & 3;
    bool _3081 = _3079 != 0;
    float _3083 = -_2479;
    float _3085 = _3083 + 1.0;
    int _3087 = _3077 & 3;
    float _3089 = _2667 * _2481;
    int _3091 = _3069 & 3;
    float _3093 = -_2667;
    float _3095 = _3093 + 1.0;
    bool _3097 = !_3075;
    int _3099 = _3097 ? 0 : (-1);
    int _3101 = _3063 & 3;
    bool _3103 = _3101 != 0;
    bool _3105 = _3079 != 3;
    int _3107 = _3073 + _3087;
    int _3109 = _3063 + _3091;
    int _3111 = _3103 ? 0 : 1;
    bool _3113 = uint(_3079) >= 2u;
    int _3115 = _3107 >> 2;
    bool _3117 = uint(_3079) > 1u;
    int _3119 = ~_3045;
    int _3121 = _3119 + _3099;
    int _3123 = _3121 + 1;
    int _3125 = _3109 >> 2;
    int _3127 = _3113 ? 0 : 1;
    int _3129 = _2506 * _3123;
    int _3131 = _3129 + _2787;
    int _3133 = _3115 << 4;
    int _3135 = _3133 + 512;
    int _3137 = _3125 << 4;
    int _3139 = _3137 + 368;
    int _3141 = ~_3127;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    uint _3147 = uint(int(uint(_3135) >> uint(2)));
    uint _3149 = uint(int(uint(int(_3147)) >> uint(2)));
    int _3151 = int(_3147) & 3;
    float _3153 = (*spvDescriptorSet0.vp_c9)._m0[int(_3149)][_3151];
    int _3155 = int(_3147) + 1;
    uint _3157 = uint(int(uint(_3155) >> uint(2)));
    int _3159 = _3155 & 3;
    float _3161 = (*spvDescriptorSet0.vp_c9)._m0[int(_3157)][_3159];
    int _3163 = _3145;
    if (_3105)
    {
        int _3165 = ~_3127;
        int _3167 = _3165 + 1;
        _3163 = _3167;
    }
    int _3169 = _3163;
    int _3171 = int(_2959) + int(_3039);
    int _3173 = ~_2522;
    int _3175 = _3173 + 1;
    int _3177 = ~_3111;
    int _3179 = _3177 + 1;
    int _3181 = _3179 + 1;
    uint _3183 = uint(int(uint(_3139) >> uint(2)));
    uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
    int _3187 = int(_3183) & 3;
    float _3189 = (*spvDescriptorSet0.vp_c9)._m0[int(_3185)][_3187];
    int _3191 = int(_3183) + 1;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    int _3195 = _3191 & 3;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[int(_3193)][_3195];
    int _3199 = _3181;
    if (!_3117)
    {
        int _3201 = ~_3111;
        int _3203 = _3201 + 1;
        _3199 = _3203;
    }
    int _3205 = _3199;
    int _3207 = _3175 * _3171;
    int _3209 = _3207 + _2845;
    int _3211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3213 = _3211 != 0;
    bool _3215 = !_2783;
    int _3217 = _3215 ? _3131 : (-1);
    int _3219 = _3073 & 3;
    bool _3221 = _3219 != 0;
    int _3223 = _3073 & 3;
    bool _3225 = _3223 != 0;
    bool _3227 = !_3081;
    int _3229 = _3227 ? 0 : 1;
    bool _3231 = !_3213;
    int _3233 = _3231 ? 0 : 1;
    int _3235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3237 = _3235 != 0;
    bool _3239 = _3079 != 3;
    bool _3241 = uint(_3209) >= uint(_2522);
    int _3243 = _3135 + 8;
    uint _3245 = uint(int(uint(_3243) >> uint(2)));
    uint _3247 = uint(int(uint(int(_3245)) >> uint(2)));
    int _3249 = int(_3245) & 3;
    float _3251 = (*spvDescriptorSet0.vp_c9)._m0[int(_3247)][_3249];
    int _3253 = int(_3245) + 1;
    uint _3255 = uint(int(uint(_3253) >> uint(2)));
    int _3257 = _3253 & 3;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[int(_3255)][_3257];
    bool _3261 = !_3237;
    int _3263 = _3261 ? 0 : 1;
    bool _3265 = uint(_3223) > 1u;
    int _3267 = _3221 ? 0 : 1;
    bool _3269 = !_3239;
    int _3271 = _3269 ? 0 : (-1);
    int _3273 = _3139 + 8;
    uint _3275 = uint(int(uint(_3273) >> uint(2)));
    uint _3277 = uint(int(uint(int(_3275)) >> uint(2)));
    int _3279 = int(_3275) & 3;
    float _3281 = (*spvDescriptorSet0.vp_c9)._m0[int(_3277)][_3279];
    int _3283 = int(_3275) + 1;
    uint _3285 = uint(int(uint(_3283) >> uint(2)));
    int _3287 = _3283 & 3;
    float _3289 = (*spvDescriptorSet0.vp_c9)._m0[int(_3285)][_3287];
    bool _3291 = !_3225;
    int _3293 = _3291 ? 0 : 1;
    bool _3295 = uint(_3223) >= 2u;
    bool _3297 = _3223 != 3;
    bool _3299 = _3223 != 3;
    int _3301 = ~_3267;
    int _3303 = _3301 + 1;
    int _3305 = _3303 + 1;
    int _3307 = _3305;
    if (!_3265)
    {
        int _3309 = ~_3267;
        int _3311 = _3309 + 1;
        _3307 = _3311;
    }
    int _3313 = _3307;
    int _3315 = _3295 ? 0 : 1;
    bool _3317 = !_3297;
    int _3319 = _3317 ? 0 : (-1);
    int _3321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3323 = _3321 != 0;
    int _3325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3327 = _3325 != 0;
    int _3329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3331 = _3329 != 0;
    bool _3333 = !_3241;
    int _3335 = _3333 ? 0 : (-1);
    bool _3337 = _801 > 0.5;
    int _3339 = abs(_3205);
    int _3341 = ~_3171;
    int _3343 = _3341 + _3335;
    int _3345 = _3343 + 1;
    float _3347 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3349 = int(_3347);
    int _3351 = abs(_3313);
    int _3353 = ~_3315;
    int _3355 = _3353 + 1;
    int _3357 = _3355 + 1;
    int _3359 = _3357;
    if (_3299)
    {
        int _3361 = ~_3315;
        int _3363 = _3361 + 1;
        _3359 = _3363;
    }
    int _3365 = _3359;
    int _3367 = abs(_3229);
    int _3369 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3371 = _3369 != 0;
    int _3373 = abs(_3293);
    int _3375 = ~_3351;
    int _3377 = _3375 + 1;
    int _3379 = _3377 + 1;
    int _3381 = _2522 * _3345;
    int _3383 = _3381 + _2845;
    int _3385 = ~_3339;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    int _3391 = _3379 * as_type<int>(_3161);
    int _3393 = _3389 * as_type<int>(_3197);
    int _3395 = abs(_3169);
    float _3397 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3399 = int(_3397);
    int _3401 = abs(_3365);
    int _3403 = ~_3367;
    int _3405 = _3403 + 1;
    int _3407 = _3405 + 1;
    int _3409 = ~_3373;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = _3407 * as_type<int>(_3189);
    int _3417 = _3415 + _3393;
    int _3419 = _3413 * as_type<int>(_3153);
    int _3421 = _3419 + _3391;
    int _3423 = ~_3395;
    int _3425 = _3423 + 1;
    int _3427 = _3425 + 1;
    int _3429 = ~_3401;
    int _3431 = _3429 + 1;
    int _3433 = _3431 + 1;
    float _3435 = float(uint(_3349));
    int _3437 = _3427 * as_type<int>(_3281);
    int _3439 = _3437 + _3417;
    bool _3441 = !_2570;
    int _3443 = _3441 ? _3383 : (-1);
    int _3445 = _3433 * as_type<int>(_3251);
    int _3447 = _3445 + _3421;
    int _3449 = abs(_3271);
    float _3451 = abs(_2015);
    float _3453 = log2(_3451);
    int _3455 = abs(_3319);
    int _3457 = ~_3449;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    bool _3463 = _803 > 0.5;
    int _3465 = abs(_3349);
    float _3467 = 1.0 / _3435;
    float _3469 = float(uint(_3399));
    int _3471 = _3461 * as_type<int>(_3289);
    int _3473 = _3471 + _3439;
    int _3475 = ~_3455;
    int _3477 = _3475 + 1;
    int _3479 = _3477 + 1;
    int _3481 = abs(_3233);
    float _3483 = float(uint(_3465));
    float _3485 = 1.0 / _3469;
    int _3487 = abs(_3263);
    int _3489 = _3479 * as_type<int>(_3259);
    int _3491 = _3489 + _3447;
    int _3493 = ~_3481;
    int _3495 = _3493 + 1;
    int _3497 = _3495 + 1;
    float _3499 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3501 = ~_3487;
    int _3503 = _3501 + 1;
    int _3505 = _3503 + 1;
    float _3507 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3509 = abs(_3399);
    float _3511 = 1.0 / _3483;
    int _3513 = _3491 * _3497;
    float _3515 = -_191;
    int _3517 = _3337 ? as_type<int>(_3515) : as_type<int>(_191);
    int _3519 = _3473 * _3505;
    float _3521 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3523 = _805 > 0.5;
    int _3525 = _3443 * _3481;
    int _3527 = _3525 + _3513;
    int _3529 = as_type<int>(_3467) + (-2);
    int _3531 = _3217 * _3487;
    int _3533 = _3531 + _3519;
    float _3535 = exp2(_3499);
    float _3537 = float(uint(_3509));
    float _3539 = -_1567;
    float _3541 = fma(_3539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3507);
    float _3543 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3545 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3547 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3541);
    int _3549 = as_type<int>(_3511) + (-2);
    float _3551 = 1.0 / _3537;
    float _3553 = -_1567;
    float _3555 = fma(_3553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3521);
    float _3557 = float(uint(_3533));
    float _3559 = -_1567;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3543);
    int _3563 = ~_3399;
    int _3565 = _3563 + 1;
    float _3567 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3555);
    float _3569 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3545);
    float _3571 = as_type<float>(_3529) * _3557;
    int _3573 = as_type<int>(_3485) + (-2);
    float _3575 = fma(_3535, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = float(uint(_3527));
    float _3581 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3561);
    int _3583 = abs(_3533);
    float _3585 = trunc(_3571);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    int _3591 = ~_3349;
    int _3593 = _3591 + 1;
    float _3595 = as_type<float>(_3573) * _3579;
    float _3597 = float(uint(_3583));
    float _3599 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3601 = as_type<int>(_3551) + (-2);
    float _3603 = as_type<float>(_3549) * _3597;
    float _3605 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3607 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3609 = trunc(_3595);
    float _3611 = precise::max(_3609, 0.0);
    uint _3613 = uint(_3611);
    float _3615 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3599);
    float _3617 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3605);
    float _3619 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3607);
    float _3621 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3623 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3625 = ~_3465;
    int _3627 = _3625 + 1;
    float _3629 = trunc(_3603);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = abs(_3527);
    float _3637 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3621);
    float _3639 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3623);
    int _3641 = _3593 * int(_3589);
    int _3643 = _3641 + _3533;
    float _3645 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3615);
    int _3647 = _3565 * int(_3613);
    int _3649 = _3647 + _3527;
    float _3651 = float(uint(_3635));
    float _3653 = float(uint(_3643));
    float _3655 = float(uint(_3649));
    float _3657 = as_type<float>(_3601) * _3651;
    bool _3659 = !_3371;
    float _3661 = _3659 ? _191 : as_type<float>(_3517);
    int _3663 = _3627 * int(_3633);
    int _3665 = _3663 + _3583;
    float _3667 = as_type<float>(_3529) * _3653;
    float _3669 = as_type<float>(_3573) * _3655;
    float _3671 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3617);
    float _3673 = trunc(_3657);
    float _3675 = precise::max(_3673, 0.0);
    uint _3677 = uint(_3675);
    float _3679 = float(uint(_3665));
    float _3681 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3569);
    float _3683 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3619);
    int _3685 = ~_3509;
    int _3687 = _3685 + 1;
    float _3689 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3691 = as_type<float>(_3549) * _3679;
    float _3693 = -_191;
    int _3695 = _3523 ? as_type<int>(_3693) : as_type<int>(_191);
    float _3697 = trunc(_3667);
    float _3699 = precise::max(_3697, 0.0);
    uint _3701 = uint(_3699);
    float _3703 = -_201;
    int _3705 = _3463 ? as_type<int>(_3703) : as_type<int>(_201);
    out.m_70.x = _3671;
    out.m_70.y = _3681;
    out.m_70.z = _3683;
    bool _3707 = !_3331;
    float _3709 = _3707 ? _191 : as_type<float>(_3695);
    float _3711 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3713 = -_201;
    int _3715 = _2817 ? as_type<int>(_3713) : as_type<int>(_201);
    bool _3717 = !_3327;
    float _3719 = _3717 ? _201 : as_type<float>(_3705);
    int _3721 = _3687 * int(_3677);
    int _3723 = _3721 + _3635;
    float _3725 = trunc(_3669);
    float _3727 = precise::max(_3725, 0.0);
    uint _3729 = uint(_3727);
    bool _3731 = !_3323;
    float _3733 = _3731 ? _201 : as_type<float>(_3715);
    float _3735 = fma(_3577, -2.0, 3.0);
    float _3737 = _3577 * _3577;
    float _3739 = float(uint(_3723));
    float _3741 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3637);
    float _3743 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3639);
    float _3745 = _3689 * _3567;
    float _3747 = trunc(_3691);
    float _3749 = precise::max(_3747, 0.0);
    uint _3751 = uint(_3749);
    float _3753 = as_type<float>(_3601) * _3739;
    float _3755 = _3689 * _3581;
    float _3757 = _3737 * _3735;
    float _3759 = fma(_3711, _3671, _3745);
    int _3761 = ~_3349;
    int _3763 = _3761 + 1;
    float _3765 = fma(_3711, _3683, _3755);
    int _3767 = int(_3589) + int(_3701);
    float _3769 = trunc(_3753);
    float _3771 = precise::max(_3769, 0.0);
    uint _3773 = uint(_3771);
    float _3775 = _3689 * _3547;
    float _3777 = _2355 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3779 = int(_3613) + int(_3729);
    int _3781 = _3763 * _3767;
    int _3783 = _3781 + _3533;
    int _3785 = ~_3399;
    int _3787 = _3785 + 1;
    float _3789 = fma(_3711, _3681, _3775);
    int _3791 = ~_3465;
    int _3793 = _3791 + 1;
    float _3795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3797 = int(_3633) + int(_3751);
    int _3799 = _3787 * _3779;
    int _3801 = _3799 + _3527;
    int _3803 = ~_3509;
    int _3805 = _3803 + 1;
    float _3807 = -_3757;
    float _3809 = _3807 + 1.0;
    bool _3811 = uint(_3783) >= uint(_3349);
    int _3813 = _3793 * _3797;
    int _3815 = _3813 + _3583;
    float _3817 = fma(_3809, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    int _3819 = int(_3677) + int(_3773);
    float _3821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3823 = uint(_3801) >= uint(_3399);
    float _3825 = fma(_2361, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3777);
    bool _3827 = !_3811;
    int _3829 = _3827 ? 0 : (-1);
    int _3831 = _3805 * _3819;
    int _3833 = _3831 + _3635;
    bool _3835 = uint(_3815) >= uint(_3465);
    float _3837 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3825);
    bool _3839 = !_3823;
    int _3841 = _3839 ? 0 : (-1);
    int _3843 = ~_3767;
    int _3845 = _3843 + _3829;
    int _3847 = _3845 + 1;
    int _3849 = _3533 ^ _3349;
    int _3851 = ~_3779;
    int _3853 = _3851 + _3841;
    int _3855 = _3853 + 1;
    int _3857 = _3349 * _3847;
    int _3859 = _3857 + _3533;
    bool _3861 = uint(_3833) >= uint(_3509);
    float _3863 = _3821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3865 = _3349 == 0;
    int _3867 = _3399 * _3855;
    int _3869 = _3867 + _3527;
    bool _3871 = _3349 == 0;
    int _3873 = _3527 ^ _3399;
    float _3875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3877 = !_3835;
    int _3879 = _3877 ? 0 : (-1);
    uint _3881 = uint(int(uint(_3849) >> uint(31)));
    bool _3883 = _3399 == 0;
    bool _3885 = _3399 == 0;
    bool _3887 = !_3861;
    int _3889 = _3887 ? 0 : (-1);
    uint _3891 = uint(int(uint(_3873) >> uint(31)));
    int _3893 = ~_3879;
    int _3895 = _3797 + _3893;
    int _3897 = _3895 + 1;
    float _3899 = fma(_3689, _3689, 1.0);
    int _3901 = ~int(_3881);
    int _3903 = _3901 + 1;
    float _3905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3907 = ~_3889;
    int _3909 = _3819 + _3907;
    int _3911 = _3909 + 1;
    int _3913 = ~int(_3891);
    int _3915 = _3913 + 1;
    bool _3917 = !_3865;
    int _3919 = _3917 ? _3859 : (-1);
    int _3921 = _3897 ^ _3903;
    float _3923 = rsqrt(_3899);
    int _3925 = _3911 ^ _3915;
    float _3927 = float(_3919);
    int _3929 = ~_3903;
    int _3931 = _3929 + _3921;
    int _3933 = _3931 + 1;
    bool _3935 = !_3883;
    int _3937 = _3935 ? _3869 : (-1);
    float _3939 = fma(_3863, _3927, _1375);
    int _3941 = ~_3915;
    int _3943 = _3941 + _3925;
    int _3945 = _3943 + 1;
    float _3947 = _3875 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3949 = float(_3937);
    float _3951 = _3661 + 0.5;
    bool _3953 = !_3871;
    int _3955 = _3953 ? _3933 : (-1);
    float _3957 = _3795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3959 = _2015 <= 8000.0;
    bool _3961 = isnan(_2015);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan(8000.0);
    bool _3967 = _3963 || _3965;
    float _3969 = float(_3967);
    float _3971 = fma(_3863, _3951, _3939);
    float _3973 = float(_3955);
    float _3975 = fma(_3947, _3949, _1383);
    float _3977 = _3709 + 0.5;
    bool _3979 = !_3885;
    int _3981 = _3979 ? _3945 : (-1);
    float _3983 = _3905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3985 = -_919;
    float _3987 = fma(_3957, _3973, _3985);
    float _3989 = fma(_3947, _3977, _3975);
    float _3991 = _3689 * _3923;
    float _3993 = float(_3981);
    float _3995 = _3719 + (-0.5);
    float _3997 = _3969 * _3817;
    float _3999 = -_3743;
    float _4001 = _3991 * _3999;
    float _4003 = _2502 * _3089;
    float _4005 = -_3957;
    float _4007 = fma(_4005, _3995, _3987);
    float _4009 = -_1399;
    float _4011 = fma(_3983, _3993, _4009);
    float _4013 = -_3645;
    float _4015 = _3991 * _4013;
    float _4017 = -_3741;
    float _4019 = _3991 * _4017;
    float _4021 = fma(_3923, _3581, _4001);
    float _4023 = fma(_3719, _2528, _4007);
    float _4025 = _3733 + (-0.5);
    float _4027 = in.m_72.x;
    float _4029 = fma(_3923, _3547, _4019);
    float _4031 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4033 = -_3983;
    float _4035 = fma(_4033, _4025, _4011);
    float _4037 = fma(_3923, _3567, _4015);
    float _4039 = -_1395;
    float _4041 = _4039 + 1.0;
    float _4043 = _3085 * _4031;
    float _4045 = precise::clamp(_4043, 0.0, 1.0);
    float _4047 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3837);
    float _4049 = -_1389;
    float _4051 = _4049 + 1.0;
    out.m_74.x = _4037;
    out.m_74.y = _4029;
    out.m_74.z = _4021;
    float _4053 = -_4041;
    float _4055 = fma(_3661, _4053, _3971);
    float _4057 = _4047 + _2391;
    float _4059 = fma(_3733, _2532, _4035);
    float _4061 = -_4051;
    float _4063 = fma(_3709, _4061, _3989);
    float _4065 = _3645 + _3759;
    float _4067 = _4057 * 0.5;
    float _4069 = _3741 + _3789;
    float _4071 = _3743 + _3765;
    float _4073 = fma(_2492, _4003, _2490);
    out.m_76.x = _4055;
    out.m_76.y = _4023;
    out.m_76.z = _4063;
    out.m_76.w = _4059;
    float _4075 = _2492 * _3089;
    bool _4077 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4079 = isnan(_2169);
    bool _4081 = _4077 || _4079;
    bool _4083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4085 = _4081 || _4083;
    out.m_78.z = _4067;
    out.m_78.w = _2391;
    float _4087 = -_4045;
    float _4089 = fma(_4087, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4091 = fma(_2498, _4075, _2486);
    float _4093 = fma(_2500, _4075, _2488);
    out.m_80.x = _4065;
    out.m_80.y = _4069;
    out.m_80.z = _4071;
    float _4095 = _4089 * _4027;
    float _4097 = _2492 * _3095;
    out.gl_Position.x = _2447;
    out.gl_Position.y = _2465;
    out.gl_Position.z = _4047;
    out.gl_Position.w = _2391;
    float _4099 = _4095 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4101 = _4057;
    float _4103 = _4021;
    float _4105 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4107 = _4075;
    float _4109 = _2447;
    if (!_4085)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4111 = _2536;
    out.m_82.x = _4091;
    out.m_82.y = _4093;
    out.m_82.z = _4073;
    out.m_82.w = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4085)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4117 = _4101;
    float _4119 = _4117;
    float _4121 = _4117;
    if (!_4085)
    {
        _4103 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4123 = _4103;
    out.m_84.x = _4099;
    float _4125 = _4123;
    float _4127 = _4123;
    if (!_4085)
    {
        _4105 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4129 = _4105;
    float _4131 = _4129;
    float _4133 = _4129;
    if (!_4085)
    {
        _4107 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4135 = _4107;
    float _4137 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4139 = _4135;
    float _4141 = _4135;
    if (!_4085)
    {
        _4109 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4143 = _4109;
    bool _4145 = !_4085;
    float _4147 = _4143;
    float _4149 = _4143;
    if (!_4145)
    {
        bool _4151 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4153 = isnan(_2169);
        bool _4155 = _4151 || _4153;
        bool _4157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4159 = _4155 || _4157;
        if (!_4159)
        {
            float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4163 = _2169 + _4161;
            float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4165;
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4173 = 1.0 / _4167;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4191 = _4163 * _4173;
            float _4193 = precise::clamp(_4191, 0.0, 1.0);
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4199 = fma(_4193, _4171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4201 = fma(_4193, _4197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4203 = fma(_4193, _4177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4205 = fma(_4193, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4207 = fma(_4193, _4185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4209 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4149 = _4203;
            _4133 = _4207;
            _4115 = _4199;
            _4127 = _4205;
            _4121 = _4201;
            _4141 = _4209;
            _4211 = true;
        }
        else
        {
            bool _4213 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4215 = isnan(_2169);
            bool _4217 = _4213 || _4215;
            bool _4219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4221 = _4217 || _4219;
            if (!_4221)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4223 = _4113;
            _4115 = _4223;
            if (!_4221)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4225 = _4147;
            _4149 = _4225;
            if (!_4221)
            {
                _4119 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4227 = _4119;
            _4121 = _4227;
            if (!_4221)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4229 = _4125;
            _4127 = _4229;
            if (!_4221)
            {
                _4131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4231 = _4131;
            _4133 = _4231;
            if (!_4221)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4233 = _4139;
            bool _4235 = !_4221;
            _4141 = _4233;
            if (!_4235)
            {
                bool _4237 = _2169 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4239 = isnan(_2169);
                bool _4241 = _4237 || _4239;
                bool _4243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4245 = _4241 || _4243;
                if (!_4245)
                {
                    float _4247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4249 = _2169 + _4247;
                    float _4251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4251;
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4257 = _4255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4259 = 1.0 / _4253;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4277 = _4249 * _4259;
                    float _4279 = precise::clamp(_4277, 0.0, 1.0);
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4285 = fma(_4279, _4257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4287 = fma(_4279, _4283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4289 = fma(_4279, _4263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4291 = fma(_4279, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4293 = fma(_4279, _4271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4295 = fma(_4279, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4149 = _4289;
                    _4133 = _4293;
                    _4115 = _4285;
                    _4127 = _4291;
                    _4121 = _4287;
                    _4141 = _4295;
                    _4211 = true;
                }
                else
                {
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4121 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4211 = false;
    float _4297 = _4149;
    float _4299 = _4133;
    float _4301 = _4115;
    float _4303 = _4127;
    float _4305 = _4121;
    float _4307 = _4141;
    float _4309 = fma(_4069, -0.5, 0.5);
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = -_4297;
    float _4315 = _4313 + _4299;
    float _4317 = _4137 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4319 = -_4301;
    float _4321 = _4319 + _4303;
    float _4323 = fma(_4311, _4315, _4297);
    out.m_86.x = 0.0;
    float _4325 = -_4305;
    float _4327 = _4325 + _4307;
    float _4329 = fma(_4311, _4321, _4301);
    float _4331 = _4323 * 0.586610972881317138671875;
    out.m_49.x = _4317;
    bool _4333 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4335 = fma(_4311, _4327, _4305);
    float _4337 = fma(_4329, 0.298911988735198974609375, _4331);
    bool _4339 = _2143 > 0.0;
    bool _4341 = isnan(_2143);
    bool _4343 = _4339 || _4341;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    float _4349 = fma(_4335, 0.114477999508380889892578125, _4337);
    float _4351 = -_4349;
    float _4353 = _4329 + _4351;
    float _4355 = -_4349;
    float _4357 = _4323 + _4355;
    float _4359 = -_4349;
    float _4361 = _4335 + _4359;
    float _4363 = fma(_4353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    float _4365 = fma(_4357, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    float _4367 = fma(_4361, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4349);
    bool _4369 = !_4333;
    if (!_4369)
    {
        float _4371 = -_2081;
        float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4375 = -_2083;
        float _4377 = _4375 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4379 = -_2085;
        float _4381 = _4379 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4383 = _4373 * _4373;
        float _4385 = fma(_4377, _4377, _4383);
        float _4387 = fma(_4381, _4381, _4385);
        float _4389 = sqrt(_4387);
        float _4391 = rsqrt(_4387);
        float _4393 = -_4389;
        float _4395 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4397 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4399 = precise::clamp(_4397, 0.0, 1.0);
        float _4401 = _4377 * _4391;
        float _4403 = _4373 * _4391;
        float _4405 = abs(_4399);
        float _4407 = log2(_4405);
        float _4409 = _4381 * _4391;
        float _4411 = _4401 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4413 = _4069 * _4403;
        float _4415 = -_4403;
        float _4417 = -_4411;
        float _4419 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4417);
        float _4421 = fma(_4065, _4401, _4413);
        float _4423 = -_4409;
        float _4425 = fma(_4423, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4419);
        float _4427 = fma(_4071, _4409, _4421);
        float _4429 = precise::clamp(_4427, 0.0, 1.0);
        float _4431 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4433 = _4425 + _4431;
        float _4435 = _4407 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4437 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4439 = precise::clamp(_4437, 0.0, 1.0);
        float _4441 = exp2(_4435);
        float _4443 = _4441 * _4439;
        float _4445 = _4429 * _4443;
        float _4447 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4449 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4451 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _4447;
        out.m_86.y = _4449;
        out.m_86.z = _4451;
    }
    out.m_88.x = _4363;
    out.m_88.y = _4365;
    out.m_88.z = _4367;
    if (_4347)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _4453 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4453;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

