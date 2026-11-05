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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _781 = false;
    bool _645 = false;
    bool _429 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
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
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4276 = as_type<float>(_123);
        out.gl_Position.z = _4276;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    float _127 = float(_107);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    float _149 = 1.0 / _127;
    float _151 = _131;
    if (_147)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    float _155 = _131 * _149;
    int _157 = 0;
    float _159 = _155;
    if (_147)
    {
        float _161 = _153 * 5.0;
        _157 = as_type<int>(_161);
    }
    int _163 = _157;
    out.m_51.x = _155;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4348 = as_type<float>(_163);
        out.gl_Position.z = _4348;
    }
    if (_147)
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
    float _211 = _205;
    float _213 = _207;
    float _231;
    if (!_209)
    {
        float _215 = in.m_58.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _155;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = 1.0 / _259;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = 1.0 / _267;
    float _275 = 1.0 / _263;
    float _277 = _239 * _269;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _235 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_235);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = _243 * _273;
    bool _301 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_235);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -_255;
    float _315 = _313 + 1.0;
    float _317 = _311 * _315;
    float _319 = -_311;
    float _321 = _319 + 1.0;
    float _323 = _281 * _275;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = fma(_285, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = fma(_327, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _337 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_235);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _297 * _321;
    float _355 = -_297;
    float _357 = _355 + 1.0;
    float _359 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = fma(_351, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _347 * _357;
    float _365 = in.m_60.x;
    float _367 = in.m_60.y;
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = _329 * _363;
    float _375 = _335 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _389 = fma(_379, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _391 = fma(_383, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_361, _353, _385);
    float _395 = fma(_359, _353, _387);
    float _397 = fma(_389, _317, _393);
    float _399 = fma(_391, _317, _395);
    float _401 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _397);
    float _403 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _399);
    float _405 = _401 * _365;
    float _407 = _403 * _367;
    bool _409 = !_271;
    float _427;
    if (!_409)
    {
        float _411 = in.m_58.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _155;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _431 + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _443 = _431 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = 1.0 / _447;
    bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _461 = 1.0 / _451;
    bool _463 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_431);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = 1.0 / _455;
    float _477 = _435 * _457;
    bool _479 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _481 = isnan(_431);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    bool _491 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_431);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_489;
    float _505 = _503 + 1.0;
    float _507 = _439 * _461;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = _473 * _505;
    float _519 = -_473;
    float _521 = _519 + 1.0;
    float _523 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _525 = fma(_515, _507, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _531 = _443 * _475;
    bool _533 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _535 = isnan(_431);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = fma(_529, _531, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _555 = fma(_547, _507, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = _543 * _521;
    float _559 = -_543;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _567 = fma(_551, _531, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = _501 * _561;
    float _571 = -_501;
    float _573 = _571 + 1.0;
    float _575 = fma(_565, _531, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _577 = _525 * _569;
    float _579 = _523 * _569;
    float _581 = _555 * _569;
    float _583 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].y, _577);
    float _585 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].z, _581);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _597;
    float _601 = fma(_567, _557, _585);
    float _603 = fma(_591, _477, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _605 = fma(_595, _477, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _607 = fma(_599, _477, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _609 = fma(_575, _557, _583);
    float _611 = fma(_553, _557, _587);
    float _613 = fma(_603, _517, _601);
    float _615 = fma(_607, _517, _609);
    float _617 = fma(_605, _517, _611);
    float _619 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].x, _613);
    float _621 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].y, _615);
    float _623 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].z, _617);
    bool _625 = !_459;
    float _643;
    if (!_625)
    {
        float _627 = in.m_58.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        _643 = _155;
    }
    _645 = false;
    float _647 = _643;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _647 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _659 = isnan(_647);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_647);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _685;
    bool _689 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _691 = isnan(_647);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = 1.0 / _655;
    float _703 = -_667;
    float _705 = _703 + 1.0;
    bool _707 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _709 = 1.0 / _671;
    float _711 = _687 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _717 = fma(_711, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _719 = _683 * _705;
    float _721 = -_699;
    float _723 = _721 + 1.0;
    float _725 = -_683;
    float _727 = _725 + 1.0;
    float _729 = _715 * _709;
    float _731 = _717 * _719;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _735 = _647 + _733;
    float _737 = _667 * _723;
    float _739 = _619 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _731);
    float _743 = fma(_729, _735, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = _623 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _747 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _749 = fma(_743, _737, _741);
    float _751 = _621 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[117].x, _749);
    float _757 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _755 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _747;
    out.m_62.y = _757;
    out.m_62.z = _753;
    out.m_62.w = _759;
    bool _761 = !_707;
    float _779;
    if (!_761)
    {
        float _763 = in.m_58.x;
        float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _767 = _763 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _771 = _769 * _765;
        float _773 = floor(_771);
        float _775 = -_773;
        float _777 = _771 + _775;
        _779 = _777;
        _781 = true;
    }
    else
    {
        _779 = _155;
    }
    _781 = false;
    float _783 = _779;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = _783 + _785;
    bool _789 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _791 = isnan(_783);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _803 = _783 + _801;
    bool _805 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _807 = isnan(_783);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _825 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _827 = isnan(_783);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_799;
    float _839 = _837 + 1.0;
    float _841 = 1.0 / _819;
    float _843 = _835 * _839;
    float _845 = -_835;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _849;
    bool _853 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _855 = 1.0 / _823;
    float _857 = _815 * _847;
    float _859 = -_815;
    float _861 = _859 + 1.0;
    float _863 = _787 * _841;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _869;
    float _873 = fma(_851, _863, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _875 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _877 = fma(_871, _863, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _879 = _803 * _855;
    float _881 = _873 * _857;
    float _883 = _875 * _857;
    float _885 = _877 * _857;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _899 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].x, _881);
    float _901 = fma(_889, _879, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _903 = fma(_893, _879, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].y, _883);
    float _907 = fma(_897, _879, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _909 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].z, _885);
    float _911 = fma(_901, _843, _899);
    float _913 = fma(_903, _843, _905);
    float _915 = fma(_907, _843, _909);
    float _917 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].x, _911);
    float _919 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].y, _913);
    float _921 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].z, _915);
    bool _923 = !_853;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    if (!_923)
    {
        float _927 = in.m_58.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _159 = _941;
    }
    float _943 = _159;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _947 = int(_945);
    float _949 = _149 * _131;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _953 = _943 + _951;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _957 = _955 != 0;
    bool _959 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _961 = isnan(_943);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _973 = int(_971);
    float _975 = float(_947);
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    if (_957)
    {
        _925 = 1.0;
    }
    float _981 = _925;
    float _983 = _981;
    if (!_957)
    {
        _983 = 7.345489978790283203125;
    }
    float _985 = _983;
    float _987 = float(_973);
    float _989 = 1.0 / _975;
    float _991 = 1.0 / _987;
    float _993 = float(uint(_979));
    int _995 = ~_979;
    int _997 = _995 + 1;
    float _999 = float(_979);
    int _1001 = _979 + (-1);
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1005 = int(_1003);
    float _1007 = _989 * _131;
    float _1009 = _991 * _131;
    float _1011 = 1.0 / _993;
    float _1013 = float(uint(_1005));
    float _1015 = trunc(_1007);
    int _1017 = int(_1015);
    float _1019 = 1.0 / _1013;
    int _1021 = as_type<int>(_1011) + (-2);
    float _1023 = in.m_58.x;
    float _1025 = in.m_58.y;
    float _1027 = in.m_58.z;
    float _1029 = in.m_58.w;
    float _1031 = trunc(_1009);
    int _1033 = int(_1031);
    float _1035 = float(uint(_1017));
    float _1037 = float(_1017);
    int _1039 = as_type<int>(_1019) + (-2);
    float _1041 = as_type<float>(_1039) * _1035;
    int _1043 = ~_1005;
    int _1045 = _1043 + 1;
    float _1047 = float(uint(_1033));
    float _1049 = trunc(_1041);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    bool _1056 = _1025 > 0.5;
    float _1058 = as_type<float>(_1021) * _1047;
    float _1060 = _1047;
    if (_957)
    {
        float _1062 = in.m_58.x;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = _1064;
    if (!_957)
    {
        float _1074 = in.m_58.y;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = _985 * _1023;
    int _1080 = _1045 * int(_1054);
    int _1082 = _1080 + _1017;
    float _1084 = float(uint(_1082));
    int _1086 = _997 * int(_1070);
    int _1088 = _1086 + _1033;
    float _1090 = as_type<float>(_1082);
    if (_957)
    {
        _1090 = 1.0;
    }
    float _1092 = _1090;
    float _1094 = _1092;
    if (!_957)
    {
        _1094 = 1.2345600128173828125;
    }
    float _1096 = _1094;
    float _1098 = as_type<float>(_1039) * _1084;
    float _1100 = float(uint(_1088));
    float _1102 = floor(_1078);
    bool _1104 = _1029 > 0.5;
    float _1106 = as_type<float>(_1021) * _1100;
    float _1108 = _1096 * _1076;
    float _1110 = -_201;
    int _1112 = _1104 ? as_type<int>(_1110) : as_type<int>(_201);
    float _1114 = trunc(_1106);
    float _1116 = precise::max(_1114, 0.0);
    uint _1118 = uint(_1116);
    float _1120 = trunc(_1098);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = -_1102;
    float _1128 = _1078 + _1126;
    float _1130 = -_191;
    int _1132 = _1056 ? as_type<int>(_1130) : as_type<int>(_191);
    float _1134 = _1128 * _999;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1146 = _1144 != 0;
    bool _1148 = _1027 > 0.5;
    int _1150 = int(_1070) + int(_1118);
    float _1152 = trunc(_1134);
    int _1154 = int(_1152);
    float _1156 = -_201;
    int _1158 = _1148 ? as_type<int>(_1156) : as_type<int>(_201);
    float _1160 = float(_1033);
    int _1162 = int(_1054) + int(_1124);
    int _1164 = ~_979;
    int _1166 = _1164 + 1;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1170 = _1168 != 0;
    int _1172 = ~_1005;
    int _1174 = _1172 + 1;
    int _1176 = _1166 * _1150;
    int _1178 = _1176 + _1033;
    bool _1180 = !_1146;
    float _1182 = _1180 ? _201 : as_type<float>(_1158);
    bool _1184 = !_1142;
    float _1186 = _1184 ? _191 : as_type<float>(_1132);
    float _1188 = floor(_1108);
    bool _1190 = _1160 >= _999;
    bool _1192 = isnan(_1160);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(_999);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    int _1202 = _1174 * _1162;
    int _1204 = _1202 + _1017;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1216 = _1214 != 0;
    float _1218 = _999 * _949;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1222 = _1220 != 0;
    bool _1224 = !_1170;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = trunc(_1200);
    int _1230 = int(_1228);
    bool _1232 = uint(_1178) >= uint(_979);
    bool _1234 = !_1222;
    int _1236 = _1234 ? 0 : 1;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1240 = _1238 != 0;
    bool _1242 = uint(_1204) >= uint(_1005);
    float _1244 = -_1188;
    float _1246 = _1108 + _1244;
    bool _1248 = !_1232;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = trunc(_1218);
    int _1254 = int(_1252);
    bool _1256 = !_1138;
    float _1258 = _1256 ? _201 : as_type<float>(_1112);
    bool _1260 = !_1240;
    int _1262 = _1260 ? 0 : 1;
    bool _1264 = !_1242;
    int _1266 = _1264 ? 0 : (-1);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1282 = _1280 != 0;
    int _1284 = ~_1150;
    int _1286 = _1284 + _1250;
    int _1288 = _1286 + 1;
    bool _1290 = !_1212;
    int _1292 = _1290 ? 0 : 1;
    bool _1294 = !_1274;
    int _1296 = _1294 ? 0 : 1;
    int _1298 = _979 * _1288;
    int _1300 = _1298 + _1033;
    bool _1302 = _979 == 0;
    int _1304 = ~_1230;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    bool _1310 = !_1302;
    int _1312 = _1310 ? _1300 : (-1);
    float _1314 = float(_1005);
    bool _1316 = !_1208;
    int _1318 = _1316 ? 0 : 1;
    int _1320 = _1312 * _1308;
    int _1322 = abs(_1292);
    float _1324 = _1246 * _1314;
    int _1326 = abs(_1226);
    int _1328 = _1230 * _1001;
    int _1330 = _1328 + _1320;
    bool _1332 = _1037 >= _1314;
    bool _1334 = isnan(_1037);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(_1314);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    int _1344 = abs(_1318);
    float _1346 = trunc(_1342);
    int _1348 = int(_1346);
    int _1350 = ~_1162;
    int _1352 = _1350 + _1266;
    int _1354 = _1352 + 1;
    int _1356 = _1330 * _1322;
    bool _1358 = !_1216;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = _1154 * _1326;
    int _1364 = _1362 + _1033;
    bool _1366 = !_1270;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = _1005 * _1354;
    int _1372 = _1370 + _1017;
    bool _1374 = _1005 == 0;
    int _1376 = _1254 * _1344;
    int _1378 = _1376 + _1356;
    int _1380 = abs(_1360);
    float _1382 = _1314 * _949;
    int _1384 = abs(_1236);
    float _1386 = trunc(_1324);
    int _1388 = int(_1386);
    int _1390 = abs(_1262);
    int _1392 = _1364 * _1380;
    int _1394 = _1392 + _1378;
    bool _1396 = !_1374;
    int _1398 = _1396 ? _1372 : (-1);
    int _1400 = ~_1348;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = trunc(_1382);
    int _1408 = int(_1406);
    int _1410 = _1005 + (-1);
    int _1412 = _1154 * _1384;
    int _1414 = _1412 + _1394;
    int _1416 = abs(_1368);
    int _1418 = _1398 * _1404;
    int _1420 = abs(_1296);
    float _1422 = float(uint(_1414));
    int _1424 = _1348 * _1410;
    int _1426 = _1424 + _1418;
    bool _1428 = !_1278;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1282;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = as_type<float>(_1021) * _1422;
    int _1438 = abs(_1430);
    int _1440 = _1426 * _1420;
    float _1442 = trunc(_1436);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    int _1448 = abs(_1434);
    int _1450 = _1388 * _1390;
    int _1452 = _1450 + _1017;
    int _1454 = _1408 * _1416;
    int _1456 = _1454 + _1440;
    int _1458 = ~_979;
    int _1460 = _1458 + 1;
    int _1462 = _1452 * _1438;
    int _1464 = _1462 + _1456;
    float _1466 = float(uint(_1452));
    int _1468 = ~_1005;
    int _1470 = _1468 + 1;
    int _1472 = _1388 * _1448;
    int _1474 = _1472 + _1464;
    float _1476 = as_type<float>(_1039) * _1466;
    bool _1478 = _1027 > 0.5;
    float _1480 = float(uint(_1474));
    int _1482 = _1460 * int(_1446);
    int _1484 = _1482 + _1414;
    float _1486 = trunc(_1476);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = as_type<float>(_1039) * _1480;
    float _1494 = float(uint(_1484));
    float _1496 = as_type<float>(_1021) * _1494;
    float _1498 = trunc(_1492);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    float _1504 = float(uint(_1364));
    float _1506 = as_type<float>(_1021) * _1504;
    float _1508 = trunc(_1496);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    int _1514 = ~_979;
    int _1516 = _1514 + 1;
    float _1518 = trunc(_1506);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1470 * int(_1502);
    int _1526 = _1524 + _1474;
    float _1528 = float(uint(_1526));
    int _1530 = int(_1446) + int(_1512);
    int _1532 = ~_979;
    int _1534 = _1532 + 1;
    float _1536 = as_type<float>(_1039) * _1528;
    int _1538 = ~_1005;
    int _1540 = _1538 + 1;
    int _1542 = _1534 * _1530;
    int _1544 = _1542 + _1414;
    float _1546 = trunc(_1536);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = _1516 * int(_1522);
    int _1554 = _1552 + _1364;
    bool _1556 = uint(_1544) >= uint(_979);
    float _1558 = float(uint(_1554));
    int _1560 = _1540 * int(_1490);
    int _1562 = _1560 + _1452;
    bool _1564 = !_1556;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = as_type<float>(_1021) * _1558;
    int _1570 = ~_1530;
    int _1572 = _1570 + _1566;
    int _1574 = _1572 + 1;
    float _1576 = float(uint(_1562));
    float _1578 = trunc(_1568);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    int _1584 = ~_1005;
    int _1586 = _1584 + 1;
    int _1588 = _979 * _1574;
    int _1590 = _1588 + _1414;
    int _1592 = int(_1502) + int(_1550);
    float _1594 = as_type<float>(_1039) * _1576;
    bool _1596 = !_1302;
    int _1598 = _1596 ? _1590 : (-1);
    float _1600 = trunc(_1594);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = ~_979;
    int _1608 = _1606 + 1;
    int _1610 = _1586 * _1592;
    int _1612 = _1610 + _1474;
    int _1614 = _1598 & 3;
    bool _1616 = _1614 != 0;
    int _1618 = _1598 & 3;
    bool _1620 = _1618 != 0;
    bool _1622 = uint(_1614) >= 2u;
    int _1624 = _1620 ? 0 : 1;
    bool _1626 = uint(_1612) >= uint(_1005);
    int _1628 = _1622 ? 0 : 1;
    bool _1630 = uint(_1614) > 1u;
    bool _1632 = !_1626;
    int _1634 = _1632 ? 0 : (-1);
    bool _1636 = _1614 != 3;
    int _1638 = int(_1522) + int(_1582);
    float _1640 = -_191;
    int _1642 = _1478 ? as_type<int>(_1640) : as_type<int>(_191);
    int _1644 = ~_1592;
    int _1646 = _1644 + _1634;
    int _1648 = _1646 + 1;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1652 = _1650 != 0;
    int _1654 = _1608 * _1638;
    int _1656 = _1654 + _1364;
    int _1658 = int(_1490) + int(_1604);
    int _1660 = ~_1624;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1664;
    int _1668 = _1628;
    int _1670 = _1474;
    float _1672 = _1594;
    float _1674 = as_type<float>(_1608);
    float _1676 = _1324;
    float _1678 = as_type<float>(_1604);
    if (!_1630)
    {
        int _1680 = ~_1624;
        int _1682 = _1680 + 1;
        _1666 = _1682;
    }
    int _1684 = _1666;
    int _1686 = _1005 * _1648;
    int _1688 = _1686 + _1474;
    int _1690 = ~_1628;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1694;
    if (_1636)
    {
        int _1698 = ~_1628;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    bool _1704 = uint(_1656) >= uint(_979);
    bool _1706 = !_1374;
    int _1708 = _1706 ? _1688 : (-1);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1712 = _1710 != 0;
    if (_1652)
    {
        _1668 = 0;
    }
    int _1714 = _1668;
    int _1716 = _1714;
    if (_1652)
    {
        _1670 = 0;
    }
    int _1718 = _1670;
    bool _1720 = !_1704;
    int _1722 = _1720 ? 0 : (-1);
    int _1724 = _1718;
    if (!_1652)
    {
        _1716 = 1;
    }
    int _1726 = _1716;
    if (!_1652)
    {
        _1724 = 2;
    }
    int _1728 = _1724;
    int _1730 = _1708 & 3;
    bool _1732 = _1730 != 0;
    int _1734 = _1708 & 3;
    bool _1736 = _1734 != 0;
    bool _1738 = !_1712;
    int _1740 = _1738 ? 0 : 1;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1744 = _1742 != 0;
    int _1746 = _1732 ? 0 : 1;
    bool _1748 = uint(_1734) > 1u;
    bool _1750 = !_1744;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = uint(_1734) >= 2u;
    int _1756 = ~_1005;
    int _1758 = _1756 + 1;
    float _1760 = _1754 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1762 = _1734 != 3;
    int _1764 = _1758 * _1658;
    int _1766 = _1764 + _1452;
    int _1768 = ~_1746;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    int _1774 = _1772;
    float _1776 = _1760;
    if (!_1748)
    {
        int _1778 = ~_1746;
        int _1780 = _1778 + 1;
        _1774 = _1780;
    }
    int _1782 = _1774;
    bool _1784 = uint(_1766) >= uint(_1005);
    int _1786 = ~as_type<int>(_1760);
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = !_1784;
    int _1794 = _1792 ? 0 : (-1);
    bool _1796 = _1023 > 0.5;
    int _1798 = _1790;
    if (_1762)
    {
        int _1800 = ~as_type<int>(_1760);
        int _1802 = _1800 + 1;
        _1798 = _1802;
    }
    int _1804 = _1798;
    bool _1806 = _1726 != 1;
    float _1808 = -_191;
    int _1810 = _1796 ? as_type<int>(_1808) : as_type<int>(_191);
    int _1812 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1814 = _1812 != 0;
    float _1816 = _1023 * 2.0;
    int _1818 = ~_1638;
    int _1820 = _1818 + _1722;
    int _1822 = _1820 + 1;
    bool _1824 = !_1814;
    float _1826 = _1824 ? _191 : as_type<float>(_1810);
    bool _1828 = _1728 != 2;
    float _1830 = floor(_1816);
    int _1832 = _979 * _1822;
    int _1834 = _1832 + _1364;
    if (!_1806)
    {
        _1672 = _1025;
    }
    float _1836 = _1672;
    float _1838 = _1025 * 2.0;
    float _1840 = _1836;
    if (!_1806)
    {
        _1776 = _1027;
    }
    float _1842 = _1776;
    float _1844 = _1842;
    if (!_1806)
    {
        _1674 = _1836;
    }
    float _1846 = _1674;
    float _1848 = 0.0;
    float _1850 = _1846;
    if (!_1806)
    {
        _1848 = _1027;
    }
    float _1852 = _1848;
    float _1854 = floor(_1838);
    float _1856 = _1852;
    if (_1806)
    {
        _1850 = _1023;
    }
    float _1858 = _1850;
    if (_1828)
    {
        _1676 = _1023;
    }
    float _1860 = _1676;
    float _1862 = _1860;
    if (_1828)
    {
        _1678 = _1025;
    }
    float _1864 = _1678;
    float _1866 = _1864;
    if (_1806)
    {
        _1840 = _1023;
    }
    float _1868 = _1840;
    if (_1806)
    {
        _1844 = _1025;
    }
    float _1870 = _1844;
    float _1872 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1806)
    {
        _1856 = _1025;
    }
    float _1874 = _1856;
    if (!_1828)
    {
        _1862 = _1027;
    }
    float _1876 = _1862;
    float _1878 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1828)
    {
        _1866 = _1023;
    }
    float _1880 = _1866;
    bool _1882 = _1830 > 0.0;
    float _1884 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1886 = _1830 >= 0.0;
    bool _1888 = isnan(_1830);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan(0.0);
    bool _1894 = _1890 || _1892;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1898 = in.m_44.x;
    float _1900 = in.m_44.y;
    float _1902 = in.m_44.z;
    bool _1904 = !_1302;
    int _1906 = _1904 ? _1834 : (-1);
    int _1908 = _1894 ? 0 : 1;
    int _1910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1912 = _1910 != 0;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1918 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1920 = _1918 != 0;
    int _1922 = ~_1908;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = 1.0 / _1916;
    int _1930 = _1926;
    if (!_1882)
    {
        int _1932 = ~_1908;
        int _1934 = _1932 + 1;
        _1930 = _1934;
    }
    int _1936 = _1930;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1942 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1944 = -_1938;
    float _1946 = fma(_1872, 2.0, _1944);
    bool _1948 = _1854 >= 0.0;
    bool _1950 = isnan(_1854);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(0.0);
    bool _1956 = _1952 || _1954;
    float _1958 = fma(_1942, -2.0, _1940);
    float _1960 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1962 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1964 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1966 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1960);
    float _1968 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1962);
    float _1970 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1964);
    float _1972 = _1023 + _1025;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1974;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1982 = _1956 ? 0 : 1;
    float _1984 = _1972 + (-1.0);
    float _1986 = _1976 * _1928;
    int _1988 = _1598 >> 31;
    float _1990 = 1.0 / _1980;
    bool _1992 = _1854 > 0.0;
    float _1994 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1996 = _1988 & 3;
    float _1998 = _1027 * 2.0;
    bool _2000 = !_1616;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2008 = _1598 + _1996;
    float _2010 = _1027 + _1025;
    bool _2012 = _1614 != 3;
    float _2014 = floor(_1998);
    int _2016 = _1708 >> 31;
    float _2018 = _2010 + (-1.0);
    int _2020 = _2008 >> 2;
    float _2022 = fma(_1986, _953, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2024 = ~_1982;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _2006 * _1990;
    int _2032 = _2016 & 3;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2036 = _943 + _2034;
    int _2038 = _2020 << 4;
    int _2040 = _2038 + 368;
    float _2042 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1968);
    int _2044 = _2028;
    if (!_1992)
    {
        int _2046 = ~_1982;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = fma(_2030, _2036, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2054 = _1734 != 3;
    uint _2056 = uint(int(uint(_2040) >> uint(2)));
    uint _2058 = uint(int(uint(int(_2056)) >> uint(2)));
    int _2060 = int(_2056) & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    int _2064 = int(_2056) + 1;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    int _2068 = _2064 & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = _1708 + _2032;
    float _2074 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1970);
    bool _2076 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2078 = isnan(_943);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = -_131;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1946);
    bool _2092 = !_1736;
    int _2094 = _2092 ? 0 : 1;
    float _2096 = _2074 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2098 = !_2054;
    int _2100 = _2098 ? 0 : (-1);
    float _2102 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1958);
    bool _2104 = !_2012;
    int _2106 = _2104 ? 0 : (-1);
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2110 = _2108 != 0;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2114 = _2112 != 0;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2118 = _2116 != 0;
    float _2120 = -_2086;
    float _2122 = _2120 + 1.0;
    bool _2124 = _2014 >= 0.0;
    bool _2126 = isnan(_2014);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan(0.0);
    bool _2132 = _2128 || _2130;
    float _2134 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2136 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2138 = isnan(_943);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = _969 * _2122;
    int _2150 = _2132 ? 0 : 1;
    float _2152 = -_969;
    float _2154 = _2152 + 1.0;
    bool _2156 = _2014 > 0.0;
    float _2158 = -_2146;
    float _2160 = _2158 + 1.0;
    int _2162 = _2040 + 8;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    uint _2166 = uint(int(uint(int(_2164)) >> uint(2)));
    int _2168 = int(_2164) & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    int _2172 = int(_2164) + 1;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    int _2176 = _2172 & 3;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[int(_2174)][_2176];
    int _2180 = _2072 >> 2;
    float _2182 = _2146 * _2154;
    float _2184 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1966);
    int _2186 = ~_2150;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2180 << 4;
    int _2194 = _2192 + 512;
    float _2196 = _2022 * _2182;
    int _2198 = ~_1658;
    int _2200 = _2198 + _1794;
    int _2202 = _2200 + 1;
    uint _2204 = uint(int(uint(_2194) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    float _2220 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2196);
    int _2222 = _2190;
    if (!_2156)
    {
        int _2224 = ~_2150;
        int _2226 = _2224 + 1;
        _2222 = _2226;
    }
    int _2228 = _2222;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2232 = int(_2230);
    float _2234 = fma(_2052, _2148, _2220);
    int _2236 = _2194 + 8;
    uint _2238 = uint(int(uint(_2236) >> uint(2)));
    uint _2240 = uint(int(uint(int(_2238)) >> uint(2)));
    int _2242 = int(_2238) & 3;
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[int(_2240)][_2242];
    int _2246 = int(_2238) + 1;
    uint _2248 = uint(int(uint(_2246) >> uint(2)));
    int _2250 = _2246 & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2256 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2234);
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2260 = abs(_2002);
    float _2262 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2254);
    int _2264 = abs(_1684);
    float _2266 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2258);
    int _2268 = abs(_1782);
    float _2270 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2262);
    float _2272 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2266);
    int _2274 = abs(_1702);
    float _2276 = -_2270;
    float _2278 = _2276 + 1.0;
    int _2280 = ~_2264;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = -_2272;
    float _2288 = _2286 + 1.0;
    int _2290 = ~_2274;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2268;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    int _2302 = _2284 * as_type<int>(_2070);
    int _2304 = ~_2260;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = abs(_2094);
    int _2312 = abs(_2100);
    int _2314 = _2308 * as_type<int>(_2062);
    int _2316 = _2314 + _2302;
    float _2318 = float(uint(_2232));
    int _2320 = _1005 * _2202;
    int _2322 = _2320 + _1452;
    int _2324 = ~_2310;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2332 = _2294 * as_type<int>(_2170);
    int _2334 = _2332 + _2316;
    int _2336 = abs(_2106);
    int _2338 = abs(_1740);
    int _2340 = ~_2336;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    float _2346 = 1.0 / _2318;
    int _2348 = abs(_1804);
    int _2350 = _2344 * as_type<int>(_2178);
    int _2352 = _2350 + _2334;
    int _2354 = ~_2338;
    int _2356 = _2354 + 1;
    int _2358 = _2356 + 1;
    int _2360 = _2300 * as_type<int>(_2218);
    int _2362 = ~_2348;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = _2042 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2370 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2372 = int(_2370);
    int _2374 = _2352 * _2358;
    int _2376 = _2328 * as_type<int>(_2210);
    int _2378 = _2376 + _2360;
    int _2380 = abs(_2232);
    int _2382 = _1906 * _2338;
    int _2384 = _2382 + _2374;
    int _2386 = abs(_1752);
    int _2388 = _2366 * as_type<int>(_2244);
    int _2390 = _2388 + _2378;
    int _2392 = ~_2312;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = _2184 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2402 = _2368 + _2400;
    int _2404 = as_type<int>(_2346) + (-2);
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2408 = _2096 + _2406;
    float _2410 = float(uint(_2384));
    int _2412 = _2396 * as_type<int>(_2252);
    int _2414 = _2412 + _2390;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2398 + _2416;
    float _2420 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2422 = float(uint(_2372));
    float _2424 = as_type<float>(_2404) * _2410;
    int _2426 = abs(_2372);
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2420);
    float _2430 = float(uint(_2380));
    float _2432 = _2402 * _2402;
    float _2434 = float(uint(_2426));
    float _2436 = trunc(_2424);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2428);
    int _2444 = ~_2386;
    int _2446 = _2444 + 1;
    int _2448 = _2446 + 1;
    float _2450 = fma(_2418, _2418, _2432);
    bool _2452 = !_1374;
    int _2454 = _2452 ? _2322 : (-1);
    float _2456 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2458 = _2442 >= 0.0;
    float _2460 = fma(_2408, _2408, _2450);
    float _2462 = 1.0 / _2422;
    int _2464 = _2414 * _2448;
    float _2466 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2468 = ~_2232;
    int _2470 = _2468 + 1;
    float _2472 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2474 = _2454 * _2386;
    int _2476 = _2474 + _2464;
    int _2478 = abs(_2384);
    float _2480 = _405 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2482 = 1.0 / _2430;
    int _2484 = _2470 * int(_2440);
    int _2486 = _2484 + _2384;
    float _2488 = float(uint(_2476));
    float _2490 = _2480 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2492 = abs(_2476);
    float _2494 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2496 = float(uint(_2478));
    float _2498 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2500 = 1.0 / _2434;
    int _2502 = as_type<int>(_2462) + (-2);
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = float(uint(_2486));
    float _2508 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2510 = float(uint(_2492));
    float _2512 = as_type<float>(_2502) * _2488;
    float _2514 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2516 = sqrt(_2460);
    int _2518 = as_type<int>(_2482) + (-2);
    float _2520 = as_type<float>(_2404) * _2506;
    out.m_64.x = _2494;
    out.m_64.y = _2498;
    out.m_64.z = _2504;
    out.m_64.w = _2514;
    int _2522 = ~_2426;
    int _2524 = _2522 + 1;
    float _2526 = as_type<float>(_2518) * _2496;
    int _2528 = ~_2372;
    int _2530 = _2528 + 1;
    float _2532 = rsqrt(_2460);
    int _2534 = as_type<int>(_2500) + (-2);
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2538 = !_2114;
    int _2540 = _2538 ? 0 : 1;
    if (_2458)
    {
        out.m_47.x = 0.0;
    }
    float _2542 = float(_1936);
    float _2544 = as_type<float>(_2534) * _2510;
    float _2546 = -_2536;
    float _2548 = fma(_1884, 2.0, _2546);
    float _2550 = _2516 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2552 = trunc(_2512);
    float _2554 = precise::max(_2552, 0.0);
    uint _2556 = uint(_2554);
    float _2558 = _1186 + 0.5;
    float _2560 = -_131;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2548);
    float _2564 = precise::min(_2490, _2550);
    int _2566 = abs(_2540);
    float _2568 = _2402 * _2532;
    float _2570 = trunc(_2526);
    float _2572 = precise::max(_2570, 0.0);
    uint _2574 = uint(_2572);
    float _2576 = _2418 * _2532;
    float _2578 = fma(_2508, _2558, _2562);
    float _2580 = _2568 * _2564;
    int _2582 = ~_2232;
    int _2584 = _2582 + 1;
    float _2586 = _2576 * _2564;
    float _2588 = float(_2566);
    float _2590 = -_2580;
    float _2592 = _2402 + _2590;
    float _2594 = trunc(_2544);
    float _2596 = precise::max(_2594, 0.0);
    uint _2598 = uint(_2596);
    int _2600 = ~_2380;
    int _2602 = _2600 + 1;
    int _2604 = _2530 * int(_2556);
    int _2606 = _2604 + _2476;
    float _2608 = -_2586;
    float _2610 = _2418 + _2608;
    float _2612 = _2592 * _2592;
    float _2614 = _2588 * _2542;
    bool _2616 = _1025 > 0.5;
    out.m_66.w = _2564;
    float _2618 = trunc(_2520);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    int _2624 = _2602 * int(_2574);
    int _2626 = _2624 + _2478;
    float _2628 = float(uint(_2606));
    float _2630 = float(uint(_2626));
    float _2632 = as_type<float>(_2502) * _2628;
    int _2634 = _2524 * int(_2598);
    int _2636 = _2634 + _2492;
    float _2638 = fma(_2610, _2610, _2612);
    float _2640 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2642 = as_type<float>(_2518) * _2630;
    float _2644 = trunc(_2632);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = float(uint(_2636));
    int _2652 = int(_2440) + int(_2622);
    float _2654 = _2408 * _2532;
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2658 = as_type<float>(_2534) * _2650;
    float _2660 = _2654 * _2564;
    float _2662 = trunc(_2642);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = fma(_1896, -2.0, _2656);
    int _2670 = ~_2372;
    int _2672 = _2670 + 1;
    float _2674 = -_2660;
    float _2676 = _2408 + _2674;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2680 = ~_2380;
    int _2682 = _2680 + 1;
    float _2684 = fma(_2676, _2676, _2638);
    float _2686 = trunc(_2658);
    float _2688 = precise::max(_2686, 0.0);
    uint _2690 = uint(_2688);
    int _2692 = _2584 * _2652;
    int _2694 = _2692 + _2384;
    int _2696 = int(_2556) + int(_2648);
    float _2698 = fma(_1878, -2.0, _2678);
    int _2700 = ~_2426;
    int _2702 = _2700 + 1;
    bool _2704 = uint(_2694) >= uint(_2232);
    int _2706 = _2672 * _2696;
    int _2708 = _2706 + _2476;
    float _2710 = sqrt(_2684);
    int _2712 = int(_2574) + int(_2666);
    float _2714 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2698);
    bool _2716 = !_2110;
    int _2718 = _2716 ? 0 : 1;
    int _2720 = _2682 * _2712;
    int _2722 = _2720 + _2478;
    int _2724 = int(_2598) + int(_2690);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2728 = _2702 * _2724;
    int _2730 = _2728 + _2492;
    float _2732 = -_2726;
    float _2734 = fma(_2640, 2.0, _2732);
    float _2736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2738 = _2532 * _2710;
    bool _2740 = !_2704;
    int _2742 = _2740 ? 0 : (-1);
    bool _2744 = uint(_2708) >= uint(_2372);
    float _2746 = _2480 * _2738;
    int _2748 = ~_2652;
    int _2750 = _2748 + _2742;
    int _2752 = _2750 + 1;
    bool _2754 = !_2744;
    int _2756 = _2754 ? 0 : (-1);
    float _2758 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2760 = uint(_2722) >= uint(_2380);
    int _2762 = _2232 * _2752;
    int _2764 = _2762 + _2384;
    int _2766 = ~_2696;
    int _2768 = _2766 + _2756;
    int _2770 = _2768 + 1;
    float _2772 = _2576 * _2758;
    float _2774 = _2568 * _2758;
    bool _2776 = !_2760;
    int _2778 = _2776 ? 0 : (-1);
    float _2780 = _2654 * _2758;
    bool _2782 = uint(_2730) >= uint(_2426);
    float _2784 = -_2774;
    float _2786 = _2402 + _2784;
    float _2788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2790 = -_2772;
    float _2792 = _2418 + _2790;
    bool _2794 = !_2782;
    int _2796 = _2794 ? 0 : (-1);
    float _2798 = _2786 * _2786;
    bool _2800 = _2232 == 0;
    int _2802 = _2372 * _2770;
    int _2804 = _2802 + _2476;
    int _2806 = _2384 ^ _2232;
    float _2808 = fma(_2792, _2792, _2798);
    bool _2810 = !_2800;
    int _2812 = _2810 ? _2764 : (-1);
    float _2814 = -_2780;
    float _2816 = _2408 + _2814;
    bool _2818 = _2372 == 0;
    float _2820 = _2736 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2822 = uint(int(uint(_2806) >> uint(31)));
    bool _2824 = !_2818;
    int _2826 = _2824 ? _2804 : (-1);
    float _2828 = fma(_2816, _2816, _2808);
    int _2830 = abs(_2718);
    float _2832 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2834 = ~_2778;
    int _2836 = _2712 + _2834;
    int _2838 = _2836 + 1;
    int _2840 = ~int(_2822);
    int _2842 = _2840 + 1;
    float _2844 = _1182 + (-0.5);
    float _2846 = float(_2228);
    float _2848 = sqrt(_2828);
    float _2850 = float(_2830);
    int _2852 = _2838 ^ _2842;
    float _2854 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2668);
    bool _2856 = _2232 == 0;
    float _2858 = _2850 * _2846;
    int _2860 = ~_2842;
    int _2862 = _2860 + _2852;
    int _2864 = _2862 + 1;
    float _2866 = -_2832;
    float _2868 = -_2854;
    float _2870 = fma(_2866, _2844, _2868);
    float _2872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2874 = as_type<float>(_2712);
    int _2876 = as_type<int>(_2788);
    if (_2458)
    {
        _2874 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2878 = _2874;
    bool _2880 = !_2856;
    int _2882 = _2880 ? _2864 : (-1);
    bool _2884 = _2372 == 0;
    if (_2458)
    {
        float _2886 = _2878 * 5.0;
        _2876 = as_type<int>(_2886);
    }
    int _2888 = _2876;
    int _2890 = _2476 ^ _2372;
    float _2892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2894 = ~_2796;
    int _2896 = _2724 + _2894;
    int _2898 = _2896 + 1;
    float _2900 = _2532 * _2848;
    uint _2902 = uint(int(uint(_2890) >> uint(31)));
    if (_2458)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8416 = as_type<float>(_2888);
        out.gl_Position.z = _8416;
    }
    float _2904 = float(_2812);
    float _2906 = _2746 * _2900;
    int _2908 = ~int(_2902);
    int _2910 = _2908 + 1;
    float _2912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2914 = float(_2826);
    float _2916 = _2872 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2918 = _2898 ^ _2910;
    float _2920 = fma(_2820, _2904, _2090);
    float _2922 = float(_2882);
    out.m_68.x = _2906;
    int _2924 = ~_2910;
    int _2926 = _2924 + _2918;
    int _2928 = _2926 + 1;
    float _2930 = -_131;
    float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2734);
    float _2934 = _1826 + 0.5;
    float _2936 = -_201;
    int _2938 = _2616 ? as_type<int>(_2936) : as_type<int>(_201);
    float _2940 = _2892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2942 = fma(_2916, _2914, _2932);
    float _2944 = fma(_2820, _2934, _2920);
    bool _2946 = !_1912;
    float _2948 = _2946 ? _191 : as_type<float>(_1642);
    float _2950 = -_2102;
    float _2952 = fma(_2940, _2922, _2950);
    bool _2954 = !_1920;
    float _2956 = _2954 ? _201 : as_type<float>(_2938);
    float _2958 = _2912 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2960 = !_2884;
    int _2962 = _2960 ? _2928 : (-1);
    float _2964 = _2948 + 0.5;
    float _2966 = _2956 + (-0.5);
    float _2968 = float(_2962);
    float _2970 = fma(_2916, _2964, _2942);
    float _2972 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2974 = log2(_2972);
    float _2976 = -_2940;
    float _2978 = fma(_2976, _2966, _2952);
    float _2980 = _1258 + (-0.5);
    float _2982 = -_2714;
    float _2984 = fma(_2958, _2968, _2982);
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2988 = -_2958;
    float _2990 = fma(_2988, _2980, _2984);
    float _2992 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2986);
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2996 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2998 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3000 = isnan(0.0);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3006 = _3002 || _3004;
    float _3008 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2992);
    float _3010 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2994);
    float _3012 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2996);
    float _3014 = _2974 * _131;
    float _3016 = -_3008;
    float _3018 = _3016 + 1.0;
    float _3020 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3010);
    float _3022 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3012);
    float _3024 = -_3018;
    float _3026 = fma(_1186, _3024, _2578);
    float _3028 = -_3020;
    float _3030 = _3028 + 1.0;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3034 = exp2(_3014);
    float _3036 = -_3022;
    float _3038 = _3036 + 1.0;
    float _3040 = -_3030;
    float _3042 = fma(_1826, _3040, _2944);
    float _3044 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3032);
    float _3046 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3048 = 1.0 + _3046;
    float _3050 = fma(_1182, _3038, _2870);
    bool _3052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3054 = isnan(1.0);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3060 = _3056 || _3058;
    float _3062 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3044);
    float _3064 = 1.0 / _3048;
    float _3066 = in.m_70.x;
    float _3068 = in.m_70.y;
    float _3070 = in.m_70.z;
    float _3072 = -_2278;
    float _3074 = fma(_2948, _3072, _2970);
    float _3076 = -_3062;
    float _3078 = _3076 + 1.0;
    float _3080 = fma(_1258, _2288, _2990);
    out.m_72.x = _3026;
    out.m_72.y = _3050;
    float _3082 = fma(_2956, _3078, _2978);
    float _3084 = -_3034;
    float _3086 = _3084 + 1.0;
    bool _3088 = !_2118;
    int _3090 = _3088 ? 0 : 1;
    out.m_74.x = _3042;
    out.m_74.y = _3082;
    out.m_74.z = _3074;
    out.m_74.w = _3080;
    float _3092 = _3006 ? _3086 : 0.0;
    if (_3060)
    {
        float _3094 = _3092 * _3064;
        _151 = _3094;
    }
    float _3096 = _151;
    if (_2458)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3098 = _2858 * (-2.0);
    float _3100 = -_2774;
    float _3102 = _2368 + _3100;
    float _3104 = _1023 + (-0.5);
    float _3106 = -_2772;
    float _3108 = _2398 + _3106;
    float _3110 = fma(_3098, _3066, _3066);
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3114 = _3102 + _3112;
    float _3116 = fma(_1994, _3098, _1994);
    float _3118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3120 = _3108 + _3118;
    float _3122 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3110);
    float _3124 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3126 = -_2780;
    float _3128 = _2096 + _3126;
    int _3130 = abs(_3090);
    float _3132 = _2614 * (-2.0);
    float _3134 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3124);
    float _3136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3138 = _3128 + _3136;
    float _3140 = _1025 + (-0.5);
    float _3142 = fma(_3132, _3068, _3068);
    float _3144 = fma(_2134, _3132, _2134);
    float _3146 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3134);
    float _3148 = fma(_3140, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3142);
    float _3150 = float(_2050);
    float _3152 = fma(_3116, _3096, _3122);
    float _3154 = float(_3130);
    float _3156 = _1027 + _1023;
    bool _3158 = _3146 >= 0.0;
    float _3160 = fma(_3144, _3096, _3148);
    float _3162 = _3154 * _3150;
    float _3164 = _3152 * 0.15915493667125701904296875;
    float _3166 = _3156 + (-1.0);
    float _3168 = _3160 * 0.15915493667125701904296875;
    float _3170 = _3162 * (-2.0);
    float _3172 = _3164 * 6.283185482025146484375;
    float _3174 = sin(_3172);
    float _3176 = fma(_3166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3178 = _1027 + (-0.5);
    float _3180 = fma(_3170, _3070, _3070);
    float _3182 = _3124;
    int _3184 = as_type<int>(_3178);
    if (_3158)
    {
        _3182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3186 = _3182;
    float _3188 = fma(_3176, _3170, _3176);
    float _3190 = fma(_3178, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3180);
    float _3192 = _3164 * 6.283185482025146484375;
    float _3194 = cos(_3192);
    if (_3158)
    {
        float _3196 = _3186 * 5.0;
        _3184 = as_type<int>(_3196);
    }
    int _3198 = _3184;
    float _3200 = fma(_3188, _3096, _3190);
    if (_3158)
    {
        out.m_47.x = 0.0;
    }
    float _3202 = _3200 * 0.15915493667125701904296875;
    float _3204 = _3168 * 6.283185482025146484375;
    float _3206 = sin(_3204);
    if (_3158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8914 = as_type<float>(_3198);
        out.gl_Position.z = _8914;
    }
    float _3208 = _3168 * 6.283185482025146484375;
    float _3210 = cos(_3208);
    if (_3158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3212 = _3202 * 6.283185482025146484375;
    float _3214 = cos(_3212);
    float _3216 = _407 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3218 = _2738 * _2900;
    float _3220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _3222 = _3194 * _3210;
    float _3224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _3226 = _3216 * _3218;
    float _3228 = _3174 * _3210;
    float _3230 = _3202 * 6.283185482025146484375;
    float _3232 = sin(_3230);
    float _3234 = _3194 * _3206;
    float _3236 = _3226 * _3220;
    float _3238 = _3174 * _3206;
    float _3240 = _2906 * _3224;
    float _3242 = _3218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3244 = _3242 * 0.5;
    float _3246 = _3194 * _3214;
    float _3248 = _3210 * _3214;
    float _3250 = _3174 * _3214;
    float _3252 = _3206 * _3214;
    float _3254 = _3246 * _3236;
    float _3256 = fma(_3232, _3222, _3238);
    float _3258 = -_3228;
    float _3260 = fma(_3232, _3234, _3258);
    float _3262 = -_3236;
    float _3264 = _3232 * _3262;
    float _3266 = -_3234;
    float _3268 = fma(_3232, _3228, _3266);
    float _3270 = fma(_3256, _3240, _3254);
    float _3272 = _3250 * _3236;
    float _3274 = fma(_3248, _3240, _3264);
    float _3276 = fma(_3232, _3238, _3222);
    float _3278 = fma(_3260, _3244, _3270);
    float _3280 = fma(_3268, _3240, _3272);
    float _3282 = fma(_3252, _3244, _3274);
    float _3284 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3286 = fma(_3276, _3244, _3280);
    float _3288 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3290 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3284);
    float _3292 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3288);
    float _3294 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3290);
    float _3296 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3292);
    float _3298 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3300 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3302 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3304 = _2096 + _3298;
    float _3306 = _2398 + _3300;
    float _3308 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3302);
    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3312 = _3304 + _3310;
    float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3316 = _3306 + _3314;
    float _3318 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3308);
    float _3320 = _3312 * _3312;
    float _3322 = fma(_3316, _3316, _3320);
    float _3324 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3326 = sqrt(_3322);
    float _3328 = _2368 + _3324;
    bool _3330 = _3326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3332 = _3282;
    float _3334 = _3304;
    float _3336 = _3306;
    if (!_3330)
    {
        _3332 = _3304;
    }
    float _3338 = _3332;
    float _3340 = _3338;
    if (!_3330)
    {
        _3334 = _3328;
    }
    float _3342 = _3334;
    bool _3344 = !_3330;
    float _3346 = _3342;
    if (!_3344)
    {
        float _3348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3352 = _3326 + _3350;
        float _3354 = rsqrt(_3322);
        float _3356 = _3352 * _3348;
        float _3358 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3360 = _3356 * 0.15915493667125701904296875;
        float _3362 = _3360 * 6.283185482025146484375;
        float _3364 = sin(_3362);
        float _3366 = _3360 * 6.283185482025146484375;
        float _3368 = cos(_3366);
        float _3370 = fma(_3364, _3358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3372 = _3354 * _3370;
        float _3374 = _3368 + (-1.0);
        float _3376 = fma(_3316, _3372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3378 = fma(_3312, _3372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3380 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3382 = fma(_3328, _3368, _3380);
        _3346 = _3382;
        _3336 = _3376;
        _3340 = _3378;
    }
    float _3384 = _3346;
    float _3386 = _3336;
    float _3388 = _3340;
    float _3390 = -_2368;
    float _3392 = _3390 + _3384;
    float _3394 = -_2398;
    float _3396 = _3394 + _3386;
    float _3398 = -_2096;
    float _3400 = _3398 + _3388;
    float _3402 = -_2580;
    float _3404 = _2368 + _3402;
    float _3406 = _3392 * _3392;
    float _3408 = -_2586;
    float _3410 = _2398 + _3408;
    float _3412 = -_2660;
    float _3414 = _2096 + _3412;
    float _3416 = -_2774;
    float _3418 = _3416 + _3404;
    float _3420 = fma(_3396, _3396, _3406);
    float _3422 = -_2580;
    float _3424 = _3422 + _3384;
    float _3426 = -_2780;
    float _3428 = _3426 + _3414;
    float _3430 = _3418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3432 = fma(_3400, _3400, _3420);
    float _3434 = -_2772;
    float _3436 = _3434 + _3410;
    float _3438 = -_2660;
    float _3440 = _3438 + _3388;
    float _3442 = sqrt(_3432);
    float _3444 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3430);
    float _3446 = _3418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3448 = -_2586;
    float _3450 = _3448 + _3386;
    bool _3452 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3454 = isnan(0.5);
    bool _3456 = _3452 || _3454;
    bool _3458 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3460 = _3456 || _3458;
    float _3462 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3444);
    float _3464 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3446);
    bool _3466 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3468 = isnan(0.5);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3474 = _3470 || _3472;
    float _3476 = _3462 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3478 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3464);
    float _3480 = 1.0 / _3476;
    float _3482 = _3478 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3484 = _3442 > 0.0;
    float _3486 = _3482 + _3476;
    float _3488 = _3482;
    float _3490 = _3442;
    float _3492 = _3450;
    if (!_3484)
    {
        _3488 = _3424;
    }
    float _3494 = _3488;
    float _3496 = _3494;
    float _3498 = _3494;
    if (!_3484)
    {
        _3490 = _3440;
    }
    float _3500 = _3490;
    bool _3502 = !_3484;
    float _3504 = _3500;
    float _3506 = _3500;
    if (!_3502)
    {
        float _3508 = _205 * _205;
        float _3510 = rsqrt(_3432);
        float _3512 = fma(_203, _203, _3508);
        float _3514 = fma(_207, _207, _3512);
        float _3516 = sqrt(_3514);
        float _3518 = _3396 * _3510;
        float _3520 = _3392 * _3510;
        float _3522 = _3400 * _3510;
        bool _3524 = _3516 > 0.0;
        if (!_3524)
        {
            _3496 = _3424;
        }
        float _3526 = _3496;
        _3498 = _3526;
        if (!_3524)
        {
            _3504 = _3440;
        }
        float _3528 = _3504;
        bool _3530 = !_3524;
        _3506 = _3528;
        if (!_3530)
        {
            float _3532 = rsqrt(_3514);
            float _3534 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3536 = _205 * _3532;
            float _3538 = _203 * _3532;
            float _3540 = _3520 * _3536;
            float _3542 = _207 * _3532;
            float _3544 = fma(_3518, _3538, _3540);
            float _3546 = _3534 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3548 = fma(_3522, _3542, _3544);
            float _3550 = _3548 * _3546;
            float _3552 = fma(_203, _3550, _3450);
            float _3554 = fma(_205, _3550, _3424);
            float _3556 = fma(_207, _3550, _3440);
            _3492 = _3552;
            _3498 = _3554;
            _3506 = _3556;
        }
    }
    float _3558 = _3492;
    float _3560 = _3498;
    float _3562 = _3506;
    float _3564 = -_2772;
    float _3566 = _3564 + _3558;
    float _3568 = -_2774;
    float _3570 = _3568 + _3560;
    float _3572 = -_2780;
    float _3574 = _3572 + _3562;
    float _3576 = _3486 * _3480;
    float _3578 = _3576 * 0.5;
    float _3580 = _3570;
    float _3582 = _3566;
    float _3584 = _3574;
    if (_3474)
    {
        _211 = 1.0;
    }
    float _3586 = _211;
    float _3588 = _3586;
    if (!_3460)
    {
        float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3592 = _3418 + _3590;
        float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3596 = _3436 + _3594;
        float _3598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3600 = -_3414;
        float _3602 = _3600 + _3562;
        float _3604 = _3592 * _3592;
        float _3606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3608 = _3428 + _3606;
        float _3610 = -_3410;
        float _3612 = _3610 + _3558;
        float _3614 = fma(_3596, _3596, _3604);
        float _3616 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3618 = fma(_3608, _3608, _3614);
        float _3620 = sqrt(_3618);
        float _3622 = 1.0 / _2900;
        float _3624 = _3616 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3626 = precise::min(_3620, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3628 = _3626 * _3598;
        float _3630 = -_3404;
        float _3632 = _3630 + _3560;
        float _3634 = _3628 * _3622;
        float _3636 = _3624 * _3634;
        float _3638 = _3602 * _3634;
        float _3640 = fma(_3632, _3636, _3418);
        float _3642 = fma(_3612, _3636, _3436);
        float _3644 = fma(_3624, _3638, _3428);
        _3580 = _3640;
        _3582 = _3642;
        _3584 = _3644;
    }
    float _3646 = _3580;
    float _3648 = _3582;
    float _3650 = _3584;
    if (!_3474)
    {
        float _3652 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3654 = _3652 * 0.15915493667125701904296875;
        float _3656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3660 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3658);
        float _3662 = _3654 * 6.283185482025146484375;
        float _3664 = cos(_3662);
        float _3666 = _3656 * 0.15915493667125701904296875;
        float _3668 = _3654 * 6.283185482025146484375;
        float _3670 = sin(_3668);
        float _3672 = 1.0 / _3664;
        float _3674 = _3666 * 6.283185482025146484375;
        float _3676 = cos(_3674);
        float _3678 = _3670 * _3672;
        float _3680 = _3666 * 6.283185482025146484375;
        float _3682 = sin(_3680);
        float _3684 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3686 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3684;
        float _3688 = _3676 * _3678;
        float _3690 = 1.0 / _3660;
        float _3692 = 1.0 / _3688;
        float _3694 = 1.0 / _3686;
        float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3698 = _3690 * _3696;
        float _3700 = _3682 * _3692;
        float _3702 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3704 = fma(_3700, _3698, _3702);
        float _3706 = _3704 * _3694;
        float _3708 = precise::clamp(_3706, 0.0, 1.0);
        _213 = _3678;
        _3588 = _3708;
    }
    float _3710 = _213;
    float _3712 = _3588;
    float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3716 = _3646 + _3714;
    float _3718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3720 = _3648 + _3718;
    float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3724 = _3650 + _3722;
    float _3726 = _3716 * _3716;
    float _3728 = fma(_3720, _3720, _3726);
    float _3730 = fma(_3724, _3724, _3728);
    float _3732 = rsqrt(_3730);
    float _3734 = sqrt(_3730);
    float _3736 = _3732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3738 = _3720 * _3736;
    float _3740 = _3724 * _3736;
    float _3742 = _3738 * _3738;
    float _3744 = _3740 * _3740;
    float _3746 = _3742 + _3744;
    float _3748 = sqrt(_3746);
    bool _3750 = _3748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3754 = _3748 + _3752;
    float _3756 = _3724;
    float _3758 = _3746;
    float _3760 = _3754;
    float _3762 = _3726;
    float _3764 = _3736;
    if (_3750)
    {
        float _3766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3756 = _3766;
    }
    float _3768 = _3756;
    if (_3750)
    {
        float _3770 = rsqrt(_3746);
        _3758 = _3770;
    }
    float _3772 = _3758;
    float _3774 = _3772;
    if (_3750)
    {
        float _3776 = _3754 * _3768;
        _3760 = _3776;
    }
    float _3778 = _3760;
    if (_3750)
    {
        float _3780 = _3778 * 0.15915493667125701904296875;
        _3762 = _3780;
    }
    float _3782 = _3762;
    float _3784 = _3768;
    float _3786 = _3782;
    if (_3750)
    {
        float _3788 = _3782 * 6.283185482025146484375;
        float _3790 = sin(_3788);
        _3784 = _3790;
    }
    float _3792 = _3784;
    float _3794 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3796 = precise::max(0.0, _3794);
    float _3798 = _3710;
    float _3800 = _3796;
    if (_3750)
    {
        float _3802 = _3782 * 6.283185482025146484375;
        float _3804 = cos(_3802);
        _3798 = _3804;
    }
    float _3806 = _3798;
    float _3808 = -_3736;
    float _3810 = -_3796;
    float _3812 = fma(_3716, _3808, _3810);
    float _3814 = _3812;
    if (_3750)
    {
        float _3816 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3800 = _3816;
    }
    float _3818 = _3800;
    float _3820 = _3792;
    float _3822 = _3818;
    if (_3750)
    {
        float _3824 = fma(_3792, _3818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3820 = _3824;
    }
    float _3826 = _3820;
    float _3828 = _3826;
    float _3830 = _3806;
    if (_3750)
    {
        float _3832 = _3806 + (-1.0);
        _3822 = _3832;
    }
    float _3834 = _3822;
    float _3836 = _3834;
    if (_3750)
    {
        float _3838 = _3772 * _3826;
        _3764 = _3838;
    }
    float _3840 = _3764;
    if (!_3750)
    {
        _3828 = _3738;
    }
    float _3842 = _3828;
    float _3844 = _3842;
    if (_3750)
    {
        float _3846 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3786 = _3846;
    }
    float _3848 = _3786;
    if (_3750)
    {
        float _3850 = _3738 * _3840;
        _3844 = _3850;
    }
    float _3852 = _3844;
    if (!_3750)
    {
        _3836 = _3740;
    }
    float _3854 = _3836;
    float _3856 = _3854;
    if (_3750)
    {
        float _3858 = _3740 * _3840;
        _3856 = _3858;
    }
    float _3860 = _3856;
    if (!_3750)
    {
        _3774 = _3742;
    }
    float _3862 = _3774;
    float _3864 = _3862;
    if (_3750)
    {
        float _3866 = fma(_3812, _3806, _3848);
        _3814 = _3866;
    }
    float _3868 = _3814;
    if (_3750)
    {
        float _3870 = _3852 * _3852;
        _3864 = _3870;
    }
    float _3872 = _3864;
    if (!_3750)
    {
        _3830 = _3744;
    }
    float _3874 = _3830;
    float _3876 = _3874;
    if (_3750)
    {
        float _3878 = _3860 * _3860;
        _3876 = _3878;
    }
    float _3880 = _3876;
    float _3882 = fma(_3868, _3868, _3872);
    float _3884 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3886 = _3882 + _3880;
    float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3890 = fma(_3734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3888);
    float _3892 = precise::clamp(_3890, 0.0, 1.0);
    float _3894 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3884);
    float _3896 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3898 = rsqrt(_3886);
    float _3900 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3902 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3894);
    float _3904 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3906 = -_3892;
    float _3908 = _3906 + 1.0;
    float _3910 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3900);
    float _3912 = _3902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3914 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3904);
    float _3916 = abs(_3908);
    float _3918 = log2(_3916);
    float _3920 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3910);
    float _3922 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3924 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3914);
    float _3926 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3928 = _3920 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3930 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3922);
    float _3932 = _3924 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3934 = _3898 * _3852;
    float _3936 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3938 = _3898 * _3868;
    float _3940 = -_3926;
    float _3942 = fma(_3940, _3896, 1.0);
    float _3944 = _3934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3946 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3930);
    float _3948 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3936);
    float _3950 = _3898 * _3860;
    float _3952 = -_3944;
    float _3954 = fma(_3938, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3952);
    float _3956 = _3946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3958 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3948);
    float _3960 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3962 = -_3950;
    float _3964 = fma(_3962, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3954);
    float _3966 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3968 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3958);
    float _3970 = exp2(_3960);
    float _3972 = fma(_3964, -0.5, 0.5);
    float _3974 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3976 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3966);
    float _3978 = fma(_3964, 0.5, 0.5);
    float _3980 = _3938 + 1.0;
    float _3982 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3974);
    float _3984 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3976);
    float _3986 = log2(_3942);
    float _3988 = fma(_3978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3990 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3982);
    float _3992 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3984);
    float _3994 = fma(_3978, _3988, -0.212114393711090087890625);
    float _3996 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3990);
    float _3998 = 1.0 / _3968;
    float _4000 = -_3938;
    float _4002 = fma(_3970, _3980, _4000);
    float _4004 = fma(_3978, _3994, 1.570728778839111328125);
    float _4006 = fma(_4002, 0.5, 0.5);
    float _4008 = sqrt(_3972);
    float _4010 = _3986 * 0.693147182464599609375;
    float _4012 = _4010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4014 = _3992 * _3998;
    float _4016 = _3996 * _3998;
    float _4018 = fma(_4014, 0.5, 0.5);
    float _4020 = fma(_4016, -0.5, 0.5);
    float _4022 = _4008 * 0.636619746685028076171875;
    float3 _10208 = float3(_4018, _4020, _4012);
    float _4024 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10208, float3(0.0), isnan(_10208)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10208, float3(0.0), isnan(_10208)), level(0.0)).x;
    float3 _10219 = float3(_4018, _4020, _4012);
    float4 _4027 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10219, float3(0.0), isnan(_10219)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10219, float3(0.0), isnan(_10219)), level(0.0)).xyzw;
    float _4029 = _4027.x;
    float _4031 = _4027.y;
    float _4033 = _4027.z;
    float _4035 = _4027.w;
    float _4037 = -_4004;
    float _4039 = fma(_4022, _4037, 1.0);
    float2 _10241 = float2(_4039, _4006);
    float3 _4043 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10241, float2(0.0), isnan(_10241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10241, float2(0.0), isnan(_10241)), level(0.0)).xyz;
    float _4045 = _4043.x;
    float _4047 = _4043.y;
    float _4049 = _4043.z;
    float _4051 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4053 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4055 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4057 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4059 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4061 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4063 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4065 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4051);
    float _4067 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4053);
    float _4069 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4055);
    float _4071 = -_3232;
    float _4073 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4057);
    float _4075 = -_3232;
    float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4059);
    float _4079 = -_3232;
    float _4081 = fma(_4079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4061);
    float _4083 = fma(_4063, _4063, 1.0);
    float _4085 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4087 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4089 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4091 = rsqrt(_4083);
    float _4093 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4085);
    float _4095 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4087);
    float _4097 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4089);
    float _4099 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4073);
    float _4101 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4103 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4077);
    float _4105 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4081);
    float _4107 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4065);
    float _4109 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4101);
    float _4111 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4067);
    float _4113 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4069);
    float _4115 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4117 = _4063 * _4099;
    float _4119 = _4063 * _4103;
    float _4121 = _4063 * _4105;
    float _4123 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4093);
    float _4125 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4095);
    float _4127 = _4063 * _4091;
    float _4129 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4097);
    float _4131 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4109);
    float _4133 = fma(_4115, _4107, _4117);
    float _4135 = -_4123;
    float _4137 = _4127 * _4135;
    float _4139 = -_4125;
    float _4141 = _4127 * _4139;
    float _4143 = fma(_4115, _4111, _4119);
    float _4145 = fma(_4115, _4113, _4121);
    float _4147 = -_4129;
    float _4149 = _4127 * _4147;
    float _4151 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4153 = fma(_4091, _4099, _4137);
    float _4155 = fma(_4091, _4103, _4141);
    float _4157 = fma(_4091, _4105, _4149);
    float _4159 = _4123 + _4133;
    float _4161 = exp2(_4151);
    float _4163 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4131);
    bool _4165 = _3712 > 0.0;
    bool _4167 = isnan(_3712);
    bool _4169 = _4165 || _4167;
    bool _4171 = isnan(0.0);
    bool _4173 = _4169 || _4171;
    out.m_76.x = _3436;
    out.m_76.y = _3418;
    out.m_76.z = _3428;
    float _4175 = _4125 + _4143;
    float _4177 = _3712 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4179 = _4163 + _3968;
    float _4181 = _3968 * 0.5;
    out.m_78.x = _3648;
    out.m_78.y = _3646;
    out.m_78.z = _3650;
    float _4183 = _3992 + _3968;
    float _4185 = _4129 + _4145;
    float _4187 = _4179 * 0.5;
    float _4189 = _4183 * 0.5;
    float _4191 = fma(_3996, -0.5, _4181);
    float _4193 = _4177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4195 = -_4161;
    float _4197 = _4195 + 1.0;
    out.m_80.x = _4107;
    out.m_80.y = _4111;
    out.m_80.z = _4113;
    float _4199 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _4153;
    out.m_82.y = _4155;
    out.m_82.z = _4157;
    float _4201 = -_4199;
    float _4203 = _4201 + 1.0;
    out.m_84.x = _4159;
    out.m_84.y = _4175;
    out.m_84.z = _4185;
    out.gl_Position.x = _3992;
    out.gl_Position.y = _3996;
    out.gl_Position.z = _4163;
    out.gl_Position.w = _3968;
    out.m_86.x = _4189;
    out.m_86.y = _4191;
    out.m_86.z = _4187;
    out.m_86.w = _3968;
    out.m_47.x = _4193;
    float _4205 = _4199 * _4024;
    float _4207 = _4035 * _4203;
    float _4209 = _4035 * _4205;
    float _4211 = _4049 * _4205;
    float _4213 = fma(_4045, _4209, _4029);
    float _4215 = fma(_4047, _4209, _4031);
    float _4217 = fma(_4035, _4211, _4033);
    out.m_88.x = _4213;
    out.m_88.y = _4215;
    out.m_88.z = _4217;
    out.m_88.w = _4207;
    if (_4173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4219 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4219;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _781 = false;
    bool _645 = false;
    bool _429 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
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
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4276 = as_type<float>(_123);
        out.gl_Position.z = _4276;
    }
    if (!_111)
    {
        return out;
    }
    float _125 = in.m_49.w;
    float _127 = float(_107);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    float _149 = 1.0 / _127;
    float _151 = _131;
    if (_147)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    float _155 = _131 * _149;
    int _157 = 0;
    float _159 = _155;
    if (_147)
    {
        float _161 = _153 * 5.0;
        _157 = as_type<int>(_161);
    }
    int _163 = _157;
    out.m_51.x = _155;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4348 = as_type<float>(_163);
        out.gl_Position.z = _4348;
    }
    if (_147)
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
    float _211 = _205;
    float _213 = _207;
    float _231;
    if (!_209)
    {
        float _215 = in.m_58.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _155;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = 1.0 / _259;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = 1.0 / _267;
    float _275 = 1.0 / _263;
    float _277 = _239 * _269;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _235 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_235);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = _243 * _273;
    bool _301 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_235);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -_255;
    float _315 = _313 + 1.0;
    float _317 = _311 * _315;
    float _319 = -_311;
    float _321 = _319 + 1.0;
    float _323 = _281 * _275;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = fma(_285, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = fma(_327, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _337 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_235);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _297 * _321;
    float _355 = -_297;
    float _357 = _355 + 1.0;
    float _359 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = fma(_351, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _347 * _357;
    float _365 = in.m_60.x;
    float _367 = in.m_60.y;
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = _329 * _363;
    float _375 = _335 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _389 = fma(_379, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _391 = fma(_383, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_361, _353, _385);
    float _395 = fma(_359, _353, _387);
    float _397 = fma(_389, _317, _393);
    float _399 = fma(_391, _317, _395);
    float _401 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _397);
    float _403 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _399);
    float _405 = _401 * _365;
    float _407 = _403 * _367;
    bool _409 = !_271;
    float _427;
    if (!_409)
    {
        float _411 = in.m_58.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _155;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _431 + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _443 = _431 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = 1.0 / _447;
    bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _461 = 1.0 / _451;
    bool _463 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_431);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = 1.0 / _455;
    float _477 = _435 * _457;
    bool _479 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _481 = isnan(_431);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    bool _491 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_431);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_489;
    float _505 = _503 + 1.0;
    float _507 = _439 * _461;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = _473 * _505;
    float _519 = -_473;
    float _521 = _519 + 1.0;
    float _523 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _525 = fma(_515, _507, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _531 = _443 * _475;
    bool _533 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _535 = isnan(_431);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = fma(_529, _531, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _555 = fma(_547, _507, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = _543 * _521;
    float _559 = -_543;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _567 = fma(_551, _531, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = _501 * _561;
    float _571 = -_501;
    float _573 = _571 + 1.0;
    float _575 = fma(_565, _531, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _577 = _525 * _569;
    float _579 = _523 * _569;
    float _581 = _555 * _569;
    float _583 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].y, _577);
    float _585 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].z, _581);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _597;
    float _601 = fma(_567, _557, _585);
    float _603 = fma(_591, _477, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _605 = fma(_595, _477, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _607 = fma(_599, _477, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _609 = fma(_575, _557, _583);
    float _611 = fma(_553, _557, _587);
    float _613 = fma(_603, _517, _601);
    float _615 = fma(_607, _517, _609);
    float _617 = fma(_605, _517, _611);
    float _619 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].x, _613);
    float _621 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].y, _615);
    float _623 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].z, _617);
    bool _625 = !_459;
    float _643;
    if (!_625)
    {
        float _627 = in.m_58.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        _643 = _155;
    }
    _645 = false;
    float _647 = _643;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _647 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _659 = isnan(_647);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_647);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _685;
    bool _689 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _691 = isnan(_647);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = 1.0 / _655;
    float _703 = -_667;
    float _705 = _703 + 1.0;
    bool _707 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _709 = 1.0 / _671;
    float _711 = _687 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _717 = fma(_711, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _719 = _683 * _705;
    float _721 = -_699;
    float _723 = _721 + 1.0;
    float _725 = -_683;
    float _727 = _725 + 1.0;
    float _729 = _715 * _709;
    float _731 = _717 * _719;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _735 = _647 + _733;
    float _737 = _667 * _723;
    float _739 = _619 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _731);
    float _743 = fma(_729, _735, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = _623 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _747 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _749 = fma(_743, _737, _741);
    float _751 = _621 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[117].x, _749);
    float _757 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _755 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _747;
    out.m_62.y = _757;
    out.m_62.z = _753;
    out.m_62.w = _759;
    bool _761 = !_707;
    float _779;
    if (!_761)
    {
        float _763 = in.m_58.x;
        float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _767 = _763 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _771 = _769 * _765;
        float _773 = floor(_771);
        float _775 = -_773;
        float _777 = _771 + _775;
        _779 = _777;
        _781 = true;
    }
    else
    {
        _779 = _155;
    }
    _781 = false;
    float _783 = _779;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = _783 + _785;
    bool _789 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _791 = isnan(_783);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _803 = _783 + _801;
    bool _805 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _807 = isnan(_783);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _825 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _827 = isnan(_783);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_799;
    float _839 = _837 + 1.0;
    float _841 = 1.0 / _819;
    float _843 = _835 * _839;
    float _845 = -_835;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _849;
    bool _853 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _855 = 1.0 / _823;
    float _857 = _815 * _847;
    float _859 = -_815;
    float _861 = _859 + 1.0;
    float _863 = _787 * _841;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _869;
    float _873 = fma(_851, _863, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _875 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _877 = fma(_871, _863, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _879 = _803 * _855;
    float _881 = _873 * _857;
    float _883 = _875 * _857;
    float _885 = _877 * _857;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _899 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].x, _881);
    float _901 = fma(_889, _879, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _903 = fma(_893, _879, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].y, _883);
    float _907 = fma(_897, _879, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _909 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].z, _885);
    float _911 = fma(_901, _843, _899);
    float _913 = fma(_903, _843, _905);
    float _915 = fma(_907, _843, _909);
    float _917 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].x, _911);
    float _919 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].y, _913);
    float _921 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].z, _915);
    bool _923 = !_853;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    if (!_923)
    {
        float _927 = in.m_58.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _159 = _941;
    }
    float _943 = _159;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _947 = int(_945);
    float _949 = _149 * _131;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _953 = _943 + _951;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _957 = _955 != 0;
    bool _959 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _961 = isnan(_943);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _973 = int(_971);
    float _975 = float(_947);
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    if (_957)
    {
        _925 = 1.0;
    }
    float _981 = _925;
    float _983 = _981;
    if (!_957)
    {
        _983 = 7.345489978790283203125;
    }
    float _985 = _983;
    float _987 = float(_973);
    float _989 = 1.0 / _975;
    float _991 = 1.0 / _987;
    float _993 = float(uint(_979));
    int _995 = ~_979;
    int _997 = _995 + 1;
    float _999 = float(_979);
    int _1001 = _979 + (-1);
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1005 = int(_1003);
    float _1007 = _989 * _131;
    float _1009 = _991 * _131;
    float _1011 = 1.0 / _993;
    float _1013 = float(uint(_1005));
    float _1015 = trunc(_1007);
    int _1017 = int(_1015);
    float _1019 = 1.0 / _1013;
    int _1021 = as_type<int>(_1011) + (-2);
    float _1023 = in.m_58.x;
    float _1025 = in.m_58.y;
    float _1027 = in.m_58.z;
    float _1029 = in.m_58.w;
    float _1031 = trunc(_1009);
    int _1033 = int(_1031);
    float _1035 = float(uint(_1017));
    float _1037 = float(_1017);
    int _1039 = as_type<int>(_1019) + (-2);
    float _1041 = as_type<float>(_1039) * _1035;
    int _1043 = ~_1005;
    int _1045 = _1043 + 1;
    float _1047 = float(uint(_1033));
    float _1049 = trunc(_1041);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    bool _1056 = _1025 > 0.5;
    float _1058 = as_type<float>(_1021) * _1047;
    float _1060 = _1047;
    if (_957)
    {
        float _1062 = in.m_58.x;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = _1064;
    if (!_957)
    {
        float _1074 = in.m_58.y;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = _985 * _1023;
    int _1080 = _1045 * int(_1054);
    int _1082 = _1080 + _1017;
    float _1084 = float(uint(_1082));
    int _1086 = _997 * int(_1070);
    int _1088 = _1086 + _1033;
    float _1090 = as_type<float>(_1082);
    if (_957)
    {
        _1090 = 1.0;
    }
    float _1092 = _1090;
    float _1094 = _1092;
    if (!_957)
    {
        _1094 = 1.2345600128173828125;
    }
    float _1096 = _1094;
    float _1098 = as_type<float>(_1039) * _1084;
    float _1100 = float(uint(_1088));
    float _1102 = floor(_1078);
    bool _1104 = _1029 > 0.5;
    float _1106 = as_type<float>(_1021) * _1100;
    float _1108 = _1096 * _1076;
    float _1110 = -_201;
    int _1112 = _1104 ? as_type<int>(_1110) : as_type<int>(_201);
    float _1114 = trunc(_1106);
    float _1116 = precise::max(_1114, 0.0);
    uint _1118 = uint(_1116);
    float _1120 = trunc(_1098);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = -_1102;
    float _1128 = _1078 + _1126;
    float _1130 = -_191;
    int _1132 = _1056 ? as_type<int>(_1130) : as_type<int>(_191);
    float _1134 = _1128 * _999;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1146 = _1144 != 0;
    bool _1148 = _1027 > 0.5;
    int _1150 = int(_1070) + int(_1118);
    float _1152 = trunc(_1134);
    int _1154 = int(_1152);
    float _1156 = -_201;
    int _1158 = _1148 ? as_type<int>(_1156) : as_type<int>(_201);
    float _1160 = float(_1033);
    int _1162 = int(_1054) + int(_1124);
    int _1164 = ~_979;
    int _1166 = _1164 + 1;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1170 = _1168 != 0;
    int _1172 = ~_1005;
    int _1174 = _1172 + 1;
    int _1176 = _1166 * _1150;
    int _1178 = _1176 + _1033;
    bool _1180 = !_1146;
    float _1182 = _1180 ? _201 : as_type<float>(_1158);
    bool _1184 = !_1142;
    float _1186 = _1184 ? _191 : as_type<float>(_1132);
    float _1188 = floor(_1108);
    bool _1190 = _1160 >= _999;
    bool _1192 = isnan(_1160);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(_999);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    int _1202 = _1174 * _1162;
    int _1204 = _1202 + _1017;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1216 = _1214 != 0;
    float _1218 = _999 * _949;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1222 = _1220 != 0;
    bool _1224 = !_1170;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = trunc(_1200);
    int _1230 = int(_1228);
    bool _1232 = uint(_1178) >= uint(_979);
    bool _1234 = !_1222;
    int _1236 = _1234 ? 0 : 1;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1240 = _1238 != 0;
    bool _1242 = uint(_1204) >= uint(_1005);
    float _1244 = -_1188;
    float _1246 = _1108 + _1244;
    bool _1248 = !_1232;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = trunc(_1218);
    int _1254 = int(_1252);
    bool _1256 = !_1138;
    float _1258 = _1256 ? _201 : as_type<float>(_1112);
    bool _1260 = !_1240;
    int _1262 = _1260 ? 0 : 1;
    bool _1264 = !_1242;
    int _1266 = _1264 ? 0 : (-1);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1282 = _1280 != 0;
    int _1284 = ~_1150;
    int _1286 = _1284 + _1250;
    int _1288 = _1286 + 1;
    bool _1290 = !_1212;
    int _1292 = _1290 ? 0 : 1;
    bool _1294 = !_1274;
    int _1296 = _1294 ? 0 : 1;
    int _1298 = _979 * _1288;
    int _1300 = _1298 + _1033;
    bool _1302 = _979 == 0;
    int _1304 = ~_1230;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    bool _1310 = !_1302;
    int _1312 = _1310 ? _1300 : (-1);
    float _1314 = float(_1005);
    bool _1316 = !_1208;
    int _1318 = _1316 ? 0 : 1;
    int _1320 = _1312 * _1308;
    int _1322 = abs(_1292);
    float _1324 = _1246 * _1314;
    int _1326 = abs(_1226);
    int _1328 = _1230 * _1001;
    int _1330 = _1328 + _1320;
    bool _1332 = _1037 >= _1314;
    bool _1334 = isnan(_1037);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(_1314);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    int _1344 = abs(_1318);
    float _1346 = trunc(_1342);
    int _1348 = int(_1346);
    int _1350 = ~_1162;
    int _1352 = _1350 + _1266;
    int _1354 = _1352 + 1;
    int _1356 = _1330 * _1322;
    bool _1358 = !_1216;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = _1154 * _1326;
    int _1364 = _1362 + _1033;
    bool _1366 = !_1270;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = _1005 * _1354;
    int _1372 = _1370 + _1017;
    bool _1374 = _1005 == 0;
    int _1376 = _1254 * _1344;
    int _1378 = _1376 + _1356;
    int _1380 = abs(_1360);
    float _1382 = _1314 * _949;
    int _1384 = abs(_1236);
    float _1386 = trunc(_1324);
    int _1388 = int(_1386);
    int _1390 = abs(_1262);
    int _1392 = _1364 * _1380;
    int _1394 = _1392 + _1378;
    bool _1396 = !_1374;
    int _1398 = _1396 ? _1372 : (-1);
    int _1400 = ~_1348;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = trunc(_1382);
    int _1408 = int(_1406);
    int _1410 = _1005 + (-1);
    int _1412 = _1154 * _1384;
    int _1414 = _1412 + _1394;
    int _1416 = abs(_1368);
    int _1418 = _1398 * _1404;
    int _1420 = abs(_1296);
    float _1422 = float(uint(_1414));
    int _1424 = _1348 * _1410;
    int _1426 = _1424 + _1418;
    bool _1428 = !_1278;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1282;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = as_type<float>(_1021) * _1422;
    int _1438 = abs(_1430);
    int _1440 = _1426 * _1420;
    float _1442 = trunc(_1436);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    int _1448 = abs(_1434);
    int _1450 = _1388 * _1390;
    int _1452 = _1450 + _1017;
    int _1454 = _1408 * _1416;
    int _1456 = _1454 + _1440;
    int _1458 = ~_979;
    int _1460 = _1458 + 1;
    int _1462 = _1452 * _1438;
    int _1464 = _1462 + _1456;
    float _1466 = float(uint(_1452));
    int _1468 = ~_1005;
    int _1470 = _1468 + 1;
    int _1472 = _1388 * _1448;
    int _1474 = _1472 + _1464;
    float _1476 = as_type<float>(_1039) * _1466;
    bool _1478 = _1027 > 0.5;
    float _1480 = float(uint(_1474));
    int _1482 = _1460 * int(_1446);
    int _1484 = _1482 + _1414;
    float _1486 = trunc(_1476);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = as_type<float>(_1039) * _1480;
    float _1494 = float(uint(_1484));
    float _1496 = as_type<float>(_1021) * _1494;
    float _1498 = trunc(_1492);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    float _1504 = float(uint(_1364));
    float _1506 = as_type<float>(_1021) * _1504;
    float _1508 = trunc(_1496);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    int _1514 = ~_979;
    int _1516 = _1514 + 1;
    float _1518 = trunc(_1506);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1470 * int(_1502);
    int _1526 = _1524 + _1474;
    float _1528 = float(uint(_1526));
    int _1530 = int(_1446) + int(_1512);
    int _1532 = ~_979;
    int _1534 = _1532 + 1;
    float _1536 = as_type<float>(_1039) * _1528;
    int _1538 = ~_1005;
    int _1540 = _1538 + 1;
    int _1542 = _1534 * _1530;
    int _1544 = _1542 + _1414;
    float _1546 = trunc(_1536);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = _1516 * int(_1522);
    int _1554 = _1552 + _1364;
    bool _1556 = uint(_1544) >= uint(_979);
    float _1558 = float(uint(_1554));
    int _1560 = _1540 * int(_1490);
    int _1562 = _1560 + _1452;
    bool _1564 = !_1556;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = as_type<float>(_1021) * _1558;
    int _1570 = ~_1530;
    int _1572 = _1570 + _1566;
    int _1574 = _1572 + 1;
    float _1576 = float(uint(_1562));
    float _1578 = trunc(_1568);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    int _1584 = ~_1005;
    int _1586 = _1584 + 1;
    int _1588 = _979 * _1574;
    int _1590 = _1588 + _1414;
    int _1592 = int(_1502) + int(_1550);
    float _1594 = as_type<float>(_1039) * _1576;
    bool _1596 = !_1302;
    int _1598 = _1596 ? _1590 : (-1);
    float _1600 = trunc(_1594);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = ~_979;
    int _1608 = _1606 + 1;
    int _1610 = _1586 * _1592;
    int _1612 = _1610 + _1474;
    int _1614 = _1598 & 3;
    bool _1616 = _1614 != 0;
    int _1618 = _1598 & 3;
    bool _1620 = _1618 != 0;
    bool _1622 = uint(_1614) >= 2u;
    int _1624 = _1620 ? 0 : 1;
    bool _1626 = uint(_1612) >= uint(_1005);
    int _1628 = _1622 ? 0 : 1;
    bool _1630 = uint(_1614) > 1u;
    bool _1632 = !_1626;
    int _1634 = _1632 ? 0 : (-1);
    bool _1636 = _1614 != 3;
    int _1638 = int(_1522) + int(_1582);
    float _1640 = -_191;
    int _1642 = _1478 ? as_type<int>(_1640) : as_type<int>(_191);
    int _1644 = ~_1592;
    int _1646 = _1644 + _1634;
    int _1648 = _1646 + 1;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1652 = _1650 != 0;
    int _1654 = _1608 * _1638;
    int _1656 = _1654 + _1364;
    int _1658 = int(_1490) + int(_1604);
    int _1660 = ~_1624;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1664;
    int _1668 = _1628;
    int _1670 = _1474;
    float _1672 = _1594;
    float _1674 = as_type<float>(_1608);
    float _1676 = _1324;
    float _1678 = as_type<float>(_1604);
    if (!_1630)
    {
        int _1680 = ~_1624;
        int _1682 = _1680 + 1;
        _1666 = _1682;
    }
    int _1684 = _1666;
    int _1686 = _1005 * _1648;
    int _1688 = _1686 + _1474;
    int _1690 = ~_1628;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1694;
    if (_1636)
    {
        int _1698 = ~_1628;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    bool _1704 = uint(_1656) >= uint(_979);
    bool _1706 = !_1374;
    int _1708 = _1706 ? _1688 : (-1);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1712 = _1710 != 0;
    if (_1652)
    {
        _1668 = 0;
    }
    int _1714 = _1668;
    int _1716 = _1714;
    if (_1652)
    {
        _1670 = 0;
    }
    int _1718 = _1670;
    bool _1720 = !_1704;
    int _1722 = _1720 ? 0 : (-1);
    int _1724 = _1718;
    if (!_1652)
    {
        _1716 = 1;
    }
    int _1726 = _1716;
    if (!_1652)
    {
        _1724 = 2;
    }
    int _1728 = _1724;
    int _1730 = _1708 & 3;
    bool _1732 = _1730 != 0;
    int _1734 = _1708 & 3;
    bool _1736 = _1734 != 0;
    bool _1738 = !_1712;
    int _1740 = _1738 ? 0 : 1;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1744 = _1742 != 0;
    int _1746 = _1732 ? 0 : 1;
    bool _1748 = uint(_1734) > 1u;
    bool _1750 = !_1744;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = uint(_1734) >= 2u;
    int _1756 = ~_1005;
    int _1758 = _1756 + 1;
    float _1760 = _1754 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1762 = _1734 != 3;
    int _1764 = _1758 * _1658;
    int _1766 = _1764 + _1452;
    int _1768 = ~_1746;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    int _1774 = _1772;
    float _1776 = _1760;
    if (!_1748)
    {
        int _1778 = ~_1746;
        int _1780 = _1778 + 1;
        _1774 = _1780;
    }
    int _1782 = _1774;
    bool _1784 = uint(_1766) >= uint(_1005);
    int _1786 = ~as_type<int>(_1760);
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = !_1784;
    int _1794 = _1792 ? 0 : (-1);
    bool _1796 = _1023 > 0.5;
    int _1798 = _1790;
    if (_1762)
    {
        int _1800 = ~as_type<int>(_1760);
        int _1802 = _1800 + 1;
        _1798 = _1802;
    }
    int _1804 = _1798;
    bool _1806 = _1726 != 1;
    float _1808 = -_191;
    int _1810 = _1796 ? as_type<int>(_1808) : as_type<int>(_191);
    int _1812 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1814 = _1812 != 0;
    float _1816 = _1023 * 2.0;
    int _1818 = ~_1638;
    int _1820 = _1818 + _1722;
    int _1822 = _1820 + 1;
    bool _1824 = !_1814;
    float _1826 = _1824 ? _191 : as_type<float>(_1810);
    bool _1828 = _1728 != 2;
    float _1830 = floor(_1816);
    int _1832 = _979 * _1822;
    int _1834 = _1832 + _1364;
    if (!_1806)
    {
        _1672 = _1025;
    }
    float _1836 = _1672;
    float _1838 = _1025 * 2.0;
    float _1840 = _1836;
    if (!_1806)
    {
        _1776 = _1027;
    }
    float _1842 = _1776;
    float _1844 = _1842;
    if (!_1806)
    {
        _1674 = _1836;
    }
    float _1846 = _1674;
    float _1848 = 0.0;
    float _1850 = _1846;
    if (!_1806)
    {
        _1848 = _1027;
    }
    float _1852 = _1848;
    float _1854 = floor(_1838);
    float _1856 = _1852;
    if (_1806)
    {
        _1850 = _1023;
    }
    float _1858 = _1850;
    if (_1828)
    {
        _1676 = _1023;
    }
    float _1860 = _1676;
    float _1862 = _1860;
    if (_1828)
    {
        _1678 = _1025;
    }
    float _1864 = _1678;
    float _1866 = _1864;
    if (_1806)
    {
        _1840 = _1023;
    }
    float _1868 = _1840;
    if (_1806)
    {
        _1844 = _1025;
    }
    float _1870 = _1844;
    float _1872 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1806)
    {
        _1856 = _1025;
    }
    float _1874 = _1856;
    if (!_1828)
    {
        _1862 = _1027;
    }
    float _1876 = _1862;
    float _1878 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1828)
    {
        _1866 = _1023;
    }
    float _1880 = _1866;
    bool _1882 = _1830 > 0.0;
    float _1884 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1886 = _1830 >= 0.0;
    bool _1888 = isnan(_1830);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan(0.0);
    bool _1894 = _1890 || _1892;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1898 = in.m_44.x;
    float _1900 = in.m_44.y;
    float _1902 = in.m_44.z;
    bool _1904 = !_1302;
    int _1906 = _1904 ? _1834 : (-1);
    int _1908 = _1894 ? 0 : 1;
    int _1910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1912 = _1910 != 0;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1918 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1920 = _1918 != 0;
    int _1922 = ~_1908;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = 1.0 / _1916;
    int _1930 = _1926;
    if (!_1882)
    {
        int _1932 = ~_1908;
        int _1934 = _1932 + 1;
        _1930 = _1934;
    }
    int _1936 = _1930;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1942 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1944 = -_1938;
    float _1946 = fma(_1872, 2.0, _1944);
    bool _1948 = _1854 >= 0.0;
    bool _1950 = isnan(_1854);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(0.0);
    bool _1956 = _1952 || _1954;
    float _1958 = fma(_1942, -2.0, _1940);
    float _1960 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1962 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1964 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1966 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1960);
    float _1968 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1962);
    float _1970 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1964);
    float _1972 = _1023 + _1025;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1974;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1982 = _1956 ? 0 : 1;
    float _1984 = _1972 + (-1.0);
    float _1986 = _1976 * _1928;
    int _1988 = _1598 >> 31;
    float _1990 = 1.0 / _1980;
    bool _1992 = _1854 > 0.0;
    float _1994 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1996 = _1988 & 3;
    float _1998 = _1027 * 2.0;
    bool _2000 = !_1616;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2008 = _1598 + _1996;
    float _2010 = _1027 + _1025;
    bool _2012 = _1614 != 3;
    float _2014 = floor(_1998);
    int _2016 = _1708 >> 31;
    float _2018 = _2010 + (-1.0);
    int _2020 = _2008 >> 2;
    float _2022 = fma(_1986, _953, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2024 = ~_1982;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _2006 * _1990;
    int _2032 = _2016 & 3;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2036 = _943 + _2034;
    int _2038 = _2020 << 4;
    int _2040 = _2038 + 368;
    float _2042 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1968);
    int _2044 = _2028;
    if (!_1992)
    {
        int _2046 = ~_1982;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = fma(_2030, _2036, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2054 = _1734 != 3;
    uint _2056 = uint(int(uint(_2040) >> uint(2)));
    uint _2058 = uint(int(uint(int(_2056)) >> uint(2)));
    int _2060 = int(_2056) & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    int _2064 = int(_2056) + 1;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    int _2068 = _2064 & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = _1708 + _2032;
    float _2074 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1970);
    bool _2076 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2078 = isnan(_943);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = -_131;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1946);
    bool _2092 = !_1736;
    int _2094 = _2092 ? 0 : 1;
    float _2096 = _2074 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2098 = !_2054;
    int _2100 = _2098 ? 0 : (-1);
    float _2102 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1958);
    bool _2104 = !_2012;
    int _2106 = _2104 ? 0 : (-1);
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2110 = _2108 != 0;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2114 = _2112 != 0;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2118 = _2116 != 0;
    float _2120 = -_2086;
    float _2122 = _2120 + 1.0;
    bool _2124 = _2014 >= 0.0;
    bool _2126 = isnan(_2014);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan(0.0);
    bool _2132 = _2128 || _2130;
    float _2134 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2136 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2138 = isnan(_943);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = _969 * _2122;
    int _2150 = _2132 ? 0 : 1;
    float _2152 = -_969;
    float _2154 = _2152 + 1.0;
    bool _2156 = _2014 > 0.0;
    float _2158 = -_2146;
    float _2160 = _2158 + 1.0;
    int _2162 = _2040 + 8;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    uint _2166 = uint(int(uint(int(_2164)) >> uint(2)));
    int _2168 = int(_2164) & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    int _2172 = int(_2164) + 1;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    int _2176 = _2172 & 3;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[int(_2174)][_2176];
    int _2180 = _2072 >> 2;
    float _2182 = _2146 * _2154;
    float _2184 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1966);
    int _2186 = ~_2150;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2180 << 4;
    int _2194 = _2192 + 512;
    float _2196 = _2022 * _2182;
    int _2198 = ~_1658;
    int _2200 = _2198 + _1794;
    int _2202 = _2200 + 1;
    uint _2204 = uint(int(uint(_2194) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    float _2220 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2196);
    int _2222 = _2190;
    if (!_2156)
    {
        int _2224 = ~_2150;
        int _2226 = _2224 + 1;
        _2222 = _2226;
    }
    int _2228 = _2222;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2232 = int(_2230);
    float _2234 = fma(_2052, _2148, _2220);
    int _2236 = _2194 + 8;
    uint _2238 = uint(int(uint(_2236) >> uint(2)));
    uint _2240 = uint(int(uint(int(_2238)) >> uint(2)));
    int _2242 = int(_2238) & 3;
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[int(_2240)][_2242];
    int _2246 = int(_2238) + 1;
    uint _2248 = uint(int(uint(_2246) >> uint(2)));
    int _2250 = _2246 & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2256 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2234);
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2260 = abs(_2002);
    float _2262 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2254);
    int _2264 = abs(_1684);
    float _2266 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2258);
    int _2268 = abs(_1782);
    float _2270 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2262);
    float _2272 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2266);
    int _2274 = abs(_1702);
    float _2276 = -_2270;
    float _2278 = _2276 + 1.0;
    int _2280 = ~_2264;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = -_2272;
    float _2288 = _2286 + 1.0;
    int _2290 = ~_2274;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2268;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    int _2302 = _2284 * as_type<int>(_2070);
    int _2304 = ~_2260;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = abs(_2094);
    int _2312 = abs(_2100);
    int _2314 = _2308 * as_type<int>(_2062);
    int _2316 = _2314 + _2302;
    float _2318 = float(uint(_2232));
    int _2320 = _1005 * _2202;
    int _2322 = _2320 + _1452;
    int _2324 = ~_2310;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2332 = _2294 * as_type<int>(_2170);
    int _2334 = _2332 + _2316;
    int _2336 = abs(_2106);
    int _2338 = abs(_1740);
    int _2340 = ~_2336;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    float _2346 = 1.0 / _2318;
    int _2348 = abs(_1804);
    int _2350 = _2344 * as_type<int>(_2178);
    int _2352 = _2350 + _2334;
    int _2354 = ~_2338;
    int _2356 = _2354 + 1;
    int _2358 = _2356 + 1;
    int _2360 = _2300 * as_type<int>(_2218);
    int _2362 = ~_2348;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = _2042 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2370 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2372 = int(_2370);
    int _2374 = _2352 * _2358;
    int _2376 = _2328 * as_type<int>(_2210);
    int _2378 = _2376 + _2360;
    int _2380 = abs(_2232);
    int _2382 = _1906 * _2338;
    int _2384 = _2382 + _2374;
    int _2386 = abs(_1752);
    int _2388 = _2366 * as_type<int>(_2244);
    int _2390 = _2388 + _2378;
    int _2392 = ~_2312;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = _2184 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2402 = _2368 + _2400;
    int _2404 = as_type<int>(_2346) + (-2);
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2408 = _2096 + _2406;
    float _2410 = float(uint(_2384));
    int _2412 = _2396 * as_type<int>(_2252);
    int _2414 = _2412 + _2390;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2398 + _2416;
    float _2420 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2422 = float(uint(_2372));
    float _2424 = as_type<float>(_2404) * _2410;
    int _2426 = abs(_2372);
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2420);
    float _2430 = float(uint(_2380));
    float _2432 = _2402 * _2402;
    float _2434 = float(uint(_2426));
    float _2436 = trunc(_2424);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2428);
    int _2444 = ~_2386;
    int _2446 = _2444 + 1;
    int _2448 = _2446 + 1;
    float _2450 = fma(_2418, _2418, _2432);
    bool _2452 = !_1374;
    int _2454 = _2452 ? _2322 : (-1);
    float _2456 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2458 = _2442 >= 0.0;
    float _2460 = fma(_2408, _2408, _2450);
    float _2462 = 1.0 / _2422;
    int _2464 = _2414 * _2448;
    float _2466 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2468 = ~_2232;
    int _2470 = _2468 + 1;
    float _2472 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2474 = _2454 * _2386;
    int _2476 = _2474 + _2464;
    int _2478 = abs(_2384);
    float _2480 = _405 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2482 = 1.0 / _2430;
    int _2484 = _2470 * int(_2440);
    int _2486 = _2484 + _2384;
    float _2488 = float(uint(_2476));
    float _2490 = _2480 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2492 = abs(_2476);
    float _2494 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2496 = float(uint(_2478));
    float _2498 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2500 = 1.0 / _2434;
    int _2502 = as_type<int>(_2462) + (-2);
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = float(uint(_2486));
    float _2508 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2510 = float(uint(_2492));
    float _2512 = as_type<float>(_2502) * _2488;
    float _2514 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2516 = sqrt(_2460);
    int _2518 = as_type<int>(_2482) + (-2);
    float _2520 = as_type<float>(_2404) * _2506;
    out.m_64.x = _2494;
    out.m_64.y = _2498;
    out.m_64.z = _2504;
    out.m_64.w = _2514;
    int _2522 = ~_2426;
    int _2524 = _2522 + 1;
    float _2526 = as_type<float>(_2518) * _2496;
    int _2528 = ~_2372;
    int _2530 = _2528 + 1;
    float _2532 = rsqrt(_2460);
    int _2534 = as_type<int>(_2500) + (-2);
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2538 = !_2114;
    int _2540 = _2538 ? 0 : 1;
    if (_2458)
    {
        out.m_47.x = 0.0;
    }
    float _2542 = float(_1936);
    float _2544 = as_type<float>(_2534) * _2510;
    float _2546 = -_2536;
    float _2548 = fma(_1884, 2.0, _2546);
    float _2550 = _2516 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2552 = trunc(_2512);
    float _2554 = precise::max(_2552, 0.0);
    uint _2556 = uint(_2554);
    float _2558 = _1186 + 0.5;
    float _2560 = -_131;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2548);
    float _2564 = precise::min(_2490, _2550);
    int _2566 = abs(_2540);
    float _2568 = _2402 * _2532;
    float _2570 = trunc(_2526);
    float _2572 = precise::max(_2570, 0.0);
    uint _2574 = uint(_2572);
    float _2576 = _2418 * _2532;
    float _2578 = fma(_2508, _2558, _2562);
    float _2580 = _2568 * _2564;
    int _2582 = ~_2232;
    int _2584 = _2582 + 1;
    float _2586 = _2576 * _2564;
    float _2588 = float(_2566);
    float _2590 = -_2580;
    float _2592 = _2402 + _2590;
    float _2594 = trunc(_2544);
    float _2596 = precise::max(_2594, 0.0);
    uint _2598 = uint(_2596);
    int _2600 = ~_2380;
    int _2602 = _2600 + 1;
    int _2604 = _2530 * int(_2556);
    int _2606 = _2604 + _2476;
    float _2608 = -_2586;
    float _2610 = _2418 + _2608;
    float _2612 = _2592 * _2592;
    float _2614 = _2588 * _2542;
    bool _2616 = _1025 > 0.5;
    out.m_66.w = _2564;
    float _2618 = trunc(_2520);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    int _2624 = _2602 * int(_2574);
    int _2626 = _2624 + _2478;
    float _2628 = float(uint(_2606));
    float _2630 = float(uint(_2626));
    float _2632 = as_type<float>(_2502) * _2628;
    int _2634 = _2524 * int(_2598);
    int _2636 = _2634 + _2492;
    float _2638 = fma(_2610, _2610, _2612);
    float _2640 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2642 = as_type<float>(_2518) * _2630;
    float _2644 = trunc(_2632);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = float(uint(_2636));
    int _2652 = int(_2440) + int(_2622);
    float _2654 = _2408 * _2532;
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2658 = as_type<float>(_2534) * _2650;
    float _2660 = _2654 * _2564;
    float _2662 = trunc(_2642);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = fma(_1896, -2.0, _2656);
    int _2670 = ~_2372;
    int _2672 = _2670 + 1;
    float _2674 = -_2660;
    float _2676 = _2408 + _2674;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2680 = ~_2380;
    int _2682 = _2680 + 1;
    float _2684 = fma(_2676, _2676, _2638);
    float _2686 = trunc(_2658);
    float _2688 = precise::max(_2686, 0.0);
    uint _2690 = uint(_2688);
    int _2692 = _2584 * _2652;
    int _2694 = _2692 + _2384;
    int _2696 = int(_2556) + int(_2648);
    float _2698 = fma(_1878, -2.0, _2678);
    int _2700 = ~_2426;
    int _2702 = _2700 + 1;
    bool _2704 = uint(_2694) >= uint(_2232);
    int _2706 = _2672 * _2696;
    int _2708 = _2706 + _2476;
    float _2710 = sqrt(_2684);
    int _2712 = int(_2574) + int(_2666);
    float _2714 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2698);
    bool _2716 = !_2110;
    int _2718 = _2716 ? 0 : 1;
    int _2720 = _2682 * _2712;
    int _2722 = _2720 + _2478;
    int _2724 = int(_2598) + int(_2690);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2728 = _2702 * _2724;
    int _2730 = _2728 + _2492;
    float _2732 = -_2726;
    float _2734 = fma(_2640, 2.0, _2732);
    float _2736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2738 = _2532 * _2710;
    bool _2740 = !_2704;
    int _2742 = _2740 ? 0 : (-1);
    bool _2744 = uint(_2708) >= uint(_2372);
    float _2746 = _2480 * _2738;
    int _2748 = ~_2652;
    int _2750 = _2748 + _2742;
    int _2752 = _2750 + 1;
    bool _2754 = !_2744;
    int _2756 = _2754 ? 0 : (-1);
    float _2758 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2760 = uint(_2722) >= uint(_2380);
    int _2762 = _2232 * _2752;
    int _2764 = _2762 + _2384;
    int _2766 = ~_2696;
    int _2768 = _2766 + _2756;
    int _2770 = _2768 + 1;
    float _2772 = _2576 * _2758;
    float _2774 = _2568 * _2758;
    bool _2776 = !_2760;
    int _2778 = _2776 ? 0 : (-1);
    float _2780 = _2654 * _2758;
    bool _2782 = uint(_2730) >= uint(_2426);
    float _2784 = -_2774;
    float _2786 = _2402 + _2784;
    float _2788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2790 = -_2772;
    float _2792 = _2418 + _2790;
    bool _2794 = !_2782;
    int _2796 = _2794 ? 0 : (-1);
    float _2798 = _2786 * _2786;
    bool _2800 = _2232 == 0;
    int _2802 = _2372 * _2770;
    int _2804 = _2802 + _2476;
    int _2806 = _2384 ^ _2232;
    float _2808 = fma(_2792, _2792, _2798);
    bool _2810 = !_2800;
    int _2812 = _2810 ? _2764 : (-1);
    float _2814 = -_2780;
    float _2816 = _2408 + _2814;
    bool _2818 = _2372 == 0;
    float _2820 = _2736 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2822 = uint(int(uint(_2806) >> uint(31)));
    bool _2824 = !_2818;
    int _2826 = _2824 ? _2804 : (-1);
    float _2828 = fma(_2816, _2816, _2808);
    int _2830 = abs(_2718);
    float _2832 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2834 = ~_2778;
    int _2836 = _2712 + _2834;
    int _2838 = _2836 + 1;
    int _2840 = ~int(_2822);
    int _2842 = _2840 + 1;
    float _2844 = _1182 + (-0.5);
    float _2846 = float(_2228);
    float _2848 = sqrt(_2828);
    float _2850 = float(_2830);
    int _2852 = _2838 ^ _2842;
    float _2854 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2668);
    bool _2856 = _2232 == 0;
    float _2858 = _2850 * _2846;
    int _2860 = ~_2842;
    int _2862 = _2860 + _2852;
    int _2864 = _2862 + 1;
    float _2866 = -_2832;
    float _2868 = -_2854;
    float _2870 = fma(_2866, _2844, _2868);
    float _2872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2874 = as_type<float>(_2712);
    int _2876 = as_type<int>(_2788);
    if (_2458)
    {
        _2874 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2878 = _2874;
    bool _2880 = !_2856;
    int _2882 = _2880 ? _2864 : (-1);
    bool _2884 = _2372 == 0;
    if (_2458)
    {
        float _2886 = _2878 * 5.0;
        _2876 = as_type<int>(_2886);
    }
    int _2888 = _2876;
    int _2890 = _2476 ^ _2372;
    float _2892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2894 = ~_2796;
    int _2896 = _2724 + _2894;
    int _2898 = _2896 + 1;
    float _2900 = _2532 * _2848;
    uint _2902 = uint(int(uint(_2890) >> uint(31)));
    if (_2458)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8416 = as_type<float>(_2888);
        out.gl_Position.z = _8416;
    }
    float _2904 = float(_2812);
    float _2906 = _2746 * _2900;
    int _2908 = ~int(_2902);
    int _2910 = _2908 + 1;
    float _2912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2914 = float(_2826);
    float _2916 = _2872 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2918 = _2898 ^ _2910;
    float _2920 = fma(_2820, _2904, _2090);
    float _2922 = float(_2882);
    out.m_68.x = _2906;
    int _2924 = ~_2910;
    int _2926 = _2924 + _2918;
    int _2928 = _2926 + 1;
    float _2930 = -_131;
    float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2734);
    float _2934 = _1826 + 0.5;
    float _2936 = -_201;
    int _2938 = _2616 ? as_type<int>(_2936) : as_type<int>(_201);
    float _2940 = _2892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2942 = fma(_2916, _2914, _2932);
    float _2944 = fma(_2820, _2934, _2920);
    bool _2946 = !_1912;
    float _2948 = _2946 ? _191 : as_type<float>(_1642);
    float _2950 = -_2102;
    float _2952 = fma(_2940, _2922, _2950);
    bool _2954 = !_1920;
    float _2956 = _2954 ? _201 : as_type<float>(_2938);
    float _2958 = _2912 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2960 = !_2884;
    int _2962 = _2960 ? _2928 : (-1);
    float _2964 = _2948 + 0.5;
    float _2966 = _2956 + (-0.5);
    float _2968 = float(_2962);
    float _2970 = fma(_2916, _2964, _2942);
    float _2972 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2974 = log2(_2972);
    float _2976 = -_2940;
    float _2978 = fma(_2976, _2966, _2952);
    float _2980 = _1258 + (-0.5);
    float _2982 = -_2714;
    float _2984 = fma(_2958, _2968, _2982);
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2988 = -_2958;
    float _2990 = fma(_2988, _2980, _2984);
    float _2992 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2986);
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2996 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2998 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3000 = isnan(0.0);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3006 = _3002 || _3004;
    float _3008 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2992);
    float _3010 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2994);
    float _3012 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2996);
    float _3014 = _2974 * _131;
    float _3016 = -_3008;
    float _3018 = _3016 + 1.0;
    float _3020 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3010);
    float _3022 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3012);
    float _3024 = -_3018;
    float _3026 = fma(_1186, _3024, _2578);
    float _3028 = -_3020;
    float _3030 = _3028 + 1.0;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3034 = exp2(_3014);
    float _3036 = -_3022;
    float _3038 = _3036 + 1.0;
    float _3040 = -_3030;
    float _3042 = fma(_1826, _3040, _2944);
    float _3044 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3032);
    float _3046 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3048 = 1.0 + _3046;
    float _3050 = fma(_1182, _3038, _2870);
    bool _3052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3054 = isnan(1.0);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3060 = _3056 || _3058;
    float _3062 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3044);
    float _3064 = 1.0 / _3048;
    float _3066 = in.m_70.x;
    float _3068 = in.m_70.y;
    float _3070 = in.m_70.z;
    float _3072 = -_2278;
    float _3074 = fma(_2948, _3072, _2970);
    float _3076 = -_3062;
    float _3078 = _3076 + 1.0;
    float _3080 = fma(_1258, _2288, _2990);
    out.m_72.x = _3026;
    out.m_72.y = _3050;
    float _3082 = fma(_2956, _3078, _2978);
    float _3084 = -_3034;
    float _3086 = _3084 + 1.0;
    bool _3088 = !_2118;
    int _3090 = _3088 ? 0 : 1;
    out.m_74.x = _3042;
    out.m_74.y = _3082;
    out.m_74.z = _3074;
    out.m_74.w = _3080;
    float _3092 = _3006 ? _3086 : 0.0;
    if (_3060)
    {
        float _3094 = _3092 * _3064;
        _151 = _3094;
    }
    float _3096 = _151;
    if (_2458)
    {
        return out;
    }
    float _3098 = _2858 * (-2.0);
    float _3100 = -_2774;
    float _3102 = _2368 + _3100;
    float _3104 = _1023 + (-0.5);
    float _3106 = -_2772;
    float _3108 = _2398 + _3106;
    float _3110 = fma(_3098, _3066, _3066);
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3114 = _3102 + _3112;
    float _3116 = fma(_1994, _3098, _1994);
    float _3118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3120 = _3108 + _3118;
    float _3122 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3110);
    float _3124 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3126 = -_2780;
    float _3128 = _2096 + _3126;
    int _3130 = abs(_3090);
    float _3132 = _2614 * (-2.0);
    float _3134 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3124);
    float _3136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3138 = _3128 + _3136;
    float _3140 = _1025 + (-0.5);
    float _3142 = fma(_3132, _3068, _3068);
    float _3144 = fma(_2134, _3132, _2134);
    float _3146 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3134);
    float _3148 = fma(_3140, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3142);
    float _3150 = float(_2050);
    float _3152 = fma(_3116, _3096, _3122);
    float _3154 = float(_3130);
    float _3156 = _1027 + _1023;
    bool _3158 = _3146 >= 0.0;
    float _3160 = fma(_3144, _3096, _3148);
    float _3162 = _3154 * _3150;
    float _3164 = _3152 * 0.15915493667125701904296875;
    float _3166 = _3156 + (-1.0);
    float _3168 = _3160 * 0.15915493667125701904296875;
    float _3170 = _3162 * (-2.0);
    float _3172 = _3164 * 6.283185482025146484375;
    float _3174 = sin(_3172);
    float _3176 = fma(_3166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3178 = _1027 + (-0.5);
    float _3180 = fma(_3170, _3070, _3070);
    float _3182 = _3124;
    int _3184 = as_type<int>(_3178);
    if (_3158)
    {
        _3182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3186 = _3182;
    float _3188 = fma(_3176, _3170, _3176);
    float _3190 = fma(_3178, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3180);
    float _3192 = _3164 * 6.283185482025146484375;
    float _3194 = cos(_3192);
    if (_3158)
    {
        float _3196 = _3186 * 5.0;
        _3184 = as_type<int>(_3196);
    }
    int _3198 = _3184;
    float _3200 = fma(_3188, _3096, _3190);
    if (_3158)
    {
        out.m_47.x = 0.0;
    }
    float _3202 = _3200 * 0.15915493667125701904296875;
    float _3204 = _3168 * 6.283185482025146484375;
    float _3206 = sin(_3204);
    if (_3158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8914 = as_type<float>(_3198);
        out.gl_Position.z = _8914;
    }
    float _3208 = _3168 * 6.283185482025146484375;
    float _3210 = cos(_3208);
    if (_3158)
    {
        return out;
    }
    float _3212 = _3202 * 6.283185482025146484375;
    float _3214 = cos(_3212);
    float _3216 = _407 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3218 = _2738 * _2900;
    float _3220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _3222 = _3194 * _3210;
    float _3224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _3226 = _3216 * _3218;
    float _3228 = _3174 * _3210;
    float _3230 = _3202 * 6.283185482025146484375;
    float _3232 = sin(_3230);
    float _3234 = _3194 * _3206;
    float _3236 = _3226 * _3220;
    float _3238 = _3174 * _3206;
    float _3240 = _2906 * _3224;
    float _3242 = _3218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3244 = _3242 * 0.5;
    float _3246 = _3194 * _3214;
    float _3248 = _3210 * _3214;
    float _3250 = _3174 * _3214;
    float _3252 = _3206 * _3214;
    float _3254 = _3246 * _3236;
    float _3256 = fma(_3232, _3222, _3238);
    float _3258 = -_3228;
    float _3260 = fma(_3232, _3234, _3258);
    float _3262 = -_3236;
    float _3264 = _3232 * _3262;
    float _3266 = -_3234;
    float _3268 = fma(_3232, _3228, _3266);
    float _3270 = fma(_3256, _3240, _3254);
    float _3272 = _3250 * _3236;
    float _3274 = fma(_3248, _3240, _3264);
    float _3276 = fma(_3232, _3238, _3222);
    float _3278 = fma(_3260, _3244, _3270);
    float _3280 = fma(_3268, _3240, _3272);
    float _3282 = fma(_3252, _3244, _3274);
    float _3284 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3286 = fma(_3276, _3244, _3280);
    float _3288 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3290 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3284);
    float _3292 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3288);
    float _3294 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3290);
    float _3296 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3292);
    float _3298 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3300 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3302 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3304 = _2096 + _3298;
    float _3306 = _2398 + _3300;
    float _3308 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3302);
    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3312 = _3304 + _3310;
    float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3316 = _3306 + _3314;
    float _3318 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3308);
    float _3320 = _3312 * _3312;
    float _3322 = fma(_3316, _3316, _3320);
    float _3324 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3326 = sqrt(_3322);
    float _3328 = _2368 + _3324;
    bool _3330 = _3326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3332 = _3282;
    float _3334 = _3304;
    float _3336 = _3306;
    if (!_3330)
    {
        _3332 = _3304;
    }
    float _3338 = _3332;
    float _3340 = _3338;
    if (!_3330)
    {
        _3334 = _3328;
    }
    float _3342 = _3334;
    bool _3344 = !_3330;
    float _3346 = _3342;
    if (!_3344)
    {
        float _3348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3352 = _3326 + _3350;
        float _3354 = rsqrt(_3322);
        float _3356 = _3352 * _3348;
        float _3358 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3360 = _3356 * 0.15915493667125701904296875;
        float _3362 = _3360 * 6.283185482025146484375;
        float _3364 = sin(_3362);
        float _3366 = _3360 * 6.283185482025146484375;
        float _3368 = cos(_3366);
        float _3370 = fma(_3364, _3358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3372 = _3354 * _3370;
        float _3374 = _3368 + (-1.0);
        float _3376 = fma(_3316, _3372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3378 = fma(_3312, _3372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3380 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3382 = fma(_3328, _3368, _3380);
        _3346 = _3382;
        _3336 = _3376;
        _3340 = _3378;
    }
    float _3384 = _3346;
    float _3386 = _3336;
    float _3388 = _3340;
    float _3390 = -_2368;
    float _3392 = _3390 + _3384;
    float _3394 = -_2398;
    float _3396 = _3394 + _3386;
    float _3398 = -_2096;
    float _3400 = _3398 + _3388;
    float _3402 = -_2580;
    float _3404 = _2368 + _3402;
    float _3406 = _3392 * _3392;
    float _3408 = -_2586;
    float _3410 = _2398 + _3408;
    float _3412 = -_2660;
    float _3414 = _2096 + _3412;
    float _3416 = -_2774;
    float _3418 = _3416 + _3404;
    float _3420 = fma(_3396, _3396, _3406);
    float _3422 = -_2580;
    float _3424 = _3422 + _3384;
    float _3426 = -_2780;
    float _3428 = _3426 + _3414;
    float _3430 = _3418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3432 = fma(_3400, _3400, _3420);
    float _3434 = -_2772;
    float _3436 = _3434 + _3410;
    float _3438 = -_2660;
    float _3440 = _3438 + _3388;
    float _3442 = sqrt(_3432);
    float _3444 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3430);
    float _3446 = _3418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3448 = -_2586;
    float _3450 = _3448 + _3386;
    bool _3452 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3454 = isnan(0.5);
    bool _3456 = _3452 || _3454;
    bool _3458 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3460 = _3456 || _3458;
    float _3462 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3444);
    float _3464 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3446);
    bool _3466 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3468 = isnan(0.5);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3474 = _3470 || _3472;
    float _3476 = _3462 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3478 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3464);
    float _3480 = 1.0 / _3476;
    float _3482 = _3478 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3484 = _3442 > 0.0;
    float _3486 = _3482 + _3476;
    float _3488 = _3482;
    float _3490 = _3442;
    float _3492 = _3450;
    if (!_3484)
    {
        _3488 = _3424;
    }
    float _3494 = _3488;
    float _3496 = _3494;
    float _3498 = _3494;
    if (!_3484)
    {
        _3490 = _3440;
    }
    float _3500 = _3490;
    bool _3502 = !_3484;
    float _3504 = _3500;
    float _3506 = _3500;
    if (!_3502)
    {
        float _3508 = _205 * _205;
        float _3510 = rsqrt(_3432);
        float _3512 = fma(_203, _203, _3508);
        float _3514 = fma(_207, _207, _3512);
        float _3516 = sqrt(_3514);
        float _3518 = _3396 * _3510;
        float _3520 = _3392 * _3510;
        float _3522 = _3400 * _3510;
        bool _3524 = _3516 > 0.0;
        if (!_3524)
        {
            _3496 = _3424;
        }
        float _3526 = _3496;
        _3498 = _3526;
        if (!_3524)
        {
            _3504 = _3440;
        }
        float _3528 = _3504;
        bool _3530 = !_3524;
        _3506 = _3528;
        if (!_3530)
        {
            float _3532 = rsqrt(_3514);
            float _3534 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3536 = _205 * _3532;
            float _3538 = _203 * _3532;
            float _3540 = _3520 * _3536;
            float _3542 = _207 * _3532;
            float _3544 = fma(_3518, _3538, _3540);
            float _3546 = _3534 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3548 = fma(_3522, _3542, _3544);
            float _3550 = _3548 * _3546;
            float _3552 = fma(_203, _3550, _3450);
            float _3554 = fma(_205, _3550, _3424);
            float _3556 = fma(_207, _3550, _3440);
            _3492 = _3552;
            _3498 = _3554;
            _3506 = _3556;
        }
    }
    float _3558 = _3492;
    float _3560 = _3498;
    float _3562 = _3506;
    float _3564 = -_2772;
    float _3566 = _3564 + _3558;
    float _3568 = -_2774;
    float _3570 = _3568 + _3560;
    float _3572 = -_2780;
    float _3574 = _3572 + _3562;
    float _3576 = _3486 * _3480;
    float _3578 = _3576 * 0.5;
    float _3580 = _3570;
    float _3582 = _3566;
    float _3584 = _3574;
    if (_3474)
    {
        _211 = 1.0;
    }
    float _3586 = _211;
    float _3588 = _3586;
    if (!_3460)
    {
        float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3592 = _3418 + _3590;
        float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3596 = _3436 + _3594;
        float _3598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3600 = -_3414;
        float _3602 = _3600 + _3562;
        float _3604 = _3592 * _3592;
        float _3606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3608 = _3428 + _3606;
        float _3610 = -_3410;
        float _3612 = _3610 + _3558;
        float _3614 = fma(_3596, _3596, _3604);
        float _3616 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3618 = fma(_3608, _3608, _3614);
        float _3620 = sqrt(_3618);
        float _3622 = 1.0 / _2900;
        float _3624 = _3616 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3626 = precise::min(_3620, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3628 = _3626 * _3598;
        float _3630 = -_3404;
        float _3632 = _3630 + _3560;
        float _3634 = _3628 * _3622;
        float _3636 = _3624 * _3634;
        float _3638 = _3602 * _3634;
        float _3640 = fma(_3632, _3636, _3418);
        float _3642 = fma(_3612, _3636, _3436);
        float _3644 = fma(_3624, _3638, _3428);
        _3580 = _3640;
        _3582 = _3642;
        _3584 = _3644;
    }
    float _3646 = _3580;
    float _3648 = _3582;
    float _3650 = _3584;
    if (!_3474)
    {
        float _3652 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3654 = _3652 * 0.15915493667125701904296875;
        float _3656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3660 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3658);
        float _3662 = _3654 * 6.283185482025146484375;
        float _3664 = cos(_3662);
        float _3666 = _3656 * 0.15915493667125701904296875;
        float _3668 = _3654 * 6.283185482025146484375;
        float _3670 = sin(_3668);
        float _3672 = 1.0 / _3664;
        float _3674 = _3666 * 6.283185482025146484375;
        float _3676 = cos(_3674);
        float _3678 = _3670 * _3672;
        float _3680 = _3666 * 6.283185482025146484375;
        float _3682 = sin(_3680);
        float _3684 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3686 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3684;
        float _3688 = _3676 * _3678;
        float _3690 = 1.0 / _3660;
        float _3692 = 1.0 / _3688;
        float _3694 = 1.0 / _3686;
        float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3698 = _3690 * _3696;
        float _3700 = _3682 * _3692;
        float _3702 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3704 = fma(_3700, _3698, _3702);
        float _3706 = _3704 * _3694;
        float _3708 = precise::clamp(_3706, 0.0, 1.0);
        _213 = _3678;
        _3588 = _3708;
    }
    float _3710 = _213;
    float _3712 = _3588;
    float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3716 = _3646 + _3714;
    float _3718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3720 = _3648 + _3718;
    float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3724 = _3650 + _3722;
    float _3726 = _3716 * _3716;
    float _3728 = fma(_3720, _3720, _3726);
    float _3730 = fma(_3724, _3724, _3728);
    float _3732 = rsqrt(_3730);
    float _3734 = sqrt(_3730);
    float _3736 = _3732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3738 = _3720 * _3736;
    float _3740 = _3724 * _3736;
    float _3742 = _3738 * _3738;
    float _3744 = _3740 * _3740;
    float _3746 = _3742 + _3744;
    float _3748 = sqrt(_3746);
    bool _3750 = _3748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3754 = _3748 + _3752;
    float _3756 = _3724;
    float _3758 = _3746;
    float _3760 = _3754;
    float _3762 = _3726;
    float _3764 = _3736;
    if (_3750)
    {
        float _3766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3756 = _3766;
    }
    float _3768 = _3756;
    if (_3750)
    {
        float _3770 = rsqrt(_3746);
        _3758 = _3770;
    }
    float _3772 = _3758;
    float _3774 = _3772;
    if (_3750)
    {
        float _3776 = _3754 * _3768;
        _3760 = _3776;
    }
    float _3778 = _3760;
    if (_3750)
    {
        float _3780 = _3778 * 0.15915493667125701904296875;
        _3762 = _3780;
    }
    float _3782 = _3762;
    float _3784 = _3768;
    float _3786 = _3782;
    if (_3750)
    {
        float _3788 = _3782 * 6.283185482025146484375;
        float _3790 = sin(_3788);
        _3784 = _3790;
    }
    float _3792 = _3784;
    float _3794 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3796 = precise::max(0.0, _3794);
    float _3798 = _3710;
    float _3800 = _3796;
    if (_3750)
    {
        float _3802 = _3782 * 6.283185482025146484375;
        float _3804 = cos(_3802);
        _3798 = _3804;
    }
    float _3806 = _3798;
    float _3808 = -_3736;
    float _3810 = -_3796;
    float _3812 = fma(_3716, _3808, _3810);
    float _3814 = _3812;
    if (_3750)
    {
        float _3816 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3800 = _3816;
    }
    float _3818 = _3800;
    float _3820 = _3792;
    float _3822 = _3818;
    if (_3750)
    {
        float _3824 = fma(_3792, _3818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3820 = _3824;
    }
    float _3826 = _3820;
    float _3828 = _3826;
    float _3830 = _3806;
    if (_3750)
    {
        float _3832 = _3806 + (-1.0);
        _3822 = _3832;
    }
    float _3834 = _3822;
    float _3836 = _3834;
    if (_3750)
    {
        float _3838 = _3772 * _3826;
        _3764 = _3838;
    }
    float _3840 = _3764;
    if (!_3750)
    {
        _3828 = _3738;
    }
    float _3842 = _3828;
    float _3844 = _3842;
    if (_3750)
    {
        float _3846 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3786 = _3846;
    }
    float _3848 = _3786;
    if (_3750)
    {
        float _3850 = _3738 * _3840;
        _3844 = _3850;
    }
    float _3852 = _3844;
    if (!_3750)
    {
        _3836 = _3740;
    }
    float _3854 = _3836;
    float _3856 = _3854;
    if (_3750)
    {
        float _3858 = _3740 * _3840;
        _3856 = _3858;
    }
    float _3860 = _3856;
    if (!_3750)
    {
        _3774 = _3742;
    }
    float _3862 = _3774;
    float _3864 = _3862;
    if (_3750)
    {
        float _3866 = fma(_3812, _3806, _3848);
        _3814 = _3866;
    }
    float _3868 = _3814;
    if (_3750)
    {
        float _3870 = _3852 * _3852;
        _3864 = _3870;
    }
    float _3872 = _3864;
    if (!_3750)
    {
        _3830 = _3744;
    }
    float _3874 = _3830;
    float _3876 = _3874;
    if (_3750)
    {
        float _3878 = _3860 * _3860;
        _3876 = _3878;
    }
    float _3880 = _3876;
    float _3882 = fma(_3868, _3868, _3872);
    float _3884 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3886 = _3882 + _3880;
    float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3890 = fma(_3734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3888);
    float _3892 = precise::clamp(_3890, 0.0, 1.0);
    float _3894 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3884);
    float _3896 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3898 = rsqrt(_3886);
    float _3900 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3902 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3894);
    float _3904 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3906 = -_3892;
    float _3908 = _3906 + 1.0;
    float _3910 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3900);
    float _3912 = _3902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3914 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3904);
    float _3916 = abs(_3908);
    float _3918 = log2(_3916);
    float _3920 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3910);
    float _3922 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3924 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3914);
    float _3926 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3928 = _3920 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3930 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3922);
    float _3932 = _3924 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3934 = _3898 * _3852;
    float _3936 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3938 = _3898 * _3868;
    float _3940 = -_3926;
    float _3942 = fma(_3940, _3896, 1.0);
    float _3944 = _3934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3946 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3930);
    float _3948 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3936);
    float _3950 = _3898 * _3860;
    float _3952 = -_3944;
    float _3954 = fma(_3938, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3952);
    float _3956 = _3946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3958 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3948);
    float _3960 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3962 = -_3950;
    float _3964 = fma(_3962, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3954);
    float _3966 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3968 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3958);
    float _3970 = exp2(_3960);
    float _3972 = fma(_3964, -0.5, 0.5);
    float _3974 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3976 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3966);
    float _3978 = fma(_3964, 0.5, 0.5);
    float _3980 = _3938 + 1.0;
    float _3982 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3974);
    float _3984 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3976);
    float _3986 = log2(_3942);
    float _3988 = fma(_3978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3990 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3982);
    float _3992 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3984);
    float _3994 = fma(_3978, _3988, -0.212114393711090087890625);
    float _3996 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3990);
    float _3998 = 1.0 / _3968;
    float _4000 = -_3938;
    float _4002 = fma(_3970, _3980, _4000);
    float _4004 = fma(_3978, _3994, 1.570728778839111328125);
    float _4006 = fma(_4002, 0.5, 0.5);
    float _4008 = sqrt(_3972);
    float _4010 = _3986 * 0.693147182464599609375;
    float _4012 = _4010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4014 = _3992 * _3998;
    float _4016 = _3996 * _3998;
    float _4018 = fma(_4014, 0.5, 0.5);
    float _4020 = fma(_4016, -0.5, 0.5);
    float _4022 = _4008 * 0.636619746685028076171875;
    float3 _10208 = float3(_4018, _4020, _4012);
    float _4024 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10208, float3(0.0), isnan(_10208)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10208, float3(0.0), isnan(_10208)), level(0.0)).x;
    float3 _10219 = float3(_4018, _4020, _4012);
    float4 _4027 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10219, float3(0.0), isnan(_10219)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10219, float3(0.0), isnan(_10219)), level(0.0)).xyzw;
    float _4029 = _4027.x;
    float _4031 = _4027.y;
    float _4033 = _4027.z;
    float _4035 = _4027.w;
    float _4037 = -_4004;
    float _4039 = fma(_4022, _4037, 1.0);
    float2 _10241 = float2(_4039, _4006);
    float3 _4043 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10241, float2(0.0), isnan(_10241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10241, float2(0.0), isnan(_10241)), level(0.0)).xyz;
    float _4045 = _4043.x;
    float _4047 = _4043.y;
    float _4049 = _4043.z;
    float _4051 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4053 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4055 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4057 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4059 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4061 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4063 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4065 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4051);
    float _4067 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4053);
    float _4069 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4055);
    float _4071 = -_3232;
    float _4073 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4057);
    float _4075 = -_3232;
    float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4059);
    float _4079 = -_3232;
    float _4081 = fma(_4079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4061);
    float _4083 = fma(_4063, _4063, 1.0);
    float _4085 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4087 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4089 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4091 = rsqrt(_4083);
    float _4093 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4085);
    float _4095 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4087);
    float _4097 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4089);
    float _4099 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4073);
    float _4101 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4103 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4077);
    float _4105 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4081);
    float _4107 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4065);
    float _4109 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4101);
    float _4111 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4067);
    float _4113 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4069);
    float _4115 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4117 = _4063 * _4099;
    float _4119 = _4063 * _4103;
    float _4121 = _4063 * _4105;
    float _4123 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4093);
    float _4125 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4095);
    float _4127 = _4063 * _4091;
    float _4129 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4097);
    float _4131 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4109);
    float _4133 = fma(_4115, _4107, _4117);
    float _4135 = -_4123;
    float _4137 = _4127 * _4135;
    float _4139 = -_4125;
    float _4141 = _4127 * _4139;
    float _4143 = fma(_4115, _4111, _4119);
    float _4145 = fma(_4115, _4113, _4121);
    float _4147 = -_4129;
    float _4149 = _4127 * _4147;
    float _4151 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4153 = fma(_4091, _4099, _4137);
    float _4155 = fma(_4091, _4103, _4141);
    float _4157 = fma(_4091, _4105, _4149);
    float _4159 = _4123 + _4133;
    float _4161 = exp2(_4151);
    float _4163 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4131);
    bool _4165 = _3712 > 0.0;
    bool _4167 = isnan(_3712);
    bool _4169 = _4165 || _4167;
    bool _4171 = isnan(0.0);
    bool _4173 = _4169 || _4171;
    out.m_76.x = _3436;
    out.m_76.y = _3418;
    out.m_76.z = _3428;
    float _4175 = _4125 + _4143;
    float _4177 = _3712 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4179 = _4163 + _3968;
    float _4181 = _3968 * 0.5;
    out.m_78.x = _3648;
    out.m_78.y = _3646;
    out.m_78.z = _3650;
    float _4183 = _3992 + _3968;
    float _4185 = _4129 + _4145;
    float _4187 = _4179 * 0.5;
    float _4189 = _4183 * 0.5;
    float _4191 = fma(_3996, -0.5, _4181);
    float _4193 = _4177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4195 = -_4161;
    float _4197 = _4195 + 1.0;
    out.m_80.x = _4107;
    out.m_80.y = _4111;
    out.m_80.z = _4113;
    float _4199 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _4153;
    out.m_82.y = _4155;
    out.m_82.z = _4157;
    float _4201 = -_4199;
    float _4203 = _4201 + 1.0;
    out.m_84.x = _4159;
    out.m_84.y = _4175;
    out.m_84.z = _4185;
    out.gl_Position.x = _3992;
    out.gl_Position.y = _3996;
    out.gl_Position.z = _4163;
    out.gl_Position.w = _3968;
    out.m_86.x = _4189;
    out.m_86.y = _4191;
    out.m_86.z = _4187;
    out.m_86.w = _3968;
    out.m_47.x = _4193;
    float _4205 = _4199 * _4024;
    float _4207 = _4035 * _4203;
    float _4209 = _4035 * _4205;
    float _4211 = _4049 * _4205;
    float _4213 = fma(_4045, _4209, _4029);
    float _4215 = fma(_4047, _4209, _4031);
    float _4217 = fma(_4035, _4211, _4033);
    out.m_88.x = _4213;
    out.m_88.y = _4215;
    out.m_88.z = _4217;
    out.m_88.w = _4207;
    if (_4173)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4219 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4219;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _781 = false;
    bool _645 = false;
    bool _429 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
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
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4276 = as_type<float>(_123);
        out.gl_Position.z = _4276;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    float _127 = float(_107);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    float _149 = 1.0 / _127;
    float _151 = _131;
    if (_147)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    float _155 = _131 * _149;
    int _157 = 0;
    float _159 = _155;
    if (_147)
    {
        float _161 = _153 * 5.0;
        _157 = as_type<int>(_161);
    }
    int _163 = _157;
    out.m_51.x = _155;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4348 = as_type<float>(_163);
        out.gl_Position.z = _4348;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _211 = _205;
    float _213 = _207;
    float _231;
    if (!_209)
    {
        float _215 = in.m_58.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _155;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = _235 + _241;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = 1.0 / _259;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = 1.0 / _267;
    float _275 = 1.0 / _263;
    float _277 = _239 * _269;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _235 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_235);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = _243 * _273;
    bool _301 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_235);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -_255;
    float _315 = _313 + 1.0;
    float _317 = _311 * _315;
    float _319 = -_311;
    float _321 = _319 + 1.0;
    float _323 = _281 * _275;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = fma(_285, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = fma(_327, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _337 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_235);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _297 * _321;
    float _355 = -_297;
    float _357 = _355 + 1.0;
    float _359 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = fma(_351, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = _347 * _357;
    float _365 = in.m_60.x;
    float _367 = in.m_60.y;
    float _369 = -_347;
    float _371 = _369 + 1.0;
    float _373 = _329 * _363;
    float _375 = _335 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _389 = fma(_379, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _391 = fma(_383, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_361, _353, _385);
    float _395 = fma(_359, _353, _387);
    float _397 = fma(_389, _317, _393);
    float _399 = fma(_391, _317, _395);
    float _401 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _397);
    float _403 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _399);
    float _405 = _401 * _365;
    float _407 = _403 * _367;
    bool _409 = !_271;
    float _427;
    if (!_409)
    {
        float _411 = in.m_58.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _155;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _431 + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _443 = _431 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = 1.0 / _447;
    bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _461 = 1.0 / _451;
    bool _463 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = isnan(_431);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = 1.0 / _455;
    float _477 = _435 * _457;
    bool _479 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _481 = isnan(_431);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    bool _491 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_431);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_489;
    float _505 = _503 + 1.0;
    float _507 = _439 * _461;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = _473 * _505;
    float _519 = -_473;
    float _521 = _519 + 1.0;
    float _523 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _525 = fma(_515, _507, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _531 = _443 * _475;
    bool _533 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _535 = isnan(_431);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = fma(_529, _531, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _555 = fma(_547, _507, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = _543 * _521;
    float _559 = -_543;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _567 = fma(_551, _531, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = _501 * _561;
    float _571 = -_501;
    float _573 = _571 + 1.0;
    float _575 = fma(_565, _531, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _577 = _525 * _569;
    float _579 = _523 * _569;
    float _581 = _555 * _569;
    float _583 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].y, _577);
    float _585 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[107].z, _581);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _597;
    float _601 = fma(_567, _557, _585);
    float _603 = fma(_591, _477, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _605 = fma(_595, _477, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _607 = fma(_599, _477, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _609 = fma(_575, _557, _583);
    float _611 = fma(_553, _557, _587);
    float _613 = fma(_603, _517, _601);
    float _615 = fma(_607, _517, _609);
    float _617 = fma(_605, _517, _611);
    float _619 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].x, _613);
    float _621 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].y, _615);
    float _623 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[110].z, _617);
    bool _625 = !_459;
    float _643;
    if (!_625)
    {
        float _627 = in.m_58.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        _643 = _155;
    }
    _645 = false;
    float _647 = _643;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _647 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _659 = isnan(_647);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_647);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _685;
    bool _689 = _647 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _691 = isnan(_647);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = 1.0 / _655;
    float _703 = -_667;
    float _705 = _703 + 1.0;
    bool _707 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _709 = 1.0 / _671;
    float _711 = _687 * _701;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _717 = fma(_711, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _719 = _683 * _705;
    float _721 = -_699;
    float _723 = _721 + 1.0;
    float _725 = -_683;
    float _727 = _725 + 1.0;
    float _729 = _715 * _709;
    float _731 = _717 * _719;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _735 = _647 + _733;
    float _737 = _667 * _723;
    float _739 = _619 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _731);
    float _743 = fma(_729, _735, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = _623 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _747 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _749 = fma(_743, _737, _741);
    float _751 = _621 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[117].x, _749);
    float _757 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _755 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _747;
    out.m_62.y = _757;
    out.m_62.z = _753;
    out.m_62.w = _759;
    bool _761 = !_707;
    float _779;
    if (!_761)
    {
        float _763 = in.m_58.x;
        float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _767 = _763 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _771 = _769 * _765;
        float _773 = floor(_771);
        float _775 = -_773;
        float _777 = _771 + _775;
        _779 = _777;
        _781 = true;
    }
    else
    {
        _779 = _155;
    }
    _781 = false;
    float _783 = _779;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = _783 + _785;
    bool _789 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _791 = isnan(_783);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _803 = _783 + _801;
    bool _805 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _807 = isnan(_783);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _825 = _783 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _827 = isnan(_783);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_799;
    float _839 = _837 + 1.0;
    float _841 = 1.0 / _819;
    float _843 = _835 * _839;
    float _845 = -_835;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _849;
    bool _853 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _855 = 1.0 / _823;
    float _857 = _815 * _847;
    float _859 = -_815;
    float _861 = _859 + 1.0;
    float _863 = _787 * _841;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _869;
    float _873 = fma(_851, _863, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _875 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _877 = fma(_871, _863, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _879 = _803 * _855;
    float _881 = _873 * _857;
    float _883 = _875 * _857;
    float _885 = _877 * _857;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _899 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].x, _881);
    float _901 = fma(_889, _879, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _903 = fma(_893, _879, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].y, _883);
    float _907 = fma(_897, _879, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _909 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[123].z, _885);
    float _911 = fma(_901, _843, _899);
    float _913 = fma(_903, _843, _905);
    float _915 = fma(_907, _843, _909);
    float _917 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].x, _911);
    float _919 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].y, _913);
    float _921 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[125].z, _915);
    bool _923 = !_853;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    if (!_923)
    {
        float _927 = in.m_58.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _159 = _941;
    }
    float _943 = _159;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _947 = int(_945);
    float _949 = _149 * _131;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _953 = _943 + _951;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _957 = _955 != 0;
    bool _959 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _961 = isnan(_943);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _973 = int(_971);
    float _975 = float(_947);
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _979 = int(_977);
    if (_957)
    {
        _925 = 1.0;
    }
    float _981 = _925;
    float _983 = _981;
    if (!_957)
    {
        _983 = 7.345489978790283203125;
    }
    float _985 = _983;
    float _987 = float(_973);
    float _989 = 1.0 / _975;
    float _991 = 1.0 / _987;
    float _993 = float(uint(_979));
    int _995 = ~_979;
    int _997 = _995 + 1;
    float _999 = float(_979);
    int _1001 = _979 + (-1);
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1005 = int(_1003);
    float _1007 = _989 * _131;
    float _1009 = _991 * _131;
    float _1011 = 1.0 / _993;
    float _1013 = float(uint(_1005));
    float _1015 = trunc(_1007);
    int _1017 = int(_1015);
    float _1019 = 1.0 / _1013;
    int _1021 = as_type<int>(_1011) + (-2);
    float _1023 = in.m_58.x;
    float _1025 = in.m_58.y;
    float _1027 = in.m_58.z;
    float _1029 = in.m_58.w;
    float _1031 = trunc(_1009);
    int _1033 = int(_1031);
    float _1035 = float(uint(_1017));
    float _1037 = float(_1017);
    int _1039 = as_type<int>(_1019) + (-2);
    float _1041 = as_type<float>(_1039) * _1035;
    int _1043 = ~_1005;
    int _1045 = _1043 + 1;
    float _1047 = float(uint(_1033));
    float _1049 = trunc(_1041);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    bool _1056 = _1025 > 0.5;
    float _1058 = as_type<float>(_1021) * _1047;
    float _1060 = _1047;
    if (_957)
    {
        float _1062 = in.m_58.x;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = _1064;
    if (!_957)
    {
        float _1074 = in.m_58.y;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = _985 * _1023;
    int _1080 = _1045 * int(_1054);
    int _1082 = _1080 + _1017;
    float _1084 = float(uint(_1082));
    int _1086 = _997 * int(_1070);
    int _1088 = _1086 + _1033;
    float _1090 = as_type<float>(_1082);
    if (_957)
    {
        _1090 = 1.0;
    }
    float _1092 = _1090;
    float _1094 = _1092;
    if (!_957)
    {
        _1094 = 1.2345600128173828125;
    }
    float _1096 = _1094;
    float _1098 = as_type<float>(_1039) * _1084;
    float _1100 = float(uint(_1088));
    float _1102 = floor(_1078);
    bool _1104 = _1029 > 0.5;
    float _1106 = as_type<float>(_1021) * _1100;
    float _1108 = _1096 * _1076;
    float _1110 = -_201;
    int _1112 = _1104 ? as_type<int>(_1110) : as_type<int>(_201);
    float _1114 = trunc(_1106);
    float _1116 = precise::max(_1114, 0.0);
    uint _1118 = uint(_1116);
    float _1120 = trunc(_1098);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = -_1102;
    float _1128 = _1078 + _1126;
    float _1130 = -_191;
    int _1132 = _1056 ? as_type<int>(_1130) : as_type<int>(_191);
    float _1134 = _1128 * _999;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1146 = _1144 != 0;
    bool _1148 = _1027 > 0.5;
    int _1150 = int(_1070) + int(_1118);
    float _1152 = trunc(_1134);
    int _1154 = int(_1152);
    float _1156 = -_201;
    int _1158 = _1148 ? as_type<int>(_1156) : as_type<int>(_201);
    float _1160 = float(_1033);
    int _1162 = int(_1054) + int(_1124);
    int _1164 = ~_979;
    int _1166 = _1164 + 1;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1170 = _1168 != 0;
    int _1172 = ~_1005;
    int _1174 = _1172 + 1;
    int _1176 = _1166 * _1150;
    int _1178 = _1176 + _1033;
    bool _1180 = !_1146;
    float _1182 = _1180 ? _201 : as_type<float>(_1158);
    bool _1184 = !_1142;
    float _1186 = _1184 ? _191 : as_type<float>(_1132);
    float _1188 = floor(_1108);
    bool _1190 = _1160 >= _999;
    bool _1192 = isnan(_1160);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(_999);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    int _1202 = _1174 * _1162;
    int _1204 = _1202 + _1017;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1216 = _1214 != 0;
    float _1218 = _999 * _949;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1222 = _1220 != 0;
    bool _1224 = !_1170;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = trunc(_1200);
    int _1230 = int(_1228);
    bool _1232 = uint(_1178) >= uint(_979);
    bool _1234 = !_1222;
    int _1236 = _1234 ? 0 : 1;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1240 = _1238 != 0;
    bool _1242 = uint(_1204) >= uint(_1005);
    float _1244 = -_1188;
    float _1246 = _1108 + _1244;
    bool _1248 = !_1232;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = trunc(_1218);
    int _1254 = int(_1252);
    bool _1256 = !_1138;
    float _1258 = _1256 ? _201 : as_type<float>(_1112);
    bool _1260 = !_1240;
    int _1262 = _1260 ? 0 : 1;
    bool _1264 = !_1242;
    int _1266 = _1264 ? 0 : (-1);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1282 = _1280 != 0;
    int _1284 = ~_1150;
    int _1286 = _1284 + _1250;
    int _1288 = _1286 + 1;
    bool _1290 = !_1212;
    int _1292 = _1290 ? 0 : 1;
    bool _1294 = !_1274;
    int _1296 = _1294 ? 0 : 1;
    int _1298 = _979 * _1288;
    int _1300 = _1298 + _1033;
    bool _1302 = _979 == 0;
    int _1304 = ~_1230;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    bool _1310 = !_1302;
    int _1312 = _1310 ? _1300 : (-1);
    float _1314 = float(_1005);
    bool _1316 = !_1208;
    int _1318 = _1316 ? 0 : 1;
    int _1320 = _1312 * _1308;
    int _1322 = abs(_1292);
    float _1324 = _1246 * _1314;
    int _1326 = abs(_1226);
    int _1328 = _1230 * _1001;
    int _1330 = _1328 + _1320;
    bool _1332 = _1037 >= _1314;
    bool _1334 = isnan(_1037);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(_1314);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    int _1344 = abs(_1318);
    float _1346 = trunc(_1342);
    int _1348 = int(_1346);
    int _1350 = ~_1162;
    int _1352 = _1350 + _1266;
    int _1354 = _1352 + 1;
    int _1356 = _1330 * _1322;
    bool _1358 = !_1216;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = _1154 * _1326;
    int _1364 = _1362 + _1033;
    bool _1366 = !_1270;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = _1005 * _1354;
    int _1372 = _1370 + _1017;
    bool _1374 = _1005 == 0;
    int _1376 = _1254 * _1344;
    int _1378 = _1376 + _1356;
    int _1380 = abs(_1360);
    float _1382 = _1314 * _949;
    int _1384 = abs(_1236);
    float _1386 = trunc(_1324);
    int _1388 = int(_1386);
    int _1390 = abs(_1262);
    int _1392 = _1364 * _1380;
    int _1394 = _1392 + _1378;
    bool _1396 = !_1374;
    int _1398 = _1396 ? _1372 : (-1);
    int _1400 = ~_1348;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = trunc(_1382);
    int _1408 = int(_1406);
    int _1410 = _1005 + (-1);
    int _1412 = _1154 * _1384;
    int _1414 = _1412 + _1394;
    int _1416 = abs(_1368);
    int _1418 = _1398 * _1404;
    int _1420 = abs(_1296);
    float _1422 = float(uint(_1414));
    int _1424 = _1348 * _1410;
    int _1426 = _1424 + _1418;
    bool _1428 = !_1278;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1282;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = as_type<float>(_1021) * _1422;
    int _1438 = abs(_1430);
    int _1440 = _1426 * _1420;
    float _1442 = trunc(_1436);
    float _1444 = precise::max(_1442, 0.0);
    uint _1446 = uint(_1444);
    int _1448 = abs(_1434);
    int _1450 = _1388 * _1390;
    int _1452 = _1450 + _1017;
    int _1454 = _1408 * _1416;
    int _1456 = _1454 + _1440;
    int _1458 = ~_979;
    int _1460 = _1458 + 1;
    int _1462 = _1452 * _1438;
    int _1464 = _1462 + _1456;
    float _1466 = float(uint(_1452));
    int _1468 = ~_1005;
    int _1470 = _1468 + 1;
    int _1472 = _1388 * _1448;
    int _1474 = _1472 + _1464;
    float _1476 = as_type<float>(_1039) * _1466;
    bool _1478 = _1027 > 0.5;
    float _1480 = float(uint(_1474));
    int _1482 = _1460 * int(_1446);
    int _1484 = _1482 + _1414;
    float _1486 = trunc(_1476);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = as_type<float>(_1039) * _1480;
    float _1494 = float(uint(_1484));
    float _1496 = as_type<float>(_1021) * _1494;
    float _1498 = trunc(_1492);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    float _1504 = float(uint(_1364));
    float _1506 = as_type<float>(_1021) * _1504;
    float _1508 = trunc(_1496);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    int _1514 = ~_979;
    int _1516 = _1514 + 1;
    float _1518 = trunc(_1506);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1470 * int(_1502);
    int _1526 = _1524 + _1474;
    float _1528 = float(uint(_1526));
    int _1530 = int(_1446) + int(_1512);
    int _1532 = ~_979;
    int _1534 = _1532 + 1;
    float _1536 = as_type<float>(_1039) * _1528;
    int _1538 = ~_1005;
    int _1540 = _1538 + 1;
    int _1542 = _1534 * _1530;
    int _1544 = _1542 + _1414;
    float _1546 = trunc(_1536);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = _1516 * int(_1522);
    int _1554 = _1552 + _1364;
    bool _1556 = uint(_1544) >= uint(_979);
    float _1558 = float(uint(_1554));
    int _1560 = _1540 * int(_1490);
    int _1562 = _1560 + _1452;
    bool _1564 = !_1556;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = as_type<float>(_1021) * _1558;
    int _1570 = ~_1530;
    int _1572 = _1570 + _1566;
    int _1574 = _1572 + 1;
    float _1576 = float(uint(_1562));
    float _1578 = trunc(_1568);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    int _1584 = ~_1005;
    int _1586 = _1584 + 1;
    int _1588 = _979 * _1574;
    int _1590 = _1588 + _1414;
    int _1592 = int(_1502) + int(_1550);
    float _1594 = as_type<float>(_1039) * _1576;
    bool _1596 = !_1302;
    int _1598 = _1596 ? _1590 : (-1);
    float _1600 = trunc(_1594);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = ~_979;
    int _1608 = _1606 + 1;
    int _1610 = _1586 * _1592;
    int _1612 = _1610 + _1474;
    int _1614 = _1598 & 3;
    bool _1616 = _1614 != 0;
    int _1618 = _1598 & 3;
    bool _1620 = _1618 != 0;
    bool _1622 = uint(_1614) >= 2u;
    int _1624 = _1620 ? 0 : 1;
    bool _1626 = uint(_1612) >= uint(_1005);
    int _1628 = _1622 ? 0 : 1;
    bool _1630 = uint(_1614) > 1u;
    bool _1632 = !_1626;
    int _1634 = _1632 ? 0 : (-1);
    bool _1636 = _1614 != 3;
    int _1638 = int(_1522) + int(_1582);
    float _1640 = -_191;
    int _1642 = _1478 ? as_type<int>(_1640) : as_type<int>(_191);
    int _1644 = ~_1592;
    int _1646 = _1644 + _1634;
    int _1648 = _1646 + 1;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1652 = _1650 != 0;
    int _1654 = _1608 * _1638;
    int _1656 = _1654 + _1364;
    int _1658 = int(_1490) + int(_1604);
    int _1660 = ~_1624;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1664;
    int _1668 = _1628;
    int _1670 = _1474;
    float _1672 = _1594;
    float _1674 = as_type<float>(_1608);
    float _1676 = _1324;
    float _1678 = as_type<float>(_1604);
    if (!_1630)
    {
        int _1680 = ~_1624;
        int _1682 = _1680 + 1;
        _1666 = _1682;
    }
    int _1684 = _1666;
    int _1686 = _1005 * _1648;
    int _1688 = _1686 + _1474;
    int _1690 = ~_1628;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1694;
    if (_1636)
    {
        int _1698 = ~_1628;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    bool _1704 = uint(_1656) >= uint(_979);
    bool _1706 = !_1374;
    int _1708 = _1706 ? _1688 : (-1);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1712 = _1710 != 0;
    if (_1652)
    {
        _1668 = 0;
    }
    int _1714 = _1668;
    int _1716 = _1714;
    if (_1652)
    {
        _1670 = 0;
    }
    int _1718 = _1670;
    bool _1720 = !_1704;
    int _1722 = _1720 ? 0 : (-1);
    int _1724 = _1718;
    if (!_1652)
    {
        _1716 = 1;
    }
    int _1726 = _1716;
    if (!_1652)
    {
        _1724 = 2;
    }
    int _1728 = _1724;
    int _1730 = _1708 & 3;
    bool _1732 = _1730 != 0;
    int _1734 = _1708 & 3;
    bool _1736 = _1734 != 0;
    bool _1738 = !_1712;
    int _1740 = _1738 ? 0 : 1;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1744 = _1742 != 0;
    int _1746 = _1732 ? 0 : 1;
    bool _1748 = uint(_1734) > 1u;
    bool _1750 = !_1744;
    int _1752 = _1750 ? 0 : 1;
    bool _1754 = uint(_1734) >= 2u;
    int _1756 = ~_1005;
    int _1758 = _1756 + 1;
    float _1760 = _1754 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1762 = _1734 != 3;
    int _1764 = _1758 * _1658;
    int _1766 = _1764 + _1452;
    int _1768 = ~_1746;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    int _1774 = _1772;
    float _1776 = _1760;
    if (!_1748)
    {
        int _1778 = ~_1746;
        int _1780 = _1778 + 1;
        _1774 = _1780;
    }
    int _1782 = _1774;
    bool _1784 = uint(_1766) >= uint(_1005);
    int _1786 = ~as_type<int>(_1760);
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = !_1784;
    int _1794 = _1792 ? 0 : (-1);
    bool _1796 = _1023 > 0.5;
    int _1798 = _1790;
    if (_1762)
    {
        int _1800 = ~as_type<int>(_1760);
        int _1802 = _1800 + 1;
        _1798 = _1802;
    }
    int _1804 = _1798;
    bool _1806 = _1726 != 1;
    float _1808 = -_191;
    int _1810 = _1796 ? as_type<int>(_1808) : as_type<int>(_191);
    int _1812 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1814 = _1812 != 0;
    float _1816 = _1023 * 2.0;
    int _1818 = ~_1638;
    int _1820 = _1818 + _1722;
    int _1822 = _1820 + 1;
    bool _1824 = !_1814;
    float _1826 = _1824 ? _191 : as_type<float>(_1810);
    bool _1828 = _1728 != 2;
    float _1830 = floor(_1816);
    int _1832 = _979 * _1822;
    int _1834 = _1832 + _1364;
    if (!_1806)
    {
        _1672 = _1025;
    }
    float _1836 = _1672;
    float _1838 = _1025 * 2.0;
    float _1840 = _1836;
    if (!_1806)
    {
        _1776 = _1027;
    }
    float _1842 = _1776;
    float _1844 = _1842;
    if (!_1806)
    {
        _1674 = _1836;
    }
    float _1846 = _1674;
    float _1848 = 0.0;
    float _1850 = _1846;
    if (!_1806)
    {
        _1848 = _1027;
    }
    float _1852 = _1848;
    float _1854 = floor(_1838);
    float _1856 = _1852;
    if (_1806)
    {
        _1850 = _1023;
    }
    float _1858 = _1850;
    if (_1828)
    {
        _1676 = _1023;
    }
    float _1860 = _1676;
    float _1862 = _1860;
    if (_1828)
    {
        _1678 = _1025;
    }
    float _1864 = _1678;
    float _1866 = _1864;
    if (_1806)
    {
        _1840 = _1023;
    }
    float _1868 = _1840;
    if (_1806)
    {
        _1844 = _1025;
    }
    float _1870 = _1844;
    float _1872 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1806)
    {
        _1856 = _1025;
    }
    float _1874 = _1856;
    if (!_1828)
    {
        _1862 = _1027;
    }
    float _1876 = _1862;
    float _1878 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1828)
    {
        _1866 = _1023;
    }
    float _1880 = _1866;
    bool _1882 = _1830 > 0.0;
    float _1884 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1886 = _1830 >= 0.0;
    bool _1888 = isnan(_1830);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan(0.0);
    bool _1894 = _1890 || _1892;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1898 = in.m_44.x;
    float _1900 = in.m_44.y;
    float _1902 = in.m_44.z;
    bool _1904 = !_1302;
    int _1906 = _1904 ? _1834 : (-1);
    int _1908 = _1894 ? 0 : 1;
    int _1910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1912 = _1910 != 0;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1918 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1920 = _1918 != 0;
    int _1922 = ~_1908;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = 1.0 / _1916;
    int _1930 = _1926;
    if (!_1882)
    {
        int _1932 = ~_1908;
        int _1934 = _1932 + 1;
        _1930 = _1934;
    }
    int _1936 = _1930;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1942 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1944 = -_1938;
    float _1946 = fma(_1872, 2.0, _1944);
    bool _1948 = _1854 >= 0.0;
    bool _1950 = isnan(_1854);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(0.0);
    bool _1956 = _1952 || _1954;
    float _1958 = fma(_1942, -2.0, _1940);
    float _1960 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1962 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1964 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1966 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1960);
    float _1968 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1962);
    float _1970 = fma(_1898, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1964);
    float _1972 = _1023 + _1025;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1974;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1982 = _1956 ? 0 : 1;
    float _1984 = _1972 + (-1.0);
    float _1986 = _1976 * _1928;
    int _1988 = _1598 >> 31;
    float _1990 = 1.0 / _1980;
    bool _1992 = _1854 > 0.0;
    float _1994 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1996 = _1988 & 3;
    float _1998 = _1027 * 2.0;
    bool _2000 = !_1616;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2008 = _1598 + _1996;
    float _2010 = _1027 + _1025;
    bool _2012 = _1614 != 3;
    float _2014 = floor(_1998);
    int _2016 = _1708 >> 31;
    float _2018 = _2010 + (-1.0);
    int _2020 = _2008 >> 2;
    float _2022 = fma(_1986, _953, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2024 = ~_1982;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _2006 * _1990;
    int _2032 = _2016 & 3;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2036 = _943 + _2034;
    int _2038 = _2020 << 4;
    int _2040 = _2038 + 368;
    float _2042 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1968);
    int _2044 = _2028;
    if (!_1992)
    {
        int _2046 = ~_1982;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = fma(_2030, _2036, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2054 = _1734 != 3;
    uint _2056 = uint(int(uint(_2040) >> uint(2)));
    uint _2058 = uint(int(uint(int(_2056)) >> uint(2)));
    int _2060 = int(_2056) & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    int _2064 = int(_2056) + 1;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    int _2068 = _2064 & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = _1708 + _2032;
    float _2074 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1970);
    bool _2076 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2078 = isnan(_943);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = -_131;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1946);
    bool _2092 = !_1736;
    int _2094 = _2092 ? 0 : 1;
    float _2096 = _2074 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2098 = !_2054;
    int _2100 = _2098 ? 0 : (-1);
    float _2102 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1958);
    bool _2104 = !_2012;
    int _2106 = _2104 ? 0 : (-1);
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2110 = _2108 != 0;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2114 = _2112 != 0;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2118 = _2116 != 0;
    float _2120 = -_2086;
    float _2122 = _2120 + 1.0;
    bool _2124 = _2014 >= 0.0;
    bool _2126 = isnan(_2014);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan(0.0);
    bool _2132 = _2128 || _2130;
    float _2134 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2136 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2138 = isnan(_943);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = _969 * _2122;
    int _2150 = _2132 ? 0 : 1;
    float _2152 = -_969;
    float _2154 = _2152 + 1.0;
    bool _2156 = _2014 > 0.0;
    float _2158 = -_2146;
    float _2160 = _2158 + 1.0;
    int _2162 = _2040 + 8;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    uint _2166 = uint(int(uint(int(_2164)) >> uint(2)));
    int _2168 = int(_2164) & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    int _2172 = int(_2164) + 1;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    int _2176 = _2172 & 3;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[int(_2174)][_2176];
    int _2180 = _2072 >> 2;
    float _2182 = _2146 * _2154;
    float _2184 = fma(_1902, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1966);
    int _2186 = ~_2150;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2180 << 4;
    int _2194 = _2192 + 512;
    float _2196 = _2022 * _2182;
    int _2198 = ~_1658;
    int _2200 = _2198 + _1794;
    int _2202 = _2200 + 1;
    uint _2204 = uint(int(uint(_2194) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    float _2220 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2196);
    int _2222 = _2190;
    if (!_2156)
    {
        int _2224 = ~_2150;
        int _2226 = _2224 + 1;
        _2222 = _2226;
    }
    int _2228 = _2222;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2232 = int(_2230);
    float _2234 = fma(_2052, _2148, _2220);
    int _2236 = _2194 + 8;
    uint _2238 = uint(int(uint(_2236) >> uint(2)));
    uint _2240 = uint(int(uint(int(_2238)) >> uint(2)));
    int _2242 = int(_2238) & 3;
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[int(_2240)][_2242];
    int _2246 = int(_2238) + 1;
    uint _2248 = uint(int(uint(_2246) >> uint(2)));
    int _2250 = _2246 & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2256 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2234);
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2260 = abs(_2002);
    float _2262 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2254);
    int _2264 = abs(_1684);
    float _2266 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2258);
    int _2268 = abs(_1782);
    float _2270 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2262);
    float _2272 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2266);
    int _2274 = abs(_1702);
    float _2276 = -_2270;
    float _2278 = _2276 + 1.0;
    int _2280 = ~_2264;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = -_2272;
    float _2288 = _2286 + 1.0;
    int _2290 = ~_2274;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2268;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    int _2302 = _2284 * as_type<int>(_2070);
    int _2304 = ~_2260;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    int _2310 = abs(_2094);
    int _2312 = abs(_2100);
    int _2314 = _2308 * as_type<int>(_2062);
    int _2316 = _2314 + _2302;
    float _2318 = float(uint(_2232));
    int _2320 = _1005 * _2202;
    int _2322 = _2320 + _1452;
    int _2324 = ~_2310;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2332 = _2294 * as_type<int>(_2170);
    int _2334 = _2332 + _2316;
    int _2336 = abs(_2106);
    int _2338 = abs(_1740);
    int _2340 = ~_2336;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    float _2346 = 1.0 / _2318;
    int _2348 = abs(_1804);
    int _2350 = _2344 * as_type<int>(_2178);
    int _2352 = _2350 + _2334;
    int _2354 = ~_2338;
    int _2356 = _2354 + 1;
    int _2358 = _2356 + 1;
    int _2360 = _2300 * as_type<int>(_2218);
    int _2362 = ~_2348;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = _2042 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2370 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2372 = int(_2370);
    int _2374 = _2352 * _2358;
    int _2376 = _2328 * as_type<int>(_2210);
    int _2378 = _2376 + _2360;
    int _2380 = abs(_2232);
    int _2382 = _1906 * _2338;
    int _2384 = _2382 + _2374;
    int _2386 = abs(_1752);
    int _2388 = _2366 * as_type<int>(_2244);
    int _2390 = _2388 + _2378;
    int _2392 = ~_2312;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = _2184 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2402 = _2368 + _2400;
    int _2404 = as_type<int>(_2346) + (-2);
    float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2408 = _2096 + _2406;
    float _2410 = float(uint(_2384));
    int _2412 = _2396 * as_type<int>(_2252);
    int _2414 = _2412 + _2390;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2398 + _2416;
    float _2420 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2422 = float(uint(_2372));
    float _2424 = as_type<float>(_2404) * _2410;
    int _2426 = abs(_2372);
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2420);
    float _2430 = float(uint(_2380));
    float _2432 = _2402 * _2402;
    float _2434 = float(uint(_2426));
    float _2436 = trunc(_2424);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2428);
    int _2444 = ~_2386;
    int _2446 = _2444 + 1;
    int _2448 = _2446 + 1;
    float _2450 = fma(_2418, _2418, _2432);
    bool _2452 = !_1374;
    int _2454 = _2452 ? _2322 : (-1);
    float _2456 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2458 = _2442 >= 0.0;
    float _2460 = fma(_2408, _2408, _2450);
    float _2462 = 1.0 / _2422;
    int _2464 = _2414 * _2448;
    float _2466 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2468 = ~_2232;
    int _2470 = _2468 + 1;
    float _2472 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2474 = _2454 * _2386;
    int _2476 = _2474 + _2464;
    int _2478 = abs(_2384);
    float _2480 = _405 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2482 = 1.0 / _2430;
    int _2484 = _2470 * int(_2440);
    int _2486 = _2484 + _2384;
    float _2488 = float(uint(_2476));
    float _2490 = _2480 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2492 = abs(_2476);
    float _2494 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2496 = float(uint(_2478));
    float _2498 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2500 = 1.0 / _2434;
    int _2502 = as_type<int>(_2462) + (-2);
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = float(uint(_2486));
    float _2508 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2510 = float(uint(_2492));
    float _2512 = as_type<float>(_2502) * _2488;
    float _2514 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2516 = sqrt(_2460);
    int _2518 = as_type<int>(_2482) + (-2);
    float _2520 = as_type<float>(_2404) * _2506;
    out.m_64.x = _2494;
    out.m_64.y = _2498;
    out.m_64.z = _2504;
    out.m_64.w = _2514;
    int _2522 = ~_2426;
    int _2524 = _2522 + 1;
    float _2526 = as_type<float>(_2518) * _2496;
    int _2528 = ~_2372;
    int _2530 = _2528 + 1;
    float _2532 = rsqrt(_2460);
    int _2534 = as_type<int>(_2500) + (-2);
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2538 = !_2114;
    int _2540 = _2538 ? 0 : 1;
    if (_2458)
    {
        out.m_47.x = 0.0;
    }
    float _2542 = float(_1936);
    float _2544 = as_type<float>(_2534) * _2510;
    float _2546 = -_2536;
    float _2548 = fma(_1884, 2.0, _2546);
    float _2550 = _2516 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2552 = trunc(_2512);
    float _2554 = precise::max(_2552, 0.0);
    uint _2556 = uint(_2554);
    float _2558 = _1186 + 0.5;
    float _2560 = -_131;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2548);
    float _2564 = precise::min(_2490, _2550);
    int _2566 = abs(_2540);
    float _2568 = _2402 * _2532;
    float _2570 = trunc(_2526);
    float _2572 = precise::max(_2570, 0.0);
    uint _2574 = uint(_2572);
    float _2576 = _2418 * _2532;
    float _2578 = fma(_2508, _2558, _2562);
    float _2580 = _2568 * _2564;
    int _2582 = ~_2232;
    int _2584 = _2582 + 1;
    float _2586 = _2576 * _2564;
    float _2588 = float(_2566);
    float _2590 = -_2580;
    float _2592 = _2402 + _2590;
    float _2594 = trunc(_2544);
    float _2596 = precise::max(_2594, 0.0);
    uint _2598 = uint(_2596);
    int _2600 = ~_2380;
    int _2602 = _2600 + 1;
    int _2604 = _2530 * int(_2556);
    int _2606 = _2604 + _2476;
    float _2608 = -_2586;
    float _2610 = _2418 + _2608;
    float _2612 = _2592 * _2592;
    float _2614 = _2588 * _2542;
    bool _2616 = _1025 > 0.5;
    out.m_66.w = _2564;
    float _2618 = trunc(_2520);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    int _2624 = _2602 * int(_2574);
    int _2626 = _2624 + _2478;
    float _2628 = float(uint(_2606));
    float _2630 = float(uint(_2626));
    float _2632 = as_type<float>(_2502) * _2628;
    int _2634 = _2524 * int(_2598);
    int _2636 = _2634 + _2492;
    float _2638 = fma(_2610, _2610, _2612);
    float _2640 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2642 = as_type<float>(_2518) * _2630;
    float _2644 = trunc(_2632);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = float(uint(_2636));
    int _2652 = int(_2440) + int(_2622);
    float _2654 = _2408 * _2532;
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2658 = as_type<float>(_2534) * _2650;
    float _2660 = _2654 * _2564;
    float _2662 = trunc(_2642);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = fma(_1896, -2.0, _2656);
    int _2670 = ~_2372;
    int _2672 = _2670 + 1;
    float _2674 = -_2660;
    float _2676 = _2408 + _2674;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2680 = ~_2380;
    int _2682 = _2680 + 1;
    float _2684 = fma(_2676, _2676, _2638);
    float _2686 = trunc(_2658);
    float _2688 = precise::max(_2686, 0.0);
    uint _2690 = uint(_2688);
    int _2692 = _2584 * _2652;
    int _2694 = _2692 + _2384;
    int _2696 = int(_2556) + int(_2648);
    float _2698 = fma(_1878, -2.0, _2678);
    int _2700 = ~_2426;
    int _2702 = _2700 + 1;
    bool _2704 = uint(_2694) >= uint(_2232);
    int _2706 = _2672 * _2696;
    int _2708 = _2706 + _2476;
    float _2710 = sqrt(_2684);
    int _2712 = int(_2574) + int(_2666);
    float _2714 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2698);
    bool _2716 = !_2110;
    int _2718 = _2716 ? 0 : 1;
    int _2720 = _2682 * _2712;
    int _2722 = _2720 + _2478;
    int _2724 = int(_2598) + int(_2690);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2728 = _2702 * _2724;
    int _2730 = _2728 + _2492;
    float _2732 = -_2726;
    float _2734 = fma(_2640, 2.0, _2732);
    float _2736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2738 = _2532 * _2710;
    bool _2740 = !_2704;
    int _2742 = _2740 ? 0 : (-1);
    bool _2744 = uint(_2708) >= uint(_2372);
    float _2746 = _2480 * _2738;
    int _2748 = ~_2652;
    int _2750 = _2748 + _2742;
    int _2752 = _2750 + 1;
    bool _2754 = !_2744;
    int _2756 = _2754 ? 0 : (-1);
    float _2758 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2760 = uint(_2722) >= uint(_2380);
    int _2762 = _2232 * _2752;
    int _2764 = _2762 + _2384;
    int _2766 = ~_2696;
    int _2768 = _2766 + _2756;
    int _2770 = _2768 + 1;
    float _2772 = _2576 * _2758;
    float _2774 = _2568 * _2758;
    bool _2776 = !_2760;
    int _2778 = _2776 ? 0 : (-1);
    float _2780 = _2654 * _2758;
    bool _2782 = uint(_2730) >= uint(_2426);
    float _2784 = -_2774;
    float _2786 = _2402 + _2784;
    float _2788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2790 = -_2772;
    float _2792 = _2418 + _2790;
    bool _2794 = !_2782;
    int _2796 = _2794 ? 0 : (-1);
    float _2798 = _2786 * _2786;
    bool _2800 = _2232 == 0;
    int _2802 = _2372 * _2770;
    int _2804 = _2802 + _2476;
    int _2806 = _2384 ^ _2232;
    float _2808 = fma(_2792, _2792, _2798);
    bool _2810 = !_2800;
    int _2812 = _2810 ? _2764 : (-1);
    float _2814 = -_2780;
    float _2816 = _2408 + _2814;
    bool _2818 = _2372 == 0;
    float _2820 = _2736 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2822 = uint(int(uint(_2806) >> uint(31)));
    bool _2824 = !_2818;
    int _2826 = _2824 ? _2804 : (-1);
    float _2828 = fma(_2816, _2816, _2808);
    int _2830 = abs(_2718);
    float _2832 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2834 = ~_2778;
    int _2836 = _2712 + _2834;
    int _2838 = _2836 + 1;
    int _2840 = ~int(_2822);
    int _2842 = _2840 + 1;
    float _2844 = _1182 + (-0.5);
    float _2846 = float(_2228);
    float _2848 = sqrt(_2828);
    float _2850 = float(_2830);
    int _2852 = _2838 ^ _2842;
    float _2854 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2668);
    bool _2856 = _2232 == 0;
    float _2858 = _2850 * _2846;
    int _2860 = ~_2842;
    int _2862 = _2860 + _2852;
    int _2864 = _2862 + 1;
    float _2866 = -_2832;
    float _2868 = -_2854;
    float _2870 = fma(_2866, _2844, _2868);
    float _2872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2874 = as_type<float>(_2712);
    int _2876 = as_type<int>(_2788);
    if (_2458)
    {
        _2874 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2878 = _2874;
    bool _2880 = !_2856;
    int _2882 = _2880 ? _2864 : (-1);
    bool _2884 = _2372 == 0;
    if (_2458)
    {
        float _2886 = _2878 * 5.0;
        _2876 = as_type<int>(_2886);
    }
    int _2888 = _2876;
    int _2890 = _2476 ^ _2372;
    float _2892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2894 = ~_2796;
    int _2896 = _2724 + _2894;
    int _2898 = _2896 + 1;
    float _2900 = _2532 * _2848;
    uint _2902 = uint(int(uint(_2890) >> uint(31)));
    if (_2458)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8416 = as_type<float>(_2888);
        out.gl_Position.z = _8416;
    }
    float _2904 = float(_2812);
    float _2906 = _2746 * _2900;
    int _2908 = ~int(_2902);
    int _2910 = _2908 + 1;
    float _2912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2914 = float(_2826);
    float _2916 = _2872 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2918 = _2898 ^ _2910;
    float _2920 = fma(_2820, _2904, _2090);
    float _2922 = float(_2882);
    out.m_68.x = _2906;
    int _2924 = ~_2910;
    int _2926 = _2924 + _2918;
    int _2928 = _2926 + 1;
    float _2930 = -_131;
    float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2734);
    float _2934 = _1826 + 0.5;
    float _2936 = -_201;
    int _2938 = _2616 ? as_type<int>(_2936) : as_type<int>(_201);
    float _2940 = _2892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2942 = fma(_2916, _2914, _2932);
    float _2944 = fma(_2820, _2934, _2920);
    bool _2946 = !_1912;
    float _2948 = _2946 ? _191 : as_type<float>(_1642);
    float _2950 = -_2102;
    float _2952 = fma(_2940, _2922, _2950);
    bool _2954 = !_1920;
    float _2956 = _2954 ? _201 : as_type<float>(_2938);
    float _2958 = _2912 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2960 = !_2884;
    int _2962 = _2960 ? _2928 : (-1);
    float _2964 = _2948 + 0.5;
    float _2966 = _2956 + (-0.5);
    float _2968 = float(_2962);
    float _2970 = fma(_2916, _2964, _2942);
    float _2972 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2974 = log2(_2972);
    float _2976 = -_2940;
    float _2978 = fma(_2976, _2966, _2952);
    float _2980 = _1258 + (-0.5);
    float _2982 = -_2714;
    float _2984 = fma(_2958, _2968, _2982);
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2988 = -_2958;
    float _2990 = fma(_2988, _2980, _2984);
    float _2992 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2986);
    float _2994 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2996 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2998 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3000 = isnan(0.0);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3006 = _3002 || _3004;
    float _3008 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2992);
    float _3010 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2994);
    float _3012 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2996);
    float _3014 = _2974 * _131;
    float _3016 = -_3008;
    float _3018 = _3016 + 1.0;
    float _3020 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3010);
    float _3022 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3012);
    float _3024 = -_3018;
    float _3026 = fma(_1186, _3024, _2578);
    float _3028 = -_3020;
    float _3030 = _3028 + 1.0;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3034 = exp2(_3014);
    float _3036 = -_3022;
    float _3038 = _3036 + 1.0;
    float _3040 = -_3030;
    float _3042 = fma(_1826, _3040, _2944);
    float _3044 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3032);
    float _3046 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3048 = 1.0 + _3046;
    float _3050 = fma(_1182, _3038, _2870);
    bool _3052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3054 = isnan(1.0);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3060 = _3056 || _3058;
    float _3062 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3044);
    float _3064 = 1.0 / _3048;
    float _3066 = in.m_70.x;
    float _3068 = in.m_70.y;
    float _3070 = in.m_70.z;
    float _3072 = -_2278;
    float _3074 = fma(_2948, _3072, _2970);
    float _3076 = -_3062;
    float _3078 = _3076 + 1.0;
    float _3080 = fma(_1258, _2288, _2990);
    out.m_72.x = _3026;
    out.m_72.y = _3050;
    float _3082 = fma(_2956, _3078, _2978);
    float _3084 = -_3034;
    float _3086 = _3084 + 1.0;
    bool _3088 = !_2118;
    int _3090 = _3088 ? 0 : 1;
    out.m_74.x = _3042;
    out.m_74.y = _3082;
    out.m_74.z = _3074;
    out.m_74.w = _3080;
    float _3092 = _3006 ? _3086 : 0.0;
    if (_3060)
    {
        float _3094 = _3092 * _3064;
        _151 = _3094;
    }
    float _3096 = _151;
    if (_2458)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3098 = _2858 * (-2.0);
    float _3100 = -_2774;
    float _3102 = _2368 + _3100;
    float _3104 = _1023 + (-0.5);
    float _3106 = -_2772;
    float _3108 = _2398 + _3106;
    float _3110 = fma(_3098, _3066, _3066);
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3114 = _3102 + _3112;
    float _3116 = fma(_1994, _3098, _1994);
    float _3118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3120 = _3108 + _3118;
    float _3122 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3110);
    float _3124 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3126 = -_2780;
    float _3128 = _2096 + _3126;
    int _3130 = abs(_3090);
    float _3132 = _2614 * (-2.0);
    float _3134 = fma(_3120, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3124);
    float _3136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3138 = _3128 + _3136;
    float _3140 = _1025 + (-0.5);
    float _3142 = fma(_3132, _3068, _3068);
    float _3144 = fma(_2134, _3132, _2134);
    float _3146 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3134);
    float _3148 = fma(_3140, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3142);
    float _3150 = float(_2050);
    float _3152 = fma(_3116, _3096, _3122);
    float _3154 = float(_3130);
    float _3156 = _1027 + _1023;
    bool _3158 = _3146 >= 0.0;
    float _3160 = fma(_3144, _3096, _3148);
    float _3162 = _3154 * _3150;
    float _3164 = _3152 * 0.15915493667125701904296875;
    float _3166 = _3156 + (-1.0);
    float _3168 = _3160 * 0.15915493667125701904296875;
    float _3170 = _3162 * (-2.0);
    float _3172 = _3164 * 6.283185482025146484375;
    float _3174 = sin(_3172);
    float _3176 = fma(_3166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3178 = _1027 + (-0.5);
    float _3180 = fma(_3170, _3070, _3070);
    float _3182 = _3124;
    int _3184 = as_type<int>(_3178);
    if (_3158)
    {
        _3182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3186 = _3182;
    float _3188 = fma(_3176, _3170, _3176);
    float _3190 = fma(_3178, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3180);
    float _3192 = _3164 * 6.283185482025146484375;
    float _3194 = cos(_3192);
    if (_3158)
    {
        float _3196 = _3186 * 5.0;
        _3184 = as_type<int>(_3196);
    }
    int _3198 = _3184;
    float _3200 = fma(_3188, _3096, _3190);
    if (_3158)
    {
        out.m_47.x = 0.0;
    }
    float _3202 = _3200 * 0.15915493667125701904296875;
    float _3204 = _3168 * 6.283185482025146484375;
    float _3206 = sin(_3204);
    if (_3158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8914 = as_type<float>(_3198);
        out.gl_Position.z = _8914;
    }
    float _3208 = _3168 * 6.283185482025146484375;
    float _3210 = cos(_3208);
    if (_3158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3212 = _3202 * 6.283185482025146484375;
    float _3214 = cos(_3212);
    float _3216 = _407 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3218 = _2738 * _2900;
    float _3220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _3222 = _3194 * _3210;
    float _3224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _3226 = _3216 * _3218;
    float _3228 = _3174 * _3210;
    float _3230 = _3202 * 6.283185482025146484375;
    float _3232 = sin(_3230);
    float _3234 = _3194 * _3206;
    float _3236 = _3226 * _3220;
    float _3238 = _3174 * _3206;
    float _3240 = _2906 * _3224;
    float _3242 = _3218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3244 = _3242 * 0.5;
    float _3246 = _3194 * _3214;
    float _3248 = _3210 * _3214;
    float _3250 = _3174 * _3214;
    float _3252 = _3206 * _3214;
    float _3254 = _3246 * _3236;
    float _3256 = fma(_3232, _3222, _3238);
    float _3258 = -_3228;
    float _3260 = fma(_3232, _3234, _3258);
    float _3262 = -_3236;
    float _3264 = _3232 * _3262;
    float _3266 = -_3234;
    float _3268 = fma(_3232, _3228, _3266);
    float _3270 = fma(_3256, _3240, _3254);
    float _3272 = _3250 * _3236;
    float _3274 = fma(_3248, _3240, _3264);
    float _3276 = fma(_3232, _3238, _3222);
    float _3278 = fma(_3260, _3244, _3270);
    float _3280 = fma(_3268, _3240, _3272);
    float _3282 = fma(_3252, _3244, _3274);
    float _3284 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3286 = fma(_3276, _3244, _3280);
    float _3288 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3290 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3284);
    float _3292 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3288);
    float _3294 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3290);
    float _3296 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3292);
    float _3298 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3300 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3302 = _3278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3304 = _2096 + _3298;
    float _3306 = _2398 + _3300;
    float _3308 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3302);
    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3312 = _3304 + _3310;
    float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3316 = _3306 + _3314;
    float _3318 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3308);
    float _3320 = _3312 * _3312;
    float _3322 = fma(_3316, _3316, _3320);
    float _3324 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3326 = sqrt(_3322);
    float _3328 = _2368 + _3324;
    bool _3330 = _3326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3332 = _3282;
    float _3334 = _3304;
    float _3336 = _3306;
    if (!_3330)
    {
        _3332 = _3304;
    }
    float _3338 = _3332;
    float _3340 = _3338;
    if (!_3330)
    {
        _3334 = _3328;
    }
    float _3342 = _3334;
    bool _3344 = !_3330;
    float _3346 = _3342;
    if (!_3344)
    {
        float _3348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3352 = _3326 + _3350;
        float _3354 = rsqrt(_3322);
        float _3356 = _3352 * _3348;
        float _3358 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3360 = _3356 * 0.15915493667125701904296875;
        float _3362 = _3360 * 6.283185482025146484375;
        float _3364 = sin(_3362);
        float _3366 = _3360 * 6.283185482025146484375;
        float _3368 = cos(_3366);
        float _3370 = fma(_3364, _3358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3372 = _3354 * _3370;
        float _3374 = _3368 + (-1.0);
        float _3376 = fma(_3316, _3372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3378 = fma(_3312, _3372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3380 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3382 = fma(_3328, _3368, _3380);
        _3346 = _3382;
        _3336 = _3376;
        _3340 = _3378;
    }
    float _3384 = _3346;
    float _3386 = _3336;
    float _3388 = _3340;
    float _3390 = -_2368;
    float _3392 = _3390 + _3384;
    float _3394 = -_2398;
    float _3396 = _3394 + _3386;
    float _3398 = -_2096;
    float _3400 = _3398 + _3388;
    float _3402 = -_2580;
    float _3404 = _2368 + _3402;
    float _3406 = _3392 * _3392;
    float _3408 = -_2586;
    float _3410 = _2398 + _3408;
    float _3412 = -_2660;
    float _3414 = _2096 + _3412;
    float _3416 = -_2774;
    float _3418 = _3416 + _3404;
    float _3420 = fma(_3396, _3396, _3406);
    float _3422 = -_2580;
    float _3424 = _3422 + _3384;
    float _3426 = -_2780;
    float _3428 = _3426 + _3414;
    float _3430 = _3418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3432 = fma(_3400, _3400, _3420);
    float _3434 = -_2772;
    float _3436 = _3434 + _3410;
    float _3438 = -_2660;
    float _3440 = _3438 + _3388;
    float _3442 = sqrt(_3432);
    float _3444 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3430);
    float _3446 = _3418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3448 = -_2586;
    float _3450 = _3448 + _3386;
    bool _3452 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3454 = isnan(0.5);
    bool _3456 = _3452 || _3454;
    bool _3458 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3460 = _3456 || _3458;
    float _3462 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3444);
    float _3464 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3446);
    bool _3466 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3468 = isnan(0.5);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3474 = _3470 || _3472;
    float _3476 = _3462 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3478 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3464);
    float _3480 = 1.0 / _3476;
    float _3482 = _3478 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3484 = _3442 > 0.0;
    float _3486 = _3482 + _3476;
    float _3488 = _3482;
    float _3490 = _3442;
    float _3492 = _3450;
    if (!_3484)
    {
        _3488 = _3424;
    }
    float _3494 = _3488;
    float _3496 = _3494;
    float _3498 = _3494;
    if (!_3484)
    {
        _3490 = _3440;
    }
    float _3500 = _3490;
    bool _3502 = !_3484;
    float _3504 = _3500;
    float _3506 = _3500;
    if (!_3502)
    {
        float _3508 = _205 * _205;
        float _3510 = rsqrt(_3432);
        float _3512 = fma(_203, _203, _3508);
        float _3514 = fma(_207, _207, _3512);
        float _3516 = sqrt(_3514);
        float _3518 = _3396 * _3510;
        float _3520 = _3392 * _3510;
        float _3522 = _3400 * _3510;
        bool _3524 = _3516 > 0.0;
        if (!_3524)
        {
            _3496 = _3424;
        }
        float _3526 = _3496;
        _3498 = _3526;
        if (!_3524)
        {
            _3504 = _3440;
        }
        float _3528 = _3504;
        bool _3530 = !_3524;
        _3506 = _3528;
        if (!_3530)
        {
            float _3532 = rsqrt(_3514);
            float _3534 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3536 = _205 * _3532;
            float _3538 = _203 * _3532;
            float _3540 = _3520 * _3536;
            float _3542 = _207 * _3532;
            float _3544 = fma(_3518, _3538, _3540);
            float _3546 = _3534 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3548 = fma(_3522, _3542, _3544);
            float _3550 = _3548 * _3546;
            float _3552 = fma(_203, _3550, _3450);
            float _3554 = fma(_205, _3550, _3424);
            float _3556 = fma(_207, _3550, _3440);
            _3492 = _3552;
            _3498 = _3554;
            _3506 = _3556;
        }
    }
    float _3558 = _3492;
    float _3560 = _3498;
    float _3562 = _3506;
    float _3564 = -_2772;
    float _3566 = _3564 + _3558;
    float _3568 = -_2774;
    float _3570 = _3568 + _3560;
    float _3572 = -_2780;
    float _3574 = _3572 + _3562;
    float _3576 = _3486 * _3480;
    float _3578 = _3576 * 0.5;
    float _3580 = _3570;
    float _3582 = _3566;
    float _3584 = _3574;
    if (_3474)
    {
        _211 = 1.0;
    }
    float _3586 = _211;
    float _3588 = _3586;
    if (!_3460)
    {
        float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3592 = _3418 + _3590;
        float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3596 = _3436 + _3594;
        float _3598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3600 = -_3414;
        float _3602 = _3600 + _3562;
        float _3604 = _3592 * _3592;
        float _3606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3608 = _3428 + _3606;
        float _3610 = -_3410;
        float _3612 = _3610 + _3558;
        float _3614 = fma(_3596, _3596, _3604);
        float _3616 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3618 = fma(_3608, _3608, _3614);
        float _3620 = sqrt(_3618);
        float _3622 = 1.0 / _2900;
        float _3624 = _3616 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3626 = precise::min(_3620, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3628 = _3626 * _3598;
        float _3630 = -_3404;
        float _3632 = _3630 + _3560;
        float _3634 = _3628 * _3622;
        float _3636 = _3624 * _3634;
        float _3638 = _3602 * _3634;
        float _3640 = fma(_3632, _3636, _3418);
        float _3642 = fma(_3612, _3636, _3436);
        float _3644 = fma(_3624, _3638, _3428);
        _3580 = _3640;
        _3582 = _3642;
        _3584 = _3644;
    }
    float _3646 = _3580;
    float _3648 = _3582;
    float _3650 = _3584;
    if (!_3474)
    {
        float _3652 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3654 = _3652 * 0.15915493667125701904296875;
        float _3656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3660 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3658);
        float _3662 = _3654 * 6.283185482025146484375;
        float _3664 = cos(_3662);
        float _3666 = _3656 * 0.15915493667125701904296875;
        float _3668 = _3654 * 6.283185482025146484375;
        float _3670 = sin(_3668);
        float _3672 = 1.0 / _3664;
        float _3674 = _3666 * 6.283185482025146484375;
        float _3676 = cos(_3674);
        float _3678 = _3670 * _3672;
        float _3680 = _3666 * 6.283185482025146484375;
        float _3682 = sin(_3680);
        float _3684 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3686 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3684;
        float _3688 = _3676 * _3678;
        float _3690 = 1.0 / _3660;
        float _3692 = 1.0 / _3688;
        float _3694 = 1.0 / _3686;
        float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3698 = _3690 * _3696;
        float _3700 = _3682 * _3692;
        float _3702 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3704 = fma(_3700, _3698, _3702);
        float _3706 = _3704 * _3694;
        float _3708 = precise::clamp(_3706, 0.0, 1.0);
        _213 = _3678;
        _3588 = _3708;
    }
    float _3710 = _213;
    float _3712 = _3588;
    float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3716 = _3646 + _3714;
    float _3718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3720 = _3648 + _3718;
    float _3722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3724 = _3650 + _3722;
    float _3726 = _3716 * _3716;
    float _3728 = fma(_3720, _3720, _3726);
    float _3730 = fma(_3724, _3724, _3728);
    float _3732 = rsqrt(_3730);
    float _3734 = sqrt(_3730);
    float _3736 = _3732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3738 = _3720 * _3736;
    float _3740 = _3724 * _3736;
    float _3742 = _3738 * _3738;
    float _3744 = _3740 * _3740;
    float _3746 = _3742 + _3744;
    float _3748 = sqrt(_3746);
    bool _3750 = _3748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3754 = _3748 + _3752;
    float _3756 = _3724;
    float _3758 = _3746;
    float _3760 = _3754;
    float _3762 = _3726;
    float _3764 = _3736;
    if (_3750)
    {
        float _3766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3756 = _3766;
    }
    float _3768 = _3756;
    if (_3750)
    {
        float _3770 = rsqrt(_3746);
        _3758 = _3770;
    }
    float _3772 = _3758;
    float _3774 = _3772;
    if (_3750)
    {
        float _3776 = _3754 * _3768;
        _3760 = _3776;
    }
    float _3778 = _3760;
    if (_3750)
    {
        float _3780 = _3778 * 0.15915493667125701904296875;
        _3762 = _3780;
    }
    float _3782 = _3762;
    float _3784 = _3768;
    float _3786 = _3782;
    if (_3750)
    {
        float _3788 = _3782 * 6.283185482025146484375;
        float _3790 = sin(_3788);
        _3784 = _3790;
    }
    float _3792 = _3784;
    float _3794 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3796 = precise::max(0.0, _3794);
    float _3798 = _3710;
    float _3800 = _3796;
    if (_3750)
    {
        float _3802 = _3782 * 6.283185482025146484375;
        float _3804 = cos(_3802);
        _3798 = _3804;
    }
    float _3806 = _3798;
    float _3808 = -_3736;
    float _3810 = -_3796;
    float _3812 = fma(_3716, _3808, _3810);
    float _3814 = _3812;
    if (_3750)
    {
        float _3816 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3800 = _3816;
    }
    float _3818 = _3800;
    float _3820 = _3792;
    float _3822 = _3818;
    if (_3750)
    {
        float _3824 = fma(_3792, _3818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3820 = _3824;
    }
    float _3826 = _3820;
    float _3828 = _3826;
    float _3830 = _3806;
    if (_3750)
    {
        float _3832 = _3806 + (-1.0);
        _3822 = _3832;
    }
    float _3834 = _3822;
    float _3836 = _3834;
    if (_3750)
    {
        float _3838 = _3772 * _3826;
        _3764 = _3838;
    }
    float _3840 = _3764;
    if (!_3750)
    {
        _3828 = _3738;
    }
    float _3842 = _3828;
    float _3844 = _3842;
    if (_3750)
    {
        float _3846 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3786 = _3846;
    }
    float _3848 = _3786;
    if (_3750)
    {
        float _3850 = _3738 * _3840;
        _3844 = _3850;
    }
    float _3852 = _3844;
    if (!_3750)
    {
        _3836 = _3740;
    }
    float _3854 = _3836;
    float _3856 = _3854;
    if (_3750)
    {
        float _3858 = _3740 * _3840;
        _3856 = _3858;
    }
    float _3860 = _3856;
    if (!_3750)
    {
        _3774 = _3742;
    }
    float _3862 = _3774;
    float _3864 = _3862;
    if (_3750)
    {
        float _3866 = fma(_3812, _3806, _3848);
        _3814 = _3866;
    }
    float _3868 = _3814;
    if (_3750)
    {
        float _3870 = _3852 * _3852;
        _3864 = _3870;
    }
    float _3872 = _3864;
    if (!_3750)
    {
        _3830 = _3744;
    }
    float _3874 = _3830;
    float _3876 = _3874;
    if (_3750)
    {
        float _3878 = _3860 * _3860;
        _3876 = _3878;
    }
    float _3880 = _3876;
    float _3882 = fma(_3868, _3868, _3872);
    float _3884 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3886 = _3882 + _3880;
    float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3890 = fma(_3734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3888);
    float _3892 = precise::clamp(_3890, 0.0, 1.0);
    float _3894 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3884);
    float _3896 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3898 = rsqrt(_3886);
    float _3900 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3902 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3894);
    float _3904 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3906 = -_3892;
    float _3908 = _3906 + 1.0;
    float _3910 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3900);
    float _3912 = _3902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3914 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3904);
    float _3916 = abs(_3908);
    float _3918 = log2(_3916);
    float _3920 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3910);
    float _3922 = _3646 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3924 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3914);
    float _3926 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3928 = _3920 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3930 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3922);
    float _3932 = _3924 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3934 = _3898 * _3852;
    float _3936 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3938 = _3898 * _3868;
    float _3940 = -_3926;
    float _3942 = fma(_3940, _3896, 1.0);
    float _3944 = _3934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3946 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3930);
    float _3948 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3936);
    float _3950 = _3898 * _3860;
    float _3952 = -_3944;
    float _3954 = fma(_3938, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3952);
    float _3956 = _3946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3958 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3948);
    float _3960 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3962 = -_3950;
    float _3964 = fma(_3962, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3954);
    float _3966 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3968 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3958);
    float _3970 = exp2(_3960);
    float _3972 = fma(_3964, -0.5, 0.5);
    float _3974 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3976 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3966);
    float _3978 = fma(_3964, 0.5, 0.5);
    float _3980 = _3938 + 1.0;
    float _3982 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3974);
    float _3984 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3976);
    float _3986 = log2(_3942);
    float _3988 = fma(_3978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3990 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3982);
    float _3992 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3984);
    float _3994 = fma(_3978, _3988, -0.212114393711090087890625);
    float _3996 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3990);
    float _3998 = 1.0 / _3968;
    float _4000 = -_3938;
    float _4002 = fma(_3970, _3980, _4000);
    float _4004 = fma(_3978, _3994, 1.570728778839111328125);
    float _4006 = fma(_4002, 0.5, 0.5);
    float _4008 = sqrt(_3972);
    float _4010 = _3986 * 0.693147182464599609375;
    float _4012 = _4010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4014 = _3992 * _3998;
    float _4016 = _3996 * _3998;
    float _4018 = fma(_4014, 0.5, 0.5);
    float _4020 = fma(_4016, -0.5, 0.5);
    float _4022 = _4008 * 0.636619746685028076171875;
    float3 _10208 = float3(_4018, _4020, _4012);
    float _4024 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10208, float3(0.0), isnan(_10208)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10208, float3(0.0), isnan(_10208)), level(0.0)).x;
    float3 _10219 = float3(_4018, _4020, _4012);
    float4 _4027 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10219, float3(0.0), isnan(_10219)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10219, float3(0.0), isnan(_10219)), level(0.0)).xyzw;
    float _4029 = _4027.x;
    float _4031 = _4027.y;
    float _4033 = _4027.z;
    float _4035 = _4027.w;
    float _4037 = -_4004;
    float _4039 = fma(_4022, _4037, 1.0);
    float2 _10241 = float2(_4039, _4006);
    float3 _4043 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10241, float2(0.0), isnan(_10241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10241, float2(0.0), isnan(_10241)), level(0.0)).xyz;
    float _4045 = _4043.x;
    float _4047 = _4043.y;
    float _4049 = _4043.z;
    float _4051 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4053 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4055 = _3256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4057 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4059 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4061 = _3246 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4063 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4065 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4051);
    float _4067 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4053);
    float _4069 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4055);
    float _4071 = -_3232;
    float _4073 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4057);
    float _4075 = -_3232;
    float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4059);
    float _4079 = -_3232;
    float _4081 = fma(_4079, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4061);
    float _4083 = fma(_4063, _4063, 1.0);
    float _4085 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4087 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4089 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4091 = rsqrt(_4083);
    float _4093 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4085);
    float _4095 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4087);
    float _4097 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4089);
    float _4099 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4073);
    float _4101 = _3928 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4103 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4077);
    float _4105 = fma(_3250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4081);
    float _4107 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4065);
    float _4109 = fma(_3932, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4101);
    float _4111 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4067);
    float _4113 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4069);
    float _4115 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4117 = _4063 * _4099;
    float _4119 = _4063 * _4103;
    float _4121 = _4063 * _4105;
    float _4123 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4093);
    float _4125 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4095);
    float _4127 = _4063 * _4091;
    float _4129 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4097);
    float _4131 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4109);
    float _4133 = fma(_4115, _4107, _4117);
    float _4135 = -_4123;
    float _4137 = _4127 * _4135;
    float _4139 = -_4125;
    float _4141 = _4127 * _4139;
    float _4143 = fma(_4115, _4111, _4119);
    float _4145 = fma(_4115, _4113, _4121);
    float _4147 = -_4129;
    float _4149 = _4127 * _4147;
    float _4151 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4153 = fma(_4091, _4099, _4137);
    float _4155 = fma(_4091, _4103, _4141);
    float _4157 = fma(_4091, _4105, _4149);
    float _4159 = _4123 + _4133;
    float _4161 = exp2(_4151);
    float _4163 = fma(_3956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4131);
    bool _4165 = _3712 > 0.0;
    bool _4167 = isnan(_3712);
    bool _4169 = _4165 || _4167;
    bool _4171 = isnan(0.0);
    bool _4173 = _4169 || _4171;
    out.m_76.x = _3436;
    out.m_76.y = _3418;
    out.m_76.z = _3428;
    float _4175 = _4125 + _4143;
    float _4177 = _3712 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4179 = _4163 + _3968;
    float _4181 = _3968 * 0.5;
    out.m_78.x = _3648;
    out.m_78.y = _3646;
    out.m_78.z = _3650;
    float _4183 = _3992 + _3968;
    float _4185 = _4129 + _4145;
    float _4187 = _4179 * 0.5;
    float _4189 = _4183 * 0.5;
    float _4191 = fma(_3996, -0.5, _4181);
    float _4193 = _4177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4195 = -_4161;
    float _4197 = _4195 + 1.0;
    out.m_80.x = _4107;
    out.m_80.y = _4111;
    out.m_80.z = _4113;
    float _4199 = _4197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_82.x = _4153;
    out.m_82.y = _4155;
    out.m_82.z = _4157;
    float _4201 = -_4199;
    float _4203 = _4201 + 1.0;
    out.m_84.x = _4159;
    out.m_84.y = _4175;
    out.m_84.z = _4185;
    out.gl_Position.x = _3992;
    out.gl_Position.y = _3996;
    out.gl_Position.z = _4163;
    out.gl_Position.w = _3968;
    out.m_86.x = _4189;
    out.m_86.y = _4191;
    out.m_86.z = _4187;
    out.m_86.w = _3968;
    out.m_47.x = _4193;
    float _4205 = _4199 * _4024;
    float _4207 = _4035 * _4203;
    float _4209 = _4035 * _4205;
    float _4211 = _4049 * _4205;
    float _4213 = fma(_4045, _4209, _4029);
    float _4215 = fma(_4047, _4209, _4031);
    float _4217 = fma(_4035, _4211, _4033);
    out.m_88.x = _4213;
    out.m_88.y = _4215;
    out.m_88.z = _4217;
    out.m_88.w = _4207;
    if (_4173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4219 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4219;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

