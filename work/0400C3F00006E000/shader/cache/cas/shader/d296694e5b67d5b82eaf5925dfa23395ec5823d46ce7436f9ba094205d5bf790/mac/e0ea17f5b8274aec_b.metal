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
    float4 m_56 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_64 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _685 = false;
    bool _383 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2982 = as_type<float>(_107);
        out.gl_Position.z = _2982;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3052 = as_type<float>(_145);
        out.gl_Position.z = _3052;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _169 = 0.5;
    float _187;
    if (!_167)
    {
        float _171 = in.m_52.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_91);
        float _193 = 1.0 / _191;
        float _195 = _125 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = 1.0 / _213;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _239 = 1.0 / _221;
    float _241 = 1.0 / _217;
    float _243 = _201 * _235;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_233;
    float _259 = _257 + 1.0;
    float _261 = _255 * _259;
    float _263 = _205 * _239;
    bool _265 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_197);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_255;
    float _279 = _277 + 1.0;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _285 = _275 * _279;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _209 * _241;
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = fma(_283, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _319 = fma(_307, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = _303 * _289;
    float _323 = fma(_313, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = fma(_317, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _319 * _321;
    float _333 = _323 * _321;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _347 = fma(_337, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _349 = fma(_309, _285, _339);
    float _351 = fma(_343, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _353 = fma(_325, _285, _345);
    float _355 = fma(_347, _261, _349);
    float _357 = fma(_351, _261, _353);
    float _359 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].x, _355);
    float _361 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].y, _357);
    bool _363 = !_237;
    float _381;
    if (!_363)
    {
        float _365 = in.m_52.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_91);
        float _387 = 1.0 / _385;
        float _389 = _125 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _399 = _391 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _391 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _421 = 1.0 / _415;
    bool _423 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _425 = isnan(_391);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _411;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _439 = _391 + _437;
    bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _443 = 1.0 / _419;
    float _445 = _395 * _421;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _407;
    float _461 = _439 * _435;
    bool _463 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _465 = isnan(_391);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _477 = isnan(_391);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = _399 * _443;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _493;
    bool _497 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_391);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _457 * _489;
    float _511 = -_457;
    float _513 = _511 + 1.0;
    float _515 = fma(_495, _445, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _521 = _403 * _459;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _527;
    float _531 = _485 * _513;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_525, _445, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _539 = fma(_529, _445, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _541 = -_485;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = fma(_519, _491, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _551 = fma(_535, _491, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = _433 * _543;
    float _555 = -_433;
    float _557 = _555 + 1.0;
    float _559 = fma(_547, _491, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _561 = _507 * _557;
    float _563 = -_507;
    float _565 = _563 + 1.0;
    float _567 = _515 * _561;
    float _569 = _537 * _561;
    float _571 = _539 * _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _581;
    float _585 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].x, _567);
    float _587 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].y, _569);
    float _589 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].z, _571);
    float _591 = fma(_575, _521, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _593 = fma(_579, _521, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _595 = fma(_583, _521, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _597 = fma(_549, _553, _585);
    float _599 = fma(_559, _553, _587);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _613 = fma(_551, _553, _589);
    float _615 = fma(_603, _461, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _617 = fma(_607, _461, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _619 = fma(_593, _531, _599);
    float _621 = fma(_611, _461, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _623 = fma(_591, _531, _597);
    float _625 = fma(_595, _531, _613);
    float _627 = fma(_617, _509, _619);
    float _629 = fma(_615, _509, _623);
    float _631 = fma(_621, _509, _625);
    float _633 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].y, _627);
    float _635 = in.m_54.x;
    float _637 = in.m_54.y;
    float _639 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].x, _629);
    float _641 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].z, _631);
    float _643 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _647 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _653;
    out.m_56.y = _651;
    out.m_56.z = _655;
    out.m_56.w = _645;
    float _657 = _361 * _637;
    float _659 = _359 * _635;
    bool _661 = !_441;
    float _681;
    float _683;
    if (!_661)
    {
        float _663 = in.m_52.x;
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _667 = float(_91);
        float _669 = _663 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _673 = _671 * _665;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = _667;
        _685 = true;
    }
    else
    {
        float _687 = float(_91);
        float _689 = 1.0 / _687;
        float _691 = _125 * _689;
        _681 = _691;
        _683 = _687;
    }
    _685 = false;
    float _693 = _681;
    float _695 = _683;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _699 = int(_697);
    float _701 = in.m_52.x;
    float _703 = in.m_52.y;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _707 = _693 + _705;
    float _709 = in.m_42.x;
    float _711 = in.m_42.y;
    float _713 = in.m_42.z;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _717 = int(_715);
    bool _719 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _721 = isnan(_693);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    bool _731 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _733 = isnan(_693);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _695;
    float _745 = float(_699);
    float _747 = 1.0 / _745;
    float _749 = float(uint(_717));
    int _751 = ~_717;
    int _753 = _751 + 1;
    int _755 = ~_717;
    int _757 = _755 + 1;
    int _759 = ~_717;
    int _761 = _759 + 1;
    float _763 = 1.0 / _749;
    float _765 = _747 * _125;
    float _767 = trunc(_765);
    int _769 = int(_767);
    int _771 = as_type<int>(_763) + (-2);
    float _773 = float(uint(_769));
    float _775 = float(_769);
    float _777 = as_type<float>(_771) * _773;
    float _779 = trunc(_777);
    float _781 = precise::max(_779, 0.0);
    uint _784 = uint(_781);
    int _786 = _753 * int(_784);
    int _788 = _786 + _769;
    float _790 = float(_717);
    float _792 = float(uint(_788));
    float _794 = as_type<float>(_771) * _792;
    float _796 = trunc(_794);
    float _798 = precise::max(_796, 0.0);
    uint _800 = uint(_798);
    int _802 = int(_784) + int(_800);
    bool _804 = _775 >= _790;
    bool _806 = isnan(_775);
    bool _808 = _804 || _806;
    bool _810 = isnan(_790);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    int _816 = _757 * _802;
    int _818 = _816 + _769;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = trunc(_814);
    int _826 = int(_824);
    bool _828 = !_822;
    float _830 = _828 ? 7.345489978790283203125 : 1.0;
    bool _832 = uint(_818) >= uint(_717);
    float _834 = _830 * _701;
    bool _836 = !_832;
    int _838 = _836 ? 0 : (-1);
    bool _840 = _717 == 0;
    float _842 = floor(_834);
    int _844 = ~_802;
    int _846 = _844 + _838;
    int _848 = _846 + 1;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _860 = _858 != 0;
    int _862 = ~_826;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = _717 * _848;
    int _870 = _868 + _769;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _874 = _872 != 0;
    bool _876 = !_840;
    int _878 = _876 ? _870 : (-1);
    float _880 = -_842;
    float _882 = _834 + _880;
    int _884 = _878 * _866;
    int _886 = _717 + (-1);
    float _888 = _882 * _790;
    float _890 = _790 * _125;
    bool _892 = !_874;
    int _894 = _892 ? 0 : 1;
    int _896 = _826 * _886;
    int _898 = _896 + _884;
    bool _900 = !_856;
    int _902 = _900 ? 0 : 1;
    float _904 = _890 * _743;
    float _906 = trunc(_888);
    int _908 = int(_906);
    bool _910 = !_852;
    int _912 = _910 ? 0 : 1;
    int _914 = abs(_902);
    int _916 = abs(_894);
    bool _918 = !_860;
    int _920 = _918 ? 0 : 1;
    float _922 = trunc(_904);
    int _924 = int(_922);
    int _926 = abs(_912);
    int _928 = abs(_920);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _932 = _930 != 0;
    int _934 = _898 * _914;
    int _936 = _908 * _916;
    int _938 = _936 + _769;
    bool _940 = !_932;
    int _942 = _940 ? 0 : 1;
    float _944 = in.m_58.x;
    float _946 = in.m_58.y;
    float _948 = in.m_58.z;
    float _950 = in.m_58.w;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _954 = _952 != 0;
    int _956 = abs(_942);
    int _958 = _924 * _926;
    int _960 = _958 + _934;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _964 = _962 != 0;
    int _966 = _938 * _928;
    int _968 = _966 + _960;
    int _970 = _908 * _956;
    int _972 = _970 + _968;
    float _974 = float(uint(_938));
    float _976 = float(uint(_972));
    float _978 = as_type<float>(_771) * _974;
    float _980 = as_type<float>(_771) * _976;
    int _982 = ~_717;
    int _984 = _982 + 1;
    float _986 = trunc(_978);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    float _992 = _711 * _946;
    float _994 = trunc(_980);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    float _1000 = in.m_60.x;
    float _1002 = in.m_60.y;
    float _1004 = in.m_60.z;
    float _1006 = in.m_60.w;
    int _1008 = _984 * int(_998);
    int _1010 = _1008 + _972;
    float _1012 = float(uint(_1010));
    float _1014 = as_type<float>(_771) * _1012;
    float _1016 = in.m_62.x;
    float _1018 = in.m_62.y;
    float _1020 = in.m_62.z;
    float _1022 = in.m_62.w;
    float _1024 = trunc(_1014);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = _711 * _1002;
    float _1032 = fma(_709, _1000, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1038 = 1.0 / _1036;
    int _1040 = int(_998) + int(_1028);
    int _1042 = ~_717;
    int _1044 = _1042 + 1;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1046;
    int _1050 = _761 * _1040;
    int _1052 = _1050 + _972;
    int _1054 = _1044 * int(_990);
    int _1056 = _1054 + _938;
    bool _1058 = uint(_1052) >= uint(_717);
    float _1060 = _711 * _1018;
    float _1062 = float(uint(_1056));
    float _1064 = fma(_709, _944, _992);
    bool _1066 = !_1058;
    int _1068 = _1066 ? 0 : (-1);
    float _1070 = 1.0 / _1048;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1072;
    float _1076 = as_type<float>(_771) * _1062;
    int _1078 = ~_1040;
    int _1080 = _1078 + _1068;
    int _1082 = _1080 + 1;
    float _1084 = fma(_709, _1016, _1060);
    float _1086 = trunc(_1076);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    int _1092 = _717 * _1082;
    int _1094 = _1092 + _972;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1098 = _703 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1102 = _701 * 2.0;
    bool _1104 = !_840;
    int _1106 = _1104 ? _1094 : (-1);
    float _1108 = fma(_713, _1020, _1084);
    float _1110 = fma(_1098, -2.0, _1100);
    int _1112 = ~_717;
    int _1114 = _1112 + 1;
    float _1116 = -_1096;
    float _1118 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1116);
    int _1120 = _1106 & 3;
    bool _1122 = _1120 != 0;
    float _1124 = floor(_1102);
    int _1126 = _1106 & 3;
    bool _1128 = _1126 != 0;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1134 = uint(_1120) > 1u;
    float _1136 = _703 * 2.0;
    int _1138 = int(_990) + int(_1090);
    float _1140 = _1108 + _1022;
    float _1142 = fma(_713, _948, _1064);
    int _1144 = _1106 >> 31;
    float _1146 = 1.0 / _1132;
    int _1148 = _1128 ? 0 : 1;
    int _1150 = _1114 * _1138;
    int _1152 = _1150 + _938;
    int _1154 = _1144 & 3;
    float _1156 = fma(_713, _1004, _1032);
    int _1158 = ~_1148;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = _1142 + _950;
    int _1166 = _1106 + _1154;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1170 = _693 + _1168;
    int _1172 = _1162;
    float _1174 = _1164;
    if (!_1134)
    {
        int _1176 = ~_1148;
        int _1178 = _1176 + 1;
        _1172 = _1178;
    }
    int _1180 = _1172;
    float _1182 = 1.0 / _1074;
    int _1184 = _1166 >> 2;
    float _1186 = in.m_52.z;
    bool _1188 = uint(_1152) >= uint(_717);
    float _1190 = _1170 * _1038;
    int _1192 = _1184 << 4;
    int _1194 = _1192 + 368;
    float _1196 = _703 + _701;
    bool _1198 = uint(_1120) >= 2u;
    float _1200 = floor(_1136);
    bool _1202 = !_1188;
    int _1204 = _1202 ? 0 : (-1);
    uint _1206 = uint(int(uint(_1194) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[int(_1216)][_1218];
    bool _1222 = _1124 >= 0.0;
    bool _1224 = isnan(_1124);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan(0.0);
    bool _1230 = _1226 || _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1234 = _693 + _1232;
    int _1236 = _1198 ? 0 : 1;
    float _1238 = _1196 + (-1.0);
    bool _1240 = _1124 > 0.0;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1244 = _693 + _1242;
    int _1246 = _1230 ? 0 : 1;
    float _1248 = _707 * _1182;
    bool _1250 = _1120 != 3;
    float _1252 = _1244 * _1070;
    int _1254 = ~_1138;
    int _1256 = _1254 + _1204;
    int _1258 = _1256 + 1;
    float _1260 = _1234 * _1146;
    int _1262 = _1194 + 8;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[int(_1274)][_1276];
    int _1280 = ~_1246;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = _1156 + _1006;
    int _1288 = ~_1236;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    float _1294 = _703 + _1186;
    int _1296 = _1284;
    int _1298 = _1292;
    if (!_1240)
    {
        int _1300 = ~_1246;
        int _1302 = _1300 + 1;
        _1296 = _1302;
    }
    int _1304 = _1296;
    int _1306 = _717 * _1258;
    int _1308 = _1306 + _938;
    bool _1310 = _1200 > 0.0;
    float _1312 = _1294 + (-1.0);
    if (_1250)
    {
        int _1314 = ~_1236;
        int _1316 = _1314 + 1;
        _1298 = _1316;
    }
    int _1318 = _1298;
    bool _1320 = _1200 >= 0.0;
    bool _1322 = isnan(_1200);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.0);
    bool _1328 = _1324 || _1326;
    float _1330 = _1186 * 2.0;
    int _1332 = _1328 ? 0 : 1;
    float _1334 = floor(_1330);
    float _1336 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1338 = ~_1332;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    int _1344 = _1342;
    if (!_1310)
    {
        int _1346 = ~_1332;
        int _1348 = _1346 + 1;
        _1344 = _1348;
    }
    int _1350 = _1344;
    float _1352 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1354 = !_954;
    int _1356 = _1354 ? 0 : 1;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1360 = _1358 != 0;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1368 = _1366 != 0;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1370;
    bool _1374 = !_840;
    int _1376 = _1374 ? _1308 : (-1);
    bool _1378 = !_1122;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = fma(_1372, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1384 = _1120 != 3;
    int _1386 = abs(_1180);
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1388;
    int _1392 = abs(_1380);
    bool _1394 = !_1384;
    int _1396 = _1394 ? 0 : (-1);
    float _1398 = fma(_1390, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1400 = _1334 > 0.0;
    bool _1402 = _1334 >= 0.0;
    bool _1404 = isnan(_1334);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1412;
    int _1416 = ~_1386;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = fma(_1414, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1424 = abs(_1318);
    int _1426 = _1420 * as_type<int>(_1220);
    int _1428 = ~_1392;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1446 = _1432 * as_type<int>(_1212);
    int _1448 = _1446 + _1426;
    int _1450 = ~_1424;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1436, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1458 = fma(_1440, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1460 = _1454 * as_type<int>(_1270);
    int _1462 = _1460 + _1448;
    int _1464 = abs(_1396);
    float _1466 = fma(_1444, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1468;
    float _1472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1474 = log2(_1472);
    int _1476 = ~_1464;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1486;
    int _1490 = abs(_1356);
    float _1492 = fma(_1470, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    int _1494 = _1480 * as_type<int>(_1278);
    int _1496 = _1494 + _1462;
    float _1498 = fma(_1484, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1500 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1502 = int(_1500);
    float _1504 = fma(_1488, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    int _1518 = ~_1490;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    float _1524 = fma(_1508, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1526 = _1474 * _125;
    float _1528 = fma(_1512, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1530 = fma(_1516, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _1532 = _1496 * _1522;
    bool _1534 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1536 = isnan(_693);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    bool _1546 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1548 = isnan(_693);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    int _1558 = _1376 * _1490;
    int _1560 = _1558 + _1532;
    float _1562 = float(uint(_1502));
    float _1564 = exp2(_1526);
    bool _1566 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1568 = isnan(_693);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = -_1544;
    float _1580 = _1578 + 1.0;
    int _1582 = abs(_1502);
    float _1584 = _1576 * _1580;
    float _1586 = float(uint(_1582));
    float _1588 = 1.0 / _1562;
    float _1590 = -_1576;
    float _1592 = _1590 + 1.0;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1596 = 1.0 + _1594;
    int _1598 = _1410 ? 0 : 1;
    float _1600 = _1556 * _1592;
    float _1602 = -_1556;
    float _1604 = _1602 + 1.0;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = 1.0 / _1586;
    float _1618 = _741 * _1604;
    float _1620 = -_1564;
    float _1622 = _1620 + 1.0;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1626 = float(uint(_1560));
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1630 = abs(_1560);
    float _1632 = 1.0 / _1596;
    int _1634 = as_type<int>(_1588) + (-2);
    float _1636 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1624);
    float _1638 = _1614 ? _1622 : 0.0;
    float _1640 = -_125;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1118);
    bool _1644 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1646 = isnan(1.0);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1652 = _1648 || _1650;
    float _1654 = as_type<float>(_1634) * _1626;
    float _1656 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1636);
    float _1658 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1110);
    float _1660 = -_741;
    float _1662 = _1660 + 1.0;
    int _1664 = as_type<int>(_1616) + (-2);
    float _1666 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1628);
    float _1668 = float(uint(_1630));
    float _1670 = trunc(_1654);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = _729 * _1662;
    float _1678 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1666);
    float _1680 = -_729;
    float _1682 = _1680 + 1.0;
    float _1684 = as_type<float>(_1664) * _1668;
    float _1686 = _1656;
    if (_1652)
    {
        float _1688 = _1638 * _1632;
        _127 = _1688;
    }
    float _1690 = _127;
    float _1692 = _1398 * _1676;
    float _1694 = _1382 * _1676;
    float _1696 = trunc(_1684);
    float _1698 = precise::max(_1696, 0.0);
    uint _1700 = uint(_1698);
    int _1702 = ~_1502;
    int _1704 = _1702 + 1;
    float _1706 = _1422 * _1676;
    float _1708 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1692);
    float _1710 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1694);
    int _1712 = ~_1582;
    int _1714 = _1712 + 1;
    float _1716 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1706);
    int _1718 = ~_1598;
    int _1720 = _1718 + 1;
    int _1722 = _1720 + 1;
    int _1724 = _1704 * int(_1674);
    int _1726 = _1724 + _1560;
    int _1728 = _1722;
    if (!_1400)
    {
        int _1730 = ~_1598;
        int _1732 = _1730 + 1;
        _1728 = _1732;
    }
    int _1734 = _1728;
    float _1736 = fma(_1458, _1618, _1708);
    float _1738 = fma(_1456, _1618, _1710);
    float _1740 = float(uint(_1726));
    float _1742 = fma(_1466, _1618, _1716);
    bool _1744 = !_1360;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = _1714 * int(_1700);
    int _1750 = _1748 + _1630;
    float _1752 = fma(_1498, _1600, _1736);
    float _1754 = as_type<float>(_1634) * _1740;
    int _1756 = abs(_1746);
    float _1758 = fma(_1492, _1600, _1738);
    float _1760 = float(uint(_1750));
    float _1762 = fma(_1504, _1600, _1742);
    float _1764 = float(_1304);
    float _1766 = trunc(_1754);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = float(_1756);
    float _1774 = as_type<float>(_1664) * _1760;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1778 = _1140 + _1776;
    int _1780 = ~_1502;
    int _1782 = _1780 + 1;
    float _1784 = fma(_1524, _1584, _1758);
    float _1786 = float(_1734);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1164 + _1788;
    float _1792 = trunc(_1774);
    float _1794 = precise::max(_1792, 0.0);
    uint _1796 = uint(_1794);
    float _1798 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1800 = !_1364;
    int _1802 = _1800 ? 0 : 1;
    float _1804 = _1772 * _1786;
    float _1806 = fma(_1528, _1584, _1752);
    float _1808 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1798);
    int _1810 = ~_1582;
    int _1812 = _1810 + 1;
    float _1814 = in.m_64.x;
    float _1816 = in.m_64.y;
    float _1818 = in.m_64.z;
    int _1820 = int(_1674) + int(_1770);
    float _1822 = fma(_1530, _1584, _1762);
    int _1824 = abs(_1802);
    float _1826 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1784);
    float _1828 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1806);
    int _1830 = _1782 * _1820;
    int _1832 = _1830 + _1560;
    float _1834 = _1804 * (-2.0);
    float _1836 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1822);
    int _1838 = int(_1700) + int(_1796);
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1842 = uint(_1832) >= uint(_1502);
    float _1844 = fma(_1336, _1834, _1336);
    float _1846 = float(_1824);
    int _1848 = _1812 * _1838;
    int _1850 = _1848 + _1630;
    bool _1852 = !_1842;
    int _1854 = _1852 ? 0 : (-1);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1858 = _1286 + _1856;
    int _1860 = _1560 ^ _1502;
    float _1862 = _1846 * _1764;
    bool _1864 = uint(_1850) >= uint(_1582);
    float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1808);
    int _1868 = ~_1820;
    int _1870 = _1868 + _1854;
    int _1872 = _1870 + 1;
    float _1874 = _1862 * (-2.0);
    bool _1876 = !_1864;
    int _1878 = _1876 ? 0 : (-1);
    float _1880 = fma(_1834, _1814, _1814);
    bool _1882 = _1502 == 0;
    int _1884 = _1502 * _1872;
    int _1886 = _1884 + _1560;
    bool _1888 = _1502 == 0;
    float _1890 = fma(_1874, _1816, _1816);
    uint _1892 = uint(int(uint(_1860) >> uint(31)));
    float _1894 = -_1678;
    float _1896 = _1894 + 1.0;
    int _1898 = ~_1878;
    int _1900 = _1838 + _1898;
    int _1902 = _1900 + 1;
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1906 = ~int(_1892);
    int _1908 = _1906 + 1;
    float _1910 = fma(_1352, _1874, _1352);
    bool _1912 = !_1882;
    int _1914 = _1912 ? _1886 : (-1);
    float _1916 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1918 = _701 > 0.5;
    int _1920 = _1902 ^ _1908;
    float _1922 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1924 = float(_1914);
    float _1926 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1928 = -_161;
    int _1930 = _1918 ? as_type<int>(_1928) : as_type<int>(_161);
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1934 = _1932 != 0;
    float _1936 = fma(_1926, _1924, _1642);
    int _1938 = ~_1908;
    int _1940 = _1938 + _1920;
    int _1942 = _1940 + 1;
    float _1944 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1946 = _703 > 0.5;
    bool _1948 = !_1934;
    float _1950 = _1948 ? _161 : as_type<float>(_1930);
    bool _1952 = !_1888;
    int _1954 = _1952 ? _1942 : (-1);
    float _1956 = _701 + (-0.5);
    float _1958 = -_165;
    int _1960 = _1946 ? as_type<int>(_1958) : as_type<int>(_165);
    float _1962 = _1950 + 0.5;
    float _1964 = float(_1954);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1880);
    bool _1968 = !_964;
    float _1970 = _1968 ? _165 : as_type<float>(_1960);
    float _1972 = _1778 * _1778;
    float _1974 = fma(_1926, _1962, _1936);
    float _1976 = _703 + (-0.5);
    float _1978 = -_1658;
    float _1980 = fma(_1944, _1964, _1978);
    float _1982 = _1970 + (-0.5);
    float _1984 = fma(_1790, _1790, _1972);
    bool _1986 = _1866 >= 0.0;
    float _1988 = -_1656;
    float _1990 = _1988 + 1.0;
    float _1992 = -_1944;
    float _1994 = fma(_1992, _1982, _1980);
    float _1996 = fma(_1858, _1858, _1984);
    float _1998 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2000 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2002 = -_1990;
    float _2004 = fma(_1950, _2002, _1974);
    bool _2006 = !_1368;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = rsqrt(_1996);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2016 = fma(_1970, _1896, _1994);
    int _2018 = as_type<int>(_1826);
    float _2020 = _1818;
    if (_1986)
    {
        _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2022 = _1686;
    if (_1986)
    {
        out.m_45.x = 0.0;
    }
    int _2024 = abs(_2008);
    float _2026 = fma(_1844, _1690, _1966);
    float _2028 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1890);
    if (_1986)
    {
        float _2030 = _2022 * 5.0;
        _2018 = as_type<int>(_2030);
    }
    int _2032 = _2018;
    float _2034 = float(_1350);
    out.m_66.x = _2012;
    out.m_66.y = _1922;
    out.m_66.z = _2014;
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5886 = as_type<float>(_2032);
        out.gl_Position.z = _5886;
    }
    float _2036 = _1778 * _2010;
    float _2038 = _1790 * _2010;
    float _2040 = _1858 * _2010;
    out.m_68.x = _2004;
    out.m_68.y = _2016;
    float _2042 = -_2036;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1778);
    float _2046 = _2038;
    if (_1986)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2048 = -_2036;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1140);
    float _2052 = -_2038;
    float _2054 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1790);
    float _2056 = _2044 * _2044;
    float _2058 = -_2038;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2050 + _2062;
    float _2066 = float(_2024);
    float _2068 = fma(_2054, _2054, _2056);
    float _2070 = -_2040;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1286);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2076 = _2060 + _2074;
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2080 = -_2040;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _2084 = _1186 + _701;
    float _2086 = _2026 * 0.15915493667125701904296875;
    float _2088 = _2066 * _2034;
    float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2092 = _2072 + _2090;
    float _2094 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2078);
    float _2096 = fma(_2082, _2082, _2068);
    float _2098 = _2084 + (-1.0);
    float _2100 = _2088 * (-2.0);
    float _2102 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2094);
    float _2104 = _1186 + (-0.5);
    float _2106 = sqrt(_2096);
    float _2108 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2110 = fma(_2100, _1818, _1818);
    bool _2112 = _2102 >= 0.0;
    float _2114 = fma(_1910, _1690, _2028);
    float _2116 = fma(_2108, _2100, _2108);
    float _2118 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2110);
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2086 * 6.283185482025146484375;
    float _2124 = sin(_2122);
    float _2126 = fma(_2116, _1690, _2118);
    float _2128 = _2126 * 0.15915493667125701904296875;
    float _2130 = _2092;
    if (_2112)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2132 = _2020;
    float _2134 = _2010 * _2106;
    float _2136 = _2086 * 6.283185482025146484375;
    float _2138 = cos(_2136);
    int _2140 = as_type<int>(_2132);
    if (_2112)
    {
        out.m_45.x = 0.0;
    }
    if (_2112)
    {
        float _2142 = _2132 * 5.0;
        _2140 = as_type<int>(_2142);
    }
    int _2144 = _2140;
    float _2146 = _2120 * 6.283185482025146484375;
    float _2148 = sin(_2146);
    if (_2112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6086 = as_type<float>(_2144);
        out.gl_Position.z = _6086;
    }
    float _2150 = _2120 * 6.283185482025146484375;
    float _2152 = cos(_2150);
    float _2154 = _2128 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    if (_2112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2158 = _2128 * 6.283185482025146484375;
    float _2160 = cos(_2158);
    float _2162 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _2166 = _659 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2168 = _2124 * _2148;
    float _2170 = _2134 * _2162;
    float _2172 = _2138 * _2152;
    float _2174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _2176 = _2134 * _2166;
    float _2178 = _2164 * _2170;
    float _2180 = fma(_2156, _2172, _2168);
    float _2182 = fma(_2156, _2168, _2172);
    float _2184 = _2174 * _2176;
    float _2186 = _2138 * _2148;
    float _2188 = _2124 * _2152;
    float _2190 = _2160 * _2178;
    float _2192 = _2148 * _2160;
    float _2194 = _2152 * _2160;
    bool _2196 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2198 = isnan(0.5);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2204 = _2200 || _2202;
    float _2206 = _2138 * _2190;
    float _2208 = -_2178;
    float _2210 = _2156 * _2208;
    float _2212 = -_2188;
    float _2214 = fma(_2156, _2186, _2212);
    float _2216 = -_2186;
    float _2218 = fma(_2156, _2188, _2216);
    float _2220 = fma(_2180, _2184, _2206);
    float _2222 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2224 = _2222 * 0.5;
    float _2226 = _2124 * _2190;
    float _2228 = fma(_2194, _2184, _2210);
    float _2230 = fma(_2214, _2224, _2220);
    float _2232 = fma(_2218, _2184, _2226);
    float _2234 = fma(_2192, _2224, _2228);
    float _2236 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = fma(_2182, _2224, _2232);
    float _2240 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2246);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2248);
    float _2256 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2258 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2260 = _2254 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2262 = _1286 + _2256;
    float _2264 = _1164 + _2258;
    float _2266 = _1140 + _2260;
    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2270 = _2262 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2274 = _2264 + _2272;
    float _2276 = _2270 * _2270;
    float _2278 = fma(_2274, _2274, _2276);
    float _2280 = sqrt(_2278);
    bool _2282 = _2280 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2284 = _2242;
    float _2286 = _2276;
    float _2288 = _2264;
    float _2290 = _2274;
    if (!_2282)
    {
        _2284 = _2262;
    }
    float _2292 = _2284;
    float _2294 = _2292;
    if (!_2282)
    {
        _2286 = _2266;
    }
    float _2296 = _2286;
    bool _2298 = !_2282;
    float _2300 = _2296;
    if (!_2298)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2306 = _2280 + _2304;
        float _2308 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = rsqrt(_2278);
        float _2312 = _2306 * _2302;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = _2314 * 6.283185482025146484375;
        float _2322 = sin(_2320);
        float _2324 = _2318 + (-1.0);
        float _2326 = fma(_2322, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2328 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2330 = _2310 * _2326;
        float _2332 = fma(_2266, _2318, _2328);
        float _2334 = fma(_2274, _2330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2336 = fma(_2270, _2330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2288 = _2334;
        _2300 = _2332;
        _2294 = _2336;
    }
    float _2338 = _2288;
    float _2340 = _2300;
    float _2342 = _2294;
    float _2344 = -_2038;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2338);
    float _2348 = -_2036;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2340);
    float _2352 = -_2040;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2342);
    float _2356 = _2350;
    float _2358 = _2346;
    float _2360 = _2354;
    if (!_2204)
    {
        float _2362 = _2064 * _2064;
        float _2364 = -_1164;
        float _2366 = _2364 + _2338;
        float _2368 = -_1140;
        float _2370 = _2368 + _2340;
        float _2372 = fma(_2076, _2076, _2362);
        float _2374 = 1.0 / _2134;
        float _2376 = fma(_2092, _2092, _2372);
        float _2378 = sqrt(_2376);
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2382 = precise::min(_2378, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2384 = _2382 * _2380;
        float _2386 = _2384 * _2374;
        float _2388 = -_1286;
        float _2390 = _2388 + _2342;
        float _2392 = fma(_2366, _2386, _2060);
        float _2394 = fma(_2370, _2386, _2050);
        float _2396 = fma(_2390, _2386, _2072);
        _2356 = _2394;
        _2358 = _2392;
        _2360 = _2396;
        _2130 = _2380;
    }
    float _2398 = _2356;
    float _2400 = _2358;
    float _2402 = _2360;
    float _2404 = _2130;
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2408 = _2398 + _2406;
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2412 = _2400 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2416 = _2402 + _2414;
    float _2418 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2420 = _2408 * _2408;
    float _2422 = fma(_2412, _2412, _2420);
    float _2424 = fma(_2416, _2416, _2422);
    float _2426 = rsqrt(_2424);
    float _2428 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2430 = _2412 * _2428;
    float _2432 = _2416 * _2428;
    float _2434 = _2430 * _2430;
    float _2436 = _2432 * _2432;
    float _2438 = _2434 + _2436;
    float _2440 = sqrt(_2438);
    bool _2442 = _2440 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2446 = _2440 + _2444;
    float _2448 = _2416;
    float _2450 = _2422;
    float _2452 = _2446;
    float _2454 = _2430;
    if (_2442)
    {
        float _2456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2448 = _2456;
    }
    float _2458 = _2448;
    if (_2442)
    {
        float _2460 = rsqrt(_2438);
        _2450 = _2460;
    }
    float _2462 = _2450;
    float _2464 = _2462;
    if (_2442)
    {
        float _2466 = _2446 * _2458;
        _2452 = _2466;
    }
    float _2468 = _2452;
    if (_2442)
    {
        float _2470 = _2468 * 0.15915493667125701904296875;
        _1174 = _2470;
    }
    float _2472 = _1174;
    float _2474 = _2426;
    float _2476 = _2472;
    if (_2442)
    {
        float _2478 = _2472 * 6.283185482025146484375;
        float _2480 = sin(_2478);
        _2474 = _2480;
    }
    float _2482 = _2474;
    float _2484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2486 = precise::max(0.0, _2484);
    float _2488 = _2404;
    float _2490 = _2486;
    float _2492 = _2484;
    if (_2442)
    {
        float _2494 = _2472 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        _2488 = _2496;
    }
    float _2498 = _2488;
    float _2500 = -_2428;
    float _2502 = -_2486;
    float _2504 = fma(_2408, _2500, _2502);
    if (!_2442)
    {
        _2490 = _2432;
    }
    float _2506 = _2490;
    float _2508 = _2506;
    if (_2442)
    {
        float _2510 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2510;
    }
    float _2512 = _2492;
    float _2514 = sqrt(_2424);
    float _2516 = _2482;
    float _2518 = _2512;
    if (_2442)
    {
        float _2520 = fma(_2482, _2512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2516 = _2520;
    }
    float _2522 = _2516;
    float _2524 = _2522;
    if (_2442)
    {
        float _2526 = _2498 + (-1.0);
        _2518 = _2526;
    }
    float _2528 = _2518;
    float _2530 = _2528;
    if (_2442)
    {
        float _2532 = _2462 * _2522;
        _2290 = _2532;
    }
    float _2534 = _2290;
    if (!_2442)
    {
        _2464 = _2504;
    }
    float _2536 = _2464;
    float _2538 = _2536;
    if (_2442)
    {
        float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2476 = _2540;
    }
    float _2542 = _2476;
    if (_2442)
    {
        float _2544 = _2430 * _2534;
        _2454 = _2544;
    }
    float _2546 = _2454;
    if (!_2442)
    {
        _2524 = _2434;
    }
    float _2548 = _2524;
    float _2550 = _2548;
    if (_2442)
    {
        float _2552 = _2432 * _2534;
        _2508 = _2552;
    }
    float _2554 = _2508;
    if (_2442)
    {
        float _2556 = fma(_2504, _2498, _2542);
        _2538 = _2556;
    }
    float _2558 = _2538;
    if (_2442)
    {
        float _2560 = _2546 * _2546;
        _2550 = _2560;
    }
    float _2562 = _2550;
    if (!_2442)
    {
        _2530 = _2436;
    }
    float _2564 = _2530;
    float _2566 = _2564;
    if (_2442)
    {
        float _2568 = _2554 * _2554;
        _2566 = _2568;
    }
    float _2570 = _2566;
    float _2572 = fma(_2558, _2558, _2562);
    float _2574 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2576 = _2572 + _2570;
    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2580 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2578);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2586 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2574);
    float _2588 = rsqrt(_2576);
    float _2590 = -_2582;
    float _2592 = _2590 + 1.0;
    float _2594 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2596 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2584);
    float _2598 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2600 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2586);
    float _2602 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2594);
    float _2604 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2596);
    float _2606 = abs(_2592);
    float _2608 = log2(_2606);
    float _2610 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2598);
    float _2612 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2602);
    float _2614 = _2604 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2616 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2618 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2610);
    float _2620 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2622 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2624 = _2588 * _2546;
    float _2626 = _2618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2628 = _2588 * _2558;
    float _2630 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2622);
    float _2632 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2634 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2636 = _2588 * _2554;
    float _2638 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2630);
    float _2640 = -_2632;
    float _2642 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2640);
    float _2644 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2646 = -_2634;
    float _2648 = fma(_2646, _2418, 1.0);
    float _2650 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2638);
    float _2652 = -_2636;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2642);
    float _2656 = exp2(_2644);
    float _2658 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2660 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2662 = fma(_2654, -0.5, 0.5);
    float _2664 = fma(_2654, 0.5, 0.5);
    float _2666 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2658);
    float _2668 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2660);
    float _2670 = _2628 + 1.0;
    float _2672 = log2(_2648);
    float _2674 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2666);
    float _2676 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2668);
    float _2678 = fma(_2664, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2680 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2676);
    float _2682 = fma(_2664, _2678, -0.212114393711090087890625);
    float _2684 = 1.0 / _2650;
    float _2686 = -_2628;
    float _2688 = fma(_2656, _2670, _2686);
    float _2690 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2674);
    float _2692 = fma(_2664, _2682, 1.570728778839111328125);
    float _2694 = fma(_2688, 0.5, 0.5);
    float _2696 = sqrt(_2662);
    float _2698 = _2672 * 0.693147182464599609375;
    float _2700 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2702 = _2690 * _2684;
    float _2704 = _2680 * _2684;
    float _2706 = fma(_2702, 0.5, 0.5);
    float _2708 = fma(_2704, -0.5, 0.5);
    float _2710 = _2696 * 0.636619746685028076171875;
    float _2712 = -_2692;
    float _2714 = fma(_2710, _2712, 1.0);
    float3 _7015 = float3(_2706, _2708, _2700);
    float _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7015, float3(0.0), isnan(_7015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7015, float3(0.0), isnan(_7015)), level(0.0)).x;
    float3 _7026 = float3(_2706, _2708, _2700);
    float4 _2719 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7026, float3(0.0), isnan(_7026)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7026, float3(0.0), isnan(_7026)), level(0.0)).xyzw;
    float _2721 = _2719.x;
    float _2723 = _2719.y;
    float _2725 = _2719.z;
    float _2727 = _2719.w;
    float2 _7043 = float2(_2714, _2694);
    float3 _2731 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7043, float2(0.0), isnan(_7043)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7043, float2(0.0), isnan(_7043)), level(0.0)).xyz;
    float _2733 = _2731.x;
    float _2735 = _2731.y;
    float _2737 = _2731.z;
    float _2739 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2741 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2745 = isnan(0.5);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2751 = _2747 || _2749;
    float _2753 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2755 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2739);
    float _2757 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2741);
    float _2759 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2753);
    float _2761 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2755);
    float _2763 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2757);
    float _2765 = _2761 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2767 = _2763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2769 = 1.0 / _2765;
    float _2771 = _2767 + _2765;
    float _2773 = _2700;
    float _2775 = _2761;
    float _2777 = _2765;
    if (!_2751)
    {
        _2046 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2779 = _2046;
    if (!_2751)
    {
        float _2781 = -_2779;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2773 = _2783;
    }
    float _2785 = _2773;
    float _2787 = _2785;
    if (!_2751)
    {
        float _2789 = 1.0 / _2785;
        _2787 = _2789;
    }
    float _2791 = _2787;
    float _2793 = _2771 * _2769;
    float _2795 = _2793 * 0.5;
    float _2797 = _2769;
    float _2799 = _2795;
    if (_2751)
    {
        _2797 = 1.0;
    }
    float _2801 = _2797;
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2803);
    float _2807 = _2801;
    if (!_2751)
    {
        _2799 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2809 = _2799;
    float _2811 = 1.0 / _2805;
    float _2813 = _2809;
    if (!_2751)
    {
        float _2815 = -_2809;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2775 = _2817;
    }
    float _2819 = _2775;
    float _2821 = _2819;
    if (!_2751)
    {
        float _2823 = 1.0 / _2819;
        _2821 = _2823;
    }
    float _2825 = _2821;
    if (!_2751)
    {
        float _2827 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2829 = -_2779;
        float _2831 = fma(_2811, _2827, _2829);
        _2777 = _2831;
    }
    float _2833 = _2777;
    float _2835 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2837 = _2833;
    if (!_2751)
    {
        float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2841 = -_2809;
        float _2843 = fma(_2811, _2839, _2841);
        _169 = _2843;
    }
    float _2845 = _169;
    if (_2751)
    {
        _2813 = 1.0;
    }
    float _2847 = _2813;
    float _2849 = _2847;
    if (!_2751)
    {
        float _2851 = _2833 * _2791;
        float _2853 = precise::clamp(_2851, 0.0, 1.0);
        _2837 = _2853;
    }
    float _2855 = _2837;
    float _2857 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2759);
    float _2859 = exp2(_2835);
    if (!_2751)
    {
        float _2861 = _2845 * _2825;
        float _2863 = precise::clamp(_2861, 0.0, 1.0);
        _2849 = _2863;
    }
    float _2865 = _2849;
    if (!_2751)
    {
        float _2867 = -_2855;
        float _2869 = _2867 + 1.0;
        _2807 = _2869;
    }
    float _2871 = _2807;
    float _2873 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2857);
    float _2875 = _2865 * _2871;
    bool _2877 = _2865 > 0.0;
    bool _2879 = isnan(_2865);
    bool _2881 = _2877 || _2879;
    bool _2883 = isnan(0.0);
    bool _2885 = _2881 || _2883;
    out.gl_Position.x = _2690;
    out.gl_Position.y = _2680;
    out.gl_Position.z = _2873;
    out.gl_Position.w = _2650;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2889 = _2871 <= 0.0;
    bool _2891 = !_2885;
    bool _2893 = _2889 || _2891;
    float _2895 = _2887 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2897 = _2873 + _2650;
    float _2899 = -_2859;
    float _2901 = _2899 + 1.0;
    float _2903 = _2897 * 0.5;
    float _2905 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2895;
    float _2907 = -_2905;
    float _2909 = _2907 + 1.0;
    out.m_70.z = _2903;
    out.m_70.w = _2650;
    float _2911 = _2905 * _2716;
    float _2913 = _2727 * _2909;
    float _2915 = _2727 * _2911;
    float _2917 = _2737 * _2911;
    float _2919 = fma(_2733, _2915, _2721);
    float _2921 = fma(_2735, _2915, _2723);
    float _2923 = fma(_2727, _2917, _2725);
    out.m_72.x = _2919;
    out.m_72.y = _2921;
    out.m_72.z = _2923;
    out.m_72.w = _2913;
    if (!_2893)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2925;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _685 = false;
    bool _383 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2982 = as_type<float>(_107);
        out.gl_Position.z = _2982;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3052 = as_type<float>(_145);
        out.gl_Position.z = _3052;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _169 = 0.5;
    float _187;
    if (!_167)
    {
        float _171 = in.m_52.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_91);
        float _193 = 1.0 / _191;
        float _195 = _125 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = 1.0 / _213;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _239 = 1.0 / _221;
    float _241 = 1.0 / _217;
    float _243 = _201 * _235;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_233;
    float _259 = _257 + 1.0;
    float _261 = _255 * _259;
    float _263 = _205 * _239;
    bool _265 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_197);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_255;
    float _279 = _277 + 1.0;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _285 = _275 * _279;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _209 * _241;
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = fma(_283, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _319 = fma(_307, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = _303 * _289;
    float _323 = fma(_313, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = fma(_317, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _319 * _321;
    float _333 = _323 * _321;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _347 = fma(_337, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _349 = fma(_309, _285, _339);
    float _351 = fma(_343, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _353 = fma(_325, _285, _345);
    float _355 = fma(_347, _261, _349);
    float _357 = fma(_351, _261, _353);
    float _359 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].x, _355);
    float _361 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].y, _357);
    bool _363 = !_237;
    float _381;
    if (!_363)
    {
        float _365 = in.m_52.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_91);
        float _387 = 1.0 / _385;
        float _389 = _125 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _399 = _391 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _391 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _421 = 1.0 / _415;
    bool _423 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _425 = isnan(_391);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _411;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _439 = _391 + _437;
    bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _443 = 1.0 / _419;
    float _445 = _395 * _421;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _407;
    float _461 = _439 * _435;
    bool _463 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _465 = isnan(_391);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _477 = isnan(_391);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = _399 * _443;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _493;
    bool _497 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_391);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _457 * _489;
    float _511 = -_457;
    float _513 = _511 + 1.0;
    float _515 = fma(_495, _445, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _521 = _403 * _459;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _527;
    float _531 = _485 * _513;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_525, _445, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _539 = fma(_529, _445, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _541 = -_485;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = fma(_519, _491, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _551 = fma(_535, _491, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = _433 * _543;
    float _555 = -_433;
    float _557 = _555 + 1.0;
    float _559 = fma(_547, _491, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _561 = _507 * _557;
    float _563 = -_507;
    float _565 = _563 + 1.0;
    float _567 = _515 * _561;
    float _569 = _537 * _561;
    float _571 = _539 * _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _581;
    float _585 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].x, _567);
    float _587 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].y, _569);
    float _589 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].z, _571);
    float _591 = fma(_575, _521, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _593 = fma(_579, _521, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _595 = fma(_583, _521, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _597 = fma(_549, _553, _585);
    float _599 = fma(_559, _553, _587);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _613 = fma(_551, _553, _589);
    float _615 = fma(_603, _461, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _617 = fma(_607, _461, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _619 = fma(_593, _531, _599);
    float _621 = fma(_611, _461, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _623 = fma(_591, _531, _597);
    float _625 = fma(_595, _531, _613);
    float _627 = fma(_617, _509, _619);
    float _629 = fma(_615, _509, _623);
    float _631 = fma(_621, _509, _625);
    float _633 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].y, _627);
    float _635 = in.m_54.x;
    float _637 = in.m_54.y;
    float _639 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].x, _629);
    float _641 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].z, _631);
    float _643 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _647 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _653;
    out.m_56.y = _651;
    out.m_56.z = _655;
    out.m_56.w = _645;
    float _657 = _361 * _637;
    float _659 = _359 * _635;
    bool _661 = !_441;
    float _681;
    float _683;
    if (!_661)
    {
        float _663 = in.m_52.x;
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _667 = float(_91);
        float _669 = _663 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _673 = _671 * _665;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = _667;
        _685 = true;
    }
    else
    {
        float _687 = float(_91);
        float _689 = 1.0 / _687;
        float _691 = _125 * _689;
        _681 = _691;
        _683 = _687;
    }
    _685 = false;
    float _693 = _681;
    float _695 = _683;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _699 = int(_697);
    float _701 = in.m_52.x;
    float _703 = in.m_52.y;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _707 = _693 + _705;
    float _709 = in.m_42.x;
    float _711 = in.m_42.y;
    float _713 = in.m_42.z;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _717 = int(_715);
    bool _719 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _721 = isnan(_693);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    bool _731 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _733 = isnan(_693);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _695;
    float _745 = float(_699);
    float _747 = 1.0 / _745;
    float _749 = float(uint(_717));
    int _751 = ~_717;
    int _753 = _751 + 1;
    int _755 = ~_717;
    int _757 = _755 + 1;
    int _759 = ~_717;
    int _761 = _759 + 1;
    float _763 = 1.0 / _749;
    float _765 = _747 * _125;
    float _767 = trunc(_765);
    int _769 = int(_767);
    int _771 = as_type<int>(_763) + (-2);
    float _773 = float(uint(_769));
    float _775 = float(_769);
    float _777 = as_type<float>(_771) * _773;
    float _779 = trunc(_777);
    float _781 = precise::max(_779, 0.0);
    uint _784 = uint(_781);
    int _786 = _753 * int(_784);
    int _788 = _786 + _769;
    float _790 = float(_717);
    float _792 = float(uint(_788));
    float _794 = as_type<float>(_771) * _792;
    float _796 = trunc(_794);
    float _798 = precise::max(_796, 0.0);
    uint _800 = uint(_798);
    int _802 = int(_784) + int(_800);
    bool _804 = _775 >= _790;
    bool _806 = isnan(_775);
    bool _808 = _804 || _806;
    bool _810 = isnan(_790);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    int _816 = _757 * _802;
    int _818 = _816 + _769;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = trunc(_814);
    int _826 = int(_824);
    bool _828 = !_822;
    float _830 = _828 ? 7.345489978790283203125 : 1.0;
    bool _832 = uint(_818) >= uint(_717);
    float _834 = _830 * _701;
    bool _836 = !_832;
    int _838 = _836 ? 0 : (-1);
    bool _840 = _717 == 0;
    float _842 = floor(_834);
    int _844 = ~_802;
    int _846 = _844 + _838;
    int _848 = _846 + 1;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _860 = _858 != 0;
    int _862 = ~_826;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = _717 * _848;
    int _870 = _868 + _769;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _874 = _872 != 0;
    bool _876 = !_840;
    int _878 = _876 ? _870 : (-1);
    float _880 = -_842;
    float _882 = _834 + _880;
    int _884 = _878 * _866;
    int _886 = _717 + (-1);
    float _888 = _882 * _790;
    float _890 = _790 * _125;
    bool _892 = !_874;
    int _894 = _892 ? 0 : 1;
    int _896 = _826 * _886;
    int _898 = _896 + _884;
    bool _900 = !_856;
    int _902 = _900 ? 0 : 1;
    float _904 = _890 * _743;
    float _906 = trunc(_888);
    int _908 = int(_906);
    bool _910 = !_852;
    int _912 = _910 ? 0 : 1;
    int _914 = abs(_902);
    int _916 = abs(_894);
    bool _918 = !_860;
    int _920 = _918 ? 0 : 1;
    float _922 = trunc(_904);
    int _924 = int(_922);
    int _926 = abs(_912);
    int _928 = abs(_920);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _932 = _930 != 0;
    int _934 = _898 * _914;
    int _936 = _908 * _916;
    int _938 = _936 + _769;
    bool _940 = !_932;
    int _942 = _940 ? 0 : 1;
    float _944 = in.m_58.x;
    float _946 = in.m_58.y;
    float _948 = in.m_58.z;
    float _950 = in.m_58.w;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _954 = _952 != 0;
    int _956 = abs(_942);
    int _958 = _924 * _926;
    int _960 = _958 + _934;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _964 = _962 != 0;
    int _966 = _938 * _928;
    int _968 = _966 + _960;
    int _970 = _908 * _956;
    int _972 = _970 + _968;
    float _974 = float(uint(_938));
    float _976 = float(uint(_972));
    float _978 = as_type<float>(_771) * _974;
    float _980 = as_type<float>(_771) * _976;
    int _982 = ~_717;
    int _984 = _982 + 1;
    float _986 = trunc(_978);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    float _992 = _711 * _946;
    float _994 = trunc(_980);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    float _1000 = in.m_60.x;
    float _1002 = in.m_60.y;
    float _1004 = in.m_60.z;
    float _1006 = in.m_60.w;
    int _1008 = _984 * int(_998);
    int _1010 = _1008 + _972;
    float _1012 = float(uint(_1010));
    float _1014 = as_type<float>(_771) * _1012;
    float _1016 = in.m_62.x;
    float _1018 = in.m_62.y;
    float _1020 = in.m_62.z;
    float _1022 = in.m_62.w;
    float _1024 = trunc(_1014);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = _711 * _1002;
    float _1032 = fma(_709, _1000, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1038 = 1.0 / _1036;
    int _1040 = int(_998) + int(_1028);
    int _1042 = ~_717;
    int _1044 = _1042 + 1;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1046;
    int _1050 = _761 * _1040;
    int _1052 = _1050 + _972;
    int _1054 = _1044 * int(_990);
    int _1056 = _1054 + _938;
    bool _1058 = uint(_1052) >= uint(_717);
    float _1060 = _711 * _1018;
    float _1062 = float(uint(_1056));
    float _1064 = fma(_709, _944, _992);
    bool _1066 = !_1058;
    int _1068 = _1066 ? 0 : (-1);
    float _1070 = 1.0 / _1048;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1072;
    float _1076 = as_type<float>(_771) * _1062;
    int _1078 = ~_1040;
    int _1080 = _1078 + _1068;
    int _1082 = _1080 + 1;
    float _1084 = fma(_709, _1016, _1060);
    float _1086 = trunc(_1076);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    int _1092 = _717 * _1082;
    int _1094 = _1092 + _972;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1098 = _703 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1102 = _701 * 2.0;
    bool _1104 = !_840;
    int _1106 = _1104 ? _1094 : (-1);
    float _1108 = fma(_713, _1020, _1084);
    float _1110 = fma(_1098, -2.0, _1100);
    int _1112 = ~_717;
    int _1114 = _1112 + 1;
    float _1116 = -_1096;
    float _1118 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1116);
    int _1120 = _1106 & 3;
    bool _1122 = _1120 != 0;
    float _1124 = floor(_1102);
    int _1126 = _1106 & 3;
    bool _1128 = _1126 != 0;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1134 = uint(_1120) > 1u;
    float _1136 = _703 * 2.0;
    int _1138 = int(_990) + int(_1090);
    float _1140 = _1108 + _1022;
    float _1142 = fma(_713, _948, _1064);
    int _1144 = _1106 >> 31;
    float _1146 = 1.0 / _1132;
    int _1148 = _1128 ? 0 : 1;
    int _1150 = _1114 * _1138;
    int _1152 = _1150 + _938;
    int _1154 = _1144 & 3;
    float _1156 = fma(_713, _1004, _1032);
    int _1158 = ~_1148;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = _1142 + _950;
    int _1166 = _1106 + _1154;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1170 = _693 + _1168;
    int _1172 = _1162;
    float _1174 = _1164;
    if (!_1134)
    {
        int _1176 = ~_1148;
        int _1178 = _1176 + 1;
        _1172 = _1178;
    }
    int _1180 = _1172;
    float _1182 = 1.0 / _1074;
    int _1184 = _1166 >> 2;
    float _1186 = in.m_52.z;
    bool _1188 = uint(_1152) >= uint(_717);
    float _1190 = _1170 * _1038;
    int _1192 = _1184 << 4;
    int _1194 = _1192 + 368;
    float _1196 = _703 + _701;
    bool _1198 = uint(_1120) >= 2u;
    float _1200 = floor(_1136);
    bool _1202 = !_1188;
    int _1204 = _1202 ? 0 : (-1);
    uint _1206 = uint(int(uint(_1194) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[int(_1216)][_1218];
    bool _1222 = _1124 >= 0.0;
    bool _1224 = isnan(_1124);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan(0.0);
    bool _1230 = _1226 || _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1234 = _693 + _1232;
    int _1236 = _1198 ? 0 : 1;
    float _1238 = _1196 + (-1.0);
    bool _1240 = _1124 > 0.0;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1244 = _693 + _1242;
    int _1246 = _1230 ? 0 : 1;
    float _1248 = _707 * _1182;
    bool _1250 = _1120 != 3;
    float _1252 = _1244 * _1070;
    int _1254 = ~_1138;
    int _1256 = _1254 + _1204;
    int _1258 = _1256 + 1;
    float _1260 = _1234 * _1146;
    int _1262 = _1194 + 8;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[int(_1274)][_1276];
    int _1280 = ~_1246;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = _1156 + _1006;
    int _1288 = ~_1236;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    float _1294 = _703 + _1186;
    int _1296 = _1284;
    int _1298 = _1292;
    if (!_1240)
    {
        int _1300 = ~_1246;
        int _1302 = _1300 + 1;
        _1296 = _1302;
    }
    int _1304 = _1296;
    int _1306 = _717 * _1258;
    int _1308 = _1306 + _938;
    bool _1310 = _1200 > 0.0;
    float _1312 = _1294 + (-1.0);
    if (_1250)
    {
        int _1314 = ~_1236;
        int _1316 = _1314 + 1;
        _1298 = _1316;
    }
    int _1318 = _1298;
    bool _1320 = _1200 >= 0.0;
    bool _1322 = isnan(_1200);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.0);
    bool _1328 = _1324 || _1326;
    float _1330 = _1186 * 2.0;
    int _1332 = _1328 ? 0 : 1;
    float _1334 = floor(_1330);
    float _1336 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1338 = ~_1332;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    int _1344 = _1342;
    if (!_1310)
    {
        int _1346 = ~_1332;
        int _1348 = _1346 + 1;
        _1344 = _1348;
    }
    int _1350 = _1344;
    float _1352 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1354 = !_954;
    int _1356 = _1354 ? 0 : 1;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1360 = _1358 != 0;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1368 = _1366 != 0;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1370;
    bool _1374 = !_840;
    int _1376 = _1374 ? _1308 : (-1);
    bool _1378 = !_1122;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = fma(_1372, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1384 = _1120 != 3;
    int _1386 = abs(_1180);
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1388;
    int _1392 = abs(_1380);
    bool _1394 = !_1384;
    int _1396 = _1394 ? 0 : (-1);
    float _1398 = fma(_1390, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1400 = _1334 > 0.0;
    bool _1402 = _1334 >= 0.0;
    bool _1404 = isnan(_1334);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1412;
    int _1416 = ~_1386;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = fma(_1414, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1424 = abs(_1318);
    int _1426 = _1420 * as_type<int>(_1220);
    int _1428 = ~_1392;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1446 = _1432 * as_type<int>(_1212);
    int _1448 = _1446 + _1426;
    int _1450 = ~_1424;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1436, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1458 = fma(_1440, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1460 = _1454 * as_type<int>(_1270);
    int _1462 = _1460 + _1448;
    int _1464 = abs(_1396);
    float _1466 = fma(_1444, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1468;
    float _1472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1474 = log2(_1472);
    int _1476 = ~_1464;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1486;
    int _1490 = abs(_1356);
    float _1492 = fma(_1470, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    int _1494 = _1480 * as_type<int>(_1278);
    int _1496 = _1494 + _1462;
    float _1498 = fma(_1484, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1500 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1502 = int(_1500);
    float _1504 = fma(_1488, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    int _1518 = ~_1490;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    float _1524 = fma(_1508, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1526 = _1474 * _125;
    float _1528 = fma(_1512, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1530 = fma(_1516, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _1532 = _1496 * _1522;
    bool _1534 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1536 = isnan(_693);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    bool _1546 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1548 = isnan(_693);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    int _1558 = _1376 * _1490;
    int _1560 = _1558 + _1532;
    float _1562 = float(uint(_1502));
    float _1564 = exp2(_1526);
    bool _1566 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1568 = isnan(_693);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = -_1544;
    float _1580 = _1578 + 1.0;
    int _1582 = abs(_1502);
    float _1584 = _1576 * _1580;
    float _1586 = float(uint(_1582));
    float _1588 = 1.0 / _1562;
    float _1590 = -_1576;
    float _1592 = _1590 + 1.0;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1596 = 1.0 + _1594;
    int _1598 = _1410 ? 0 : 1;
    float _1600 = _1556 * _1592;
    float _1602 = -_1556;
    float _1604 = _1602 + 1.0;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = 1.0 / _1586;
    float _1618 = _741 * _1604;
    float _1620 = -_1564;
    float _1622 = _1620 + 1.0;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1626 = float(uint(_1560));
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1630 = abs(_1560);
    float _1632 = 1.0 / _1596;
    int _1634 = as_type<int>(_1588) + (-2);
    float _1636 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1624);
    float _1638 = _1614 ? _1622 : 0.0;
    float _1640 = -_125;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1118);
    bool _1644 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1646 = isnan(1.0);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1652 = _1648 || _1650;
    float _1654 = as_type<float>(_1634) * _1626;
    float _1656 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1636);
    float _1658 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1110);
    float _1660 = -_741;
    float _1662 = _1660 + 1.0;
    int _1664 = as_type<int>(_1616) + (-2);
    float _1666 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1628);
    float _1668 = float(uint(_1630));
    float _1670 = trunc(_1654);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = _729 * _1662;
    float _1678 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1666);
    float _1680 = -_729;
    float _1682 = _1680 + 1.0;
    float _1684 = as_type<float>(_1664) * _1668;
    float _1686 = _1656;
    if (_1652)
    {
        float _1688 = _1638 * _1632;
        _127 = _1688;
    }
    float _1690 = _127;
    float _1692 = _1398 * _1676;
    float _1694 = _1382 * _1676;
    float _1696 = trunc(_1684);
    float _1698 = precise::max(_1696, 0.0);
    uint _1700 = uint(_1698);
    int _1702 = ~_1502;
    int _1704 = _1702 + 1;
    float _1706 = _1422 * _1676;
    float _1708 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1692);
    float _1710 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1694);
    int _1712 = ~_1582;
    int _1714 = _1712 + 1;
    float _1716 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1706);
    int _1718 = ~_1598;
    int _1720 = _1718 + 1;
    int _1722 = _1720 + 1;
    int _1724 = _1704 * int(_1674);
    int _1726 = _1724 + _1560;
    int _1728 = _1722;
    if (!_1400)
    {
        int _1730 = ~_1598;
        int _1732 = _1730 + 1;
        _1728 = _1732;
    }
    int _1734 = _1728;
    float _1736 = fma(_1458, _1618, _1708);
    float _1738 = fma(_1456, _1618, _1710);
    float _1740 = float(uint(_1726));
    float _1742 = fma(_1466, _1618, _1716);
    bool _1744 = !_1360;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = _1714 * int(_1700);
    int _1750 = _1748 + _1630;
    float _1752 = fma(_1498, _1600, _1736);
    float _1754 = as_type<float>(_1634) * _1740;
    int _1756 = abs(_1746);
    float _1758 = fma(_1492, _1600, _1738);
    float _1760 = float(uint(_1750));
    float _1762 = fma(_1504, _1600, _1742);
    float _1764 = float(_1304);
    float _1766 = trunc(_1754);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = float(_1756);
    float _1774 = as_type<float>(_1664) * _1760;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1778 = _1140 + _1776;
    int _1780 = ~_1502;
    int _1782 = _1780 + 1;
    float _1784 = fma(_1524, _1584, _1758);
    float _1786 = float(_1734);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1164 + _1788;
    float _1792 = trunc(_1774);
    float _1794 = precise::max(_1792, 0.0);
    uint _1796 = uint(_1794);
    float _1798 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1800 = !_1364;
    int _1802 = _1800 ? 0 : 1;
    float _1804 = _1772 * _1786;
    float _1806 = fma(_1528, _1584, _1752);
    float _1808 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1798);
    int _1810 = ~_1582;
    int _1812 = _1810 + 1;
    float _1814 = in.m_64.x;
    float _1816 = in.m_64.y;
    float _1818 = in.m_64.z;
    int _1820 = int(_1674) + int(_1770);
    float _1822 = fma(_1530, _1584, _1762);
    int _1824 = abs(_1802);
    float _1826 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1784);
    float _1828 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1806);
    int _1830 = _1782 * _1820;
    int _1832 = _1830 + _1560;
    float _1834 = _1804 * (-2.0);
    float _1836 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1822);
    int _1838 = int(_1700) + int(_1796);
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1842 = uint(_1832) >= uint(_1502);
    float _1844 = fma(_1336, _1834, _1336);
    float _1846 = float(_1824);
    int _1848 = _1812 * _1838;
    int _1850 = _1848 + _1630;
    bool _1852 = !_1842;
    int _1854 = _1852 ? 0 : (-1);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1858 = _1286 + _1856;
    int _1860 = _1560 ^ _1502;
    float _1862 = _1846 * _1764;
    bool _1864 = uint(_1850) >= uint(_1582);
    float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1808);
    int _1868 = ~_1820;
    int _1870 = _1868 + _1854;
    int _1872 = _1870 + 1;
    float _1874 = _1862 * (-2.0);
    bool _1876 = !_1864;
    int _1878 = _1876 ? 0 : (-1);
    float _1880 = fma(_1834, _1814, _1814);
    bool _1882 = _1502 == 0;
    int _1884 = _1502 * _1872;
    int _1886 = _1884 + _1560;
    bool _1888 = _1502 == 0;
    float _1890 = fma(_1874, _1816, _1816);
    uint _1892 = uint(int(uint(_1860) >> uint(31)));
    float _1894 = -_1678;
    float _1896 = _1894 + 1.0;
    int _1898 = ~_1878;
    int _1900 = _1838 + _1898;
    int _1902 = _1900 + 1;
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1906 = ~int(_1892);
    int _1908 = _1906 + 1;
    float _1910 = fma(_1352, _1874, _1352);
    bool _1912 = !_1882;
    int _1914 = _1912 ? _1886 : (-1);
    float _1916 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1918 = _701 > 0.5;
    int _1920 = _1902 ^ _1908;
    float _1922 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1924 = float(_1914);
    float _1926 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1928 = -_161;
    int _1930 = _1918 ? as_type<int>(_1928) : as_type<int>(_161);
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1934 = _1932 != 0;
    float _1936 = fma(_1926, _1924, _1642);
    int _1938 = ~_1908;
    int _1940 = _1938 + _1920;
    int _1942 = _1940 + 1;
    float _1944 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1946 = _703 > 0.5;
    bool _1948 = !_1934;
    float _1950 = _1948 ? _161 : as_type<float>(_1930);
    bool _1952 = !_1888;
    int _1954 = _1952 ? _1942 : (-1);
    float _1956 = _701 + (-0.5);
    float _1958 = -_165;
    int _1960 = _1946 ? as_type<int>(_1958) : as_type<int>(_165);
    float _1962 = _1950 + 0.5;
    float _1964 = float(_1954);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1880);
    bool _1968 = !_964;
    float _1970 = _1968 ? _165 : as_type<float>(_1960);
    float _1972 = _1778 * _1778;
    float _1974 = fma(_1926, _1962, _1936);
    float _1976 = _703 + (-0.5);
    float _1978 = -_1658;
    float _1980 = fma(_1944, _1964, _1978);
    float _1982 = _1970 + (-0.5);
    float _1984 = fma(_1790, _1790, _1972);
    bool _1986 = _1866 >= 0.0;
    float _1988 = -_1656;
    float _1990 = _1988 + 1.0;
    float _1992 = -_1944;
    float _1994 = fma(_1992, _1982, _1980);
    float _1996 = fma(_1858, _1858, _1984);
    float _1998 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2000 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2002 = -_1990;
    float _2004 = fma(_1950, _2002, _1974);
    bool _2006 = !_1368;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = rsqrt(_1996);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2016 = fma(_1970, _1896, _1994);
    int _2018 = as_type<int>(_1826);
    float _2020 = _1818;
    if (_1986)
    {
        _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2022 = _1686;
    if (_1986)
    {
        out.m_45.x = 0.0;
    }
    int _2024 = abs(_2008);
    float _2026 = fma(_1844, _1690, _1966);
    float _2028 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1890);
    if (_1986)
    {
        float _2030 = _2022 * 5.0;
        _2018 = as_type<int>(_2030);
    }
    int _2032 = _2018;
    float _2034 = float(_1350);
    out.m_66.x = _2012;
    out.m_66.y = _1922;
    out.m_66.z = _2014;
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5886 = as_type<float>(_2032);
        out.gl_Position.z = _5886;
    }
    float _2036 = _1778 * _2010;
    float _2038 = _1790 * _2010;
    float _2040 = _1858 * _2010;
    out.m_68.x = _2004;
    out.m_68.y = _2016;
    float _2042 = -_2036;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1778);
    float _2046 = _2038;
    if (_1986)
    {
        return out;
    }
    float _2048 = -_2036;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1140);
    float _2052 = -_2038;
    float _2054 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1790);
    float _2056 = _2044 * _2044;
    float _2058 = -_2038;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2050 + _2062;
    float _2066 = float(_2024);
    float _2068 = fma(_2054, _2054, _2056);
    float _2070 = -_2040;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1286);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2076 = _2060 + _2074;
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2080 = -_2040;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _2084 = _1186 + _701;
    float _2086 = _2026 * 0.15915493667125701904296875;
    float _2088 = _2066 * _2034;
    float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2092 = _2072 + _2090;
    float _2094 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2078);
    float _2096 = fma(_2082, _2082, _2068);
    float _2098 = _2084 + (-1.0);
    float _2100 = _2088 * (-2.0);
    float _2102 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2094);
    float _2104 = _1186 + (-0.5);
    float _2106 = sqrt(_2096);
    float _2108 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2110 = fma(_2100, _1818, _1818);
    bool _2112 = _2102 >= 0.0;
    float _2114 = fma(_1910, _1690, _2028);
    float _2116 = fma(_2108, _2100, _2108);
    float _2118 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2110);
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2086 * 6.283185482025146484375;
    float _2124 = sin(_2122);
    float _2126 = fma(_2116, _1690, _2118);
    float _2128 = _2126 * 0.15915493667125701904296875;
    float _2130 = _2092;
    if (_2112)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2132 = _2020;
    float _2134 = _2010 * _2106;
    float _2136 = _2086 * 6.283185482025146484375;
    float _2138 = cos(_2136);
    int _2140 = as_type<int>(_2132);
    if (_2112)
    {
        out.m_45.x = 0.0;
    }
    if (_2112)
    {
        float _2142 = _2132 * 5.0;
        _2140 = as_type<int>(_2142);
    }
    int _2144 = _2140;
    float _2146 = _2120 * 6.283185482025146484375;
    float _2148 = sin(_2146);
    if (_2112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6086 = as_type<float>(_2144);
        out.gl_Position.z = _6086;
    }
    float _2150 = _2120 * 6.283185482025146484375;
    float _2152 = cos(_2150);
    float _2154 = _2128 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    if (_2112)
    {
        return out;
    }
    float _2158 = _2128 * 6.283185482025146484375;
    float _2160 = cos(_2158);
    float _2162 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _2166 = _659 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2168 = _2124 * _2148;
    float _2170 = _2134 * _2162;
    float _2172 = _2138 * _2152;
    float _2174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _2176 = _2134 * _2166;
    float _2178 = _2164 * _2170;
    float _2180 = fma(_2156, _2172, _2168);
    float _2182 = fma(_2156, _2168, _2172);
    float _2184 = _2174 * _2176;
    float _2186 = _2138 * _2148;
    float _2188 = _2124 * _2152;
    float _2190 = _2160 * _2178;
    float _2192 = _2148 * _2160;
    float _2194 = _2152 * _2160;
    bool _2196 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2198 = isnan(0.5);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2204 = _2200 || _2202;
    float _2206 = _2138 * _2190;
    float _2208 = -_2178;
    float _2210 = _2156 * _2208;
    float _2212 = -_2188;
    float _2214 = fma(_2156, _2186, _2212);
    float _2216 = -_2186;
    float _2218 = fma(_2156, _2188, _2216);
    float _2220 = fma(_2180, _2184, _2206);
    float _2222 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2224 = _2222 * 0.5;
    float _2226 = _2124 * _2190;
    float _2228 = fma(_2194, _2184, _2210);
    float _2230 = fma(_2214, _2224, _2220);
    float _2232 = fma(_2218, _2184, _2226);
    float _2234 = fma(_2192, _2224, _2228);
    float _2236 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = fma(_2182, _2224, _2232);
    float _2240 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2246);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2248);
    float _2256 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2258 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2260 = _2254 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2262 = _1286 + _2256;
    float _2264 = _1164 + _2258;
    float _2266 = _1140 + _2260;
    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2270 = _2262 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2274 = _2264 + _2272;
    float _2276 = _2270 * _2270;
    float _2278 = fma(_2274, _2274, _2276);
    float _2280 = sqrt(_2278);
    bool _2282 = _2280 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2284 = _2242;
    float _2286 = _2276;
    float _2288 = _2264;
    float _2290 = _2274;
    if (!_2282)
    {
        _2284 = _2262;
    }
    float _2292 = _2284;
    float _2294 = _2292;
    if (!_2282)
    {
        _2286 = _2266;
    }
    float _2296 = _2286;
    bool _2298 = !_2282;
    float _2300 = _2296;
    if (!_2298)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2306 = _2280 + _2304;
        float _2308 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = rsqrt(_2278);
        float _2312 = _2306 * _2302;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = _2314 * 6.283185482025146484375;
        float _2322 = sin(_2320);
        float _2324 = _2318 + (-1.0);
        float _2326 = fma(_2322, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2328 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2330 = _2310 * _2326;
        float _2332 = fma(_2266, _2318, _2328);
        float _2334 = fma(_2274, _2330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2336 = fma(_2270, _2330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2288 = _2334;
        _2300 = _2332;
        _2294 = _2336;
    }
    float _2338 = _2288;
    float _2340 = _2300;
    float _2342 = _2294;
    float _2344 = -_2038;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2338);
    float _2348 = -_2036;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2340);
    float _2352 = -_2040;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2342);
    float _2356 = _2350;
    float _2358 = _2346;
    float _2360 = _2354;
    if (!_2204)
    {
        float _2362 = _2064 * _2064;
        float _2364 = -_1164;
        float _2366 = _2364 + _2338;
        float _2368 = -_1140;
        float _2370 = _2368 + _2340;
        float _2372 = fma(_2076, _2076, _2362);
        float _2374 = 1.0 / _2134;
        float _2376 = fma(_2092, _2092, _2372);
        float _2378 = sqrt(_2376);
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2382 = precise::min(_2378, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2384 = _2382 * _2380;
        float _2386 = _2384 * _2374;
        float _2388 = -_1286;
        float _2390 = _2388 + _2342;
        float _2392 = fma(_2366, _2386, _2060);
        float _2394 = fma(_2370, _2386, _2050);
        float _2396 = fma(_2390, _2386, _2072);
        _2356 = _2394;
        _2358 = _2392;
        _2360 = _2396;
        _2130 = _2380;
    }
    float _2398 = _2356;
    float _2400 = _2358;
    float _2402 = _2360;
    float _2404 = _2130;
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2408 = _2398 + _2406;
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2412 = _2400 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2416 = _2402 + _2414;
    float _2418 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2420 = _2408 * _2408;
    float _2422 = fma(_2412, _2412, _2420);
    float _2424 = fma(_2416, _2416, _2422);
    float _2426 = rsqrt(_2424);
    float _2428 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2430 = _2412 * _2428;
    float _2432 = _2416 * _2428;
    float _2434 = _2430 * _2430;
    float _2436 = _2432 * _2432;
    float _2438 = _2434 + _2436;
    float _2440 = sqrt(_2438);
    bool _2442 = _2440 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2446 = _2440 + _2444;
    float _2448 = _2416;
    float _2450 = _2422;
    float _2452 = _2446;
    float _2454 = _2430;
    if (_2442)
    {
        float _2456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2448 = _2456;
    }
    float _2458 = _2448;
    if (_2442)
    {
        float _2460 = rsqrt(_2438);
        _2450 = _2460;
    }
    float _2462 = _2450;
    float _2464 = _2462;
    if (_2442)
    {
        float _2466 = _2446 * _2458;
        _2452 = _2466;
    }
    float _2468 = _2452;
    if (_2442)
    {
        float _2470 = _2468 * 0.15915493667125701904296875;
        _1174 = _2470;
    }
    float _2472 = _1174;
    float _2474 = _2426;
    float _2476 = _2472;
    if (_2442)
    {
        float _2478 = _2472 * 6.283185482025146484375;
        float _2480 = sin(_2478);
        _2474 = _2480;
    }
    float _2482 = _2474;
    float _2484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2486 = precise::max(0.0, _2484);
    float _2488 = _2404;
    float _2490 = _2486;
    float _2492 = _2484;
    if (_2442)
    {
        float _2494 = _2472 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        _2488 = _2496;
    }
    float _2498 = _2488;
    float _2500 = -_2428;
    float _2502 = -_2486;
    float _2504 = fma(_2408, _2500, _2502);
    if (!_2442)
    {
        _2490 = _2432;
    }
    float _2506 = _2490;
    float _2508 = _2506;
    if (_2442)
    {
        float _2510 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2510;
    }
    float _2512 = _2492;
    float _2514 = sqrt(_2424);
    float _2516 = _2482;
    float _2518 = _2512;
    if (_2442)
    {
        float _2520 = fma(_2482, _2512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2516 = _2520;
    }
    float _2522 = _2516;
    float _2524 = _2522;
    if (_2442)
    {
        float _2526 = _2498 + (-1.0);
        _2518 = _2526;
    }
    float _2528 = _2518;
    float _2530 = _2528;
    if (_2442)
    {
        float _2532 = _2462 * _2522;
        _2290 = _2532;
    }
    float _2534 = _2290;
    if (!_2442)
    {
        _2464 = _2504;
    }
    float _2536 = _2464;
    float _2538 = _2536;
    if (_2442)
    {
        float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2476 = _2540;
    }
    float _2542 = _2476;
    if (_2442)
    {
        float _2544 = _2430 * _2534;
        _2454 = _2544;
    }
    float _2546 = _2454;
    if (!_2442)
    {
        _2524 = _2434;
    }
    float _2548 = _2524;
    float _2550 = _2548;
    if (_2442)
    {
        float _2552 = _2432 * _2534;
        _2508 = _2552;
    }
    float _2554 = _2508;
    if (_2442)
    {
        float _2556 = fma(_2504, _2498, _2542);
        _2538 = _2556;
    }
    float _2558 = _2538;
    if (_2442)
    {
        float _2560 = _2546 * _2546;
        _2550 = _2560;
    }
    float _2562 = _2550;
    if (!_2442)
    {
        _2530 = _2436;
    }
    float _2564 = _2530;
    float _2566 = _2564;
    if (_2442)
    {
        float _2568 = _2554 * _2554;
        _2566 = _2568;
    }
    float _2570 = _2566;
    float _2572 = fma(_2558, _2558, _2562);
    float _2574 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2576 = _2572 + _2570;
    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2580 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2578);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2586 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2574);
    float _2588 = rsqrt(_2576);
    float _2590 = -_2582;
    float _2592 = _2590 + 1.0;
    float _2594 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2596 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2584);
    float _2598 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2600 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2586);
    float _2602 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2594);
    float _2604 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2596);
    float _2606 = abs(_2592);
    float _2608 = log2(_2606);
    float _2610 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2598);
    float _2612 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2602);
    float _2614 = _2604 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2616 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2618 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2610);
    float _2620 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2622 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2624 = _2588 * _2546;
    float _2626 = _2618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2628 = _2588 * _2558;
    float _2630 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2622);
    float _2632 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2634 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2636 = _2588 * _2554;
    float _2638 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2630);
    float _2640 = -_2632;
    float _2642 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2640);
    float _2644 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2646 = -_2634;
    float _2648 = fma(_2646, _2418, 1.0);
    float _2650 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2638);
    float _2652 = -_2636;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2642);
    float _2656 = exp2(_2644);
    float _2658 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2660 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2662 = fma(_2654, -0.5, 0.5);
    float _2664 = fma(_2654, 0.5, 0.5);
    float _2666 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2658);
    float _2668 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2660);
    float _2670 = _2628 + 1.0;
    float _2672 = log2(_2648);
    float _2674 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2666);
    float _2676 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2668);
    float _2678 = fma(_2664, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2680 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2676);
    float _2682 = fma(_2664, _2678, -0.212114393711090087890625);
    float _2684 = 1.0 / _2650;
    float _2686 = -_2628;
    float _2688 = fma(_2656, _2670, _2686);
    float _2690 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2674);
    float _2692 = fma(_2664, _2682, 1.570728778839111328125);
    float _2694 = fma(_2688, 0.5, 0.5);
    float _2696 = sqrt(_2662);
    float _2698 = _2672 * 0.693147182464599609375;
    float _2700 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2702 = _2690 * _2684;
    float _2704 = _2680 * _2684;
    float _2706 = fma(_2702, 0.5, 0.5);
    float _2708 = fma(_2704, -0.5, 0.5);
    float _2710 = _2696 * 0.636619746685028076171875;
    float _2712 = -_2692;
    float _2714 = fma(_2710, _2712, 1.0);
    float3 _7015 = float3(_2706, _2708, _2700);
    float _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7015, float3(0.0), isnan(_7015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7015, float3(0.0), isnan(_7015)), level(0.0)).x;
    float3 _7026 = float3(_2706, _2708, _2700);
    float4 _2719 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7026, float3(0.0), isnan(_7026)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7026, float3(0.0), isnan(_7026)), level(0.0)).xyzw;
    float _2721 = _2719.x;
    float _2723 = _2719.y;
    float _2725 = _2719.z;
    float _2727 = _2719.w;
    float2 _7043 = float2(_2714, _2694);
    float3 _2731 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7043, float2(0.0), isnan(_7043)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7043, float2(0.0), isnan(_7043)), level(0.0)).xyz;
    float _2733 = _2731.x;
    float _2735 = _2731.y;
    float _2737 = _2731.z;
    float _2739 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2741 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2745 = isnan(0.5);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2751 = _2747 || _2749;
    float _2753 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2755 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2739);
    float _2757 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2741);
    float _2759 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2753);
    float _2761 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2755);
    float _2763 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2757);
    float _2765 = _2761 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2767 = _2763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2769 = 1.0 / _2765;
    float _2771 = _2767 + _2765;
    float _2773 = _2700;
    float _2775 = _2761;
    float _2777 = _2765;
    if (!_2751)
    {
        _2046 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2779 = _2046;
    if (!_2751)
    {
        float _2781 = -_2779;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2773 = _2783;
    }
    float _2785 = _2773;
    float _2787 = _2785;
    if (!_2751)
    {
        float _2789 = 1.0 / _2785;
        _2787 = _2789;
    }
    float _2791 = _2787;
    float _2793 = _2771 * _2769;
    float _2795 = _2793 * 0.5;
    float _2797 = _2769;
    float _2799 = _2795;
    if (_2751)
    {
        _2797 = 1.0;
    }
    float _2801 = _2797;
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2803);
    float _2807 = _2801;
    if (!_2751)
    {
        _2799 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2809 = _2799;
    float _2811 = 1.0 / _2805;
    float _2813 = _2809;
    if (!_2751)
    {
        float _2815 = -_2809;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2775 = _2817;
    }
    float _2819 = _2775;
    float _2821 = _2819;
    if (!_2751)
    {
        float _2823 = 1.0 / _2819;
        _2821 = _2823;
    }
    float _2825 = _2821;
    if (!_2751)
    {
        float _2827 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2829 = -_2779;
        float _2831 = fma(_2811, _2827, _2829);
        _2777 = _2831;
    }
    float _2833 = _2777;
    float _2835 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2837 = _2833;
    if (!_2751)
    {
        float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2841 = -_2809;
        float _2843 = fma(_2811, _2839, _2841);
        _169 = _2843;
    }
    float _2845 = _169;
    if (_2751)
    {
        _2813 = 1.0;
    }
    float _2847 = _2813;
    float _2849 = _2847;
    if (!_2751)
    {
        float _2851 = _2833 * _2791;
        float _2853 = precise::clamp(_2851, 0.0, 1.0);
        _2837 = _2853;
    }
    float _2855 = _2837;
    float _2857 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2759);
    float _2859 = exp2(_2835);
    if (!_2751)
    {
        float _2861 = _2845 * _2825;
        float _2863 = precise::clamp(_2861, 0.0, 1.0);
        _2849 = _2863;
    }
    float _2865 = _2849;
    if (!_2751)
    {
        float _2867 = -_2855;
        float _2869 = _2867 + 1.0;
        _2807 = _2869;
    }
    float _2871 = _2807;
    float _2873 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2857);
    float _2875 = _2865 * _2871;
    bool _2877 = _2865 > 0.0;
    bool _2879 = isnan(_2865);
    bool _2881 = _2877 || _2879;
    bool _2883 = isnan(0.0);
    bool _2885 = _2881 || _2883;
    out.gl_Position.x = _2690;
    out.gl_Position.y = _2680;
    out.gl_Position.z = _2873;
    out.gl_Position.w = _2650;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2889 = _2871 <= 0.0;
    bool _2891 = !_2885;
    bool _2893 = _2889 || _2891;
    float _2895 = _2887 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2897 = _2873 + _2650;
    float _2899 = -_2859;
    float _2901 = _2899 + 1.0;
    float _2903 = _2897 * 0.5;
    float _2905 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2895;
    float _2907 = -_2905;
    float _2909 = _2907 + 1.0;
    out.m_70.z = _2903;
    out.m_70.w = _2650;
    float _2911 = _2905 * _2716;
    float _2913 = _2727 * _2909;
    float _2915 = _2727 * _2911;
    float _2917 = _2737 * _2911;
    float _2919 = fma(_2733, _2915, _2721);
    float _2921 = fma(_2735, _2915, _2723);
    float _2923 = fma(_2727, _2917, _2725);
    out.m_72.x = _2919;
    out.m_72.y = _2921;
    out.m_72.z = _2923;
    out.m_72.w = _2913;
    if (!_2893)
    {
        return out;
    }
    float _2925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2925;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _685 = false;
    bool _383 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2982 = as_type<float>(_107);
        out.gl_Position.z = _2982;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3052 = as_type<float>(_145);
        out.gl_Position.z = _3052;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _169 = 0.5;
    float _187;
    if (!_167)
    {
        float _171 = in.m_52.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_91);
        float _193 = 1.0 / _191;
        float _195 = _125 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = 1.0 / _213;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _239 = 1.0 / _221;
    float _241 = 1.0 / _217;
    float _243 = _201 * _235;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_233;
    float _259 = _257 + 1.0;
    float _261 = _255 * _259;
    float _263 = _205 * _239;
    bool _265 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_197);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_255;
    float _279 = _277 + 1.0;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _285 = _275 * _279;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _209 * _241;
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = fma(_283, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _319 = fma(_307, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = _303 * _289;
    float _323 = fma(_313, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = fma(_317, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _319 * _321;
    float _333 = _323 * _321;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _347 = fma(_337, _263, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _349 = fma(_309, _285, _339);
    float _351 = fma(_343, _263, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _353 = fma(_325, _285, _345);
    float _355 = fma(_347, _261, _349);
    float _357 = fma(_351, _261, _353);
    float _359 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].x, _355);
    float _361 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[146].y, _357);
    bool _363 = !_237;
    float _381;
    if (!_363)
    {
        float _365 = in.m_52.x;
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_91);
        float _387 = 1.0 / _385;
        float _389 = _125 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _399 = _391 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _391 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _421 = 1.0 / _415;
    bool _423 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _425 = isnan(_391);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _411;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _439 = _391 + _437;
    bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _443 = 1.0 / _419;
    float _445 = _395 * _421;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _407;
    float _461 = _439 * _435;
    bool _463 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _465 = isnan(_391);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _477 = isnan(_391);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = _399 * _443;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _493;
    bool _497 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_391);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _457 * _489;
    float _511 = -_457;
    float _513 = _511 + 1.0;
    float _515 = fma(_495, _445, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _521 = _403 * _459;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _527;
    float _531 = _485 * _513;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_525, _445, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _539 = fma(_529, _445, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _541 = -_485;
    float _543 = _541 + 1.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _549 = fma(_519, _491, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _551 = fma(_535, _491, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = _433 * _543;
    float _555 = -_433;
    float _557 = _555 + 1.0;
    float _559 = fma(_547, _491, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _561 = _507 * _557;
    float _563 = -_507;
    float _565 = _563 + 1.0;
    float _567 = _515 * _561;
    float _569 = _537 * _561;
    float _571 = _539 * _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _581;
    float _585 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].x, _567);
    float _587 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].y, _569);
    float _589 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].z, _571);
    float _591 = fma(_575, _521, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _593 = fma(_579, _521, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _595 = fma(_583, _521, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _597 = fma(_549, _553, _585);
    float _599 = fma(_559, _553, _587);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _613 = fma(_551, _553, _589);
    float _615 = fma(_603, _461, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _617 = fma(_607, _461, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _619 = fma(_593, _531, _599);
    float _621 = fma(_611, _461, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _623 = fma(_591, _531, _597);
    float _625 = fma(_595, _531, _613);
    float _627 = fma(_617, _509, _619);
    float _629 = fma(_615, _509, _623);
    float _631 = fma(_621, _509, _625);
    float _633 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].y, _627);
    float _635 = in.m_54.x;
    float _637 = in.m_54.y;
    float _639 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].x, _629);
    float _641 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[111].z, _631);
    float _643 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _647 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _651 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _653;
    out.m_56.y = _651;
    out.m_56.z = _655;
    out.m_56.w = _645;
    float _657 = _361 * _637;
    float _659 = _359 * _635;
    bool _661 = !_441;
    float _681;
    float _683;
    if (!_661)
    {
        float _663 = in.m_52.x;
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _667 = float(_91);
        float _669 = _663 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _673 = _671 * _665;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = _667;
        _685 = true;
    }
    else
    {
        float _687 = float(_91);
        float _689 = 1.0 / _687;
        float _691 = _125 * _689;
        _681 = _691;
        _683 = _687;
    }
    _685 = false;
    float _693 = _681;
    float _695 = _683;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _699 = int(_697);
    float _701 = in.m_52.x;
    float _703 = in.m_52.y;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _707 = _693 + _705;
    float _709 = in.m_42.x;
    float _711 = in.m_42.y;
    float _713 = in.m_42.z;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _717 = int(_715);
    bool _719 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _721 = isnan(_693);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    bool _731 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _733 = isnan(_693);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _695;
    float _745 = float(_699);
    float _747 = 1.0 / _745;
    float _749 = float(uint(_717));
    int _751 = ~_717;
    int _753 = _751 + 1;
    int _755 = ~_717;
    int _757 = _755 + 1;
    int _759 = ~_717;
    int _761 = _759 + 1;
    float _763 = 1.0 / _749;
    float _765 = _747 * _125;
    float _767 = trunc(_765);
    int _769 = int(_767);
    int _771 = as_type<int>(_763) + (-2);
    float _773 = float(uint(_769));
    float _775 = float(_769);
    float _777 = as_type<float>(_771) * _773;
    float _779 = trunc(_777);
    float _781 = precise::max(_779, 0.0);
    uint _784 = uint(_781);
    int _786 = _753 * int(_784);
    int _788 = _786 + _769;
    float _790 = float(_717);
    float _792 = float(uint(_788));
    float _794 = as_type<float>(_771) * _792;
    float _796 = trunc(_794);
    float _798 = precise::max(_796, 0.0);
    uint _800 = uint(_798);
    int _802 = int(_784) + int(_800);
    bool _804 = _775 >= _790;
    bool _806 = isnan(_775);
    bool _808 = _804 || _806;
    bool _810 = isnan(_790);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    int _816 = _757 * _802;
    int _818 = _816 + _769;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _822 = _820 != 0;
    float _824 = trunc(_814);
    int _826 = int(_824);
    bool _828 = !_822;
    float _830 = _828 ? 7.345489978790283203125 : 1.0;
    bool _832 = uint(_818) >= uint(_717);
    float _834 = _830 * _701;
    bool _836 = !_832;
    int _838 = _836 ? 0 : (-1);
    bool _840 = _717 == 0;
    float _842 = floor(_834);
    int _844 = ~_802;
    int _846 = _844 + _838;
    int _848 = _846 + 1;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _860 = _858 != 0;
    int _862 = ~_826;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = _717 * _848;
    int _870 = _868 + _769;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _874 = _872 != 0;
    bool _876 = !_840;
    int _878 = _876 ? _870 : (-1);
    float _880 = -_842;
    float _882 = _834 + _880;
    int _884 = _878 * _866;
    int _886 = _717 + (-1);
    float _888 = _882 * _790;
    float _890 = _790 * _125;
    bool _892 = !_874;
    int _894 = _892 ? 0 : 1;
    int _896 = _826 * _886;
    int _898 = _896 + _884;
    bool _900 = !_856;
    int _902 = _900 ? 0 : 1;
    float _904 = _890 * _743;
    float _906 = trunc(_888);
    int _908 = int(_906);
    bool _910 = !_852;
    int _912 = _910 ? 0 : 1;
    int _914 = abs(_902);
    int _916 = abs(_894);
    bool _918 = !_860;
    int _920 = _918 ? 0 : 1;
    float _922 = trunc(_904);
    int _924 = int(_922);
    int _926 = abs(_912);
    int _928 = abs(_920);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _932 = _930 != 0;
    int _934 = _898 * _914;
    int _936 = _908 * _916;
    int _938 = _936 + _769;
    bool _940 = !_932;
    int _942 = _940 ? 0 : 1;
    float _944 = in.m_58.x;
    float _946 = in.m_58.y;
    float _948 = in.m_58.z;
    float _950 = in.m_58.w;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _954 = _952 != 0;
    int _956 = abs(_942);
    int _958 = _924 * _926;
    int _960 = _958 + _934;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _964 = _962 != 0;
    int _966 = _938 * _928;
    int _968 = _966 + _960;
    int _970 = _908 * _956;
    int _972 = _970 + _968;
    float _974 = float(uint(_938));
    float _976 = float(uint(_972));
    float _978 = as_type<float>(_771) * _974;
    float _980 = as_type<float>(_771) * _976;
    int _982 = ~_717;
    int _984 = _982 + 1;
    float _986 = trunc(_978);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    float _992 = _711 * _946;
    float _994 = trunc(_980);
    float _996 = precise::max(_994, 0.0);
    uint _998 = uint(_996);
    float _1000 = in.m_60.x;
    float _1002 = in.m_60.y;
    float _1004 = in.m_60.z;
    float _1006 = in.m_60.w;
    int _1008 = _984 * int(_998);
    int _1010 = _1008 + _972;
    float _1012 = float(uint(_1010));
    float _1014 = as_type<float>(_771) * _1012;
    float _1016 = in.m_62.x;
    float _1018 = in.m_62.y;
    float _1020 = in.m_62.z;
    float _1022 = in.m_62.w;
    float _1024 = trunc(_1014);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = _711 * _1002;
    float _1032 = fma(_709, _1000, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1038 = 1.0 / _1036;
    int _1040 = int(_998) + int(_1028);
    int _1042 = ~_717;
    int _1044 = _1042 + 1;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1046;
    int _1050 = _761 * _1040;
    int _1052 = _1050 + _972;
    int _1054 = _1044 * int(_990);
    int _1056 = _1054 + _938;
    bool _1058 = uint(_1052) >= uint(_717);
    float _1060 = _711 * _1018;
    float _1062 = float(uint(_1056));
    float _1064 = fma(_709, _944, _992);
    bool _1066 = !_1058;
    int _1068 = _1066 ? 0 : (-1);
    float _1070 = 1.0 / _1048;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1072;
    float _1076 = as_type<float>(_771) * _1062;
    int _1078 = ~_1040;
    int _1080 = _1078 + _1068;
    int _1082 = _1080 + 1;
    float _1084 = fma(_709, _1016, _1060);
    float _1086 = trunc(_1076);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    int _1092 = _717 * _1082;
    int _1094 = _1092 + _972;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1098 = _703 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1102 = _701 * 2.0;
    bool _1104 = !_840;
    int _1106 = _1104 ? _1094 : (-1);
    float _1108 = fma(_713, _1020, _1084);
    float _1110 = fma(_1098, -2.0, _1100);
    int _1112 = ~_717;
    int _1114 = _1112 + 1;
    float _1116 = -_1096;
    float _1118 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1116);
    int _1120 = _1106 & 3;
    bool _1122 = _1120 != 0;
    float _1124 = floor(_1102);
    int _1126 = _1106 & 3;
    bool _1128 = _1126 != 0;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1134 = uint(_1120) > 1u;
    float _1136 = _703 * 2.0;
    int _1138 = int(_990) + int(_1090);
    float _1140 = _1108 + _1022;
    float _1142 = fma(_713, _948, _1064);
    int _1144 = _1106 >> 31;
    float _1146 = 1.0 / _1132;
    int _1148 = _1128 ? 0 : 1;
    int _1150 = _1114 * _1138;
    int _1152 = _1150 + _938;
    int _1154 = _1144 & 3;
    float _1156 = fma(_713, _1004, _1032);
    int _1158 = ~_1148;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = _1142 + _950;
    int _1166 = _1106 + _1154;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1170 = _693 + _1168;
    int _1172 = _1162;
    float _1174 = _1164;
    if (!_1134)
    {
        int _1176 = ~_1148;
        int _1178 = _1176 + 1;
        _1172 = _1178;
    }
    int _1180 = _1172;
    float _1182 = 1.0 / _1074;
    int _1184 = _1166 >> 2;
    float _1186 = in.m_52.z;
    bool _1188 = uint(_1152) >= uint(_717);
    float _1190 = _1170 * _1038;
    int _1192 = _1184 << 4;
    int _1194 = _1192 + 368;
    float _1196 = _703 + _701;
    bool _1198 = uint(_1120) >= 2u;
    float _1200 = floor(_1136);
    bool _1202 = !_1188;
    int _1204 = _1202 ? 0 : (-1);
    uint _1206 = uint(int(uint(_1194) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[int(_1216)][_1218];
    bool _1222 = _1124 >= 0.0;
    bool _1224 = isnan(_1124);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan(0.0);
    bool _1230 = _1226 || _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1234 = _693 + _1232;
    int _1236 = _1198 ? 0 : 1;
    float _1238 = _1196 + (-1.0);
    bool _1240 = _1124 > 0.0;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1244 = _693 + _1242;
    int _1246 = _1230 ? 0 : 1;
    float _1248 = _707 * _1182;
    bool _1250 = _1120 != 3;
    float _1252 = _1244 * _1070;
    int _1254 = ~_1138;
    int _1256 = _1254 + _1204;
    int _1258 = _1256 + 1;
    float _1260 = _1234 * _1146;
    int _1262 = _1194 + 8;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[int(_1274)][_1276];
    int _1280 = ~_1246;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = _1156 + _1006;
    int _1288 = ~_1236;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    float _1294 = _703 + _1186;
    int _1296 = _1284;
    int _1298 = _1292;
    if (!_1240)
    {
        int _1300 = ~_1246;
        int _1302 = _1300 + 1;
        _1296 = _1302;
    }
    int _1304 = _1296;
    int _1306 = _717 * _1258;
    int _1308 = _1306 + _938;
    bool _1310 = _1200 > 0.0;
    float _1312 = _1294 + (-1.0);
    if (_1250)
    {
        int _1314 = ~_1236;
        int _1316 = _1314 + 1;
        _1298 = _1316;
    }
    int _1318 = _1298;
    bool _1320 = _1200 >= 0.0;
    bool _1322 = isnan(_1200);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.0);
    bool _1328 = _1324 || _1326;
    float _1330 = _1186 * 2.0;
    int _1332 = _1328 ? 0 : 1;
    float _1334 = floor(_1330);
    float _1336 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1338 = ~_1332;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    int _1344 = _1342;
    if (!_1310)
    {
        int _1346 = ~_1332;
        int _1348 = _1346 + 1;
        _1344 = _1348;
    }
    int _1350 = _1344;
    float _1352 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1354 = !_954;
    int _1356 = _1354 ? 0 : 1;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1360 = _1358 != 0;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1368 = _1366 != 0;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1370;
    bool _1374 = !_840;
    int _1376 = _1374 ? _1308 : (-1);
    bool _1378 = !_1122;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = fma(_1372, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1384 = _1120 != 3;
    int _1386 = abs(_1180);
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1388;
    int _1392 = abs(_1380);
    bool _1394 = !_1384;
    int _1396 = _1394 ? 0 : (-1);
    float _1398 = fma(_1390, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1400 = _1334 > 0.0;
    bool _1402 = _1334 >= 0.0;
    bool _1404 = isnan(_1334);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1412;
    int _1416 = ~_1386;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = fma(_1414, _1252, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1424 = abs(_1318);
    int _1426 = _1420 * as_type<int>(_1220);
    int _1428 = ~_1392;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1446 = _1432 * as_type<int>(_1212);
    int _1448 = _1446 + _1426;
    int _1450 = ~_1424;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1436, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1458 = fma(_1440, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1460 = _1454 * as_type<int>(_1270);
    int _1462 = _1460 + _1448;
    int _1464 = abs(_1396);
    float _1466 = fma(_1444, _1190, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1468;
    float _1472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1474 = log2(_1472);
    int _1476 = ~_1464;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1486;
    int _1490 = abs(_1356);
    float _1492 = fma(_1470, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    int _1494 = _1480 * as_type<int>(_1278);
    int _1496 = _1494 + _1462;
    float _1498 = fma(_1484, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1500 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1502 = int(_1500);
    float _1504 = fma(_1488, _1248, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    int _1518 = ~_1490;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    float _1524 = fma(_1508, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1526 = _1474 * _125;
    float _1528 = fma(_1512, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1530 = fma(_1516, _1260, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    int _1532 = _1496 * _1522;
    bool _1534 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1536 = isnan(_693);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    bool _1546 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1548 = isnan(_693);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    int _1558 = _1376 * _1490;
    int _1560 = _1558 + _1532;
    float _1562 = float(uint(_1502));
    float _1564 = exp2(_1526);
    bool _1566 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1568 = isnan(_693);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = -_1544;
    float _1580 = _1578 + 1.0;
    int _1582 = abs(_1502);
    float _1584 = _1576 * _1580;
    float _1586 = float(uint(_1582));
    float _1588 = 1.0 / _1562;
    float _1590 = -_1576;
    float _1592 = _1590 + 1.0;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1596 = 1.0 + _1594;
    int _1598 = _1410 ? 0 : 1;
    float _1600 = _1556 * _1592;
    float _1602 = -_1556;
    float _1604 = _1602 + 1.0;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = 1.0 / _1586;
    float _1618 = _741 * _1604;
    float _1620 = -_1564;
    float _1622 = _1620 + 1.0;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1626 = float(uint(_1560));
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1630 = abs(_1560);
    float _1632 = 1.0 / _1596;
    int _1634 = as_type<int>(_1588) + (-2);
    float _1636 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1624);
    float _1638 = _1614 ? _1622 : 0.0;
    float _1640 = -_125;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1118);
    bool _1644 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1646 = isnan(1.0);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1652 = _1648 || _1650;
    float _1654 = as_type<float>(_1634) * _1626;
    float _1656 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1636);
    float _1658 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1110);
    float _1660 = -_741;
    float _1662 = _1660 + 1.0;
    int _1664 = as_type<int>(_1616) + (-2);
    float _1666 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1628);
    float _1668 = float(uint(_1630));
    float _1670 = trunc(_1654);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = _729 * _1662;
    float _1678 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1666);
    float _1680 = -_729;
    float _1682 = _1680 + 1.0;
    float _1684 = as_type<float>(_1664) * _1668;
    float _1686 = _1656;
    if (_1652)
    {
        float _1688 = _1638 * _1632;
        _127 = _1688;
    }
    float _1690 = _127;
    float _1692 = _1398 * _1676;
    float _1694 = _1382 * _1676;
    float _1696 = trunc(_1684);
    float _1698 = precise::max(_1696, 0.0);
    uint _1700 = uint(_1698);
    int _1702 = ~_1502;
    int _1704 = _1702 + 1;
    float _1706 = _1422 * _1676;
    float _1708 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1692);
    float _1710 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1694);
    int _1712 = ~_1582;
    int _1714 = _1712 + 1;
    float _1716 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1706);
    int _1718 = ~_1598;
    int _1720 = _1718 + 1;
    int _1722 = _1720 + 1;
    int _1724 = _1704 * int(_1674);
    int _1726 = _1724 + _1560;
    int _1728 = _1722;
    if (!_1400)
    {
        int _1730 = ~_1598;
        int _1732 = _1730 + 1;
        _1728 = _1732;
    }
    int _1734 = _1728;
    float _1736 = fma(_1458, _1618, _1708);
    float _1738 = fma(_1456, _1618, _1710);
    float _1740 = float(uint(_1726));
    float _1742 = fma(_1466, _1618, _1716);
    bool _1744 = !_1360;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = _1714 * int(_1700);
    int _1750 = _1748 + _1630;
    float _1752 = fma(_1498, _1600, _1736);
    float _1754 = as_type<float>(_1634) * _1740;
    int _1756 = abs(_1746);
    float _1758 = fma(_1492, _1600, _1738);
    float _1760 = float(uint(_1750));
    float _1762 = fma(_1504, _1600, _1742);
    float _1764 = float(_1304);
    float _1766 = trunc(_1754);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = float(_1756);
    float _1774 = as_type<float>(_1664) * _1760;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1778 = _1140 + _1776;
    int _1780 = ~_1502;
    int _1782 = _1780 + 1;
    float _1784 = fma(_1524, _1584, _1758);
    float _1786 = float(_1734);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1164 + _1788;
    float _1792 = trunc(_1774);
    float _1794 = precise::max(_1792, 0.0);
    uint _1796 = uint(_1794);
    float _1798 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1800 = !_1364;
    int _1802 = _1800 ? 0 : 1;
    float _1804 = _1772 * _1786;
    float _1806 = fma(_1528, _1584, _1752);
    float _1808 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1798);
    int _1810 = ~_1582;
    int _1812 = _1810 + 1;
    float _1814 = in.m_64.x;
    float _1816 = in.m_64.y;
    float _1818 = in.m_64.z;
    int _1820 = int(_1674) + int(_1770);
    float _1822 = fma(_1530, _1584, _1762);
    int _1824 = abs(_1802);
    float _1826 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1784);
    float _1828 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1806);
    int _1830 = _1782 * _1820;
    int _1832 = _1830 + _1560;
    float _1834 = _1804 * (-2.0);
    float _1836 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1822);
    int _1838 = int(_1700) + int(_1796);
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1842 = uint(_1832) >= uint(_1502);
    float _1844 = fma(_1336, _1834, _1336);
    float _1846 = float(_1824);
    int _1848 = _1812 * _1838;
    int _1850 = _1848 + _1630;
    bool _1852 = !_1842;
    int _1854 = _1852 ? 0 : (-1);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1858 = _1286 + _1856;
    int _1860 = _1560 ^ _1502;
    float _1862 = _1846 * _1764;
    bool _1864 = uint(_1850) >= uint(_1582);
    float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1808);
    int _1868 = ~_1820;
    int _1870 = _1868 + _1854;
    int _1872 = _1870 + 1;
    float _1874 = _1862 * (-2.0);
    bool _1876 = !_1864;
    int _1878 = _1876 ? 0 : (-1);
    float _1880 = fma(_1834, _1814, _1814);
    bool _1882 = _1502 == 0;
    int _1884 = _1502 * _1872;
    int _1886 = _1884 + _1560;
    bool _1888 = _1502 == 0;
    float _1890 = fma(_1874, _1816, _1816);
    uint _1892 = uint(int(uint(_1860) >> uint(31)));
    float _1894 = -_1678;
    float _1896 = _1894 + 1.0;
    int _1898 = ~_1878;
    int _1900 = _1838 + _1898;
    int _1902 = _1900 + 1;
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1906 = ~int(_1892);
    int _1908 = _1906 + 1;
    float _1910 = fma(_1352, _1874, _1352);
    bool _1912 = !_1882;
    int _1914 = _1912 ? _1886 : (-1);
    float _1916 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1918 = _701 > 0.5;
    int _1920 = _1902 ^ _1908;
    float _1922 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1924 = float(_1914);
    float _1926 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1928 = -_161;
    int _1930 = _1918 ? as_type<int>(_1928) : as_type<int>(_161);
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1934 = _1932 != 0;
    float _1936 = fma(_1926, _1924, _1642);
    int _1938 = ~_1908;
    int _1940 = _1938 + _1920;
    int _1942 = _1940 + 1;
    float _1944 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1946 = _703 > 0.5;
    bool _1948 = !_1934;
    float _1950 = _1948 ? _161 : as_type<float>(_1930);
    bool _1952 = !_1888;
    int _1954 = _1952 ? _1942 : (-1);
    float _1956 = _701 + (-0.5);
    float _1958 = -_165;
    int _1960 = _1946 ? as_type<int>(_1958) : as_type<int>(_165);
    float _1962 = _1950 + 0.5;
    float _1964 = float(_1954);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1880);
    bool _1968 = !_964;
    float _1970 = _1968 ? _165 : as_type<float>(_1960);
    float _1972 = _1778 * _1778;
    float _1974 = fma(_1926, _1962, _1936);
    float _1976 = _703 + (-0.5);
    float _1978 = -_1658;
    float _1980 = fma(_1944, _1964, _1978);
    float _1982 = _1970 + (-0.5);
    float _1984 = fma(_1790, _1790, _1972);
    bool _1986 = _1866 >= 0.0;
    float _1988 = -_1656;
    float _1990 = _1988 + 1.0;
    float _1992 = -_1944;
    float _1994 = fma(_1992, _1982, _1980);
    float _1996 = fma(_1858, _1858, _1984);
    float _1998 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2000 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2002 = -_1990;
    float _2004 = fma(_1950, _2002, _1974);
    bool _2006 = !_1368;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = rsqrt(_1996);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2016 = fma(_1970, _1896, _1994);
    int _2018 = as_type<int>(_1826);
    float _2020 = _1818;
    if (_1986)
    {
        _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2022 = _1686;
    if (_1986)
    {
        out.m_45.x = 0.0;
    }
    int _2024 = abs(_2008);
    float _2026 = fma(_1844, _1690, _1966);
    float _2028 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1890);
    if (_1986)
    {
        float _2030 = _2022 * 5.0;
        _2018 = as_type<int>(_2030);
    }
    int _2032 = _2018;
    float _2034 = float(_1350);
    out.m_66.x = _2012;
    out.m_66.y = _1922;
    out.m_66.z = _2014;
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5886 = as_type<float>(_2032);
        out.gl_Position.z = _5886;
    }
    float _2036 = _1778 * _2010;
    float _2038 = _1790 * _2010;
    float _2040 = _1858 * _2010;
    out.m_68.x = _2004;
    out.m_68.y = _2016;
    float _2042 = -_2036;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1778);
    float _2046 = _2038;
    if (_1986)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2048 = -_2036;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1140);
    float _2052 = -_2038;
    float _2054 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1790);
    float _2056 = _2044 * _2044;
    float _2058 = -_2038;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2050 + _2062;
    float _2066 = float(_2024);
    float _2068 = fma(_2054, _2054, _2056);
    float _2070 = -_2040;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1286);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2076 = _2060 + _2074;
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2080 = -_2040;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _2084 = _1186 + _701;
    float _2086 = _2026 * 0.15915493667125701904296875;
    float _2088 = _2066 * _2034;
    float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2092 = _2072 + _2090;
    float _2094 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2078);
    float _2096 = fma(_2082, _2082, _2068);
    float _2098 = _2084 + (-1.0);
    float _2100 = _2088 * (-2.0);
    float _2102 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2094);
    float _2104 = _1186 + (-0.5);
    float _2106 = sqrt(_2096);
    float _2108 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2110 = fma(_2100, _1818, _1818);
    bool _2112 = _2102 >= 0.0;
    float _2114 = fma(_1910, _1690, _2028);
    float _2116 = fma(_2108, _2100, _2108);
    float _2118 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2110);
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2086 * 6.283185482025146484375;
    float _2124 = sin(_2122);
    float _2126 = fma(_2116, _1690, _2118);
    float _2128 = _2126 * 0.15915493667125701904296875;
    float _2130 = _2092;
    if (_2112)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2132 = _2020;
    float _2134 = _2010 * _2106;
    float _2136 = _2086 * 6.283185482025146484375;
    float _2138 = cos(_2136);
    int _2140 = as_type<int>(_2132);
    if (_2112)
    {
        out.m_45.x = 0.0;
    }
    if (_2112)
    {
        float _2142 = _2132 * 5.0;
        _2140 = as_type<int>(_2142);
    }
    int _2144 = _2140;
    float _2146 = _2120 * 6.283185482025146484375;
    float _2148 = sin(_2146);
    if (_2112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6086 = as_type<float>(_2144);
        out.gl_Position.z = _6086;
    }
    float _2150 = _2120 * 6.283185482025146484375;
    float _2152 = cos(_2150);
    float _2154 = _2128 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    if (_2112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2158 = _2128 * 6.283185482025146484375;
    float _2160 = cos(_2158);
    float _2162 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2164 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _2166 = _659 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2168 = _2124 * _2148;
    float _2170 = _2134 * _2162;
    float _2172 = _2138 * _2152;
    float _2174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _2176 = _2134 * _2166;
    float _2178 = _2164 * _2170;
    float _2180 = fma(_2156, _2172, _2168);
    float _2182 = fma(_2156, _2168, _2172);
    float _2184 = _2174 * _2176;
    float _2186 = _2138 * _2148;
    float _2188 = _2124 * _2152;
    float _2190 = _2160 * _2178;
    float _2192 = _2148 * _2160;
    float _2194 = _2152 * _2160;
    bool _2196 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2198 = isnan(0.5);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2204 = _2200 || _2202;
    float _2206 = _2138 * _2190;
    float _2208 = -_2178;
    float _2210 = _2156 * _2208;
    float _2212 = -_2188;
    float _2214 = fma(_2156, _2186, _2212);
    float _2216 = -_2186;
    float _2218 = fma(_2156, _2188, _2216);
    float _2220 = fma(_2180, _2184, _2206);
    float _2222 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2224 = _2222 * 0.5;
    float _2226 = _2124 * _2190;
    float _2228 = fma(_2194, _2184, _2210);
    float _2230 = fma(_2214, _2224, _2220);
    float _2232 = fma(_2218, _2184, _2226);
    float _2234 = fma(_2192, _2224, _2228);
    float _2236 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = fma(_2182, _2224, _2232);
    float _2240 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2246);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2248);
    float _2256 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2258 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2260 = _2254 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2262 = _1286 + _2256;
    float _2264 = _1164 + _2258;
    float _2266 = _1140 + _2260;
    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2270 = _2262 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2274 = _2264 + _2272;
    float _2276 = _2270 * _2270;
    float _2278 = fma(_2274, _2274, _2276);
    float _2280 = sqrt(_2278);
    bool _2282 = _2280 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2284 = _2242;
    float _2286 = _2276;
    float _2288 = _2264;
    float _2290 = _2274;
    if (!_2282)
    {
        _2284 = _2262;
    }
    float _2292 = _2284;
    float _2294 = _2292;
    if (!_2282)
    {
        _2286 = _2266;
    }
    float _2296 = _2286;
    bool _2298 = !_2282;
    float _2300 = _2296;
    if (!_2298)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2306 = _2280 + _2304;
        float _2308 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = rsqrt(_2278);
        float _2312 = _2306 * _2302;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = _2314 * 6.283185482025146484375;
        float _2322 = sin(_2320);
        float _2324 = _2318 + (-1.0);
        float _2326 = fma(_2322, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2328 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2330 = _2310 * _2326;
        float _2332 = fma(_2266, _2318, _2328);
        float _2334 = fma(_2274, _2330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2336 = fma(_2270, _2330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2288 = _2334;
        _2300 = _2332;
        _2294 = _2336;
    }
    float _2338 = _2288;
    float _2340 = _2300;
    float _2342 = _2294;
    float _2344 = -_2038;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2338);
    float _2348 = -_2036;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2340);
    float _2352 = -_2040;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2342);
    float _2356 = _2350;
    float _2358 = _2346;
    float _2360 = _2354;
    if (!_2204)
    {
        float _2362 = _2064 * _2064;
        float _2364 = -_1164;
        float _2366 = _2364 + _2338;
        float _2368 = -_1140;
        float _2370 = _2368 + _2340;
        float _2372 = fma(_2076, _2076, _2362);
        float _2374 = 1.0 / _2134;
        float _2376 = fma(_2092, _2092, _2372);
        float _2378 = sqrt(_2376);
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2382 = precise::min(_2378, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2384 = _2382 * _2380;
        float _2386 = _2384 * _2374;
        float _2388 = -_1286;
        float _2390 = _2388 + _2342;
        float _2392 = fma(_2366, _2386, _2060);
        float _2394 = fma(_2370, _2386, _2050);
        float _2396 = fma(_2390, _2386, _2072);
        _2356 = _2394;
        _2358 = _2392;
        _2360 = _2396;
        _2130 = _2380;
    }
    float _2398 = _2356;
    float _2400 = _2358;
    float _2402 = _2360;
    float _2404 = _2130;
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2408 = _2398 + _2406;
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2412 = _2400 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2416 = _2402 + _2414;
    float _2418 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2420 = _2408 * _2408;
    float _2422 = fma(_2412, _2412, _2420);
    float _2424 = fma(_2416, _2416, _2422);
    float _2426 = rsqrt(_2424);
    float _2428 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2430 = _2412 * _2428;
    float _2432 = _2416 * _2428;
    float _2434 = _2430 * _2430;
    float _2436 = _2432 * _2432;
    float _2438 = _2434 + _2436;
    float _2440 = sqrt(_2438);
    bool _2442 = _2440 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2446 = _2440 + _2444;
    float _2448 = _2416;
    float _2450 = _2422;
    float _2452 = _2446;
    float _2454 = _2430;
    if (_2442)
    {
        float _2456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2448 = _2456;
    }
    float _2458 = _2448;
    if (_2442)
    {
        float _2460 = rsqrt(_2438);
        _2450 = _2460;
    }
    float _2462 = _2450;
    float _2464 = _2462;
    if (_2442)
    {
        float _2466 = _2446 * _2458;
        _2452 = _2466;
    }
    float _2468 = _2452;
    if (_2442)
    {
        float _2470 = _2468 * 0.15915493667125701904296875;
        _1174 = _2470;
    }
    float _2472 = _1174;
    float _2474 = _2426;
    float _2476 = _2472;
    if (_2442)
    {
        float _2478 = _2472 * 6.283185482025146484375;
        float _2480 = sin(_2478);
        _2474 = _2480;
    }
    float _2482 = _2474;
    float _2484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2486 = precise::max(0.0, _2484);
    float _2488 = _2404;
    float _2490 = _2486;
    float _2492 = _2484;
    if (_2442)
    {
        float _2494 = _2472 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        _2488 = _2496;
    }
    float _2498 = _2488;
    float _2500 = -_2428;
    float _2502 = -_2486;
    float _2504 = fma(_2408, _2500, _2502);
    if (!_2442)
    {
        _2490 = _2432;
    }
    float _2506 = _2490;
    float _2508 = _2506;
    if (_2442)
    {
        float _2510 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2510;
    }
    float _2512 = _2492;
    float _2514 = sqrt(_2424);
    float _2516 = _2482;
    float _2518 = _2512;
    if (_2442)
    {
        float _2520 = fma(_2482, _2512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2516 = _2520;
    }
    float _2522 = _2516;
    float _2524 = _2522;
    if (_2442)
    {
        float _2526 = _2498 + (-1.0);
        _2518 = _2526;
    }
    float _2528 = _2518;
    float _2530 = _2528;
    if (_2442)
    {
        float _2532 = _2462 * _2522;
        _2290 = _2532;
    }
    float _2534 = _2290;
    if (!_2442)
    {
        _2464 = _2504;
    }
    float _2536 = _2464;
    float _2538 = _2536;
    if (_2442)
    {
        float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2476 = _2540;
    }
    float _2542 = _2476;
    if (_2442)
    {
        float _2544 = _2430 * _2534;
        _2454 = _2544;
    }
    float _2546 = _2454;
    if (!_2442)
    {
        _2524 = _2434;
    }
    float _2548 = _2524;
    float _2550 = _2548;
    if (_2442)
    {
        float _2552 = _2432 * _2534;
        _2508 = _2552;
    }
    float _2554 = _2508;
    if (_2442)
    {
        float _2556 = fma(_2504, _2498, _2542);
        _2538 = _2556;
    }
    float _2558 = _2538;
    if (_2442)
    {
        float _2560 = _2546 * _2546;
        _2550 = _2560;
    }
    float _2562 = _2550;
    if (!_2442)
    {
        _2530 = _2436;
    }
    float _2564 = _2530;
    float _2566 = _2564;
    if (_2442)
    {
        float _2568 = _2554 * _2554;
        _2566 = _2568;
    }
    float _2570 = _2566;
    float _2572 = fma(_2558, _2558, _2562);
    float _2574 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2576 = _2572 + _2570;
    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2580 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2578);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2586 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2574);
    float _2588 = rsqrt(_2576);
    float _2590 = -_2582;
    float _2592 = _2590 + 1.0;
    float _2594 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2596 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2584);
    float _2598 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2600 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2586);
    float _2602 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2594);
    float _2604 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2596);
    float _2606 = abs(_2592);
    float _2608 = log2(_2606);
    float _2610 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2598);
    float _2612 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2602);
    float _2614 = _2604 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2616 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2618 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2610);
    float _2620 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2622 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2624 = _2588 * _2546;
    float _2626 = _2618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2628 = _2588 * _2558;
    float _2630 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2622);
    float _2632 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2634 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2636 = _2588 * _2554;
    float _2638 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2630);
    float _2640 = -_2632;
    float _2642 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2640);
    float _2644 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2646 = -_2634;
    float _2648 = fma(_2646, _2418, 1.0);
    float _2650 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2638);
    float _2652 = -_2636;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2642);
    float _2656 = exp2(_2644);
    float _2658 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2660 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2662 = fma(_2654, -0.5, 0.5);
    float _2664 = fma(_2654, 0.5, 0.5);
    float _2666 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2658);
    float _2668 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2660);
    float _2670 = _2628 + 1.0;
    float _2672 = log2(_2648);
    float _2674 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2666);
    float _2676 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2668);
    float _2678 = fma(_2664, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2680 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2676);
    float _2682 = fma(_2664, _2678, -0.212114393711090087890625);
    float _2684 = 1.0 / _2650;
    float _2686 = -_2628;
    float _2688 = fma(_2656, _2670, _2686);
    float _2690 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2674);
    float _2692 = fma(_2664, _2682, 1.570728778839111328125);
    float _2694 = fma(_2688, 0.5, 0.5);
    float _2696 = sqrt(_2662);
    float _2698 = _2672 * 0.693147182464599609375;
    float _2700 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2702 = _2690 * _2684;
    float _2704 = _2680 * _2684;
    float _2706 = fma(_2702, 0.5, 0.5);
    float _2708 = fma(_2704, -0.5, 0.5);
    float _2710 = _2696 * 0.636619746685028076171875;
    float _2712 = -_2692;
    float _2714 = fma(_2710, _2712, 1.0);
    float3 _7015 = float3(_2706, _2708, _2700);
    float _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7015, float3(0.0), isnan(_7015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7015, float3(0.0), isnan(_7015)), level(0.0)).x;
    float3 _7026 = float3(_2706, _2708, _2700);
    float4 _2719 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7026, float3(0.0), isnan(_7026)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7026, float3(0.0), isnan(_7026)), level(0.0)).xyzw;
    float _2721 = _2719.x;
    float _2723 = _2719.y;
    float _2725 = _2719.z;
    float _2727 = _2719.w;
    float2 _7043 = float2(_2714, _2694);
    float3 _2731 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7043, float2(0.0), isnan(_7043)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7043, float2(0.0), isnan(_7043)), level(0.0)).xyz;
    float _2733 = _2731.x;
    float _2735 = _2731.y;
    float _2737 = _2731.z;
    float _2739 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2741 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2745 = isnan(0.5);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2751 = _2747 || _2749;
    float _2753 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2755 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2739);
    float _2757 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2741);
    float _2759 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2753);
    float _2761 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2755);
    float _2763 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2757);
    float _2765 = _2761 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2767 = _2763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2769 = 1.0 / _2765;
    float _2771 = _2767 + _2765;
    float _2773 = _2700;
    float _2775 = _2761;
    float _2777 = _2765;
    if (!_2751)
    {
        _2046 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2779 = _2046;
    if (!_2751)
    {
        float _2781 = -_2779;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2773 = _2783;
    }
    float _2785 = _2773;
    float _2787 = _2785;
    if (!_2751)
    {
        float _2789 = 1.0 / _2785;
        _2787 = _2789;
    }
    float _2791 = _2787;
    float _2793 = _2771 * _2769;
    float _2795 = _2793 * 0.5;
    float _2797 = _2769;
    float _2799 = _2795;
    if (_2751)
    {
        _2797 = 1.0;
    }
    float _2801 = _2797;
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2803);
    float _2807 = _2801;
    if (!_2751)
    {
        _2799 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2809 = _2799;
    float _2811 = 1.0 / _2805;
    float _2813 = _2809;
    if (!_2751)
    {
        float _2815 = -_2809;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2775 = _2817;
    }
    float _2819 = _2775;
    float _2821 = _2819;
    if (!_2751)
    {
        float _2823 = 1.0 / _2819;
        _2821 = _2823;
    }
    float _2825 = _2821;
    if (!_2751)
    {
        float _2827 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2829 = -_2779;
        float _2831 = fma(_2811, _2827, _2829);
        _2777 = _2831;
    }
    float _2833 = _2777;
    float _2835 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2837 = _2833;
    if (!_2751)
    {
        float _2839 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2841 = -_2809;
        float _2843 = fma(_2811, _2839, _2841);
        _169 = _2843;
    }
    float _2845 = _169;
    if (_2751)
    {
        _2813 = 1.0;
    }
    float _2847 = _2813;
    float _2849 = _2847;
    if (!_2751)
    {
        float _2851 = _2833 * _2791;
        float _2853 = precise::clamp(_2851, 0.0, 1.0);
        _2837 = _2853;
    }
    float _2855 = _2837;
    float _2857 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2759);
    float _2859 = exp2(_2835);
    if (!_2751)
    {
        float _2861 = _2845 * _2825;
        float _2863 = precise::clamp(_2861, 0.0, 1.0);
        _2849 = _2863;
    }
    float _2865 = _2849;
    if (!_2751)
    {
        float _2867 = -_2855;
        float _2869 = _2867 + 1.0;
        _2807 = _2869;
    }
    float _2871 = _2807;
    float _2873 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2857);
    float _2875 = _2865 * _2871;
    bool _2877 = _2865 > 0.0;
    bool _2879 = isnan(_2865);
    bool _2881 = _2877 || _2879;
    bool _2883 = isnan(0.0);
    bool _2885 = _2881 || _2883;
    out.gl_Position.x = _2690;
    out.gl_Position.y = _2680;
    out.gl_Position.z = _2873;
    out.gl_Position.w = _2650;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2889 = _2871 <= 0.0;
    bool _2891 = !_2885;
    bool _2893 = _2889 || _2891;
    float _2895 = _2887 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2897 = _2873 + _2650;
    float _2899 = -_2859;
    float _2901 = _2899 + 1.0;
    float _2903 = _2897 * 0.5;
    float _2905 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2895;
    float _2907 = -_2905;
    float _2909 = _2907 + 1.0;
    out.m_70.z = _2903;
    out.m_70.w = _2650;
    float _2911 = _2905 * _2716;
    float _2913 = _2727 * _2909;
    float _2915 = _2727 * _2911;
    float _2917 = _2737 * _2911;
    float _2919 = fma(_2733, _2915, _2721);
    float _2921 = fma(_2735, _2915, _2723);
    float _2923 = fma(_2727, _2917, _2725);
    out.m_72.x = _2919;
    out.m_72.y = _2921;
    out.m_72.z = _2923;
    out.m_72.w = _2913;
    if (!_2893)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2925;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

