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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_98 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_57 [[user(locn13)]];
    float4 m_86 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 m_94 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_90 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3247 = false;
    bool _641 = false;
    bool _469 = false;
    bool _363 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = as_type<float>(_123);
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3564 = as_type<float>(_145);
        out.gl_Position.z = _3564;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = in.m_55.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _147 = as_type<int>(_173);
    }
    int _175 = _147;
    float _177 = _127 * _169;
    out.m_57.x = _159;
    float _179 = _177;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3629 = as_type<float>(_175);
        out.gl_Position.z = _3629;
    }
    out.m_51.x = _177;
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    float _201 = in.m_68.x;
    float _203 = in.m_68.y;
    float _205 = in.m_68.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = _185 * _191;
    float _219 = _185 * _197;
    float _221 = fma(_183, _189, _217);
    float _223 = _185 * _203;
    float _225 = fma(_183, _195, _219);
    float _227 = fma(_187, _193, _221);
    bool _229 = !_209;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_183, _201, _223);
    float _235 = fma(_187, _199, _225);
    bool _237 = !_213;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = fma(_187, _205, _233);
    bool _243 = !_215;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _177;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = in.m_70.x;
    float _271 = in.m_70.y;
    bool _273 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_263);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_283;
    float _303 = _301 + 1.0;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = 1.0 / _287;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = _299 * _303;
    float _315 = -_299;
    float _317 = _315 + 1.0;
    float _319 = _267 * _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = fma(_307, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = _325 * _313;
    float _331 = _327 * _313;
    float _333 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _335 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _337 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].x, _333);
    float _339 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].y, _335);
    float _341 = _337 * _269;
    float _343 = _339 * _271;
    bool _345 = !_311;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        _361 = _177;
    }
    _363 = false;
    float _365 = _361;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _365 + _367;
    bool _371 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _373 = isnan(_365);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _383;
    bool _387 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _389 = isnan(_365);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_381;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _403;
    float _407 = 1.0 / _385;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = _397 * _401;
    float _413 = -_397;
    float _415 = _413 + 1.0;
    float _417 = _369 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _419;
    float _423 = fma(_405, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _425;
    float _429 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = _423 * _411;
    float _433 = fma(_427, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _429 * _411;
    float _437 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _431);
    float _439 = _433 * _411;
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _435);
    float _443 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].x, _437);
    float _445 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].z, _441);
    float _449 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].y, _445);
    bool _451 = !_409;
    float _467;
    if (!_451)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _455 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        _467 = _177;
    }
    _469 = false;
    float _471 = _467;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _471 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _483 = isnan(_471);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _501 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _503 = isnan(_471);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = 1.0 / _479;
    float _515 = -_491;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    bool _523 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _525 = isnan(_471);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = _511 * _517;
    float _537 = -_511;
    float _539 = _537 + 1.0;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _543 = 1.0 / _495;
    float _545 = _533 * _539;
    float _547 = -_533;
    float _549 = _547 + 1.0;
    float _551 = 1.0 / _499;
    float _553 = _521 * _513;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _559 = fma(_553, _475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _561 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = isnan(_471);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _557 * _543;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _581 = _471 + _579;
    float _583 = _559 * _545;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _587 = _471 + _585;
    float _589 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _591 = fma(_573, _581, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _593 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[115].x, _583);
    float _595 = _577 * _551;
    float _597 = -_571;
    float _599 = _597 + 1.0;
    float _601 = fma(_591, _535, _593);
    float _603 = fma(_595, _587, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _605 = _491 * _599;
    float _607 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = fma(_603, _605, _601);
    float _611 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[118].x, _609);
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _617 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _619;
    out.m_72.y = _613;
    out.m_72.z = _615;
    out.m_72.w = _621;
    bool _623 = !_541;
    float _639;
    if (!_623)
    {
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _627 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        _639 = _177;
    }
    _641 = false;
    float _643 = _639;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _647 = _643 + _645;
    bool _649 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _651 = isnan(_643);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _661;
    bool _665 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _667 = isnan(_643);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _681;
    float _685 = 1.0 / _663;
    float _687 = _675 * _679;
    float _689 = -_675;
    float _691 = _689 + 1.0;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _697 = _647 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _699;
    float _703 = fma(_683, _697, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = fma(_701, _697, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _711 = _703 * _687;
    float _713 = fma(_707, _697, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _715 = _709 * _687;
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].x, _711);
    float _719 = _713 * _687;
    float _721 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].z, _715);
    float _723 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].x, _717);
    float _725 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].y, _719);
    float _727 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].z, _721);
    float _729 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _731 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].y, _725);
    float _733 = _727 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _739 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _735;
    out.m_74.y = _741;
    out.m_74.z = _739;
    out.m_74.w = _695;
    bool _743 = !_693;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _747 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _179 = _757;
    }
    float _759 = _179;
    float _761 = in.m_46.x;
    float _763 = in.m_46.y;
    float _765 = in.m_46.z;
    float _767 = _159 * 2.0;
    float _769 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _771 = log2(_769);
    float _773 = in.m_55.z;
    float _775 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _777 = _343 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = in.m_55.y;
    float _781 = floor(_767);
    float _783 = in.m_64.w;
    float _785 = in.m_68.w;
    float _787 = _771 * _127;
    float _789 = _191 * _763;
    float _791 = _197 * _763;
    float _793 = _203 * _763;
    float _795 = fma(_189, _761, _789);
    float _797 = fma(_195, _761, _791);
    float _799 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _801 = _781 > 0.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _805 = _781 >= 0.0;
    bool _807 = isnan(_781);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _817 = in.m_66.w;
    float _819 = -_803;
    float _821 = fma(_799, 2.0, _819);
    float _823 = fma(_193, _765, _795);
    float _825 = _773 * 2.0;
    float _827 = _779 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _829 = exp2(_787);
    float _831 = fma(_201, _761, _793);
    float _833 = fma(_199, _765, _797);
    float _835 = fma(_827, -2.0, _815);
    float _837 = _779 * 2.0;
    float _839 = fma(_205, _765, _831);
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _851 = _849 != 0;
    float _853 = _779 + _773;
    float _855 = floor(_825);
    int _857 = _813 ? 0 : 1;
    float _859 = _159 + _779;
    float _861 = _853 + (-1.0);
    float _863 = _859 + (-1.0);
    bool _865 = !_843;
    int _867 = _865 ? 0 : 1;
    float _869 = floor(_837);
    bool _871 = !_847;
    int _873 = _871 ? 0 : 1;
    float _875 = -_829;
    float _877 = _875 + 1.0;
    float _879 = _833 + _817;
    float _881 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _883 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(0.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = -_127;
    float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[76].x, _821);
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _899 = int(_897);
    bool _901 = _855 > 0.0;
    float _903 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _905 = _855 >= 0.0;
    bool _907 = isnan(_855);
    bool _909 = _905 || _907;
    bool _911 = isnan(0.0);
    bool _913 = _909 || _911;
    float _915 = _823 + _783;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _919 = _879 + _917;
    int _921 = _913 ? 0 : 1;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _925 = _869 > 0.0;
    float _927 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _835);
    bool _929 = _869 >= 0.0;
    bool _931 = isnan(_869);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    float _939 = _839 + _785;
    bool _941 = !_851;
    int _943 = _941 ? 0 : 1;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _947 = int(_945);
    int _949 = ~_921;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _957 = _915 + _955;
    float _959 = _891 ? _877 : 0.0;
    float _961 = _919 * _919;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _973 = _971 != 0;
    float _975 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[78].w, _923);
    int _977 = _953;
    float _979 = _939;
    if (!_901)
    {
        int _981 = ~_921;
        int _983 = _981 + 1;
        _977 = _983;
    }
    int _985 = _977;
    float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _989 = _939 + _987;
    bool _991 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _993 = isnan(1.0);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _999 = _995 || _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1003 = 1.0 + _1001;
    float _1005 = float(_899);
    float _1007 = fma(_957, _957, _961);
    float _1009 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _975);
    float _1011 = 1.0 / _1005;
    bool _1013 = !_965;
    int _1015 = _1013 ? 0 : 1;
    float _1017 = fma(_989, _989, _1007);
    bool _1019 = !_969;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1025 = abs(_1015);
    int _1027 = abs(_1021);
    float _1029 = 1.0 / _1003;
    float _1031 = in.m_76.x;
    float _1033 = in.m_76.y;
    float _1035 = in.m_76.z;
    float _1037 = float(_947);
    float _1039 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1023);
    float _1041 = float(_1025);
    float _1043 = float(_985);
    float _1045 = _1037 * _127;
    float _1047 = sqrt(_1017);
    float _1049 = _1011 * _127;
    float _1051 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _1053 = _1041 * _1043;
    int _1055 = ~_857;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1059;
    if (!_801)
    {
        int _1063 = ~_857;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    if (_999)
    {
        float _1069 = _959 * _1029;
        _137 = _1069;
    }
    float _1071 = _137;
    float _1073 = rsqrt(_1017);
    float _1075 = _1053 * (-2.0);
    float _1077 = float(_1067);
    float _1079 = _775 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1081 = float(_1027);
    float _1083 = fma(_881, _1075, _881);
    float _1085 = _1047 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1087 = fma(_1075, _1031, _1031);
    int _1089 = _937 ? 0 : 1;
    float _1091 = _1081 * _1077;
    float _1093 = _159 + (-0.5);
    float _1095 = precise::min(_1079, _1085);
    float _1097 = _1091 * (-2.0);
    float _1099 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1087);
    bool _1101 = !_973;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = _1073 * _1095;
    float _1107 = fma(_903, _1097, _903);
    float _1109 = fma(_1097, _1033, _1033);
    float _1111 = fma(_1083, _1071, _1099);
    int _1113 = ~_1089;
    int _1115 = _1113 + 1;
    int _1117 = _1115 + 1;
    float _1119 = _919 * _1105;
    int _1121 = abs(_1103);
    float _1123 = _779 + (-0.5);
    int _1125 = _1117;
    if (!_925)
    {
        int _1127 = ~_1089;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    float _1133 = _1111 * 0.15915493667125701904296875;
    float _1135 = _957 * _1105;
    float _1137 = -_1119;
    float _1139 = _919 + _1137;
    float _1141 = float(_1131);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1109);
    float _1145 = float(_1121);
    float _1147 = -_1135;
    float _1149 = _957 + _1147;
    float _1151 = _1139 * _1139;
    float _1153 = fma(_1107, _1071, _1143);
    float _1155 = _159 + _773;
    float _1157 = _1145 * _1141;
    float _1159 = fma(_1149, _1149, _1151);
    float _1161 = _989 * _1105;
    float _1163 = _1155 + (-1.0);
    float _1165 = _1157 * (-2.0);
    float _1167 = _773 + (-0.5);
    float _1169 = -_1161;
    float _1171 = _989 + _1169;
    float _1173 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1175 = fma(_1165, _1035, _1035);
    float _1177 = _1153 * 0.15915493667125701904296875;
    float _1179 = fma(_1171, _1171, _1159);
    float _1181 = fma(_1173, _1165, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1175);
    float _1185 = _1133 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = fma(_1181, _1071, _1183);
    float _1191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _239);
    float _1193 = _1189 * 0.15915493667125701904296875;
    float _1195 = sqrt(_1179);
    float _1197 = _1177 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1177 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1073 * _1195;
    float _1207 = _777 * _1205;
    float _1209 = _775 * _1205;
    float _1211 = _1133 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1207 * _1191;
    float _1217 = _1187 * _1199;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1221 = _1219 * 0.5;
    float _1223 = _1193 * 6.283185482025146484375;
    float _1225 = cos(_1223);
    float _1227 = _1187 * _1203;
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _1231 = _1209 * _1229;
    float _1233 = _1193 * 6.283185482025146484375;
    float _1235 = sin(_1233);
    float _1237 = _1213 * _1199;
    float _1239 = _1213 * _1203;
    float _1241 = _1187 * _1225;
    float _1243 = _1213 * _1225;
    float _1245 = _1203 * _1225;
    float _1247 = _1199 * _1225;
    float _1249 = _1241 * _1215;
    float _1251 = _1243 * _1215;
    float _1253 = fma(_1235, _1227, _1237);
    float _1255 = -_1239;
    float _1257 = fma(_1235, _1217, _1255);
    float _1259 = -_1215;
    float _1261 = _1235 * _1259;
    float _1263 = -_1217;
    float _1265 = fma(_1235, _1239, _1263);
    float _1267 = fma(_1253, _1231, _1249);
    float _1269 = fma(_1235, _1237, _1227);
    float _1271 = fma(_1245, _1231, _1261);
    float _1273 = fma(_1265, _1231, _1251);
    float _1275 = fma(_1257, _1221, _1267);
    float _1277 = fma(_1247, _1221, _1271);
    float _1279 = fma(_1269, _1221, _1273);
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1285 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1281);
    float _1287 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1283);
    float _1289 = -_1161;
    float _1291 = _939 + _1289;
    float _1293 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1285);
    float _1295 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1287);
    float _1297 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1299 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1301 = _939 + _1297;
    float _1303 = _915 + _1299;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1303 + _1309;
    float _1313 = _1307 * _1307;
    float _1315 = fma(_1311, _1311, _1313);
    float _1317 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1319 = sqrt(_1315);
    float _1321 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1317);
    float _1323 = -_1119;
    float _1325 = _879 + _1323;
    float _1327 = -_1135;
    float _1329 = _915 + _1327;
    float _1331 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1321);
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1335 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1333);
    float _1339 = _879 + _1335;
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1337);
    bool _1343 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = _1335;
    float _1347 = _1331;
    float _1349 = _1303;
    float _1351 = _1311;
    if (!_1343)
    {
        _1345 = _1301;
    }
    float _1353 = _1345;
    float _1355 = _1353;
    if (!_1343)
    {
        _1347 = _1339;
    }
    float _1357 = _1347;
    bool _1359 = !_1343;
    float _1361 = _1357;
    if (!_1359)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1367 = _1319 + _1365;
        float _1369 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = _1367 * _1363;
        float _1373 = rsqrt(_1315);
        float _1375 = _1371 * 0.15915493667125701904296875;
        float _1377 = _1375 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 + (-1.0);
        float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = fma(_1383, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = fma(_1339, _1379, _1387);
        float _1393 = _1373 * _1389;
        float _1395 = fma(_1311, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1307, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1361 = _1391;
        _1349 = _1395;
        _1355 = _1397;
    }
    float _1399 = _1361;
    float _1401 = _1349;
    float _1403 = _1355;
    float _1405 = -_879;
    float _1407 = _1405 + _1399;
    float _1409 = -_915;
    float _1411 = _1409 + _1401;
    float _1413 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1415 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1417 = _1407 * _1407;
    float _1419 = -_939;
    float _1421 = _1419 + _1403;
    float _1423 = 1.0 / _1413;
    float _1425 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1415);
    float _1427 = fma(_1411, _1411, _1417);
    float _1429 = -_1135;
    float _1431 = _1429 + _1401;
    float _1433 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1425);
    float _1435 = fma(_1421, _1421, _1427);
    float _1437 = -_1161;
    float _1439 = _1437 + _1403;
    float _1441 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1443 = sqrt(_1435);
    bool _1445 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1447 = isnan(0.5);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1453 = _1449 || _1451;
    float _1455 = _1441 + _1413;
    float _1457 = -_1119;
    float _1459 = _1457 + _1399;
    bool _1461 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1463 = isnan(0.5);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1469 = _1465 || _1467;
    float _1471 = _1455 * _1423;
    float _1473 = _1471 * 0.5;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1477 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1475);
    bool _1479 = _1443 > 0.0;
    float _1481 = 1.0 / _1477;
    float _1483 = _1443;
    float _1485 = _1473;
    float _1487 = _1403;
    float _1489 = _1423;
    float _1491 = _1439;
    float _1493 = _1431;
    float _1495 = _1411;
    if (!_1479)
    {
        _1483 = _1431;
    }
    float _1497 = _1483;
    float _1499 = _1497;
    if (!_1479)
    {
        _1485 = _1459;
    }
    float _1501 = _1485;
    float _1503 = _1501;
    if (!_1479)
    {
        _979 = _1439;
    }
    float _1505 = _979;
    bool _1507 = !_1479;
    float _1509 = _1505;
    float _1511 = _1505;
    if (!_1507)
    {
        float _1513 = _235 * _235;
        float _1515 = fma(_227, _227, _1513);
        float _1517 = rsqrt(_1435);
        float _1519 = fma(_241, _241, _1515);
        float _1521 = sqrt(_1519);
        float _1523 = _1411 * _1517;
        float _1525 = _1407 * _1517;
        float _1527 = _1421 * _1517;
        bool _1529 = _1521 > 0.0;
        float _1531 = _1517;
        float _1533 = _1521;
        _1487 = _1523;
        _1489 = _1525;
        if (!_1529)
        {
            _1531 = _1431;
        }
        float _1535 = _1531;
        _1499 = _1535;
        if (!_1529)
        {
            _1533 = _1459;
        }
        float _1537 = _1533;
        _1503 = _1537;
        if (!_1529)
        {
            _1509 = _1439;
        }
        float _1539 = _1509;
        bool _1541 = !_1529;
        _1511 = _1539;
        if (!_1541)
        {
            float _1543 = rsqrt(_1519);
            float _1545 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1547 = _235 * _1543;
            float _1549 = _227 * _1543;
            float _1551 = _1525 * _1547;
            float _1553 = _241 * _1543;
            float _1555 = fma(_1523, _1549, _1551);
            float _1557 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1559 = fma(_1527, _1553, _1555);
            float _1561 = _1559 * _1557;
            float _1563 = fma(_227, _1561, _1431);
            float _1565 = fma(_235, _1561, _1459);
            float _1567 = fma(_241, _1561, _1439);
            _1499 = _1563;
            _1503 = _1565;
            _1511 = _1567;
        }
    }
    float _1569 = _1499;
    float _1571 = _1503;
    float _1573 = _1511;
    float _1575 = _1487;
    float _1577 = _1489;
    float _1579 = _1575;
    float _1581 = _1571;
    float _1583 = _1569;
    float _1585 = _1573;
    float _1587 = _1577;
    if (_1469)
    {
        _1491 = 1.0;
    }
    float _1589 = _1491;
    float _1591 = _1589;
    if (!_1453)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _1325 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _1329 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1595 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1607 = _1291 + _1605;
        float _1609 = fma(_1599, _1599, _1603);
        float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1613 = fma(_1607, _1607, _1609);
        float _1615 = sqrt(_1613);
        float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1619 = precise::min(_1615, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1621 = _1619 * _1611;
        float _1623 = -_1329;
        float _1625 = _1623 + _1569;
        float _1627 = _1617 * _1621;
        float _1629 = -_1325;
        float _1631 = _1629 + _1571;
        float _1633 = -_1291;
        float _1635 = _1633 + _1573;
        float _1637 = fma(_1625, _1627, _1329);
        float _1639 = fma(_1631, _1627, _1325);
        float _1641 = fma(_1635, _1627, _1291);
        _1579 = _1611;
        _1581 = _1639;
        _1583 = _1637;
        _1585 = _1641;
    }
    float _1643 = _1579;
    float _1645 = _1581;
    float _1647 = _1583;
    float _1649 = _1585;
    float _1651 = _1643;
    if (_1469)
    {
        _1587 = 1.0;
    }
    float _1653 = _1587;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1657 = _1481 * _1655;
    float _1659 = _1653;
    if (!_1469)
    {
        float _1661 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1661 * 0.15915493667125701904296875;
        float _1665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1667;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1665 * 0.15915493667125701904296875;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = 1.0 / _1673;
        float _1683 = _1675 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = _1675 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = 1.0 / _1669;
        float _1697 = 1.0 / _1693;
        float _1699 = _1691 * _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = fma(_1657, _1699, _1701);
        float _1705 = _1703 * _1695;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        _1651 = _1695;
        _1493 = _1663;
        _1591 = _1707;
    }
    float _1709 = _1651;
    float _1711 = _1493;
    float _1713 = _1591;
    float _1715 = _1711;
    float _1717 = _1709;
    if (!_1469)
    {
        float _1719 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = _1719 * 0.15915493667125701904296875;
        float _1723 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1725 = _1721 * 6.283185482025146484375;
        float _1727 = cos(_1725);
        float _1729 = _1723 * 0.15915493667125701904296875;
        float _1731 = _1721 * 6.283185482025146484375;
        float _1733 = sin(_1731);
        float _1735 = 1.0 / _1727;
        float _1737 = _1729 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = _1733 * _1735;
        float _1743 = _1729 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = _1739 * _1741;
        float _1749 = 1.0 / _1747;
        float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1753 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1751;
        float _1755 = 1.0 / _1753;
        float _1757 = _1745 * _1749;
        float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1761 = fma(_1657, _1757, _1759);
        float _1763 = _1761 * _1755;
        float _1765 = precise::clamp(_1763, 0.0, 1.0);
        float _1767 = -_1765;
        float _1769 = _1767 + 1.0;
        _1715 = _1747;
        _1717 = _1735;
        _1659 = _1769;
    }
    float _1771 = _1715;
    float _1773 = _1717;
    float _1775 = _1659;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1645 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1783 = _1647 + _1781;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1787 = _1649 + _1785;
    float _1789 = _1779 * _1779;
    float _1791 = fma(_1783, _1783, _1789);
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1795 = fma(_1787, _1787, _1791);
    float _1797 = rsqrt(_1795);
    float _1799 = sqrt(_1795);
    float _1801 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1803 = _1783 * _1801;
    float _1805 = _1787 * _1801;
    float _1807 = _1803 * _1803;
    float _1809 = _1805 * _1805;
    float _1811 = _1807 + _1809;
    float _1813 = sqrt(_1811);
    bool _1815 = _1813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1819 = _1813 + _1817;
    float _1821 = _1787;
    float _1823 = _1811;
    float _1825 = _1819;
    float _1827 = _1771;
    float _1829 = _1801;
    float _1831 = _1789;
    if (_1815)
    {
        float _1833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1821 = _1833;
    }
    float _1835 = _1821;
    if (_1815)
    {
        float _1837 = rsqrt(_1811);
        _1823 = _1837;
    }
    float _1839 = _1823;
    float _1841 = _1839;
    if (_1815)
    {
        float _1843 = _1819 * _1835;
        _1825 = _1843;
    }
    float _1845 = _1825;
    if (_1815)
    {
        float _1847 = _1845 * 0.15915493667125701904296875;
        _1827 = _1847;
    }
    float _1849 = _1827;
    float _1851 = _1835;
    float _1853 = _1849;
    if (_1815)
    {
        float _1855 = _1849 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        _1851 = _1857;
    }
    float _1859 = _1851;
    float _1861 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1863 = precise::max(0.0, _1861);
    float _1865 = _1773;
    if (_1815)
    {
        float _1867 = _1849 * 6.283185482025146484375;
        float _1869 = cos(_1867);
        _1865 = _1869;
    }
    float _1871 = _1865;
    float _1873 = -_1801;
    float _1875 = -_1863;
    float _1877 = fma(_1779, _1873, _1875);
    if (_1815)
    {
        float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1829 = _1879;
    }
    float _1881 = _1829;
    float _1883 = _1881;
    if (!_1815)
    {
        _1853 = _1809;
    }
    float _1885 = _1853;
    float _1887 = fma(_1329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1889 = _1859;
    float _1891 = _1885;
    if (_1815)
    {
        float _1893 = fma(_1859, _1881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1883 = _1893;
    }
    float _1895 = _1883;
    float _1897 = _1895;
    if (!_1815)
    {
        _1889 = _1803;
    }
    float _1899 = _1889;
    float _1901 = floor(_1887);
    float _1903 = _1899;
    if (_1815)
    {
        float _1905 = _1871 + (-1.0);
        _1831 = _1905;
    }
    float _1907 = _1831;
    float _1909 = _1907;
    if (_1815)
    {
        float _1911 = _1839 * _1895;
        _1351 = _1911;
    }
    float _1913 = _1351;
    if (!_1815)
    {
        _1897 = _1877;
    }
    float _1915 = _1897;
    float _1917 = _1915;
    if (_1815)
    {
        float _1919 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1495 = _1919;
    }
    float _1921 = _1495;
    if (_1815)
    {
        float _1923 = _1803 * _1913;
        _1903 = _1923;
    }
    float _1925 = _1903;
    if (!_1815)
    {
        _1909 = _1805;
    }
    float _1927 = _1909;
    float _1929 = _1927;
    if (_1815)
    {
        float _1931 = _1805 * _1913;
        _1929 = _1931;
    }
    float _1933 = _1929;
    if (!_1815)
    {
        _1841 = _1807;
    }
    float _1935 = _1841;
    float _1937 = _1935;
    if (_1815)
    {
        float _1939 = fma(_1877, _1871, _1921);
        _1917 = _1939;
    }
    float _1941 = _1917;
    if (_1815)
    {
        float _1943 = _1925 * _1925;
        _1937 = _1943;
    }
    float _1945 = _1937;
    if (_1815)
    {
        float _1947 = _1933 * _1933;
        _1891 = _1947;
    }
    float _1949 = _1891;
    float _1951 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1953 = fma(_1941, _1941, _1945);
    float _1955 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1957 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1959 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = _1953 + _1949;
    float _1963 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1951);
    float _1965 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1955);
    float _1967 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1969 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1963);
    float _1971 = rsqrt(_1961);
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1975 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1973);
    float _1977 = precise::clamp(_1975, 0.0, 1.0);
    float _1979 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1981 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1965);
    float _1983 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1967);
    float _1985 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1987 = -_1977;
    float _1989 = _1987 + 1.0;
    float _1991 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1979);
    float _1993 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1995 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1997 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1999 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1991);
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2003 = abs(_1989);
    float _2005 = log2(_2003);
    float _2007 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1997);
    float _2009 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2011 = -_2001;
    float _2013 = fma(_2011, _1793, 1.0);
    float _2015 = _1971 * _1925;
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2007);
    float _2019 = _1971 * _1933;
    float _2021 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2017);
    float _2025 = _1971 * _1941;
    float _2027 = floor(_1957);
    float _2029 = -_1901;
    float _2031 = _1887 + _2029;
    float _2033 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2035 = -_2021;
    float _2037 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2035);
    float _2039 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2041 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2033);
    float _2043 = -_2019;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2037);
    float _2047 = log2(_2013);
    float _2049 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2051 = _2025 + 1.0;
    float _2053 = fma(_2045, -0.5, 0.5);
    float _2055 = fma(_2045, 0.5, 0.5);
    float _2057 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2049);
    float _2059 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2041);
    float _2061 = exp2(_2039);
    float _2063 = -_2027;
    float _2065 = _1957 + _2063;
    float _2067 = fma(_2055, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2071 = fma(_2055, _2067, -0.212114393711090087890625);
    float _2073 = 1.0 / _2023;
    float _2075 = _2047 * 0.693147182464599609375;
    float _2077 = fma(_2055, _2071, 1.570728778839111328125);
    float _2079 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2081 = sqrt(_2053);
    float _2083 = -_2025;
    float _2085 = fma(_2061, _2051, _2083);
    float _2087 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2059);
    float _2089 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2069);
    float _2091 = fma(_2085, 0.5, 0.5);
    float _2093 = _2087 * _2073;
    float _2095 = _2089 * _2073;
    float _2097 = fma(_2093, 0.5, 0.5);
    float _2099 = fma(_2095, -0.5, 0.5);
    float _2101 = _2081 * 0.636619746685028076171875;
    float2 _6614 = float2(_2031, _2065);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6614, float2(0.0), isnan(_6614)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6614, float2(0.0), isnan(_6614)), level(0.0)).x;
    float3 _6625 = float3(_2097, _2099, _2079);
    float _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6625, float3(0.0), isnan(_6625)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6625, float3(0.0), isnan(_6625)), level(0.0)).x;
    float _2107 = -_2077;
    float _2109 = fma(_2101, _2107, 1.0);
    float3 _6641 = float3(_2097, _2099, _2079);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6641, float3(0.0), isnan(_6641)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6641, float3(0.0), isnan(_6641)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float2 _6657 = float2(_2109, _2091);
    float3 _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6657, float2(0.0), isnan(_6657)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6657, float2(0.0), isnan(_6657)), level(0.0)).xyz;
    float _2126 = _2124.x;
    float _2128 = _2124.y;
    float _2130 = _2124.z;
    float _2132 = float(uint(_947));
    float _2134 = trunc(_1049);
    int _2136 = int(_2134);
    float _2138 = _1045 * _169;
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2142 = _2140 != 0;
    float _2144 = -_1009;
    float _2146 = _2144 + 1.0;
    bool _2148 = _779 > 0.5;
    out.m_78.x = _1329;
    out.m_78.y = _1325;
    out.m_78.z = _1291;
    bool _2150 = _159 > 0.5;
    float _2152 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = 1.0 / _2132;
    int _2156 = abs(_873);
    out.m_80.w = _1095;
    int _2158 = abs(_867);
    out.m_82.x = _1209;
    bool _2160 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2162 = isnan(_759);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = trunc(_2138);
    int _2174 = int(_2172);
    float _2176 = float(uint(_2136));
    float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2180 = _2178 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2182 = ~_947;
    int _2184 = _2182 + 1;
    float _2186 = -_2170;
    float _2188 = _2186 + 1.0;
    float _2190 = float(_2136);
    float _2192 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2194 = 1.0 / _2180;
    int _2196 = as_type<int>(_2154) + (-2);
    float _2198 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.x = _1647;
    out.m_84.y = _1645;
    out.m_84.z = _1649;
    int _2200 = ~_947;
    int _2202 = _2200 + 1;
    float _2204 = as_type<float>(_2196) * _2176;
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2208 = _2206 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2210 = exp2(_2152);
    float _2212 = trunc(_2204);
    float _2214 = precise::max(_2212, 0.0);
    uint _2217 = uint(_2214);
    float _2219 = 1.0 / _2208;
    int _2221 = ~_947;
    int _2223 = _2221 + 1;
    float _2225 = -_2210;
    float _2227 = _2225 + 1.0;
    float _2229 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2231 = _2184 * int(_2217);
    int _2233 = _2231 + _2136;
    float _2235 = float(uint(_2233));
    float _2237 = as_type<float>(_2196) * _2235;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2241 = _2239 != 0;
    float _2243 = trunc(_2237);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    bool _2249 = !_2241;
    float _2251 = _2249 ? 7.345489978790283203125 : 1.0;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2257 = _2251 * _159;
    bool _2259 = _2190 >= _1037;
    bool _2261 = isnan(_2190);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(_1037);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = floor(_2257);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2279 = _2277 != 0;
    int _2281 = int(_2217) + int(_2247);
    float _2283 = trunc(_2269);
    int _2285 = int(_2283);
    int _2287 = abs(_943);
    int _2289 = _2223 * _2281;
    int _2291 = _2289 + _2136;
    bool _2293 = !_2142;
    int _2295 = _2293 ? 0 : 1;
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2299 = _2297 != 0;
    float _2301 = -_2271;
    float _2303 = _2257 + _2301;
    bool _2305 = uint(_2291) >= uint(_947);
    float _2307 = 1.0 / _2255;
    int _2309 = abs(_2295);
    float _2311 = _2303 * _1037;
    bool _2313 = !_2305;
    int _2315 = _2313 ? 0 : (-1);
    bool _2317 = _947 == 0;
    int _2319 = ~_2281;
    int _2321 = _2319 + _2315;
    int _2323 = _2321 + 1;
    float _2325 = 1.0 / _2275;
    int _2327 = ~_2285;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    int _2333 = _947 * _2323;
    int _2335 = _2333 + _2136;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2337;
    bool _2341 = !_2317;
    int _2343 = _2341 ? _2335 : (-1);
    float _2345 = trunc(_2311);
    int _2347 = int(_2345);
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2353 = _2339 * _2307;
    bool _2355 = !_2279;
    int _2357 = _2355 ? 0 : 1;
    int _2359 = _2343 * _2331;
    int _2361 = _947 + (-1);
    float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2367 = abs(_2357);
    float _2369 = _2351 * _2325;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2373 = _2371 != 0;
    int _2375 = _2285 * _2361;
    int _2377 = _2375 + _2359;
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2381 = _759 + _2379;
    float _2383 = 1.0 / _2365;
    int _2385 = _2377 * _2156;
    float _2387 = fma(_2353, _2381, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2389 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2391 = isnan(_759);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2397 = _2393 || _2395;
    float _2399 = float(_2397);
    int _2401 = _2347 * _2367;
    int _2403 = _2401 + _2136;
    int _2405 = _2174 * _2158;
    int _2407 = _2405 + _2385;
    bool _2409 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2411 = isnan(_759);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    bool _2421 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2423 = isnan(_759);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    int _2433 = _2403 * _2287;
    int _2435 = _2433 + _2407;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2437;
    float _2441 = -_2419;
    float _2443 = _2441 + 1.0;
    bool _2445 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2447 = isnan(_759);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    float _2457 = -_2431;
    float _2459 = _2457 + 1.0;
    float _2461 = _2439 * _2383;
    float _2463 = _2399 * _2443;
    float _2465 = -_2399;
    float _2467 = _2465 + 1.0;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2473 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2475 = isnan(_759);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = _2431 * _2467;
    int _2487 = _2347 * _2309;
    int _2489 = _2487 + _2435;
    float _2491 = _2455 * _2459;
    float _2493 = -_2455;
    float _2495 = _2493 + 1.0;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2501 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2503 = isnan(_759);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2509 = _2505 || _2507;
    float _2511 = float(_2509);
    float _2513 = float(uint(_2489));
    float _2515 = _2483 * _2495;
    float _2517 = -_2483;
    float _2519 = _2517 + 1.0;
    float _2521 = 1.0 / _2499;
    float _2523 = as_type<float>(_2196) * _2513;
    float _2525 = _2511 * _2519;
    float _2527 = -_2511;
    float _2529 = _2527 + 1.0;
    bool _2531 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2533 = isnan(_759);
    bool _2535 = _2531 || _2533;
    bool _2537 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2539 = _2535 || _2537;
    float _2541 = float(_2539);
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2545 = _2543 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2547 = trunc(_2523);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = _2170 * _2529;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2555;
    float _2559 = _2541 * _2188;
    float _2561 = -_2541;
    float _2563 = _2561 + 1.0;
    float _2565 = _2471 * _2521;
    float _2567 = _2557 * _2194;
    float _2569 = _2387 * _2559;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2573 = _2571 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2575 = 1.0 / _2545;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2579 = _759 + _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2581;
    int _2585 = _2202 * int(_2551);
    int _2587 = _2585 + _2489;
    float _2589 = fma(_2369, _2579, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2591 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2569);
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2595 = _759 + _2593;
    float _2597 = float(uint(_2587));
    float _2599 = fma(_2589, _2553, _2591);
    float _2601 = fma(_2461, _2595, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2605 = _759 + _2603;
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2609 = _759 + _2607;
    float _2611 = as_type<float>(_2196) * _2597;
    float _2613 = float(uint(_2403));
    float _2615 = _2573 * _2575;
    float _2617 = _2583 * _2219;
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _759 + _2619;
    float _2623 = fma(_2601, _2525, _2599);
    float _2625 = trunc(_2611);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    float _2631 = as_type<float>(_2196) * _2613;
    float _2633 = fma(_2565, _2621, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2637 = _759 + _2635;
    float _2639 = fma(_2615, _2605, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2641 = fma(_2567, _2609, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2643 = fma(_2633, _2515, _2623);
    float _2645 = fma(_2617, _2637, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2647 = trunc(_2631);
    float _2649 = precise::max(_2647, 0.0);
    uint _2651 = uint(_2649);
    int _2653 = ~_947;
    int _2655 = _2653 + 1;
    float _2657 = fma(_2641, _2491, _2643);
    int _2659 = ~_947;
    int _2661 = _2659 + 1;
    float _2663 = -_231;
    int _2665 = _2150 ? as_type<int>(_2663) : as_type<int>(_231);
    float _2667 = fma(_2639, _2485, _2657);
    float _2669 = -_1051;
    float _2671 = _2669 + 1.0;
    int _2673 = int(_2551) + int(_2629);
    bool _2675 = !_2299;
    float _2677 = _2675 ? _231 : as_type<float>(_2665);
    float _2679 = fma(_2645, _2463, _2667);
    float _2681 = -_239;
    int _2683 = _2148 ? as_type<int>(_2681) : as_type<int>(_239);
    int _2685 = _2655 * _2673;
    int _2687 = _2685 + _2489;
    float _2689 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2679);
    int _2691 = _2661 * int(_2651);
    int _2693 = _2691 + _2403;
    bool _2695 = !_2373;
    float _2697 = _2695 ? _239 : as_type<float>(_2683);
    float _2699 = _2677 + 0.5;
    bool _2701 = uint(_2687) >= uint(_947);
    float _2703 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2705 = float(uint(_2693));
    float _2707 = _2697 + (-0.5);
    bool _2709 = !_2701;
    int _2711 = _2709 ? 0 : (-1);
    float _2713 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[80].x, _895);
    int _2715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2717 = _2715 != 0;
    float _2719 = as_type<float>(_2196) * _2705;
    int _2721 = ~_2673;
    int _2723 = _2721 + _2711;
    int _2725 = _2723 + 1;
    float _2727 = -_2707;
    float _2729 = -_927;
    float _2731 = fma(_2727, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2729);
    float _2733 = -_2671;
    float _2735 = fma(_2677, _2733, _2713);
    float _2737 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2739 = abs(_1657);
    float _2741 = log2(_2739);
    int _2743 = _947 * _2725;
    int _2745 = _2743 + _2489;
    float _2747 = fma(_2697, _2146, _2731);
    float _2749 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2751 = ~_947;
    int _2753 = _2751 + 1;
    out.m_86.x = _2689;
    bool _2755 = !_2317;
    int _2757 = _2755 ? _2745 : (-1);
    float _2759 = trunc(_2719);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    out.m_88.x = _2735;
    out.m_88.y = _2747;
    int _2765 = _2757 >> 31;
    int _2767 = _2757 & 3;
    bool _2769 = _2767 != 0;
    int _2771 = _2765 & 3;
    float _2773 = -_1235;
    float _2775 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2749);
    float _2777 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2779 = _1657 <= 8000.0;
    bool _2781 = isnan(_1657);
    bool _2783 = _2779 || _2781;
    bool _2785 = isnan(8000.0);
    bool _2787 = _2783 || _2785;
    float _2789 = float(_2787);
    int _2791 = _2757 + _2771;
    float _2793 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2775);
    float _2795 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = -_1235;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2737);
    int _2801 = _2791 >> 2;
    float _2803 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2805 = int(_2651) + int(_2763);
    float _2807 = -_1235;
    float _2809 = fma(_2807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    int _2811 = _2801 << 4;
    int _2813 = _2811 + 368;
    float _2815 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2799);
    float _2817 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2819 = _2753 * _2805;
    int _2821 = _2819 + _2403;
    uint _2823 = uint(int(uint(_2813) >> uint(2)));
    uint _2825 = uint(int(uint(int(_2823)) >> uint(2)));
    int _2827 = int(_2823) & 3;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[int(_2825)][_2827];
    int _2831 = int(_2823) + 1;
    uint _2833 = uint(int(uint(_2831) >> uint(2)));
    int _2835 = _2831 & 3;
    float _2837 = (*spvDescriptorSet0.vp_c9)._m0[int(_2833)][_2835];
    float _2839 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2192);
    float _2841 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2809);
    float _2843 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2817);
    bool _2845 = uint(_2821) >= uint(_947);
    float _2847 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2849 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2198);
    int _2851 = _2757 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2857 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2847);
    float _2859 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2839);
    bool _2861 = uint(_2851) > 1u;
    int _2863 = _2813 + 8;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    uint _2867 = uint(int(uint(int(_2865)) >> uint(2)));
    int _2869 = int(_2865) & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = int(_2865) + 1;
    uint _2875 = uint(int(uint(_2873) >> uint(2)));
    int _2877 = _2873 & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    float _2881 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2855);
    float _2883 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2803);
    float _2885 = _2703 * _2815;
    int _2887 = _2769 ? 0 : 1;
    float _2889 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2843);
    float _2891 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2849);
    bool _2893 = !_2845;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = exp2(_2777);
    int _2899 = ~_2887;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = _2703 * _2793;
    bool _2907 = uint(_2851) >= 2u;
    float _2909 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2911 = _2903;
    float _2913 = _2089;
    if (!_2861)
    {
        int _2915 = ~_2887;
        int _2917 = _2915 + 1;
        _2911 = _2917;
    }
    int _2919 = _2911;
    float _2921 = -_2103;
    float _2923 = _2921 + 1.0;
    bool _2925 = _2851 != 3;
    float _2927 = fma(_2909, _2859, _2885);
    int _2929 = ~_2805;
    int _2931 = _2929 + _2895;
    int _2933 = _2931 + 1;
    float _2935 = _2703 * _2841;
    bool _2937 = !_2853;
    int _2939 = _2937 ? 0 : 1;
    float _2941 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2857);
    int _2943 = _2907 ? 0 : 1;
    int _2945 = _947 * _2933;
    int _2947 = _2945 + _2403;
    int _2949 = abs(_2919);
    float _2951 = fma(_2909, _2889, _2905);
    int _2953 = abs(_2939);
    float _2955 = fma(_2909, _2891, _2935);
    int _2957 = ~_2943;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    float _2963 = _2087 + _2023;
    bool _2965 = _2851 != 3;
    float _2967 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2881);
    int _2969 = _2961;
    float _2971 = _2114;
    if (_2925)
    {
        int _2973 = ~_2943;
        int _2975 = _2973 + 1;
        _2969 = _2975;
    }
    int _2977 = _2969;
    float _2979 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2883);
    int _2981 = ~_2949;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = _2963 * 0.5;
    bool _2989 = !_2965;
    int _2991 = _2989 ? 0 : (-1);
    int _2993 = _2985 * as_type<int>(_2837);
    int _2995 = abs(_2977);
    int _2997 = ~_2953;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3005 = precise::clamp(_3003, 0.0, 1.0);
    bool _3007 = !_2717;
    int _3009 = _3007 ? 0 : 1;
    int _3011 = abs(_2991);
    int _3013 = _3001 * as_type<int>(_2829);
    int _3015 = _3013 + _2993;
    int _3017 = abs(_3009);
    float _3019 = fma(_3005, -2.0, 3.0);
    float _3021 = _3005 * _3005;
    int _3023 = ~_2995;
    int _3025 = _3023 + 1;
    int _3027 = _3025 + 1;
    float _3029 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3031 = ~_3011;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    float _3037 = _3021 * _3019;
    int _3039 = _3027 * as_type<int>(_2871);
    int _3041 = _3039 + _3015;
    float _3043 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3029);
    float _3045 = in.m_90.x;
    int _3047 = ~_3017;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = _3035 * as_type<int>(_2879);
    int _3055 = _3053 + _3041;
    float _3057 = -_3037;
    float _3059 = _3057 + 1.0;
    float _3061 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3043);
    bool _3063 = !_2317;
    int _3065 = _3063 ? _2947 : (-1);
    int _3067 = _3055 * _3051;
    float _3069 = fma(_3059, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3037);
    float _3071 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3061);
    int _3073 = _3065 * _3017;
    int _3075 = _3073 + _3067;
    float _3077 = _2789 * _3069;
    float _3079 = _3071 + _2023;
    out.gl_Position.x = _2087;
    out.gl_Position.y = _2089;
    out.gl_Position.z = _3071;
    out.gl_Position.w = _2023;
    float _3081 = _2967 + _2951;
    float _3083 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3085 = float(_3075);
    float _3087 = _2023 * 0.5;
    float _3089 = _2923 * _3083;
    float _3091 = precise::clamp(_3089, 0.0, 1.0);
    float _3093 = _3079 * 0.5;
    float _3095 = fma(_2089, -0.5, _3087);
    float _3097 = _2941 + _2927;
    float _3099 = -_3091;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3103 = _2979 + _2955;
    bool _3105 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3107 = isnan(_1799);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3113 = _3109 || _3111;
    out.m_92.x = _2987;
    out.m_92.y = _3095;
    out.m_92.z = _3093;
    out.m_92.w = _2023;
    float _3115 = _2229 * _2105;
    float _3117 = _3101 * _3045;
    float _3119 = -_2229;
    float _3121 = _3119 + 1.0;
    out.m_94.x = _3097;
    out.m_94.y = _3081;
    out.m_94.z = _3103;
    float _3123 = _2120 * _3115;
    float _3125 = _2130 * _3115;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3129 = _2120 * _3121;
    float _3131 = fma(_2126, _3123, _2114);
    float _3133 = fma(_2128, _3123, _2116);
    float _3135 = fma(_2120, _3125, _2118);
    out.m_96.x = _3127;
    float _3137 = _1713 * _1775;
    float _3139 = _3071;
    float _3141 = _3115;
    float _3143 = _3137;
    float _3145 = _3085;
    if (!_3113)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3147 = _2913;
    out.m_98.x = _3131;
    out.m_98.y = _3133;
    out.m_98.z = _3135;
    out.m_98.w = _3129;
    float _3149 = _3137 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3151 = _3147;
    float _3153 = _3147;
    if (!_3113)
    {
        _2971 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3155 = _2971;
    out.m_100.x = _3085;
    float _3157 = _3155;
    float _3159 = _3155;
    if (!_3113)
    {
        _3139 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3161 = _3139;
    float _3163 = _3161;
    float _3165 = _3161;
    if (!_3113)
    {
        _3141 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3167 = _3141;
    float _3169 = _3167;
    float _3171 = _3167;
    if (!_3113)
    {
        _3143 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3173 = _3143;
    float _3175 = _3173;
    float _3177 = _3173;
    if (!_3113)
    {
        _3145 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3179 = _3145;
    bool _3181 = !_3113;
    float _3183 = _3179;
    float _3185 = _3179;
    if (!_3181)
    {
        bool _3187 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3189 = isnan(_1799);
        bool _3191 = _3187 || _3189;
        bool _3193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3195 = _3191 || _3193;
        if (!_3195)
        {
            float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3199 = _1799 + _3197;
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3203 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3201;
            float _3205 = 1.0 / _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3227 = _3199 * _3205;
            float _3229 = precise::clamp(_3227, 0.0, 1.0);
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3235 = fma(_3229, _3209, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3237 = fma(_3229, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3239 = fma(_3229, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3241 = fma(_3229, _3217, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3243 = fma(_3229, _3221, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3245 = fma(_3229, _3225, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3159 = _3235;
            _3185 = _3243;
            _3153 = _3237;
            _3171 = _3241;
            _3165 = _3239;
            _3177 = _3245;
            _3247 = true;
        }
        else
        {
            bool _3249 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3251 = isnan(_1799);
            bool _3253 = _3249 || _3251;
            bool _3255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3257 = _3253 || _3255;
            if (!_3257)
            {
                _3151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3259 = _3151;
            _3153 = _3259;
            if (!_3257)
            {
                _3157 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3261 = _3157;
            _3159 = _3261;
            if (!_3257)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3263 = _3163;
            _3165 = _3263;
            if (!_3257)
            {
                _3169 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3265 = _3169;
            _3171 = _3265;
            if (!_3257)
            {
                _3183 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3267 = _3183;
            _3185 = _3267;
            if (!_3257)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3269 = _3175;
            bool _3271 = !_3257;
            _3177 = _3269;
            if (!_3271)
            {
                bool _3273 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3275 = isnan(_1799);
                bool _3277 = _3273 || _3275;
                bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3281 = _3277 || _3279;
                if (!_3281)
                {
                    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3285 = _1799 + _3283;
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3289 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3287;
                    float _3291 = 1.0 / _3289;
                    float _3293 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3313 = _3285 * _3291;
                    float _3315 = precise::clamp(_3313, 0.0, 1.0);
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3321 = fma(_3315, _3295, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3323 = fma(_3315, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3325 = fma(_3315, _3299, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3327 = fma(_3315, _3303, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3329 = fma(_3315, _3307, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3331 = fma(_3315, _3311, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3159 = _3321;
                    _3185 = _3329;
                    _3153 = _3323;
                    _3171 = _3327;
                    _3165 = _3325;
                    _3177 = _3331;
                    _3247 = true;
                }
                else
                {
                    _3159 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3185 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3171 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3247 = false;
    float _3333 = _3159;
    float _3335 = _3185;
    float _3337 = _3153;
    float _3339 = _3171;
    float _3341 = _3165;
    float _3343 = _3177;
    float _3345 = fma(_3081, -0.5, 0.5);
    float _3347 = precise::clamp(_3345, 0.0, 1.0);
    float _3349 = -_3333;
    float _3351 = _3349 + _3335;
    float _3353 = _3149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3355 = -_3337;
    float _3357 = _3355 + _3339;
    out.m_102.x = 0.0;
    float _3359 = fma(_3347, _3351, _3333);
    float _3361 = fma(_3347, _3357, _3337);
    out.m_53.x = _3353;
    float _3363 = -_3341;
    float _3365 = _3363 + _3343;
    float _3367 = _3359 * 0.586610972881317138671875;
    bool _3369 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3371 = fma(_3347, _3365, _3341);
    float _3373 = fma(_3361, 0.298911988735198974609375, _3367);
    bool _3375 = _1713 > 0.0;
    bool _3377 = isnan(_1713);
    bool _3379 = _3375 || _3377;
    bool _3381 = isnan(0.0);
    bool _3383 = _3379 || _3381;
    float _3385 = fma(_3371, 0.114477999508380889892578125, _3373);
    bool _3387 = _1775 <= 0.0;
    bool _3389 = !_3383;
    bool _3391 = _3387 || _3389;
    float _3393 = -_3385;
    float _3395 = _3361 + _3393;
    float _3397 = -_3385;
    float _3399 = _3359 + _3397;
    float _3401 = -_3385;
    float _3403 = _3371 + _3401;
    float _3405 = fma(_3395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    float _3407 = fma(_3399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    float _3409 = fma(_3403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    bool _3411 = !_3369;
    if (!_3411)
    {
        float _3413 = -_1645;
        float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3417 = -_1647;
        float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3421 = -_1649;
        float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3425 = _3415 * _3415;
        float _3427 = fma(_3419, _3419, _3425);
        float _3429 = fma(_3423, _3423, _3427);
        float _3431 = sqrt(_3429);
        float _3433 = rsqrt(_3429);
        float _3435 = -_3431;
        float _3437 = _3435 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3439 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3441 = precise::clamp(_3439, 0.0, 1.0);
        float _3443 = _3419 * _3433;
        float _3445 = _3415 * _3433;
        float _3447 = abs(_3441);
        float _3449 = log2(_3447);
        float _3451 = _3423 * _3433;
        float _3453 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3455 = _3081 * _3445;
        float _3457 = -_3445;
        float _3459 = -_3453;
        float _3461 = fma(_3457, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3459);
        float _3463 = fma(_3097, _3443, _3455);
        float _3465 = -_3451;
        float _3467 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3461);
        float _3469 = fma(_3103, _3451, _3463);
        float _3471 = precise::clamp(_3469, 0.0, 1.0);
        float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3475 = _3467 + _3473;
        float _3477 = _3449 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3479 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3481 = precise::clamp(_3479, 0.0, 1.0);
        float _3483 = exp2(_3477);
        float _3485 = _3483 * _3481;
        float _3487 = _3471 * _3485;
        float _3489 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3491 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3493 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3489;
        out.m_102.y = _3491;
        out.m_102.z = _3493;
    }
    out.m_80.x = _3405;
    out.m_80.y = _3407;
    out.m_80.z = _3409;
    if (!_3391)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3495 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3495;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3247 = false;
    bool _641 = false;
    bool _469 = false;
    bool _363 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = as_type<float>(_123);
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3564 = as_type<float>(_145);
        out.gl_Position.z = _3564;
    }
    if (!_131)
    {
        return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = in.m_55.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _147 = as_type<int>(_173);
    }
    int _175 = _147;
    float _177 = _127 * _169;
    out.m_57.x = _159;
    float _179 = _177;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3629 = as_type<float>(_175);
        out.gl_Position.z = _3629;
    }
    out.m_51.x = _177;
    if (_167)
    {
        return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    float _201 = in.m_68.x;
    float _203 = in.m_68.y;
    float _205 = in.m_68.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = _185 * _191;
    float _219 = _185 * _197;
    float _221 = fma(_183, _189, _217);
    float _223 = _185 * _203;
    float _225 = fma(_183, _195, _219);
    float _227 = fma(_187, _193, _221);
    bool _229 = !_209;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_183, _201, _223);
    float _235 = fma(_187, _199, _225);
    bool _237 = !_213;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = fma(_187, _205, _233);
    bool _243 = !_215;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _177;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = in.m_70.x;
    float _271 = in.m_70.y;
    bool _273 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_263);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_283;
    float _303 = _301 + 1.0;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = 1.0 / _287;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = _299 * _303;
    float _315 = -_299;
    float _317 = _315 + 1.0;
    float _319 = _267 * _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = fma(_307, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = _325 * _313;
    float _331 = _327 * _313;
    float _333 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _335 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _337 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].x, _333);
    float _339 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].y, _335);
    float _341 = _337 * _269;
    float _343 = _339 * _271;
    bool _345 = !_311;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        _361 = _177;
    }
    _363 = false;
    float _365 = _361;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _365 + _367;
    bool _371 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _373 = isnan(_365);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _383;
    bool _387 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _389 = isnan(_365);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_381;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _403;
    float _407 = 1.0 / _385;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = _397 * _401;
    float _413 = -_397;
    float _415 = _413 + 1.0;
    float _417 = _369 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _419;
    float _423 = fma(_405, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _425;
    float _429 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = _423 * _411;
    float _433 = fma(_427, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _429 * _411;
    float _437 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _431);
    float _439 = _433 * _411;
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _435);
    float _443 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].x, _437);
    float _445 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].z, _441);
    float _449 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].y, _445);
    bool _451 = !_409;
    float _467;
    if (!_451)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _455 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        _467 = _177;
    }
    _469 = false;
    float _471 = _467;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _471 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _483 = isnan(_471);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _501 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _503 = isnan(_471);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = 1.0 / _479;
    float _515 = -_491;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    bool _523 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _525 = isnan(_471);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = _511 * _517;
    float _537 = -_511;
    float _539 = _537 + 1.0;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _543 = 1.0 / _495;
    float _545 = _533 * _539;
    float _547 = -_533;
    float _549 = _547 + 1.0;
    float _551 = 1.0 / _499;
    float _553 = _521 * _513;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _559 = fma(_553, _475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _561 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = isnan(_471);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _557 * _543;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _581 = _471 + _579;
    float _583 = _559 * _545;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _587 = _471 + _585;
    float _589 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _591 = fma(_573, _581, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _593 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[115].x, _583);
    float _595 = _577 * _551;
    float _597 = -_571;
    float _599 = _597 + 1.0;
    float _601 = fma(_591, _535, _593);
    float _603 = fma(_595, _587, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _605 = _491 * _599;
    float _607 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = fma(_603, _605, _601);
    float _611 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[118].x, _609);
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _617 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _619;
    out.m_72.y = _613;
    out.m_72.z = _615;
    out.m_72.w = _621;
    bool _623 = !_541;
    float _639;
    if (!_623)
    {
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _627 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        _639 = _177;
    }
    _641 = false;
    float _643 = _639;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _647 = _643 + _645;
    bool _649 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _651 = isnan(_643);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _661;
    bool _665 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _667 = isnan(_643);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _681;
    float _685 = 1.0 / _663;
    float _687 = _675 * _679;
    float _689 = -_675;
    float _691 = _689 + 1.0;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _697 = _647 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _699;
    float _703 = fma(_683, _697, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = fma(_701, _697, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _711 = _703 * _687;
    float _713 = fma(_707, _697, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _715 = _709 * _687;
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].x, _711);
    float _719 = _713 * _687;
    float _721 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].z, _715);
    float _723 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].x, _717);
    float _725 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].y, _719);
    float _727 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].z, _721);
    float _729 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _731 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].y, _725);
    float _733 = _727 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _739 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _735;
    out.m_74.y = _741;
    out.m_74.z = _739;
    out.m_74.w = _695;
    bool _743 = !_693;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _747 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _179 = _757;
    }
    float _759 = _179;
    float _761 = in.m_46.x;
    float _763 = in.m_46.y;
    float _765 = in.m_46.z;
    float _767 = _159 * 2.0;
    float _769 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _771 = log2(_769);
    float _773 = in.m_55.z;
    float _775 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _777 = _343 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = in.m_55.y;
    float _781 = floor(_767);
    float _783 = in.m_64.w;
    float _785 = in.m_68.w;
    float _787 = _771 * _127;
    float _789 = _191 * _763;
    float _791 = _197 * _763;
    float _793 = _203 * _763;
    float _795 = fma(_189, _761, _789);
    float _797 = fma(_195, _761, _791);
    float _799 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _801 = _781 > 0.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _805 = _781 >= 0.0;
    bool _807 = isnan(_781);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _817 = in.m_66.w;
    float _819 = -_803;
    float _821 = fma(_799, 2.0, _819);
    float _823 = fma(_193, _765, _795);
    float _825 = _773 * 2.0;
    float _827 = _779 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _829 = exp2(_787);
    float _831 = fma(_201, _761, _793);
    float _833 = fma(_199, _765, _797);
    float _835 = fma(_827, -2.0, _815);
    float _837 = _779 * 2.0;
    float _839 = fma(_205, _765, _831);
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _851 = _849 != 0;
    float _853 = _779 + _773;
    float _855 = floor(_825);
    int _857 = _813 ? 0 : 1;
    float _859 = _159 + _779;
    float _861 = _853 + (-1.0);
    float _863 = _859 + (-1.0);
    bool _865 = !_843;
    int _867 = _865 ? 0 : 1;
    float _869 = floor(_837);
    bool _871 = !_847;
    int _873 = _871 ? 0 : 1;
    float _875 = -_829;
    float _877 = _875 + 1.0;
    float _879 = _833 + _817;
    float _881 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _883 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(0.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = -_127;
    float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[76].x, _821);
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _899 = int(_897);
    bool _901 = _855 > 0.0;
    float _903 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _905 = _855 >= 0.0;
    bool _907 = isnan(_855);
    bool _909 = _905 || _907;
    bool _911 = isnan(0.0);
    bool _913 = _909 || _911;
    float _915 = _823 + _783;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _919 = _879 + _917;
    int _921 = _913 ? 0 : 1;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _925 = _869 > 0.0;
    float _927 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _835);
    bool _929 = _869 >= 0.0;
    bool _931 = isnan(_869);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    float _939 = _839 + _785;
    bool _941 = !_851;
    int _943 = _941 ? 0 : 1;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _947 = int(_945);
    int _949 = ~_921;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _957 = _915 + _955;
    float _959 = _891 ? _877 : 0.0;
    float _961 = _919 * _919;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _973 = _971 != 0;
    float _975 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[78].w, _923);
    int _977 = _953;
    float _979 = _939;
    if (!_901)
    {
        int _981 = ~_921;
        int _983 = _981 + 1;
        _977 = _983;
    }
    int _985 = _977;
    float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _989 = _939 + _987;
    bool _991 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _993 = isnan(1.0);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _999 = _995 || _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1003 = 1.0 + _1001;
    float _1005 = float(_899);
    float _1007 = fma(_957, _957, _961);
    float _1009 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _975);
    float _1011 = 1.0 / _1005;
    bool _1013 = !_965;
    int _1015 = _1013 ? 0 : 1;
    float _1017 = fma(_989, _989, _1007);
    bool _1019 = !_969;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1025 = abs(_1015);
    int _1027 = abs(_1021);
    float _1029 = 1.0 / _1003;
    float _1031 = in.m_76.x;
    float _1033 = in.m_76.y;
    float _1035 = in.m_76.z;
    float _1037 = float(_947);
    float _1039 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1023);
    float _1041 = float(_1025);
    float _1043 = float(_985);
    float _1045 = _1037 * _127;
    float _1047 = sqrt(_1017);
    float _1049 = _1011 * _127;
    float _1051 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _1053 = _1041 * _1043;
    int _1055 = ~_857;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1059;
    if (!_801)
    {
        int _1063 = ~_857;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    if (_999)
    {
        float _1069 = _959 * _1029;
        _137 = _1069;
    }
    float _1071 = _137;
    float _1073 = rsqrt(_1017);
    float _1075 = _1053 * (-2.0);
    float _1077 = float(_1067);
    float _1079 = _775 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1081 = float(_1027);
    float _1083 = fma(_881, _1075, _881);
    float _1085 = _1047 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1087 = fma(_1075, _1031, _1031);
    int _1089 = _937 ? 0 : 1;
    float _1091 = _1081 * _1077;
    float _1093 = _159 + (-0.5);
    float _1095 = precise::min(_1079, _1085);
    float _1097 = _1091 * (-2.0);
    float _1099 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1087);
    bool _1101 = !_973;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = _1073 * _1095;
    float _1107 = fma(_903, _1097, _903);
    float _1109 = fma(_1097, _1033, _1033);
    float _1111 = fma(_1083, _1071, _1099);
    int _1113 = ~_1089;
    int _1115 = _1113 + 1;
    int _1117 = _1115 + 1;
    float _1119 = _919 * _1105;
    int _1121 = abs(_1103);
    float _1123 = _779 + (-0.5);
    int _1125 = _1117;
    if (!_925)
    {
        int _1127 = ~_1089;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    float _1133 = _1111 * 0.15915493667125701904296875;
    float _1135 = _957 * _1105;
    float _1137 = -_1119;
    float _1139 = _919 + _1137;
    float _1141 = float(_1131);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1109);
    float _1145 = float(_1121);
    float _1147 = -_1135;
    float _1149 = _957 + _1147;
    float _1151 = _1139 * _1139;
    float _1153 = fma(_1107, _1071, _1143);
    float _1155 = _159 + _773;
    float _1157 = _1145 * _1141;
    float _1159 = fma(_1149, _1149, _1151);
    float _1161 = _989 * _1105;
    float _1163 = _1155 + (-1.0);
    float _1165 = _1157 * (-2.0);
    float _1167 = _773 + (-0.5);
    float _1169 = -_1161;
    float _1171 = _989 + _1169;
    float _1173 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1175 = fma(_1165, _1035, _1035);
    float _1177 = _1153 * 0.15915493667125701904296875;
    float _1179 = fma(_1171, _1171, _1159);
    float _1181 = fma(_1173, _1165, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1175);
    float _1185 = _1133 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = fma(_1181, _1071, _1183);
    float _1191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _239);
    float _1193 = _1189 * 0.15915493667125701904296875;
    float _1195 = sqrt(_1179);
    float _1197 = _1177 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1177 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1073 * _1195;
    float _1207 = _777 * _1205;
    float _1209 = _775 * _1205;
    float _1211 = _1133 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1207 * _1191;
    float _1217 = _1187 * _1199;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1221 = _1219 * 0.5;
    float _1223 = _1193 * 6.283185482025146484375;
    float _1225 = cos(_1223);
    float _1227 = _1187 * _1203;
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _1231 = _1209 * _1229;
    float _1233 = _1193 * 6.283185482025146484375;
    float _1235 = sin(_1233);
    float _1237 = _1213 * _1199;
    float _1239 = _1213 * _1203;
    float _1241 = _1187 * _1225;
    float _1243 = _1213 * _1225;
    float _1245 = _1203 * _1225;
    float _1247 = _1199 * _1225;
    float _1249 = _1241 * _1215;
    float _1251 = _1243 * _1215;
    float _1253 = fma(_1235, _1227, _1237);
    float _1255 = -_1239;
    float _1257 = fma(_1235, _1217, _1255);
    float _1259 = -_1215;
    float _1261 = _1235 * _1259;
    float _1263 = -_1217;
    float _1265 = fma(_1235, _1239, _1263);
    float _1267 = fma(_1253, _1231, _1249);
    float _1269 = fma(_1235, _1237, _1227);
    float _1271 = fma(_1245, _1231, _1261);
    float _1273 = fma(_1265, _1231, _1251);
    float _1275 = fma(_1257, _1221, _1267);
    float _1277 = fma(_1247, _1221, _1271);
    float _1279 = fma(_1269, _1221, _1273);
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1285 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1281);
    float _1287 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1283);
    float _1289 = -_1161;
    float _1291 = _939 + _1289;
    float _1293 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1285);
    float _1295 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1287);
    float _1297 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1299 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1301 = _939 + _1297;
    float _1303 = _915 + _1299;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1303 + _1309;
    float _1313 = _1307 * _1307;
    float _1315 = fma(_1311, _1311, _1313);
    float _1317 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1319 = sqrt(_1315);
    float _1321 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1317);
    float _1323 = -_1119;
    float _1325 = _879 + _1323;
    float _1327 = -_1135;
    float _1329 = _915 + _1327;
    float _1331 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1321);
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1335 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1333);
    float _1339 = _879 + _1335;
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1337);
    bool _1343 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = _1335;
    float _1347 = _1331;
    float _1349 = _1303;
    float _1351 = _1311;
    if (!_1343)
    {
        _1345 = _1301;
    }
    float _1353 = _1345;
    float _1355 = _1353;
    if (!_1343)
    {
        _1347 = _1339;
    }
    float _1357 = _1347;
    bool _1359 = !_1343;
    float _1361 = _1357;
    if (!_1359)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1367 = _1319 + _1365;
        float _1369 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = _1367 * _1363;
        float _1373 = rsqrt(_1315);
        float _1375 = _1371 * 0.15915493667125701904296875;
        float _1377 = _1375 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 + (-1.0);
        float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = fma(_1383, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = fma(_1339, _1379, _1387);
        float _1393 = _1373 * _1389;
        float _1395 = fma(_1311, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1307, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1361 = _1391;
        _1349 = _1395;
        _1355 = _1397;
    }
    float _1399 = _1361;
    float _1401 = _1349;
    float _1403 = _1355;
    float _1405 = -_879;
    float _1407 = _1405 + _1399;
    float _1409 = -_915;
    float _1411 = _1409 + _1401;
    float _1413 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1415 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1417 = _1407 * _1407;
    float _1419 = -_939;
    float _1421 = _1419 + _1403;
    float _1423 = 1.0 / _1413;
    float _1425 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1415);
    float _1427 = fma(_1411, _1411, _1417);
    float _1429 = -_1135;
    float _1431 = _1429 + _1401;
    float _1433 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1425);
    float _1435 = fma(_1421, _1421, _1427);
    float _1437 = -_1161;
    float _1439 = _1437 + _1403;
    float _1441 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1443 = sqrt(_1435);
    bool _1445 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1447 = isnan(0.5);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1453 = _1449 || _1451;
    float _1455 = _1441 + _1413;
    float _1457 = -_1119;
    float _1459 = _1457 + _1399;
    bool _1461 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1463 = isnan(0.5);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1469 = _1465 || _1467;
    float _1471 = _1455 * _1423;
    float _1473 = _1471 * 0.5;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1477 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1475);
    bool _1479 = _1443 > 0.0;
    float _1481 = 1.0 / _1477;
    float _1483 = _1443;
    float _1485 = _1473;
    float _1487 = _1403;
    float _1489 = _1423;
    float _1491 = _1439;
    float _1493 = _1431;
    float _1495 = _1411;
    if (!_1479)
    {
        _1483 = _1431;
    }
    float _1497 = _1483;
    float _1499 = _1497;
    if (!_1479)
    {
        _1485 = _1459;
    }
    float _1501 = _1485;
    float _1503 = _1501;
    if (!_1479)
    {
        _979 = _1439;
    }
    float _1505 = _979;
    bool _1507 = !_1479;
    float _1509 = _1505;
    float _1511 = _1505;
    if (!_1507)
    {
        float _1513 = _235 * _235;
        float _1515 = fma(_227, _227, _1513);
        float _1517 = rsqrt(_1435);
        float _1519 = fma(_241, _241, _1515);
        float _1521 = sqrt(_1519);
        float _1523 = _1411 * _1517;
        float _1525 = _1407 * _1517;
        float _1527 = _1421 * _1517;
        bool _1529 = _1521 > 0.0;
        float _1531 = _1517;
        float _1533 = _1521;
        _1487 = _1523;
        _1489 = _1525;
        if (!_1529)
        {
            _1531 = _1431;
        }
        float _1535 = _1531;
        _1499 = _1535;
        if (!_1529)
        {
            _1533 = _1459;
        }
        float _1537 = _1533;
        _1503 = _1537;
        if (!_1529)
        {
            _1509 = _1439;
        }
        float _1539 = _1509;
        bool _1541 = !_1529;
        _1511 = _1539;
        if (!_1541)
        {
            float _1543 = rsqrt(_1519);
            float _1545 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1547 = _235 * _1543;
            float _1549 = _227 * _1543;
            float _1551 = _1525 * _1547;
            float _1553 = _241 * _1543;
            float _1555 = fma(_1523, _1549, _1551);
            float _1557 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1559 = fma(_1527, _1553, _1555);
            float _1561 = _1559 * _1557;
            float _1563 = fma(_227, _1561, _1431);
            float _1565 = fma(_235, _1561, _1459);
            float _1567 = fma(_241, _1561, _1439);
            _1499 = _1563;
            _1503 = _1565;
            _1511 = _1567;
        }
    }
    float _1569 = _1499;
    float _1571 = _1503;
    float _1573 = _1511;
    float _1575 = _1487;
    float _1577 = _1489;
    float _1579 = _1575;
    float _1581 = _1571;
    float _1583 = _1569;
    float _1585 = _1573;
    float _1587 = _1577;
    if (_1469)
    {
        _1491 = 1.0;
    }
    float _1589 = _1491;
    float _1591 = _1589;
    if (!_1453)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _1325 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _1329 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1595 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1607 = _1291 + _1605;
        float _1609 = fma(_1599, _1599, _1603);
        float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1613 = fma(_1607, _1607, _1609);
        float _1615 = sqrt(_1613);
        float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1619 = precise::min(_1615, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1621 = _1619 * _1611;
        float _1623 = -_1329;
        float _1625 = _1623 + _1569;
        float _1627 = _1617 * _1621;
        float _1629 = -_1325;
        float _1631 = _1629 + _1571;
        float _1633 = -_1291;
        float _1635 = _1633 + _1573;
        float _1637 = fma(_1625, _1627, _1329);
        float _1639 = fma(_1631, _1627, _1325);
        float _1641 = fma(_1635, _1627, _1291);
        _1579 = _1611;
        _1581 = _1639;
        _1583 = _1637;
        _1585 = _1641;
    }
    float _1643 = _1579;
    float _1645 = _1581;
    float _1647 = _1583;
    float _1649 = _1585;
    float _1651 = _1643;
    if (_1469)
    {
        _1587 = 1.0;
    }
    float _1653 = _1587;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1657 = _1481 * _1655;
    float _1659 = _1653;
    if (!_1469)
    {
        float _1661 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1661 * 0.15915493667125701904296875;
        float _1665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1667;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1665 * 0.15915493667125701904296875;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = 1.0 / _1673;
        float _1683 = _1675 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = _1675 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = 1.0 / _1669;
        float _1697 = 1.0 / _1693;
        float _1699 = _1691 * _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = fma(_1657, _1699, _1701);
        float _1705 = _1703 * _1695;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        _1651 = _1695;
        _1493 = _1663;
        _1591 = _1707;
    }
    float _1709 = _1651;
    float _1711 = _1493;
    float _1713 = _1591;
    float _1715 = _1711;
    float _1717 = _1709;
    if (!_1469)
    {
        float _1719 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = _1719 * 0.15915493667125701904296875;
        float _1723 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1725 = _1721 * 6.283185482025146484375;
        float _1727 = cos(_1725);
        float _1729 = _1723 * 0.15915493667125701904296875;
        float _1731 = _1721 * 6.283185482025146484375;
        float _1733 = sin(_1731);
        float _1735 = 1.0 / _1727;
        float _1737 = _1729 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = _1733 * _1735;
        float _1743 = _1729 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = _1739 * _1741;
        float _1749 = 1.0 / _1747;
        float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1753 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1751;
        float _1755 = 1.0 / _1753;
        float _1757 = _1745 * _1749;
        float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1761 = fma(_1657, _1757, _1759);
        float _1763 = _1761 * _1755;
        float _1765 = precise::clamp(_1763, 0.0, 1.0);
        float _1767 = -_1765;
        float _1769 = _1767 + 1.0;
        _1715 = _1747;
        _1717 = _1735;
        _1659 = _1769;
    }
    float _1771 = _1715;
    float _1773 = _1717;
    float _1775 = _1659;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1645 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1783 = _1647 + _1781;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1787 = _1649 + _1785;
    float _1789 = _1779 * _1779;
    float _1791 = fma(_1783, _1783, _1789);
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1795 = fma(_1787, _1787, _1791);
    float _1797 = rsqrt(_1795);
    float _1799 = sqrt(_1795);
    float _1801 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1803 = _1783 * _1801;
    float _1805 = _1787 * _1801;
    float _1807 = _1803 * _1803;
    float _1809 = _1805 * _1805;
    float _1811 = _1807 + _1809;
    float _1813 = sqrt(_1811);
    bool _1815 = _1813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1819 = _1813 + _1817;
    float _1821 = _1787;
    float _1823 = _1811;
    float _1825 = _1819;
    float _1827 = _1771;
    float _1829 = _1801;
    float _1831 = _1789;
    if (_1815)
    {
        float _1833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1821 = _1833;
    }
    float _1835 = _1821;
    if (_1815)
    {
        float _1837 = rsqrt(_1811);
        _1823 = _1837;
    }
    float _1839 = _1823;
    float _1841 = _1839;
    if (_1815)
    {
        float _1843 = _1819 * _1835;
        _1825 = _1843;
    }
    float _1845 = _1825;
    if (_1815)
    {
        float _1847 = _1845 * 0.15915493667125701904296875;
        _1827 = _1847;
    }
    float _1849 = _1827;
    float _1851 = _1835;
    float _1853 = _1849;
    if (_1815)
    {
        float _1855 = _1849 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        _1851 = _1857;
    }
    float _1859 = _1851;
    float _1861 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1863 = precise::max(0.0, _1861);
    float _1865 = _1773;
    if (_1815)
    {
        float _1867 = _1849 * 6.283185482025146484375;
        float _1869 = cos(_1867);
        _1865 = _1869;
    }
    float _1871 = _1865;
    float _1873 = -_1801;
    float _1875 = -_1863;
    float _1877 = fma(_1779, _1873, _1875);
    if (_1815)
    {
        float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1829 = _1879;
    }
    float _1881 = _1829;
    float _1883 = _1881;
    if (!_1815)
    {
        _1853 = _1809;
    }
    float _1885 = _1853;
    float _1887 = fma(_1329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1889 = _1859;
    float _1891 = _1885;
    if (_1815)
    {
        float _1893 = fma(_1859, _1881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1883 = _1893;
    }
    float _1895 = _1883;
    float _1897 = _1895;
    if (!_1815)
    {
        _1889 = _1803;
    }
    float _1899 = _1889;
    float _1901 = floor(_1887);
    float _1903 = _1899;
    if (_1815)
    {
        float _1905 = _1871 + (-1.0);
        _1831 = _1905;
    }
    float _1907 = _1831;
    float _1909 = _1907;
    if (_1815)
    {
        float _1911 = _1839 * _1895;
        _1351 = _1911;
    }
    float _1913 = _1351;
    if (!_1815)
    {
        _1897 = _1877;
    }
    float _1915 = _1897;
    float _1917 = _1915;
    if (_1815)
    {
        float _1919 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1495 = _1919;
    }
    float _1921 = _1495;
    if (_1815)
    {
        float _1923 = _1803 * _1913;
        _1903 = _1923;
    }
    float _1925 = _1903;
    if (!_1815)
    {
        _1909 = _1805;
    }
    float _1927 = _1909;
    float _1929 = _1927;
    if (_1815)
    {
        float _1931 = _1805 * _1913;
        _1929 = _1931;
    }
    float _1933 = _1929;
    if (!_1815)
    {
        _1841 = _1807;
    }
    float _1935 = _1841;
    float _1937 = _1935;
    if (_1815)
    {
        float _1939 = fma(_1877, _1871, _1921);
        _1917 = _1939;
    }
    float _1941 = _1917;
    if (_1815)
    {
        float _1943 = _1925 * _1925;
        _1937 = _1943;
    }
    float _1945 = _1937;
    if (_1815)
    {
        float _1947 = _1933 * _1933;
        _1891 = _1947;
    }
    float _1949 = _1891;
    float _1951 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1953 = fma(_1941, _1941, _1945);
    float _1955 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1957 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1959 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = _1953 + _1949;
    float _1963 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1951);
    float _1965 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1955);
    float _1967 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1969 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1963);
    float _1971 = rsqrt(_1961);
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1975 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1973);
    float _1977 = precise::clamp(_1975, 0.0, 1.0);
    float _1979 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1981 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1965);
    float _1983 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1967);
    float _1985 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1987 = -_1977;
    float _1989 = _1987 + 1.0;
    float _1991 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1979);
    float _1993 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1995 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1997 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1999 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1991);
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2003 = abs(_1989);
    float _2005 = log2(_2003);
    float _2007 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1997);
    float _2009 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2011 = -_2001;
    float _2013 = fma(_2011, _1793, 1.0);
    float _2015 = _1971 * _1925;
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2007);
    float _2019 = _1971 * _1933;
    float _2021 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2017);
    float _2025 = _1971 * _1941;
    float _2027 = floor(_1957);
    float _2029 = -_1901;
    float _2031 = _1887 + _2029;
    float _2033 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2035 = -_2021;
    float _2037 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2035);
    float _2039 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2041 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2033);
    float _2043 = -_2019;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2037);
    float _2047 = log2(_2013);
    float _2049 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2051 = _2025 + 1.0;
    float _2053 = fma(_2045, -0.5, 0.5);
    float _2055 = fma(_2045, 0.5, 0.5);
    float _2057 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2049);
    float _2059 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2041);
    float _2061 = exp2(_2039);
    float _2063 = -_2027;
    float _2065 = _1957 + _2063;
    float _2067 = fma(_2055, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2071 = fma(_2055, _2067, -0.212114393711090087890625);
    float _2073 = 1.0 / _2023;
    float _2075 = _2047 * 0.693147182464599609375;
    float _2077 = fma(_2055, _2071, 1.570728778839111328125);
    float _2079 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2081 = sqrt(_2053);
    float _2083 = -_2025;
    float _2085 = fma(_2061, _2051, _2083);
    float _2087 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2059);
    float _2089 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2069);
    float _2091 = fma(_2085, 0.5, 0.5);
    float _2093 = _2087 * _2073;
    float _2095 = _2089 * _2073;
    float _2097 = fma(_2093, 0.5, 0.5);
    float _2099 = fma(_2095, -0.5, 0.5);
    float _2101 = _2081 * 0.636619746685028076171875;
    float2 _6614 = float2(_2031, _2065);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6614, float2(0.0), isnan(_6614)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6614, float2(0.0), isnan(_6614)), level(0.0)).x;
    float3 _6625 = float3(_2097, _2099, _2079);
    float _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6625, float3(0.0), isnan(_6625)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6625, float3(0.0), isnan(_6625)), level(0.0)).x;
    float _2107 = -_2077;
    float _2109 = fma(_2101, _2107, 1.0);
    float3 _6641 = float3(_2097, _2099, _2079);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6641, float3(0.0), isnan(_6641)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6641, float3(0.0), isnan(_6641)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float2 _6657 = float2(_2109, _2091);
    float3 _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6657, float2(0.0), isnan(_6657)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6657, float2(0.0), isnan(_6657)), level(0.0)).xyz;
    float _2126 = _2124.x;
    float _2128 = _2124.y;
    float _2130 = _2124.z;
    float _2132 = float(uint(_947));
    float _2134 = trunc(_1049);
    int _2136 = int(_2134);
    float _2138 = _1045 * _169;
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2142 = _2140 != 0;
    float _2144 = -_1009;
    float _2146 = _2144 + 1.0;
    bool _2148 = _779 > 0.5;
    out.m_78.x = _1329;
    out.m_78.y = _1325;
    out.m_78.z = _1291;
    bool _2150 = _159 > 0.5;
    float _2152 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = 1.0 / _2132;
    int _2156 = abs(_873);
    out.m_80.w = _1095;
    int _2158 = abs(_867);
    out.m_82.x = _1209;
    bool _2160 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2162 = isnan(_759);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = trunc(_2138);
    int _2174 = int(_2172);
    float _2176 = float(uint(_2136));
    float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2180 = _2178 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2182 = ~_947;
    int _2184 = _2182 + 1;
    float _2186 = -_2170;
    float _2188 = _2186 + 1.0;
    float _2190 = float(_2136);
    float _2192 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2194 = 1.0 / _2180;
    int _2196 = as_type<int>(_2154) + (-2);
    float _2198 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.x = _1647;
    out.m_84.y = _1645;
    out.m_84.z = _1649;
    int _2200 = ~_947;
    int _2202 = _2200 + 1;
    float _2204 = as_type<float>(_2196) * _2176;
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2208 = _2206 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2210 = exp2(_2152);
    float _2212 = trunc(_2204);
    float _2214 = precise::max(_2212, 0.0);
    uint _2217 = uint(_2214);
    float _2219 = 1.0 / _2208;
    int _2221 = ~_947;
    int _2223 = _2221 + 1;
    float _2225 = -_2210;
    float _2227 = _2225 + 1.0;
    float _2229 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2231 = _2184 * int(_2217);
    int _2233 = _2231 + _2136;
    float _2235 = float(uint(_2233));
    float _2237 = as_type<float>(_2196) * _2235;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2241 = _2239 != 0;
    float _2243 = trunc(_2237);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    bool _2249 = !_2241;
    float _2251 = _2249 ? 7.345489978790283203125 : 1.0;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2257 = _2251 * _159;
    bool _2259 = _2190 >= _1037;
    bool _2261 = isnan(_2190);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(_1037);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = floor(_2257);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2279 = _2277 != 0;
    int _2281 = int(_2217) + int(_2247);
    float _2283 = trunc(_2269);
    int _2285 = int(_2283);
    int _2287 = abs(_943);
    int _2289 = _2223 * _2281;
    int _2291 = _2289 + _2136;
    bool _2293 = !_2142;
    int _2295 = _2293 ? 0 : 1;
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2299 = _2297 != 0;
    float _2301 = -_2271;
    float _2303 = _2257 + _2301;
    bool _2305 = uint(_2291) >= uint(_947);
    float _2307 = 1.0 / _2255;
    int _2309 = abs(_2295);
    float _2311 = _2303 * _1037;
    bool _2313 = !_2305;
    int _2315 = _2313 ? 0 : (-1);
    bool _2317 = _947 == 0;
    int _2319 = ~_2281;
    int _2321 = _2319 + _2315;
    int _2323 = _2321 + 1;
    float _2325 = 1.0 / _2275;
    int _2327 = ~_2285;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    int _2333 = _947 * _2323;
    int _2335 = _2333 + _2136;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2337;
    bool _2341 = !_2317;
    int _2343 = _2341 ? _2335 : (-1);
    float _2345 = trunc(_2311);
    int _2347 = int(_2345);
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2353 = _2339 * _2307;
    bool _2355 = !_2279;
    int _2357 = _2355 ? 0 : 1;
    int _2359 = _2343 * _2331;
    int _2361 = _947 + (-1);
    float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2367 = abs(_2357);
    float _2369 = _2351 * _2325;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2373 = _2371 != 0;
    int _2375 = _2285 * _2361;
    int _2377 = _2375 + _2359;
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2381 = _759 + _2379;
    float _2383 = 1.0 / _2365;
    int _2385 = _2377 * _2156;
    float _2387 = fma(_2353, _2381, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2389 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2391 = isnan(_759);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2397 = _2393 || _2395;
    float _2399 = float(_2397);
    int _2401 = _2347 * _2367;
    int _2403 = _2401 + _2136;
    int _2405 = _2174 * _2158;
    int _2407 = _2405 + _2385;
    bool _2409 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2411 = isnan(_759);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    bool _2421 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2423 = isnan(_759);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    int _2433 = _2403 * _2287;
    int _2435 = _2433 + _2407;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2437;
    float _2441 = -_2419;
    float _2443 = _2441 + 1.0;
    bool _2445 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2447 = isnan(_759);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    float _2457 = -_2431;
    float _2459 = _2457 + 1.0;
    float _2461 = _2439 * _2383;
    float _2463 = _2399 * _2443;
    float _2465 = -_2399;
    float _2467 = _2465 + 1.0;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2473 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2475 = isnan(_759);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = _2431 * _2467;
    int _2487 = _2347 * _2309;
    int _2489 = _2487 + _2435;
    float _2491 = _2455 * _2459;
    float _2493 = -_2455;
    float _2495 = _2493 + 1.0;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2501 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2503 = isnan(_759);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2509 = _2505 || _2507;
    float _2511 = float(_2509);
    float _2513 = float(uint(_2489));
    float _2515 = _2483 * _2495;
    float _2517 = -_2483;
    float _2519 = _2517 + 1.0;
    float _2521 = 1.0 / _2499;
    float _2523 = as_type<float>(_2196) * _2513;
    float _2525 = _2511 * _2519;
    float _2527 = -_2511;
    float _2529 = _2527 + 1.0;
    bool _2531 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2533 = isnan(_759);
    bool _2535 = _2531 || _2533;
    bool _2537 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2539 = _2535 || _2537;
    float _2541 = float(_2539);
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2545 = _2543 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2547 = trunc(_2523);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = _2170 * _2529;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2555;
    float _2559 = _2541 * _2188;
    float _2561 = -_2541;
    float _2563 = _2561 + 1.0;
    float _2565 = _2471 * _2521;
    float _2567 = _2557 * _2194;
    float _2569 = _2387 * _2559;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2573 = _2571 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2575 = 1.0 / _2545;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2579 = _759 + _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2581;
    int _2585 = _2202 * int(_2551);
    int _2587 = _2585 + _2489;
    float _2589 = fma(_2369, _2579, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2591 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2569);
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2595 = _759 + _2593;
    float _2597 = float(uint(_2587));
    float _2599 = fma(_2589, _2553, _2591);
    float _2601 = fma(_2461, _2595, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2605 = _759 + _2603;
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2609 = _759 + _2607;
    float _2611 = as_type<float>(_2196) * _2597;
    float _2613 = float(uint(_2403));
    float _2615 = _2573 * _2575;
    float _2617 = _2583 * _2219;
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _759 + _2619;
    float _2623 = fma(_2601, _2525, _2599);
    float _2625 = trunc(_2611);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    float _2631 = as_type<float>(_2196) * _2613;
    float _2633 = fma(_2565, _2621, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2637 = _759 + _2635;
    float _2639 = fma(_2615, _2605, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2641 = fma(_2567, _2609, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2643 = fma(_2633, _2515, _2623);
    float _2645 = fma(_2617, _2637, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2647 = trunc(_2631);
    float _2649 = precise::max(_2647, 0.0);
    uint _2651 = uint(_2649);
    int _2653 = ~_947;
    int _2655 = _2653 + 1;
    float _2657 = fma(_2641, _2491, _2643);
    int _2659 = ~_947;
    int _2661 = _2659 + 1;
    float _2663 = -_231;
    int _2665 = _2150 ? as_type<int>(_2663) : as_type<int>(_231);
    float _2667 = fma(_2639, _2485, _2657);
    float _2669 = -_1051;
    float _2671 = _2669 + 1.0;
    int _2673 = int(_2551) + int(_2629);
    bool _2675 = !_2299;
    float _2677 = _2675 ? _231 : as_type<float>(_2665);
    float _2679 = fma(_2645, _2463, _2667);
    float _2681 = -_239;
    int _2683 = _2148 ? as_type<int>(_2681) : as_type<int>(_239);
    int _2685 = _2655 * _2673;
    int _2687 = _2685 + _2489;
    float _2689 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2679);
    int _2691 = _2661 * int(_2651);
    int _2693 = _2691 + _2403;
    bool _2695 = !_2373;
    float _2697 = _2695 ? _239 : as_type<float>(_2683);
    float _2699 = _2677 + 0.5;
    bool _2701 = uint(_2687) >= uint(_947);
    float _2703 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2705 = float(uint(_2693));
    float _2707 = _2697 + (-0.5);
    bool _2709 = !_2701;
    int _2711 = _2709 ? 0 : (-1);
    float _2713 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[80].x, _895);
    int _2715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2717 = _2715 != 0;
    float _2719 = as_type<float>(_2196) * _2705;
    int _2721 = ~_2673;
    int _2723 = _2721 + _2711;
    int _2725 = _2723 + 1;
    float _2727 = -_2707;
    float _2729 = -_927;
    float _2731 = fma(_2727, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2729);
    float _2733 = -_2671;
    float _2735 = fma(_2677, _2733, _2713);
    float _2737 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2739 = abs(_1657);
    float _2741 = log2(_2739);
    int _2743 = _947 * _2725;
    int _2745 = _2743 + _2489;
    float _2747 = fma(_2697, _2146, _2731);
    float _2749 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2751 = ~_947;
    int _2753 = _2751 + 1;
    out.m_86.x = _2689;
    bool _2755 = !_2317;
    int _2757 = _2755 ? _2745 : (-1);
    float _2759 = trunc(_2719);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    out.m_88.x = _2735;
    out.m_88.y = _2747;
    int _2765 = _2757 >> 31;
    int _2767 = _2757 & 3;
    bool _2769 = _2767 != 0;
    int _2771 = _2765 & 3;
    float _2773 = -_1235;
    float _2775 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2749);
    float _2777 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2779 = _1657 <= 8000.0;
    bool _2781 = isnan(_1657);
    bool _2783 = _2779 || _2781;
    bool _2785 = isnan(8000.0);
    bool _2787 = _2783 || _2785;
    float _2789 = float(_2787);
    int _2791 = _2757 + _2771;
    float _2793 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2775);
    float _2795 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = -_1235;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2737);
    int _2801 = _2791 >> 2;
    float _2803 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2805 = int(_2651) + int(_2763);
    float _2807 = -_1235;
    float _2809 = fma(_2807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    int _2811 = _2801 << 4;
    int _2813 = _2811 + 368;
    float _2815 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2799);
    float _2817 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2819 = _2753 * _2805;
    int _2821 = _2819 + _2403;
    uint _2823 = uint(int(uint(_2813) >> uint(2)));
    uint _2825 = uint(int(uint(int(_2823)) >> uint(2)));
    int _2827 = int(_2823) & 3;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[int(_2825)][_2827];
    int _2831 = int(_2823) + 1;
    uint _2833 = uint(int(uint(_2831) >> uint(2)));
    int _2835 = _2831 & 3;
    float _2837 = (*spvDescriptorSet0.vp_c9)._m0[int(_2833)][_2835];
    float _2839 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2192);
    float _2841 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2809);
    float _2843 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2817);
    bool _2845 = uint(_2821) >= uint(_947);
    float _2847 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2849 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2198);
    int _2851 = _2757 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2857 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2847);
    float _2859 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2839);
    bool _2861 = uint(_2851) > 1u;
    int _2863 = _2813 + 8;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    uint _2867 = uint(int(uint(int(_2865)) >> uint(2)));
    int _2869 = int(_2865) & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = int(_2865) + 1;
    uint _2875 = uint(int(uint(_2873) >> uint(2)));
    int _2877 = _2873 & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    float _2881 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2855);
    float _2883 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2803);
    float _2885 = _2703 * _2815;
    int _2887 = _2769 ? 0 : 1;
    float _2889 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2843);
    float _2891 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2849);
    bool _2893 = !_2845;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = exp2(_2777);
    int _2899 = ~_2887;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = _2703 * _2793;
    bool _2907 = uint(_2851) >= 2u;
    float _2909 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2911 = _2903;
    float _2913 = _2089;
    if (!_2861)
    {
        int _2915 = ~_2887;
        int _2917 = _2915 + 1;
        _2911 = _2917;
    }
    int _2919 = _2911;
    float _2921 = -_2103;
    float _2923 = _2921 + 1.0;
    bool _2925 = _2851 != 3;
    float _2927 = fma(_2909, _2859, _2885);
    int _2929 = ~_2805;
    int _2931 = _2929 + _2895;
    int _2933 = _2931 + 1;
    float _2935 = _2703 * _2841;
    bool _2937 = !_2853;
    int _2939 = _2937 ? 0 : 1;
    float _2941 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2857);
    int _2943 = _2907 ? 0 : 1;
    int _2945 = _947 * _2933;
    int _2947 = _2945 + _2403;
    int _2949 = abs(_2919);
    float _2951 = fma(_2909, _2889, _2905);
    int _2953 = abs(_2939);
    float _2955 = fma(_2909, _2891, _2935);
    int _2957 = ~_2943;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    float _2963 = _2087 + _2023;
    bool _2965 = _2851 != 3;
    float _2967 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2881);
    int _2969 = _2961;
    float _2971 = _2114;
    if (_2925)
    {
        int _2973 = ~_2943;
        int _2975 = _2973 + 1;
        _2969 = _2975;
    }
    int _2977 = _2969;
    float _2979 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2883);
    int _2981 = ~_2949;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = _2963 * 0.5;
    bool _2989 = !_2965;
    int _2991 = _2989 ? 0 : (-1);
    int _2993 = _2985 * as_type<int>(_2837);
    int _2995 = abs(_2977);
    int _2997 = ~_2953;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3005 = precise::clamp(_3003, 0.0, 1.0);
    bool _3007 = !_2717;
    int _3009 = _3007 ? 0 : 1;
    int _3011 = abs(_2991);
    int _3013 = _3001 * as_type<int>(_2829);
    int _3015 = _3013 + _2993;
    int _3017 = abs(_3009);
    float _3019 = fma(_3005, -2.0, 3.0);
    float _3021 = _3005 * _3005;
    int _3023 = ~_2995;
    int _3025 = _3023 + 1;
    int _3027 = _3025 + 1;
    float _3029 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3031 = ~_3011;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    float _3037 = _3021 * _3019;
    int _3039 = _3027 * as_type<int>(_2871);
    int _3041 = _3039 + _3015;
    float _3043 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3029);
    float _3045 = in.m_90.x;
    int _3047 = ~_3017;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = _3035 * as_type<int>(_2879);
    int _3055 = _3053 + _3041;
    float _3057 = -_3037;
    float _3059 = _3057 + 1.0;
    float _3061 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3043);
    bool _3063 = !_2317;
    int _3065 = _3063 ? _2947 : (-1);
    int _3067 = _3055 * _3051;
    float _3069 = fma(_3059, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3037);
    float _3071 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3061);
    int _3073 = _3065 * _3017;
    int _3075 = _3073 + _3067;
    float _3077 = _2789 * _3069;
    float _3079 = _3071 + _2023;
    out.gl_Position.x = _2087;
    out.gl_Position.y = _2089;
    out.gl_Position.z = _3071;
    out.gl_Position.w = _2023;
    float _3081 = _2967 + _2951;
    float _3083 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3085 = float(_3075);
    float _3087 = _2023 * 0.5;
    float _3089 = _2923 * _3083;
    float _3091 = precise::clamp(_3089, 0.0, 1.0);
    float _3093 = _3079 * 0.5;
    float _3095 = fma(_2089, -0.5, _3087);
    float _3097 = _2941 + _2927;
    float _3099 = -_3091;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3103 = _2979 + _2955;
    bool _3105 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3107 = isnan(_1799);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3113 = _3109 || _3111;
    out.m_92.x = _2987;
    out.m_92.y = _3095;
    out.m_92.z = _3093;
    out.m_92.w = _2023;
    float _3115 = _2229 * _2105;
    float _3117 = _3101 * _3045;
    float _3119 = -_2229;
    float _3121 = _3119 + 1.0;
    out.m_94.x = _3097;
    out.m_94.y = _3081;
    out.m_94.z = _3103;
    float _3123 = _2120 * _3115;
    float _3125 = _2130 * _3115;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3129 = _2120 * _3121;
    float _3131 = fma(_2126, _3123, _2114);
    float _3133 = fma(_2128, _3123, _2116);
    float _3135 = fma(_2120, _3125, _2118);
    out.m_96.x = _3127;
    float _3137 = _1713 * _1775;
    float _3139 = _3071;
    float _3141 = _3115;
    float _3143 = _3137;
    float _3145 = _3085;
    if (!_3113)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3147 = _2913;
    out.m_98.x = _3131;
    out.m_98.y = _3133;
    out.m_98.z = _3135;
    out.m_98.w = _3129;
    float _3149 = _3137 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3151 = _3147;
    float _3153 = _3147;
    if (!_3113)
    {
        _2971 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3155 = _2971;
    out.m_100.x = _3085;
    float _3157 = _3155;
    float _3159 = _3155;
    if (!_3113)
    {
        _3139 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3161 = _3139;
    float _3163 = _3161;
    float _3165 = _3161;
    if (!_3113)
    {
        _3141 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3167 = _3141;
    float _3169 = _3167;
    float _3171 = _3167;
    if (!_3113)
    {
        _3143 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3173 = _3143;
    float _3175 = _3173;
    float _3177 = _3173;
    if (!_3113)
    {
        _3145 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3179 = _3145;
    bool _3181 = !_3113;
    float _3183 = _3179;
    float _3185 = _3179;
    if (!_3181)
    {
        bool _3187 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3189 = isnan(_1799);
        bool _3191 = _3187 || _3189;
        bool _3193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3195 = _3191 || _3193;
        if (!_3195)
        {
            float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3199 = _1799 + _3197;
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3203 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3201;
            float _3205 = 1.0 / _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3227 = _3199 * _3205;
            float _3229 = precise::clamp(_3227, 0.0, 1.0);
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3235 = fma(_3229, _3209, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3237 = fma(_3229, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3239 = fma(_3229, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3241 = fma(_3229, _3217, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3243 = fma(_3229, _3221, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3245 = fma(_3229, _3225, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3159 = _3235;
            _3185 = _3243;
            _3153 = _3237;
            _3171 = _3241;
            _3165 = _3239;
            _3177 = _3245;
            _3247 = true;
        }
        else
        {
            bool _3249 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3251 = isnan(_1799);
            bool _3253 = _3249 || _3251;
            bool _3255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3257 = _3253 || _3255;
            if (!_3257)
            {
                _3151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3259 = _3151;
            _3153 = _3259;
            if (!_3257)
            {
                _3157 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3261 = _3157;
            _3159 = _3261;
            if (!_3257)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3263 = _3163;
            _3165 = _3263;
            if (!_3257)
            {
                _3169 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3265 = _3169;
            _3171 = _3265;
            if (!_3257)
            {
                _3183 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3267 = _3183;
            _3185 = _3267;
            if (!_3257)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3269 = _3175;
            bool _3271 = !_3257;
            _3177 = _3269;
            if (!_3271)
            {
                bool _3273 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3275 = isnan(_1799);
                bool _3277 = _3273 || _3275;
                bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3281 = _3277 || _3279;
                if (!_3281)
                {
                    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3285 = _1799 + _3283;
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3289 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3287;
                    float _3291 = 1.0 / _3289;
                    float _3293 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3313 = _3285 * _3291;
                    float _3315 = precise::clamp(_3313, 0.0, 1.0);
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3321 = fma(_3315, _3295, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3323 = fma(_3315, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3325 = fma(_3315, _3299, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3327 = fma(_3315, _3303, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3329 = fma(_3315, _3307, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3331 = fma(_3315, _3311, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3159 = _3321;
                    _3185 = _3329;
                    _3153 = _3323;
                    _3171 = _3327;
                    _3165 = _3325;
                    _3177 = _3331;
                    _3247 = true;
                }
                else
                {
                    _3159 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3185 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3171 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3247 = false;
    float _3333 = _3159;
    float _3335 = _3185;
    float _3337 = _3153;
    float _3339 = _3171;
    float _3341 = _3165;
    float _3343 = _3177;
    float _3345 = fma(_3081, -0.5, 0.5);
    float _3347 = precise::clamp(_3345, 0.0, 1.0);
    float _3349 = -_3333;
    float _3351 = _3349 + _3335;
    float _3353 = _3149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3355 = -_3337;
    float _3357 = _3355 + _3339;
    out.m_102.x = 0.0;
    float _3359 = fma(_3347, _3351, _3333);
    float _3361 = fma(_3347, _3357, _3337);
    out.m_53.x = _3353;
    float _3363 = -_3341;
    float _3365 = _3363 + _3343;
    float _3367 = _3359 * 0.586610972881317138671875;
    bool _3369 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3371 = fma(_3347, _3365, _3341);
    float _3373 = fma(_3361, 0.298911988735198974609375, _3367);
    bool _3375 = _1713 > 0.0;
    bool _3377 = isnan(_1713);
    bool _3379 = _3375 || _3377;
    bool _3381 = isnan(0.0);
    bool _3383 = _3379 || _3381;
    float _3385 = fma(_3371, 0.114477999508380889892578125, _3373);
    bool _3387 = _1775 <= 0.0;
    bool _3389 = !_3383;
    bool _3391 = _3387 || _3389;
    float _3393 = -_3385;
    float _3395 = _3361 + _3393;
    float _3397 = -_3385;
    float _3399 = _3359 + _3397;
    float _3401 = -_3385;
    float _3403 = _3371 + _3401;
    float _3405 = fma(_3395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    float _3407 = fma(_3399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    float _3409 = fma(_3403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    bool _3411 = !_3369;
    if (!_3411)
    {
        float _3413 = -_1645;
        float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3417 = -_1647;
        float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3421 = -_1649;
        float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3425 = _3415 * _3415;
        float _3427 = fma(_3419, _3419, _3425);
        float _3429 = fma(_3423, _3423, _3427);
        float _3431 = sqrt(_3429);
        float _3433 = rsqrt(_3429);
        float _3435 = -_3431;
        float _3437 = _3435 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3439 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3441 = precise::clamp(_3439, 0.0, 1.0);
        float _3443 = _3419 * _3433;
        float _3445 = _3415 * _3433;
        float _3447 = abs(_3441);
        float _3449 = log2(_3447);
        float _3451 = _3423 * _3433;
        float _3453 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3455 = _3081 * _3445;
        float _3457 = -_3445;
        float _3459 = -_3453;
        float _3461 = fma(_3457, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3459);
        float _3463 = fma(_3097, _3443, _3455);
        float _3465 = -_3451;
        float _3467 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3461);
        float _3469 = fma(_3103, _3451, _3463);
        float _3471 = precise::clamp(_3469, 0.0, 1.0);
        float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3475 = _3467 + _3473;
        float _3477 = _3449 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3479 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3481 = precise::clamp(_3479, 0.0, 1.0);
        float _3483 = exp2(_3477);
        float _3485 = _3483 * _3481;
        float _3487 = _3471 * _3485;
        float _3489 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3491 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3493 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3489;
        out.m_102.y = _3491;
        out.m_102.z = _3493;
    }
    out.m_80.x = _3405;
    out.m_80.y = _3407;
    out.m_80.z = _3409;
    if (!_3391)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3495 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3495;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3247 = false;
    bool _641 = false;
    bool _469 = false;
    bool _363 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = as_type<float>(_123);
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3564 = as_type<float>(_145);
        out.gl_Position.z = _3564;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = in.m_55.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _147 = as_type<int>(_173);
    }
    int _175 = _147;
    float _177 = _127 * _169;
    out.m_57.x = _159;
    float _179 = _177;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3629 = as_type<float>(_175);
        out.gl_Position.z = _3629;
    }
    out.m_51.x = _177;
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    float _201 = in.m_68.x;
    float _203 = in.m_68.y;
    float _205 = in.m_68.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = _185 * _191;
    float _219 = _185 * _197;
    float _221 = fma(_183, _189, _217);
    float _223 = _185 * _203;
    float _225 = fma(_183, _195, _219);
    float _227 = fma(_187, _193, _221);
    bool _229 = !_209;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_183, _201, _223);
    float _235 = fma(_187, _199, _225);
    bool _237 = !_213;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = fma(_187, _205, _233);
    bool _243 = !_215;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _177;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = in.m_70.x;
    float _271 = in.m_70.y;
    bool _273 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_263);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_283;
    float _303 = _301 + 1.0;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _305;
    float _309 = 1.0 / _287;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = _299 * _303;
    float _315 = -_299;
    float _317 = _315 + 1.0;
    float _319 = _267 * _309;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = fma(_307, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = _325 * _313;
    float _331 = _327 * _313;
    float _333 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _335 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _337 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].x, _333);
    float _339 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].y, _335);
    float _341 = _337 * _269;
    float _343 = _339 * _271;
    bool _345 = !_311;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        _361 = _177;
    }
    _363 = false;
    float _365 = _361;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _365 + _367;
    bool _371 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _373 = isnan(_365);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _383;
    bool _387 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _389 = isnan(_365);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_381;
    float _401 = _399 + 1.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _403;
    float _407 = 1.0 / _385;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = _397 * _401;
    float _413 = -_397;
    float _415 = _413 + 1.0;
    float _417 = _369 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _419;
    float _423 = fma(_405, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _425;
    float _429 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = _423 * _411;
    float _433 = fma(_427, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _429 * _411;
    float _437 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _431);
    float _439 = _433 * _411;
    float _441 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _435);
    float _443 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].x, _437);
    float _445 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].z, _441);
    float _449 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[108].y, _445);
    bool _451 = !_409;
    float _467;
    if (!_451)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _455 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _459 = _457 * _453;
        float _461 = floor(_459);
        float _463 = -_461;
        float _465 = _459 + _463;
        _467 = _465;
        _469 = true;
    }
    else
    {
        _467 = _177;
    }
    _469 = false;
    float _471 = _467;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _471 + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _483 = isnan(_471);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _501 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _503 = isnan(_471);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = 1.0 / _479;
    float _515 = -_491;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    bool _523 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _525 = isnan(_471);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = _511 * _517;
    float _537 = -_511;
    float _539 = _537 + 1.0;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _543 = 1.0 / _495;
    float _545 = _533 * _539;
    float _547 = -_533;
    float _549 = _547 + 1.0;
    float _551 = 1.0 / _499;
    float _553 = _521 * _513;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _559 = fma(_553, _475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _561 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = isnan(_471);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _557 * _543;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _581 = _471 + _579;
    float _583 = _559 * _545;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _587 = _471 + _585;
    float _589 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _591 = fma(_573, _581, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _593 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[115].x, _583);
    float _595 = _577 * _551;
    float _597 = -_571;
    float _599 = _597 + 1.0;
    float _601 = fma(_591, _535, _593);
    float _603 = fma(_595, _587, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _605 = _491 * _599;
    float _607 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = fma(_603, _605, _601);
    float _611 = _443 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[118].x, _609);
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _617 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _619;
    out.m_72.y = _613;
    out.m_72.z = _615;
    out.m_72.w = _621;
    bool _623 = !_541;
    float _639;
    if (!_623)
    {
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _627 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        _639 = _177;
    }
    _641 = false;
    float _643 = _639;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _647 = _643 + _645;
    bool _649 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _651 = isnan(_643);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _661;
    bool _665 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _667 = isnan(_643);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_659;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _681;
    float _685 = 1.0 / _663;
    float _687 = _675 * _679;
    float _689 = -_675;
    float _691 = _689 + 1.0;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _697 = _647 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _699;
    float _703 = fma(_683, _697, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = fma(_701, _697, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _711 = _703 * _687;
    float _713 = fma(_707, _697, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _715 = _709 * _687;
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].x, _711);
    float _719 = _713 * _687;
    float _721 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].z, _715);
    float _723 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].x, _717);
    float _725 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[123].y, _719);
    float _727 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].z, _721);
    float _729 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _731 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[124].y, _725);
    float _733 = _727 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _739 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _735;
    out.m_74.y = _741;
    out.m_74.z = _739;
    out.m_74.w = _695;
    bool _743 = !_693;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _747 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _179 = _757;
    }
    float _759 = _179;
    float _761 = in.m_46.x;
    float _763 = in.m_46.y;
    float _765 = in.m_46.z;
    float _767 = _159 * 2.0;
    float _769 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _771 = log2(_769);
    float _773 = in.m_55.z;
    float _775 = _341 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _777 = _343 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = in.m_55.y;
    float _781 = floor(_767);
    float _783 = in.m_64.w;
    float _785 = in.m_68.w;
    float _787 = _771 * _127;
    float _789 = _191 * _763;
    float _791 = _197 * _763;
    float _793 = _203 * _763;
    float _795 = fma(_189, _761, _789);
    float _797 = fma(_195, _761, _791);
    float _799 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _801 = _781 > 0.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _805 = _781 >= 0.0;
    bool _807 = isnan(_781);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _817 = in.m_66.w;
    float _819 = -_803;
    float _821 = fma(_799, 2.0, _819);
    float _823 = fma(_193, _765, _795);
    float _825 = _773 * 2.0;
    float _827 = _779 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _829 = exp2(_787);
    float _831 = fma(_201, _761, _793);
    float _833 = fma(_199, _765, _797);
    float _835 = fma(_827, -2.0, _815);
    float _837 = _779 * 2.0;
    float _839 = fma(_205, _765, _831);
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _851 = _849 != 0;
    float _853 = _779 + _773;
    float _855 = floor(_825);
    int _857 = _813 ? 0 : 1;
    float _859 = _159 + _779;
    float _861 = _853 + (-1.0);
    float _863 = _859 + (-1.0);
    bool _865 = !_843;
    int _867 = _865 ? 0 : 1;
    float _869 = floor(_837);
    bool _871 = !_847;
    int _873 = _871 ? 0 : 1;
    float _875 = -_829;
    float _877 = _875 + 1.0;
    float _879 = _833 + _817;
    float _881 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _883 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(0.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = -_127;
    float _895 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[76].x, _821);
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _899 = int(_897);
    bool _901 = _855 > 0.0;
    float _903 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _905 = _855 >= 0.0;
    bool _907 = isnan(_855);
    bool _909 = _905 || _907;
    bool _911 = isnan(0.0);
    bool _913 = _909 || _911;
    float _915 = _823 + _783;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _919 = _879 + _917;
    int _921 = _913 ? 0 : 1;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _925 = _869 > 0.0;
    float _927 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _835);
    bool _929 = _869 >= 0.0;
    bool _931 = isnan(_869);
    bool _933 = _929 || _931;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    float _939 = _839 + _785;
    bool _941 = !_851;
    int _943 = _941 ? 0 : 1;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _947 = int(_945);
    int _949 = ~_921;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _957 = _915 + _955;
    float _959 = _891 ? _877 : 0.0;
    float _961 = _919 * _919;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _973 = _971 != 0;
    float _975 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[78].w, _923);
    int _977 = _953;
    float _979 = _939;
    if (!_901)
    {
        int _981 = ~_921;
        int _983 = _981 + 1;
        _977 = _983;
    }
    int _985 = _977;
    float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _989 = _939 + _987;
    bool _991 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _993 = isnan(1.0);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _999 = _995 || _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1003 = 1.0 + _1001;
    float _1005 = float(_899);
    float _1007 = fma(_957, _957, _961);
    float _1009 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _975);
    float _1011 = 1.0 / _1005;
    bool _1013 = !_965;
    int _1015 = _1013 ? 0 : 1;
    float _1017 = fma(_989, _989, _1007);
    bool _1019 = !_969;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1025 = abs(_1015);
    int _1027 = abs(_1021);
    float _1029 = 1.0 / _1003;
    float _1031 = in.m_76.x;
    float _1033 = in.m_76.y;
    float _1035 = in.m_76.z;
    float _1037 = float(_947);
    float _1039 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1023);
    float _1041 = float(_1025);
    float _1043 = float(_985);
    float _1045 = _1037 * _127;
    float _1047 = sqrt(_1017);
    float _1049 = _1011 * _127;
    float _1051 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _1053 = _1041 * _1043;
    int _1055 = ~_857;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    int _1061 = _1059;
    if (!_801)
    {
        int _1063 = ~_857;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    if (_999)
    {
        float _1069 = _959 * _1029;
        _137 = _1069;
    }
    float _1071 = _137;
    float _1073 = rsqrt(_1017);
    float _1075 = _1053 * (-2.0);
    float _1077 = float(_1067);
    float _1079 = _775 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1081 = float(_1027);
    float _1083 = fma(_881, _1075, _881);
    float _1085 = _1047 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1087 = fma(_1075, _1031, _1031);
    int _1089 = _937 ? 0 : 1;
    float _1091 = _1081 * _1077;
    float _1093 = _159 + (-0.5);
    float _1095 = precise::min(_1079, _1085);
    float _1097 = _1091 * (-2.0);
    float _1099 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1087);
    bool _1101 = !_973;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = _1073 * _1095;
    float _1107 = fma(_903, _1097, _903);
    float _1109 = fma(_1097, _1033, _1033);
    float _1111 = fma(_1083, _1071, _1099);
    int _1113 = ~_1089;
    int _1115 = _1113 + 1;
    int _1117 = _1115 + 1;
    float _1119 = _919 * _1105;
    int _1121 = abs(_1103);
    float _1123 = _779 + (-0.5);
    int _1125 = _1117;
    if (!_925)
    {
        int _1127 = ~_1089;
        int _1129 = _1127 + 1;
        _1125 = _1129;
    }
    int _1131 = _1125;
    float _1133 = _1111 * 0.15915493667125701904296875;
    float _1135 = _957 * _1105;
    float _1137 = -_1119;
    float _1139 = _919 + _1137;
    float _1141 = float(_1131);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1109);
    float _1145 = float(_1121);
    float _1147 = -_1135;
    float _1149 = _957 + _1147;
    float _1151 = _1139 * _1139;
    float _1153 = fma(_1107, _1071, _1143);
    float _1155 = _159 + _773;
    float _1157 = _1145 * _1141;
    float _1159 = fma(_1149, _1149, _1151);
    float _1161 = _989 * _1105;
    float _1163 = _1155 + (-1.0);
    float _1165 = _1157 * (-2.0);
    float _1167 = _773 + (-0.5);
    float _1169 = -_1161;
    float _1171 = _989 + _1169;
    float _1173 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1175 = fma(_1165, _1035, _1035);
    float _1177 = _1153 * 0.15915493667125701904296875;
    float _1179 = fma(_1171, _1171, _1159);
    float _1181 = fma(_1173, _1165, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1175);
    float _1185 = _1133 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = fma(_1181, _1071, _1183);
    float _1191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _239);
    float _1193 = _1189 * 0.15915493667125701904296875;
    float _1195 = sqrt(_1179);
    float _1197 = _1177 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1177 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = _1073 * _1195;
    float _1207 = _777 * _1205;
    float _1209 = _775 * _1205;
    float _1211 = _1133 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1207 * _1191;
    float _1217 = _1187 * _1199;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1221 = _1219 * 0.5;
    float _1223 = _1193 * 6.283185482025146484375;
    float _1225 = cos(_1223);
    float _1227 = _1187 * _1203;
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _1231 = _1209 * _1229;
    float _1233 = _1193 * 6.283185482025146484375;
    float _1235 = sin(_1233);
    float _1237 = _1213 * _1199;
    float _1239 = _1213 * _1203;
    float _1241 = _1187 * _1225;
    float _1243 = _1213 * _1225;
    float _1245 = _1203 * _1225;
    float _1247 = _1199 * _1225;
    float _1249 = _1241 * _1215;
    float _1251 = _1243 * _1215;
    float _1253 = fma(_1235, _1227, _1237);
    float _1255 = -_1239;
    float _1257 = fma(_1235, _1217, _1255);
    float _1259 = -_1215;
    float _1261 = _1235 * _1259;
    float _1263 = -_1217;
    float _1265 = fma(_1235, _1239, _1263);
    float _1267 = fma(_1253, _1231, _1249);
    float _1269 = fma(_1235, _1237, _1227);
    float _1271 = fma(_1245, _1231, _1261);
    float _1273 = fma(_1265, _1231, _1251);
    float _1275 = fma(_1257, _1221, _1267);
    float _1277 = fma(_1247, _1221, _1271);
    float _1279 = fma(_1269, _1221, _1273);
    float _1281 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1285 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1281);
    float _1287 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1283);
    float _1289 = -_1161;
    float _1291 = _939 + _1289;
    float _1293 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1285);
    float _1295 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1287);
    float _1297 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1299 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1301 = _939 + _1297;
    float _1303 = _915 + _1299;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1303 + _1309;
    float _1313 = _1307 * _1307;
    float _1315 = fma(_1311, _1311, _1313);
    float _1317 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1319 = sqrt(_1315);
    float _1321 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1317);
    float _1323 = -_1119;
    float _1325 = _879 + _1323;
    float _1327 = -_1135;
    float _1329 = _915 + _1327;
    float _1331 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1321);
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1335 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1337 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1333);
    float _1339 = _879 + _1335;
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1337);
    bool _1343 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = _1335;
    float _1347 = _1331;
    float _1349 = _1303;
    float _1351 = _1311;
    if (!_1343)
    {
        _1345 = _1301;
    }
    float _1353 = _1345;
    float _1355 = _1353;
    if (!_1343)
    {
        _1347 = _1339;
    }
    float _1357 = _1347;
    bool _1359 = !_1343;
    float _1361 = _1357;
    if (!_1359)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1367 = _1319 + _1365;
        float _1369 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = _1367 * _1363;
        float _1373 = rsqrt(_1315);
        float _1375 = _1371 * 0.15915493667125701904296875;
        float _1377 = _1375 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 + (-1.0);
        float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = fma(_1383, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = fma(_1339, _1379, _1387);
        float _1393 = _1373 * _1389;
        float _1395 = fma(_1311, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1307, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1361 = _1391;
        _1349 = _1395;
        _1355 = _1397;
    }
    float _1399 = _1361;
    float _1401 = _1349;
    float _1403 = _1355;
    float _1405 = -_879;
    float _1407 = _1405 + _1399;
    float _1409 = -_915;
    float _1411 = _1409 + _1401;
    float _1413 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1415 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1417 = _1407 * _1407;
    float _1419 = -_939;
    float _1421 = _1419 + _1403;
    float _1423 = 1.0 / _1413;
    float _1425 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1415);
    float _1427 = fma(_1411, _1411, _1417);
    float _1429 = -_1135;
    float _1431 = _1429 + _1401;
    float _1433 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1425);
    float _1435 = fma(_1421, _1421, _1427);
    float _1437 = -_1161;
    float _1439 = _1437 + _1403;
    float _1441 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1443 = sqrt(_1435);
    bool _1445 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1447 = isnan(0.5);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1453 = _1449 || _1451;
    float _1455 = _1441 + _1413;
    float _1457 = -_1119;
    float _1459 = _1457 + _1399;
    bool _1461 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1463 = isnan(0.5);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1469 = _1465 || _1467;
    float _1471 = _1455 * _1423;
    float _1473 = _1471 * 0.5;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1477 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1475);
    bool _1479 = _1443 > 0.0;
    float _1481 = 1.0 / _1477;
    float _1483 = _1443;
    float _1485 = _1473;
    float _1487 = _1403;
    float _1489 = _1423;
    float _1491 = _1439;
    float _1493 = _1431;
    float _1495 = _1411;
    if (!_1479)
    {
        _1483 = _1431;
    }
    float _1497 = _1483;
    float _1499 = _1497;
    if (!_1479)
    {
        _1485 = _1459;
    }
    float _1501 = _1485;
    float _1503 = _1501;
    if (!_1479)
    {
        _979 = _1439;
    }
    float _1505 = _979;
    bool _1507 = !_1479;
    float _1509 = _1505;
    float _1511 = _1505;
    if (!_1507)
    {
        float _1513 = _235 * _235;
        float _1515 = fma(_227, _227, _1513);
        float _1517 = rsqrt(_1435);
        float _1519 = fma(_241, _241, _1515);
        float _1521 = sqrt(_1519);
        float _1523 = _1411 * _1517;
        float _1525 = _1407 * _1517;
        float _1527 = _1421 * _1517;
        bool _1529 = _1521 > 0.0;
        float _1531 = _1517;
        float _1533 = _1521;
        _1487 = _1523;
        _1489 = _1525;
        if (!_1529)
        {
            _1531 = _1431;
        }
        float _1535 = _1531;
        _1499 = _1535;
        if (!_1529)
        {
            _1533 = _1459;
        }
        float _1537 = _1533;
        _1503 = _1537;
        if (!_1529)
        {
            _1509 = _1439;
        }
        float _1539 = _1509;
        bool _1541 = !_1529;
        _1511 = _1539;
        if (!_1541)
        {
            float _1543 = rsqrt(_1519);
            float _1545 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1547 = _235 * _1543;
            float _1549 = _227 * _1543;
            float _1551 = _1525 * _1547;
            float _1553 = _241 * _1543;
            float _1555 = fma(_1523, _1549, _1551);
            float _1557 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1559 = fma(_1527, _1553, _1555);
            float _1561 = _1559 * _1557;
            float _1563 = fma(_227, _1561, _1431);
            float _1565 = fma(_235, _1561, _1459);
            float _1567 = fma(_241, _1561, _1439);
            _1499 = _1563;
            _1503 = _1565;
            _1511 = _1567;
        }
    }
    float _1569 = _1499;
    float _1571 = _1503;
    float _1573 = _1511;
    float _1575 = _1487;
    float _1577 = _1489;
    float _1579 = _1575;
    float _1581 = _1571;
    float _1583 = _1569;
    float _1585 = _1573;
    float _1587 = _1577;
    if (_1469)
    {
        _1491 = 1.0;
    }
    float _1589 = _1491;
    float _1591 = _1589;
    if (!_1453)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _1325 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _1329 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1595 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1607 = _1291 + _1605;
        float _1609 = fma(_1599, _1599, _1603);
        float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1613 = fma(_1607, _1607, _1609);
        float _1615 = sqrt(_1613);
        float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1619 = precise::min(_1615, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1621 = _1619 * _1611;
        float _1623 = -_1329;
        float _1625 = _1623 + _1569;
        float _1627 = _1617 * _1621;
        float _1629 = -_1325;
        float _1631 = _1629 + _1571;
        float _1633 = -_1291;
        float _1635 = _1633 + _1573;
        float _1637 = fma(_1625, _1627, _1329);
        float _1639 = fma(_1631, _1627, _1325);
        float _1641 = fma(_1635, _1627, _1291);
        _1579 = _1611;
        _1581 = _1639;
        _1583 = _1637;
        _1585 = _1641;
    }
    float _1643 = _1579;
    float _1645 = _1581;
    float _1647 = _1583;
    float _1649 = _1585;
    float _1651 = _1643;
    if (_1469)
    {
        _1587 = 1.0;
    }
    float _1653 = _1587;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1657 = _1481 * _1655;
    float _1659 = _1653;
    if (!_1469)
    {
        float _1661 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1661 * 0.15915493667125701904296875;
        float _1665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1667;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1665 * 0.15915493667125701904296875;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = 1.0 / _1673;
        float _1683 = _1675 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = _1675 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = 1.0 / _1669;
        float _1697 = 1.0 / _1693;
        float _1699 = _1691 * _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = fma(_1657, _1699, _1701);
        float _1705 = _1703 * _1695;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        _1651 = _1695;
        _1493 = _1663;
        _1591 = _1707;
    }
    float _1709 = _1651;
    float _1711 = _1493;
    float _1713 = _1591;
    float _1715 = _1711;
    float _1717 = _1709;
    if (!_1469)
    {
        float _1719 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1721 = _1719 * 0.15915493667125701904296875;
        float _1723 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1725 = _1721 * 6.283185482025146484375;
        float _1727 = cos(_1725);
        float _1729 = _1723 * 0.15915493667125701904296875;
        float _1731 = _1721 * 6.283185482025146484375;
        float _1733 = sin(_1731);
        float _1735 = 1.0 / _1727;
        float _1737 = _1729 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = _1733 * _1735;
        float _1743 = _1729 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = _1739 * _1741;
        float _1749 = 1.0 / _1747;
        float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1753 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1751;
        float _1755 = 1.0 / _1753;
        float _1757 = _1745 * _1749;
        float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1761 = fma(_1657, _1757, _1759);
        float _1763 = _1761 * _1755;
        float _1765 = precise::clamp(_1763, 0.0, 1.0);
        float _1767 = -_1765;
        float _1769 = _1767 + 1.0;
        _1715 = _1747;
        _1717 = _1735;
        _1659 = _1769;
    }
    float _1771 = _1715;
    float _1773 = _1717;
    float _1775 = _1659;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1645 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1783 = _1647 + _1781;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1787 = _1649 + _1785;
    float _1789 = _1779 * _1779;
    float _1791 = fma(_1783, _1783, _1789);
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1795 = fma(_1787, _1787, _1791);
    float _1797 = rsqrt(_1795);
    float _1799 = sqrt(_1795);
    float _1801 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1803 = _1783 * _1801;
    float _1805 = _1787 * _1801;
    float _1807 = _1803 * _1803;
    float _1809 = _1805 * _1805;
    float _1811 = _1807 + _1809;
    float _1813 = sqrt(_1811);
    bool _1815 = _1813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1819 = _1813 + _1817;
    float _1821 = _1787;
    float _1823 = _1811;
    float _1825 = _1819;
    float _1827 = _1771;
    float _1829 = _1801;
    float _1831 = _1789;
    if (_1815)
    {
        float _1833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1821 = _1833;
    }
    float _1835 = _1821;
    if (_1815)
    {
        float _1837 = rsqrt(_1811);
        _1823 = _1837;
    }
    float _1839 = _1823;
    float _1841 = _1839;
    if (_1815)
    {
        float _1843 = _1819 * _1835;
        _1825 = _1843;
    }
    float _1845 = _1825;
    if (_1815)
    {
        float _1847 = _1845 * 0.15915493667125701904296875;
        _1827 = _1847;
    }
    float _1849 = _1827;
    float _1851 = _1835;
    float _1853 = _1849;
    if (_1815)
    {
        float _1855 = _1849 * 6.283185482025146484375;
        float _1857 = sin(_1855);
        _1851 = _1857;
    }
    float _1859 = _1851;
    float _1861 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1863 = precise::max(0.0, _1861);
    float _1865 = _1773;
    if (_1815)
    {
        float _1867 = _1849 * 6.283185482025146484375;
        float _1869 = cos(_1867);
        _1865 = _1869;
    }
    float _1871 = _1865;
    float _1873 = -_1801;
    float _1875 = -_1863;
    float _1877 = fma(_1779, _1873, _1875);
    if (_1815)
    {
        float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1829 = _1879;
    }
    float _1881 = _1829;
    float _1883 = _1881;
    if (!_1815)
    {
        _1853 = _1809;
    }
    float _1885 = _1853;
    float _1887 = fma(_1329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1889 = _1859;
    float _1891 = _1885;
    if (_1815)
    {
        float _1893 = fma(_1859, _1881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1883 = _1893;
    }
    float _1895 = _1883;
    float _1897 = _1895;
    if (!_1815)
    {
        _1889 = _1803;
    }
    float _1899 = _1889;
    float _1901 = floor(_1887);
    float _1903 = _1899;
    if (_1815)
    {
        float _1905 = _1871 + (-1.0);
        _1831 = _1905;
    }
    float _1907 = _1831;
    float _1909 = _1907;
    if (_1815)
    {
        float _1911 = _1839 * _1895;
        _1351 = _1911;
    }
    float _1913 = _1351;
    if (!_1815)
    {
        _1897 = _1877;
    }
    float _1915 = _1897;
    float _1917 = _1915;
    if (_1815)
    {
        float _1919 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1495 = _1919;
    }
    float _1921 = _1495;
    if (_1815)
    {
        float _1923 = _1803 * _1913;
        _1903 = _1923;
    }
    float _1925 = _1903;
    if (!_1815)
    {
        _1909 = _1805;
    }
    float _1927 = _1909;
    float _1929 = _1927;
    if (_1815)
    {
        float _1931 = _1805 * _1913;
        _1929 = _1931;
    }
    float _1933 = _1929;
    if (!_1815)
    {
        _1841 = _1807;
    }
    float _1935 = _1841;
    float _1937 = _1935;
    if (_1815)
    {
        float _1939 = fma(_1877, _1871, _1921);
        _1917 = _1939;
    }
    float _1941 = _1917;
    if (_1815)
    {
        float _1943 = _1925 * _1925;
        _1937 = _1943;
    }
    float _1945 = _1937;
    if (_1815)
    {
        float _1947 = _1933 * _1933;
        _1891 = _1947;
    }
    float _1949 = _1891;
    float _1951 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1953 = fma(_1941, _1941, _1945);
    float _1955 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1957 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1959 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = _1953 + _1949;
    float _1963 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1951);
    float _1965 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1955);
    float _1967 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1969 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1963);
    float _1971 = rsqrt(_1961);
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1975 = fma(_1799, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1973);
    float _1977 = precise::clamp(_1975, 0.0, 1.0);
    float _1979 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1981 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1965);
    float _1983 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1967);
    float _1985 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1987 = -_1977;
    float _1989 = _1987 + 1.0;
    float _1991 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1979);
    float _1993 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1995 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1997 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1999 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1991);
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2003 = abs(_1989);
    float _2005 = log2(_2003);
    float _2007 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1997);
    float _2009 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2011 = -_2001;
    float _2013 = fma(_2011, _1793, 1.0);
    float _2015 = _1971 * _1925;
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2007);
    float _2019 = _1971 * _1933;
    float _2021 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2017);
    float _2025 = _1971 * _1941;
    float _2027 = floor(_1957);
    float _2029 = -_1901;
    float _2031 = _1887 + _2029;
    float _2033 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2035 = -_2021;
    float _2037 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2035);
    float _2039 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2041 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2033);
    float _2043 = -_2019;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2037);
    float _2047 = log2(_2013);
    float _2049 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2051 = _2025 + 1.0;
    float _2053 = fma(_2045, -0.5, 0.5);
    float _2055 = fma(_2045, 0.5, 0.5);
    float _2057 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2049);
    float _2059 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2041);
    float _2061 = exp2(_2039);
    float _2063 = -_2027;
    float _2065 = _1957 + _2063;
    float _2067 = fma(_2055, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2071 = fma(_2055, _2067, -0.212114393711090087890625);
    float _2073 = 1.0 / _2023;
    float _2075 = _2047 * 0.693147182464599609375;
    float _2077 = fma(_2055, _2071, 1.570728778839111328125);
    float _2079 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2081 = sqrt(_2053);
    float _2083 = -_2025;
    float _2085 = fma(_2061, _2051, _2083);
    float _2087 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2059);
    float _2089 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2069);
    float _2091 = fma(_2085, 0.5, 0.5);
    float _2093 = _2087 * _2073;
    float _2095 = _2089 * _2073;
    float _2097 = fma(_2093, 0.5, 0.5);
    float _2099 = fma(_2095, -0.5, 0.5);
    float _2101 = _2081 * 0.636619746685028076171875;
    float2 _6614 = float2(_2031, _2065);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6614, float2(0.0), isnan(_6614)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6614, float2(0.0), isnan(_6614)), level(0.0)).x;
    float3 _6625 = float3(_2097, _2099, _2079);
    float _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6625, float3(0.0), isnan(_6625)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6625, float3(0.0), isnan(_6625)), level(0.0)).x;
    float _2107 = -_2077;
    float _2109 = fma(_2101, _2107, 1.0);
    float3 _6641 = float3(_2097, _2099, _2079);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6641, float3(0.0), isnan(_6641)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6641, float3(0.0), isnan(_6641)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float2 _6657 = float2(_2109, _2091);
    float3 _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6657, float2(0.0), isnan(_6657)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6657, float2(0.0), isnan(_6657)), level(0.0)).xyz;
    float _2126 = _2124.x;
    float _2128 = _2124.y;
    float _2130 = _2124.z;
    float _2132 = float(uint(_947));
    float _2134 = trunc(_1049);
    int _2136 = int(_2134);
    float _2138 = _1045 * _169;
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2142 = _2140 != 0;
    float _2144 = -_1009;
    float _2146 = _2144 + 1.0;
    bool _2148 = _779 > 0.5;
    out.m_78.x = _1329;
    out.m_78.y = _1325;
    out.m_78.z = _1291;
    bool _2150 = _159 > 0.5;
    float _2152 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = 1.0 / _2132;
    int _2156 = abs(_873);
    out.m_80.w = _1095;
    int _2158 = abs(_867);
    out.m_82.x = _1209;
    bool _2160 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2162 = isnan(_759);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = trunc(_2138);
    int _2174 = int(_2172);
    float _2176 = float(uint(_2136));
    float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2180 = _2178 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2182 = ~_947;
    int _2184 = _2182 + 1;
    float _2186 = -_2170;
    float _2188 = _2186 + 1.0;
    float _2190 = float(_2136);
    float _2192 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2194 = 1.0 / _2180;
    int _2196 = as_type<int>(_2154) + (-2);
    float _2198 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.x = _1647;
    out.m_84.y = _1645;
    out.m_84.z = _1649;
    int _2200 = ~_947;
    int _2202 = _2200 + 1;
    float _2204 = as_type<float>(_2196) * _2176;
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2208 = _2206 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2210 = exp2(_2152);
    float _2212 = trunc(_2204);
    float _2214 = precise::max(_2212, 0.0);
    uint _2217 = uint(_2214);
    float _2219 = 1.0 / _2208;
    int _2221 = ~_947;
    int _2223 = _2221 + 1;
    float _2225 = -_2210;
    float _2227 = _2225 + 1.0;
    float _2229 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2231 = _2184 * int(_2217);
    int _2233 = _2231 + _2136;
    float _2235 = float(uint(_2233));
    float _2237 = as_type<float>(_2196) * _2235;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2241 = _2239 != 0;
    float _2243 = trunc(_2237);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    bool _2249 = !_2241;
    float _2251 = _2249 ? 7.345489978790283203125 : 1.0;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2257 = _2251 * _159;
    bool _2259 = _2190 >= _1037;
    bool _2261 = isnan(_2190);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(_1037);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = floor(_2257);
    float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2279 = _2277 != 0;
    int _2281 = int(_2217) + int(_2247);
    float _2283 = trunc(_2269);
    int _2285 = int(_2283);
    int _2287 = abs(_943);
    int _2289 = _2223 * _2281;
    int _2291 = _2289 + _2136;
    bool _2293 = !_2142;
    int _2295 = _2293 ? 0 : 1;
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2299 = _2297 != 0;
    float _2301 = -_2271;
    float _2303 = _2257 + _2301;
    bool _2305 = uint(_2291) >= uint(_947);
    float _2307 = 1.0 / _2255;
    int _2309 = abs(_2295);
    float _2311 = _2303 * _1037;
    bool _2313 = !_2305;
    int _2315 = _2313 ? 0 : (-1);
    bool _2317 = _947 == 0;
    int _2319 = ~_2281;
    int _2321 = _2319 + _2315;
    int _2323 = _2321 + 1;
    float _2325 = 1.0 / _2275;
    int _2327 = ~_2285;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    int _2333 = _947 * _2323;
    int _2335 = _2333 + _2136;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2337;
    bool _2341 = !_2317;
    int _2343 = _2341 ? _2335 : (-1);
    float _2345 = trunc(_2311);
    int _2347 = int(_2345);
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2351 = _2349 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2353 = _2339 * _2307;
    bool _2355 = !_2279;
    int _2357 = _2355 ? 0 : 1;
    int _2359 = _2343 * _2331;
    int _2361 = _947 + (-1);
    float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2367 = abs(_2357);
    float _2369 = _2351 * _2325;
    int _2371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2373 = _2371 != 0;
    int _2375 = _2285 * _2361;
    int _2377 = _2375 + _2359;
    float _2379 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2381 = _759 + _2379;
    float _2383 = 1.0 / _2365;
    int _2385 = _2377 * _2156;
    float _2387 = fma(_2353, _2381, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2389 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2391 = isnan(_759);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2397 = _2393 || _2395;
    float _2399 = float(_2397);
    int _2401 = _2347 * _2367;
    int _2403 = _2401 + _2136;
    int _2405 = _2174 * _2158;
    int _2407 = _2405 + _2385;
    bool _2409 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2411 = isnan(_759);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    bool _2421 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2423 = isnan(_759);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    int _2433 = _2403 * _2287;
    int _2435 = _2433 + _2407;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2437;
    float _2441 = -_2419;
    float _2443 = _2441 + 1.0;
    bool _2445 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2447 = isnan(_759);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    float _2457 = -_2431;
    float _2459 = _2457 + 1.0;
    float _2461 = _2439 * _2383;
    float _2463 = _2399 * _2443;
    float _2465 = -_2399;
    float _2467 = _2465 + 1.0;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2473 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2475 = isnan(_759);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = _2431 * _2467;
    int _2487 = _2347 * _2309;
    int _2489 = _2487 + _2435;
    float _2491 = _2455 * _2459;
    float _2493 = -_2455;
    float _2495 = _2493 + 1.0;
    float _2497 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2501 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2503 = isnan(_759);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2509 = _2505 || _2507;
    float _2511 = float(_2509);
    float _2513 = float(uint(_2489));
    float _2515 = _2483 * _2495;
    float _2517 = -_2483;
    float _2519 = _2517 + 1.0;
    float _2521 = 1.0 / _2499;
    float _2523 = as_type<float>(_2196) * _2513;
    float _2525 = _2511 * _2519;
    float _2527 = -_2511;
    float _2529 = _2527 + 1.0;
    bool _2531 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2533 = isnan(_759);
    bool _2535 = _2531 || _2533;
    bool _2537 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2539 = _2535 || _2537;
    float _2541 = float(_2539);
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2545 = _2543 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2547 = trunc(_2523);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = _2170 * _2529;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2555;
    float _2559 = _2541 * _2188;
    float _2561 = -_2541;
    float _2563 = _2561 + 1.0;
    float _2565 = _2471 * _2521;
    float _2567 = _2557 * _2194;
    float _2569 = _2387 * _2559;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2573 = _2571 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2575 = 1.0 / _2545;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2579 = _759 + _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2581;
    int _2585 = _2202 * int(_2551);
    int _2587 = _2585 + _2489;
    float _2589 = fma(_2369, _2579, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2591 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2569);
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2595 = _759 + _2593;
    float _2597 = float(uint(_2587));
    float _2599 = fma(_2589, _2553, _2591);
    float _2601 = fma(_2461, _2595, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2605 = _759 + _2603;
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2609 = _759 + _2607;
    float _2611 = as_type<float>(_2196) * _2597;
    float _2613 = float(uint(_2403));
    float _2615 = _2573 * _2575;
    float _2617 = _2583 * _2219;
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _759 + _2619;
    float _2623 = fma(_2601, _2525, _2599);
    float _2625 = trunc(_2611);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    float _2631 = as_type<float>(_2196) * _2613;
    float _2633 = fma(_2565, _2621, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2637 = _759 + _2635;
    float _2639 = fma(_2615, _2605, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2641 = fma(_2567, _2609, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2643 = fma(_2633, _2515, _2623);
    float _2645 = fma(_2617, _2637, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2647 = trunc(_2631);
    float _2649 = precise::max(_2647, 0.0);
    uint _2651 = uint(_2649);
    int _2653 = ~_947;
    int _2655 = _2653 + 1;
    float _2657 = fma(_2641, _2491, _2643);
    int _2659 = ~_947;
    int _2661 = _2659 + 1;
    float _2663 = -_231;
    int _2665 = _2150 ? as_type<int>(_2663) : as_type<int>(_231);
    float _2667 = fma(_2639, _2485, _2657);
    float _2669 = -_1051;
    float _2671 = _2669 + 1.0;
    int _2673 = int(_2551) + int(_2629);
    bool _2675 = !_2299;
    float _2677 = _2675 ? _231 : as_type<float>(_2665);
    float _2679 = fma(_2645, _2463, _2667);
    float _2681 = -_239;
    int _2683 = _2148 ? as_type<int>(_2681) : as_type<int>(_239);
    int _2685 = _2655 * _2673;
    int _2687 = _2685 + _2489;
    float _2689 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2679);
    int _2691 = _2661 * int(_2651);
    int _2693 = _2691 + _2403;
    bool _2695 = !_2373;
    float _2697 = _2695 ? _239 : as_type<float>(_2683);
    float _2699 = _2677 + 0.5;
    bool _2701 = uint(_2687) >= uint(_947);
    float _2703 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2705 = float(uint(_2693));
    float _2707 = _2697 + (-0.5);
    bool _2709 = !_2701;
    int _2711 = _2709 ? 0 : (-1);
    float _2713 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[80].x, _895);
    int _2715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2717 = _2715 != 0;
    float _2719 = as_type<float>(_2196) * _2705;
    int _2721 = ~_2673;
    int _2723 = _2721 + _2711;
    int _2725 = _2723 + 1;
    float _2727 = -_2707;
    float _2729 = -_927;
    float _2731 = fma(_2727, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2729);
    float _2733 = -_2671;
    float _2735 = fma(_2677, _2733, _2713);
    float _2737 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2739 = abs(_1657);
    float _2741 = log2(_2739);
    int _2743 = _947 * _2725;
    int _2745 = _2743 + _2489;
    float _2747 = fma(_2697, _2146, _2731);
    float _2749 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2751 = ~_947;
    int _2753 = _2751 + 1;
    out.m_86.x = _2689;
    bool _2755 = !_2317;
    int _2757 = _2755 ? _2745 : (-1);
    float _2759 = trunc(_2719);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    out.m_88.x = _2735;
    out.m_88.y = _2747;
    int _2765 = _2757 >> 31;
    int _2767 = _2757 & 3;
    bool _2769 = _2767 != 0;
    int _2771 = _2765 & 3;
    float _2773 = -_1235;
    float _2775 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2749);
    float _2777 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2779 = _1657 <= 8000.0;
    bool _2781 = isnan(_1657);
    bool _2783 = _2779 || _2781;
    bool _2785 = isnan(8000.0);
    bool _2787 = _2783 || _2785;
    float _2789 = float(_2787);
    int _2791 = _2757 + _2771;
    float _2793 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2775);
    float _2795 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = -_1235;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2737);
    int _2801 = _2791 >> 2;
    float _2803 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2805 = int(_2651) + int(_2763);
    float _2807 = -_1235;
    float _2809 = fma(_2807, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    int _2811 = _2801 << 4;
    int _2813 = _2811 + 368;
    float _2815 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2799);
    float _2817 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2819 = _2753 * _2805;
    int _2821 = _2819 + _2403;
    uint _2823 = uint(int(uint(_2813) >> uint(2)));
    uint _2825 = uint(int(uint(int(_2823)) >> uint(2)));
    int _2827 = int(_2823) & 3;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[int(_2825)][_2827];
    int _2831 = int(_2823) + 1;
    uint _2833 = uint(int(uint(_2831) >> uint(2)));
    int _2835 = _2831 & 3;
    float _2837 = (*spvDescriptorSet0.vp_c9)._m0[int(_2833)][_2835];
    float _2839 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2192);
    float _2841 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2809);
    float _2843 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2817);
    bool _2845 = uint(_2821) >= uint(_947);
    float _2847 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2849 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2198);
    int _2851 = _2757 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2857 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2847);
    float _2859 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2839);
    bool _2861 = uint(_2851) > 1u;
    int _2863 = _2813 + 8;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    uint _2867 = uint(int(uint(int(_2865)) >> uint(2)));
    int _2869 = int(_2865) & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = int(_2865) + 1;
    uint _2875 = uint(int(uint(_2873) >> uint(2)));
    int _2877 = _2873 & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    float _2881 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2855);
    float _2883 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2803);
    float _2885 = _2703 * _2815;
    int _2887 = _2769 ? 0 : 1;
    float _2889 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2843);
    float _2891 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2849);
    bool _2893 = !_2845;
    int _2895 = _2893 ? 0 : (-1);
    float _2897 = exp2(_2777);
    int _2899 = ~_2887;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = _2703 * _2793;
    bool _2907 = uint(_2851) >= 2u;
    float _2909 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2911 = _2903;
    float _2913 = _2089;
    if (!_2861)
    {
        int _2915 = ~_2887;
        int _2917 = _2915 + 1;
        _2911 = _2917;
    }
    int _2919 = _2911;
    float _2921 = -_2103;
    float _2923 = _2921 + 1.0;
    bool _2925 = _2851 != 3;
    float _2927 = fma(_2909, _2859, _2885);
    int _2929 = ~_2805;
    int _2931 = _2929 + _2895;
    int _2933 = _2931 + 1;
    float _2935 = _2703 * _2841;
    bool _2937 = !_2853;
    int _2939 = _2937 ? 0 : 1;
    float _2941 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2857);
    int _2943 = _2907 ? 0 : 1;
    int _2945 = _947 * _2933;
    int _2947 = _2945 + _2403;
    int _2949 = abs(_2919);
    float _2951 = fma(_2909, _2889, _2905);
    int _2953 = abs(_2939);
    float _2955 = fma(_2909, _2891, _2935);
    int _2957 = ~_2943;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    float _2963 = _2087 + _2023;
    bool _2965 = _2851 != 3;
    float _2967 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2881);
    int _2969 = _2961;
    float _2971 = _2114;
    if (_2925)
    {
        int _2973 = ~_2943;
        int _2975 = _2973 + 1;
        _2969 = _2975;
    }
    int _2977 = _2969;
    float _2979 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2883);
    int _2981 = ~_2949;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = _2963 * 0.5;
    bool _2989 = !_2965;
    int _2991 = _2989 ? 0 : (-1);
    int _2993 = _2985 * as_type<int>(_2837);
    int _2995 = abs(_2977);
    int _2997 = ~_2953;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3005 = precise::clamp(_3003, 0.0, 1.0);
    bool _3007 = !_2717;
    int _3009 = _3007 ? 0 : 1;
    int _3011 = abs(_2991);
    int _3013 = _3001 * as_type<int>(_2829);
    int _3015 = _3013 + _2993;
    int _3017 = abs(_3009);
    float _3019 = fma(_3005, -2.0, 3.0);
    float _3021 = _3005 * _3005;
    int _3023 = ~_2995;
    int _3025 = _3023 + 1;
    int _3027 = _3025 + 1;
    float _3029 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3031 = ~_3011;
    int _3033 = _3031 + 1;
    int _3035 = _3033 + 1;
    float _3037 = _3021 * _3019;
    int _3039 = _3027 * as_type<int>(_2871);
    int _3041 = _3039 + _3015;
    float _3043 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3029);
    float _3045 = in.m_90.x;
    int _3047 = ~_3017;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = _3035 * as_type<int>(_2879);
    int _3055 = _3053 + _3041;
    float _3057 = -_3037;
    float _3059 = _3057 + 1.0;
    float _3061 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3043);
    bool _3063 = !_2317;
    int _3065 = _3063 ? _2947 : (-1);
    int _3067 = _3055 * _3051;
    float _3069 = fma(_3059, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3037);
    float _3071 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3061);
    int _3073 = _3065 * _3017;
    int _3075 = _3073 + _3067;
    float _3077 = _2789 * _3069;
    float _3079 = _3071 + _2023;
    out.gl_Position.x = _2087;
    out.gl_Position.y = _2089;
    out.gl_Position.z = _3071;
    out.gl_Position.w = _2023;
    float _3081 = _2967 + _2951;
    float _3083 = _3077 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3085 = float(_3075);
    float _3087 = _2023 * 0.5;
    float _3089 = _2923 * _3083;
    float _3091 = precise::clamp(_3089, 0.0, 1.0);
    float _3093 = _3079 * 0.5;
    float _3095 = fma(_2089, -0.5, _3087);
    float _3097 = _2941 + _2927;
    float _3099 = -_3091;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3103 = _2979 + _2955;
    bool _3105 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3107 = isnan(_1799);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3113 = _3109 || _3111;
    out.m_92.x = _2987;
    out.m_92.y = _3095;
    out.m_92.z = _3093;
    out.m_92.w = _2023;
    float _3115 = _2229 * _2105;
    float _3117 = _3101 * _3045;
    float _3119 = -_2229;
    float _3121 = _3119 + 1.0;
    out.m_94.x = _3097;
    out.m_94.y = _3081;
    out.m_94.z = _3103;
    float _3123 = _2120 * _3115;
    float _3125 = _2130 * _3115;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3129 = _2120 * _3121;
    float _3131 = fma(_2126, _3123, _2114);
    float _3133 = fma(_2128, _3123, _2116);
    float _3135 = fma(_2120, _3125, _2118);
    out.m_96.x = _3127;
    float _3137 = _1713 * _1775;
    float _3139 = _3071;
    float _3141 = _3115;
    float _3143 = _3137;
    float _3145 = _3085;
    if (!_3113)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3147 = _2913;
    out.m_98.x = _3131;
    out.m_98.y = _3133;
    out.m_98.z = _3135;
    out.m_98.w = _3129;
    float _3149 = _3137 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3151 = _3147;
    float _3153 = _3147;
    if (!_3113)
    {
        _2971 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3155 = _2971;
    out.m_100.x = _3085;
    float _3157 = _3155;
    float _3159 = _3155;
    if (!_3113)
    {
        _3139 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3161 = _3139;
    float _3163 = _3161;
    float _3165 = _3161;
    if (!_3113)
    {
        _3141 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3167 = _3141;
    float _3169 = _3167;
    float _3171 = _3167;
    if (!_3113)
    {
        _3143 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3173 = _3143;
    float _3175 = _3173;
    float _3177 = _3173;
    if (!_3113)
    {
        _3145 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3179 = _3145;
    bool _3181 = !_3113;
    float _3183 = _3179;
    float _3185 = _3179;
    if (!_3181)
    {
        bool _3187 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3189 = isnan(_1799);
        bool _3191 = _3187 || _3189;
        bool _3193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3195 = _3191 || _3193;
        if (!_3195)
        {
            float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3199 = _1799 + _3197;
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3203 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3201;
            float _3205 = 1.0 / _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3227 = _3199 * _3205;
            float _3229 = precise::clamp(_3227, 0.0, 1.0);
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3235 = fma(_3229, _3209, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3237 = fma(_3229, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3239 = fma(_3229, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3241 = fma(_3229, _3217, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3243 = fma(_3229, _3221, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3245 = fma(_3229, _3225, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3159 = _3235;
            _3185 = _3243;
            _3153 = _3237;
            _3171 = _3241;
            _3165 = _3239;
            _3177 = _3245;
            _3247 = true;
        }
        else
        {
            bool _3249 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3251 = isnan(_1799);
            bool _3253 = _3249 || _3251;
            bool _3255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3257 = _3253 || _3255;
            if (!_3257)
            {
                _3151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3259 = _3151;
            _3153 = _3259;
            if (!_3257)
            {
                _3157 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3261 = _3157;
            _3159 = _3261;
            if (!_3257)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3263 = _3163;
            _3165 = _3263;
            if (!_3257)
            {
                _3169 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3265 = _3169;
            _3171 = _3265;
            if (!_3257)
            {
                _3183 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3267 = _3183;
            _3185 = _3267;
            if (!_3257)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3269 = _3175;
            bool _3271 = !_3257;
            _3177 = _3269;
            if (!_3271)
            {
                bool _3273 = _1799 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3275 = isnan(_1799);
                bool _3277 = _3273 || _3275;
                bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3281 = _3277 || _3279;
                if (!_3281)
                {
                    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3285 = _1799 + _3283;
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3289 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3287;
                    float _3291 = 1.0 / _3289;
                    float _3293 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3313 = _3285 * _3291;
                    float _3315 = precise::clamp(_3313, 0.0, 1.0);
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3321 = fma(_3315, _3295, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3323 = fma(_3315, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3325 = fma(_3315, _3299, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3327 = fma(_3315, _3303, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3329 = fma(_3315, _3307, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3331 = fma(_3315, _3311, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3159 = _3321;
                    _3185 = _3329;
                    _3153 = _3323;
                    _3171 = _3327;
                    _3165 = _3325;
                    _3177 = _3331;
                    _3247 = true;
                }
                else
                {
                    _3159 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3185 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3171 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3247 = false;
    float _3333 = _3159;
    float _3335 = _3185;
    float _3337 = _3153;
    float _3339 = _3171;
    float _3341 = _3165;
    float _3343 = _3177;
    float _3345 = fma(_3081, -0.5, 0.5);
    float _3347 = precise::clamp(_3345, 0.0, 1.0);
    float _3349 = -_3333;
    float _3351 = _3349 + _3335;
    float _3353 = _3149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3355 = -_3337;
    float _3357 = _3355 + _3339;
    out.m_102.x = 0.0;
    float _3359 = fma(_3347, _3351, _3333);
    float _3361 = fma(_3347, _3357, _3337);
    out.m_53.x = _3353;
    float _3363 = -_3341;
    float _3365 = _3363 + _3343;
    float _3367 = _3359 * 0.586610972881317138671875;
    bool _3369 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3371 = fma(_3347, _3365, _3341);
    float _3373 = fma(_3361, 0.298911988735198974609375, _3367);
    bool _3375 = _1713 > 0.0;
    bool _3377 = isnan(_1713);
    bool _3379 = _3375 || _3377;
    bool _3381 = isnan(0.0);
    bool _3383 = _3379 || _3381;
    float _3385 = fma(_3371, 0.114477999508380889892578125, _3373);
    bool _3387 = _1775 <= 0.0;
    bool _3389 = !_3383;
    bool _3391 = _3387 || _3389;
    float _3393 = -_3385;
    float _3395 = _3361 + _3393;
    float _3397 = -_3385;
    float _3399 = _3359 + _3397;
    float _3401 = -_3385;
    float _3403 = _3371 + _3401;
    float _3405 = fma(_3395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    float _3407 = fma(_3399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    float _3409 = fma(_3403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3385);
    bool _3411 = !_3369;
    if (!_3411)
    {
        float _3413 = -_1645;
        float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3417 = -_1647;
        float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3421 = -_1649;
        float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3425 = _3415 * _3415;
        float _3427 = fma(_3419, _3419, _3425);
        float _3429 = fma(_3423, _3423, _3427);
        float _3431 = sqrt(_3429);
        float _3433 = rsqrt(_3429);
        float _3435 = -_3431;
        float _3437 = _3435 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3439 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3441 = precise::clamp(_3439, 0.0, 1.0);
        float _3443 = _3419 * _3433;
        float _3445 = _3415 * _3433;
        float _3447 = abs(_3441);
        float _3449 = log2(_3447);
        float _3451 = _3423 * _3433;
        float _3453 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3455 = _3081 * _3445;
        float _3457 = -_3445;
        float _3459 = -_3453;
        float _3461 = fma(_3457, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3459);
        float _3463 = fma(_3097, _3443, _3455);
        float _3465 = -_3451;
        float _3467 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3461);
        float _3469 = fma(_3103, _3451, _3463);
        float _3471 = precise::clamp(_3469, 0.0, 1.0);
        float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3475 = _3467 + _3473;
        float _3477 = _3449 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3479 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3481 = precise::clamp(_3479, 0.0, 1.0);
        float _3483 = exp2(_3477);
        float _3485 = _3483 * _3481;
        float _3487 = _3471 * _3485;
        float _3489 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3491 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3493 = _3487 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3489;
        out.m_102.y = _3491;
        out.m_102.z = _3493;
    }
    out.m_80.x = _3405;
    out.m_80.y = _3407;
    out.m_80.z = _3409;
    if (!_3391)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3495 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3495;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

